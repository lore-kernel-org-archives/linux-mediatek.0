From: srinivas.kandagatla@linaro.org
Subject: [PATCH 20/25] nvmem: imx-iim: Do not use "&pdev->dev" explicitly
Date: Fri,  9 Mar 2018 14:47:14 +0000
Message-ID: <20180309144719.29904-21-srinivas.kandagatla@linaro.org>
References: <20180309144719.29904-1-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180309144719.29904-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org, Andrey Smirnov <andrew.smirnov@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, cphealy@gmail.com, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Andrey Smirnov <andrew.smirnov@gmail.com>

There's already "dev" variable for that. Use it.

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
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/imx-iim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-iim.c b/drivers/nvmem/imx-iim.c
index b98d76ac7790..6651e4cdc002 100644
--- a/drivers/nvmem/imx-iim.c
+++ b/drivers/nvmem/imx-iim.c
@@ -125,7 +125,7 @@ static int imx_iim_probe(struct platform_device *pdev)
 
 	drvdata = of_id->data;
 
-	iim->clk = devm_clk_get(&pdev->dev, NULL);
+	iim->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(iim->clk))
 		return PTR_ERR(iim->clk);
 
-- 
2.15.1
