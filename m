From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v4 12/12] clk: mediatek: Allow changing PLL rate when it is off
Date: Fri, 1 Feb 2019 16:30:16 +0800
Message-ID: <20190201083016.25856-14-weiyi.lu@mediatek.com>
References: <20190201083016.25856-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190201083016.25856-1-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: James Liao <jamesjj.liao@mediatek.com>

Some modules may need to change its clock rate before turn on it.
So changing PLL's rate when it is off should be allowed.
This patch removes PLL enabled check before set rate, so that
PLLs can set new frequency even if they are off.

On MT8173 for example, ARMPLL's enable bit can be controlled by
other HW. That means ARMPLL may be turned on even if we (CPU / SW)
set ARMPLL's enable bit as 0. In this case, SW may want and can
still change ARMPLL's rate by changing its pcw and postdiv settings.
But without this patch, new pcw setting will not be applied because
its enable bit is 0.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
Acked-by: Michael Turquette <mturuqette@baylibre.com>
Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-pll.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index cf444031bdfb..ff27174ea347 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -97,13 +97,10 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
 		int postdiv)
 {
 	u32 con1, val;
-	int pll_en;
 	u32 tuner_en = 0;
 	u32 tuner_en_mask;
 	void __iomem *tuner_en_addr = NULL;
 
-	pll_en = readl(pll->base_addr + REG_CON0) & CON0_BASE_EN;
-
 	/* disable tuner */
 	if (pll->tuner_en_addr) {
 		tuner_en_addr = pll->tuner_en_addr;
@@ -142,8 +139,7 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
 
 	con1 = readl(pll->base_addr + REG_CON1);
 
-	if (pll_en)
-		con1 |= CON1_PCW_CHG;
+	con1 |= CON1_PCW_CHG;
 
 	writel(con1, pll->base_addr + REG_CON1);
 	if (pll->tuner_addr)
@@ -156,8 +152,7 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
 		writel(val, tuner_en_addr);
 	}
 
-	if (pll_en)
-		udelay(20);
+	udelay(20);
 }
 
 /*
-- 
2.18.0
