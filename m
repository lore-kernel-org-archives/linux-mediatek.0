Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C198C2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 06:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvlOGpHPerwj7nmcpJcNYtbz8bkIduBl1QjyA9pFH3o=; b=N4Y5j1Ofa9kt7z
	/EuyV3WpX1AFvaq7PDR2EsEXtwkn3ZF7svh45hsggMf5zukUV2NBkoqdopvhLpjo+PucOQYOLgh1X
	hlDldGzz8eZ9vZWBHKmsxjCVtM1EHcVYK2UGRL9x8EgjvohHkw49Dakri5/LWlQphSMxJ5vklrFEE
	3p3oiD1Ut21OekZWZNjqsnEPI+gKP/hWiTxcai05MRObSMVtR4rfPyB4DLzy5ynsPhb/F4Be3RFF2
	gUA3aJ78A8HjHeVDc5VRU7+9HsMUON3mMKr/X5js0IMhV3fZ/b59h5bQ/ZWx7yFN15vJpihY33WgG
	m1GamvFIfrwwVz+7PkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCbQQ-00AF8V-SP; Wed, 26 Jan 2022 06:04:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCbQO-00AF7S-9P; Wed, 26 Jan 2022 06:04:57 +0000
X-UUID: b369da00c87041dea544349a5a25ccfb-20220125
X-UUID: b369da00c87041dea544349a5a25ccfb-20220125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1577491538; Tue, 25 Jan 2022 23:04:51 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 22:04:50 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 14:04:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 14:04:48 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 13/31] clk: mediatek: pll: Implement unregister API
Date: Wed, 26 Jan 2022 14:04:49 +0800
Message-ID: <20220126060449.24874-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-10-wenst@chromium.org>
References: <20220122091731.283592-10-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_220456_367285_F757E95F 
X-CRM114-Status: GOOD (  20.02  )
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

> +static void mtk_clk_unregister_pll(struct clk *clk)
> +{
> +	struct clk_hw *hw = __clk_get_hw(clk);
> +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> +
> +	clk_unregister(clk);
> +	kfree(pll);
> +}
> +

mtk_clk_unregister_pll() looks different. 
Do we need to check hw before passing it to to_mtk_clk_pll(hw), like
mtk_clk_unregister_mux()?

>  void mtk_clk_register_plls(struct device_node *node,
>  		const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
>  {
> @@ -388,4 +397,44 @@ void mtk_clk_register_plls(struct device_node *node,
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
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
