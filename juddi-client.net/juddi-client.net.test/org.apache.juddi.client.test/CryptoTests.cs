﻿using NUnit.Framework;
using org.apache.juddi.v3.client.cryptor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace juddi_client.net.test
{
    [TestFixture]
    public class CryptoTests
    {
        [Test]
        public void AES128()
        {
            Console.Out.WriteLine("Cryptor AES128");
            Cryptor c = CryptorFactory.getCryptor(CryptorFactory.AES128);
            TestCryptor(c);
        }

        private void TestCryptor(Cryptor c)
        {
            String cipher = c.encrypt("Password");
            Console.Out.WriteLine(cipher);
            Assert.False(String.IsNullOrEmpty(cipher));

            String clear = c.decrypt(cipher);
            Console.Out.WriteLine(clear);
            Assert.False(String.IsNullOrEmpty(clear));
            Assert.AreEqual(clear, "Password");
        }
        [Test]
        public void AES256()
        {
            Console.Out.WriteLine("Cryptor AES256");
            Cryptor c = CryptorFactory.getCryptor(CryptorFactory.AES256);
            TestCryptor(c);
        }

        [Test]
        public void TripleDES()
        {
            Console.Out.WriteLine("Cryptor TripleDES");
            Cryptor c = CryptorFactory.getCryptor(CryptorFactory.TripleDES);
            TestCryptor(c);
        }
    }
}
