import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Read the VCF file
vcf_file = "my_data.vcf"
df = pd.read_csv(vcf_file, sep="\t",skiprows=734, header=None, low_memory=False)
print(df)
# Calculate the LD matrix
ld_matrix = np.zeros((df.shape[0], df.shape[0]))
for i in range(df.shape[0]):
  for j in range(i + 1, df.shape[0]):
    ld_matrix[i, j] = np.square(np.corrcoef(df.iloc[i, 1:], df.iloc[j, 1:])[0, 1])

# Plot the LD decay plot
plt.figure()
plt.plot(ld_matrix.diagonal())
plt.xlabel("Distance (bp)")
plt.ylabel("R^2")
plt.show()
