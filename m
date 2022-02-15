Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87D2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrlqYBYVG5VMflUJkvumLm4knaylEvDMLJ5R3nvMe30=; b=AoNpq+qa/XGaUo
	8RcPSim91zz9H97eoopcysAyovtKOg7otr57VR/vEbP0dyzbbAHIoeQHHWSnpx3lP2iNakBtw9ZOJ
	C5FTLMlUbAgK2SOnOdYpsXMfvTmM0KuTy7D+bYLdcuDIyfMlmxs/X14w5k+NbZBHSBqkQh7LVJ6rD
	kE8gzxvJxhxiXExWcr6Joy6yJyHKbpy1oj9T4xZ7OXoX0E5TOxLMUY0lgD5rIUXLUZfZZ96Fh0pXp
	I3K23fVFVw6Jwgv8I5BBrr2EbVpSZstUdLErDzMEwp8YhdSswDr/sAJhr95JzsYIqWqG1t+VPVFko
	iQpFPhnQ9GTgxuzG2i3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrSd-000k0N-Sc; Tue, 15 Feb 2022 06:37:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrR9-000ivT-E2; Tue, 15 Feb 2022 06:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=F/eRIsBnxzkrhOMnLv0CkE9jjHf+FVu1oiXo1iiHAPg=; b=Ul1yznWKmCwwBUH1A2uCqm5Q/+
 W95abjcMiWB4sobuHOlTMqyLmZONt4uQoL+hYZ9AYfcJJn4Uh9zZb2iUjhOnrYhfSenuLLOFO83kp
 jc9mVNNi6OFDDqjGGtu4Jgm86SQYdx9MVTFNOlDUfSna0mYmUJTN5GXS/cwGDBIkyQRfjI9XR5yqk
 zuY9IlJ2Qwhb2bDK1xDyEV4Chk1xxUyB310H+mTQc7bA8VEmqd2g2O8XHWD8AYDRN1WkrR42jOjOI
 QomIAwIZOIiNsH64xMVmTNl/L8Yh5cuApBY2oLxV6PcUkSycNAkMYN7Ri9MWcoUCs4ez3Uzvypk28
 5ahvAHDA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrR3-00A4lc-Ih; Tue, 15 Feb 2022 06:35:41 +0000
X-UUID: 3eafeb53a0e74c82a46de6b5a197c2b7-20220214
X-UUID: 3eafeb53a0e74c82a46de6b5a197c2b7-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 20633303; Mon, 14 Feb 2022 23:35:23 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:30:08 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 14:30:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:30:01 +0800
Message-ID: <b9efa24d2309743b785accc454f35b4b78c6eca9.camel@mediatek.com>
Subject: Re: [PATCH v3 09/31] clk: mediatek: mux: Implement unregister API
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:30:01 +0800
In-Reply-To: <20220208124034.414635-10-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-10-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_063538_123957_D49E8A73 
X-CRM114-Status: GOOD (  19.71  )
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
> The mux clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the mux type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mux.c | 35
> ++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mux.h |  3 +++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c
> b/drivers/clk/mediatek/clk-mux.c
> index 89f23e111d91..6f0c22a699c3 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -164,6 +164,21 @@ static struct clk *mtk_clk_register_mux(const
> struct mtk_mux *mux,
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
> @@ -198,4 +213,24 @@ int mtk_clk_register_muxes(const struct mtk_mux
> *muxes,
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
> diff --git a/drivers/clk/mediatek/clk-mux.h
> b/drivers/clk/mediatek/clk-mux.h
> index 27841d649118..cb2ac4f04c58 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -88,4 +88,7 @@ int mtk_clk_register_muxes(const struct mtk_mux
> *muxes,
>  			   spinlock_t *lock,
>  			   struct clk_onecell_data *clk_data);
>  
> +void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
> +			      struct clk_onecell_data *clk_data);
> +
>  #endif /* __DRV_CLK_MTK_MUX_H */


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
