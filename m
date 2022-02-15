Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00267C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rw/8qBV80bEFx9Rd/7XppSJ0fvMnsOsaDwT0mKFY6eU=; b=Gcfnt057Tsrnq8
	j/PJllLMS6qpQu+bvLoMcjYC6NnaiI7D1DilVrShdFWQfWUqIScY0/0JIbt+tz2EIsQ0UxrDa6BoO
	ee6y1inhZD81JRXxeo7FA9NenYrkZ8PqrzTcUUZ6FIr7gV8Kk7YnX0Sm13vwpCNz+mziu8R+ksNm0
	uTg6NwChzvg80D/a9qxYUT1beJnaFa6P0ScgfSEI2uo0ECYSUs0VXYyY3xEEhV551b1pwQynk3RPG
	nbM5t7a0H//wyVLZhA3DIN4sB/MoGHPfVkOLZvBz+xWLz+r7uLczA908ZsyH8Gati2lhL9NM9qYm0
	0/CWXHukuFtnVmtnNeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJs8T-0017zc-Tf; Tue, 15 Feb 2022 07:20:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJs8G-0017s6-J0; Tue, 15 Feb 2022 07:20:18 +0000
X-UUID: ef28f0012f1b4c2fa4159010996a2a61-20220215
X-UUID: ef28f0012f1b4c2fa4159010996a2a61-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1854992271; Tue, 15 Feb 2022 00:20:15 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 23:10:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 15:10:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 15:10:11 +0800
Message-ID: <fc5593073d85e3575993eeb92c546db90730cb23.camel@mediatek.com>
Subject: Re: [PATCH v3 26/31] clk: mediatek: mtk: Implement error handling
 in register APIs
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 15:10:11 +0800
In-Reply-To: <20220208124034.414635-27-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-27-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_232016_646112_460DA666 
X-CRM114-Status: GOOD (  25.57  )
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

On Tue, 2022-02-08 at 20:40 +0800, Chen-Yu Tsai wrote:
> The remaining clk registration functions do not stop or return errors
> if any clk failed to be registered, nor do they implement error
> handling paths. This may result in a partially working device if any
> step fails.
> 
> Make the register functions return proper error codes, and bail out
> if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, is done in the new error path.
> 
> This also makes the |struct clk_data *| argument mandatory, as it is
> used to track the list of clks registered.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 118 ++++++++++++++++++++++++++-----
> --
>  drivers/clk/mediatek/clk-mtk.h |  20 +++---
>  2 files changed, 103 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c
> b/drivers/clk/mediatek/clk-mtk.c
> index 5618c84e4e08..8f15e9de742e 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -53,16 +53,19 @@ void mtk_free_clk_data(struct clk_onecell_data
> *clk_data)
>  	kfree(clk_data);
>  }
>  
> -void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
> -		int num, struct clk_onecell_data *clk_data)
> +int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
> int num,
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
> -		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[rc-
> >id]))
> +		if (!IS_ERR_OR_NULL(clk_data->clks[rc->id]))
>  			continue;
>  
>  		clk = clk_register_fixed_rate(NULL, rc->name, rc-
> >parent, 0,
> @@ -70,12 +73,26 @@ void mtk_clk_register_fixed_clks(const struct
> mtk_fixed_clk *clks,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", rc-
> >name, clk);
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
> @@ -99,16 +116,19 @@ void mtk_clk_unregister_fixed_clks(const struct
> mtk_fixed_clk *clks, int num,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_fixed_clks);
>  
> -void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
> -		int num, struct clk_onecell_data *clk_data)
> +int mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
> int num,
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
> -		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[ff-
> >id]))
> +		if (!IS_ERR_OR_NULL(clk_data->clks[ff->id]))
>  			continue;
>  
>  		clk = clk_register_fixed_factor(NULL, ff->name, ff-
> >parent_name,
> @@ -116,12 +136,26 @@ void mtk_clk_register_factors(const struct
> mtk_fixed_factor *clks,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", ff-
> >name, clk);
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
> @@ -258,13 +292,16 @@ static void mtk_clk_unregister_composite(struct
> clk *clk)
>  	kfree(mux);
>  }
>  
> -void mtk_clk_register_composites(const struct mtk_composite *mcs,
> -		int num, void __iomem *base, spinlock_t *lock,
> -		struct clk_onecell_data *clk_data)
> +int mtk_clk_register_composites(const struct mtk_composite *mcs, int
> num,
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
> @@ -275,12 +312,26 @@ void mtk_clk_register_composites(const struct
> mtk_composite *mcs,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", mc-
> >name, clk);
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
> @@ -304,17 +355,20 @@ void mtk_clk_unregister_composites(const struct
> mtk_composite *mcs, int num,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_composites);
>  
> -void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
> -			int num, void __iomem *base, spinlock_t *lock,
> -				struct clk_onecell_data *clk_data)
> +int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
> int num,
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
> -		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[mcd-
> >id]))
> +		if (!IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
>  			continue;
>  
>  		clk = clk_register_divider(NULL, mcd->name, mcd-
> >parent_name,
> @@ -323,12 +377,26 @@ void mtk_clk_register_dividers(const struct
> mtk_clk_divider *mcds,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", mcd-
> >name, clk);
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
>  void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds,
> int num,
> diff --git a/drivers/clk/mediatek/clk-mtk.h
> b/drivers/clk/mediatek/clk-mtk.h
> index 7f902581a115..bf6565aa7319 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -34,8 +34,8 @@ struct mtk_fixed_clk {
>  		.rate = _rate,				\
>  	}
>  
> -void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
> int num,
> -				 struct clk_onecell_data *clk_data);
> +int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
> int num,
> +				struct clk_onecell_data *clk_data);
>  void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks,
> int num,
>  				   struct clk_onecell_data *clk_data);
>  
> @@ -55,8 +55,8 @@ struct mtk_fixed_factor {
>  		.div = _div,				\
>  	}
>  
> -void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
> int num,
> -			      struct clk_onecell_data *clk_data);
> +int mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
> int num,
> +			     struct clk_onecell_data *clk_data);
>  void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks,
> int num,
>  				struct clk_onecell_data *clk_data);
>  
> @@ -150,9 +150,9 @@ struct mtk_composite {
>  struct clk *mtk_clk_register_composite(const struct mtk_composite
> *mc,
>  		void __iomem *base, spinlock_t *lock);
>  
> -void mtk_clk_register_composites(const struct mtk_composite *mcs,
> -		int num, void __iomem *base, spinlock_t *lock,
> -		struct clk_onecell_data *clk_data);
> +int mtk_clk_register_composites(const struct mtk_composite *mcs, int
> num,
> +				void __iomem *base, spinlock_t *lock,
> +				struct clk_onecell_data *clk_data);
>  void mtk_clk_unregister_composites(const struct mtk_composite *mcs,
> int num,
>  				   struct clk_onecell_data *clk_data);
>  
> @@ -178,9 +178,9 @@ struct mtk_clk_divider {
>  		.div_width = _width,				\
>  }
>  
> -void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
> int num,
> -			       void __iomem *base, spinlock_t *lock,
> -			       struct clk_onecell_data *clk_data);
> +int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
> int num,
> +			      void __iomem *base, spinlock_t *lock,
> +			      struct clk_onecell_data *clk_data);
>  void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds,
> int num,
>  				 struct clk_onecell_data *clk_data);
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
