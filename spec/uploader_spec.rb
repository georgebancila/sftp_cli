# frozen_string_literal: true

require './lib/uploader'

describe 'Uploader' do
  describe '#upload' do
    let(:file) { 'test.txt' }

    subject { Uploader.new.upload(file) }

    context 'file is not given' do
      let(:file) { '' }

      it 'fails' do
        expect { subject }.to raise_exception(StandardError, 'u need to provide a file')
      end
    end

    context 'file does not exist' do
      it 'fails' do
        expect { subject }.to raise_exception(StandardError, 'the file does not exist')
      end
    end

    context 'file does exist' do
      before do
        allow(File).to receive(:exist?).with(file).and_return(true)
        allow(Net::SFTP).to receive(:start)
      end

      it 'calls sftp server start' do
        expect(Net::SFTP).to receive(:start)
        subject
      end
    end
  end
end
