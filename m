From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH 3/8] net: dsa: adding handling of second CPU-Port
Date: Sun, 23 Dec 2018 11:02:39 +0100
Message-ID: <F7949D96-8D9B-42A4-AE82-F77B3C4CEAC2@public-files.de>
References: <20181214164847.4851-1-frank-w@public-files.de> <20181214164847.4851-4-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181214164847.4851-4-frank-w@public-files.de>
Sender: netdev-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-mediatek@lists.infradead.org

Hi,
I got mail from kernelci regarding a null-pointer exception in dsa_slave_create.

I'm sure thats from uninitialized ethernet-option (maybe by missing dts-option).

struct net_device *master = ds->ports[port->upstream].ethernet;

Which is defined in new function dsa_user_parse. maybe a good place for fallback using 

dsa_port *cpu_dp = port->cpu_dp;
net_device *master = cpu_dp->master;

Should i implement a fallback? I'm asking because dsa-maintainers want to drop dts-option and want to realize it via manual bridging user-port to cpu-port instead of defining this connection in devicetree.

Regards Frank

Mit freundlichen Grüßen
Frank Wunderlich
