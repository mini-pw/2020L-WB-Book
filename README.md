# XAI Stories. Case studies for eXplainable Artificial Intelligence

ebook: https://mini-pw.github.io/2020L-WB-Book


## How this book came about

This book is the result of a student projects for [Case Studies](https://github.com/mini-pw/2020L-WarsztatyBadawcze) course at the Warsaw University of Technology. Each team prepared an article on one of the topics selected from reproducibility, imputation, and interpretability.

This project is inspired by a fantastic book [Limitations of Interpretable Machine Learning Methods](https://compstat-lmu.github.io/iml_methods_limitations/) done at the Department of Statistics, LMU Munich.
We used the LIML project as the cornerstone for this repository.

## How to build the book

Step 1: Clone or download the repository https://github.com/mini-pw/2020L-WB-Book.

Step 2: Install dependencies

```
devtools::install_dev_deps()
```

Step 3: Render the book (R commands)

```{r}
# HTML
bookdown::render_book('./', 'bookdown::gitbook')
# PDF
bookdown::render_book('./', 'bookdown::pdf_book')
```

