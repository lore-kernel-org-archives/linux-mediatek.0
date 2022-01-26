Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B01FC2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 08:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sH75EpIBDHVDtkgWaBAC2uTtJfP783G2OhXmkQhNkDk=; b=JvL54A0Z8wwwIw
	6Yx9rVgA4ndm/IAVCa6auiJTOOwN34/54Y93xDf1Fj+z/2fdsndOucGa3JwSF4lKhT5ekNln040Gw
	hBpQV5MP/y8XQFjcvAlByHgLZvYxmfCZ7fa+L3oPOtLJTt8836A/Lf+iARpoQJxAHbajZDGmgkrkL
	DtQuqJ2/+B148Cv2U0qLrSOa/mWBEhQSjoaka4LX+fAoh9Wqc6rg5agGvbT47bHsvJhEnWiqkJU/4
	2QXtcR704fGPUFLe5kyTH8t86XtiTCJRLVmJehHdaoGlsUw2B8Nvbh4j8t9zRvlB4LhgYNoS9ukL/
	bFiPZt1AxTerDVlG2jHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCdWR-00AgL6-4D; Wed, 26 Jan 2022 08:19:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCdVx-00AgB0-N6; Wed, 26 Jan 2022 08:18:51 +0000
X-UUID: 9d89ccc3ec20402eb8e9a35b79a8a635-20220126
X-UUID: 9d89ccc3ec20402eb8e9a35b79a8a635-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 277525680; Wed, 26 Jan 2022 01:18:46 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 00:13:39 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 16:13:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 16:13:37 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 25/31] clk: mediatek: pll: Implement error handling in
 register API
Date: Wed, 26 Jan 2022 16:13:38 +0800
Message-ID: <20220126081338.4114-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-26-wenst@chromium.org>
References: <20220122091731.283592-26-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_001849_796407_4391570E 
X-CRM114-Status: GOOD (  22.91  )
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

Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 23 +++++++++++++++++++----
>  drivers/clk/mediatek/clk-pll.h |  6 +++---
>  2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 9698d1c97cd6..1dd15f560659 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -369,8 +369,9 @@ static void mtk_clk_unregister_pll(struct clk *clk)
>  	kfree(pll);
>  }
>  
> -void mtk_clk_register_plls(struct device_node *node,
> -		const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
> +int mtk_clk_register_plls(struct device_node *node,
> +			  const struct mtk_pll_data *plls, int num_plls,
> +			  struct clk_onecell_data *clk_data)
>  {
>  	void __iomem *base;
>  	int i;
> @@ -379,7 +380,7 @@ void mtk_clk_register_plls(struct device_node *node,
>  	base = of_iomap(node, 0);
>  	if (!base) {
>  		pr_err("%s(): ioremap failed\n", __func__);
> -		return;
> +		return -EINVAL;
>  	}
>  
>  	for (i = 0; i < num_plls; i++) {
> @@ -389,11 +390,25 @@ void mtk_clk_register_plls(struct device_node *node,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", pll->name, clk);
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
> +	};
> +
> +	iounmap(base);
> +
> +	return PTR_ERR(clk);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
>  
> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
> index a889b1e472e7..bf06e44caef9 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -48,9 +48,9 @@ struct mtk_pll_data {
>  	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
>  };
>  
> -void mtk_clk_register_plls(struct device_node *node,
> -			   const struct mtk_pll_data *plls, int num_plls,
> -			   struct clk_onecell_data *clk_data);
> +int mtk_clk_register_plls(struct device_node *node,
> +			  const struct mtk_pll_data *plls, int num_plls,
> +			  struct clk_onecell_data *clk_data);
>  void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
>  			     struct clk_onecell_data *clk_data);
>  
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
