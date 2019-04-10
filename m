From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [v2 PATCH 5/6] usb: chipidea: msm: get optional clock by devm_clk_get_optional()
Date: Wed, 10 Apr 2019 14:47:28 +0800
Message-ID: <4fb0c15fc9e21307daceb9d26f20d87b4e0728d8.1554877692.git.chunfeng.yun@mediatek.com>
References: <bc6cdc2dce698dddbd692ba100fbf08c15c7b023.1554877692.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bc6cdc2dce698dddbd692ba100fbf08c15c7b023.1554877692.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Peter Chen <Peter.Chen@nxp.com>
List-Id: linux-mediatek@lists.infradead.org

Use devm_clk_get_optional() to get optional clock

Cc: Peter Chen <Peter.Chen@nxp.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Peter Chen <Peter.Chen@nxp.com>
---
v2: add Acked-by Peter Chen
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
2.21.0
