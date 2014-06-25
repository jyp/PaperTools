{-# OPTIONS_GHC -cpp #-}
module BibtexC where

import Cake
import System.IO

sed script input output = produce output $ do
  need input
  need script
  cut $ processIO "sed" ["-f", script,input] Nothing (Just output)

ascii_bib = extension ".ascii.bib" ==> \(out,base) -> do
  needs [ROOT_BibtexC ++ "ascii.sed"]
  sed (ROOT_BibtexC ++ "ascii.sed") (base ++ ".bib") out
  
short_bib = extension ".short.bib" ==> \(out,base) -> 
  sed (ROOT_BibtexC ++ "shorten.sed") (base ++ ".bib") out

nourl_bib = extension ".nourl.bib" ==> \(out,base) -> 
  sed (ROOT_BibtexC ++ "nourl.sed") (base ++ ".bib") out



allBibRules = ascii_bib <|> short_bib <|> nourl_bib

all = cake ascii_bib $ need "jp.ascii.bib"
