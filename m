Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D13BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0fagWBY0DtEL0a+f/vmn2UTprTsoqziIxwX/BAQlN4=; b=RqLqZVFsRuEwYG
	ti+4TRhjnNWRi2Qe47h3pfoSR+zu3U4ncFgI14HEZoDLpl7yBBJiVbpQhGsBFXnGMguvbsyTVLwsf
	jOPEbGk01iB7KwqzroLLkPXhJLqzANwluVB8joGacDy05LXaVhVK8kdi3MbysruTUENKPpNr878VG
	pziDItm2BAq4+3zpzOctA0cxNHz+mMj/NrE8So+EJfhxtzvmFquxriDrVrYMIL9l8Ye+L17Ckd/9W
	fA5Auegp7eug3CqGFIGeEkrQV74BmuJg8elEZ3DO9+hCoRrXFdINUxJ0Kgy8vShSEaaFlcCJmIUI1
	GcfckCpjxGCO5+11asjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCPhl-00928x-5s; Tue, 25 Jan 2022 17:34:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCPYE-008yR6-Hz; Tue, 25 Jan 2022 17:24:16 +0000
X-UUID: 89750c9e18fd4d2ba15268c359f2f51f-20220125
X-UUID: 89750c9e18fd4d2ba15268c359f2f51f-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1569187541; Tue, 25 Jan 2022 10:24:10 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 09:23:00 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 26 Jan 2022 01:22:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 01:22:58 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 10/31] clk: mediatek: mux: Internalize struct mtk_clk_mux
Date: Wed, 26 Jan 2022 01:22:58 +0800
Message-ID: <20220125172258.5469-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-11-wenst@chromium.org>
References: <20220122091731.283592-11-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_092414_649236_0452555E 
X-CRM114-Status: GOOD (  17.60  )
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

> struct mtk_clk_mux is an implementation detail of the mux clk type,
> and is not used outside of the implementation.
> 
> Internalize the definition to minimize leakage of details and shrink
> the header file.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mux.c | 8 ++++++++
>  drivers/clk/mediatek/clk-mux.h | 8 --------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> index 6f0c22a699c3..2d4d8dc0120a 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -13,6 +13,14 @@
>  #include "clk-mtk.h"
>  #include "clk-mux.h"
>  
> +struct mtk_clk_mux {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +	const struct mtk_mux *data;
> +	spinlock_t *lock;
> +	bool reparent;
> +};
> +
>  static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
>  {
>  	return container_of(hw, struct mtk_clk_mux, hw);
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> index cb2ac4f04c58..38a2b6014b08 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -9,14 +9,6 @@
>  
>  #include <linux/clk-provider.h>
>  
> -struct mtk_clk_mux {
> -	struct clk_hw hw;
> -	struct regmap *regmap;
> -	const struct mtk_mux *data;
> -	spinlock_t *lock;
> -	bool reparent;
> -};
> -
>  struct mtk_mux {
>  	int id;
>  	const char *name;
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
