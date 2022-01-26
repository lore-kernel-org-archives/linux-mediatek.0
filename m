Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6029DC2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 06:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2n1OKJ+yk8FGHUY/iTg9BAcJ6wAipMUjBRPaPSkqxrg=; b=ObN7awytCZd3uZ
	GMwHCBQe5+f6ad6JrsK7L1dDRfVU8WsxWtwDnIsNIhZbrKBin2zi2bHZ6VQnIT57TK5K7rh9CQw5G
	rup83ixFB2Wm7yuIHTil9/ES72AbNap2YvzvFax0yRDZ2aTi3NESYBor9rmB1oEV5grHLYUbf6XyS
	62V3lS0aG5ASo9WPwmUcXWugLBNhCUvUe/E2fR2KmxU/d1SLfhIXBRl45m9Fp0X8XhaYhmpPMqPsM
	vJ21C8FAnlSeYD3bnJpAoYid3bdT0LuxBXOuQco9q78ojfprYE0D8aQWn8rPyct/C9F9/obPReWDX
	6WEercqpoP8v3s45Jw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCcDX-00ANSl-2W; Wed, 26 Jan 2022 06:55:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCcDU-00ANRz-NC; Wed, 26 Jan 2022 06:55:42 +0000
X-UUID: e605e07b8b4640458e13b1ed32ed9d58-20220125
X-UUID: e605e07b8b4640458e13b1ed32ed9d58-20220125
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2031721097; Tue, 25 Jan 2022 23:55:35 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 22:55:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 14:55:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 14:55:32 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 15/31] clk: mediatek: Implement
 mtk_clk_unregister_fixed_clks() API
Date: Wed, 26 Jan 2022 14:55:32 +0800
Message-ID: <20220126065532.22463-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-16-wenst@chromium.org>
References: <20220122091731.283592-16-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_225540_783883_E86BF6D2 
X-CRM114-Status: GOOD (  21.08  )
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

> mtk_clk_register_fixed_clks(), as the name suggests, is used to register
> a given list of fixed rate clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 20 ++++++++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  6 ++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index 0c5db3c71fdd..7c0d5706eed7 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -80,6 +80,26 @@ void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_fixed_clks);
>  
> +void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
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
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 168220f85489..cc7f920eabb4 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -34,8 +34,10 @@ struct mtk_fixed_clk {
>  		.rate = _rate,				\
>  	}
>  
> -void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
> -		int num, struct clk_onecell_data *clk_data);
> +void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> +				 struct clk_onecell_data *clk_data);
> +void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> +				   struct clk_onecell_data *clk_data);
>  
>  struct mtk_fixed_factor {
>  	int id;
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
