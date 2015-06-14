# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

crew = Team.create(name: 'CREW', color: '#fff')
stefan = Member.create(name: 'stefan', email: 'stefan@example.com', team: crew)
peter = Member.create(name: 'peter', email: 'peter@example.com', team: crew)
tove = Member.create(name: 'tove', email: 'tove@example.com', team: crew)
lisa = Member.create(name: 'lisa', email: 'lisa@example.com', team: crew)
isak = Member.create(name: 'isak', email: 'isak@example.com', team: crew)
ant = Member.create(name: 'ant', email: 'ant@example.com', team: crew)

ninjas = Team.create(name: 'Rails Ninjas', color: '#f00')
