From: wangyan wang <wangyan.wang@mediatek.com>
Subject: [PATCH V5 5/8] clk: mediatek: add MUX_GATE_FLAGS_2
Date: Wed, 20 Feb 2019 10:53:54 +0800
Message-ID: <20190220025357.7354-6-wangyan.wang@mediatek.com>
References: <20190220025357.7354-1-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220025357.7354-1-wangyan.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: wangyan wang <wangyan.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

From: chunhui dai <chunhui.dai@mediatek.com>

Add MUX_GATE_FLAGS_2 for the clock which needs to set two falgs.
Such as some mux need to set the flags of "CLK_MUX_ROUND_CLOSEST".

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: wangyan wang <wangyan.wang@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c |  2 +-
 drivers/clk/mediatek/clk-mtk.h | 20 ++++++++++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 9c0ae4278a94..2ed996404804 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -167,7 +167,7 @@ struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		mux->mask = BIT(mc->mux_width) - 1;
 		mux->shift = mc->mux_shift;
 		mux->lock = lock;
-
+		mux->flags = mc->mux_flags;
 		mux_hw = &mux->hw;
 		mux_ops = &clk_mux_ops;
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index f83c2bbb677e..4b88d196d52f 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -81,15 +81,13 @@ struct mtk_composite {
 	signed char divider_shift;
 	signed char divider_width;
 
+	unsigned char mux_flags;
+
 	signed char num_parents;
 };
 
-/*
- * In case the rate change propagation to parent clocks is undesirable,
- * this macro allows to specify the clock flags manually.
- */
-#define MUX_GATE_FLAGS(_id, _name, _parents, _reg, _shift, _width,	\
-			_gate, _flags) {				\
+#define MUX_GATE_FLAGS_2(_id, _name, _parents, _reg, _shift,		\
+				_width, _gate, _flags, _muxflags) {	\
 		.id = _id,						\
 		.name = _name,						\
 		.mux_reg = _reg,					\
@@ -101,8 +99,18 @@ struct mtk_composite {
 		.parent_names = _parents,				\
 		.num_parents = ARRAY_SIZE(_parents),			\
 		.flags = _flags,					\
+		.mux_flags = _muxflags,					\
 	}
 
+/*
+ * In case the rate change propagation to parent clocks is undesirable,
+ * this macro allows to specify the clock flags manually.
+ */
+#define MUX_GATE_FLAGS(_id, _name, _parents, _reg, _shift, _width,	\
+			_gate, _flags)					\
+		MUX_GATE_FLAGS_2(_id, _name, _parents, _reg,		\
+					_shift, _width, _gate, _flags, 0)
+
 /*
  * Unless necessary, all MUX_GATE clocks propagate rate changes to their
  * parent clock by default.
-- 
2.14.1
