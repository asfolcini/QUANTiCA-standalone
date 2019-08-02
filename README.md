## QUANTiCA Algorithmic Trading Platform

This is the __official repository__ of QUANTiCA project where you can find stable and last beta versions ready to be downloaded.

#### In Brief
QUANTiCA Algorithmic Trading Platform empowers the trader to focus on trading system development, testing and final execution without losing valuable time learning the underneath software technology. The QUANTiCA consists of a robust yet simple software platform and IT infrastructure, empowering users to trade like a pro.

![Screenshot](https://raw.githubusercontent.com/asfolcini/QUANTiCA/master/docs/screenshot.png)

#### Examples
<dd>
<pre>
C:\Temp\QUANTiCA\bin>QUANTiCA.bat
QUANTiCA Algorithmic Trading Platform
version 2.0stage5dev
http://getquantica.com
© Copyright 2019 - Alberto Sfolcini <a.sfolcini@gmail.com>

usage: QUANTiCA [-e <arg>] [-h] [-i] [-op] [-r <arg>] [-t <arg>] [-tr] -ts
       <arg> [-u <arg>]
 -e,--execute <arg>          Execute a trading system with a given runID.
 -h,--help                   Print this message for help.
 -i,--info                   Print info about Quantica and contacts.
 -op,--optimize              Optimizing the trading system parameters.
 -r,--reports <arg>          Show reports, if available, for a trading
                             system with a given runID.
 -t,--test <arg>             Test a trading system with a given runID.
 -tr,--train                 Training the trading system.
 -ts,--tradingsystem <arg>   Specify Trading System class, it must be the
                             .class file copied into repository folder, no
                             need to specify the .class extension.
 -u,--update <arg>           Update a trading system with a given runID by
                             loading past status.
</pre>

Execute trading system __SeasonalONE__:
<pre>
\QUANTiCA\bin>QUANTiCA.bat --tradingsystem quantica.tradingsystem.SeasonalONE --execute launchID-01
</pre>

It will you this output:

<pre>
QUANTiCA Algorithmic Trading Platform
version 2.0stage5dev
http://getquantica.com
© Copyright 2019 - Alberto Sfolcini <a.sfolcini@gmail.com>

Loading Trading System quantica.tradingsystem.SeasonalONE.. .

Trading System - SEASONAL PACK ONE
The aim of this TS is to produce stable alpha with a medium-low risk profile.

EXECUTING Trading System with runID=launchID-01.. .

2019-08-02 17:50:15,530 INFO - CSV MarketDataFeed v1.0stable (YAHOO CSV FORMAT)
2019-08-02 17:50:15,530 INFO -  . Verifing CSV file C:/Temp/Storico/SPY.csv
2019-08-02 17:50:16,661 INFO -  . 6291 candles loaded in memory.
2019-08-02 17:50:16,913 INFO - Persistence Engine Connected to 127.0.0.1:3306/db-quantica-core
2019-08-02 17:50:16,922 INFO - QUANTiCA ENGiNe - version 2.0stage5dev fired up!
2019-08-02 17:50:16,922 INFO - Loading settings from ../config/quantica.properties.. .
2019-08-02 17:50:16,923 INFO - Broker Account B1 (Paper Broker)
2019-08-02 17:50:16,924 INFO -  . Balance      : 1000000.0 Euro
2019-08-02 17:50:16,924 INFO -  . Credit Limit : 0.0 Euro
2019-08-02 17:50:16,925 INFO -  . Slippage     : 0.01%
2019-08-02 17:50:16,926 INFO -  . Fees         : 0.019% (Min:4.0)(Max:19.0)
2019-08-02 17:50:16,927 INFO - [CSV MarketDataFeed]:DataFeed CSV MarketDataFeed [ID:4c3eeee1-be18-4054-9cc1-07c9b8af00cf]
2019-08-02 17:50:16,927 INFO - [CSV MarketDataFeed]:------------------------------------------------------------------------------------
2019-08-02 17:50:16,927 INFO - [CSV MarketDataFeed]:DataFeedNoName
2019-08-02 17:50:16,928 INFO - [CSV MarketDataFeed]:------------------------------------------------------------------------------------
2019-08-02 17:50:16,929 INFO - [November April Strategy] Strategy November April Strategy [ID:da595b92-a6d6-4308-90cc-700ad16a3dd5]
2019-08-02 17:50:16,930 INFO - [November April Strategy] ------------------------------------------------------------------------------------------
2019-08-02 17:50:16,930 INFO - [November April Strategy] This strategy tries to exploit the seasonal November-April effect.
2019-08-02 17:50:16,931 INFO - [November April Strategy] ------------------------------------------------------------------------------------------
2019-08-02 17:50:16,934 INFO - Report be8131d3-515a-482d-b8fb-452c80f0683c ()
2019-08-02 17:50:16,936 INFO - MariaDB Persistence Engine for QUANTiCA - 2019.06.14 (c) Alberto Sfolcini <a.sfolcini@gmail.com>
2019-08-02 17:50:16,936 INFO -  . Live        MODE : false
2019-08-02 17:50:16,937 INFO -  . Persistence MODE : RESET
2019-08-02 17:50:17,023 INFO - Strategy [November April Strategy] subscribed to marketData.
2019-08-02 17:50:17,024 INFO - [November April Strategy] onStart():
2019-08-02 17:50:17,025 INFO - [CSV MarketDataFeed]:DataFeed (CSV MarketDataFeed) activated on tcp://localhost:6000
2019-08-02 17:50:17,146 INFO - [November April Strategy]  connected to tcp://localhost:6000 and ready to get marketData (using filer '' )
2019-08-02 17:50:17,356 INFO - [CSV MarketDataFeed]:DataFeed is waiting for clients [1] to connect...
2019-08-02 17:50:17,684 INFO - [CSV MarketDataFeed]:Client [1] 'November April Strategy' synched.
2019-08-02 17:50:18,816 INFO - [November April Strategy] BUY Triggered on 1993-10-27
2019-08-02 17:50:18,824 INFO - ORDER PLACED for symbol [SPY][ID:B-19931027]
2019-08-02 17:50:18,834 INFO -  * Buying At Market 1000 of [SPY] amount: 29,696.095 Euro
2019-08-02 17:50:18,837 INFO - [November April Strategy] onExecution(): transactionID: 91bd1e2c-5981-4ffb-b0cb-c7e1dbc40f14

...

2019-08-02 17:50:20,766 INFO - [November April Strategy] INVOKE_STOP DETECTED...
2019-08-02 17:50:20,866 INFO - [CSV MarketDataFeed]:CSV MarketDataFeed disconnected from tcp://localhost:6000
2019-08-02 17:50:21,039 INFO - [WATCHDOG : 2019-08-02 17:50:21.039 : system is running... ]
2019-08-02 17:50:21,039 INFO - [November April Strategy] Stopping safely...
2019-08-02 17:50:21,041 INFO - [November April Strategy] onStop():
2019-08-02 17:50:21,042 INFO - Elaborated in 0 Days 0 Hours 0 Minutes 4 Seconds (4106 millis). [Processors: 4][Memory Free/Total: 113197512/128974848 bytes]
2019-08-02 17:50:23,647 INFO - All done.
2019-08-02 17:50:23,655 INFO - Reports generated in ../reports/launchID-01/Report-20190802_175016.txt
</pre>
</dd>
         
#### License
QUANTiCA is a __MIT licesed__ project, feel free to contact me at any time as suggested below:

#### Contacts
Web    : http://getquantica.com<br>
eMail  : Alberto Sfolcini <a.sfolcini@gmail.com><br>
Github : http://github.com/asfolcini/QUANTiCA/<br>
Skype  : alberto.sfolcini<br>



