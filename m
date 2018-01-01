From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 07/21] nvmem: rockchip-efuse: Convert to use devm_nvmem_register()
Date: Mon,  1 Jan 2018 15:22:56 -0800
Message-ID: <20180101232310.30420-8-andrew.smirnov@gmail.com>
References: <20180101232310.30420-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180101232310.30420-1-andrew.smirnov@gmail.com>
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
 drivers/nvmem/rockchip-efuse.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/nvmem/rockchip-efuse.c b/drivers/nvmem/rockchip-efuse.c
index 123de77ca5d6..d6dc1330f895 100644
--- a/drivers/nvmem/rockchip-efuse.c
+++ b/drivers/nvmem/rockchip-efuse.c
@@ -221,25 +221,15 @@ static int rockchip_efuse_probe(struct platform_device *pdev)
 	econfig.reg_read = match->data;
 	econfig.priv = efuse;
 	econfig.dev = efuse->dev;
-	nvmem = nvmem_register(&econfig);
+	nvmem = devm_nvmem_register(dev, &econfig);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
-	platform_set_drvdata(pdev, nvmem);
-
 	return 0;
 }
 
-static int rockchip_efuse_remove(struct platform_device *pdev)
-{
-	struct nvmem_device *nvmem = platform_get_drvdata(pdev);
-
-	return nvmem_unregister(nvmem);
-}
-
 static struct platform_driver rockchip_efuse_driver = {
 	.probe = rockchip_efuse_probe,
-	.remove = rockchip_efuse_remove,
 	.driver = {
 		.name = "rockchip-efuse",
 		.of_match_table = rockchip_efuse_match,
-- 
2.14.3
