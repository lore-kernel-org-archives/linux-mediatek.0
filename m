Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EFAC10DC1
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wOVKCT46yFHYzsZfptn/YLuf58amecso91N0y4R11c=; b=iQLdk8YzgwUsdKUH+jdd3tGf3x
	lEUPOQiaYM0dHq0lB8rDPVhCGTqfRdMalhYgNh3oVaQuPK5MKXFGh1BhCijdTjLa11VkMV1YDZBsp
	mxaDJfwTJYpktSbVloiOQ/avENAXTuvwf9YhhY8xUBnt/hsse0U2SSf/ZFZMpNok/rsfnOnFrMxkX
	C+40MnXOpkbxS66+9lQ9fGqMY3CmjkRk6J3E7aPf274B6HTThCNiCHg3DWkqayu8LIU7R9qN82Veg
	i6Pd8gEdpvKbw0sHu7K+7O4T7l8QzJwVXaRQO9Jm34yx6dIX5AkUiEMgNyOmiZ5DeVqp5NqXrY1Lv
	DRo4Di7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoSn-009b0H-0C;
	Wed, 06 Dec 2023 09:45:05 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoSj-009ayl-0d;
	Wed, 06 Dec 2023 09:45:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3672B20005;
	Wed,  6 Dec 2023 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701855897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1wOVKCT46yFHYzsZfptn/YLuf58amecso91N0y4R11c=;
	b=J6Viro+mz0owT7xGlK236zyL/HHYYcaom8AJXxIhCJMxSlaCJIaCrVXTji8O0Y2B+FB3yI
	Ki01S0DKSB/GoyzwVdzLKhDlNObkSufX0srTobqBjEeIx8Mrk8IR5FNoOGCGiFfDUwgnvf
	19+Uf8Rp0ztIC+ysfcHt9FZXj6whr9foZTg/GS1oFm0uxrMeZ9QT/431AC2O1k+erb3MKg
	eePPpZRAN1tp/2qZTHcU4e6sPPlFPUEj3+etcmOKCKOULfBZJqVNa1b52PePUBkcj67nft
	mRFIcgRG5xrRP0G44UqazKz5cxGUgTYE8mw0WOpSfevOFsWtdzXGhB4f1081og==
Date: Wed, 6 Dec 2023 10:44:48 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Alexander Couzens <lynxis@fe80.eu>, Qingfang Deng
 <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH v2 2/8] phy: add driver for MediaTek pextp 10GE
 SerDes PHY
Message-ID: <20231206104448.0774da58@device.home>
In-Reply-To: <63636378a52dd1ea7370dbf0ca3037a7d24004b9.1701826319.git.daniel@makrotopia.org>
References: <cover.1701826319.git.daniel@makrotopia.org>
	<63636378a52dd1ea7370dbf0ca3037a7d24004b9.1701826319.git.daniel@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_014501_506533_0F07E6FE 
X-CRM114-Status: GOOD (  19.38  )
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

Hello Daniel,

On Wed, 6 Dec 2023 01:44:08 +0000
Daniel Golle <daniel@makrotopia.org> wrote:

> Add driver for MediaTek's pextp 10 Gigabit/s Ethernet SerDes PHY which
> can be found in the MT7988 SoC.
> 
> The PHY can operates only in PHY_MODE_ETHERNET, the submode is one of
> PHY_INTERFACE_MODE_* corresponding to the supported modes:
> 
>  * USXGMII
>  * 10GBase-R
>  * 5GBase-R
>  * 2500Base-X
>  * 1000Base-X
>  * Cisco SGMII (MAC side)
> 
> In order to work-around a performance issue present on the first of
> two PEXTP present in MT7988 special tuning is applied which can be
> selected by adding the mediatek,usxgmii-performance-errata property to
> the device tree node.
> 
> There is no documentation what-so-ever for the pextp registers and
> this driver is based on a GPL licensed implementation found in
> MediaTek's SDK.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

 [...]

> +
> +static int mtk_pextp_power_on(struct phy *phy)
> +{
> +	struct mtk_pextp_phy *pextp = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = clk_prepare_enable(pextp->clk[0]);
> +	if (ret)
> +		return ret;
> +
> +	return clk_prepare_enable(pextp->clk[1]);
> +}

clk_bulk operations could be used here

> +static int mtk_pextp_power_off(struct phy *phy)
> +{
> +	struct mtk_pextp_phy *pextp = phy_get_drvdata(phy);
> +
> +	clk_disable_unprepare(pextp->clk[1]);
> +	clk_disable_unprepare(pextp->clk[0]);
> +
> +	return 0;
> +}

Here

> +static const struct phy_ops mtk_pextp_ops = {
> +	.power_on	= mtk_pextp_power_on,
> +	.power_off	= mtk_pextp_power_off,
> +	.set_mode	= mtk_pextp_set_mode,
> +	.reset		= mtk_pextp_reset,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int mtk_pextp_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct phy_provider *phy_provider;
> +	struct mtk_pextp_phy *pextp;
> +	struct phy *phy;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	pextp = devm_kzalloc(&pdev->dev, sizeof(*pextp), GFP_KERNEL);
> +	if (!pextp)
> +		return -ENOMEM;
> +
> +	pextp->base = devm_of_iomap(&pdev->dev, np, 0, NULL);
> +	if (!pextp->base)
> +		return -EIO;
> +
> +	pextp->dev = &pdev->dev;
> +	pextp->clk[0] = devm_clk_get(&pdev->dev, "topxtal");
> +	if (IS_ERR(pextp->clk[0]))
> +		return PTR_ERR(pextp->clk[0]);
> +
> +	pextp->clk[1] = devm_clk_get(&pdev->dev, "xfipll");
> +	if (IS_ERR(pextp->clk[1]))
> +		return PTR_ERR(pextp->clk[1]);

And here as well.

Thanks,

Maxime


