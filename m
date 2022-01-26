Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30216C28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJotVsBJGfkCXuhkkwulVHo+f2nqX7bF74XVrxrDbT0=; b=rBdKULLHfb4ib3
	0ooC3+rceWc16NL4CLLOdQ0LcvMKkjNoSH7dFNCHnyUVQarudiS3Ab0Kgw6zTZ3hu4td256/4kL3R
	1DIIdOwGRrHv1WciFxlL+UEHeykdd/995fBDt6dCwxRxaIBhmPVkyUir6Hk43nBkQPkwk/LHJijpB
	PS/+21uN58M9ty2DxCe5k4FL0Ra6lzjU8CI5qjGAG/0NrUDhR7eVT9Q73gpzRSr2iDPrCeJHZuuo7
	T8ldJWdytzZ6ljVhiYm8yMzuH3TdfRdu2rrPOaeqxH58iR45Sa5x34OVPs4inZDNgBI77v0IGGVrA
	vqQPForBaAd+mEkUHoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCe9k-00ApEK-7q; Wed, 26 Jan 2022 08:59:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCe9h-00ApD6-Fu; Wed, 26 Jan 2022 08:59:55 +0000
X-UUID: f3c7783d52a24387a911553fe76a01cd-20220126
X-UUID: f3c7783d52a24387a911553fe76a01cd-20220126
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1037881412; Wed, 26 Jan 2022 01:59:50 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 00:59:49 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 16:59:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 16:59:47 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 31/31] clk: mediatek: Warn if clk IDs are duplicated
Date: Wed, 26 Jan 2022 16:59:47 +0800
Message-ID: <20220126085947.31507-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-32-wenst@chromium.org>
References: <20220122091731.283592-32-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_005953_570982_30D7AB3E 
X-CRM114-Status: GOOD (  12.47  )
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

>The Mediatek clk driver library handles duplicate clock IDs in two
>different ways: either ignoring the duplicate entry, or overwriting
>the old clk. Either way may cause unexpected behavior, and the latter
>also causes an orphan clk that cannot be cleaned up.
>
>Align the behavior so that later duplicate entries are ignored, and
>a warning printed. The warning will also aid in making the issue
>noticeable.
>
>Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>---
> drivers/clk/mediatek/clk-cpumux.c |  6 ++++++
> drivers/clk/mediatek/clk-gate.c   |  5 ++++-
> drivers/clk/mediatek/clk-mtk.c    | 18 ++++++++++++++----
> drivers/clk/mediatek/clk-mux.c    |  5 ++++-
> drivers/clk/mediatek/clk-pll.c    |  6 ++++++
> 5 files changed, 34 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
>index 499c60432280..c11b3fae622e 100644
>--- a/drivers/clk/mediatek/clk-cpumux.c
>+++ b/drivers/clk/mediatek/clk-cpumux.c
>@@ -120,6 +120,12 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
> 	for (i = 0; i < num; i++) {
> 		const struct mtk_composite *mux = &clks[i];
> 
>+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
>+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
>+				node, mux->id);
>+			continue;

%pOF is an useful information when this happens.

Reviewed-by: Miles Chen <miles.chen@mediatek.com>

>+		}
>+
> 		clk = mtk_clk_register_cpumux(mux, regmap);
> 		if (IS_ERR(clk)) {
> 			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
>diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
>index 631ff170b7b9..da52023f8455 100644
>--- a/drivers/clk/mediatek/clk-gate.c
>+++ b/drivers/clk/mediatek/clk-gate.c
>@@ -224,8 +224,11 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
> 	for (i = 0; i < num; i++) {
> 		const struct mtk_gate *gate = &clks[i];
> 
>-		if (!IS_ERR_OR_NULL(clk_data->clks[gate->id]))
>+		if (!IS_ERR_OR_NULL(clk_data->clks[gate->id])) {
>+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
>+				node, gate->id);
> 			continue;
>+		}
> 
> 		clk = mtk_clk_register_gate(gate->name, gate->parent_name,
> 					    regmap,
>diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
>index 6d0b8842971b..b2a3568922b2 100644
>--- a/drivers/clk/mediatek/clk-mtk.c
>+++ b/drivers/clk/mediatek/clk-mtk.c
>@@ -65,8 +65,10 @@ int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> 	for (i = 0; i < num; i++) {
> 		const struct mtk_fixed_clk *rc = &clks[i];
> 
>-		if (!IS_ERR_OR_NULL(clk_data->clks[rc->id]))
>+		if (!IS_ERR_OR_NULL(clk_data->clks[rc->id])) {
>+			pr_warn("Trying to register duplicate clock ID: %d\n", rc->id);
> 			continue;
>+		}
> 
> 		clk = clk_register_fixed_rate(NULL, rc->name, rc->parent, 0,
> 					      rc->rate);
>@@ -128,8 +130,10 @@ int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
> 	for (i = 0; i < num; i++) {
> 		const struct mtk_fixed_factor *ff = &clks[i];
> 
>-		if (!IS_ERR_OR_NULL(clk_data->clks[ff->id]))
>+		if (!IS_ERR_OR_NULL(clk_data->clks[ff->id])) {
>+			pr_warn("Trying to register duplicate clock ID: %d\n", ff->id);
> 			continue;
>+		}
> 
> 		clk = clk_register_fixed_factor(NULL, ff->name, ff->parent_name,
> 				CLK_SET_RATE_PARENT, ff->mult, ff->div);
>@@ -300,8 +304,11 @@ int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
> 	for (i = 0; i < num; i++) {
> 		const struct mtk_composite *mc = &mcs[i];
> 
>-		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[mc->id]))
>+		if (!IS_ERR_OR_NULL(clk_data->clks[mc->id])) {
>+			pr_warn("Trying to register duplicate clock ID: %d\n",
>+				mc->id);
> 			continue;
>+		}
> 
> 		clk = mtk_clk_register_composite(mc, base, lock);
> 
>@@ -363,8 +370,11 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
> 	for (i = 0; i <  num; i++) {
> 		const struct mtk_clk_divider *mcd = &mcds[i];
> 
>-		if (!IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
>+		if (!IS_ERR_OR_NULL(clk_data->clks[mcd->id])) {
>+			pr_warn("Trying to register duplicate clock ID: %d\n",
>+				mcd->id);
> 			continue;
>+		}
> 
> 		clk = clk_register_divider(NULL, mcd->name, mcd->parent_name,
> 			mcd->flags, base +  mcd->div_reg, mcd->div_shift,
>diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
>index f51e67650f03..21ad5a4afd65 100644
>--- a/drivers/clk/mediatek/clk-mux.c
>+++ b/drivers/clk/mediatek/clk-mux.c
>@@ -208,8 +208,11 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
> 	for (i = 0; i < num; i++) {
> 		const struct mtk_mux *mux = &muxes[i];
> 
>-		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id]))
>+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
>+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
>+				node, mux->id);
> 			continue;
>+		}
> 
> 		clk = mtk_clk_register_mux(mux, regmap, lock);
> 
>diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
>index 1dd15f560659..e5e9c188be99 100644
>--- a/drivers/clk/mediatek/clk-pll.c
>+++ b/drivers/clk/mediatek/clk-pll.c
>@@ -386,6 +386,12 @@ int mtk_clk_register_plls(struct device_node *node,
> 	for (i = 0; i < num_plls; i++) {
> 		const struct mtk_pll_data *pll = &plls[i];
> 
>+		if (!IS_ERR_OR_NULL(clk_data->clks[pll->id])) {
>+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
>+				node, pll->id);
>+			continue;
>+		}
>+
> 		clk = mtk_clk_register_pll(pll, base);
> 
> 		if (IS_ERR(clk)) {
>-- 
>2.35.0.rc0.227.g00780c9af4-goog
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
