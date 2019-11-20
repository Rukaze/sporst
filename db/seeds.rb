# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[ ['basketball', 'NBA'],
  ['soccer', 'Laliga'],
  ['baseball', 'NPB'],
  ['baseball', 'MLB'],
  ['マイナースポーツ', '空手']
].each do |kind, league|
  Sport.create!(
    { kind: kind, league: league }
    )
  end
