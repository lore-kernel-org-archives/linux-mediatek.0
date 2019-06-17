From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 0/2] net: mediatek: Add MT7621 TRGMII mode
 support
Date: Mon, 17 Jun 2019 16:02:23 +0200
Message-ID: <20190617140223.GC25211@lunn.ch>
References: <20190616182010.18778-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190616182010.18778-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, netdev@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Sun, Jun 16, 2019 at 08:20:08PM +0200, René van Dorst wrote:
> Like many other mediatek SOCs, the MT7621 SOC and the internal MT7530 switch both
> supports TRGMII mode. MT7621 TRGMII speed is 1200MBit.

Hi René

Is TRGMII used only between the SoC and the Switch? Or does external
ports of the switch also support 1200Mbit/s? If external ports support
this, what does ethtool show for Speed?

      Thanks
	Andrew
