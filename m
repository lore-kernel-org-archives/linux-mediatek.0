Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1935C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6zxqlLCDcHHoAxljAxspFkvZZU68jPQy6sEnaeSa8g=; b=vL5xT20HhjEq8U
	ZiDtCQmbBKZs0tNDdw4HE+nbqaPsgrfGAMZyrxpC5HTh70z8J1+QjJps3vgAMftC+zEP5wRTYozXD
	h7IIZsFEdIMIdSmo+04Hbfr+0LYHmLW8KUrclRiM/ylIuqdPIdDMmgwSq/S9DXtDzB8iWv7B0MBGC
	h3+JXgjZl1LPqA/UB6aig9YTWQsdqCiGk0F3phsMeDQNK7AtkWkKzQFTTa/cLvALMS6uX2zsA5s4c
	XlRUrJ6u/wMlkNhVFLGdtHbfVlkJuSxmaEZo//E90NHa+5na8zqlIEk9AYKbfnF2u+OyDE6CgGkXR
	u+4BgJ1/5X1W2BCaPcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJr72-000Y4s-JT; Tue, 15 Feb 2022 06:14:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJr6p-000XyK-40; Tue, 15 Feb 2022 06:14:46 +0000
X-UUID: 9d4e3a3a4daf449ab4b6882b33941088-20220214
X-UUID: 9d4e3a3a4daf449ab4b6882b33941088-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 170903523; Mon, 14 Feb 2022 23:14:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:06:55 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 15 Feb 2022 14:06:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:06:54 +0800
Message-ID: <5c2b97a1260b9349b151448d09e6308c2a3b252b.camel@mediatek.com>
Subject: Re: [PATCH v3 01/31] clk: mediatek: Use %pe to print errors
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:06:48 +0800
In-Reply-To: <20220208124034.414635-2-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-2-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_221443_175722_AA2943AD 
X-CRM114-Status: GOOD (  18.68  )
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
> If %pe is used to print errors, a string representation of the error
> would be printed instead of a number as with %ld. Also, all the sites
> printing errors are deriving the error code from a pointer. Using %pe
> is more straightforward.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-apmixed.c |  2 +-
>  drivers/clk/mediatek/clk-cpumux.c  |  6 ++----
>  drivers/clk/mediatek/clk-mtk.c     | 18 ++++++------------
>  drivers/clk/mediatek/clk-mux.c     |  6 ++----
>  drivers/clk/mediatek/clk-pll.c     |  3 +--
>  drivers/clk/mediatek/reset.c       |  3 +--
>  6 files changed, 13 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-apmixed.c
> b/drivers/clk/mediatek/clk-apmixed.c
> index caa9119413f1..a29339cc26c4 100644
> --- a/drivers/clk/mediatek/clk-apmixed.c
> +++ b/drivers/clk/mediatek/clk-apmixed.c
> @@ -92,7 +92,7 @@ struct clk * __init
> mtk_clk_register_ref2usb_tx(const char *name,
>  	clk = clk_register(NULL, &tx->hw);
>  
>  	if (IS_ERR(clk)) {
> -		pr_err("Failed to register clk %s: %ld\n", name,
> PTR_ERR(clk));
> +		pr_err("Failed to register clk %s: %pe\n", name, clk);
>  		kfree(tx);
>  	}
>  
> diff --git a/drivers/clk/mediatek/clk-cpumux.c
> b/drivers/clk/mediatek/clk-cpumux.c
> index e188018bc906..cab5095416b6 100644
> --- a/drivers/clk/mediatek/clk-cpumux.c
> +++ b/drivers/clk/mediatek/clk-cpumux.c
> @@ -87,8 +87,7 @@ int mtk_clk_register_cpumuxes(struct device_node
> *node,
>  
>  	regmap = device_node_to_regmap(node);
>  	if (IS_ERR(regmap)) {
> -		pr_err("Cannot find regmap for %pOF: %ld\n", node,
> -		       PTR_ERR(regmap));
> +		pr_err("Cannot find regmap for %pOF: %pe\n", node,
> regmap);
>  		return PTR_ERR(regmap);
>  	}
>  
> @@ -97,8 +96,7 @@ int mtk_clk_register_cpumuxes(struct device_node
> *node,
>  
>  		clk = mtk_clk_register_cpumux(mux, regmap);
>  		if (IS_ERR(clk)) {
> -			pr_err("Failed to register clk %s: %ld\n",
> -			       mux->name, PTR_ERR(clk));
> +			pr_err("Failed to register clk %s: %pe\n", mux-
> >name, clk);
>  			continue;
>  		}
>  
> diff --git a/drivers/clk/mediatek/clk-mtk.c
> b/drivers/clk/mediatek/clk-mtk.c
> index 8d5791b3f460..519a461cbb6f 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -70,8 +70,7 @@ void mtk_clk_register_fixed_clks(const struct
> mtk_fixed_clk *clks,
>  					      rc->rate);
>  
>  		if (IS_ERR(clk)) {
> -			pr_err("Failed to register clk %s: %ld\n",
> -					rc->name, PTR_ERR(clk));
> +			pr_err("Failed to register clk %s: %pe\n", rc-
> >name, clk);
>  			continue;
>  		}
>  
> @@ -97,8 +96,7 @@ void mtk_clk_register_factors(const struct
> mtk_fixed_factor *clks,
>  				CLK_SET_RATE_PARENT, ff->mult, ff-
> >div);
>  
>  		if (IS_ERR(clk)) {
> -			pr_err("Failed to register clk %s: %ld\n",
> -					ff->name, PTR_ERR(clk));
> +			pr_err("Failed to register clk %s: %pe\n", ff-
> >name, clk);
>  			continue;
>  		}
>  
> @@ -122,8 +120,7 @@ int mtk_clk_register_gates_with_dev(struct
> device_node *node,
>  
>  	regmap = device_node_to_regmap(node);
>  	if (IS_ERR(regmap)) {
> -		pr_err("Cannot find regmap for %pOF: %ld\n", node,
> -				PTR_ERR(regmap));
> +		pr_err("Cannot find regmap for %pOF: %pe\n", node,
> regmap);
>  		return PTR_ERR(regmap);
>  	}
>  
> @@ -141,8 +138,7 @@ int mtk_clk_register_gates_with_dev(struct
> device_node *node,
>  				gate->shift, gate->ops, gate->flags,
> dev);
>  
>  		if (IS_ERR(clk)) {
> -			pr_err("Failed to register clk %s: %ld\n",
> -					gate->name, PTR_ERR(clk));
> +			pr_err("Failed to register clk %s: %pe\n",
> gate->name, clk);
>  			continue;
>  		}
>  
> @@ -264,8 +260,7 @@ void mtk_clk_register_composites(const struct
> mtk_composite *mcs,
>  		clk = mtk_clk_register_composite(mc, base, lock);
>  
>  		if (IS_ERR(clk)) {
> -			pr_err("Failed to register clk %s: %ld\n",
> -					mc->name, PTR_ERR(clk));
> +			pr_err("Failed to register clk %s: %pe\n", mc-
> >name, clk);
>  			continue;
>  		}
>  
> @@ -293,8 +288,7 @@ void mtk_clk_register_dividers(const struct
> mtk_clk_divider *mcds,
>  			mcd->div_width, mcd->clk_divider_flags, lock);
>  
>  		if (IS_ERR(clk)) {
> -			pr_err("Failed to register clk %s: %ld\n",
> -				mcd->name, PTR_ERR(clk));
> +			pr_err("Failed to register clk %s: %pe\n", mcd-
> >name, clk);
>  			continue;
>  		}
>  
> diff --git a/drivers/clk/mediatek/clk-mux.c
> b/drivers/clk/mediatek/clk-mux.c
> index 6d3a50eb7d6f..89f23e111d91 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -175,8 +175,7 @@ int mtk_clk_register_muxes(const struct mtk_mux
> *muxes,
>  
>  	regmap = device_node_to_regmap(node);
>  	if (IS_ERR(regmap)) {
> -		pr_err("Cannot find regmap for %pOF: %ld\n", node,
> -		       PTR_ERR(regmap));
> +		pr_err("Cannot find regmap for %pOF: %pe\n", node,
> regmap);
>  		return PTR_ERR(regmap);
>  	}
>  
> @@ -187,8 +186,7 @@ int mtk_clk_register_muxes(const struct mtk_mux
> *muxes,
>  			clk = mtk_clk_register_mux(mux, regmap, lock);
>  
>  			if (IS_ERR(clk)) {
> -				pr_err("Failed to register clk %s:
> %ld\n",
> -				       mux->name, PTR_ERR(clk));
> +				pr_err("Failed to register clk %s:
> %pe\n", mux->name, clk);
>  				continue;
>  			}
>  
> diff --git a/drivers/clk/mediatek/clk-pll.c
> b/drivers/clk/mediatek/clk-pll.c
> index 60d7ffa0b924..f04f724e12e5 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -378,8 +378,7 @@ void mtk_clk_register_plls(struct device_node
> *node,
>  		clk = mtk_clk_register_pll(pll, base);
>  
>  		if (IS_ERR(clk)) {
> -			pr_err("Failed to register clk %s: %ld\n",
> -					pll->name, PTR_ERR(clk));
> +			pr_err("Failed to register clk %s: %pe\n", pll-
> >name, clk);
>  			continue;
>  		}
>  
> diff --git a/drivers/clk/mediatek/reset.c
> b/drivers/clk/mediatek/reset.c
> index ffe464ce7ff8..bcec4b89f449 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -100,8 +100,7 @@ static void
> mtk_register_reset_controller_common(struct device_node *np,
>  
>  	regmap = device_node_to_regmap(np);
>  	if (IS_ERR(regmap)) {
> -		pr_err("Cannot find regmap for %pOF: %ld\n", np,
> -				PTR_ERR(regmap));
> +		pr_err("Cannot find regmap for %pOF: %pe\n", np,
> regmap);
>  		return;
>  	}
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
