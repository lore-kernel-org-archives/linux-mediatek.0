Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92851C28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fu3+nvZCtlQeQjZi1uoP255PlytlnsMs5iHFh7gM8m8=; b=hDcmMo16DylgYN
	j47ZqfPJy8NOIqZyrptEb2dGBigUvncKdKwZfZ6KjOT2qSW0ZX42UMVNfqoG5nTqMLYbDxFnxYm49
	ytSZj2V4FbB1SAmZ5gtLpmdFEVwLXW14yW4lqQuNFmgISzmBYdiQABZTPOCwYSqfmTwhlH0Qq6QSb
	Cf58eFF+GU21Nwk26+4vn8mJHb/ji60s9SuyBME+4YxW3KZw0+XnDTVetgesDgXl71TyqYYB65qQ/
	vFug267ybOFKQ6OsySdSU0+qg7mlVKRfkCr3ujjkKZg7eyxk8Dj6WjI2ZR8KiTayjujuBgKikue0w
	wDNjPBeOFk0qGWI88QjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCdyM-00Amu9-OW; Wed, 26 Jan 2022 08:48:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCdxz-00AmqP-Ja; Wed, 26 Jan 2022 08:47:49 +0000
X-UUID: a249dcafe8144dc28e91b5f8a3326745-20220126
X-UUID: a249dcafe8144dc28e91b5f8a3326745-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1729693130; Wed, 26 Jan 2022 01:47:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 00:40:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 26 Jan 2022 16:40:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 16:40:33 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 30/31] clk: mediatek: mt8195: Implement remove functions
Date: Wed, 26 Jan 2022 16:40:33 +0800
Message-ID: <20220126084033.20234-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-31-wenst@chromium.org>
References: <20220122091731.283592-31-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_004747_682105_1F230B65 
X-CRM114-Status: GOOD (  23.37  )
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

> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so none of the drivers implemented remove
> functions.
> 
> Now that the library does have APIs to unregister clks, use them
> to implement remove functions for the mt8195 clk drivers.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 16 ++++++++++++++++
>  drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 13 +++++++++++++
>  drivers/clk/mediatek/clk-mt8195-topckgen.c   | 20 ++++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8195-vdo0.c       | 16 ++++++++++++++++
>  drivers/clk/mediatek/clk-mt8195-vdo1.c       | 16 ++++++++++++++++
>  5 files changed, 81 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> index af8d80f25f30..29cac3cf5f53 100644
> --- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> @@ -132,6 +132,8 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_gates;
>  
> +	platform_set_drvdata(pdev, clk_data);
> +
>  	return r;
>  
>  unregister_gates:
> @@ -143,8 +145,22 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
>  	return r;
>  }
>  
> +static int clk_mt8195_apmixed_remove(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
> +	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
> +	mtk_free_clk_data(clk_data);
> +
> +	return 0;
> +}
> +
>  static struct platform_driver clk_mt8195_apmixed_drv = {
>  	.probe = clk_mt8195_apmixed_probe,
> +	.remove = clk_mt8195_apmixed_remove,
>  	.driver = {
>  		.name = "clk-mt8195-apmixed",
>  		.of_match_table = of_match_clk_mt8195_apmixed,
> diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
> index 1fff6f3d2dc7..8cd88dfc3283 100644
> --- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
> +++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
> @@ -85,6 +85,18 @@ static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
>  	return r;
>  }
>  
> +static int clk_mt8195_apusys_pll_remove(struct platform_device *pdev)
> +{
> +	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
> +	struct device_node *node = pdev->dev.of_node;
> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
> +	mtk_free_clk_data(clk_data);
> +
> +	return 0;
> +}
> +
>  static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
>  	{ .compatible = "mediatek,mt8195-apusys_pll", },
>  	{}
> @@ -92,6 +104,7 @@ static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
>  
>  static struct platform_driver clk_mt8195_apusys_pll_drv = {
>  	.probe = clk_mt8195_apusys_pll_probe,
> +	.remove = clk_mt8195_apusys_pll_remove,
>  	.driver = {
>  		.name = "clk-mt8195-apusys_pll",
>  		.of_match_table = of_match_clk_mt8195_apusys_pll,
> diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> index 3631f49a5e5a..b602fcd7f1d1 100644
> --- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
> +++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
> @@ -1271,6 +1271,8 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_gates;
>  
> +	platform_set_drvdata(pdev, top_clk_data);
> +
>  	return r;
>  
>  unregister_gates:
> @@ -1290,8 +1292,26 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
>  	return r;
>  }
>  
> +static int clk_mt8195_topck_remove(struct platform_device *pdev)
> +{
> +	struct clk_onecell_data *top_clk_data = platform_get_drvdata(pdev);
> +	struct device_node *node = pdev->dev.of_node;
> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
> +	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
> +	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
> +	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
> +	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
> +	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
> +	mtk_free_clk_data(top_clk_data);
> +
> +	return 0;
> +}
> +
>  static struct platform_driver clk_mt8195_topck_drv = {
>  	.probe = clk_mt8195_topck_probe,
> +	.remove = clk_mt8195_topck_remove,
>  	.driver = {
>  		.name = "clk-mt8195-topck",
>  		.of_match_table = of_match_clk_mt8195_topck,
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
> index af34eb564b1d..3bc7ed19d550 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
> @@ -107,6 +107,8 @@ static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_gates;
>  
> +	platform_set_drvdata(pdev, clk_data);
> +
>  	return r;
>  
>  unregister_gates:
> @@ -116,8 +118,22 @@ static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
>  	return r;
>  }
>  
> +static int clk_mt8195_vdo0_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_gates(vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
> +	mtk_free_clk_data(clk_data);
> +
> +	return 0;
> +}
> +
>  static struct platform_driver clk_mt8195_vdo0_drv = {
>  	.probe = clk_mt8195_vdo0_probe,
> +	.remove = clk_mt8195_vdo0_remove,
>  	.driver = {
>  		.name = "clk-mt8195-vdo0",
>  	},
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
> index 6b502bbc730c..90c738a85ff1 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
> @@ -124,6 +124,8 @@ static int clk_mt8195_vdo1_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_gates;
>  
> +	platform_set_drvdata(pdev, clk_data);
> +
>  	return r;
>  
>  unregister_gates:
> @@ -133,8 +135,22 @@ static int clk_mt8195_vdo1_probe(struct platform_device *pdev)
>  	return r;
>  }
>  
> +static int clk_mt8195_vdo1_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
> +	mtk_free_clk_data(clk_data);
> +
> +	return 0;
> +}
> +
>  static struct platform_driver clk_mt8195_vdo1_drv = {
>  	.probe = clk_mt8195_vdo1_probe,
> +	.remove = clk_mt8195_vdo1_remove,
>  	.driver = {
>  		.name = "clk-mt8195-vdo1",
>  	},
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
