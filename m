Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6318C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbXt1chVjY81xN/KZVg6uzIKDwPaKDvDVWhm/erWWmk=; b=kQsesPPeP4oPGF
	8P1NOg42+XH+LUNu40wWF6M3LySLsfmlWu3x86CDFkHE+pSfSrdxjd164/DTWNzwH/KIqPhCcuS3f
	43Ho42wei2JknbbZi6QM1X/aqqJ+sReSMXy5jZ0P/OYqoKg8XJkyADX3c3WR9xCH8t+X/464St2LL
	GjPM15NeuFlI+KTE6MGI75u+t5rJ57NR++GBH0IrCTDIYhtnMcImNDBOwodEjFFJG6Q01rMJF8gxh
	9DIpStTT0h58NiH3o0d2KXXPCmYGsOQHpzFP6Lark2h2zvhHiwXdyrmGwtb5lGDHQuGgEmLdlgSqs
	nFG0KMgp1qAFcPLyGihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCPhi-00927i-Si; Tue, 25 Jan 2022 17:34:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCPYG-008yR6-5c; Tue, 25 Jan 2022 17:24:17 +0000
X-UUID: 46f17f9a84df492a93636f87136b2efc-20220125
X-UUID: 46f17f9a84df492a93636f87136b2efc-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1223725830; Tue, 25 Jan 2022 10:24:10 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 09:14:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 01:14:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 01:14:07 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 07/31] clk: mediatek: cpumux: Internalize struct
 mtk_clk_cpumux
Date: Wed, 26 Jan 2022 01:14:07 +0800
Message-ID: <20220125171407.32525-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-8-wenst@chromium.org>
References: <20220122091731.283592-8-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_092416_283662_0549A2CA 
X-CRM114-Status: GOOD (  16.70  )
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

> struct mtk_clk_cpumux is an implementation detail of the cpumux clk
> type, and is not used outside of the implementation.
> 
> Internalize the definition to minimize leakage of details and shrink
> the header file.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-cpumux.c | 8 ++++++++
>  drivers/clk/mediatek/clk-cpumux.h | 8 --------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
> index 99a819e3673f..344c6399b22f 100644
> --- a/drivers/clk/mediatek/clk-cpumux.c
> +++ b/drivers/clk/mediatek/clk-cpumux.c
> @@ -12,6 +12,14 @@
>  #include "clk-mtk.h"
>  #include "clk-cpumux.h"
>  
> +struct mtk_clk_cpumux {
> +	struct clk_hw	hw;
> +	struct regmap	*regmap;
> +	u32		reg;
> +	u32		mask;
> +	u8		shift;
> +};
> +
>  static inline struct mtk_clk_cpumux *to_mtk_clk_cpumux(struct clk_hw *_hw)
>  {
>  	return container_of(_hw, struct mtk_clk_cpumux, hw);
> diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
> index fda7770fd803..a538f2bbef0d 100644
> --- a/drivers/clk/mediatek/clk-cpumux.h
> +++ b/drivers/clk/mediatek/clk-cpumux.h
> @@ -7,14 +7,6 @@
>  #ifndef __DRV_CLK_CPUMUX_H
>  #define __DRV_CLK_CPUMUX_H
>  
> -struct mtk_clk_cpumux {
> -	struct clk_hw	hw;
> -	struct regmap	*regmap;
> -	u32		reg;
> -	u32		mask;
> -	u8		shift;
> -};
> -
>  int mtk_clk_register_cpumuxes(struct device_node *node,
>  			      const struct mtk_composite *clks, int num,
>  			      struct clk_onecell_data *clk_data);
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
