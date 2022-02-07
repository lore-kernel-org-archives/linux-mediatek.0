Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E859C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 02:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OfEVKtveCcidduBQqIy/OaawaoNwFOFqueWprRUqtms=; b=2b2qxip0io2jwo
	o+yi69Lf8eLItMUIW3OuJIf+lxxIZ6joaCalgGVTCQTwOIZw8QfoLvCukpFM2BDto651aBTPTE05Q
	GB2nAV9yNqOQNDQMHlLZGfv1xDkfYmAMBkFCrG2nS6yf6+YTCS2bmU6C7KFkypuzeXbPGpxapFc1p
	wy7sdv+eEpBzDwNr2Xrx8nYa39vlckWLM8Nq5YQN5lHeMcD4qIXUruU6+g903RG3EUIafQq/rlBnm
	sXfLTbL7kbvEOZjznJbjWsFnyAHa7vA3poVbn3GD3bAXIGV9rdDryVn4xhcef8iP+3T12qIGtk4QW
	1DAzaw8cdRAQDBKU++gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGuC4-008tgV-Mx; Mon, 07 Feb 2022 02:55:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGuBt-008tfC-5s; Mon, 07 Feb 2022 02:55:46 +0000
X-UUID: a9ad14c48d1d4ecabbd856cb5200ef3c-20220206
X-UUID: a9ad14c48d1d4ecabbd856cb5200ef3c-20220206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1882740406; Sun, 06 Feb 2022 19:55:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Feb 2022 18:47:26 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Feb 2022 10:47:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Feb 2022 10:47:24 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH v2 13/31] clk: mediatek: pll: Implement unregister API
Date: Mon, 7 Feb 2022 10:47:25 +0800
Message-ID: <20220207024725.14618-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220202134834.690675-14-wenst@chromium.org>
References: <20220202134834.690675-14-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_185545_251910_153DB656 
X-CRM114-Status: GOOD (  23.57  )
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

> The PLL clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the PLL type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-pll.c | 55 ++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-pll.h |  2 ++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 64f59554bc9b..b54e33b75d4e 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -360,6 +360,21 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
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
>  		const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
>  {
> @@ -388,4 +403,44 @@ void mtk_clk_register_plls(struct device_node *node,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
>  
> +static __iomem void *mtk_clk_pll_get_base(struct clk *clk,
> +					  const struct mtk_pll_data *data)
> +{
> +	struct clk_hw *hw = __clk_get_hw(clk);
> +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> +
> +	return pll->base_addr - data->reg;
> +}
> +
> +void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
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
> +		 * This is quite ugly but unfortunately the clks don't have
> +		 * any device tied to them, so there's no place to store the
> +		 * pointer to the I/O region base address. We have to fetch
> +		 * it from one of the registered clks.
> +		 */
> +		base = mtk_clk_pll_get_base(clk_data->clks[pll->id], pll);
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
> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
> index d01b0c38311d..a889b1e472e7 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -51,5 +51,7 @@ struct mtk_pll_data {
>  void mtk_clk_register_plls(struct device_node *node,
>  			   const struct mtk_pll_data *plls, int num_plls,
>  			   struct clk_onecell_data *clk_data);
> +void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
> +			     struct clk_onecell_data *clk_data);
>  
>  #endif /* __DRV_CLK_MTK_PLL_H */
> -- 
> 2.35.0.rc2.247.g8bbb082509-goog
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
