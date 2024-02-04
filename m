Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D09C48286
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Feb 2024 18:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYcz89R33Vbh+hteH2uxagVcgEXlP6trCtTKBMirrXg=; b=R6t+t87DRGGIw5nFdhZAdsUUJm
	ugNwzWSy/9lwCmdPmiQ0+3G+w5/U7d3TySUUSmIPN2YcBOsFPFB3i/f8GWidgJQ1Ne/N2+Nis4S0r
	0QLupo5MHrhQCee/bt3OymkOr1ozG4Xulst36miGUOz+glpLGzv+uTKKipy00EZRCVAVOJrSLDFNA
	5XDU/3gjA00t4GiQyMTk/BBFvpnjpRNWPjRGDBGx1zyF2Jx4JTEkZkdCSp0g7Z5/eQDYKnHEqhP67
	SH9gCqCiHWdFz/hrF20LDOPgC2/znalirGSXNbbwICbzdglGuZwv9SCzu0rGcIEQKdiBbpBUi1rGV
	2WL5LGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWgwb-00000001Gtg-3lrM;
	Sun, 04 Feb 2024 18:10:17 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWgwY-00000001Gst-3SZ9;
	Sun, 04 Feb 2024 18:10:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 648CCC0004;
	Sun,  4 Feb 2024 18:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1707070211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYcz89R33Vbh+hteH2uxagVcgEXlP6trCtTKBMirrXg=;
	b=nGgIdTTWmlkH0DkDso2eSM+L2dDdz01kEU0kZqK8M0d5a60UgsHWLSXYF8SEygdhsF2JY4
	pLHaAvDotWIG9Ss4Wm9YD5PEYxhDEO4hUpxS+9sM+Wxu1l1u6/WTlUNePVtXqQkEouU6MI
	fbYBl+CJwGEBa5yEF+Kgt3RZOuExjOBuVi0Cj+tRUc9T9tsc+Ba2JioxHUEOld61NbaeQX
	nL7D/luQi0snXO8eQMh+CI+sxRH7Xi6Ea3WFLbw5VG9TknhbOiK5vvt3bNpAKHCSpflk6p
	bskM7fJtOhMAh7v8iTSfZTtJgC7L6JAxgJTVqovFNAipEHkmHAi1QD21zl1oqA==
Message-ID: <e7371ff0-0c45-4c41-8baa-31cef01fbf0d@arinc9.com>
Date: Sun, 4 Feb 2024 21:10:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 4/7] net: dsa: mt7530: call port 6 setup from
 mt7530_mac_config()
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <20240204-for-netnext-mt7530-improvements-2-v4-0-02bf0abaadb8@arinc9.com>
 <20240204-for-netnext-mt7530-improvements-2-v4-4-02bf0abaadb8@arinc9.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240204-for-netnext-mt7530-improvements-2-v4-4-02bf0abaadb8@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_101015_155881_FF849494 
X-CRM114-Status: GOOD (  19.76  )
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

On 4.02.2024 19:34, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> mt7530_pad_clk_setup() is called if port 6 is enabled. It used to do more
> things than setting up port 6. That part was moved to more appropriate
> locations, mt7530_setup() and mt7530_pll_setup().
> 
> Now that all it does is set up port 6, rename it to mt7530_setup_port6(),
> and move it to a more appropriate location, under mt7530_mac_config().
> 
> Change mt7530_setup_port6() to void as there're no error cases.
> 
> Leave an empty mt7530_pad_clk_setup() to satisfy the pad_setup function
> pointer.
> 
> This is the code path for setting up the ports before:
> 
> dsa_switch_ops :: phylink_mac_config() -> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>     -> mt753x_info :: mac_port_config() -> mt7530_mac_config()
>        -> mt7530_setup_port5()
> -> mt753x_pad_setup()
>     -> mt753x_info :: pad_setup() -> mt7530_pad_clk_setup()
> 
> This is after:
> 
> dsa_switch_ops :: phylink_mac_config() -> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>     -> mt753x_info :: mac_port_config() -> mt7530_mac_config()
>        -> mt7530_setup_port5()
>        -> mt7530_setup_port6()
> 
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>   drivers/net/dsa/mt7530.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 82e90da1e52b..18842c759b63 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -414,8 +414,8 @@ mt753x_preferred_default_local_cpu_port(struct dsa_switch *ds)
>   }
>   
>   /* Setup port 6 interface mode and TRGMII TX circuit */
> -static int
> -mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
> +static void
> +mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
>   {
>   	struct mt7530_priv *priv = ds->priv;
>   	u32 ncpo1, ssc_delta, xtal;
> @@ -465,7 +465,11 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
>   
>   	/* Enable the MT7530 TRGMII clocks */
>   	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
> +}
>   
> +static int
> +mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
> +{
>   	return 0;
>   }
>   
> @@ -2613,11 +2617,10 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>   {
>   	struct mt7530_priv *priv = ds->priv;
>   
> -	/* Only need to setup port5. */
> -	if (port != 5)
> -		return 0;
> -
> -	mt7530_setup_port5(priv->ds, interface);
> +	if (port == 5) {

Stray brace, will remove.

Arınç

