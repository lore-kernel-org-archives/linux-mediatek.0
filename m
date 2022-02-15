Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA46C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7K7v9om7Cj9WWJATufj2do5Ftws938/uuwgZppDhho=; b=IlmpxG4ERgd6Ic
	9XdIhwW5+14JR9LUPPeh9MWLvYlKq8F1A+zFlalyXY+ec5EuD5+/fWjv4U42+2A9WBra3VfyZP2EU
	b/Z0h5mgrUTeGugea8LLpN1U5zLlQMBEiWWlcmlee/3oM16V6u9peZHwo7gR1G0ct9s8JtmMmXt4g
	oEw7dTTaLJSdEqlpVj8DkyXJ7jim9I6SVcz0/6av1QRgas73vNM4IXSDtVbowJx39igmozHvwbi+M
	qCPoyOP5+9taExqw7fc3njYZwJkP5npB46hbvmheV38VOly1fN+DLAZxKrPrv15jF12HGgMEBSocR
	Axtr9b1FQzzBQEH7Ty+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrb9-000pox-Nf; Tue, 15 Feb 2022 06:46:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrac-000pUD-Pf; Tue, 15 Feb 2022 06:45:33 +0000
X-UUID: eaea4b5ef76e466089e90039043475e4-20220214
X-UUID: eaea4b5ef76e466089e90039043475e4-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1800972512; Mon, 14 Feb 2022 23:45:28 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:37:00 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 14:36:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:36:52 +0800
Message-ID: <a1bd326e24c36995b049a3957cf5323c4af27fc3.camel@mediatek.com>
Subject: Re: [PATCH v3 17/31] clk: mediatek: Implement
 mtk_clk_unregister_divider_clks() API
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:36:52 +0800
In-Reply-To: <20220208124034.414635-18-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-18-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_224530_845109_3283526E 
X-CRM114-Status: GOOD (  21.28  )
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
> mtk_clk_register_divider_clks(), as the name suggests, is used to
> register
> a given list of divider clks. However it is lacking a counterpart
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
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  8 +++++---
>  2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c
> b/drivers/clk/mediatek/clk-mtk.c
> index b267b2f04b84..3a6dfe445e63 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -286,6 +286,25 @@ void mtk_clk_register_dividers(const struct
> mtk_clk_divider *mcds,
>  	}
>  }
>  
> +void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds,
> int num,
> +				 struct clk_onecell_data *clk_data)
> +{
> +	int i;
> +
> +	if (!clk_data)
> +		return;
> +
> +	for (i = num; i > 0; i--) {
> +		const struct mtk_clk_divider *mcd = &mcds[i - 1];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
> +			continue;
> +
> +		clk_unregister_divider(clk_data->clks[mcd->id]);
> +		clk_data->clks[mcd->id] = ERR_PTR(-ENOENT);
> +	}
> +}
> +
>  int mtk_clk_simple_probe(struct platform_device *pdev)
>  {
>  	const struct mtk_clk_desc *mcd;
> diff --git a/drivers/clk/mediatek/clk-mtk.h
> b/drivers/clk/mediatek/clk-mtk.h
> index 4db1a97c1250..e3ae22fb0334 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -176,9 +176,11 @@ struct mtk_clk_divider {
>  		.div_width = _width,				\
>  }
>  
> -void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
> -			int num, void __iomem *base, spinlock_t *lock,
> -				struct clk_onecell_data *clk_data);
> +void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
> int num,
> +			       void __iomem *base, spinlock_t *lock,
> +			       struct clk_onecell_data *clk_data);
> +void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds,
> int num,
> +				 struct clk_onecell_data *clk_data);
>  
>  struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
>  void mtk_free_clk_data(struct clk_onecell_data *clk_data);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
