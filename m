Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B27C28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6o3ZmnQMVvJUmELCDLOe73Mc2O0Mkpp6PlZcLdeY9E=; b=qdWjf/7TZT9I7U
	+VeZmj56NNgVSGgm/4ySg06qqcCLBTg1R13Ay3IhYaqufwyjVWxQFOc00TJ4vO0DMt3lAg9jUN7pl
	RKLi5+SrqZNYNohcx7VPpgIYWnsG0f3B5DqTm6lp984jJewJfwP+SVULBYiif2Tg4S9cHn4Y6uvPC
	18bSai43BefE1wxLduC9QRAWGLFiof9ocCTCx3UJZPyyxX7/PIQVxb8g0Lj00QB+aot0HNhrV9fOE
	RmuWtjo2PrYuHZvBrViErmzETqZrTWmX6ShiOoWFIp6wQZgfP7cFLSnQ9lqViwPb7k5RZ2j+cFeCn
	WyhQXi++qgb3I42/qSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCdWA-00AgFA-LL; Wed, 26 Jan 2022 08:19:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCdVw-00AgAv-8I; Wed, 26 Jan 2022 08:18:49 +0000
X-UUID: 5eddeb59a63e4820b7d08df15355be73-20220126
X-UUID: 5eddeb59a63e4820b7d08df15355be73-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1727298200; Wed, 26 Jan 2022 01:18:46 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 00:08:44 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 16:08:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 16:08:36 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 23/31] clk: mediatek: mux: Reverse check for existing clk
 to reduce nesting level
Date: Wed, 26 Jan 2022 16:08:36 +0800
Message-ID: <20220126080836.1148-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-24-wenst@chromium.org>
References: <20220122091731.283592-24-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_001848_346477_58307605 
X-CRM114-Status: GOOD (  18.95  )
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

> The clk registration code here currently does:
> 
>     if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
>             ... do clk registration ...
>     }
> 
> This extra level of nesting wastes screen real estate.
> 
> Reduce the nesting level by reversing the conditional shown above.
> Other than that, functionality is not changed.
>
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mux.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> Diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> Index 01af6a52711a..70aa42144632 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -208,16 +208,17 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>  	for (i = 0; i < num; i++) {
>  		const struct mtk_mux *mux = &muxes[i];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
> -			clk = mtk_clk_register_mux(mux, regmap, lock);
> +		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id]))
> +			continue;
>  
> -			if (IS_ERR(clk)) {
> -				pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
> -				continue;
> -			}
> +		clk = mtk_clk_register_mux(mux, regmap, lock);
>  
> -			clk_data->clks[mux->id] = clk;
> +		if (IS_ERR(clk)) {
> +			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
> +			continue;
>  		}
> +
> +		clk_data->clks[mux->id] = clk;
>  	}
>  
>  	return 0;
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
