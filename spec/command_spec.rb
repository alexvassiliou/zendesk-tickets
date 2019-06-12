require_relative 'spec_helper'
require_relative '../lib/command'
module ZendeskTicket

  describe 'Command' do
    it 'should return next page' do
      expect(Command.process('NEXT')).to eq(:next_page)
      expect(Command.process('next     ')).to eq(:next_page)
    end

    it 'should return prev page' do
      expect(Command.process('PREV')).to eq(:prev_page)
      expect(Command.process('  prev')).to eq(:prev_page)
    end

    it 'should return goto page' do
      expect(Command.process('GOTo')).to eq(:goto_page)
      expect(Command.process('goto  ')).to eq(:goto_page)
    end

    it 'should return list' do
      expect(Command.process('LIST')).to eq(:list)
      expect(Command.process('list')).to eq(:list)
    end

    it 'should return main' do
      expect(Command.process('MAIN    ')).to eq(:main)
      expect(Command.process(' mAin    ')).to eq(:main)
    end

    it 'should return find' do
      expect(Command.process('FInD')).to eq(:find)
      expect(Command.process('find ')).to eq(:find)
    end

    it 'should return exit' do
      expect(Command.process('  ExIt  ')).to eq(:exit)
      expect(Command.process('exit ')).to eq(:exit)
      expect(Command.process('  QuIt  ')).to eq(:exit)
      expect(Command.process('q ')).to eq(:exit)
      expect(Command.process('  ExIt  ')).to eq(:exit)
      expect(Command.process('exit ')).to eq(:exit)
    end

    it 'should return invalid page if invalid data is entered' do
      expect(Command.process('Gjdjdj')).to eq(:invalid)
    end
  end
end
