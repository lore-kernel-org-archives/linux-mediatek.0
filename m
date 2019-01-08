From: matthias.bgg@kernel.org
Subject: [PATCH v3 1/3] clk: mediatek: Add MUX_FLAGS macro
Date: Tue,  8 Jan 2019 13:12:06 +0100
Message-ID: <20190108121208.2473-2-matthias.bgg@kernel.org>
References: <20190108121208.2473-1-matthias.bgg@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108121208.2473-1-matthias.bgg@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, kevin-cw.chen@mediatek.com, mars.cheng@mediatek.com
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com, jasu@njomotys.info, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Jasper Mattsson <jasu@njomotys.info>

This is required to mark outputs of certain MUXes as CLK_IS_CRITICAL.

Signed-off-by: Jasper Mattsson <jasu@njomotys.info>
Acked-by: Mars Cheng <mars.cheng@mediatek.com>
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index f83c2bbb677e..daab6ee94788 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -111,7 +111,11 @@ struct mtk_composite {
 	MUX_GATE_FLAGS(_id, _name, _parents, _reg, _shift, _width,	\
 		_gate, CLK_SET_RATE_PARENT)
 
-#define MUX(_id, _name, _parents, _reg, _shift, _width) {		\
+#define MUX(_id, _name, _parents, _reg, _shift, _width)			\
+	MUX_FLAGS(_id, _name, _parents, _reg,				\
+		  _shift, _width, CLK_SET_RATE_PARENT)
+
+#define MUX_FLAGS(_id, _name, _parents, _reg, _shift, _width, _flags) {	\
 		.id = _id,						\
 		.name = _name,						\
 		.mux_reg = _reg,					\
@@ -121,7 +125,7 @@ struct mtk_composite {
 		.divider_shift = -1,					\
 		.parent_names = _parents,				\
 		.num_parents = ARRAY_SIZE(_parents),			\
-		.flags = CLK_SET_RATE_PARENT,				\
+		.flags = _flags,				\
 	}
 
 #define DIV_GATE(_id, _name, _parent, _gate_reg, _gate_shift, _div_reg,	\
-- 
2.20.1
