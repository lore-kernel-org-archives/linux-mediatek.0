Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A7BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuhDYgqwbNE6Zb+BgfKjc/vMGojSKWTHHM7EthA4gVg=; b=yzRQZvX0Otn9+f
	HG2xduw0zmWsmE26ka+UiSEuxDxYWLajLG+mJtMJ3V5OVNLUPE3eD3TKuhAAKMQwGPD73ErsEPNdr
	kC37qp5A07CX4v38SWgwngi1xwO9aWvuzShOtBqCvOvANvo/4aGoCBBrfD9eVtnYM3RnkVx27sblf
	vrJT40B6EIUMbrY485Ld/+aGB2UOu6aAHkkKHYI0Ex742mjpvG66u/lv8SsXwdyS60f9muKl1OCe3
	ccF5DM78lsbyaPx5gtR4gasqR63D4sov4PtjArARQo/lszYKb2zaGq+SAua9koUmXy9/92p0j07km
	SbWW5pgvV/hi9Y+Rl6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrPM-000hTK-Qr; Tue, 15 Feb 2022 06:33:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrP2-000hF1-O3; Tue, 15 Feb 2022 06:33:34 +0000
X-UUID: 52d63be7b12b4d589699161b8d06380b-20220214
X-UUID: 52d63be7b12b4d589699161b8d06380b-20220214
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1923553474; Mon, 14 Feb 2022 23:33:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:33:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 15 Feb 2022 14:33:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:33:25 +0800
Message-ID: <38e537baa8153bbdc6963addf349570ae8189133.camel@mediatek.com>
Subject: Re: [PATCH v3 13/31] clk: mediatek: pll: Implement unregister API
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:33:26 +0800
In-Reply-To: <20220208124034.414635-14-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-14-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_223332_835225_58D87530 
X-CRM114-Status: GOOD (  24.59  )
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
> The PLL clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the PLL type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 55
> ++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-pll.h |  2 ++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c
> b/drivers/clk/mediatek/clk-pll.c
> index 64f59554bc9b..b54e33b75d4e 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -360,6 +360,21 @@ static struct clk *mtk_clk_register_pll(const
> struct mtk_pll_data *data,
>  	return clk;
>  }
>  
> +static void mtk_clk_unregister_pll(struct clk *clk)
> +{
> +	struct clk_hw *hw;
> +	struct mtk_clk_pll *pll;
> +
> +	hw = __clk_get_hw(clk);
> +	if (!hw)
> +		return;
> +
> +	pll = to_mtk_clk_pll(hw);
> +
> +	clk_unregister(clk);
> +	kfree(pll);
> +}
> +
>  void mtk_clk_register_plls(struct device_node *node,
>  		const struct mtk_pll_data *plls, int num_plls, struct
> clk_onecell_data *clk_data)
>  {
> @@ -388,4 +403,44 @@ void mtk_clk_register_plls(struct device_node
> *node,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
>  
> +static __iomem void *mtk_clk_pll_get_base(struct clk *clk,
> +					  const struct mtk_pll_data
> *data)
> +{
> +	struct clk_hw *hw = __clk_get_hw(clk);
> +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> +
> +	return pll->base_addr - data->reg;
> +}
> +
> +void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int
> num_plls,
> +			     struct clk_onecell_data *clk_data)
> +{
> +	__iomem void *base = NULL;
> +	int i;
> +
> +	if (!clk_data)
> +		return;
> +
> +	for (i = num_plls; i > 0; i--) {
> +		const struct mtk_pll_data *pll = &plls[i - 1];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[pll->id]))
> +			continue;
> +
> +		/*
> +		 * This is quite ugly but unfortunately the clks don't
> have
> +		 * any device tied to them, so there's no place to
> store the
> +		 * pointer to the I/O region base address. We have to
> fetch
> +		 * it from one of the registered clks.
> +		 */
> +		base = mtk_clk_pll_get_base(clk_data->clks[pll->id],
> pll);
> +
> +		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
> +		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
> +	}
> +
> +	iounmap(base);
> +}
> +EXPORT_SYMBOL_GPL(mtk_clk_unregister_plls);
> +
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/mediatek/clk-pll.h
> b/drivers/clk/mediatek/clk-pll.h
> index d01b0c38311d..a889b1e472e7 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -51,5 +51,7 @@ struct mtk_pll_data {
>  void mtk_clk_register_plls(struct device_node *node,
>  			   const struct mtk_pll_data *plls, int
> num_plls,
>  			   struct clk_onecell_data *clk_data);
> +void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int
> num_plls,
> +			     struct clk_onecell_data *clk_data);
>  
>  #endif /* __DRV_CLK_MTK_PLL_H */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
