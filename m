Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4C5C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkTa9G5S/FeoXOCCv/+crAQmvYZG+/2VvbNesTP1weA=; b=2KxwViVBCkZ1b+cNFzpnHpjrQM
	SO/dcgFIKgquNZSEUgQ4N/vxQ/jcSI2rqYS1fhNZ8uNYGACfwjBRdBRB46E0ggapbJ8voOag1rl2p
	rcUDrwNLPXgyk6URvTjHOPLfc/HOGmgyPmdjtPQvzLwEtjrCOWfsFldy/IUoEUnYnDy0/x63Lo6cu
	InCXDSg+ozxR+6DGmvWZf6Z7FUJLE8MpK/Gzmz/eiBOE2qZEzi2O9qorSsZv8CUeRXFmKdEYu6xvT
	3Df93E8Ua86M7HiKklkLxB7L3S2dSasTo6oCjdRvAjfTWX9aDgxFrMhQsVc+fLo5FfbbpuA5MVlrt
	uWRJxsOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUV1i-00B70g-1S;
	Fri, 11 Aug 2023 16:30:14 +0000
Received: from out-117.mta1.migadu.com ([2001:41d0:203:375::75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUV1f-00B6yu-1v
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Aug 2023 16:30:13 +0000
Message-ID: <ac6a4318-3a47-2c77-6b81-b5f04765c04e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1691771405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JkTa9G5S/FeoXOCCv/+crAQmvYZG+/2VvbNesTP1weA=;
	b=Na4dtDhbGnLWU675SQ8MrLY3u2OqKGbns6Lg7/4w7dRyehX/GunZOzdk7UcBWfU4GMOQHw
	JpS2ikfpkKxF56Qc53ssyVsSgwbzw3jInK1ebxB7kWaHkHg7af4BiRe7IpBTAlVt6oj62w
	wfUePsjO4BbpjBVEGt7x7ckrqh9DWPw=
Date: Fri, 11 Aug 2023 17:30:01 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: phy: mediatek-ge-soc: support PHY LEDs
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <a21288bf80f26dda6c9729edb5b25d0995df5e38.1691724757.git.daniel@makrotopia.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <a21288bf80f26dda6c9729edb5b25d0995df5e38.1691724757.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_093012_034295_BA7591E4 
X-CRM114-Status: GOOD (  14.59  )
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

On 11/08/2023 04:35, Daniel Golle wrote:
> Implement netdev trigger and primitive bliking offloading as well as
> simple set_brigthness function for both PHY LEDs of the in-SoC PHYs
> found in MT7981 and MT7988.
> 
> On MT7988 it is necessary to read the boottrap register and apply LED
> polarities accordingly to get uniform behavior from all LEDs.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

[...]

> +
> +static int mt7988_phy_fix_leds_polarities(struct phy_device *phydev)
> +{
> +	struct pinctrl *pinctrl;
> +	int index;
> +
> +	/* Setup LED polarity according to bootstrap use of LED pins */
> +	for (index = 0; index < 2; ++index)
> +		phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
> +				MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
> +			       MTK_PHY_LED_ON_POLARITY,
> +			       mt7988_phy_led_get_polarity(phydev, index) ?
> +				MTK_PHY_LED_ON_POLARITY : 0);
> +
> +	/* Only now setup pinctrl to avoid bogus blinking */
> +	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");

This function gets reference on phydev->mdio.dev, but there is no code
to release it. It looks like a leak which will prevent module unload,
but I don't have hardware now to prove it.

> +	if (IS_ERR(pinctrl))
> +		dev_err(&phydev->mdio.bus->dev, "Failed to setup PHY LED pinctrl\n");
> +
> +	return 0;
> +}


