From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v5 04/21] nvmem: vf610-ocotp: Convert to use devm_nvmem_register()
Date: Thu,  8 Mar 2018 11:11:48 -0800
Message-ID: <20180308191205.26943-5-andrew.smirnov@gmail.com>
References: <20180308191205.26943-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308191205.26943-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, cphealy@gmail.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Drop all of the code related to .remove hook and make use of
devm_nvmem_register() instead.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Carlo Caione <carlo@caione.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: cphealy@gmail.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/nvmem/vf610-ocotp.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/nvmem/vf610-ocotp.c b/drivers/nvmem/vf610-ocotp.c
index 5ae9e002f195..5a395ffb2ca8 100644
--- a/drivers/nvmem/vf610-ocotp.c
+++ b/drivers/nvmem/vf610-ocotp.c
@@ -217,13 +217,6 @@ static const struct of_device_id ocotp_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ocotp_of_match);
 
-static int vf610_ocotp_remove(struct platform_device *pdev)
-{
-	struct vf610_ocotp *ocotp_dev = platform_get_drvdata(pdev);
-
-	return nvmem_unregister(ocotp_dev->nvmem);
-}
-
 static int vf610_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -246,26 +239,20 @@ static int vf610_ocotp_probe(struct platform_device *pdev)
 			PTR_ERR(ocotp_dev->clk));
 		return PTR_ERR(ocotp_dev->clk);
 	}
+	ocotp_dev->dev = dev;
+	ocotp_dev->timing = vf610_ocotp_calculate_timing(ocotp_dev);
 
 	ocotp_config.size = resource_size(res);
 	ocotp_config.priv = ocotp_dev;
 	ocotp_config.dev = dev;
 
-	ocotp_dev->nvmem = nvmem_register(&ocotp_config);
-	if (IS_ERR(ocotp_dev->nvmem))
-		return PTR_ERR(ocotp_dev->nvmem);
+	ocotp_dev->nvmem = devm_nvmem_register(dev, &ocotp_config);
 
-	ocotp_dev->dev = dev;
-	platform_set_drvdata(pdev, ocotp_dev);
-
-	ocotp_dev->timing = vf610_ocotp_calculate_timing(ocotp_dev);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(ocotp_dev->nvmem);
 }
 
 static struct platform_driver vf610_ocotp_driver = {
 	.probe = vf610_ocotp_probe,
-	.remove = vf610_ocotp_remove,
 	.driver = {
 		.name = "vf610-ocotp",
 		.of_match_table = ocotp_of_match,
-- 
2.14.3
