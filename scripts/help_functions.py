import numpy as np
import pandas as pd


def replace_gpr(pd_series,gpr,re_gpr):
    tmp = []
    for line in tqdm(pd_series):
        split_line = line.split(":")
        if(len(split_line[0]) > 0 and split_line[0] == gpr):
            split_line[0] = re_gpr
        ln = split_line[0]+":"+split_line[1]
        tmp.append(ln)
    return pd.Series(tmp)

def csr_information_present(sim_csr,rtl_csr):
    arr = np.empty((sim_csr.count(),2),dtype=int)
    count = 0
    for idx, value in sim_csr.items():
        #print("idx = "+str(idx)+"\n-------------------------------")
        for sub_idx, sub_val in enumerate(value):
            csr_key = sub_val.split(":")[0]
            cmp = csr_key == rtl_csr[idx].split(":")[0]
            arr[count] = [str(idx),bool(cmp)]
        count+=1
    return pd.Series(data=arr[:,1], index=arr[:,0]).astype(bool)

def compare_csr(sim_csr,rtl_csr):
    count = 0
    for idx, scsr in sim_csr.items():
        if(scsr.count(rtl_csr[idx]) == 1):
            count+=1
    return count
#break execution if error is found

def find_error(txt,pattern):
    if(type(txt) == list):       
        for t in txt:
            if(type(pattern) != str):
                raise TypeError("substring of list is not a string")
            if(pattern.find(t) != -1):
                raise RuntimeError(pattern)
        return True 
    elif(type(txt) == str):
        if(pattern.find(txt) != -1):
            raise RuntimeError(pattern)
        else:
            return True
    else:
        raise TypeError("Given data is not a string nor a list of strings")

      
def find_success(txt,pattern):
    if(type(txt) == list):        
        for t in txt:
            if(t.find(pattern) == -1):
                return True
        return False
    elif(type(txt) == str):
        if(txt.find(pattern) == -1):
            return True
        else:
            return False