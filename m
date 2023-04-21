Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C73C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHkt1fkChnHDkk3BoLJyQWCJIhcKsmTb7iFrYbW5Mbs=; b=Z7Df+ZR9IGZzZGWmu73Yq8yE4L
	ignN5tJJ8M8XcdFZ7AHUSZuLfieASyVXTFa49wlwkW6aaSJzKQAMWWYGqjrCtPi6NFZMSAJfDfKqp
	/V3xN2/hOlRWdwkmT1S3Ruz6Ml6bb6Dqr++oXfLSNtVHEVBc7XuyIZyxsIfGERvR4GvHj49UJo5ZF
	lrfQFXL2XpCE+9uYqgqXuxMXz7htZcppx0zVavXdiElKgD5VsO4CJuxKtgE3sTxSe6LYeZ+Cj1PNo
	a3TXbXXAMWffjYHlvrhu26hJi8n5CogI025PIR3MYQYRqWTe1Jfm9dlrrY9fkd8uW6fD9kvl8RxvO
	SuBnWfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pptYf-00BN5J-1n;
	Fri, 21 Apr 2023 16:24:25 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pptYb-00BN3V-0O;
	Fri, 21 Apr 2023 16:24:22 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pptYN-0001o5-0y;
	Fri, 21 Apr 2023 18:24:07 +0200
Date: Fri, 21 Apr 2023 17:24:04 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH net-next 04/22] net: dsa: mt7530: improve comments
 regarding port 5 and 6
Message-ID: <ZEK4pIrlA_u69isg@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-5-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421143648.87889-5-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_092421_153635_63BBD649 
X-CRM114-Status: GOOD (  22.49  )
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

On Fri, Apr 21, 2023 at 05:36:30PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There's no logic to numerically order the CPU ports. State the port number
> and its capability of being used as a CPU port instead.
> 
> Remove the irrelevant PHY muxing information from
> mt7530_mac_port_get_caps(). Explain the supported MII modes instead.
> 
> Remove the out of place PHY muxing information from
> mt753x_phylink_mac_config(). The function is for both the MT7530 and MT7531
> switches but there's no PHY muxing on MT7531.
> 
> These comments were gradually introduced with the commits below.
> ca366d6c889b ("net: dsa: mt7530: Convert to PHYLINK API")
> 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a new
> hardware")
> c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Acked-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/net/dsa/mt7530.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index edc34be745b2..e956ffa1eea8 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2504,7 +2504,9 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
>  			  config->supported_interfaces);
>  		break;
>  
> -	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
> +	case 5: /* Port 5 which can be used as a CPU port supports rgmii with
> +		 * delays, mii, and gmii.
> +		 */
>  		phy_interface_set_rgmii(config->supported_interfaces);
>  		__set_bit(PHY_INTERFACE_MODE_MII,
>  			  config->supported_interfaces);
> @@ -2512,7 +2514,9 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
>  			  config->supported_interfaces);
>  		break;
>  
> -	case 6: /* 1st cpu port */
> +	case 6: /* Port 6 which can be used as a CPU port supports rgmii and
> +		 * trgmii.
> +		 */
>  		__set_bit(PHY_INTERFACE_MODE_RGMII,
>  			  config->supported_interfaces);
>  		__set_bit(PHY_INTERFACE_MODE_TRGMII,
> @@ -2532,14 +2536,17 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
>  			  config->supported_interfaces);
>  		break;
>  
> -	case 5: /* 2nd cpu port supports either rgmii or sgmii/8023z */
> +	case 5: /* Port 5 which can be used as a CPU port supports rgmii with
> +		 * delays on MT7531BE, sgmii/802.3z on MT7531AE.
> +		 */
>  		if (!priv->p5_sgmii) {
>  			phy_interface_set_rgmii(config->supported_interfaces);
>  			break;
>  		}
>  		fallthrough;
>  
> -	case 6: /* 1st cpu port supports sgmii/8023z only */
> +	case 6: /* Port 6 which can be used as a CPU port supports sgmii/802.3z.
> +		 */
>  		__set_bit(PHY_INTERFACE_MODE_SGMII,
>  			  config->supported_interfaces);
>  		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> @@ -2731,7 +2738,7 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  		    state->interface != PHY_INTERFACE_MODE_INTERNAL)
>  			goto unsupported;
>  		break;
> -	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
> +	case 5: /* Port 5, can be used as a CPU port. */
>  		if (priv->p5_interface == state->interface)
>  			break;
>  
> @@ -2741,7 +2748,7 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  		if (priv->p5_intf_sel != P5_DISABLED)
>  			priv->p5_interface = state->interface;
>  		break;
> -	case 6: /* 1st cpu port */
> +	case 6: /* Port 6, can be used as a CPU port. */
>  		if (priv->p6_interface == state->interface)
>  			break;
>  
> -- 
> 2.37.2
> 

