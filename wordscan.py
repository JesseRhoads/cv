import yaml
import re
import nltk
from collections import Counter
from nltk.stem import WordNetLemmatizer
from nltk.tokenize import word_tokenize

def scan_yaml(file_path):
    # 1. Load YAML file
    with open(file_path, 'r', encoding='utf-8') as f:
        data = yaml.safe_load(f)
    
    # 2. Convert to string and clean
    text = str(data)
    text = text.lower() # Case insensitive
    
    # 3. Get words using regex (removes numbers/symbols)
    words = re.findall(r'[a-zA-Z]+', text)
    
    # 4. Tense insensitive (Lemmatization)
    lemmatizer = WordNetLemmatizer()
    base_words = [lemmatizer.lemmatize(w) for w in words]
    
    # 5. Count frequencies
    word_counts = Counter(base_words)
    
    # 6. Report
    print("--- Word Frequencies ---")
    for word, count in word_counts.most_common():
        print(f"{word}: {count}")

# Replace with your file name
scan_yaml('Jesse_Rhoads_CV.yaml')
