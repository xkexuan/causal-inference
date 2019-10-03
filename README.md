# Evaluating campaign effectiveness using causal inference
In 2014, Google released [CausalImpact](https://google.github.io/CausalImpact/), an open-source R package designed to perform estimates on the causal impact of an intervention on a response variable within a time series.

In September 2019, The Straits Times ran an [article](https://www.straitstimes.com/asia/east-asia/stb-sparks-revival-of-japanese-interest-in-singapore) on the Passion Made Possible marketing campaign launched by the Singapore Tourism Board (STB), attributing the recent spike in tourist arrivals from Japan to the campaign's success in reviving Japanese interest in Singapore as a tourist destination.

In this project, CausalImpact is used to evaluate the effectiveness of the Passion Made Possible campaign on tourist arrivals from Japan.

# Getting started
## Installaion
    install.packages("CausalImpact")
    library(CausalImpact)
## Data
Monthly tourist arrivals data can be obtained from [Singstat](https://www.tablebuilder.singstat.gov.sg/publicfacing/createDataTable.action?refId=1991).

[Note: export data in Tidy format]

# Further resources
- Documentation: [‘CausalImpact’](https://cran.r-project.org/web/packages/CausalImpact/CausalImpact.pdf)
- Project site: [CausalImpact: An R package for causal inference in time series](https://google.github.io/CausalImpact/)
- Video: [Inferring the effect of an event using CausalImpact by Kay Brodersen](https://www.youtube.com/watch?v=GTgZfCltMm8&list=LLLE9aBtnD1tjw1HmLAc9sIw&index=2&t=991s)
- Tutorial: [How can the Reverend Bayes help you find out if your campaign worked?](https://towardsdatascience.com/how-can-i-tell-if-my-marketing-campaign-is-working-41cbf5c7dbc6)
- Related applications: [Assessing a New Advertising Effect: Measurement of the Impact of Television Commercials on Internet Search Queries](https://ai.google/research/pubs/pub39974)
