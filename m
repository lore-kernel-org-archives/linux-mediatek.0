From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 net-next 0/2] net: mediatek: Add MT7621 TRGMII mode
 support
Date: Sat, 22 Jun 2019 16:58:42 -0700 (PDT)
Message-ID: <20190622.165842.918757451860285746.davem@davemloft.net>
References: <20190620122155.32078-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190620122155.32078-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: opensource@vdorst.com
Cc: frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, netdev@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

From: René van Dorst <opensource@vdorst.com>
Date: Thu, 20 Jun 2019 14:21:53 +0200

> Like many other mediatek SOCs, the MT7621 SOC and the internal MT7530
> switch both supports TRGMII mode. MT7621 TRGMII speed is fix 1200MBit.
> 
> v1->v2: 
>  - Fix breakage on non MT7621 SOC
>  - Support 25MHz and 40MHz XTAL as MT7530 clocksource

Series applied, thanks.
