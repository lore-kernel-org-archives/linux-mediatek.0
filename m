Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9BBC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 08:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YmpmW2+kGopBIB8eVFFlAOXAznCH9FpI3skiZb48wzg=; b=oF6krx2/r92S/3
	4NamBvJYPgrUMZocdp5Srhx+wdeUUgtZowx1eIUPQH5Wmo/E2Xmf4iUGKvwiZ2RkgoIDpmzodSL1j
	Oa6BWk0T0S3dqgLAJTCB8RnVoMPIDyPl4NtuVB4Oegq4V1V8SsU2yQEfslvhQKhhMShLLESj89t/o
	GFCD3MBhWVE4+4KCmuf2Ke9YvUh8lB5X6QW1A3Py0IL4ub/IDoClxqwqgMCCymWMbZDs1yymtLxWT
	jTDQ58mfNzwmv+zdG3HeAD6pLCDOWVQGTGnGU+M/ZQrnlqzLbl7piX6Vjvs2MsnzQYAGVsjM/CXGu
	Hr28NNYsrED5LT98K38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJszz-001b9V-TM; Tue, 15 Feb 2022 08:15:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJs1Y-0013OB-O8; Tue, 15 Feb 2022 07:13:22 +0000
X-UUID: 44238798752d47d586ea8d13c29dca10-20220215
X-UUID: 44238798752d47d586ea8d13c29dca10-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1867358415; Tue, 15 Feb 2022 00:13:17 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 23:05:24 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 15:05:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 15:05:22 +0800
Message-ID: <0ba7ab2a450546e7c920332a5a345396f3262f47.camel@mediatek.com>
Subject: Re: [PATCH v3 24/31] clk: mediatek: mux: Implement error handling
 in register API
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 15:05:22 +0800
In-Reply-To: <20220208124034.414635-25-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-25-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_231320_801007_715672BD 
X-CRM114-Status: GOOD (  19.58  )
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
> The mux clk type registration function does not stop or return errors
> if any clk failed to be registered, nor does it implement an error
> handling path. This may result in a partially working device if any
> step failed.
> 
> Make the register function return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, is done in the new error path.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mux.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c
> b/drivers/clk/mediatek/clk-mux.c
> index 70aa42144632..f51e67650f03 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -215,13 +215,26 @@ int mtk_clk_register_muxes(const struct mtk_mux
> *muxes,
>  
>  		if (IS_ERR(clk)) {
>  			pr_err("Failed to register clk %s: %pe\n", mux-
> >name, clk);
> -			continue;
> +			goto err;
>  		}
>  
>  		clk_data->clks[mux->id] = clk;
>  	}
>  
>  	return 0;
> +
> +err:
> +	while (--i >= 0) {
> +		const struct mtk_mux *mux = &muxes[i];
> +
> +		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
> +			continue;
> +
> +		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
> +		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
> +	}
> +
> +	return PTR_ERR(clk);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
