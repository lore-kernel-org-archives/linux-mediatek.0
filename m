Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2693FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bb/e+rrQJrFh+Bb49EQkCEY83pzUBCNhrI0YDi0nLV4=; b=paF9l7eqx6Rjjg
	HQphHYIARL5psKOOV6rbJzzHSzpBWWyWYCd2Do22psjKeJrENsS+rdY0D120hZo6aWPh42HB0Weof
	rv4ytiQR2fdi+65X29zpok7sJJj5KxbqDF42GojdBPmLn+D6sspzuXUAnxeCYSVKrv6CXUUBxT2lN
	uEau3REplDsbQGUd5TdY/OFZqvQZSX41W8k8zWoqHEZy6BwhLQfdRg9Y/RR/1OKWIHi7bfBd88VgP
	fjHPHmtNXtwUpAhjHkdBF5WKq0dZf39Th17XV9AfrleHLNwEPep3x212zZmut3xEJp3iBY5fN+TUG
	bAkkvpGZ1Weh8W3JImGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrMm-000fMI-7z; Tue, 15 Feb 2022 06:31:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrMO-000f3T-Ni; Tue, 15 Feb 2022 06:30:50 +0000
X-UUID: d01260c2d4224025826238ea3261160d-20220214
X-UUID: d01260c2d4224025826238ea3261160d-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1647501180; Mon, 14 Feb 2022 23:30:45 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:30:44 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 14:30:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:30:42 +0800
Message-ID: <7a9f37bda4f187eb62674087abf807c5c27167aa.camel@mediatek.com>
Subject: Re: [PATCH v3 10/31] clk: mediatek: mux: Internalize struct
 mtk_clk_mux
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:30:42 +0800
In-Reply-To: <20220208124034.414635-11-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-11-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_223048_826530_7DE7BE82 
X-CRM114-Status: GOOD (  17.54  )
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
> struct mtk_clk_mux is an implementation detail of the mux clk type,
> and is not used outside of the implementation.
> 
> Internalize the definition to minimize leakage of details and shrink
> the header file.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mux.c | 8 ++++++++
>  drivers/clk/mediatek/clk-mux.h | 8 --------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c
> b/drivers/clk/mediatek/clk-mux.c
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
> diff --git a/drivers/clk/mediatek/clk-mux.h
> b/drivers/clk/mediatek/clk-mux.h
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
