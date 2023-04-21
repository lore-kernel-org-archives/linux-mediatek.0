Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8C6C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 17:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xqf7VzXV95MBG4E7+Hs6pSQ8aagzF59Caahs7T58YgI=; b=Ng70D841ygCV2B3454C/jYaNUx
	F96bkpy/Et52X3IannNHPB3u03nvQ6y9Kcom7bPh2N9QFyrYUXo99rL5vjv5lKuX+kcH0rihZDDBh
	61VQw0gkXFJcUh1dHhQOETPS0m4endJGSY3IMpZbZOPPxd/Xu98iNRwEM0BlmM6wYKjNPZOZtj4qV
	WW3PYeNGsYhyrv2RtOvwBHi+Q7EpLoOaj4HSPVMAne+Ueo95T6VsGfFvkwd6cZLPpu3elqheq3+Fs
	ijH+V3z4dZSh5qAkXCGuwKq29+OQn2eAq0irtXtlRgE+3fDd7FnH6S8StT01Fd7imW5vmnajWQ0vh
	IS+JFgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppuZf-00BV3t-35;
	Fri, 21 Apr 2023 17:29:31 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppuZb-00BV2x-1r;
	Fri, 21 Apr 2023 17:29:29 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppuZB-0002Ee-23;
	Fri, 21 Apr 2023 19:29:01 +0200
Date: Fri, 21 Apr 2023 18:28:57 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH net-next 08/22] net: dsa: mt7530: change
 p{5,6}_interface to p{5,6}_configured
Message-ID: <ZELH2RlYLPjJGx6Y@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-9-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421143648.87889-9-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_102927_612248_2182FE19 
X-CRM114-Status: GOOD (  29.89  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 21, 2023 at 05:36:34PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The idea of p5_interface and p6_interface pointers is to prevent
> mt753x_mac_config() from running twice for MT7531, as it's already run with
> mt753x_cpu_port_enable() from mt7531_setup_common(), if the port is used as
> a CPU port.
> 
> Change p5_interface and p6_interface to p5_configured and p6_configured.
> Make them boolean.
> 
> Do not set them for any other reason.
> 
> The priv->p5_intf_sel check is useless as in this code path, it will always
> be P5_INTF_SEL_GMAC5.
> 
> There was also no need to set priv->p5_interface and priv->p6_interface to
> PHY_INTERFACE_MODE_NA on mt7530_setup() and mt7531_setup() as they would
> already be set to that when "priv" is allocated. The pointers were of the
> phy_interface_t enumeration type, and the first element of the enum is
> PHY_INTERFACE_MODE_NA. There was nothing in between that would change this
> beforehand.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

NACK. This assumes that a user port is configured exactly once.
However, interface mode may change because of mode-changing PHYs (e.g.
often using Cisco SGMII for 10M/100M/1000M but using 2500Base-X for
2500M, ie. depending on actual link speed).

Also when using SFP modules (which can be hotplugged) the interface
mode may change after initially setting up the driver, e.g. when SFP
driver is loaded or a module is plugged or replaced.

> ---
>  drivers/net/dsa/mt7530.c | 19 ++++---------------
>  drivers/net/dsa/mt7530.h | 10 ++++++----
>  2 files changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index bac2388319a3..2f670e512415 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2237,8 +2237,6 @@ mt7530_setup(struct dsa_switch *ds)
>  	val |= MHWTRAP_MANUAL;
>  	mt7530_write(priv, MT7530_MHWTRAP, val);
>  
> -	priv->p6_interface = PHY_INTERFACE_MODE_NA;
> -
>  	/* Enable and reset MIB counters */
>  	mt7530_mib_reset(ds);
>  
> @@ -2460,10 +2458,6 @@ mt7531_setup(struct dsa_switch *ds)
>  	mt7530_rmw(priv, MT7531_GPIO_MODE0, MT7531_GPIO0_MASK,
>  		   MT7531_GPIO0_INTERRUPT);
>  
> -	/* Let phylink decide the interface later. */
> -	priv->p5_interface = PHY_INTERFACE_MODE_NA;
> -	priv->p6_interface = PHY_INTERFACE_MODE_NA;
> -
>  	/* Enable PHY core PLL, since phy_device has not yet been created
>  	 * provided for phy_[read,write]_mmd_indirect is called, we provide
>  	 * our own mt7531_ind_mmd_phy_[read,write] to complete this
> @@ -2733,25 +2727,20 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  			goto unsupported;
>  		break;
>  	case 5: /* Port 5, can be used as a CPU port. */
> -		if (priv->p5_interface == state->interface)
> +		if (priv->p5_configured)
>  			break;
>  
>  		if (mt753x_mac_config(ds, port, mode, state) < 0)
>  			goto unsupported;
> -
> -		if (priv->p5_intf_sel != P5_DISABLED)
> -			priv->p5_interface = state->interface;
>  		break;
>  	case 6: /* Port 6, can be used as a CPU port. */
> -		if (priv->p6_interface == state->interface)
> +		if (priv->p6_configured)
>  			break;
>  
>  		mt753x_pad_setup(ds, state);
>  
>  		if (mt753x_mac_config(ds, port, mode, state) < 0)
>  			goto unsupported;
> -
> -		priv->p6_interface = state->interface;
>  		break;
>  	default:
>  unsupported:
> @@ -2859,12 +2848,12 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
>  		else
>  			interface = PHY_INTERFACE_MODE_2500BASEX;
>  
> -		priv->p5_interface = interface;
> +		priv->p5_configured = true;
>  		break;
>  	case 6:
>  		interface = PHY_INTERFACE_MODE_2500BASEX;
>  
> -		priv->p6_interface = interface;
> +		priv->p6_configured = true;
>  		break;
>  	default:
>  		return -EINVAL;
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index f58828577520..c3a37a0f4843 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -745,8 +745,10 @@ struct mt753x_info {
>   * @ports:		Holding the state among ports
>   * @reg_mutex:		The lock for protecting among process accessing
>   *			registers
> - * @p6_interface:	Holding the current port 6 interface
> - * @p5_interface:	Holding the current port 5 interface
> + * @p6_configured:	Flag for distinguishing if port 6 of the MT7531 switch
> + *			is already configured
> + * @p5_configured:	Flag for distinguishing if port 5 of the MT7531 switch
> + *			is already configured
>   * @p5_intf_sel:	Holding the current port 5 interface select
>   * @p5_sgmii:		Flag for distinguishing if port 5 of the MT7531 switch
>   *			has got SGMII
> @@ -767,8 +769,8 @@ struct mt7530_priv {
>  	const struct mt753x_info *info;
>  	unsigned int		id;
>  	bool			mcm;
> -	phy_interface_t		p6_interface;
> -	phy_interface_t		p5_interface;
> +	bool			p6_configured;
> +	bool			p5_configured;
>  	p5_interface_select	p5_intf_sel;
>  	bool			p5_sgmii;
>  	u8			mirror_rx;
> -- 
> 2.37.2
> 

