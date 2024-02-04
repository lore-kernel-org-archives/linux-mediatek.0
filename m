Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FB8C48286
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Feb 2024 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MI6lpIWgNfPYIufZPPUkrH5iDUtFzMUpZ7rJrZ2DilM=; b=XOonajJJNr+3JhMt/3EwuzgDIs
	9T3YI0OdoWeepIEPpis24m7PfZuo6dV5N/XJBo9X7pv+xo+KpwbTaRP3AB62hP4FdYKNDt+tKf/cj
	k2aaMxsDUo9DuVuTV6aP//IDksMUtahH7g8WdgQAVl1fyrdeCmZk6FSNvEonCMPAZmocGYPkyFemf
	79tI1q1ow9gN8Bxed6BPQRX30vHtB4JV2QV5ZxuzW0E5T04Nj3jQ87Aob7oE2R/OBgKHGBV83vnyN
	ffQNgfegiFWDGPXxtAuSWjMYSE8chJd2ckchBQUa0dulxvluzJshHFa++XAZb65na8z9kjcYz/DJH
	uaYPXv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWgpz-00000001GR4-36LD;
	Sun, 04 Feb 2024 18:03:27 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWgpv-00000001GQA-38tq;
	Sun, 04 Feb 2024 18:03:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 357A360002;
	Sun,  4 Feb 2024 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1707069799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MI6lpIWgNfPYIufZPPUkrH5iDUtFzMUpZ7rJrZ2DilM=;
	b=Yz9FaFqPF7RNHn5IAgP/brxJzHHwL43WzXt4T7dUrZPwzs/S/LbG4DNcDcjjYa80SnjfDu
	e0fXEIck3tckJnDZKvUXuMB9QX3mD2S/ndjRGOdGke9xiLyeM6mIYfGbzWCdCUVJ+CAXkt
	nwHcc/0xIcxcRrdCr4iFdpk5e7cfJGilhmTyn2L+FL1HY1LoJc0qsoa5qMc2UDoweesVqY
	V0F7vzkJVxsmVdcQyrIQHHsu+wa8MUO4D8CMn3/8wRSugclu0jEttSr46nzQT2DKq5We5n
	LxCIiqObJ3wOmmMgLSx64NiC5qcr99kO42WGbkVtqhdGwvEePxuNTRYffRGtiA==
Message-ID: <d8838049-b0f3-4531-8ae0-83a7a7f14526@arinc9.com>
Date: Sun, 4 Feb 2024 21:03:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/7] net: dsa: mt7530: simplify
 mt7530_pad_clk_setup()
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
 <20240204-for-netnext-mt7530-improvements-2-v4-3-02bf0abaadb8@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240204-for-netnext-mt7530-improvements-2-v4-3-02bf0abaadb8@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_100324_073941_E0254C6A 
X-CRM114-Status: GOOD (  21.53  )
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
> This code is from before this driver was converted to phylink API. Phylink
> deals with the unsupported interface cases before mt7530_pad_clk_setup() is
> run. Therefore, the default case would never run. However, it must be
> defined nonetheless to handle all the remaining enumeration values, the
> phy-modes.
> 
> Switch to if statement for RGMII and return which simplifies the code and
> saves an indent.
> 
> Set P6_INTF_MODE, which is the three least significant bits of the
> MT7530_P6ECR register, to 0 for RGMII even though it will already be 0
> after reset. This is to keep supporting dynamic reconfiguration of the port
> in the case the interface changes from TRGMII to RGMII.
> 
> Disable the TRGMII clocks for all cases. They will be enabled if TRGMII is
> being used.
> 
> Read XTAL after checking for RGMII as it's only needed for the TRGMII
> interface mode.
> 
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>   drivers/net/dsa/mt7530.c | 91 +++++++++++++++++++++---------------------------
>   1 file changed, 40 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 8b8469eba863..82e90da1e52b 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -418,64 +418,53 @@ static int
>   mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
>   {
>   	struct mt7530_priv *priv = ds->priv;
> -	u32 ncpo1, ssc_delta, trgint, xtal;
> +	u32 ncpo1, ssc_delta, xtal;
>   
> -	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
> +	/* Disable the MT7530 TRGMII clocks */
> +	core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
>   
> -	switch (interface) {
> -	case PHY_INTERFACE_MODE_RGMII:
> -		trgint = 0;
> -		break;
> -	case PHY_INTERFACE_MODE_TRGMII:
> -		trgint = 1;
> -		if (xtal == HWTRAP_XTAL_25MHZ)
> -			ssc_delta = 0x57;
> -		else
> -			ssc_delta = 0x87;
> -		if (priv->id == ID_MT7621) {
> -			/* PLL frequency: 125MHz: 1.0GBit */
> -			if (xtal == HWTRAP_XTAL_40MHZ)
> -				ncpo1 = 0x0640;
> -			if (xtal == HWTRAP_XTAL_25MHZ)
> -				ncpo1 = 0x0a00;
> -		} else { /* PLL frequency: 250MHz: 2.0Gbit */
> -			if (xtal == HWTRAP_XTAL_40MHZ)
> -				ncpo1 = 0x0c80;
> -			if (xtal == HWTRAP_XTAL_25MHZ)
> -				ncpo1 = 0x1400;
> -		}
> -		break;
> -	default:
> -		dev_err(priv->dev, "xMII interface %d not supported\n",
> -			interface);
> -		return -EINVAL;
> +	if (interface == PHY_INTERFACE_MODE_RGMII) {
> +		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
> +			   P6_INTF_MODE(0));
> +		return;

This should be "return 0;". I will address this.

pw-bot: cr

Arınç

