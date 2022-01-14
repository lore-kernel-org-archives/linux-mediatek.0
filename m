Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4949BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 05:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wk6gUw9+RHmtooGbV4Q19YTr9jgSZ/1pcf2o7U+2a1c=; b=PWsJ+pknKTipYQ
	NMNqaIS4NjW9Ber8Y2wjcqzC4N7Rt8q4AnKd4KtIxaFWVCu0z8TksBPPwmW/+6EQDq3/+m9O7jMrF
	9FTr72j6NQsD23mhujlAdPdWiCLAeWLNyOuSl3hHNVOXtCuT74pcGHLBI+NvwJcJTyme3JDD/NXgK
	yRox96neJ1lzAKw3yqGhkcbwejOszObC7cP9SvuAWneHVl8aIouCALdLCGCuOHAiLwUyHbgLPcKg6
	ofSoOear0R6Lzq16AUXLwlTjrXWdsvUI5tflVwwZJdSGy44EBYeeNmcxwbCOQr5frdpWjl5N5snxV
	wfExZ3pSCCWAvU6+b/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8FDk-007n7V-Ow; Fri, 14 Jan 2022 05:33:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8FDf-007n6S-UT; Fri, 14 Jan 2022 05:33:51 +0000
X-UUID: caa3ad13d4304a08b3eae420c7a4420f-20220113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6b8CLBsmlkhgiY+5azRM0Qi+2KbPdCZ/5JvErjoDd4A=; 
 b=hjohw8FW2SAv0AwFQF0cjaLwMOQTsKFqPbX8lS7KTlcfukRk7PC8NDRf+X29RV8mPvzFaNq7CUTUyek/9WATxoHp6JwW0KenMPd0s/mmluZTC0IvQinCRKP5f1+iT5Kwq9yf86KED9C3xKXlWrHQWV2UDgSK+hoXljulGv4gwvA=;
X-UUID: caa3ad13d4304a08b3eae420c7a4420f-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1002519099; Thu, 13 Jan 2022 22:33:43 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 21:32:05 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 14 Jan 2022 13:32:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 13:32:02 +0800
Message-ID: <6e75de8187b276f54c8673ccd708b299614bc5c3.camel@mediatek.com>
Subject: Re: [PATCH 3/3] phy: mediatek: phy-mtk-mipi-dsi: Simplify with
 dev_err_probe()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
CC: <p.zabel@pengutronix.de>, <kishon@ti.com>, <vkoul@kernel.org>,
 <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 14 Jan 2022 13:32:02 +0800
In-Reply-To: <ba6c0163-fc5f-2a5f-560d-240e5fe2c3c4@collabora.com>
References: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
 <20220103145324.48008-3-angelogioacchino.delregno@collabora.com>
 <4d7195c3ac9bc63a5f980548f0c880484403346d.camel@mediatek.com>
 <ba6c0163-fc5f-2a5f-560d-240e5fe2c3c4@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_213349_401783_036CF1C7 
X-CRM114-Status: GOOD (  21.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-01-07 at 10:23 +0100, AngeloGioacchino Del Regno wrote:
> Il 06/01/22 10:13, Chunfeng Yun ha scritto:
> > On Mon, 2022-01-03 at 15:53 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Use the dev_err_probe() helper to simplify error handling during
> > > probe.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 29 +++++++++---------
> > > ---
> > > ----
> > >   1 file changed, 10 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > > b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > > index 6f7425b0bf5b..4b77508f5241 100644
> > > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > > @@ -148,11 +148,9 @@ static int mtk_mipi_tx_probe(struct
> > > platform_device *pdev)
> > >   		return PTR_ERR(mipi_tx->regmap);
> > >   
> > >   	ref_clk = devm_clk_get(dev, NULL);
> > > -	if (IS_ERR(ref_clk)) {
> > > -		ret = PTR_ERR(ref_clk);
> > > -		dev_err(dev, "Failed to get reference clock: %d\n",
> > > ret);
> > > -		return ret;
> > > -	}
> > > +	if (IS_ERR(ref_clk))
> > > +		return dev_err_probe(dev, PTR_ERR(ref_clk),
> > > +				     "Failed to get reference
> > > clock\n");
> > >   
> > >   	ret = of_property_read_u32(dev->of_node, "drive-
> > > strength-
> > > microamp",
> > >   				   &mipi_tx->mipitx_drive);
> > > @@ -172,27 +170,20 @@ static int mtk_mipi_tx_probe(struct
> > > platform_device *pdev)
> > >   
> > >   	ret = of_property_read_string(dev->of_node, "clock-
> > > output-
> > > names",
> > >   				      &clk_init.name);
> > > -	if (ret < 0) {
> > > -		dev_err(dev, "Failed to read clock-output-names: %d\n",
> > > ret);
> > > -		return ret;
> > > -	}
> > > +	if (ret < 0)
> > > +		return dev_err_probe(dev, ret, "Failed to read clock-
> > > output-names\n");
> > 
> > Seems no need change it here. (no EPROBE_DEFER error)
> > 
> 
> Hello Chunfeng,
> 
> pasting from kernel driver-api infrastructure guidelines:
> 
> [...]Note that it is deemed acceptable to use this function for error
> prints during 
> probe even if the err is known to never be -EPROBE_DEFER. The benefit
> compared to a 
> normal dev_err() is the standardized format of the error code and the
> fact that the 
> error code is returned.
> 
> https://www.kernel.org/doc/html/latest/driver-api/infrastructure.html
> 
Got it, thanks a lot:)

> Regards,
> - Angelo
> 
> > Thanks
> > >   
> > >   	clk_init.ops = mipi_tx->driver_data->mipi_tx_clk_ops;
> > >   
> > >   	mipi_tx->pll_hw.init = &clk_init;
> > >   	mipi_tx->pll = devm_clk_register(dev, &mipi_tx-
> > > >pll_hw);
> > > -	if (IS_ERR(mipi_tx->pll)) {
> > > -		ret = PTR_ERR(mipi_tx->pll);
> > > -		dev_err(dev, "Failed to register PLL: %d\n", ret);
> > > -		return ret;
> > > -	}
> > > +	if (IS_ERR(mipi_tx->pll))
> > > +		return dev_err_probe(dev, PTR_ERR(mipi_tx->pll),
> > > "Cannot register PLL\n");
> > >   
> > >   	phy = devm_phy_create(dev, NULL, &mtk_mipi_tx_ops);
> > > -	if (IS_ERR(phy)) {
> > > -		ret = PTR_ERR(phy);
> > > -		dev_err(dev, "Failed to create MIPI D-PHY: %d\n", ret);
> > > -		return ret;
> > > -	}
> > > +	if (IS_ERR(phy))
> > > +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to
> > > create MIPI D-PHY\n");
> > > +
> > >   	phy_set_drvdata(phy, mipi_tx);
> > >   
> > >   	phy_provider = devm_of_phy_provider_register(dev,
> > > of_phy_simple_xlate);
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
