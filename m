Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD637C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Apr 2024 02:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LR/N8sOjphbjY7ylgbYn/+iB6DYtb+qs9Q0b8OwvBnQ=; b=BnxHHLVaTddwNQ5CXE1GDCI9ML
	RRwpm3bMlevYz7b5HuLA0ZGvJ+BTX97akPpQhCUwpn4wQOmjSIITBFSSdBUCb+8nk41mWChG3MgMc
	cAvsqW90oSNdp38rcKTm8jYFuDXt98HDte2w3ES73PSRT+fkgxGM8j67EcF1hBQlgAO3xqlUOdq3s
	MA/idKE9xLP5tCaDuMul5sDPSDVRDh9d9oVgjFoj1Ug/2HRNBq2rMBjGK9bwrrFdRuRHa9vs/7DvA
	e/7nT4QcZdqT/9RHsgLVbnF/D5rUwwgNM0UFolMA3+28R8vex4CqqaRsFKzTBhtChe96f5T7KKeHg
	XNnOQflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Xk1-0000000EeQU-39MJ;
	Sat, 27 Apr 2024 02:24:41 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Xjy-0000000EePk-38Lf;
	Sat, 27 Apr 2024 02:24:40 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s0Xjl-000000006AF-2noj;
	Sat, 27 Apr 2024 02:24:25 +0000
Date: Sat, 27 Apr 2024 03:24:18 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc.unal@arinc9.com
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 07/15] net: dsa: mt7530: move MT753X_MTRAP
 operations for MT7530
Message-ID: <Zixh0qsQat3ypqFp@makrotopia.org>
References: <20240422-for-netnext-mt7530-improvements-4-v2-0-a75157ba76ad@arinc9.com>
 <20240422-for-netnext-mt7530-improvements-4-v2-7-a75157ba76ad@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422-for-netnext-mt7530-improvements-4-v2-7-a75157ba76ad@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_192438_851283_6655B8E2 
X-CRM114-Status: GOOD (  32.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arınç,

On Mon, Apr 22, 2024 at 10:15:14AM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> On MT7530, the media-independent interfaces of port 5 and 6 are controlled
> by the MT7530_P5_DIS and MT7530_P6_DIS bits of the hardware trap. Deal with
> these bits only when the relevant port is being enabled or disabled. This
> ensures that these ports will be disabled when they are not in use.
> 
> Do not set MT7530_CHG_TRAP on mt7530_setup_port5() as that's already being
> done on mt7530_setup().

Multiple users reported ([1], [2]) that after I've imported the series
to OpenWrt they noticed that WAN connection on MT7621 boards using
PHY-muxing to hook up either port 0 or port 4 to GMAC1 no longer works.

The link still seems to come up, but no data flows. I went ahead and
confirmed the bug, then started bisecting the patches of this series,
and ended up identifying this very patch being the culprit.

I can't exclude that what ever the issue may be is caused by other
downstream patches we have, but can confirm that removing this patch of
your series [3] in OpenWrt fixes the issue. Please take a look and as
the cover letter states you have tested this on some MT7621 board,
please make sure traffic actually flows on the PHY-muxed port on that
board after this patch is applied, and if not, please figure out why and
repost a fixed version of this patch.


Cheers


Daniel

[1]: https://github.com/openwrt/openwrt/issues/15273
[2]: https://github.com/openwrt/openwrt/issues/15279
[3]: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commit;h=a8dde7e5bd6d289db6485cf57d3512ea62eaa827

> 
> Instead of globally setting MT7530_P5_MAC_SEL, clear it, then set it only
> on the appropriate case.
> 
> If PHY muxing is detected, clear MT7530_P5_DIS before calling
> mt7530_setup_port5().
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 38 +++++++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 606516206fb9..83436723cb16 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -880,8 +880,7 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>  
>  	val = mt7530_read(priv, MT753X_MTRAP);
>  
> -	val |= MT7530_CHG_TRAP | MT7530_P5_MAC_SEL | MT7530_P5_DIS;
> -	val &= ~MT7530_P5_RGMII_MODE & ~MT7530_P5_PHY0_SEL;
> +	val &= ~MT7530_P5_PHY0_SEL & ~MT7530_P5_MAC_SEL & ~MT7530_P5_RGMII_MODE;
>  
>  	switch (priv->p5_mode) {
>  	/* MUX_PHY_P0: P0 -> P5 -> SoC MAC */
> @@ -891,15 +890,13 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>  
>  	/* MUX_PHY_P4: P4 -> P5 -> SoC MAC */
>  	case MUX_PHY_P4:
> -		val &= ~MT7530_P5_MAC_SEL & ~MT7530_P5_DIS;
> -
>  		/* Setup the MAC by default for the cpu port */
>  		mt7530_write(priv, MT753X_PMCR_P(5), 0x56300);
>  		break;
>  
>  	/* GMAC5: P5 -> SoC MAC or external PHY */
>  	default:
> -		val &= ~MT7530_P5_DIS;
> +		val |= MT7530_P5_MAC_SEL;
>  		break;
>  	}
>  
> @@ -1193,6 +1190,14 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
>  
>  	mutex_unlock(&priv->reg_mutex);
>  
> +	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
> +		return 0;
> +
> +	if (port == 5)
> +		mt7530_clear(priv, MT753X_MTRAP, MT7530_P5_DIS);
> +	else if (port == 6)
> +		mt7530_clear(priv, MT753X_MTRAP, MT7530_P6_DIS);
> +
>  	return 0;
>  }
>  
> @@ -1211,6 +1216,14 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
>  		   PCR_MATRIX_CLR);
>  
>  	mutex_unlock(&priv->reg_mutex);
> +
> +	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
> +		return;
> +
> +	if (port == 5)
> +		mt7530_set(priv, MT753X_MTRAP, MT7530_P5_DIS);
> +	else if (port == 6)
> +		mt7530_set(priv, MT753X_MTRAP, MT7530_P6_DIS);
>  }
>  
>  static int
> @@ -2401,11 +2414,11 @@ mt7530_setup(struct dsa_switch *ds)
>  		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
>  			   RD_TAP_MASK, RD_TAP(16));
>  
> -	/* Enable port 6 */
> -	val = mt7530_read(priv, MT753X_MTRAP);
> -	val &= ~MT7530_P6_DIS & ~MT7530_PHY_INDIRECT_ACCESS;
> -	val |= MT7530_CHG_TRAP;
> -	mt7530_write(priv, MT753X_MTRAP, val);
> +	/* Allow modifying the trap and directly access PHY registers via the
> +	 * MDIO bus the switch is on.
> +	 */
> +	mt7530_rmw(priv, MT753X_MTRAP, MT7530_CHG_TRAP |
> +		   MT7530_PHY_INDIRECT_ACCESS, MT7530_CHG_TRAP);
>  
>  	if ((val & MT7530_XTAL_MASK) == MT7530_XTAL_40MHZ)
>  		mt7530_pll_setup(priv);
> @@ -2488,8 +2501,11 @@ mt7530_setup(struct dsa_switch *ds)
>  			break;
>  		}
>  
> -		if (priv->p5_mode == MUX_PHY_P0 || priv->p5_mode == MUX_PHY_P4)
> +		if (priv->p5_mode == MUX_PHY_P0 ||
> +		    priv->p5_mode == MUX_PHY_P4) {
> +			mt7530_clear(priv, MT753X_MTRAP, MT7530_P5_DIS);
>  			mt7530_setup_port5(ds, interface);
> +		}
>  	}
>  
>  #ifdef CONFIG_GPIOLIB
> 
> -- 
> 2.40.1
> 
> 

