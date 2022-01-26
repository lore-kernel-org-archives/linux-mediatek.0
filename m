Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D45C63682
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxa2Ze1FNS48r7OUpgoe4OmRADW/AZsQqAiZuUF/xzY=; b=ydkgBdr2EyMtAZ
	uGcu3VJhp3QQ7mAVOmmYdqd7i/hc5gdNW0JaFnGo0i2pma+ROm+gkMCxoJoV4HlxUAwsXaEqec64A
	OUhVNcGlUQcHM5Liu7APsQ/vGsESE+Uonl072UMGh+rcywF9JNcPRMhF2jVUnA9HfJEFm0WRP0t2H
	b8ZyOIYUd3N0z4KD/KEnNC3c6mil/599jR+jgwrgg4LC/Yuqqio6TQ7mgwoGQswL4LFpcyRyVInp+
	D3n0U+38s67lVBk7wxC1sQAepHXv2Q5ItDqqTj1SF7uAcJYOnDgPgH9nNh4KNYBGW9y338y5kZM9z
	sZWvTTvYFx64S00vbzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCcEz-00ANmf-Oi; Wed, 26 Jan 2022 06:57:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCcEn-00ANiv-0I; Wed, 26 Jan 2022 06:57:02 +0000
X-UUID: 559f63bfb3b444eab6a64f5f472d3e29-20220125
X-UUID: 559f63bfb3b444eab6a64f5f472d3e29-20220125
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1385266110; Tue, 25 Jan 2022 23:56:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 22:56:55 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 26 Jan 2022 14:56:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 14:56:54 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 16/31] clk: mediatek: Implement
 mtk_clk_unregister_factors() API
Date: Wed, 26 Jan 2022 14:56:54 +0800
Message-ID: <20220126065654.23309-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-17-wenst@chromium.org>
References: <20220122091731.283592-17-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_225701_078400_1A17466C 
X-CRM114-Status: GOOD (  21.47  )
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

> mtk_clk_register_factors(), as the name suggests, is used to register
> a given list of fixed factor clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 20 ++++++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  6 ++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index 7c0d5706eed7..b267b2f04b84 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -126,6 +126,26 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
>  
> +void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
> +				struct clk_onecell_data *clk_data)
> +{
> +	int i;
> +
> +	if (!clk_data)
> +		return;
> +
> +	for (i = num; i > 0; i--) {
> +		const struct mtk_fixed_factor *ff = &clks[i - 1];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[ff->id]))
> +			continue;
> +
> +		clk_unregister_fixed_factor(clk_data->clks[ff->id]);
> +		clk_data->clks[ff->id] = ERR_PTR(-ENOENT);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_clk_unregister_factors);
> +
>  struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
>  		void __iomem *base, spinlock_t *lock)
>  {
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index cc7f920eabb4..4db1a97c1250 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -55,8 +55,10 @@ struct mtk_fixed_factor {
>  		.div = _div,				\
>  	}
>  
> -void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
> -		int num, struct clk_onecell_data *clk_data);
> +void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
> +			      struct clk_onecell_data *clk_data);
> +void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
> +				struct clk_onecell_data *clk_data);
>  
>  struct mtk_composite {
>  	int id;
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
