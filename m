From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v3 1/3] net: ethernet: mediatek: Add basic
 PHYLINK support
Date: Sat, 24 Aug 2019 10:11:06 +0100
Message-ID: <20190824091106.GC13294@shell.armlinux.org.uk>
References: <20190823134516.27559-1-opensource@vdorst.com>
 <20190823134516.27559-2-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190823134516.27559-2-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, Stefan Roese <sr@denx.de>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Aug 23, 2019 at 03:45:14PM +0200, René van Dorst wrote:
> This convert the basics to PHYLINK API.
> SGMII support is not in this patch.
> 
> Signed-off-by: René van Dorst <opensource@vdorst.com>
> --
> v2->v3:
> * Make link_down() similar as link_up() suggested by Russell King

Yep, almost there, but...

> +static void mtk_mac_link_down(struct phylink_config *config, unsigned int mode,
> +			      phy_interface_t interface)
> +{
> +	struct mtk_mac *mac = container_of(config, struct mtk_mac,
> +					   phylink_config);
> +	u32 mcr = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
>  
> +	mcr &= (MAC_MCR_TX_EN | MAC_MCR_RX_EN);

... this clears all bits _except_ for the tx and rx enable (which will
remain set) - you probably wanted a ~ before the (.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
