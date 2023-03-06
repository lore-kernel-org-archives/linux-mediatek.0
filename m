Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A1DC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2ixbp4HL4ggnEiRH4MwcUBhAScL6f5ENTnBz9aakSY=; b=CRrwdg4IH8Qu7L
	+nDHDiVss4gYfOjAoZp6mM5XFYITjBkhHDNixMuK3NWJihGVvHBO4ncJ++in1T9r80VKi+KIvB5q6
	O7Ez0dYvYtIcCK2FWHk6hGKkG0OMhItDl3mArkxz1QCig+ylBrUI3nNsve7pAcqC+V1wpVjG7KWo1
	MUK7FuXY5k2jUB0ctdDBkB4JZHu3vans3EjoFdj0JbWf7YLhrqfC4nlIJqdWNFxZQ9NiIx5isIczl
	arVXub1FyK0V/jXLV5Q+pCmXPWlrf8kn5dOV6GcGG/m52AHcD8pAn9pE1vwf4CqYnk0y2VrM6Y8jT
	lL8OH/ZaqvMW2n3AmQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB9l-00Cxdz-3D; Mon, 06 Mar 2023 13:45:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB9Z-00Cxb6-8x; Mon, 06 Mar 2023 13:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T2ixbp4HL4ggnEiRH4MwcUBhAScL6f5ENTnBz9aakSY=; b=hvube7YvbCZmVMwrcJ6j7M+ne2
	J3kb5DDq1LTRcywXl0XY3k+igOeTtNJWZtln+H3/tBc2E9IZ5sweZjMABLLBDOBh8rYwZXzj+QEsN
	Ch5T/T9L78OgbNxlDKifqoh50fWAeTcqDrSStQaTQga2MPTMC5POzCy1lGeOx7GUcxZc7j3tEEO55
	yimPhj9RMZ4S7WdWROqY6Qq2Er50ppis8YQDeyrNBs7BMHFu2DYC/LNkeDTOT5nglOR0VuvExhQJ+
	ZlvUdh8tWz4Oq059qYxtSKn69gswWO6GpL5OPZfATs9jPgLMbqleseHvtR40C25Rsf/3h+2/82TnC
	6wPv64NA==;
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZAl0-00GgN2-0o;
	Mon, 06 Mar 2023 13:20:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678108766; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MBt2bMI5bp/2zB0h18LEQySzgihKn/foLOBx2NR77IdiTmpfWrd0sRr8GchUGFOvDlnrW8/fCdnkJIfSunM13v4CNeWuznd6cnkvhrA1XzzgC2CDwhrXMw+sog8HVIsZ5H0neMdIhzkOvE4G6Y02VbsY+dMfAoR1sKUhMBq3EZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678108766; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=T2ixbp4HL4ggnEiRH4MwcUBhAScL6f5ENTnBz9aakSY=; 
	b=Rf+LkxsgmGXk10OGqcrdeQTYayhTVPI8T3yveHH1mDuvAZmj9TRzqI7xLNc9nu7gtnvN5hpxdFoMzsoa1GIwUeHA2mbDl0c+8kPNZL5k49lnCrTRgSLsVlse968YPMO+mW+e4mTQt2xarynaHe/epleXN+YiIcOzOZCc4OTC0ok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678108766;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=T2ixbp4HL4ggnEiRH4MwcUBhAScL6f5ENTnBz9aakSY=;
	b=cuzashvIqaekgwn5HerHcqybDot4DJA7rFstAZKiwPAUIfM8mZbktInSfFyrX8t8
	F5id+uDOl+qmc0awzudVzEYOl3VDxHXDbdswgWDBCowjBuQnHb0Yp0lTZi6CnROfkUx
	CUchHVz1uCHxvr8AuyDL/vshLHTtRpPro+drcZ14=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1678108765103288.5523800899738; Mon, 6 Mar 2023 05:19:25 -0800 (PST)
Message-ID: <f8669264-0c96-0337-2293-4d215e313b93@arinc9.com>
Date: Mon, 6 Mar 2023 16:19:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH net] net: dsa: mt7530: move PLL setup out of port 6
 pad configuration
Content-Language: en-US
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>
References: <20230304125453.53476-1-arinc.unal@arinc9.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230304125453.53476-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_132002_606558_DE1479C6 
X-CRM114-Status: GOOD (  31.33  )
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
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Russell King <rmk+kernel@armlinux.org.uk>, Alexander Couzens <lynxis@fe80.eu>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4.03.2023 15:54, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Move the PLL setup of the MT7530 switch out of the pad configuration of
> port 6 to mt7530_setup, after reset.
> 
> This fixes the improper initialisation of the switch when only port 5 is
> used as a CPU port.
> 
> Add supported phy modes of port 5 on the PLL setup.
> 
> Remove now incorrect comment regarding P5 as GMAC5.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> 
> I'm trying to mimic this change by Alexander [0] for the MT7530 switch.
> This is already the case for MT7530 and MT7531 on the MediaTek ethernet
> driver on U-Boot [1] [2].
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=42bc4fafe359ed6b73602b7a2dba0dd99588f8ce
> [1] https://github.com/u-boot/u-boot/blob/a94ab561e2f49a80d8579930e840b810ab1a1330/drivers/net/mtk_eth.c#L729
> [2] https://github.com/u-boot/u-boot/blob/a94ab561e2f49a80d8579930e840b810ab1a1330/drivers/net/mtk_eth.c#L903
> 
> There are some parts I couldn't figure out myself with my limited C
> knowledge. I've pointed them out on the code. Vladimir, could you help?
> 
> There is a lot of code which is only needed for port 6 or trgmii on port 6,
> but runs whether port 6 or trgmii is used or not. For now, the best I can
> do is to fix port 5 so it works without port 6 being used.
> 
> The U-Boot driver seems to be much more organised so it could be taken as
> a reference to sort out this DSA driver further.
> 
> Also, now that the pad setup for mt7530 is also moved somewhere else, can
> we completely get rid of @pad_setup?
> 
> Arınç
> 
> ---
>   drivers/net/dsa/mt7530.c | 46 +++++++++++++++++++++++++++++-----------
>   1 file changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 0e99de26d159..fb20ce4f443e 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -395,9 +395,8 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
>   
>   /* Setup TX circuit including relevant PAD and driving */
>   static int
> -mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
> +mt7530_pad_clk_setup(struct mt7530_priv *priv, phy_interface_t interface)
>   {
> -	struct mt7530_priv *priv = ds->priv;
>   	u32 ncpo1, ssc_delta, trgint, i, xtal;
>   
>   	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
> @@ -409,9 +408,32 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
>   		return -EINVAL;
>   	}
>   
> +	/* Is setting trgint to 0 really needed for the !trgint check? */
> +	trgint = 0;
> +
> +	/* FIXME: run this switch if p5 is defined on the devicetree */
> +	/* and change interface to the phy-mode of port 5 */
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_GMII:
> +		/* PLL frequency: 125MHz */
> +		ncpo1 = 0x0c80;
> +		break;
> +	case PHY_INTERFACE_MODE_MII:
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +		/* PLL frequency: 125MHz */
> +		ncpo1 = 0x0c80;
> +		break;
> +	default:
> +		dev_err(priv->dev, "xMII interface %d not supported\n",
> +			interface);
> +		return -EINVAL;
> +	}
> +
> +	/* FIXME: run this switch if p6 is defined on the devicetree */
> +	/* and change interface to the phy-mode of port 6 */
>   	switch (interface) {
>   	case PHY_INTERFACE_MODE_RGMII:
> -		trgint = 0;
>   		/* PLL frequency: 125MHz */
>   		ncpo1 = 0x0c80;
>   		break;
> @@ -2172,7 +2194,11 @@ mt7530_setup(struct dsa_switch *ds)
>   		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
>   		     SYS_CTRL_REG_RST);
>   
> -	/* Enable Port 6 only; P5 as GMAC5 which currently is not supported */
> +	/* Setup switch core pll */
> +	/* FIXME: feed the phy-mode of port 5 and 6, if the ports are defined on the devicetree */
> +	mt7530_pad_clk_setup(priv, interface);

Unlike mt7531_pll_setup, there are return codes on mt7530_pad_clk_setup 
so we may need to check for the return code here.

Arınç

