From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v3 2/3] net: ethernet: mediatek: Re-add support
 SGMII
Date: Sat, 24 Aug 2019 14:32:25 +0100
Message-ID: <20190824133225.GE13294@shell.armlinux.org.uk>
References: <20190823134516.27559-1-opensource@vdorst.com>
 <20190823134516.27559-3-opensource@vdorst.com>
 <20190824092156.GD13294@shell.armlinux.org.uk>
 <20190824131117.Horde.vSCF_CQ5jCMHcSTWkh7Woxm@www.vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190824131117.Horde.vSCF_CQ5jCMHcSTWkh7Woxm@www.vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, Stefan Roese <sr@denx.de>
List-Id: linux-mediatek@lists.infradead.org

Hi René,

On Sat, Aug 24, 2019 at 01:11:17PM +0000, René van Dorst wrote:
> Hi Russell,
> 
> Mediatek calls it Turbo RGMII. It is a overclock version of RGMII mode.
> It is used between first GMAC and port 6 of the mt7530 switch. Can be used
> with
> an internal and an external mt7530 switch.
> 
> TRGMII speed are:
> * mt7621: 1200Mbit
> * mt7623: 2000Mbit and 2600Mbit.
> 
> I think that TRGMII is only used in a fixed-link situation in combination
> with a
> mt7530 switch and running and maximum speed/full duplex. So reporting
> 1000baseT_Full seems to me the right option.

I think we can ignore this one for the purposes of merging this patch
set, since this seems to be specific to this setup.  Neither 1000BaseT
nor 1000BaseX fit very well, but we have to choose something.

> PHY_INTERFACE_MODE_GMII:
> 	  10baseT_Half
> 	  10baseT_Full
> 	 100baseT_Half
> 	 100baseT_Full
> 	1000baseT_Half
> 	1000baseT_Full

I think GMII can be connected to a PHY that can convert to 1000BaseX, so
should probably include that here too.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
