﻿using System;
using System.Collections.Generic;
using System.Text;

namespace org.apache.juddi.v3.client.log
{
    public interface Log
    {
        void info(string msg, Exception ex);
        void info(string msg);
        void warn(string msg, Exception ex);
        void warn(string msg);
        void error(string msg, Exception ex);
        void error(string msg);
        void debug(string msg, Exception ex);
        void debug(string msg);
        bool isDebugEnabled();
        void debug(Object msg);
       
    }
    public static class LogHelper
    {
       public static string HandleException(Exception ex)
        {
            string msg = "";
            while (ex != null)
            {
                msg = msg + ex.Message + Environment.NewLine + ex.StackTrace + Environment.NewLine;
                ex = ex.InnerException;
            }
            return msg;
        }
    }
}
