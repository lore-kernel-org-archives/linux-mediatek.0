From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v3 03/12] clk: mediatek: add configurable pcwibits and fmin to mtk_pll_data
Date: Mon, 10 Dec 2018 15:32:31 +0800
Message-ID: <20181210073240.32278-5-weiyi.lu@mediatek.com>
References: <20181210073240.32278-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181210073240.32278-1-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, Owen Chen <owen.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Owen Chen <owen.chen@mediatek.com>

1. pcwibits: The integer bits of pcw for plls is extend to 8 bits,
   add a variable to indicate this change and
   backward-compatible.
2. fmin: The pll freqency lower-bound is vary from 1GMhz to
   1.5Ghz, add a variable to indicate platform-dependent.

Signed-off-by: Owen Chen <owen.chen@mediatek.com>
Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Acked-by: Sean Wang <sean.wang@kernel.org>
---
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 drivers/clk/mediatek/clk-pll.c | 12 +++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index f83c2bbb677e..11b5517903d0 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -214,8 +214,10 @@ struct mtk_pll_data {
 	unsigned int flags;
 	const struct clk_ops *ops;
 	u32 rst_bar_mask;
+	unsigned long fmin;
 	unsigned long fmax;
 	int pcwbits;
+	int pcwibits;
 	uint32_t pcw_reg;
 	int pcw_shift;
 	const struct mtk_pll_div_table *div_table;
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index f0ff5f535c7e..81400601f107 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -32,6 +32,8 @@
 #define AUDPLL_TUNER_EN		BIT(31)
 
 #define POSTDIV_MASK		0x7
+
+/* default 7 bits integer, can be overridden with pcwibits. */
 #define INTEGER_BITS		7
 
 /*
@@ -69,11 +71,13 @@ static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
 {
 	int pcwbits = pll->data->pcwbits;
 	int pcwfbits;
+	int ibits;
 	u64 vco;
 	u8 c = 0;
 
 	/* The fractional part of the PLL divider. */
-	pcwfbits = pcwbits > INTEGER_BITS ? pcwbits - INTEGER_BITS : 0;
+	ibits = pll->data->pcwibits ? pll->data->pcwibits : INTEGER_BITS;
+	pcwfbits = pcwbits > ibits ? pcwbits - ibits : 0;
 
 	vco = (u64)fin * pcw;
 
@@ -167,9 +171,10 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
 static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
 		u32 freq, u32 fin)
 {
-	unsigned long fmin = 1000 * MHZ;
+	unsigned long fmin = pll->data->fmin ? pll->data->fmin : (1000 * MHZ);
 	const struct mtk_pll_div_table *div_table = pll->data->div_table;
 	u64 _pcw;
+	int ibits;
 	u32 val;
 
 	if (freq > pll->data->fmax)
@@ -193,7 +198,8 @@ static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
 	}
 
 	/* _pcw = freq * postdiv / fin * 2^pcwfbits */
-	_pcw = ((u64)freq << val) << (pll->data->pcwbits - INTEGER_BITS);
+	ibits = pll->data->pcwibits ? pll->data->pcwibits : INTEGER_BITS;
+	_pcw = ((u64)freq << val) << (pll->data->pcwbits - ibits);
 	do_div(_pcw, fin);
 
 	*pcw = (u32)_pcw;
-- 
2.18.0
