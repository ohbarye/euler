#!/usr/bin/env python
# -*- coding: utf-8 -*-

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

from math import sqrt
from itertools import ifilter

def find(pred, iterable):
    '''Find the first element that satisfies the condition.
        If no element does, return None.'''
    return next(ifilter(pred, iterable), None)

def findMinPrimeFactor(n):
    '''Find the minimum prime factor from 2 to √n.'''
    limit = int(sqrt(n))
    return find(lambda i: n % i == 0, range(2, limit + 1))

def findMaxPrimeFactor(n):
    '''Find the maximum prime factor.
        If the minimum prime factor is found,
        call recursively with the value devided by the factor.
        If it's not found, return the argument.'''
    minFactor = findMinPrimeFactor(n)
    return n if minFactor is None else findMaxPrimeFactor(n // minFactor)

print findMaxPrimeFactor(600851475143)
