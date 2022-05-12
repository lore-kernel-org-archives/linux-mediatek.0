Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OfUCg/bGZlxaihFbKNEyWX3vJtmTy3xobt0Wd3kit04=; b=yz+2CHXYyO9nes
	0frPADzXVzMo/xBt4EWyy9OBdldLFEDAnS3zR5S8lsFghwlh7ruwXna3z9+8Ejl3+WpWXYomVRH5Y
	/kaAwiosI1yXDCvn+UArJ+Nc+XAh8KT21Vxz0TNtJHDjDt3Ca/j+1o1Z7keP3BlQg8SXMx7aEnbCv
	C9vg/4Yj6P2k1waBXf4e7bwIpgkBJUjvWXAYabyNhuVw9pIg0rwqAYAtgc+0jeEREj5yQkKu3kifd
	dzK3aL45dvlkrdhnK+KCJbvA8K+iRIZXHMIQL0CfKa8eyvgXuETRMRMPVGfWmVsb5bOn5NEmJgAg4
	9Iz2pAwMAr+G8O4MaFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAG4-00CWw5-94; Thu, 12 May 2022 14:57:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAFz-00CWvS-S3; Thu, 12 May 2022 14:57:38 +0000
X-UUID: 4d1cebeb9aaa4c8caa1ecd65be6bac65-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:54b2b840-8916-4145-b98f-1c90fdda5218, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:51cb14a7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,File:nil,QS:0,BEC:ni
 l
X-UUID: 4d1cebeb9aaa4c8caa1ecd65be6bac65-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1474513226; Thu, 12 May 2022 07:57:30 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 07:49:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 22:49:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 May 2022 22:49:24 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <rex-bc.chen@mediatek.com>, <sboyd@kernel.org>
Subject: Re: [PATCH v2 05/11] clk: mediatek: mt27xx: Replace 'struct clk' with
 'struct clk_hw'
Date: Thu, 12 May 2022 22:49:24 +0800
Message-ID: <20220512144924.4114-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220510104804.544597-6-wenst@chromium.org>
References: <20220510104804.544597-6-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_075735_944669_BF9FC641 
X-CRM114-Status: GOOD (  19.46  )
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

>  static int clk_mt2701_bdp_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -110,7 +110,7 @@ static int clk_mt2701_bdp_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, bdp_clks, ARRAY_SIZE(bdp_clks),
>  						clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);

We have of_clk_add_provider() and of_clk_add_hw_provider() the same time,
so we can convert of_clk_add_provider to of_clk_add_hw_provider by 2xxx, 6xxx, 8xxx,
without introducing build breaks.

However, there is no mtk_alloc_hw_clk_data() for mtk_alloc_clk_data() in [1]. (03/11 in this series).
For bisectability, patch 3~8 should be one patch, or we should have mtk_alloc_hw_clk_data()
to help us?

[1] https://lore.kernel.org/lkml/20220510104804.544597-4-wenst@chromium.org/

thanks,
Miles
>  	if (r)
>  		dev_err(&pdev->dev,
>  			"could not register clock provider: %s: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2701-eth.c b/drivers/clk/mediatek/clk-mt2701-eth.c
> index 100ff6ca609e..47c2289f3d1d 100644
> --- a/drivers/clk/mediatek/clk-mt2701-eth.c
> +++ b/drivers/clk/mediatek/clk-mt2701-eth.c
> @@ -43,7 +43,7 @@ static const struct of_device_id of_match_clk_mt2701_eth[] = {
>  
>  static int clk_mt2701_eth_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -52,7 +52,7 @@ static int clk_mt2701_eth_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, eth_clks, ARRAY_SIZE(eth_clks),
>  						clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
>  		dev_err(&pdev->dev,
>  			"could not register clock provider: %s: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2701-g3d.c b/drivers/clk/mediatek/clk-mt2701-g3d.c
> index 1328c112a38f..79929ed37f83 100644
> --- a/drivers/clk/mediatek/clk-mt2701-g3d.c
> +++ b/drivers/clk/mediatek/clk-mt2701-g3d.c
> @@ -37,7 +37,7 @@ static const struct mtk_gate g3d_clks[] = {
>  
>  static int clk_mt2701_g3dsys_init(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	struct device_node *node = pdev->dev.of_node;
>  	int r;
>  
> @@ -46,7 +46,7 @@ static int clk_mt2701_g3dsys_init(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, g3d_clks, ARRAY_SIZE(g3d_clks),
>  			       clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
>  		dev_err(&pdev->dev,
>  			"could not register clock provider: %s: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2701-hif.c b/drivers/clk/mediatek/clk-mt2701-hif.c
> index 61444881c539..1aa36cb93ad0 100644
> --- a/drivers/clk/mediatek/clk-mt2701-hif.c
> +++ b/drivers/clk/mediatek/clk-mt2701-hif.c
> @@ -40,7 +40,7 @@ static const struct of_device_id of_match_clk_mt2701_hif[] = {
>  
>  static int clk_mt2701_hif_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -49,7 +49,7 @@ static int clk_mt2701_hif_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, hif_clks, ARRAY_SIZE(hif_clks),
>  						clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r) {
>  		dev_err(&pdev->dev,
>  			"could not register clock provider: %s: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2701-img.c b/drivers/clk/mediatek/clk-mt2701-img.c
> index 631e80f0fc7d..c4f3cd26df60 100644
> --- a/drivers/clk/mediatek/clk-mt2701-img.c
> +++ b/drivers/clk/mediatek/clk-mt2701-img.c
> @@ -43,7 +43,7 @@ static const struct of_device_id of_match_clk_mt2701_img[] = {
>  
>  static int clk_mt2701_img_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -52,7 +52,7 @@ static int clk_mt2701_img_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks),
>  						clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
>  		dev_err(&pdev->dev,
>  			"could not register clock provider: %s: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2701-mm.c b/drivers/clk/mediatek/clk-mt2701-mm.c
> index cb18e1849492..9ea7abad99d2 100644
> --- a/drivers/clk/mediatek/clk-mt2701-mm.c
> +++ b/drivers/clk/mediatek/clk-mt2701-mm.c
> @@ -83,7 +83,7 @@ static int clk_mt2701_mm_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *node = dev->parent->of_node;
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  
>  	clk_data = mtk_alloc_clk_data(CLK_MM_NR);
> @@ -91,7 +91,7 @@ static int clk_mt2701_mm_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
>  						clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
>  		dev_err(&pdev->dev,
>  			"could not register clock provider: %s: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2701-vdec.c b/drivers/clk/mediatek/clk-mt2701-vdec.c
> index c9def728ad1e..a2f18117f27a 100644
> --- a/drivers/clk/mediatek/clk-mt2701-vdec.c
> +++ b/drivers/clk/mediatek/clk-mt2701-vdec.c
> @@ -54,7 +54,7 @@ static const struct of_device_id of_match_clk_mt2701_vdec[] = {
>  
>  static int clk_mt2701_vdec_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -63,7 +63,7 @@ static int clk_mt2701_vdec_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, vdec_clks, ARRAY_SIZE(vdec_clks),
>  						clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
>  		dev_err(&pdev->dev,
>  			"could not register clock provider: %s: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
> index 1eb3e4563c3f..7a4331057adc 100644
> --- a/drivers/clk/mediatek/clk-mt2701.c
> +++ b/drivers/clk/mediatek/clk-mt2701.c
> @@ -666,7 +666,7 @@ static const struct mtk_gate top_clks[] = {
>  
>  static int mtk_topckgen_init(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	void __iomem *base;
>  	struct device_node *node = pdev->dev.of_node;
>  	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -692,7 +692,7 @@ static int mtk_topckgen_init(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
>  						clk_data);
>  
> -	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  }
>  
>  static const struct mtk_gate_regs infra_cg_regs = {
> @@ -735,7 +735,7 @@ static const struct mtk_fixed_factor infra_fixed_divs[] = {
>  	FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
>  };
>  
> -static struct clk_onecell_data *infra_clk_data;
> +static struct clk_hw_onecell_data *infra_clk_data;
>  
>  static void __init mtk_infrasys_init_early(struct device_node *node)
>  {
> @@ -745,7 +745,7 @@ static void __init mtk_infrasys_init_early(struct device_node *node)
>  		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
>  
>  		for (i = 0; i < CLK_INFRA_NR; i++)
> -			infra_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
> +			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
>  	}
>  
>  	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
> @@ -754,7 +754,8 @@ static void __init mtk_infrasys_init_early(struct device_node *node)
>  	mtk_clk_register_cpumuxes(node, cpu_muxes, ARRAY_SIZE(cpu_muxes),
>  				  infra_clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, infra_clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
> +				   infra_clk_data);
>  	if (r)
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> @@ -771,8 +772,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
>  		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
>  	} else {
>  		for (i = 0; i < CLK_INFRA_NR; i++) {
> -			if (infra_clk_data->clks[i] == ERR_PTR(-EPROBE_DEFER))
> -				infra_clk_data->clks[i] = ERR_PTR(-ENOENT);
> +			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
> +				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
>  		}
>  	}
>  
> @@ -781,7 +782,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
>  	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
>  						infra_clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, infra_clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
> +				   infra_clk_data);
>  	if (r)
>  		return r;
>  
> @@ -886,7 +888,7 @@ static const struct mtk_composite peri_muxs[] = {
>  
>  static int mtk_pericfg_init(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	void __iomem *base;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
> @@ -904,7 +906,7 @@ static int mtk_pericfg_init(struct platform_device *pdev)
>  	mtk_clk_register_composites(peri_muxs, ARRAY_SIZE(peri_muxs), base,
>  			&mt2701_clk_lock, clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
>  		return r;
>  
> @@ -969,7 +971,7 @@ static const struct mtk_fixed_factor apmixed_fixed_divs[] = {
>  
>  static int mtk_apmixedsys_init(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	struct device_node *node = pdev->dev.of_node;
>  
>  	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR);
> @@ -981,7 +983,7 @@ static int mtk_apmixedsys_init(struct platform_device *pdev)
>  	mtk_clk_register_factors(apmixed_fixed_divs, ARRAY_SIZE(apmixed_fixed_divs),
>  								clk_data);
>  
> -	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  }
>  
>  static const struct of_device_id of_match_clk_mt2701[] = {
> diff --git a/drivers/clk/mediatek/clk-mt2712-bdp.c b/drivers/clk/mediatek/clk-mt2712-bdp.c
> index a200714001d8..9acab4357133 100644
> --- a/drivers/clk/mediatek/clk-mt2712-bdp.c
> +++ b/drivers/clk/mediatek/clk-mt2712-bdp.c
> @@ -60,7 +60,7 @@ static const struct mtk_gate bdp_clks[] = {
>  
>  static int clk_mt2712_bdp_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -69,7 +69,7 @@ static int clk_mt2712_bdp_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, bdp_clks, ARRAY_SIZE(bdp_clks),
>  			clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2712-img.c b/drivers/clk/mediatek/clk-mt2712-img.c
> index 89b2a7197b02..5cc143e65e42 100644
> --- a/drivers/clk/mediatek/clk-mt2712-img.c
> +++ b/drivers/clk/mediatek/clk-mt2712-img.c
> @@ -38,7 +38,7 @@ static const struct mtk_gate img_clks[] = {
>  
>  static int clk_mt2712_img_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -47,7 +47,7 @@ static int clk_mt2712_img_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks),
>  			clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2712-jpgdec.c b/drivers/clk/mediatek/clk-mt2712-jpgdec.c
> index 58813c38ab4d..31fc30370d98 100644
> --- a/drivers/clk/mediatek/clk-mt2712-jpgdec.c
> +++ b/drivers/clk/mediatek/clk-mt2712-jpgdec.c
> @@ -34,7 +34,7 @@ static const struct mtk_gate jpgdec_clks[] = {
>  
>  static int clk_mt2712_jpgdec_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -43,7 +43,7 @@ static int clk_mt2712_jpgdec_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, jpgdec_clks, ARRAY_SIZE(jpgdec_clks),
>  			clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2712-mfg.c b/drivers/clk/mediatek/clk-mt2712-mfg.c
> index a6b827db17bc..a4d09675bf18 100644
> --- a/drivers/clk/mediatek/clk-mt2712-mfg.c
> +++ b/drivers/clk/mediatek/clk-mt2712-mfg.c
> @@ -33,7 +33,7 @@ static const struct mtk_gate mfg_clks[] = {
>  
>  static int clk_mt2712_mfg_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -42,7 +42,7 @@ static int clk_mt2712_mfg_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, mfg_clks, ARRAY_SIZE(mfg_clks),
>  			clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2712-mm.c b/drivers/clk/mediatek/clk-mt2712-mm.c
> index 5519c3d68c1f..7d44b09b8a0a 100644
> --- a/drivers/clk/mediatek/clk-mt2712-mm.c
> +++ b/drivers/clk/mediatek/clk-mt2712-mm.c
> @@ -130,7 +130,7 @@ static int clk_mt2712_mm_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *node = dev->parent->of_node;
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  
>  	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> @@ -138,7 +138,7 @@ static int clk_mt2712_mm_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
>  			clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2712-vdec.c b/drivers/clk/mediatek/clk-mt2712-vdec.c
> index 4987ad9d3b11..af13f43dd831 100644
> --- a/drivers/clk/mediatek/clk-mt2712-vdec.c
> +++ b/drivers/clk/mediatek/clk-mt2712-vdec.c
> @@ -52,7 +52,7 @@ static const struct mtk_gate vdec_clks[] = {
>  
>  static int clk_mt2712_vdec_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -61,7 +61,7 @@ static int clk_mt2712_vdec_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, vdec_clks, ARRAY_SIZE(vdec_clks),
>  			clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2712-venc.c b/drivers/clk/mediatek/clk-mt2712-venc.c
> index 07c29daa1ad6..abc08a029753 100644
> --- a/drivers/clk/mediatek/clk-mt2712-venc.c
> +++ b/drivers/clk/mediatek/clk-mt2712-venc.c
> @@ -35,7 +35,7 @@ static const struct mtk_gate venc_clks[] = {
>  
>  static int clk_mt2712_venc_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -44,7 +44,7 @@ static int clk_mt2712_venc_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, venc_clks, ARRAY_SIZE(venc_clks),
>  			clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
> index ff72b9ab945b..1dd90d9a70ac 100644
> --- a/drivers/clk/mediatek/clk-mt2712.c
> +++ b/drivers/clk/mediatek/clk-mt2712.c
> @@ -1260,7 +1260,7 @@ static const struct mtk_pll_data plls[] = {
>  
>  static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -1268,7 +1268,7 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
>  
>  	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> @@ -1277,7 +1277,7 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
>  	return r;
>  }
>  
> -static struct clk_onecell_data *top_clk_data;
> +static struct clk_hw_onecell_data *top_clk_data;
>  
>  static void clk_mt2712_top_init_early(struct device_node *node)
>  {
> @@ -1287,13 +1287,13 @@ static void clk_mt2712_top_init_early(struct device_node *node)
>  		top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
>  
>  		for (i = 0; i < CLK_TOP_NR_CLK; i++)
> -			top_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
> +			top_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
>  	}
>  
>  	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs),
>  			top_clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, top_clk_data);
>  	if (r)
>  		pr_err("%s(): could not register clock provider: %d\n",
>  			__func__, r);
> @@ -1318,8 +1318,8 @@ static int clk_mt2712_top_probe(struct platform_device *pdev)
>  		top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
>  	} else {
>  		for (i = 0; i < CLK_TOP_NR_CLK; i++) {
> -			if (top_clk_data->clks[i] == ERR_PTR(-EPROBE_DEFER))
> -				top_clk_data->clks[i] = ERR_PTR(-ENOENT);
> +			if (top_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
> +				top_clk_data->hws[i] = ERR_PTR(-ENOENT);
>  		}
>  	}
>  
> @@ -1335,7 +1335,7 @@ static int clk_mt2712_top_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
>  			top_clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, top_clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> @@ -1346,7 +1346,7 @@ static int clk_mt2712_top_probe(struct platform_device *pdev)
>  
>  static int clk_mt2712_infra_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -1355,7 +1355,7 @@ static int clk_mt2712_infra_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
>  			clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> @@ -1368,7 +1368,7 @@ static int clk_mt2712_infra_probe(struct platform_device *pdev)
>  
>  static int clk_mt2712_peri_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  
> @@ -1377,7 +1377,7 @@ static int clk_mt2712_peri_probe(struct platform_device *pdev)
>  	mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks),
>  			clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> @@ -1390,7 +1390,7 @@ static int clk_mt2712_peri_probe(struct platform_device *pdev)
>  
>  static int clk_mt2712_mcu_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	int r;
>  	struct device_node *node = pdev->dev.of_node;
>  	void __iomem *base;
> @@ -1406,7 +1406,7 @@ static int clk_mt2712_mcu_probe(struct platform_device *pdev)
>  	mtk_clk_register_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), base,
>  			&mt2712_clk_lock, clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  
>  	if (r != 0)
>  		pr_err("%s(): could not register clock provider: %d\n",
> -- 
> 2.36.0.512.ge40c2bad7a-goog
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
