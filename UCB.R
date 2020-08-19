#Upper Confidence Bound

dataset = read.csv('Ads_CTR_Optimisation.csv')

#Implementing UCB
N = 10000
d = 10
ads_selected =integer()
Number_selection = integer(d)
sum_rewards = integer(d)
total_rewards = 0
for (n in 1:N){
  ad = 0
  max_upper_bound = 0
  for (i in 1:d){
    if (Number_selection[i]> 0){
    average_reward = sum_rewards[i]/Number_selection[i]
    delta_i = sqrt(3 * log(n) / Number_selection[i])
    upper_bound = average_reward + delta_i
   }else {
    upper_bound = 1e400
   }
    if (upper_bound > max_upper_bound){
      max_upper_bound = upper_bound
      ad = i
    }    
  }
  ads_selected = append(ads_selected, ad)
  Number_selection[ad]  = Number_selection[ad] + 1
  reward = dataset[n, ad]
  sum_rewards[ad] = sum_rewards[ad] + reward
  total_rewards = total_rewards + reward
}

#Visualising the Model

hist(ads_selected, 
     col = 'blue',
     main = 'Histogram of ads',
     xlab = 'Ads',
     ylab  = 'Times each ad was selected')
  
  
