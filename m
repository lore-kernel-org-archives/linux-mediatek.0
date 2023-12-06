Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F7CC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4y+flM2aoike/FPH6qr4fSM5H3yUCAUYtHfykcYhVEk=; b=vC9jqIAP8lPWgNytkzaWG6CMwP
	W1ObmsplB1BwN1lPA9XtPRnpRzEZ1+7vWxLRxH8xRKvUBk8TEeEUy2lK5ykvReXNeYcrA/oF77H/t
	KFuZQVLtZ/VN6+5UI19L1w3efvnIEfsruJojzVWYhfLuQjduURuJv+83eXCnPrx1MYzAl4ziZjNDZ
	gs+wplNwAkSzVWHpnAxd7ZTFCvY+NkELVLRRolqBHD1o8ERtSJeYOT3r925WL6WV/JCRmPWB4uEp/
	K+1DuQPkbw/rojkScZsMVFv6FgTFow21JCarf7BSXCzOdkdYe0ObspL3ORNcKfVAjZm3dTpc77lbs
	7och6ZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoMd-009a5u-0L;
	Wed, 06 Dec 2023 09:38:43 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoMZ-009a4H-31;
	Wed, 06 Dec 2023 09:38:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AE831C000C;
	Wed,  6 Dec 2023 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701855512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4y+flM2aoike/FPH6qr4fSM5H3yUCAUYtHfykcYhVEk=;
	b=k3xwGbvc8l51DdwhCNNogPX2i1UK8RjJkiIGiGaX0/DJVE/mlb7iIDCQUJX7b0YZt7Pyrz
	ol/ktsBWk+HKKJ9KtMnbWNEZbsDwzAZarfZ8Tvw7RKPgjQfRyvZTdgdh2dzaknhZgnsGPc
	CYNBqpr0zllwndP39wsFuYC0BUL1s/YeutbzFu7W1iQ/r2FAd2DGfueucoeZnU4UGzcbUd
	DKRseSOSfCmYsxVvS2QS2Ef4WcQCfq6MI2Adx2ZJCp2z/Rr7ilVlDANz8ZYN4LzE2Yf7ZG
	sRDfl+Qr214EPqeEauGxYkj4Y7YZqozG5zfnFxtxI9jLhBh5pkCvFanPbMffsQ==
Date: Wed, 6 Dec 2023 10:38:26 +0100
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
Subject: Re: [RFC PATCH v2 3/8] net: pcs: pcs-mtk-lynxi: add platform driver
 for MT7988
Message-ID: <20231206103826.4e396513@device.home>
In-Reply-To: <68bb81ac6bf99393c8de256f42e5715626590af8.1701826319.git.daniel@makrotopia.org>
References: <cover.1701826319.git.daniel@makrotopia.org>
	<68bb81ac6bf99393c8de256f42e5715626590af8.1701826319.git.daniel@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_013840_260714_CAB9B871 
X-CRM114-Status: GOOD (  16.07  )
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

My two cents below :

On Wed, 6 Dec 2023 01:44:17 +0000
Daniel Golle <daniel@makrotopia.org> wrote:

> Introduce a proper platform MFD driver for the LynxI (H)SGMII PCS which
> is going to initially be used for the MT7988 SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

 [ ... ]

> +static int mtk_pcs_lynxi_enable(struct phylink_pcs *pcs)
> +{
> +	struct mtk_pcs_lynxi *mpcs = pcs_to_mtk_pcs_lynxi(pcs);
> +
> +	if (mpcs->sgmii_tx && mpcs->sgmii_rx) {
> +		clk_prepare_enable(mpcs->sgmii_rx);
> +		clk_prepare_enable(mpcs->sgmii_tx);

You can use the clk_bulk_prepare_enable() here

> +	}
> +
> +	return 0;
> +}
> +
>  static void mtk_pcs_lynxi_disable(struct phylink_pcs *pcs)
>  {
>  	struct mtk_pcs_lynxi *mpcs = pcs_to_mtk_pcs_lynxi(pcs);
>  
> +	regmap_set_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
> +
> +	if (mpcs->sgmii_tx && mpcs->sgmii_rx) {
> +		clk_disable_unprepare(mpcs->sgmii_tx);
> +		clk_disable_unprepare(mpcs->sgmii_rx);

and clk_bulk_disable_unprepare() here

 [...]

> +static int mtk_pcs_lynxi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct mtk_pcs_lynxi *mpcs;
> +	struct phylink_pcs *pcs;
> +	struct regmap *regmap;
> +	u32 flags = 0;
> +
> +	mpcs = devm_kzalloc(dev, sizeof(*mpcs), GFP_KERNEL);
> +	if (!mpcs)
> +		return -ENOMEM;
> +
> +	regmap = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	if (of_property_read_bool(np->parent, "mediatek,pnswap"))
> +		flags |= MTK_SGMII_FLAG_PN_SWAP;
> +
> +	mpcs->rstc = of_reset_control_get_shared(np->parent, NULL);
> +	if (IS_ERR(mpcs->rstc))
> +		return PTR_ERR(mpcs->rstc);
> +
> +	reset_control_deassert(mpcs->rstc);
> +	mpcs->sgmii_sel = devm_clk_get_enabled(dev, "sgmii_sel");
> +	if (IS_ERR(mpcs->sgmii_sel))
> +		return PTR_ERR(mpcs->sgmii_sel);
> +
> +	mpcs->sgmii_rx = devm_clk_get(dev, "sgmii_rx");
> +	if (IS_ERR(mpcs->sgmii_rx))
> +		return PTR_ERR(mpcs->sgmii_rx);
> +
> +	mpcs->sgmii_tx = devm_clk_get(dev, "sgmii_tx");
> +	if (IS_ERR(mpcs->sgmii_tx))
> +		return PTR_ERR(mpcs->sgmii_tx);

and clk bulk operations here as well ?

Maxime

