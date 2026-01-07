#!/usr/bin/env Rscript

suppressPackageStartupMessages({
  library(argparse)
})

parser <- ArgumentParser(description = "Clustbench baseline: random clustering")

# Required by clustering stage contract
parser$add_argument("--data.matrix", dest="data_matrix", type="character", required=TRUE,
                    help="gz-compressed matrix with observations (rows) to cluster")
parser$add_argument("--data.true_labels", dest="data_true_labels", type="character", required=TRUE,
                    help="gz-compressed true labels (used to infer k range / k)")
parser$add_argument("--output_dir", "-o", dest="output_dir", type="character", required=TRUE,
                    help="output directory where results will be saved")
parser$add_argument("--name", "-n", dest="name", type="character", required=TRUE,
                    help="name of the method/module instance")

# Optional but strongly recommended
parser$add_argument("--seed", dest="seed", type="integer", default=1,
                    help="random seed for reproducibility")

args <- parser$parse_args()

# ---- logging / debugging (very useful on servers) ----
message("Full command: ", paste(commandArgs(), collapse = " "))
message("name: ", args$name)
message("output_dir: ", args$output_dir)
message("seed: ", args$seed)
message("R version: ", R.version.string)
message("libPaths: ", paste(.libPaths(), collapse=";"))
info <- Sys.info()
message("sysinfo: ", paste(names(info), info, sep="=", collapse=";"))

# ---- prepare output dir ----
dir.create(args$output_dir, recursive = TRUE, showWarnings = FALSE)

set.seed(args$seed)

# ---- TODO: implement baseline method ----
# Minimal baseline idea:
# 1) determine number of observations (n) from data.matrix
# 2) determine k from true labels (or define a k range)
# 3) generate random labels and write them in the expected format

# For now, just fail loudly so you know the skeleton runs end-to-end
message("Parsed arguments successfully. Now implement the method body.")
quit(save = "no", status = 0)