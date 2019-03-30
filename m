From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 5/5] usb: chipidea: msm: get optional clock by devm_clk_get_optional()
Date: Sat, 30 Mar 2019 17:28:20 +0800
Message-ID: <2f4b8d77c6ec99ef6cc8e71155d820e080ad9af5.1553937592.git.chunfeng.yun@mediatek.com>
References: <2ec86ffd7de45dabaa7257019a79f1e80751934c.1553937592.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2ec86ffd7de45dabaa7257019a79f1e80751934c.1553937592.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Peter Chen <Peter.Chen@nxp.com>
List-Id: linux-mediatek@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Cc: Peter Chen <Peter.Chen@nxp.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/chipidea/ci_hdrc_msm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index 880009987460..b8b3caad889c 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -205,12 +205,9 @@ static int ci_hdrc_msm_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	ci->fs_clk = clk = devm_clk_get(&pdev->dev, "fs");
-	if (IS_ERR(clk)) {
-		if (PTR_ERR(clk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		ci->fs_clk = NULL;
-	}
+	ci->fs_clk = clk = devm_clk_get_optional(&pdev->dev, "fs");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	ci->base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.20.1
