From: Jasper Mattsson <jasu-tmnvWD0sGVAk+I/owrrOrA@public.gmane.org>
Subject: [PATCH 1/3] clk: mediatek: Add MUX_FLAGS macro
Date: Tue, 28 Aug 2018 23:50:00 +0300
Message-ID: <20180828205000.GA7424@xn--njmtys-xxab.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

This is required to mark outputs of certain MUXes as CLK_IS_CRITICAL.

Signed-off-by: Jasper Mattsson <jasu-tmnvWD0sGVAk+I/owrrOrA@public.gmane.org>
---
 drivers/clk/mediatek/clk-mtk.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index f83c2bbb6..daab6ee94 100644
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
2.18.0
