From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [RESEND PATCH v1 2/3] clk: mediatek: Runtime PM support for MT8183 mcucfg clock provider
Date: Mon, 2 Sep 2019 17:00:58 +0800
Message-ID: <1567414859-3244-3-git-send-email-weiyi.lu@mediatek.com>
References: <1567414859-3244-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567414859-3244-1-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, CK Hu <ck.hu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Enable the runtime PM support and forward the struct device pointer for
registration of MT8183 mcucfg clocks.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index 99a6b02..37b4162 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -30,10 +31,12 @@ static int clk_mt8183_mfg_probe(struct platform_device *pdev)
 	struct clk_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
 
+	pm_runtime_enable(&pdev->dev);
+
 	clk_data = mtk_alloc_clk_data(CLK_MFG_NR_CLK);
 
-	mtk_clk_register_gates(node, mfg_clks, ARRAY_SIZE(mfg_clks),
-			clk_data);
+	mtk_clk_register_gates_with_dev(node, mfg_clks, ARRAY_SIZE(mfg_clks),
+			clk_data, &pdev->dev);
 
 	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 }
-- 
1.8.1.1.dirty
