import re
import pandas as pd
import numpy as np
import sklearn
import gensim
import nltk
from nltk.corpus import stopwords
from nltk.stem import WordNetLemmatizer
from keras.preprocessing.text import Tokenizer
from keras.preprocessing.sequence import pad_sequences
from keras.models import Sequential
from keras.layers import Dropout
from keras.layers.convolutional import Conv1D
from keras.layers.convolutional import MaxPooling1D
from keras.layers import Embedding,LSTM, Dense, SpatialDropout1D
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.metrics import classification_report, roc_curve, auc, confusion_matrix
from sklearn.model_selection import train_test_split
from sklearn.utils import class_weight
from gensim.models import KeyedVectors

from tensorflow.python.client import device_lib
device_lib.list_local_devices()

data_raw = pd.read_csv('data/isear.csv', error_bad_lines=False,sep="|")
data=pd.DataFrame({'content':data_raw['SIT'],'sentiment':data_raw['Field1']})

data['sentiment'].unique()
emotions_dict={'joy':0, 'fear':1, 'anger':2, 'sadness':3, 'disgust':4, 'shame':5, 'guilt':6}
emotions_dict_rev={0:'joy', 1:'fear', 2:'anger', 3:'sadness', 4: 'disgust', 5:'shame', 6:'guilt'}

data['sentiment_label']=[emotions_dict[sentiment] for sentiment in data['sentiment']]

emotions_class=['worry','sadness', 'neutral','happiness','surprise','love','hate','fun']
data = data[data['sentiment'].isin(emotions_class)]
#data.groupby('sentiment').count()

# % % time
word_counts = {}
word_to_index = {}
index_to_word = {}


def clean_text(text):
    text = re.sub('[^a-zA-z0-9\s]', '', text)
    stop_words_list = set(stopwords.words('english'))
    lemmatizer = WordNetLemmatizer()
    words = nltk.word_tokenize(text)
    # extra replace fro removing \\ characters
    words = [re.sub("\\\\", '', word.lower()) for word in words if
             word.lower() not in stop_words_list and word.isalpha()]  # filter(lambda word: word not in stop_words_list, text.split())
    words = [lemmatizer.lemmatize(word) for word in words]
    for word in words:
        if word not in word_to_index:
            word_to_index[word] = len(word_to_index)
            index_to_word[len(word_to_index)] = word
            word_counts[word] = 1
        else:
            word_counts[word] += 1

    text = " ".join(words)
    return text


def map_to_features(max_num_words, texts, maximum_length=500):
    """
    This function tokenize the text and keep only top max_num_words and then
    map the words to feature vector
    """
    tokenizer = Tokenizer(num_words=max_num_words, lower=True, split=' ')
    tokenizer.fit_on_texts(texts.values)
    feature_vector = tokenizer.texts_to_sequences(texts.values)
    feature_vector = pad_sequences(feature_vector, maxlen=maximum_length)
    return feature_vector


def fit_label_indexer(labels):
    """
    This method fits a label encoder on the string labels.
    """
    label_encoder = LabelEncoder()
    label_encoder.fit(labels)
    return label_encoder


def label_indexing(label_encoder, labels):
    """
    This function uses a trained label encoder to transform the string labels
    to numeric labels.
    """
    return label_encoder.transform(labels).reshape(-1, 1)


def fit_one_hot_encoder(labels):
    """
    This method fits a one hot encoder on the numeric lables
    labels.
    """
    one_hot_encoder = OneHotEncoder()
    one_hot_encoder.fit(labels)
    return one_hot_encoder


def one_hot_encode(one_hot_encoder, labels):
    """
    This function uses a trained one hot encoder to transform the
    numeric labels to binary labels
    """
    return one_hot_encoder.transform(labels).toarray()

# %%time
data['content']=data['content'].apply(clean_text)


# %%time
max_num_words=3500
feature_vector = map_to_features(max_num_words, data['content'])

#label_encoder = fit_label_indexer(data['sentiment'], )
#labels = label_indexing(label_encoder, data['sentiment'])
labels = np.array(data['sentiment']).reshape(-1,1)
one_hot_encoder = fit_one_hot_encoder(labels)
labels = one_hot_encode(one_hot_encoder, labels)


X_train, X_valid, Y_train, Y_valid = train_test_split(feature_vector,labels, test_size = 0.2, random_state = 42)

embed_dim = 128
lstm_size = 128
feature_vector_size = feature_vector.shape[1]
model = Sequential()
model.add(Embedding(max_num_words, embed_dim, input_length=feature_vector_size))
model.add(Conv1D(filters=64, kernel_size=3, padding='same', activation='relu'))
model.add(Dropout(0.5))
model.add(MaxPooling1D(pool_size=2))
model.add(SpatialDropout1D(0.5))
model.add(LSTM(lstm_size, dropout = 0.5, recurrent_dropout = 0.5))
model.add(Dropout(0.5))
model.add(Dense(7, activation='softmax'))
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
print(model.summary())

#model = Sequential()
#model.add(Embedding(max_num_words, embed_dim, input_length=feature_vector_size))
#model.add(SpatialDropout1D(0))
#model.add(LSTM(lstm_size, dropout = 0.1, recurrent_dropout = 0.1))
#model.add(Dense(2, activation='softmax'))
#model.compile(loss='categorical_crossentropy', optimizer='RMSProp', metrics=['accuracy'])


class_weights = class_weight.compute_class_weight('balanced', np.unique(Y_valid.reshape(-1)), Y_valid.reshape(-1))
model.fit(X_train, Y_train, validation_data=(X_valid, Y_valid), batch_size = 512, epochs = 20,
          verbose = 1, class_weight=None)

pred = np.argmax(model.predict(X_train),axis=1)
Y=np.argmax(Y_train,axis=1)

confusion_matrix(pred, Y)

emotions_dict