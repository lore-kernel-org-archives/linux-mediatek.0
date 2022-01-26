Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E913AC2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 07:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/6SOW08NarIoWnpQEsaLg7aSqYvYG7cwkEEz5Tggi8=; b=NzF1135gMr3A4v
	TiJIc4j1Hf2qTkJZs/KHe1PXg24tEJJ9FM6rr7fokeJ7lQNZq1Sy24FSlNYJq0tDdC6CmyuxaoIaN
	HJp0ARZRiigNSo/Zzf9W4MEk1xSOXIrFEjPljfa7VgTRNqTeeDWx7IC/v4YxQwnHGVET2A/Eh4KGi
	6W5XNBBZ2JBZ1Mpvz1d0kCa6Cwf+hDKYGP14vXxx1B+ziiyXeSIM76B4HG7q8rTFOW3OGZct8oIq1
	E06z8qpYUJbOjq+xJ4Td2cEB5If9qSyT90NWQpDbSeYY3youC0dsL/ielkkS4V20+Y8+9ciJyT640
	xP+S1m3L5zI5J5oOxTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCcSr-00ARBD-Py; Wed, 26 Jan 2022 07:11:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCcSo-00AR9g-U9; Wed, 26 Jan 2022 07:11:32 +0000
X-UUID: c3dd2745fda44bf7abbddb43a39020df-20220126
X-UUID: c3dd2745fda44bf7abbddb43a39020df-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 185514830; Wed, 26 Jan 2022 00:11:28 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 23:06:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 15:06:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 15:06:09 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 18/31] clk: mediatek: Implement
 mtk_clk_unregister_composites() API
Date: Wed, 26 Jan 2022 15:06:09 +0800
Message-ID: <20220126070609.28749-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-19-wenst@chromium.org>
References: <20220122091731.283592-19-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_231131_011168_BA00FB1D 
X-CRM114-Status: GOOD (  21.25  )
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

> mtk_clk_register_composites(), as the name suggests, is used to register
> a given list of composite clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 41 ++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index 3a6dfe445e63..2150ed8678e0 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -233,6 +233,27 @@ struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
>  	return ERR_PTR(ret);
>  }
>  
> +static void mtk_clk_unregister_composite(struct clk *clk)
> +{
> +	struct clk_hw *hw = __clk_get_hw(clk);
> +	struct clk_composite *composite = to_clk_composite(hw);
> +	struct clk_mux *mux = NULL;
> +	struct clk_gate *gate = NULL;
> +	struct clk_divider *div = NULL;

Like mtk_clk_unregister_pll(clk), let's check !hw for consistency
of clk unregister functions.

thanks,
Miles
> +
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
> @@ -259,6 +280,26 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_composites);
>  
> +void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
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
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index e3ae22fb0334..3c3a934f53cd 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -153,6 +153,8 @@ struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
>  void mtk_clk_register_composites(const struct mtk_composite *mcs,
>  		int num, void __iomem *base, spinlock_t *lock,
>  		struct clk_onecell_data *clk_data);
> +void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
> +				   struct clk_onecell_data *clk_data);
>  
>  struct mtk_clk_divider {
>  	int id;
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
