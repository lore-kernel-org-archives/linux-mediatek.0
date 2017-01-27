From: Shailendra Verma <shailendra.v@samsung.com>
Subject: [PATCH] Soc: mediatek - Fix possible NULL derefrence.
Date: Fri, 27 Jan 2017 16:47:48 +0530
Message-ID: <1485515868-3671-1-git-send-email-shailendra.v@samsung.com>
References: <CGME20170127111755epcas4p4f4bf0401e49ddd4563b0365b838d3dde@epcas4p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <blogic@openwrt.org>, Henry Chen <henryc.chen@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma <shailendra.v@samsung.com>, Shailendra Verma <shailendra.capricorn@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

of_match_device could return NULL, and so can cause a NULL
pointer dereference later.

Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index a5f1093..c48db98 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1117,6 +1117,11 @@ static int pwrap_probe(struct platform_device *pdev)
 	const struct of_device_id *of_slave_id = NULL;
 	struct resource *res;
 
+	if (!of_id) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
 	if (pdev->dev.of_node->child)
 		of_slave_id = of_match_node(of_slave_match_tbl,
 					    pdev->dev.of_node->child);
-- 
1.7.9.5
