Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866D6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6+JhHkSBwBKnPcDJUk/zbHXEmWQdHUgtaVofjjtrPk=; b=FqUgZ39CIdNr2r
	Dq34PsHXaz3wQkUUI9/tIBwJXzmc7d+B32P4QAvmEawajHFN7o5KGV64pRPtpSSEI0YoWQ6gNvdN2
	dvQ4JyUwXBnCCAOwhilNbvPonc6HfL5zq4ZtmT0dDTqsLMiocxmvODqfOg33ShnS2GV26vMUvG8dm
	sZfg7co/9RSUm6+1kqGv8SidYr+eb2jsTrmZepfV/XVo+mD6pnAqv+u5cEqGiydSZ4cn2rZjhJkWV
	k+zpsLko2RRgPuIkI233lxOr/guXXDMwRhDvPuf/x/+Qhn1bDwkArt8QTZJCMaXWBFNTikaiEPrP3
	qMDs1Zmt5g0ht/rLFEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCPlk-0093yC-PV; Tue, 25 Jan 2022 17:38:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCPek-0090ot-Jp; Tue, 25 Jan 2022 17:31:00 +0000
X-UUID: a0047a59d1b74fc8b02505d1635398b8-20220125
X-UUID: a0047a59d1b74fc8b02505d1635398b8-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 199575884; Tue, 25 Jan 2022 10:30:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 09:20:49 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 26 Jan 2022 01:20:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 01:20:48 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 09/31] clk: mediatek: mux: Implement unregister API
Date: Wed, 26 Jan 2022 01:20:48 +0800
Message-ID: <20220125172048.4239-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-10-wenst@chromium.org>
References: <20220122091731.283592-10-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_093058_703790_08EBCC5F 
X-CRM114-Status: GOOD (  20.21  )
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

> The mux clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the mux type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-mux.c | 35 ++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mux.h |  3 +++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> index 89f23e111d91..6f0c22a699c3 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -164,6 +164,21 @@ static struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
>  	return clk;
>  }
>  
> +static void mtk_clk_unregister_mux(struct clk *clk)
> +{
> +	struct mtk_clk_mux *mux;
> +	struct clk_hw *hw;
> +
> +	hw = __clk_get_hw(clk);
> +	if (!hw)
> +		return;
> +
> +	mux = to_mtk_clk_mux(hw);
> +
> +	clk_unregister(clk);
> +	kfree(mux);
> +}
> +
>  int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>  			   int num, struct device_node *node,
>  			   spinlock_t *lock,
> @@ -198,4 +213,24 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
>  
> +void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
> +			      struct clk_onecell_data *clk_data)
> +{
> +	int i;
> +
> +	if (!clk_data)
> +		return;
> +
> +	for (i = num; i > 0; i--) {
> +		const struct mtk_mux *mux = &muxes[i - 1];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
> +			continue;
> +
> +		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
> +		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_clk_unregister_muxes);
> +
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> index 27841d649118..cb2ac4f04c58 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -88,4 +88,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
>  			   spinlock_t *lock,
>  			   struct clk_onecell_data *clk_data);
>  
> +void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
> +			      struct clk_onecell_data *clk_data);
> +
>  #endif /* __DRV_CLK_MTK_MUX_H */
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
