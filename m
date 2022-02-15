Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CD9C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GY2OepMRKyTOJpZGk1RUNwhhp/7G8bVcAYEkJ8VS7bc=; b=WmSWvLAcbWbHsG
	E9t8YU1k5/r1iVnLZ+RgNgXuIUcvAGDojzWhepQfswUQZ+D5hFIhHldAN/o5KjhA5o7T2NmT/kC0E
	vERM81V9PPqDEA2wW5HpKSyt9lfuGrw0jAZhJcpUDCQMCSlZJ7AS/y4hanY4doSv3/WyXtqO/RbYm
	yW7p89Bdz3IQxvkqv7j1Y4W+a89nCdSLj6eRAR1OPKeQO2fFehL+r3M1nc2NRBiV1OOLKggpE2s6+
	zMzS0ALrbDigwqp8Jc0RprKpTBkowsyZ6HD7MWjuVnvMv0uXxhVfAbmEHC7ZQCuKgoMKUhUO9631/
	iaqAg7F8dB4GBJ0H8/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJs2B-0013ov-2l; Tue, 15 Feb 2022 07:13:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJs1a-0013OB-6Q; Tue, 15 Feb 2022 07:13:23 +0000
X-UUID: 30cf25795daf48e6ad8255c0ec182637-20220215
X-UUID: 30cf25795daf48e6ad8255c0ec182637-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 92945036; Tue, 15 Feb 2022 00:13:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 23:04:45 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 15 Feb 2022 15:04:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 15:04:43 +0800
Message-ID: <98904bc971c5368d6f386d9615668025da0d4d4a.camel@mediatek.com>
Subject: Re: [PATCH v3 23/31] clk: mediatek: mux: Reverse check for existing
 clk to reduce nesting level
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 15:04:43 +0800
In-Reply-To: <20220208124034.414635-24-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-24-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_231322_256992_89CE8717 
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

On Tue, 2022-02-08 at 20:40 +0800, Chen-Yu Tsai wrote:
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
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mux.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c
> b/drivers/clk/mediatek/clk-mux.c
> index 01af6a52711a..70aa42144632 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -208,16 +208,17 @@ int mtk_clk_register_muxes(const struct mtk_mux
> *muxes,
>  	for (i = 0; i < num; i++) {
>  		const struct mtk_mux *mux = &muxes[i];
>  
> -		if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
> -			clk = mtk_clk_register_mux(mux, regmap, lock);
> +		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id]))
> +			continue;
>  
> -			if (IS_ERR(clk)) {
> -				pr_err("Failed to register clk %s:
> %pe\n", mux->name, clk);
> -				continue;
> -			}
> +		clk = mtk_clk_register_mux(mux, regmap, lock);
>  
> -			clk_data->clks[mux->id] = clk;
> +		if (IS_ERR(clk)) {
> +			pr_err("Failed to register clk %s: %pe\n", mux-
> >name, clk);
> +			continue;
>  		}
> +
> +		clk_data->clks[mux->id] = clk;
>  	}
>  
>  	return 0;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
