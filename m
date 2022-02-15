Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A414AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2gEQIGCltqHInPsubc15Nzl4Il1BhX8sJiPF4kDTJU=; b=2sOSZqxjPTMl7c
	ticnQ5KCKGMFW4V20Ljni3aJqXbZt3kqvHk/Sl1ZRUbh7IkM0sa2ccMdJhY2FZUoq4ajyg18g13gu
	Fs/cBdJOMTLGqHIhNjxZjn7LDdxcmzccA6d4HEBYDQtgczMhkdZCbfagK1l0MCdRgAdTUj1vEojDW
	h+v4vPjBH5knZHKsiQIsnP1POXO3Mz1t4OaN+Q8pr0xYCveQnCK4laWQjfoMMUbugprX8xTHgShmR
	zrffdhWer+6/qXC7LMsFRo+In/2PGdZPUVc3NwG47PGMqXT2+3ogA1fR7DqfNfI+hUDsLxhiUXvry
	LxbUbiSAUyLzOGbNnBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrTA-000kQj-OD; Tue, 15 Feb 2022 06:37:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrRB-000ixN-A4; Tue, 15 Feb 2022 06:35:47 +0000
X-UUID: 6efd90024f2a42f7a3a9c4d1d5fb6bda-20220214
X-UUID: 6efd90024f2a42f7a3a9c4d1d5fb6bda-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1240135528; Mon, 14 Feb 2022 23:35:42 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:35:40 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 14:35:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:35:38 +0800
Message-ID: <7795e4f16aec237fb3b43533a369a21dfd0c0548.camel@mediatek.com>
Subject: Re: [PATCH v3 15/31] clk: mediatek: Implement
 mtk_clk_unregister_fixed_clks() API
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:35:39 +0800
In-Reply-To: <20220208124034.414635-16-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-16-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_223545_411917_513BD303 
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
> mtk_clk_register_fixed_clks(), as the name suggests, is used to
> register
> a given list of fixed rate clks. However it is lacking a counterpart
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
>  drivers/clk/mediatek/clk-mtk.c | 20 ++++++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  6 ++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c
> b/drivers/clk/mediatek/clk-mtk.c
> index 0c5db3c71fdd..7c0d5706eed7 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -80,6 +80,26 @@ void mtk_clk_register_fixed_clks(const struct
> mtk_fixed_clk *clks,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_fixed_clks);
>  
> +void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks,
> int num,
> +				   struct clk_onecell_data *clk_data)
> +{
> +	int i;
> +
> +	if (!clk_data)
> +		return;
> +
> +	for (i = num; i > 0; i--) {
> +		const struct mtk_fixed_clk *rc = &clks[i - 1];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[rc->id]))
> +			continue;
> +
> +		clk_unregister_fixed_rate(clk_data->clks[rc->id]);
> +		clk_data->clks[rc->id] = ERR_PTR(-ENOENT);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_clk_unregister_fixed_clks);
> +
>  void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
>  		int num, struct clk_onecell_data *clk_data)
>  {
> diff --git a/drivers/clk/mediatek/clk-mtk.h
> b/drivers/clk/mediatek/clk-mtk.h
> index 168220f85489..cc7f920eabb4 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -34,8 +34,10 @@ struct mtk_fixed_clk {
>  		.rate = _rate,				\
>  	}
>  
> -void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
> -		int num, struct clk_onecell_data *clk_data);
> +void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
> int num,
> +				 struct clk_onecell_data *clk_data);
> +void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks,
> int num,
> +				   struct clk_onecell_data *clk_data);
>  
>  struct mtk_fixed_factor {
>  	int id;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
