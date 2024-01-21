Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41185C47422
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jan 2024 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qn4t+vas77bkDv8g3HdYzBVs/Lcv/nz47gDWrhkMoW0=; b=yJHG8558h0XrHFZJZXh4h+b3Yw
	qteMlr3jX+R0pRdHu2eWI3U8cZ7NHQUcfDX9RjlM2nlIC54bmfUOWSVr1C+QHH0/QgVDf2djX4I/H
	cpjGOwoikdU79UJXM1QIh34OanyZoDH15u5zVtHA+8+C6Y7EngknDN3Yx3A9DenN1RSyDtQesmjNL
	RTA/TrIS0T+5rCIg3fFEtIMIYLB/W7z7SOGBM5P9QomuVvDQFI9M13fYB3wHLT5JXfQ3AUwIKGI2c
	pqwxrWZzOejw/4FtTEAOvE7CIiUlLfscQDWC/zHUW4J0Ss/GfnGbdkfg93eYoO9sGbsuj6P0xAKKv
	JY37pIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRaXg-009jO2-0g;
	Sun, 21 Jan 2024 16:19:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRaXa-009jNE-1N;
	Sun, 21 Jan 2024 16:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qn4t+vas77bkDv8g3HdYzBVs/Lcv/nz47gDWrhkMoW0=; b=s8bZff+lnIy0w1E7iRjMwp/D5N
	CviH96SZl4ruDUwl3yMGZnF+huZmenyU48MCOt6rZmO2g1ZK1RZTN1cmW9QI+0iS7pbwn1FX/1lnd
	ywqOGEuwfb4Cj4Ue1dmv6ay3qiSExwDJq71IHBlCankDuAWJXiykbIHYoN4XtMtnOT6E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rRaXS-005f13-Ik; Sun, 21 Jan 2024 17:19:14 +0100
Date: Sun, 21 Jan 2024 17:19:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	richardcochran@gmail.com, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/8] net: phy: Introduce Qualcomm IPQ5018 internal PHY
 driver
Message-ID: <2c6c0d72-5d4e-4ec4-beb6-d30852108a67@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556D5568546D6DA4313209EC9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB5556D5568546D6DA4313209EC9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_081922_467141_5EC1DDD8 
X-CRM114-Status: GOOD (  15.51  )
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

On Sun, Jan 21, 2024 at 08:42:30PM +0800, Ziyang Huang wrote:
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>

You need to say something in the commit message. One obvious thing is
to justify not using the at803x driver, since 

> +#define IPQ5018_PHY_ID			0x004dd0c0

is in the Atheros OUI range.

> +static int ipq5018_probe(struct phy_device *phydev)
> +{
> +	struct ipq5018_phy *priv;
> +	struct device *dev = &phydev->mdio.dev;
> +	char name[64];
> +	int ret;

I guess you are new to mainline network. Please read:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

Section 1.6.4.

> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return dev_err_probe(dev, -ENOMEM,
> +				     "failed to allocate priv\n");

Please read the documentation of dev_err_probe() and this fix the
obvious problem with this.

> +	snprintf(name, sizeof(name), "%s#rx", dev_name(dev));
> +	priv->clk_rx = clk_hw_register_fixed_rate(dev, name, NULL, 0,
> +						  TX_RX_CLK_RATE);
> +	if (IS_ERR_OR_NULL(priv->clk_rx))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk_rx),
> +				     "failed to register rx clock\n");
> +
> +	snprintf(name, sizeof(name), "%s#tx", dev_name(dev));
> +	priv->clk_tx = clk_hw_register_fixed_rate(dev, name, NULL, 0,
> +						  TX_RX_CLK_RATE);
> +	if (IS_ERR_OR_NULL(priv->clk_tx))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk_tx),
> +				     "failed to register tx clock\n");
> +
> +	priv->clk_data = devm_kzalloc(dev,
> +				      struct_size(priv->clk_data, hws, 2),
> +				      GFP_KERNEL);
> +	if (!priv->clk_data)
> +		return dev_err_probe(dev, -ENOMEM,
> +				     "failed to allocate clk_data\n");
> +
> +	priv->clk_data->num = 2;
> +	priv->clk_data->hws[0] = priv->clk_rx;
> +	priv->clk_data->hws[1] = priv->clk_tx;
> +	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> +				     priv->clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "fail to register clock provider\n");

This needs an explanation. Why register two fixed clocks, which you
never use? Why not put these two clocks in DT?

> +
> +	return 0;
> +}
> +
> +static int ipq5018_soft_reset(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = phy_modify(phydev, IPQ5018_PHY_FIFO_CONTROL,
> +			 IPQ5018_PHY_FIFO_RESET, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	msleep(50);
> +
> +	ret = phy_modify(phydev, IPQ5018_PHY_FIFO_CONTROL,
> +			 IPQ5018_PHY_FIFO_RESET, IPQ5018_PHY_FIFO_RESET);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}

This needs an explanation. It is also somewhat like
qca808x_link_change_notify(). Is it really sufficient to only do this
reset FIFO during a soft reset, or is it needed when ever the link
changes?

You also appear to be missing device tree bindings.

    Andrew

---
pw-bot: cr


