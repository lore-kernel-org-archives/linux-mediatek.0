Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B761C2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HuZPg+G6oMUJ293sKFkg3IdTNFTVm1vYyeJht9nSOjc=; b=vVnjafg/1WncGa
	4DE4cXv7g8qpg4+xec0KVt+3+A1UejQJmj4HuedjEyISQQkjI+9/fzUMdbrBLNi7ADCA6OnGK+Yy0
	mdDcptT+xK7Gu9LKQGwCy+KOpFbqmTkMNzl/BKaxCJhWrlQl4NLbU4+1+Lm86kEGe+nfZAf8iRs3X
	YXPKj6Sixu8Fv2VK4FAoYJddMJBX68jeBsebqr0JfuRqNadHDAjmiFKRQrzx8yCokPmXXcc9oNeG/
	xP5KaFqKwq9qulOtRvzXE615hdqpYK5ubru5O4P6nWCMY/VrNybrkrehPL8y3IFZMHAFOIglrbLfm
	vApxQ/KCyeCiE4lFrBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCdWq-00AgWG-JM; Wed, 26 Jan 2022 08:19:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCdVx-00AgAv-OM; Wed, 26 Jan 2022 08:18:51 +0000
X-UUID: d2bd1c6d599d419ebcfe7ca06818d02e-20220126
X-UUID: d2bd1c6d599d419ebcfe7ca06818d02e-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 724314628; Wed, 26 Jan 2022 01:18:46 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 00:16:56 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 16:16:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 16:16:54 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 26/31] clk: mediatek: mtk: Implement error handling in
 register APIs
Date: Wed, 26 Jan 2022 16:16:54 +0800
Message-ID: <20220126081654.5988-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-27-wenst@chromium.org>
References: <20220122091731.283592-27-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_001849_846607_32110283 
X-CRM114-Status: GOOD (  25.59  )
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

> The remaining clk registration functions do not stop or return errors
> if any clk failed to be registered, nor do they implement error
> handling paths. This may result in a partially working device if any
> step fails.
> 
> Make the register functions return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, is done in the new error path.
> 
> This also makes the |struct clk_data *| argument mandatory, as it is
> used to track the list of clks registered.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-mtk.c | 118 ++++++++++++++++++++++++++-------
>  drivers/clk/mediatek/clk-mtk.h |  20 +++---
>  2 files changed, 103 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index d2c50186cceb..e1977c8e130a 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -53,16 +53,19 @@ void mtk_free_clk_data(struct clk_onecell_data *clk_data)
>  	kfree(clk_data);
>  }
>  
> -void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
> -		int num, struct clk_onecell_data *clk_data)
> +int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> +				struct clk_onecell_data *clk_data)
>  {
>  	int i;
>  	struct clk *clk;
>  
> +	if (!clk_data)
> +		return -ENOMEM;
> +
>  	for (i = 0; i < num; i++) {
>  		const struct mtk_fixed_clk *rc = &clks[i];
>  
> -		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[rc->id]))
> +		if (!IS_ERR_OR_NULL(clk_data->clks[rc->id]))
>  			continue;
>  
>  		clk = clk_register_fixed_rate(NULL, rc->name, rc->parent, 0,
> @@ -70,12 +73,26 @@ void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", rc->name, clk);
> -			continue;
> +			goto err;
>  		}
>  
> -		if (clk_data)
> -			clk_data->clks[rc->id] = clk;
> +		clk_data->clks[rc->id] = clk;
>  	}
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0) {
> +		const struct mtk_fixed_clk *rc = &clks[i];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[rc->id]))
> +			continue;
> +
> +		clk_unregister_fixed_rate(clk_data->clks[rc->id]);
> +		clk_data->clks[rc->id] = ERR_PTR(-ENOENT);
> +	}
> +
> +	return PTR_ERR(clk);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_fixed_clks);
>  
> @@ -99,16 +116,19 @@ void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_fixed_clks);
>  
> -void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
> -		int num, struct clk_onecell_data *clk_data)
> +int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
> +			     struct clk_onecell_data *clk_data)
>  {
>  	int i;
>  	struct clk *clk;
>  
> +	if (!clk_data)
> +		return -ENOMEM;
> +
>  	for (i = 0; i < num; i++) {
>  		const struct mtk_fixed_factor *ff = &clks[i];
>  
> -		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[ff->id]))
> +		if (!IS_ERR_OR_NULL(clk_data->clks[ff->id]))
>  			continue;
>  
>  		clk = clk_register_fixed_factor(NULL, ff->name, ff->parent_name,
> @@ -116,12 +136,26 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", ff->name, clk);
> -			continue;
> +			goto err;
>  		}
>  
> -		if (clk_data)
> -			clk_data->clks[ff->id] = clk;
> +		clk_data->clks[ff->id] = clk;
> +	}
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0) {
> +		const struct mtk_fixed_factor *ff = &clks[i];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[ff->id]))
> +			continue;
> +
> +		clk_unregister_fixed_factor(clk_data->clks[ff->id]);
> +		clk_data->clks[ff->id] = ERR_PTR(-ENOENT);
>  	}
> +
> +	return PTR_ERR(clk);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
>  
> @@ -253,13 +287,16 @@ static void mtk_clk_unregister_composite(struct clk *clk)
>  	kfree(mux);
>  }
>  
> -void mtk_clk_register_composites(const struct mtk_composite *mcs,
> -		int num, void __iomem *base, spinlock_t *lock,
> -		struct clk_onecell_data *clk_data)
> +int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
> +				void __iomem *base, spinlock_t *lock,
> +				struct clk_onecell_data *clk_data)
>  {
>  	struct clk *clk;
>  	int i;
>  
> +	if (!clk_data)
> +		return -ENOMEM;
> +
>  	for (i = 0; i < num; i++) {
>  		const struct mtk_composite *mc = &mcs[i];
>  
> @@ -270,12 +307,26 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", mc->name, clk);
> -			continue;
> +			goto err;
>  		}
>  
> -		if (clk_data)
> -			clk_data->clks[mc->id] = clk;
> +		clk_data->clks[mc->id] = clk;
> +	}
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0) {
> +		const struct mtk_composite *mc = &mcs[i];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[mcs->id]))
> +			continue;
> +
> +		mtk_clk_unregister_composite(clk_data->clks[mc->id]);
> +		clk_data->clks[mc->id] = ERR_PTR(-ENOENT);
>  	}
> +
> +	return PTR_ERR(clk);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_composites);
>  
> @@ -299,17 +350,20 @@ void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_composites);
>  
> -void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
> -			int num, void __iomem *base, spinlock_t *lock,
> -				struct clk_onecell_data *clk_data)
> +int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
> +			      void __iomem *base, spinlock_t *lock,
> +			      struct clk_onecell_data *clk_data)
>  {
>  	struct clk *clk;
>  	int i;
>  
> +	if (!clk_data)
> +		return -ENOMEM;
> +
>  	for (i = 0; i <  num; i++) {
>  		const struct mtk_clk_divider *mcd = &mcds[i];
>  
> -		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
> +		if (!IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
>  			continue;
>  
>  		clk = clk_register_divider(NULL, mcd->name, mcd->parent_name,
> @@ -318,12 +372,26 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", mcd->name, clk);
> -			continue;
> +			goto err;
>  		}
>  
> -		if (clk_data)
> -			clk_data->clks[mcd->id] = clk;
> +		clk_data->clks[mcd->id] = clk;
> +	}
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0) {
> +		const struct mtk_clk_divider *mcd = &mcds[i];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
> +			continue;
> +
> +		mtk_clk_unregister_composite(clk_data->clks[mcd->id]);
> +		clk_data->clks[mcd->id] = ERR_PTR(-ENOENT);
>  	}
> +
> +	return PTR_ERR(clk);
>  }
>  
>  void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 7f902581a115..bf6565aa7319 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -34,8 +34,8 @@ struct mtk_fixed_clk {
>  		.rate = _rate,				\
>  	}
>  
> -void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> -				 struct clk_onecell_data *clk_data);
> +int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> +				struct clk_onecell_data *clk_data);
>  void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
>  				   struct clk_onecell_data *clk_data);
>  
> @@ -55,8 +55,8 @@ struct mtk_fixed_factor {
>  		.div = _div,				\
>  	}
>  
> -void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
> -			      struct clk_onecell_data *clk_data);
> +int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
> +			     struct clk_onecell_data *clk_data);
>  void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
>  				struct clk_onecell_data *clk_data);
>  
> @@ -150,9 +150,9 @@ struct mtk_composite {
>  struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
>  		void __iomem *base, spinlock_t *lock);
>  
> -void mtk_clk_register_composites(const struct mtk_composite *mcs,
> -		int num, void __iomem *base, spinlock_t *lock,
> -		struct clk_onecell_data *clk_data);
> +int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
> +				void __iomem *base, spinlock_t *lock,
> +				struct clk_onecell_data *clk_data);
>  void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
>  				   struct clk_onecell_data *clk_data);
>  
> @@ -178,9 +178,9 @@ struct mtk_clk_divider {
>  		.div_width = _width,				\
>  }
>  
> -void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
> -			       void __iomem *base, spinlock_t *lock,
> -			       struct clk_onecell_data *clk_data);
> +int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
> +			      void __iomem *base, spinlock_t *lock,
> +			      struct clk_onecell_data *clk_data);
>  void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
>  				 struct clk_onecell_data *clk_data);
>  
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
