def replace_gpr(pd_series,gpr,re_gpr):
    tmp = []
    for line in tqdm(pd_series):
        split_line = line.split(":")
        if(len(split_line[0]) > 0 and split_line[0] == gpr):
            split_line[0] = re_gpr
        ln = split_line[0]+":"+split_line[1]
        tmp.append(ln)
    return pd.Series(tmp)