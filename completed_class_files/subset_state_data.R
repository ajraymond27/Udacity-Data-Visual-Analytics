getwd()

statesInfo <- read.csv('stateData.csv')

subset(statesInfo, state.region == 1)

statesInfo[statesInfo$state.region == 1, ]

statesInfo[statesInfo$highSchoolGrad > 50, ]
statesInfo[statesInfo$highSchoolGrad < 50, ]

statesInfo[statesInfo$income >= 4000, ]
statesInfo[statesInfo$income < 4000, ]