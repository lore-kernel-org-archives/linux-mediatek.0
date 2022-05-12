Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0D9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVsrCFk8zLoVK56HWbWli3HTg0J0ZxrDQQChm5OgQ/I=; b=GYjbHbtil442CJ
	/0B0zP44X507rjp3H0iZlYYh6RCutB6GcBTLGsdnCXEwaJt2+pdQcPwFHwUJ6JjT0dL/gOdsMQzIC
	+D+MK5vNuWCmdcmvdcLT+5VgqWk9sG/zYXdkhDsAM9LbX8S6lH7v3WuUSO2BGU55xV1bgdM9T8Yhp
	k9StLDHUpma+6w1iTsmmY65K9XQmv+rSGpMJ7+Kh24ZnsSsdFi96D+iBLr9LoUQl9gtESlyhY1MhR
	TeLBqzvvcfCleavdBBylo4DBTPiobfeIZL4nnXCs8ZZJl5Fu2cS2DpGXxHSkJa6JRFgsKUw44CP4X
	tsqRixSa5w0uuqNnthOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np9jU-00CLwe-CH; Thu, 12 May 2022 14:24:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np9jQ-00CLvN-Cc; Thu, 12 May 2022 14:23:59 +0000
X-UUID: 8143e1745be747edac7e603cd72b6275-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7b8540fc-8446-440f-9815-33f6c8b6fd0c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:f62414a7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,File:nil,QS:0,BEC:ni
 l
X-UUID: 8143e1745be747edac7e603cd72b6275-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 367792040; Thu, 12 May 2022 07:23:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 07:18:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 22:18:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 May 2022 22:18:51 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <rex-bc.chen@mediatek.com>, <sboyd@kernel.org>
Subject: Re: [PATCH v2 04/11] clk: mediatek: Replace 'struct clk' with 'struct
 clk_hw'
Date: Thu, 12 May 2022 22:18:51 +0800
Message-ID: <20220512141851.18252-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220510104804.544597-5-wenst@chromium.org>
References: <20220510104804.544597-5-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_072356_481064_0DF343CD 
X-CRM114-Status: GOOD (  23.97  )
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

> As part of the effort to improve the MediaTek clk drivers, the next step
> is to switch from the old 'struct clk' clk prodivder APIs to the new
> 'struct clk_hw' ones.
> 
> Instead of adding new APIs to the MediaTek clk driver library mirroring
> the existing ones, moving all drivers to the new APIs, and then removing
> the old ones, just migrate everything at the same time. This involves
> replacing 'struct clk' with 'struct clk_hw', and 'struct clk_onecell_data'
> with 'struct clk_hw_onecell_data', and fixing up all usages.
> 
> This is done with the following coccinelle script.
> 
> To avoid a really large patch, the changes have been split into multiple
> ones. This patch covers the common MediaTek clk library.
> 
>     // Replace type

...snip...

> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -21,7 +21,7 @@
>  struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
>  {
>  	int i;
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;


oh, clk_onecell_data is converted to clk_hw_onecell_data here

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 
>  
>  	clk_data = kzalloc(struct_size(clk_data, hws, clk_num), GFP_KERNEL);
>  	if (!clk_data)
> @@ -43,7 +43,7 @@ void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data)
>  EXPORT_SYMBOL_GPL(mtk_free_clk_data);
>  
>  int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> -				struct clk_onecell_data *clk_data)
> +				struct clk_hw_onecell_data *clk_data)
>  {
>  	int i;
>  	struct clk *clk;
> @@ -54,7 +54,7 @@ int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
>  	for (i = 0; i < num; i++) {
>  		const struct mtk_fixed_clk *rc = &clks[i];
>  
> -		if (!IS_ERR_OR_NULL(clk_data->clks[rc->id])) {
> +		if (!IS_ERR_OR_NULL(clk_data->hws[rc->id])) {
>  			pr_warn("Trying to register duplicate clock ID: %d\n", rc->id);
>  			continue;
>  		}
> @@ -67,7 +67,7 @@ int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
>  			goto err;
>  		}
>  
> -		clk_data->clks[rc->id] = clk;
> +		clk_data->hws[rc->id] = __clk_get_hw(clk);
>  	}
>  
>  	return 0;
> @@ -76,11 +76,11 @@ int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
>  	while (--i >= 0) {
>  		const struct mtk_fixed_clk *rc = &clks[i];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[rc->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[rc->id]))
>  			continue;
>  
> -		clk_unregister_fixed_rate(clk_data->clks[rc->id]);
> -		clk_data->clks[rc->id] = ERR_PTR(-ENOENT);
> +		clk_unregister_fixed_rate(clk_data->hws[rc->id]->clk);
> +		clk_data->hws[rc->id] = ERR_PTR(-ENOENT);
>  	}
>  
>  	return PTR_ERR(clk);
> @@ -88,7 +88,7 @@ int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
>  EXPORT_SYMBOL_GPL(mtk_clk_register_fixed_clks);
>  
>  void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> -				   struct clk_onecell_data *clk_data)
> +				   struct clk_hw_onecell_data *clk_data)
>  {
>  	int i;
>  
> @@ -98,17 +98,17 @@ void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
>  	for (i = num; i > 0; i--) {
>  		const struct mtk_fixed_clk *rc = &clks[i - 1];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[rc->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[rc->id]))
>  			continue;
>  
> -		clk_unregister_fixed_rate(clk_data->clks[rc->id]);
> -		clk_data->clks[rc->id] = ERR_PTR(-ENOENT);
> +		clk_unregister_fixed_rate(clk_data->hws[rc->id]->clk);
> +		clk_data->hws[rc->id] = ERR_PTR(-ENOENT);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_fixed_clks);
>  
>  int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
> -			     struct clk_onecell_data *clk_data)
> +			     struct clk_hw_onecell_data *clk_data)
>  {
>  	int i;
>  	struct clk *clk;
> @@ -119,7 +119,7 @@ int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
>  	for (i = 0; i < num; i++) {
>  		const struct mtk_fixed_factor *ff = &clks[i];
>  
> -		if (!IS_ERR_OR_NULL(clk_data->clks[ff->id])) {
> +		if (!IS_ERR_OR_NULL(clk_data->hws[ff->id])) {
>  			pr_warn("Trying to register duplicate clock ID: %d\n", ff->id);
>  			continue;
>  		}
> @@ -132,7 +132,7 @@ int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
>  			goto err;
>  		}
>  
> -		clk_data->clks[ff->id] = clk;
> +		clk_data->hws[ff->id] = __clk_get_hw(clk);
>  	}
>  
>  	return 0;
> @@ -141,11 +141,11 @@ int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
>  	while (--i >= 0) {
>  		const struct mtk_fixed_factor *ff = &clks[i];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[ff->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[ff->id]))
>  			continue;
>  
> -		clk_unregister_fixed_factor(clk_data->clks[ff->id]);
> -		clk_data->clks[ff->id] = ERR_PTR(-ENOENT);
> +		clk_unregister_fixed_factor(clk_data->hws[ff->id]->clk);
> +		clk_data->hws[ff->id] = ERR_PTR(-ENOENT);
>  	}
>  
>  	return PTR_ERR(clk);
> @@ -153,7 +153,7 @@ int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
>  EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
>  
>  void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
> -				struct clk_onecell_data *clk_data)
> +				struct clk_hw_onecell_data *clk_data)
>  {
>  	int i;
>  
> @@ -163,11 +163,11 @@ void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
>  	for (i = num; i > 0; i--) {
>  		const struct mtk_fixed_factor *ff = &clks[i - 1];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[ff->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[ff->id]))
>  			continue;
>  
> -		clk_unregister_fixed_factor(clk_data->clks[ff->id]);
> -		clk_data->clks[ff->id] = ERR_PTR(-ENOENT);
> +		clk_unregister_fixed_factor(clk_data->hws[ff->id]->clk);
> +		clk_data->hws[ff->id] = ERR_PTR(-ENOENT);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_factors);
> @@ -287,7 +287,7 @@ static void mtk_clk_unregister_composite(struct clk *clk)
>  
>  int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
>  				void __iomem *base, spinlock_t *lock,
> -				struct clk_onecell_data *clk_data)
> +				struct clk_hw_onecell_data *clk_data)
>  {
>  	struct clk *clk;
>  	int i;
> @@ -298,7 +298,7 @@ int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
>  	for (i = 0; i < num; i++) {
>  		const struct mtk_composite *mc = &mcs[i];
>  
> -		if (!IS_ERR_OR_NULL(clk_data->clks[mc->id])) {
> +		if (!IS_ERR_OR_NULL(clk_data->hws[mc->id])) {
>  			pr_warn("Trying to register duplicate clock ID: %d\n",
>  				mc->id);
>  			continue;
> @@ -311,7 +311,7 @@ int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
>  			goto err;
>  		}
>  
> -		clk_data->clks[mc->id] = clk;
> +		clk_data->hws[mc->id] = __clk_get_hw(clk);
>  	}
>  
>  	return 0;
> @@ -320,11 +320,11 @@ int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
>  	while (--i >= 0) {
>  		const struct mtk_composite *mc = &mcs[i];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[mcs->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[mcs->id]))
>  			continue;
>  
> -		mtk_clk_unregister_composite(clk_data->clks[mc->id]);
> -		clk_data->clks[mc->id] = ERR_PTR(-ENOENT);
> +		mtk_clk_unregister_composite(clk_data->hws[mc->id]->clk);
> +		clk_data->hws[mc->id] = ERR_PTR(-ENOENT);
>  	}
>  
>  	return PTR_ERR(clk);
> @@ -332,7 +332,7 @@ int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
>  EXPORT_SYMBOL_GPL(mtk_clk_register_composites);
>  
>  void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
> -				   struct clk_onecell_data *clk_data)
> +				   struct clk_hw_onecell_data *clk_data)
>  {
>  	int i;
>  
> @@ -342,18 +342,18 @@ void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
>  	for (i = num; i > 0; i--) {
>  		const struct mtk_composite *mc = &mcs[i - 1];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[mc->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[mc->id]))
>  			continue;
>  
> -		mtk_clk_unregister_composite(clk_data->clks[mc->id]);
> -		clk_data->clks[mc->id] = ERR_PTR(-ENOENT);
> +		mtk_clk_unregister_composite(clk_data->hws[mc->id]->clk);
> +		clk_data->hws[mc->id] = ERR_PTR(-ENOENT);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_composites);
>  
>  int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
>  			      void __iomem *base, spinlock_t *lock,
> -			      struct clk_onecell_data *clk_data)
> +			      struct clk_hw_onecell_data *clk_data)
>  {
>  	struct clk *clk;
>  	int i;
> @@ -364,7 +364,7 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
>  	for (i = 0; i <  num; i++) {
>  		const struct mtk_clk_divider *mcd = &mcds[i];
>  
> -		if (!IS_ERR_OR_NULL(clk_data->clks[mcd->id])) {
> +		if (!IS_ERR_OR_NULL(clk_data->hws[mcd->id])) {
>  			pr_warn("Trying to register duplicate clock ID: %d\n",
>  				mcd->id);
>  			continue;
> @@ -379,7 +379,7 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
>  			goto err;
>  		}
>  
> -		clk_data->clks[mcd->id] = clk;
> +		clk_data->hws[mcd->id] = __clk_get_hw(clk);
>  	}
>  
>  	return 0;
> @@ -388,18 +388,18 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
>  	while (--i >= 0) {
>  		const struct mtk_clk_divider *mcd = &mcds[i];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[mcd->id]))
>  			continue;
>  
> -		mtk_clk_unregister_composite(clk_data->clks[mcd->id]);
> -		clk_data->clks[mcd->id] = ERR_PTR(-ENOENT);
> +		mtk_clk_unregister_composite(clk_data->hws[mcd->id]->clk);
> +		clk_data->hws[mcd->id] = ERR_PTR(-ENOENT);
>  	}
>  
>  	return PTR_ERR(clk);
>  }
>  
>  void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
> -				 struct clk_onecell_data *clk_data)
> +				 struct clk_hw_onecell_data *clk_data)
>  {
>  	int i;
>  
> @@ -409,18 +409,18 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
>  	for (i = num; i > 0; i--) {
>  		const struct mtk_clk_divider *mcd = &mcds[i - 1];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[mcd->id]))
>  			continue;
>  
> -		clk_unregister_divider(clk_data->clks[mcd->id]);
> -		clk_data->clks[mcd->id] = ERR_PTR(-ENOENT);
> +		clk_unregister_divider(clk_data->hws[mcd->id]->clk);
> +		clk_data->hws[mcd->id] = ERR_PTR(-ENOENT);
>  	}
>  }
>  
>  int mtk_clk_simple_probe(struct platform_device *pdev)
>  {
>  	const struct mtk_clk_desc *mcd;
> -	struct clk_onecell_data *clk_data;
> +	struct clk_hw_onecell_data *clk_data;
>  	struct device_node *node = pdev->dev.of_node;
>  	int r;
>  
> @@ -436,7 +436,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>  	if (r)
>  		goto free_data;
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
>  		goto unregister_clks;
>  
> @@ -454,7 +454,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>  int mtk_clk_simple_remove(struct platform_device *pdev)
>  {
>  	const struct mtk_clk_desc *mcd = of_device_get_match_data(&pdev->dev);
> -	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
> +	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
>  	struct device_node *node = pdev->dev.of_node;
>  
>  	of_clk_del_provider(node);
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 787fdeb1bd93..e736420170a2 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -35,9 +35,9 @@ struct mtk_fixed_clk {
>  	}
>  
>  int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> -				struct clk_onecell_data *clk_data);
> +				struct clk_hw_onecell_data *clk_data);
>  void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> -				   struct clk_onecell_data *clk_data);
> +				   struct clk_hw_onecell_data *clk_data);
>  
>  struct mtk_fixed_factor {
>  	int id;
> @@ -56,9 +56,9 @@ struct mtk_fixed_factor {
>  	}
>  
>  int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
> -			     struct clk_onecell_data *clk_data);
> +			     struct clk_hw_onecell_data *clk_data);
>  void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
> -				struct clk_onecell_data *clk_data);
> +				struct clk_hw_onecell_data *clk_data);
>  
>  struct mtk_composite {
>  	int id;
> @@ -149,9 +149,9 @@ struct mtk_composite {
>  
>  int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
>  				void __iomem *base, spinlock_t *lock,
> -				struct clk_onecell_data *clk_data);
> +				struct clk_hw_onecell_data *clk_data);
>  void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
> -				   struct clk_onecell_data *clk_data);
> +				   struct clk_hw_onecell_data *clk_data);
>  
>  struct mtk_clk_divider {
>  	int id;
> @@ -177,9 +177,9 @@ struct mtk_clk_divider {
>  
>  int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
>  			      void __iomem *base, spinlock_t *lock,
> -			      struct clk_onecell_data *clk_data);
> +			      struct clk_hw_onecell_data *clk_data);
>  void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
> -				 struct clk_onecell_data *clk_data);
> +				 struct clk_hw_onecell_data *clk_data);
>  
>  struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
>  void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data);
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> index 21ad5a4afd65..2f47e59cc528 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -193,7 +193,7 @@ static void mtk_clk_unregister_mux(struct clk *clk)
>  int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>  			   int num, struct device_node *node,
>  			   spinlock_t *lock,
> -			   struct clk_onecell_data *clk_data)
> +			   struct clk_hw_onecell_data *clk_data)
>  {
>  	struct regmap *regmap;
>  	struct clk *clk;
> @@ -208,7 +208,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>  	for (i = 0; i < num; i++) {
>  		const struct mtk_mux *mux = &muxes[i];
>  
> -		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
> +		if (!IS_ERR_OR_NULL(clk_data->hws[mux->id])) {
>  			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
>  				node, mux->id);
>  			continue;
> @@ -221,7 +221,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>  			goto err;
>  		}
>  
> -		clk_data->clks[mux->id] = clk;
> +		clk_data->hws[mux->id] = __clk_get_hw(clk);
>  	}
>  
>  	return 0;
> @@ -230,11 +230,11 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>  	while (--i >= 0) {
>  		const struct mtk_mux *mux = &muxes[i];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[mux->id]))
>  			continue;
>  
> -		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
> -		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
> +		mtk_clk_unregister_mux(clk_data->hws[mux->id]->clk);
> +		clk_data->hws[mux->id] = ERR_PTR(-ENOENT);
>  	}
>  
>  	return PTR_ERR(clk);
> @@ -242,7 +242,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>  EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
>  
>  void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
> -			      struct clk_onecell_data *clk_data)
> +			      struct clk_hw_onecell_data *clk_data)
>  {
>  	int i;
>  
> @@ -252,11 +252,11 @@ void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
>  	for (i = num; i > 0; i--) {
>  		const struct mtk_mux *mux = &muxes[i - 1];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[mux->id]))
>  			continue;
>  
> -		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
> -		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
> +		mtk_clk_unregister_mux(clk_data->hws[mux->id]->clk);
> +		clk_data->hws[mux->id] = ERR_PTR(-ENOENT);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_muxes);
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> index 903a3c937959..6539c58f5d7d 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -11,7 +11,7 @@
>  #include <linux/types.h>
>  
>  struct clk;
> -struct clk_onecell_data;
> +struct clk_hw_onecell_data;
>  struct clk_ops;
>  struct device_node;
>  
> @@ -84,9 +84,9 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
>  int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>  			   int num, struct device_node *node,
>  			   spinlock_t *lock,
> -			   struct clk_onecell_data *clk_data);
> +			   struct clk_hw_onecell_data *clk_data);
>  
>  void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
> -			      struct clk_onecell_data *clk_data);
> +			      struct clk_hw_onecell_data *clk_data);
>  
>  #endif /* __DRV_CLK_MTK_MUX_H */
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index ccaa2085ab4d..89350a1a158c 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -379,7 +379,7 @@ static void mtk_clk_unregister_pll(struct clk *clk)
>  
>  int mtk_clk_register_plls(struct device_node *node,
>  			  const struct mtk_pll_data *plls, int num_plls,
> -			  struct clk_onecell_data *clk_data)
> +			  struct clk_hw_onecell_data *clk_data)
>  {
>  	void __iomem *base;
>  	int i;
> @@ -394,7 +394,7 @@ int mtk_clk_register_plls(struct device_node *node,
>  	for (i = 0; i < num_plls; i++) {
>  		const struct mtk_pll_data *pll = &plls[i];
>  
> -		if (!IS_ERR_OR_NULL(clk_data->clks[pll->id])) {
> +		if (!IS_ERR_OR_NULL(clk_data->hws[pll->id])) {
>  			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
>  				node, pll->id);
>  			continue;
> @@ -407,7 +407,7 @@ int mtk_clk_register_plls(struct device_node *node,
>  			goto err;
>  		}
>  
> -		clk_data->clks[pll->id] = clk;
> +		clk_data->hws[pll->id] = __clk_get_hw(clk);
>  	}
>  
>  	return 0;
> @@ -416,8 +416,8 @@ int mtk_clk_register_plls(struct device_node *node,
>  	while (--i >= 0) {
>  		const struct mtk_pll_data *pll = &plls[i];
>  
> -		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
> -		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
> +		mtk_clk_unregister_pll(clk_data->hws[pll->id]->clk);
> +		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
>  	}
>  
>  	iounmap(base);
> @@ -426,17 +426,16 @@ int mtk_clk_register_plls(struct device_node *node,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
>  
> -static __iomem void *mtk_clk_pll_get_base(struct clk *clk,
> +static __iomem void *mtk_clk_pll_get_base(struct clk_hw *hw,
>  					  const struct mtk_pll_data *data)
>  {
> -	struct clk_hw *hw = __clk_get_hw(clk);
>  	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>  
>  	return pll->base_addr - data->reg;
>  }
>  
>  void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
> -			     struct clk_onecell_data *clk_data)
> +			     struct clk_hw_onecell_data *clk_data)
>  {
>  	__iomem void *base = NULL;
>  	int i;
> @@ -447,7 +446,7 @@ void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
>  	for (i = num_plls; i > 0; i--) {
>  		const struct mtk_pll_data *pll = &plls[i - 1];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[pll->id]))
> +		if (IS_ERR_OR_NULL(clk_data->hws[pll->id]))
>  			continue;
>  
>  		/*
> @@ -456,10 +455,10 @@ void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
>  		 * pointer to the I/O region base address. We have to fetch
>  		 * it from one of the registered clks.
>  		 */
> -		base = mtk_clk_pll_get_base(clk_data->clks[pll->id], pll);
> +		base = mtk_clk_pll_get_base(clk_data->hws[pll->id], pll);
>  
> -		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
> -		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
> +		mtk_clk_unregister_pll(clk_data->hws[pll->id]->clk);
> +		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
>  	}
>  
>  	iounmap(base);
> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
> index bf06e44caef9..fe3199715688 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -10,7 +10,7 @@
>  #include <linux/types.h>
>  
>  struct clk_ops;
> -struct clk_onecell_data;
> +struct clk_hw_onecell_data;
>  struct device_node;
>  
>  struct mtk_pll_div_table {
> @@ -50,8 +50,8 @@ struct mtk_pll_data {
>  
>  int mtk_clk_register_plls(struct device_node *node,
>  			  const struct mtk_pll_data *plls, int num_plls,
> -			  struct clk_onecell_data *clk_data);
> +			  struct clk_hw_onecell_data *clk_data);
>  void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
> -			     struct clk_onecell_data *clk_data);
> +			     struct clk_hw_onecell_data *clk_data);
>  
>  #endif /* __DRV_CLK_MTK_PLL_H */
> -- 
> 2.36.0.512.ge40c2bad7a-goog
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
