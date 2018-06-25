# Write your code here!
#require "pry"

def game_hash
  {:home => {
    :team_name => 'Brooklyn Nets',
    :colors => ['Black', 'White'],
    :players => [
    {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
    {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
    {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
    {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
    {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
    ]
    },
    :away => {

    :team_name => 'Charlotte Hornets',
    :colors => ['Turquoise', 'Purple'],
    :players => [
    {player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
    {player_name: 'Bismak Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
    {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
    {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
    {player_name: 'Brendan Haywood', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
    ]
    }
  }
end

def num_points_scored(player)
   game_hash[:home][:players].each do |x|
    if x[:player_name] == player
      return x[:points]
    else
      game_hash[:away][:players].each do |x|
        if x[:player_name] == player
          return x[:points]
        end
      end
    end
  end
end

def shoe_size(player)
   game_hash[:home][:players].each do |x|
    if x[:player_name] == player
      return x[:shoe]
    else
      game_hash[:away][:players].each do |x|
        if x[:player_name] == player
          return x[:shoe]
        end
      end
    end
  end
end


def team_colors(name)
  if name == game_hash[:home][:team_name]
    return game_hash[:home][:colors]
  elsif name == game_hash[:away][:team_name]
    return game_hash[:away][:colors]
  end
end

def team_names()
  array = []
  array.push(game_hash[:home][:team_name])
  array.push(game_hash[:away][:team_name])
  array
end


def player_numbers(team_name)
  array = []
    if team_name == game_hash[:home][:team_name]
      game_hash[:home][:players].each do |x|
         array.push(x[:number])
      end
    elsif team_name == game_hash[:away][:team_name]
      game_hash[:away][:players].each do |x|
         array.push(x[:number])
       end
  end
  array
end

def player_stats(player_name)
  game_hash[:home][:players].each do |x|
    if player_name == x[:player_name]
      x.delete(:player_name)
      return x
    end
  end
  game_hash[:away][:players].each do |x|
    if player_name == x[:player_name]
      x.delete(:player_name)
      return x
    end
  end
end

def big_shoe_rebounds
  array = []
  player_with_largest_shoe = ""
  #Find largets shoe on the home team
  game_hash[:home][:players].each do |x|
    array.push(x[:shoe])
  end
  array = array.sort do |a, b|
    a <=> b
  end

  #Find largets shoe on the away team
  game_hash[:away][:players].each do |x|
    array.push(x[:shoe])
  end
  array = array.sort do |a, b|
    a <=> b
  end

  #Look in the away team for the player with the largest shoe
  game_hash[:away][:players].each do |x|
    if x[:shoe] == array[-1]
      player_with_largest_shoe = x[:player_name]
    end
  end

  #Look in the home team for the player with the largest shoe
  game_hash[:home][:players].each do |x|
    if x[:shoe] == array[-1]
      player_with_largest_shoe = x[:player_name]
    end
  end

  game_hash[:home][:players].each do |x|
    if x[:player_name] == player_with_largest_shoe
      return x[:rebounds]
    end
  end

  game_hash[:away][:players].each do |x|
    if x[:player_name] == player_with_largest_shoe
      return x[:rebounds]
    end
  end

end

big_shoe_rebounds
