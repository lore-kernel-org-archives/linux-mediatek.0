From: Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 1/2] mfd: mt6397: Use PLATFORM_DEVID_NONE macro instead of -1
Date: Tue, 18 Jun 2019 17:43:46 +0200
Message-ID: <20190618154347.16991-1-fparent@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>
List-Id: linux-mediatek@lists.infradead.org

Use the correct macro when adding the MFD devices instead of using
directly '-1' value.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/mfd/mt6397-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 337bcccdb914..190ed86ad93e 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -299,9 +299,9 @@ static int mt6397_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 
-		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6323_devs,
-					   ARRAY_SIZE(mt6323_devs), NULL,
-					   0, pmic->irq_domain);
+		ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
+					   mt6323_devs, ARRAY_SIZE(mt6323_devs),
+					   NULL, 0, pmic->irq_domain);
 		break;
 
 	case MT6397_CID_CODE:
@@ -314,9 +314,9 @@ static int mt6397_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 
-		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6397_devs,
-					   ARRAY_SIZE(mt6397_devs), NULL,
-					   0, pmic->irq_domain);
+		ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
+					   mt6397_devs, ARRAY_SIZE(mt6397_devs),
+					   NULL, 0, pmic->irq_domain);
 		break;
 
 	default:
-- 
2.20.1
