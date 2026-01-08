#!/usr/bin/env Rscript

library(argparse)
library(data.table)
library(R.utils)

parser <- ArgumentParser(description = "Benchmarking entrypoint")

# define arguments
parser$add_argument("--data.matrix",
                    required = TRUE, 
                    help = "the actual data to cluster (this is specific to this `stage` contract)")

# parser$add_argument("--data.true_labels", 
#                     type "character",
#                     required = TRUE, 
#                     help = "the true partitioning  (this is specific to this `stage` contract)")

parser$add_argument("--output_dir", 
                    type = "character", 
                    required = TRUE, 
                    help = "the output dir (all modules need this argument)")

parser$add_argument("--name", 
                    type = "character", 
                    required = TRUE,
                    help = "the name of the module (all modules need this argument)")

parser$add_argument("--seed",type = "integer", 
                    required = TRUE,
                    help = "seed")

args <- parser$parse_args()

message("Full command: ", paste0(commandArgs(), collapse = " "))
message("Name: ", args$name)
message("Output directory: ", args$output_dir)
message("Data matrix: ", args$data.matrix)
message("Seed: ", args$seed)

set.seed(args$seed)

name <- args$name
mat <- fread(args$data.matrix)

out_dir <- dir.create(args$output_dir)

clusters <- sample(1:3, nrow(mat), replace = TRUE)
mat_clustered <- cbind(mat, clusters)

df <- data.frame(mat_clustered)
gz <- gzfile(file.path(args$output_dir, paste0(args$name, "_ks_range.labels.gz")), "w")
write.table(file = gz, df, col.names = TRUE, row.names = FALSE, sep = ",")
close(gz)
