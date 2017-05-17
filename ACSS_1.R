# Algorithmic Nature Group (http://www.algorithmicnature.org)
#
# Cite or attribute as follows: 
# F. Soler-Toscano, H. Zenil, J.-P. Delahaye and N. Gauvrit, 
# Calculating Kolmogorov Complexity from the Frequency Output Distributions 
# of Small Turing Machines, arXiv:1211.1302 [cs.IT] 
# (complexity calculator: http://www.complexitycalculator.com)
# Algorithmic Nature Group - LABORES.
#
# The data file D5.csv must be placed in the work directory, or the following line is to be changed accordingly

D5=read.table("D5.csv",sep=",",dec=".",header=T)


# Defining the function AlgoProb
# AlgoProb takes a string of 0 and 1 as input, and gives D(5) as output
# it just reads the table...

AlgoProb=function(s)
{
	x=substr(s,1,1)
	if (x=="0") {s=gsub("1","2",s); s=gsub("0","1",s);s=gsub("2","0",s)}
	lin=subset(D5,string==s)
	if (dim(lin)[1]==0) {res=0} else {res=lin$D5[1]}
	return(res)
}

# Defined function AlgoComp which returns the algorithmic complexity according to D5 of a string s of 0 and 1's.
# In case s doesn't appear in the database, AlgoComp=NA


AlgoComp=function(s)
{
	x=AlgoProb(s)
	if (x!=0) {x=-log2(x)} else {x=NA}
	return(x)
}


# function RandProb gives the probability P(R|s) that a string s is random, in a bayesian way.
# For a string that doesn't appear in the database, the probability is 1

RandProb=function(s)
{
	l=nchar(s)
	lin=subset(D5,len==l)
	div=2*sum(lin$D5)
	p=1/(1+(2^(l)*AlgoProb(s)))
	return(p)
}


## how to use :
# AlgoProb("001")
# AlgoComp("011010001")
# RandProb("00100")
