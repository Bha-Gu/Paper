#let conf(
  title: none,
  authors: (),
  affil: (),
  abstract: [],
  keywords: [],
  doc,
) = {
  // Set and show rules from before.
  set page(
  footer: context [
    #set align(center)
    #set text(10pt)
    #counter(page).display(
      "1",
      both: false,
    )
  ]
  )
  set par(justify: true, first-line-indent: 1em)
  set heading(numbering: "1.")
  set figure(placement: none)
  set text(hyphenate: false)
  set bibliography(style: "springer-mathphys")
  show table.cell.where(y: 0): set text(weight: "bold")
  show figure.where(kind : table): set figure.caption(position : top)
  show link: it => {
    set text(navy)
    if type(it.dest) != str {
      it
    } else {
      underline(it)
    }
  }
  set align(center)
  text(24pt, title + "\n\n")

  let count = authors.len()
  let names = if count == 2 {
    authors.map(auther => [#auther.name]).join(" and ")
  } else {
    authors.map(auther => [#auther.name]).join(", ")
  }
  text(18pt, names + "\n\n")

  text(17pt, affil.dip + ", " + affil.name + ", " + affil.address + "\n\n")

  let contributing_mail = authors.filter(author => author.contributing == true).map(author => [#link("mailto:" + author.email)]).join("; ")
  let corresponding_mail = authors.filter(author => author.contributing == false).map(author => [#link("mailto:" + author.email)]).join("; ")

  text(14pt, "Corresponding author's E-mail: " + corresponding_mail + "\n")
  text(14pt, "Contributing author's E-mail: " + contributing_mail + "\n\n")

  par(justify: true)[
    *Abstract* \
    #abstract
  ]

  set align(left)

  text(12pt, weight: "bold", "Keywords: ")
  text(12pt, keywords)

  doc
}

#show: conf.with(
  title: [
    Intrusion Detection System using LAD
  ],
  authors: (
    (
      name: "Bhaumikaditya Guleria",
      email: "mt23cse003@nituk.ac.in",
      contributing: true,
    ),
    (
      name: "Maroti Deshmukh",
      email: "marotideshmukh@nituk.ac.in",
      contributing: false,
    ),
  ),
  affil: (
  dip: "Department of Computer Science and Engineering",
  name: "NIT Uttrakhand",
  address: "Srinagar India",
  ),
  abstract:  [
Intrusion Detection Systems (IDS) will continue to play a critical role in safeguarding networks from malicious activities in an increasingly connected world.
Traditional IDS approaches are expected to face persistent challenges, including high false positive rates, inefficiency in handling evolving threats, and limited adaptability to diverse data distributions.
This research will investigate the potential of Logical Analysis of Data (LAD) as a robust mathematical framework for enhancing intrusion detection.
LAD will be employed to identify critical patterns in network traffic, leveraging its ability to handle heterogeneous and imbalanced datasets effectively.
The study will design a LAD-based IDS model and evaluate its performance on widely recognized datasets, such as NSL-KDD and KDD-Cup99. 
Key performance metrics, including accuracy, precision, recall, F2-score, and data coverage, will be assessed to measure the effectiveness of the proposed model.
It is anticipated that the LAD-based approach will demonstrate superior adaptability and accuracy compared to traditional methods, while also addressing issues of dataset coverage and computational efficiency.
The findings of this study will provide valuable insights into the application of LAD in cybersecurity and will pave the way for the development of more robust, scalable, and adaptive IDS models.
Future research will focus on refining the LAD methodology to address its limitations and further enhance its applicability to real-world intrusion detection scenarios.
],
   keywords: [IDS, LAD, HybridIDS]
)


#import "@preview/subpar:0.2.0"

//#show figure.where(kind: table): set figure.caption(position: top)





= Introduction
<sec:Intro>
In recent years, the exponential growth of interconnected devices and
complex network systems has increased the vulnerability of critical
infrastructure and sensitive data to cyberattacks. This alarming trend
has necessitated the development of robust cybersecurity mechanisms to
ensure the safety and integrity of digital systems. Intrusion Detection
Systems \(IDS) have emerged as essential tools in this context,
providing the capability to monitor network activities, identify
potential threats, and mitigate risks by detecting malicious activities
in real-time. IDS technologies are particularly significant in
addressing the ever-evolving nature of cyber threats, which exploit
sophisticated techniques to bypass traditional security measures
#cite(<IDS1>) #cite(<IDS3>);.

IDS can be broadly categorized into three main types on the basis of
detection technique: signature-based, anomaly-based, and hybrid
approaches. Signature-based systems operate by identifying known attack
patterns and are highly efficient against previously documented threats.
However, their limitation lies in their inability to detect novel or
zero-day attacks. In contrast, anomaly-based IDS use statistical or
machine learning models to detect deviations from normal behavior,
making them more effective at identifying previously unseen attack
patterns. Hybrid systems combine these two approaches to leverage their
respective strengths and provide a more comprehensive intrusion
detection solution #cite(<IDS2>);#cite(<IDS6>);. Recent advancements in
IDS methodologies have increasingly relied on machine learning \(ML) and
deep learning \(DL) techniques, enabling systems to enhance their
detection accuracy, scalability, and adaptability to complex network
environments #cite(<IDS4>);#cite(<IDS14>);#cite(<IDS15>);.

The growing prevalence of the Internet of Things \(IoT) further
exacerbates the need for advanced IDS solutions. IoT environments are
characterized by heterogeneous devices, constrained resources, and
diverse communication protocols, which pose unique challenges for
intrusion detection. Traditional IDS frameworks often fall short in
meeting these demands, necessitating the development of IoT-specific IDS
tailored to the distinctive requirements of these systems. Research in
this domain has explored various innovative approaches, including the
use of optimization algorithms, hybrid methods, and lightweight ML
models, to improve the scalability, efficiency, and performance of IDS
in IoT environments #cite(<IDS5>);#cite(<IDS15>);.

Logical Analysis of Data \(LAD) has emerged as a promising data mining
methodology with applications in intrusion detection, classification,
and pattern recognition. LAD leverages Boolean functions and
combinatorial optimization techniques to generate interpretable patterns
that distinguish between normal and malicious activities. While LAD has
demonstrated significant potential in addressing the challenges of IDS,
its application is often constrained by computational complexity and
incomplete dataset coverage, especially when dealing with
high-dimensional or large-scale datasets. Nonetheless, LAD’s ability to
generate interpretable and explainable rules positions it as a valuable
tool for intrusion detection, particularly when combined with
complementary machine learning models #cite(<LAD1>);#cite(<LAD2>);.

In this study, we aim to investigate the effectiveness of LAD in the
context of intrusion detection by applying it to two benchmark datasets:
NSL-KDD and KDD-Cup99. Through rigorous experimentation and analysis, we
evaluate LAD’s performance across various metrics, including accuracy,
precision, recall, and F2-score. Additionally, we address the
limitations of LAD, such as long training times and incomplete coverage,
by proposing potential enhancements to its methodology. Furthermore, we
highlight the trade-offs between rule interpretability and detection
performance, with a focus on improving the scalability and applicability
of LAD in real-world intrusion detection scenarios.

The contributions of this work are twofold: 1. A comprehensive
evaluation of LAD’s performance on intrusion detection datasets with
varying characteristics. 2. Insights into the trade-offs and challenges
associated with LAD-based IDS, including computational complexity and
coverage limitations.

The remainder of this paper is organized as follows:
Section~#link(<sec:Review>)[2] provides an overview of related work in
IDS and LAD. Section~#link(<sec:Methodology>)[3] describes the
experimental setup and LAD-based rule generation process.
Section~#link(<sec:Results>)[4] presents the results of our experiments,
followed by an analysis of their implications. Finally,
Section~#link(<sec:Conclusion>)[5] concludes the study with a discussion
of future research directions.

= Literature Analysis
<sec:Review>
The field of Intrusion Detection Systems has witnessed significant
advancements with the incorporation of modern computational techniques,
including machine learning, deep learning, and LAD. These innovations
have improved the ability to detect and mitigate cyber threats in
increasingly complex network environments, including the IoT. This
section reviews the key developments in IDS and LAD, highlighting
state-of-the-art methodologies, their strengths, limitations, and areas
of application. The aim is to provide a comprehensive understanding of
the existing literature while identifying gaps and opportunities for
further research.

== Intrusion Detection Systems
<intrusion-detection-systems>
Intrusion Detection Systems have evolved significantly with the
integration of machine learning and deep learning techniques.
Signature-based IDS identify malicious activities by recognizing known
patterns or signatures. Alhomoud et al. #cite(<IDS4>) conducted a
performance evaluation of IDS techniques, highlighting the strengths and
limitations of various methodologies. Rai et al. #cite(<IDS12>) employed
decision tree based algorithm for intrusion detection. Kaur and Singh
#cite(<IDS14>) employed deep recurrent neural networks for signature
generation, achieving improved detection accuracy. On the other hand,
anomaly-based IDS detect deviations from normal behavior to identify
potential threats. Abbasi et al. #cite(<IDS1>) proposed a deep
learning-based feature extraction mechanism optimized with a finite
state machine, enhancing anomaly detection. Liu et al. #cite(<IDS3>)
introduced a GA-GOGMM-based adaptive pattern learning technique,
integrating fuzzy rough set-based attribute selection to improve IDS
effectiveness. Chauhan et al. #cite(<IDS15>) explored logical analysis
of data \(LAD) and information gain ratio for intrusion detection in IoT
systems.

Hybrid IDS combine signature and anomaly detection approaches,
leveraging their streng-ths to improve effectiveness. Ugtakhbayar et al.
#cite(<IDS6>) developed a hybrid model that enhances detection
capabilities through this integration. Similarly, Kim et al.
#cite(<IDS8>) proposed a hybrid method to reduce false positive rates by
merging anomaly detection with misuse detection. Also, Kalavandekar et
al. #cite(<IDS10>) employed a hybrid systems using genetic algorithm and
J48 \(C4.5) decision tree. Comprehensive surveys, such as those by
Santhosh Kumar et al. #cite(<IDS2>);, provide insights into machine
learning-based IDS tailored for IoT environments, addressing unique
challenges in secure communication. Khraisat et al. #cite(<IDS19>)
reviewed IDS techniques, datasets, and challenges, offering future
research directions, while Abdulganiyu et al. #cite(<IDS9>) focused on
advancements in network IDS using machine learning models. IoT-specific
IDS have gained attention due to the increasing prevalence of connected
systems, with Sowmya and Anita #cite(<IDS5>) reviewing hybrid methods
for improving scalability and performance. Furthermore, Ahmad et al.
#cite(<IDS16>) and Dini et al. #cite(<IDS17>) explored machine learning
and deep learning methods, enhancing IDS detection rates and reducing
false positives.

== Logical Analysis of Data
<logical-analysis-of-data>
Logical Analysis of Data is a versatile methodology applied in various
domains, including IDS and data classification. Boros et al.
#cite(<LAD1>) introduced LAD as a method for analyzing numerical data
using Boolean patterns, laying the groundwork for its applications. They
further demonstrated its scalability for large-scale datasets
#cite(<LAD2>);. Algorithmic advancements, such as the accelerated
pattern detection algorithm proposed by Alexe and Hammer #cite(<LAD5>);,
have improved LAD’s computational efficiency. Crama et al. #cite(<LAD6>)
examined cause-effect relationships using Boolean functions,
contributing to its theoretical foundations.

Applications of LAD span multiple domains. In IoT security, Chauhan et
al. #cite(<LAD7>) demonstrated its potential in intrusion detection
systems. Gangopadhyay et al. #cite(<LAD8>) explored LAD’s utility in
financial applications, including accounting analytics and fraud
detection. Bonates et al. #cite(<LAD9>) refined LAD for maximum pattern
detection in data mining tasks. Comprehensive surveys, such as the one
by Lejeune et al. #cite(<LAD4>);, review recent advancements in LAD,
highlighting its versatility in data analytics and potential for further
innovation.

#figure(
align(center)[#table(
  columns: (6fr, auto, 9fr, 5fr, 9fr),
  align: (col, row) => ((left,center,left,left,left,).at(col) + horizon),
  inset: 6pt,
  [#strong[Author];], [#strong[Year];], [#strong[Methodology];],
  [#strong[Dataset];], [#strong[Results];],
  [Kaur and Singh #cite(<IDS12>);],
  [2020],
  [Deep recurrent neural networks \(RNNs)],
  [CICIDS 2017, NSL-KDD],
  [Accuracy: 99.10%, 99.14%],
  [Liu et al. #cite(<IDS3>);],
  [2019],
  [GA-GOGMM with fuzzy rough set attribute selection],
  [NSL-KDD],
  [Detection Rate: 96.52%],
  [Kalavandekar et al. #cite(<IDS10>);],
  [2019],
  [Genetic Algorithm and J48 \(C4.5) decision tree],
  [KDDcup99],
  [99.81%],
  [Rai el al. #cite(<IDS12>);],
  [2016],
  [Decision Tree based Algorithm],
  [NSL-KDD],
  [Accuracy: 79.52%],
  [Chauhan et al. #cite(<LAD7>);],
  [2021],
  [LAD and information gain ratio],
  [Bot-IoT],
  [Acc: 99.988%, Prec: 99.989%, Recall: 99.998%],
  [Ugtakhbayar et al. #cite(<IDS6>);],
  [2020],
  [Naive Bayes Classifier],
  [KDD 99],
  [Detection Rate: 97.5%],
  [Sowmya and Anita #cite(<IDS5>);],
  [2022],
  [Review of AI-based intrusion detection system],
  [N/A],
  [],
  [Boros et al. #cite(<LAD1>);],
  [2000],
  [Logical Analysis of Data \(LAD) for numerical analysis],
  [N/A],
  [],
  [Chauhan et al. #cite(<LAD7>);],
  [2021],
  [LAD and Information Gain Ratio],
  [Bot-IOT],
  [Acc: Recon: 99.97%, DDOS: 98.87%, DOS: 99.97%, Theft: 43.71%],
  [Lejeune et al. #cite(<LAD4>);],
  [2020],
  [LAD survey],
  [N/A],
  [],
)]
, caption: [Summary of Literature on IDS and LAD]
) <tab:litreview>

= Proposed Work
<sec:Methodology>
#figure([#box(width: 100%, image("Methedology.drawio.png"));],
  caption: [
    LAD Process Flow
  ]
)
<fig:LAD>

The main issue with most IDS systems is that they are resource intensive
and logically ambiguous.

The proposed work is a modification of LAD which revolves around
transforming data into binary format and generating rules in a Sum of
Product format for the purpose of classification. The overall flow of
the process is in stages:

- #strong[Binarization:] Converting the data to binary format.

- #strong[Pattern Generation:] Using binary data to make rules.

== Binarization
<binarization>
#figure([#box(width: 100%, image("Binarization.drawio.png"));],
  caption: [
    Binarization Process
  ]
)
<fig:Binarization>

The binarization process that transforms every feature in the dataset
into one or more binary features. This is done while aiming to
encapsulate all the significant information present in them. All
features in the dataset are binarized independently. Binarizing a
numerical feature as is may produce too many binary features with
minimum significance due to number of unique values being comparable to
number of samples. So, many of these values should be collected into
groups which is done by the process called binning.

#figure([#box(width: 80%, image("Binning.drawio.png"));],
  caption: [
    Binning Process
  ]
)
<fig:Binning>

In binning we transform continuous numerical data into various
intervals. This process begins with sorting of the data. Then the
arithmetic mean of all consecutive values is taken into consideration to
obtain a cutpoint. These values are then scored with the formula:
$ upright("score") = sqrt(frac(sum_(i = 0)^(n - 1) sum_(j = i + 1)^(n - 1) (upright("rates")_i - upright("rates")_j)^2, frac(n^2 - (n med mod med 2), 4))) $

#block[
Where $n$ is the number of classes, $upright("rates")_i$ is the ratio of
number of samples of class $i$ that has appeared before the cutpoint to
total number of samples in class $i$.

]
The value with the highest score if higher than a minimum threshold is
stored as a cutpoint and used to divide the data into two. The same
process is repeated for both divisions of data to divide them further
until either the highest score from all divisions is less than the
threshold or a maximum depth of search is reached.
  
#subpar.grid(
  kind: table,
  figure(
    table(
      columns: 4,
      table.header(
      [y],[f4],[Cutpoint],         [Score]),
      [b], [7],       [-],             [-], table.hline(stroke: 0pt),
      [b],[14],    [10.5],[0.#overline[3]],table.hline(stroke: 0pt),
      [a],[20],      [17],[0.#overline[6]],table.hline(stroke: 0pt),
      [b],[20],       [-],             [-],table.hline(stroke: 0pt),
      [a],[22],      [21],          [0.75],table.hline(stroke: 0pt),
      [a],[29],    [22.5],           [0.5],table.hline(stroke: 0pt),
      [a],[31],      [30],          [0.25],
    ),
    caption: [Original Sorted Values]
  ),
  figure(
    table(
      columns: 4,
      table.header(
      [y],[f4],[Cutpoint],         [Score]),
      [b], [7],       [-],             [-],table.hline(stroke: 0pt),
      [b],[14],    [10.5],[0.#overline[3]],table.hline(stroke: 0pt),
      [a],[20],      [17],[0.#overline[6]],table.hline(stroke: 0pt),
      [b],[20],       [-],             [-], table.hline(stroke: 2pt),
      [a],[22],       [-],             [-],table.hline(stroke: 0pt),
      [a],[29],    [22.5],           [NaN],table.hline(stroke: 0pt),
      [a],[31],      [30],           [NaN],
    ),
    caption: [Values after 1 Split]
  ),
 figure(
    table(
      columns: 4,
      table.header(
      [y],[f4],[Cutpoint],         [Score]),
      [b], [7],       [-],             [-],table.hline(stroke: 0pt),
      [b],[14],    [10.5],           [NaN], table.hline(stroke: 2pt),
      [a],[20],       [-],             [-],table.hline(stroke: 0pt),
      [b],[20],       [-],             [-], table.hline(stroke: 2pt),
      [a],[22],       [-],             [-],table.hline(stroke: 0pt),
      [a],[29],    [22.5],           [NaN],table.hline(stroke: 0pt),
      [a],[31],      [30],           [NaN],
    ),
    caption: [Values after 2 Splits]
  ),
  figure(
    table(
      columns: 3,
      table.header(
      [y],[f4],       [f4 ranges]),
      [b],[31],[$(21, infinity)$],table.hline(stroke: 0pt),
      [b],[29],[$(21, infinity)$],table.hline(stroke: 0pt),
      [a],[20],       [$(17,21)$],table.hline(stroke: 0pt),
      [b],[22],[$(21, infinity)$],table.hline(stroke: 0pt),
      [a],[20],       [$(17,21)$],table.hline(stroke: 0pt),
      [a],[14],[$(-infinity,17)$],table.hline(stroke: 0pt),
      [a], [7],[$(-infinity,17)$],
    ),
    caption: [Binning of Numerical Data]
  ),
  columns: (1fr, 1fr),
  caption: [Binning example],
  placement: none,
  label: <tab:binning_example>,
)

All selected cutpoints are collectively used to make ranges by sorting
them in ascending order along with $- oo$ and $oo$. Consecutive values
are used as boundaries of ranges which form the bins that all
collectively ideally represent the original data in discrete or nominal
form.

Every unique value in nominal features or bin created from numerical
features are assigned a unique numerical value for said feature. These
numerical value are processed as their binary form, using every bit of
those values for a distinct binary feature. This process is repeated for
every feature thereby binarizing all the data.

#subpar.grid(
  kind: table,
  figure(
    table(
      columns: 5,
      [y],[f1],[f2],[f3],[f4],
      [a], [1],  [green], [yes], [31],table.hline(stroke: 0pt),
      [a], [4],   [blue],  [no], [29],table.hline(stroke: 0pt),
      [a], [2],   [blue], [yes], [20],table.hline(stroke: 0pt),
      [a], [4],    [red],  [no], [22],table.hline(stroke: 0pt),
      [b], [3],    [red], [yes], [20],table.hline(stroke: 0pt),
      [b], [2],  [green],  [no], [14],table.hline(stroke: 0pt),
      [b], [4],  [green],  [no],  [7],
    ),
    caption: [Original Values]
  ),
  figure(
    table(
      columns: 5,
      [y],[f1],[f2],[f3],[f4],
      [a],[$(-infinity,1.5)$],[green],[yes], [$(21,infinity)$],table.hline(stroke: 0pt),
      [a], [$(3.5,infinity)$], [blue], [no], [$(21,infinity)$],table.hline(stroke: 0pt),
      [a],      [$(1.5,2.5)$], [blue],[yes],       [$(17,21)$],table.hline(stroke: 0pt),
      [a], [$(3.5,infinity)$],  [red], [no], [$(21,infinity)$],table.hline(stroke: 0pt),
      [b],      [$(2.5,3.5)$],  [red],[yes],       [$(17,21)$],table.hline(stroke: 0pt),
      [b],      [$(1.5,2.5)$],[green], [no],[$(-infinity,17)$],table.hline(stroke: 0pt),
      [b], [$(3.5,infinity)$],[green], [no],[$(-infinity,17)$],
    ),
    caption: [Binning of Numerical Data]
  ),
  figure(
    table(
      columns: 5,
      [y],[f1],[f2],[f3],[f4],
      [a], [0],  [0], [1], [2],table.hline(stroke: 0pt),
      [a], [3],  [1], [0], [2],table.hline(stroke: 0pt),
      [a], [1],  [1], [1], [1],table.hline(stroke: 0pt),
      [a], [3],  [2], [0], [2],table.hline(stroke: 0pt),
      [b], [2],  [2], [1], [1],table.hline(stroke: 0pt),
      [b], [1],  [0], [0], [0],table.hline(stroke: 0pt),
      [b], [3],  [0], [0], [0],
    ),
    caption: [Label Encoding]
  ),
  figure(
    table(
      columns: 8,
      [y],[b1_1],[b1_0],[b2_1],[b2_0],[b3],[b4_1],[b4_0],
      [a], [false], [false], [false], [false],  [true],  [true],  [false],table.hline(stroke: 0pt),
      [a],  [true],  [true], [false],  [true], [false],  [true],  [false],table.hline(stroke: 0pt),
      [a], [false],  [true], [false],  [true],  [true], [false],   [true],table.hline(stroke: 0pt),
      [a],  [true],  [true],  [true], [false], [false],  [true],  [false],table.hline(stroke: 0pt),
      [b],  [true], [false],  [true], [false],  [true], [false],   [true],table.hline(stroke: 0pt),
      [b], [false],  [true], [false], [false], [false], [false],  [false],table.hline(stroke: 0pt),
      [b],  [true],  [true], [false], [false], [false], [false],  [false],
    ),
    caption: [Binarized Values]
  ),
  columns: (2fr, 3fr),
  caption: [Binarization Example],
  placement: none,
  label: <tab:binarization>,
)

Table #link(<tab:binarization>)[7] demonstrates how original feature
values are sequentially transformed through the steps of binning, label
encoding, and binary conversion, highlighting the systematic nature of
the binarization process and its effectiveness in preparing data for
further analysis.

== Pattern Generation
<pattern-generation>
Once the data is binarized, patterns are generated for the purpose of
classification. Firstly, an empty list of rules and list of patterns
that contains a single blank pattern is generated as a starting point.

#figure([#box(width: 80%, image("Pattern.drawio.png"));],
  caption: [
    Pattern Generation Process
  ]
)
<fig:PatternGeneration>

Following this, from each existing pattern two new patterns for every
feature in binary data are generated by adding each feature once as is
and once as its inverse to the pattern. Next, patterns that specifically
cover instances of a single class are identified and moved to the list
of rules with the association with said class. The observations that are
covered by these rules are removed from consideration for new rules. The
patterns that do not cover a single class are retained for further
iterations. This process is repeated until either all the data points
are covered by the generated rules or a predefined maximum number of
iterations is reached.

== Classification
<classification>
For classification of each sample a short-circuiting approach is used.
The evaluation is done by matching the sample to every rule in the order
the rules were generated. Which stops as soon as a matching rule is
found and the sample is classified with the class associated with that
rule. If no rules match the sample, its class is set to NULL.

= Results and Analysis
<sec:Results>
This section presents the results of our experiments evaluating the
proposed intrusion detection method using the NSLKDD and KDDCup99 \(10%)
datasets. Additionally, we discuss the limitations of the approach.

== System Configuration
<system-configuration>
The experiments and analyses were conducted on a high-performance HP
Z640 Workstation equipped with an Intel Xeon E5-2620 v3 processor \(12
cores, 3.20 GHz), 15.52 GiB of RAM, and an NVIDIA Quadro K2200 GPU. The
system ran Fedora Linux 41 \(Workstation Edition) x86\_64, with the
Linux 6.11.8-300.fc41.x86\_64 kernel, utilizing the COSMIC
1.0.0~alpha.3\_20241120-1.fc41 desktop environment and the Wayland-based
`cosmic-comp` window manager. The algorithm was implemented in Rust
1.82.0 using the polars crate which was interfaced with python using the
crate pyo3. Python was used to load and run datasets using the polars
library.

== Dataset Description
<dataset-description>
We utilize two popular intrusion detection datasets, as shown in
@tab:dataset.

#figure(
align(center)[#table(
  columns: (auto, auto, auto, auto),
  align: (col, row) => (left,right,center,center,).at(col),
  inset: 6pt,
  [Dataset]                  , [Samples]  , [Features], [Classes],
  [NSL-KDD #cite(<DATA1>);]  , [125,973]  , [41]      , [23]     ,
  [KDD-Cup99 #cite(<DATA2>);], [4,898,431], [41]      , [23]     ,
)]
, caption: [Datasets]
) <tab:dataset>
These datasets contain labeled network traffic data, representing normal
and malicious activities.

== Performance Metrics
<performance-metrics>
The following performance metrics were used to evaluate the performance
of proposed work:

- #strong[Accuracy];: The proportion of correctly predicted instances
  out of the total instances.
  $ upright("Accuracy") = frac(T P + T N, T P + T N + F P + F N) $

- #strong[Precision];: The ratio of true positive predictions to the
  total predicted positives \(i.e., how many selected items were
  relevant). $ upright("Precision") = frac(T P, T P + F P) $

- #strong[Recall];: The ratio of true positives to the actual positives
  in the dataset \(i.e., how many relevant items were selected).
  $ upright("Recall") = frac(T P, T P + F N) $

- #strong[F2-Score];: A weighted harmonic mean of precision and recall
  that gives more importance to recall, calculated as:
  $ upright("F2-Score") = frac(5 dot.op upright("Precision") dot.op upright("Recall"), 4 dot.op upright("Precision") + upright("Recall")) . $

- #strong[Data Coverage];: The proportion of predicted instances out of
  the total instances.

== Experimental Results
<experimental-results>
The results presented in this section pertain to experiments conducted
with a maximum depth of 4 for pattern generation.
Table~#link(<tab:4result>)[9] provides an overview of the performance
metrics across the datasets NSLKDD and KDDCup99 \(10%). The metrics
include accuracy, precision, recall, F2-score, and coverage. For the
NSLKDD dataset, the accuracy achieved was 75.48%, with a precision of
85.58%, a recall of 75.48%, an F2-score of 77.30%, and a coverage of
92.56%. On the other hand, the KDDCup99 \(10%) dataset exhibited
significantly higher performance with an accuracy of 96.10%, a precision
of 99.96%, a recall of 96.10%, an F2-score of 96.85%, and a coverage of
96.13%. These results demonstrate the effectiveness of the proposed
method, particularly for the KDDCup99 dataset.

#figure(
align(center)[#table(
  columns: 6,
  align: (col, row) => (left,center,center,center,center,center,).at(col),
  inset: 6pt,
  [#strong[Dataset];], [#strong[Accuracy];], [#strong[Precision];],
  [#strong[Recall];], [#strong[F2-Score];], [#strong[Coverage];],
  [NSLKDD],
  [75.48%],
  [85.58%],
  [75.48%],
  [77.30%],
  [92.56%],
  [KDDCup99 \(10%)],
  [96.10%],
  [99.96%],
  [96.10%],
  [96.85%],
  [96.13%],
)]
, caption: [Performance Results for Proposed work]
)<tab:4result>
Table~#link(<tab:Dataset_Samples>)[10] provides insights into the
characteristics of the datasets used in the experiments. The KDDCup99
\(10%) dataset consists of 330,994 samples with 41 features, 32 of which
are preprocessed and 29 are binarized. In contrast, the NSLKDD dataset
comprises 125,973 samples with 41 features, of which 54 are binarized.
These details emphasize the variability in dataset size and feature
representation, highlighting the adaptability of the binarization and
rule-generation process.

#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (left,center,center,).at(col),
  inset: 6pt,
  [#strong[Dataset];], [#strong[Samples];], [#strong[Features];],
  [KDDCup99 \(10%)],
  [330,994],
  [41 \(32 preprocessed, 29 binarized)],
  [NSLKDD],
  [125,973],
  [41 \(54 binarized)],
)]
, caption: [Dataset Samples and Features]
)<tab:Dataset_Samples>
Table~#link(<tab:Rules_Generated>)[11] focuses on the number of rules
generated for the datasets based on different minimum match criteria at
a depth of 3. For the KDDCup99 dataset, 243 rules were generated for at
least one match, 85 for a minimum of 10 matches, and 42 for a minimum of
50 matches. Similarly, for the NSLKDD dataset, the number of rules
generated was 365, 150, and 65 for minimum matches of 1, 10, and 50,
respectively. These statistics indicate how stricter matching criteria
reduce the number of generated rules, ensuring more selective and
meaningful rules.

#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (left,center,center,).at(col),
  inset: 6pt,
  [#strong[Matches];], [#strong[KDDCup99 \(10%)];], [#strong[NSLKDD];],
  [1],
  [243],
  [365],
  [10],
  [85],
  [150],
  [50],
  [42],
  [65],
)]
, caption: [Number of Rules Generated for Different Minimum Matches of
Sample at Depth 3]
)<tab:Rules_Generated>
Table~#link(<tab:Overall_Metrics>)[12] summarizes the overall metrics
for both datasets under different matching criteria. For the KDDCup99
dataset, with at least one match, the accuracy, precision, recall, and
coverage were 95.91%, 99.96%, 95.91%, and 95.94%, respectively. As the
match criteria increased to 10 and 50, the accuracy and recall reduced
to 93.27% and 75.80%, respectively, but the precision remained extremely
high \(99.98% and 99.97%). Similarly, for the NSLKDD dataset, stricter
match criteria also led to lower accuracy and recall while maintaining
high precision. For instance, at one match, the accuracy was 75.42%,
which dropped to 71.93% and 70.08% for match criteria of 10 and 50,
respectively.

#figure(
align(center)[#table(
  columns: 7,
  align: (col, row) => (left,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [#strong[Dataset];], [#strong[Matches];], [#strong[Acc];],
  [#strong[Prec];], [#strong[Recall];], [#strong[F2-Score];],
  [#strong[Coverage];],
  [KDDCup99],
  [1],
  [95.91%],
  [99.96%],
  [95.91%],
  [96.69%],
  [95.94%],
  [],
  [10],
  [93.27%],
  [99.98%],
  [93.27%],
  [94.54%],
  [93.29%],
  [],
  [50],
  [75.80%],
  [99.97%],
  [75.80%],
  [79.65%],
  [75.81%],
  [NSLKDD],
  [1],
  [75.42%],
  [86.13%],
  [75.42%],
  [77.34%],
  [91.52%],
  [],
  [10],
  [71.93%],
  [87.29%],
  [71.93%],
  [74.55%],
  [85.55%],
  [],
  [50],
  [70.08%],
  [88.83%],
  [70.08%],
  [73.17%],
  [81.17%],
)]
, caption: [Overall Metrics for Different Matching Criteria]
)<tab:Overall_Metrics>
The decision matrices provided in Tables~#link(<tab:NSLKDD_Matrix>)[15]
and #link(<tab:KDDcup_Matrix>)[18] offer a detailed view of
classification performance for the NSLKDD and KDDCup99 datasets under
varying minimum match criteria.

#subpar.grid(
  kind: table,
  figure(
    table(
      columns: 4,
      [ ], [Attack], [Normal], [NULL],
      [Attack], [8295], [3336], [1202],
      [Normal], [292], [8709], [710],
    ),
    caption: [For Minimum 1 Matching Sample],
  ),
  figure(
    table(
      columns: 4,
      [ ], [Attack], [Normal], [NULL],
      [Attack], [7781], [2801], [2151],
      [Normal], [268], [8336], [1107],
    ),
    caption: [For Minimum 10 Matching Samples],
  ),
  grid.cell(colspan: 2,figure(
    table(
      columns: 4,
      [ ], [Attack], [Normal], [NULL],
      [Attack], [7725], [2253], [2855],
      [Normal], [247], [8073], [1391],
    ),
    caption: [For Minimum 50 Matching Samples],
  )),
  columns: (1fr, 1fr),
  caption: [NSL-KDD Confusion Matrices],
  placement: none,
  label: <tab:NSLKDD_Matrix>,
)

For the NSLKDD dataset, as shown in
Table~#link(<tab:NSLKDD_Matrix>)[15];, the number of correctly
classified \"Attack\" and \"Normal\" instances decreases as the minimum
match criterion becomes stricter, resulting in an increase in
#emph[NULL] \(unmatched) cases. For instance, with a minimum of one
match, there were 8,295 correctly classified \"Attack\" instances and
8,709 \"Normal\" instances. However, with a minimum of 50 matches, these
numbers reduced to 7,725 and 8,073, respectively.

#subpar.grid(
  kind: table,
  figure(
    table(
      columns: 7,
      [ ], [DOS], [Normal], [Probe], [R2L], [U2R], [NULL],
      [DOS],    [124431],  [8],   [0],   [0],   [0],   [4742],
      [Normal], [3],       [30515], [3], [2],   [5],   [1574],
      [Probe],  [2],       [8],   [1259], [0],  [0],   [86],
      [R2L],    [0],       [10],  [0],   [42],  [1],   [219],
      [U2R],    [1],       [1],   [0],   [2],   [13],  [0],
    ),
    caption: [Confusion Matrix (First Scenario)],
  ),
  figure(
    table(
      columns: 7,
      [ ], [DOS], [Normal], [Probe], [R2L], [U2R], [NULL],
      [DOS],    [123506],  [4],   [0],   [0],   [0],   [5671],
      [Normal], [1],       [27529], [1], [1],   [0],   [4570],
      [Probe],  [1],       [2],   [898], [0],   [0],   [454],
      [R2L],    [0],       [8],   [0],   [123], [0],   [241],
      [U2R],    [1],       [2],   [0],   [1],   [7],   [6],
    ),
    caption: [Confusion Matrix (Second Scenario)],
  ),
  figure(
    table(
      columns: 7,
      [ ], [DOS], [Normal], [Probe], [R2L], [U2R], [NULL],
      [DOS],    [95373],  [3],   [0],   [0],   [0],   [33805],
      [Normal], [1],      [27265], [2], [1],   [0],   [4833],
      [Probe],  [4],      [2],   [843], [0],   [0],   [504],
      [R2L],    [0],      [4],   [0],   [94],  [0],   [274],
      [U2R],    [1],      [2],   [0],   [0],   [0],   [14],
    ),
    caption: [Confusion Matrix (Third Scenario)],
  ),
  columns: (1fr),
  caption: [KDDCup99 Confusion Matrices for Various Scenarios],
  placement: auto,
  label: <tab:KDDcup_Matrix>,
)

A similar trend is observed in the decision matrices for the KDDCup99
dataset in Table~#link(<tab:KDDcup_Matrix>)[18];. For example, with one
match, 124,431 \"DOS\" instances and 30,515 \"Normal\" instances were
correctly classified, while with 50 matches, these numbers dropped to
95,373 and 27,265, respectively. This illustrates the trade-off between
stricter match criteria and classification coverage.

Overall, the tables provide a comprehensive view of the performance and
effectiveness of the binarization and rule-generation framework across
multiple datasets, emphasizing how various factors, such as dataset
characteristics and matching criteria, influence the classification
results.

== Limitations of Proposed Work
<limitations-of-proposed-work>
The proposed method has some limitations:

- #strong[Long Training Time:] The training time of LAD is of the order
  $O (s c f^d)$, where $s$ is the number of samples, $c$ is the number
  of classes, $f$ is the number of features in the binarized data, and
  $d$ is the maximum number of attributes in a rule.

- #strong[Incomplete Coverage of Dataset:] The dataset may not be
  completely covered by LAD if the maximum number of attributes is not
  set to a sufficiently high value.

= Conclusion
<sec:Conclusion>
In this study, we explored the application of a Learning Algorithm for
Intrusion Detection \(LAD) on two well-known intrusion detection
datasets: NSL-KDD and KDD-Cup99. The experiments were conducted on a
high-performance workstation, and various performance metrics, including
accuracy, precision, recall, F2-score, and data coverage, were used to
evaluate the effectiveness of the proposed method.

The results indicated that LAD achieved a good balance between
performance and data coverage across both datasets. Specifically, the
method demonstrated high accuracy and precision, especially on the
KDD-Cup99 dataset \(10% subset), with an accuracy of 96.10% and
precision of 99.96%. However, it was also observed that LAD exhibited
limitations, such as long training times and incomplete dataset coverage
when the maximum number of attributes was not sufficiently set.

Despite these challenges, the proposed approach provided valuable
insights into improving the effectiveness of intrusion detection
systems, and future work may focus on addressing the limitations related
to training time and dataset coverage to enhance the overall performance of the system.

In conclusion, the findings from this study contribute to the
development of more efficient and accurate intrusion detection
techniques, with potential for further optimization in future research.

#bibliography("sn-bibliography.bib")
