From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v3 2/3] net: ethernet: mediatek: Re-add support
 SGMII
Date: Sat, 24 Aug 2019 10:21:56 +0100
Message-ID: <20190824092156.GD13294@shell.armlinux.org.uk>
References: <20190823134516.27559-1-opensource@vdorst.com>
 <20190823134516.27559-3-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190823134516.27559-3-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, Stefan Roese <sr@denx.de>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Aug 23, 2019 at 03:45:15PM +0200, René van Dorst wrote:
> +	switch (state->interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +		phylink_set(mask, 10baseT_Half);
> +		phylink_set(mask, 10baseT_Full);
> +		phylink_set(mask, 100baseT_Half);
> +		phylink_set(mask, 100baseT_Full);

You also want 1000baseX_Full here - the connected PHY could have a fiber
interface on it.

> +		/* fall through */
> +	case PHY_INTERFACE_MODE_TRGMII:
>  		phylink_set(mask, 1000baseT_Full);

I don't know enough about this interface type to comment whether it
should support 1000baseX_Full - if this is connected to a PHY that may
support fiber, then it ought to set it.

> +		break;
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +		phylink_set(mask, 2500baseX_Full);
> +		/* fall through */
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +		phylink_set(mask, 1000baseX_Full);

Both should be set.  The reasoning here is that if you have a
Fiberchannel 4Gbaud SFP plugged in and connected directly to the
MAC, it can operate at either 2500Base-X or 1000Base-X.  If we
decide to operate at 2500Base-X, then PHY_INTERFACE_MODE_2500BASEX
will be chosen.  Otherwise, PHY_INTERFACE_MODE_1000BASEX will be
used.

The user can use ethtool to control which interface mode is used
by adjusting the advertise mask and/or placing the interface in
manual mode and setting the speed directly.  This will change
the PHY_INTERFACE_MODE_xxxxBASEX (via phylink_helper_basex_speed())
between the two settings.

If we lose 2500baseX_Full when 1000Base-X is selected, the user
will not be able to go back to 2500Base-X mode.

Yes, it's a little confusing and has slightly different rules
from the other modes - partly due to phylink_helper_basex_speed().
These are the only interface modes that we dynamically switch
between depending on the settings that the user configures via
ethtool.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
