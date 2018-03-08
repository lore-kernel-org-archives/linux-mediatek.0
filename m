From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v5 10/21] nvmem: meson-mx-efuse: Convert to use devm_nvmem_register()
Date: Thu,  8 Mar 2018 11:11:54 -0800
Message-ID: <20180308191205.26943-11-andrew.smirnov@gmail.com>
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
 drivers/nvmem/meson-mx-efuse.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
index 41d3a3c1104e..a085563e39e3 100644
--- a/drivers/nvmem/meson-mx-efuse.c
+++ b/drivers/nvmem/meson-mx-efuse.c
@@ -233,25 +233,13 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
 		return PTR_ERR(efuse->core_clk);
 	}
 
-	efuse->nvmem = nvmem_register(&efuse->config);
-	if (IS_ERR(efuse->nvmem))
-		return PTR_ERR(efuse->nvmem);
+	efuse->nvmem = devm_nvmem_register(&pdev->dev, &efuse->config);
 
-	platform_set_drvdata(pdev, efuse);
-
-	return 0;
-}
-
-static int meson_mx_efuse_remove(struct platform_device *pdev)
-{
-	struct meson_mx_efuse *efuse = platform_get_drvdata(pdev);
-
-	return nvmem_unregister(efuse->nvmem);
+	return PTR_ERR_OR_ZERO(efuse->nvmem);
 }
 
 static struct platform_driver meson_mx_efuse_driver = {
 	.probe = meson_mx_efuse_probe,
-	.remove = meson_mx_efuse_remove,
 	.driver = {
 		.name = "meson-mx-efuse",
 		.of_match_table = meson_mx_efuse_match,
-- 
2.14.3
