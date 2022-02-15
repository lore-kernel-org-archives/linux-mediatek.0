Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B26C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 07:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1INWFtz/4DG5EcFQV73kZm6Zr9m0aGFjXPGmSiwYf4=; b=TLuK3SPntGsRps
	sDxax5NDR7LRwOwNgNKLr9TGbqTnnCOs38gZZZEaz5jTK6edqgRM0MdX0C+Q8l57LNF1/VFjD2Vhh
	EDZN3g37i/nR4cvyVdKrYHu3IiaN/08g7TvH8U6w0ACMeRSUpEHwwXhrDURH9RGUJMsKSh4xyJ9ig
	f6xGsUI6CaXe6gkdyFhkk8R/njgJrAMKSND1hQH2jH0cG+4RArGH/85QX6/0VBq9dikOtJxYZCdZO
	uS0d+/dGVCY4eZJce3scQQriITd0moVE5HlZdFFeX4emowJa/BbD/Xk2g1oXrJ9UIJW2ITIa2c0Bq
	fs5tjwZnWlIDYASnfQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJsWa-001KNq-SW; Tue, 15 Feb 2022 07:45:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrSw-000kGK-TD; Tue, 15 Feb 2022 06:37:36 +0000
X-UUID: b097b2f5443742faa4dae8b13e24f04b-20220214
X-UUID: b097b2f5443742faa4dae8b13e24f04b-20220214
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1185660336; Mon, 14 Feb 2022 23:37:33 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:37:32 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 14:37:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:37:30 +0800
Message-ID: <d564f1566e970647e105433316f3c4fa3f847df3.camel@mediatek.com>
Subject: Re: [PATCH v3 18/31] clk: mediatek: Implement
 mtk_clk_unregister_composites() API
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:37:30 +0800
In-Reply-To: <20220208124034.414635-19-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-19-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_223735_006578_2629AE47 
X-CRM114-Status: GOOD (  21.45  )
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
> mtk_clk_register_composites(), as the name suggests, is used to
> register
> a given list of composite clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform
> drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 46
> ++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c
> b/drivers/clk/mediatek/clk-mtk.c
> index 3a6dfe445e63..869e6ae55c82 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -233,6 +233,32 @@ struct clk *mtk_clk_register_composite(const
> struct mtk_composite *mc,
>  	return ERR_PTR(ret);
>  }
>  
> +static void mtk_clk_unregister_composite(struct clk *clk)
> +{
> +	struct clk_hw *hw;
> +	struct clk_composite *composite;
> +	struct clk_mux *mux = NULL;
> +	struct clk_gate *gate = NULL;
> +	struct clk_divider *div = NULL;
> +
> +	hw = __clk_get_hw(clk);
> +	if (!hw)
> +		return;
> +
> +	composite = to_clk_composite(hw);
> +	if (composite->mux_hw)
> +		mux = to_clk_mux(composite->mux_hw);
> +	if (composite->gate_hw)
> +		gate = to_clk_gate(composite->gate_hw);
> +	if (composite->rate_hw)
> +		div = to_clk_divider(composite->rate_hw);
> +
> +	clk_unregister_composite(clk);
> +	kfree(div);
> +	kfree(gate);
> +	kfree(mux);
> +}
> +
>  void mtk_clk_register_composites(const struct mtk_composite *mcs,
>  		int num, void __iomem *base, spinlock_t *lock,
>  		struct clk_onecell_data *clk_data)
> @@ -259,6 +285,26 @@ void mtk_clk_register_composites(const struct
> mtk_composite *mcs,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_composites);
>  
> +void mtk_clk_unregister_composites(const struct mtk_composite *mcs,
> int num,
> +				   struct clk_onecell_data *clk_data)
> +{
> +	int i;
> +
> +	if (!clk_data)
> +		return;
> +
> +	for (i = num; i > 0; i--) {
> +		const struct mtk_composite *mc = &mcs[i - 1];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[mc->id]))
> +			continue;
> +
> +		mtk_clk_unregister_composite(clk_data->clks[mc->id]);
> +		clk_data->clks[mc->id] = ERR_PTR(-ENOENT);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_clk_unregister_composites);
> +
>  void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
>  			int num, void __iomem *base, spinlock_t *lock,
>  				struct clk_onecell_data *clk_data)
> diff --git a/drivers/clk/mediatek/clk-mtk.h
> b/drivers/clk/mediatek/clk-mtk.h
> index e3ae22fb0334..3c3a934f53cd 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -153,6 +153,8 @@ struct clk *mtk_clk_register_composite(const
> struct mtk_composite *mc,
>  void mtk_clk_register_composites(const struct mtk_composite *mcs,
>  		int num, void __iomem *base, spinlock_t *lock,
>  		struct clk_onecell_data *clk_data);
> +void mtk_clk_unregister_composites(const struct mtk_composite *mcs,
> int num,
> +				   struct clk_onecell_data *clk_data);
>  
>  struct mtk_clk_divider {
>  	int id;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
