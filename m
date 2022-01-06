Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cib+KOKR0gDbClxXnj55zf6BydgMNscugrlz5izTpKs=; b=jzXLqCgsrgec31
	XYRwA+Od5KIkQTknVoaGHsTDMcPN+Yc3SZ43wMbYwe+cV8JA7DZUjg8R7dk06008pRo0fitZKVHSd
	Yic+sVTpinfsU53PqZHNNKqroFP/zYmUVzjFnEJS6BAdn0aihbcz/AzZ26dteWLAXGMQT7dsrLgCV
	jpTGAZoRgFoG8I+w/pACntjxgowhihcoQ53/jnGXWFTErIk1Y/z5HOjFvdbb6zOfdBN8I/KhceRDr
	uybaHzIOLG3iAWkb5LABE0a4e0DjxrIk/oqfDuXkD12eelvWI4Gx2taLcEOnYdF0daXKMTyN9qrmR
	Ea+9FNfkU4e+cTVz4iJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5P2L-00HDqV-0A; Thu, 06 Jan 2022 09:26:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5P26-00HDll-Oe; Thu, 06 Jan 2022 09:26:08 +0000
X-UUID: 77fc1c44dfce4f38887f3ed8b00b81e3-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eH9L3KJGMkXyUevDon2hvJzf4WOH6OFxrqQW0YOxtbQ=; 
 b=tWaodLF1tpw5j1UNfxB7dHBicUvA9yY4W+EVYR/33PZxm6RTBeTfW4fAeS1rEm7CTTYOlUP6KS5yd9+NxnJz/EmxFHCIPaQQ2D3xD85cboQJuDXPtLx7VbfKIxMndiLhMvJrofv36HLiWSKoirWDHktid9JV47Q9/dgqA/glzxY=;
X-UUID: 77fc1c44dfce4f38887f3ed8b00b81e3-20220106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2138184005; Thu, 06 Jan 2022 02:26:04 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 01:20:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 6 Jan 2022 17:20:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 17:20:22 +0800
Message-ID: <78652a88b24bb4c4660d7c7fa31d4dd7b9fe5a46.camel@mediatek.com>
Subject: Re: [PATCH 4/4] phy: mediatek: phy-mtk-hdmi: Simplify with
 dev_err_probe()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
CC: <p.zabel@pengutronix.de>, <kishon@ti.com>, <vkoul@kernel.org>,
 <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 6 Jan 2022 17:20:22 +0800
In-Reply-To: <20220103153055.50473-4-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
 <20220103153055.50473-4-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_012606_828177_94448A27 
X-CRM114-Status: GOOD (  16.25  )
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

On Mon, 2022-01-03 at 16:30 +0100, AngeloGioacchino Del Regno wrote:
> Use the dev_err_probe() helper to simplify error handling during
> probe.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/phy-mtk-hdmi.c | 50 +++++++++++--------------
> ----
>  1 file changed, 19 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c
> b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index e037fa89696c..4f40a6eea004 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -104,20 +104,16 @@ static int mtk_hdmi_phy_probe(struct
> platform_device *pdev)
>  		return PTR_ERR(hdmi_phy->regmap);
>  
>  	ref_clk = devm_clk_get(dev, "pll_ref");
> -	if (IS_ERR(ref_clk)) {
> -		ret = PTR_ERR(ref_clk);
> -		dev_err(&pdev->dev, "Failed to get PLL reference clock:
> %d\n",
> -			ret);
> -		return ret;
> -	}
> +	if (IS_ERR(ref_clk))
> +		return dev_err_probe(dev, PTR_ERR(ref_clk),
> +				     "Failed to get PLL reference
> clock\n");
> +
>  	ref_clk_name = __clk_get_name(ref_clk);
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
Seems no need change it if no EPROBE_DEFER happens

>  
>  	hdmi_phy->dev = dev;
>  	hdmi_phy->conf =
> @@ -125,25 +121,19 @@ static int mtk_hdmi_phy_probe(struct
> platform_device *pdev)
>  	mtk_hdmi_phy_clk_get_data(hdmi_phy, &clk_init);
>  	hdmi_phy->pll_hw.init = &clk_init;
>  	hdmi_phy->pll = devm_clk_register(dev, &hdmi_phy->pll_hw);
> -	if (IS_ERR(hdmi_phy->pll)) {
> -		ret = PTR_ERR(hdmi_phy->pll);
> -		dev_err(dev, "Failed to register PLL: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(hdmi_phy->pll))
> +		return dev_err_probe(dev, PTR_ERR(hdmi_phy->pll),
> +				    "Failed to register PLL\n");
>  
>  	ret = of_property_read_u32(dev->of_node, "mediatek,ibias",
>  				   &hdmi_phy->ibias);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to get ibias: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get
> ibias\n");
ditto

Thanks
>  
>  	ret = of_property_read_u32(dev->of_node, "mediatek,ibias_up",
>  				   &hdmi_phy->ibias_up);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to get ibias up: %d\n",
> ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get
> ibias_up\n");
>  
>  	dev_info(dev, "Using default TX DRV impedance: 4.2k/36\n");
>  	hdmi_phy->drv_imp_clk = 0x30;
> @@ -152,17 +142,15 @@ static int mtk_hdmi_phy_probe(struct
> platform_device *pdev)
>  	hdmi_phy->drv_imp_d0 = 0x30;
>  
>  	phy = devm_phy_create(dev, NULL,
> mtk_hdmi_phy_dev_get_ops(hdmi_phy));
> -	if (IS_ERR(phy)) {
> -		dev_err(dev, "Failed to create HDMI PHY\n");
> -		return PTR_ERR(phy);
> -	}
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy), "Cannot create
> HDMI PHY\n");
> +
>  	phy_set_drvdata(phy, hdmi_phy);
>  
>  	phy_provider = devm_of_phy_provider_register(dev,
> of_phy_simple_xlate);
> -	if (IS_ERR(phy_provider)) {
> -		dev_err(dev, "Failed to register HDMI PHY\n");
> -		return PTR_ERR(phy_provider);
> -	}
> +	if (IS_ERR(phy_provider))
> +		return dev_err_probe(dev, PTR_ERR(phy_provider),
> +				     "Failed to register HDMI PHY\n");
>  
>  	if (hdmi_phy->conf->pll_default_off)
>  		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
