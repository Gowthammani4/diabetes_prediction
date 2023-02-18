# Importing essential libraries
from flask import Flask, render_template,request

import pickle
import numpy as np
from numpy.core.multiarray import array
from sklearn.ensemble import RandomForestClassifier
# import requests

# Load the Random Forest CLassifier model
filename = 'diabetes-prediction-rfc-model.pkl'
classifier = pickle.load(open(filename, 'rb'))

app = Flask(__name__)
@app.route('/predict', )
def predict():
        a=request.args.to_dict()
        b=[]
        for key,value in a.items():
            b.append(float(value))
        my_prediction = classifier.predict([b])
        if my_prediction[0]==0:
            return str("No diabetes")
        else:
            return str("Diabetes")
if __name__ == '__main__':
	app.run(debug=True)