// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// mean_export
double mean_export(Nullable<NumericVector> x_);
RcppExport SEXP _diffexpR_mean_export(SEXP x_SEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type x_(x_SEXP);
    rcpp_result_gen = Rcpp::wrap(mean_export(x_));
    return rcpp_result_gen;
END_RCPP
}
// abs
NumericVector abs(Nullable<NumericVector> x_);
RcppExport SEXP _diffexpR_abs(SEXP x_SEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type x_(x_SEXP);
    rcpp_result_gen = Rcpp::wrap(abs(x_));
    return rcpp_result_gen;
END_RCPP
}
// abs_export
NumericVector abs_export(Nullable<NumericVector> x_);
RcppExport SEXP _diffexpR_abs_export(SEXP x_SEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type x_(x_SEXP);
    rcpp_result_gen = Rcpp::wrap(abs_export(x_));
    return rcpp_result_gen;
END_RCPP
}
// cumSum
NumericVector cumSum(Nullable<NumericVector> x_, const int last_index);
RcppExport SEXP _diffexpR_cumSum(SEXP x_SEXP, SEXP last_indexSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type x_(x_SEXP);
    Rcpp::traits::input_parameter< const int >::type last_index(last_indexSEXP);
    rcpp_result_gen = Rcpp::wrap(cumSum(x_, last_index));
    return rcpp_result_gen;
END_RCPP
}
// rep_weighted
NumericVector rep_weighted(NumericVector x, IntegerVector freq_table, int len_x);
RcppExport SEXP _diffexpR_rep_weighted(SEXP xSEXP, SEXP freq_tableSEXP, SEXP len_xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type freq_table(freq_tableSEXP);
    Rcpp::traits::input_parameter< int >::type len_x(len_xSEXP);
    rcpp_result_gen = Rcpp::wrap(rep_weighted(x, freq_table, len_x));
    return rcpp_result_gen;
END_RCPP
}
// concat
NumericVector concat(Nullable<NumericVector> x_, Nullable<NumericVector> y_);
RcppExport SEXP _diffexpR_concat(SEXP x_SEXP, SEXP y_SEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type x_(x_SEXP);
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type y_(y_SEXP);
    rcpp_result_gen = Rcpp::wrap(concat(x_, y_));
    return rcpp_result_gen;
END_RCPP
}
// interval_table
IntegerVector interval_table(NumericVector datavec, NumericVector interval_breaks, const int init_value);
RcppExport SEXP _diffexpR_interval_table(SEXP datavecSEXP, SEXP interval_breaksSEXP, SEXP init_valueSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type datavec(datavecSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type interval_breaks(interval_breaksSEXP);
    Rcpp::traits::input_parameter< const int >::type init_value(init_valueSEXP);
    rcpp_result_gen = Rcpp::wrap(interval_table(datavec, interval_breaks, init_value));
    return rcpp_result_gen;
END_RCPP
}
// permutations
NumericMatrix permutations(NumericVector x, const int num_permutations);
RcppExport SEXP _diffexpR_permutations(SEXP xSEXP, SEXP num_permutationsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< const int >::type num_permutations(num_permutationsSEXP);
    rcpp_result_gen = Rcpp::wrap(permutations(x, num_permutations));
    return rcpp_result_gen;
END_RCPP
}
// permutations_internal_test_export
NumericMatrix permutations_internal_test_export(NumericVector x, const int num_permutations);
RcppExport SEXP _diffexpR_permutations_internal_test_export(SEXP xSEXP, SEXP num_permutationsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< const int >::type num_permutations(num_permutationsSEXP);
    rcpp_result_gen = Rcpp::wrap(permutations_internal_test_export(x, num_permutations));
    return rcpp_result_gen;
END_RCPP
}
// wasserstein_metric
double wasserstein_metric(NumericVector a, NumericVector b, float p, Nullable<NumericVector> wa_, Nullable<NumericVector> wb_);
RcppExport SEXP _diffexpR_wasserstein_metric(SEXP aSEXP, SEXP bSEXP, SEXP pSEXP, SEXP wa_SEXP, SEXP wb_SEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type a(aSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type b(bSEXP);
    Rcpp::traits::input_parameter< float >::type p(pSEXP);
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type wa_(wa_SEXP);
    Rcpp::traits::input_parameter< Nullable<NumericVector> >::type wb_(wb_SEXP);
    rcpp_result_gen = Rcpp::wrap(wasserstein_metric(a, b, p, wa_, wb_));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_diffexpR_mean_export", (DL_FUNC) &_diffexpR_mean_export, 1},
    {"_diffexpR_abs", (DL_FUNC) &_diffexpR_abs, 1},
    {"_diffexpR_abs_export", (DL_FUNC) &_diffexpR_abs_export, 1},
    {"_diffexpR_cumSum", (DL_FUNC) &_diffexpR_cumSum, 2},
    {"_diffexpR_rep_weighted", (DL_FUNC) &_diffexpR_rep_weighted, 3},
    {"_diffexpR_concat", (DL_FUNC) &_diffexpR_concat, 2},
    {"_diffexpR_interval_table", (DL_FUNC) &_diffexpR_interval_table, 3},
    {"_diffexpR_permutations", (DL_FUNC) &_diffexpR_permutations, 2},
    {"_diffexpR_permutations_internal_test_export", (DL_FUNC) &_diffexpR_permutations_internal_test_export, 2},
    {"_diffexpR_wasserstein_metric", (DL_FUNC) &_diffexpR_wasserstein_metric, 5},
    {NULL, NULL, 0}
};

RcppExport void R_init_diffexpR(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
