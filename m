Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FB2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 07:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R81FchDkbu47MLGkbZq068fmSCqgff7epq28wQZQ9Ps=; b=UhV1O3fKGupHSP
	fBXyIvGS5UtMx4+tFOiL58M0+F5Wkdk+iXa2evgZDc28VkfTYaHUqnca4Z0ZHiZo7zaGJOaDozaRw
	AyZ2Qw/wQN/H1HpYXixS/bAqgw1mBq99bT0GWQNNy64TPUioHhcpWipVXvW3Zptkl3+qHaLcV1jjy
	IqftnOh8xJQMxbjD1MlNLfuCcVhwkWteisLfUEglx2hgPGS7zul68s9GhwM1DaQaOERrHDj+MW5tx
	AQZYDJpvox8oNdwwdrTC2OJyElho19Zfi3gOEv0LBb4nXcMzhHmLYBLu44ornd1OOcSQmInrIxdpC
	Heqi/sHrlEV34EQZCFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJruh-000zcr-Tl; Tue, 15 Feb 2022 07:06:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJruS-000zRl-NX; Tue, 15 Feb 2022 07:06:02 +0000
X-UUID: 1f3f2da9896d47f68ad32d3739b50127-20220215
X-UUID: 1f3f2da9896d47f68ad32d3739b50127-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1524181468; Tue, 15 Feb 2022 00:05:59 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 23:05:57 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 15:05:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 15:05:56 +0800
Message-ID: <3062ed3573797e18997ac4fc9d37a898056fdf59.camel@mediatek.com>
Subject: Re: [PATCH v3 25/31] clk: mediatek: pll: Implement error handling
 in register API
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 15:05:56 +0800
In-Reply-To: <20220208124034.414635-26-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-26-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_230600_813332_F6CCF096 
X-CRM114-Status: GOOD (  22.72  )
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
> The pll clk type registration function does not stop or return errors
> if any clk failed to be registered, nor does it implement an error
> handling path. This may result in a partially working device if any
> step failed.
> 
> Make the register function return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, and unmap the I/O space, is done in the new
> error path.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 23 +++++++++++++++++++----
>  drivers/clk/mediatek/clk-pll.h |  6 +++---
>  2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c
> b/drivers/clk/mediatek/clk-pll.c
> index 8439d37e354d..817a80293bfc 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -377,8 +377,9 @@ static void mtk_clk_unregister_pll(struct clk
> *clk)
>  	kfree(pll);
>  }
>  
> -void mtk_clk_register_plls(struct device_node *node,
> -		const struct mtk_pll_data *plls, int num_plls, struct
> clk_onecell_data *clk_data)
> +int mtk_clk_register_plls(struct device_node *node,
> +			  const struct mtk_pll_data *plls, int
> num_plls,
> +			  struct clk_onecell_data *clk_data)
>  {
>  	void __iomem *base;
>  	int i;
> @@ -387,7 +388,7 @@ void mtk_clk_register_plls(struct device_node
> *node,
>  	base = of_iomap(node, 0);
>  	if (!base) {
>  		pr_err("%s(): ioremap failed\n", __func__);
> -		return;
> +		return -EINVAL;
>  	}
>  
>  	for (i = 0; i < num_plls; i++) {
> @@ -397,11 +398,25 @@ void mtk_clk_register_plls(struct device_node
> *node,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", pll-
> >name, clk);
> -			continue;
> +			goto err;
>  		}
>  
>  		clk_data->clks[pll->id] = clk;
>  	}
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0) {
> +		const struct mtk_pll_data *pll = &plls[i];
> +
> +		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
> +		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
> +	}
> +
> +	iounmap(base);
> +
> +	return PTR_ERR(clk);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
>  
> diff --git a/drivers/clk/mediatek/clk-pll.h
> b/drivers/clk/mediatek/clk-pll.h
> index a889b1e472e7..bf06e44caef9 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -48,9 +48,9 @@ struct mtk_pll_data {
>  	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
>  };
>  
> -void mtk_clk_register_plls(struct device_node *node,
> -			   const struct mtk_pll_data *plls, int
> num_plls,
> -			   struct clk_onecell_data *clk_data);
> +int mtk_clk_register_plls(struct device_node *node,
> +			  const struct mtk_pll_data *plls, int
> num_plls,
> +			  struct clk_onecell_data *clk_data);
>  void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int
> num_plls,
>  			     struct clk_onecell_data *clk_data);
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
