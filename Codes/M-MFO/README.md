## M-MFO Matlab code

This repository hosts the PDF and source code for our paper titled ["Migration-based moth-flame optimization algorithm"](https://www.mdpi.com/2227-9717/9/12/2276)

If you need further assistance with your paper or have any other requests, feel free to let me know!

## Abstract
Moth–flame optimization (MFO) is a prominent swarm intelligence algorithm that demonstrates sufficient efficiency in tackling various optimization tasks. However, MFO cannot provide competitive results for complex optimization problems. The algorithm sinks into the local optimum due to the rapid dropping of population diversity and poor exploration. Hence, in this article, a migration-based moth–flame optimization (M-MFO) algorithm is proposed to address the mentioned issues. In M-MFO, the main focus is on improving the position of unlucky moths by migrating them stochastically in the early iterations using a random migration (RM) operator, maintaining the solution diversification by storing new qualified solutions separately in a guiding archive, and, finally, exploiting around the positions saved in the guiding archive using a guided migration (GM) operator. The dimensionally aware switch between these two operators guarantees the convergence of the population toward the promising zones. The proposed M-MFO was evaluated on the CEC 2018 benchmark suite on dimension 30 and compared against seven well-known variants of MFO, including LMFO, WCMFO, CMFO, CLSGMFO, LGCMFO, SMFO, and ODSFMFO. Then, the top four latest high-performing variants were considered for the main experiments with different dimensions, 30, 50, and 100. The experimental evaluations proved that the M-MFO provides sufficient exploration ability and population diversity maintenance by employing migration strategy and guiding archive. In addition, the statistical results analyzed by the Friedman test proved that the M-MFO demonstrates competitive performance compared to the contender algorithms used in the experiments.

## Citation

```
@article{
  Title={Migration-based moth-flame optimization algorithm},
  Author={Mohammad H Nadimi-Shahraki, Ali Fatahi, Hoda Zamani, Seyedali Mirjalili, Laith Abualigah, Mohamed Abd Elaziz},
  Journal={Processes},
  Year={2021}
  Doi= https://doi.org/10.3390/pr9122276
  Publication date= {2021/10/25}
  Volume={9}
  Issue={12}
  Publisher={MDPI}
}
```
