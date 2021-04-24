# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
company = Company.create(name: 'Company1',
                         address: 'Address',
                         email: 'company@example.com',
                         phone: '1234',
                         plan: 0,
                         start_time: '2019-06-01 02:03:04',
                         created_at: '2019-06-01 02:03:04',
                         updated_at: '2019-06-01 02:03:04')
members = Member.create([{ company: company, name: 'member 1', email: 'member1@example.com', token: 'token', created_at: '2019-06-01 09:00:00', updated_at: '2019-06-01 09:00:00' },
                         { company: company, name: 'memebr 2', email: 'member2@example.com', token: 'token', created_at: '2019-06-01 09:00:00', updated_at: '2019-06-01 09:00:00' },
                         { company: company, name: 'member 3', email: 'member3@example.com', token: 'token', created_at: '2019-06-01 09:00:00', updated_at: '2019-06-01 09:00:00' },
                         { company: company, name: 'member 4', email: 'member4@example.com', token: 'token', created_at: '2019-06-01 09:00:00', updated_at: '2019-06-01 09:00:00' }])
api_key = ApiKey.create(company: company,
                        api_key: 'TEST',
                        created_at: '2019-06-01 02:03:04',
                        updated_at: '2019-06-01 02:03:04')
attendance_records = AttendanceRecord.create([{ member: members[0], start_time: '2021-01-02 08:30:00', end_time: '2021-01-02 17:30:00', created_at: '2021-01-02 08:30:00', updated_at: '2021-01-02 08:30:00' },
                                              { member: members[1], start_time: '2021-01-02 08:30:00', end_time: '2021-01-02 17:30:00', created_at: '2021-01-02 08:30:00', updated_at: '2021-01-02 08:30:00' },
                                              { member: members[2], start_time: '2021-01-02 08:30:00', end_time: '2021-01-02 17:30:00', created_at: '2021-01-02 08:30:00', updated_at: '2021-01-02 08:30:00' },
                                              { member: members[3], start_time: '2021-01-02 08:30:00', end_time: '2021-01-02 17:30:00', created_at: '2021-01-02 08:30:00', updated_at: '2021-01-02 08:30:00' }])
attendance_Schedules = AttendanceSchedule.create([{ member: members[0], start_time: '2021-01-02 08:30:00', end_time: '2021-01-02 17:30:00', created_at: '2021-01-02 08:30:00', updated_at: '2021-01-02 08:30:00' },
                                              { member: members[1], start_time: '2021-01-02 08:30:00', end_time: '2021-01-02 17:30:00', created_at: '2021-01-02 08:30:00', updated_at: '2021-01-02 08:30:00' },
                                              { member: members[2], start_time: '2021-01-02 08:30:00', end_time: '2021-01-02 17:30:00', created_at: '2021-01-02 08:30:00', updated_at: '2021-01-02 08:30:00' },
                                              { member: members[3], start_time: '2021-01-02 08:30:00', end_time: '2021-01-02 17:30:00', created_at: '2021-01-02 08:30:00', updated_at: '2021-01-02 08:30:00' }])