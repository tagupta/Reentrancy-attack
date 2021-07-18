# Reentrancy-attack
A replication of DAO Hack vulnerability

## Prerequisite
This code is integrated using **Remix Ethereum IDE**. To run this project, open Remix IDE in your web browser and create files to run the code.

## Overview
The infamous DAO hack was happened in 2016, a year after the launch of Ethereum. This hack was a result of **reentrancy attack**. `splitDAO` was the function prone to this attack.
This hack resulted in famous **hard fork** which led to Ethereum and Ethereum Classic. In this repo, I'll highlight the discrepancy and it's solution using the pattern of CHECK-EFFECT-INTERACTION.

## Disclaimer
Use this repo for the purpose of study.
