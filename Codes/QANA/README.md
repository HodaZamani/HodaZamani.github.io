# QANA Matlab code

This repository hosts the source code for our paper titled ["QANA: Quantum-based avian navigation optimizer algorithm"](https://www.sciencedirect.com/science/article/abs/pii/S0952197621001627)

If you need further assistance with your paper or have any other requests, feel free to let me know!

## Abstract
Differential evolution is an effective and practical approach that is widely applied for solving global optimization problems. Nevertheless, its effectiveness and scalability are decreased when the problems’ dimension is increased. Hence, this paper is devoted to proposing a novel DE algorithm named quantum-based avian navigation optimizer algorithm (QANA) inspired by the extraordinary precision navigation of migratory birds during long-distance aerial paths. In the QANA, the population is distributed by partitioning into multi flocks to explore the search space effectively using proposed self-adaptive quantum orientation and quantum-based navigation consisted of two mutation strategies, DE/quantum/I and DE/quantum/II. Except for the first iteration, each flock is assigned using an introduced success-based population distribution (SPD) policy to one of the quantum mutation strategies. Meanwhile, the information flow is shared through the population using a new communication topology named V-echelon. Furthermore, we introduce two long-term and short-term memories to provide meaningful knowledge for partial landscape analysis and a qubit-crossover operator to generate the next search agents. The effectiveness and scalability of the proposed QANA were extensively evaluated using benchmark functions CEC 2018 and CEC 2013 as LSGO problems. The results were statistically analyzed by the Wilcoxon signed-rank sum test, ANOVA, and mean absolute error tests. Finally, the applicability of the QANA to solve real-world problems was evaluated by four engineering problems. The experimental results and statistical analysis prove that the QANA is superior to the competitor DE and swarm intelligence algorithms in test functions CEC 2018 and CEC 2013, with overall effectiveness of 80.46% and 73.33%, respectively.


## Citation

```
@article{
  Title={QANA: Quantum-based avian navigation optimizer algorithm},
  Author={Hoda Zamani, Mohammad H Nadimi-Shahraki, Amir H Gandomi},
  Journal={Engineering Applications of Artificial Intelligence},
  Volume={104}
  Publication date={2021/9/1}
  Publisher={Elsevier}
  Doi= https://doi.org/10.1016/j.engappai.2021.104314
}
```
