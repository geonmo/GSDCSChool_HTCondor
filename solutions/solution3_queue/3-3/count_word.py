#!/usr/bin/env python3
#-*- coding:utf-8 -*-
import os, sys, operator

class WordCounter:
    def __init__(self ):
        self.words_dict = {}
        self.words_total_sum = {}
    def load(self,text):
        words = text.split()
        if ( len(words)==0) : return 
        for word in words :
            word = ''.join(filter(str.isalnum,word.strip().lower()))
            if word == '': continue
            if word in self.words_dict:
                self.words_dict[word] = self.words_dict[word]+1
            else :
                self.words_dict[word] = 1
    def printCounter(self,minCount=2 ):
        ## minCount 보다 높은 빈도 수만 저장하여 새로운 dictionary 변수를 만듭니다.
        new_dict = dict( (k,v) for (k,v) in self.words_dict.items() if v> minCount)
        sorted_words = sorted(new_dict.items(), key=(lambda x: x[1]))
        sorted_words.reverse()
        for word in sorted_words:
            print("%s,%d"%(word[0], word[1]))
        return sorted_words

if __name__ == "__main__":
    files= sys.argv[1:]
    wc = WordCounter()
    for novel in files :
        with open(novel,'r',encoding='utf-8-sig') as infile:
            word_tuples = []
            for line in infile.readlines():
                wc.load(line.strip())
    wc.printCounter()

