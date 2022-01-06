Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D67FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAHRuumWo/KaO1Mg0kI6StG5AFD2lsh30BJLz+6SOEI=; b=3vN7KeVJ179yAR
	bQ/SVF30RaEFZSsPc6wn87crZVQP+6/is+qVITpiWn5NlwhnbEVJ3zocdDDJR7ZalIYirz6H307Nh
	AzNm7z7Pb6R/TDCGrpJt1K46c81qnxg6C0iy7cjoHP7TFROHSWsvnRs+IiM/RTbv02kJMJH4OHsYs
	j4Rc8Ihaz5dL7Amk/+ou65TrCFDtY3cYjhtJe+y5z4hq5Eos6+o/3bKsLCh4CoBu7DKh8T1eJI1IE
	rAjtqdB3I2jdnGsXICNwtlUEW/HfhPoK3C7i5YdYT226YzyrxOFAo/qoOpf20jO6IlyZ80UFFAqkS
	ypT0/yaX+nX32ujnBtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Ozv-00HDLz-Hn; Thu, 06 Jan 2022 09:23:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Ozs-00HDL7-Op; Thu, 06 Jan 2022 09:23:50 +0000
X-UUID: 108628c63c784bde8ea0114ea6370b34-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/+xiYN384QxD3R5EZY8Le11jJX9RporVQy83KPVgL/w=; 
 b=P9H++9pxazK1yqXWXjih9/Oe6a0UqtNy5vxpW1I2wmLvH73YlZIdJczF1ABc+la8Fsvut3rwjI/A1rW9YFqsgHV53qAG5K00ajYpCpF1ixo2SLyNVG5CNAclYPWwmnPUdn1RTz+9KGTUfqcql7ONoB8kPjklJByobYOoh+sSfCk=;
X-UUID: 108628c63c784bde8ea0114ea6370b34-20220106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1080185574; Thu, 06 Jan 2022 02:23:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 01:13:45 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 6 Jan 2022 17:13:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 17:13:43 +0800
Message-ID: <4d7195c3ac9bc63a5f980548f0c880484403346d.camel@mediatek.com>
Subject: Re: [PATCH 3/3] phy: mediatek: phy-mtk-mipi-dsi: Simplify with
 dev_err_probe()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
CC: <p.zabel@pengutronix.de>, <kishon@ti.com>, <vkoul@kernel.org>,
 <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 6 Jan 2022 17:13:43 +0800
In-Reply-To: <20220103145324.48008-3-angelogioacchino.delregno@collabora.com>
References: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
 <20220103145324.48008-3-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_012348_840300_7FB8AEE4 
X-CRM114-Status: GOOD (  15.50  )
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

On Mon, 2022-01-03 at 15:53 +0100, AngeloGioacchino Del Regno wrote:
> Use the dev_err_probe() helper to simplify error handling during
> probe.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 29 +++++++++------------
> ----
>  1 file changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> index 6f7425b0bf5b..4b77508f5241 100644
> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> @@ -148,11 +148,9 @@ static int mtk_mipi_tx_probe(struct
> platform_device *pdev)
>  		return PTR_ERR(mipi_tx->regmap);
>  
>  	ref_clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(ref_clk)) {
> -		ret = PTR_ERR(ref_clk);
> -		dev_err(dev, "Failed to get reference clock: %d\n",
> ret);
> -		return ret;
> -	}
> +	if (IS_ERR(ref_clk))
> +		return dev_err_probe(dev, PTR_ERR(ref_clk),
> +				     "Failed to get reference
> clock\n");
>  
>  	ret = of_property_read_u32(dev->of_node, "drive-strength-
> microamp",
>  				   &mipi_tx->mipitx_drive);
> @@ -172,27 +170,20 @@ static int mtk_mipi_tx_probe(struct
> platform_device *pdev)
>  
>  	ret = of_property_read_string(dev->of_node, "clock-output-
> names",
>  				      &clk_init.name);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to read clock-output-names: %d\n",
> ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read clock-
> output-names\n");
Seems no need change it here. (no EPROBE_DEFER error)

Thanks
>  
>  	clk_init.ops = mipi_tx->driver_data->mipi_tx_clk_ops;
>  
>  	mipi_tx->pll_hw.init = &clk_init;
>  	mipi_tx->pll = devm_clk_register(dev, &mipi_tx->pll_hw);
> -	if (IS_ERR(mipi_tx->pll)) {
> -		ret = PTR_ERR(mipi_tx->pll);
> -		dev_err(dev, "Failed to register PLL: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(mipi_tx->pll))
> +		return dev_err_probe(dev, PTR_ERR(mipi_tx->pll),
> "Cannot register PLL\n");
>  
>  	phy = devm_phy_create(dev, NULL, &mtk_mipi_tx_ops);
> -	if (IS_ERR(phy)) {
> -		ret = PTR_ERR(phy);
> -		dev_err(dev, "Failed to create MIPI D-PHY: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to
> create MIPI D-PHY\n");
> +
>  	phy_set_drvdata(phy, mipi_tx);
>  
>  	phy_provider = devm_of_phy_provider_register(dev,
> of_phy_simple_xlate);
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
