library(ggplot2)

# Load LD results
ld_data <- read.table("ld_results.ld", header = T)

# Plot LD decay
ld_plot <- ggplot(ld_data, aes(x = BP_A, y = R2)) +
  geom_point(color = "blue") +
  geom_smooth(color = "red", se = FALSE) +
  xlab("Distance (kb)") +
  ylab("LD (R^2)") +
  ggtitle("LD Decay Analysis")

# Save the plot as an image file
ggsave("ld_decay_plot.png", plot = ld_plot, width = 8, height = 6, dpi = 300)


library(ggplot2)

# Load LD results
ld_data <- read.table("ld_results.ld", header = TRUE)

# Filter LD data for chromosome NC_000009.12
chr_ld_data <- subset(ld_data, CHR_A == "NC_000009.12")

# Plot LD decay for chromosome NC_000009.12
ggplot(chr_ld_data, aes(x = BP_A, y = R2)) +
  geom_point(color = "blue") +
  geom_smooth(color = "red", se = FALSE) +
  xlab("Distance (kb)") +
  ylab("LD (R^2)") +
  ggtitle("LD Decay Analysis - Chromosome NC_000009.12")

library(ggplot2)

# Load LD results
ld_data <- read.table("ld_results.ld", header = T)

# Plot LD decay
ggplot(ld_data, aes(x = BP, y = R2)) +
  geom_point(color = "blue") +
  geom_smooth(color = "red", se = FALSE) +
  xlab("Distance (kb)") +
  ylab("LD (R^2)") +
  ggtitle("LD Decay Analysis for Chromosome NC_000009.12")
