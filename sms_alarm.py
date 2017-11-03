#!/usr/bin/env python
#encoding=utf8
import pycurl
import StringIO

def short_msg():
	c = pycurl.Curl()
	c.setopt(pycurl.URL, 'http://www.baidu.com')
	b = StringIO.StringIO()
	c.setopt(pycurl.WRITEFUNCTION, b.write)
	c.perform()
	data=int(c.getinfo(pycurl.HTTP_CODE))
	c.close()
	b.close()
	
	return data

def alater():
	data=short_msg()
	if ( data > 100 ):
#		return "短信条数剩余 : "+ str(data) 
		return data
if __name__=="__main__":
	print alater()




