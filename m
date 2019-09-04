From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 07/15] thermal: kirkwood: use devm_platform_ioremap_resource() to simplify code
Date: Wed, 4 Sep 2019 20:29:31 +0800
Message-ID: <20190904122939.23780-8-yuehaibing@huawei.com>
References: <20190904122939.23780-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904122939.23780-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: miquel.raynal@bootlin.com, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, mmayer@broadcom.com, computersforpeace@gmail.com, gregory.0xf0@gmail.com, matthias.bgg@gmail.com, agross@kernel.org, heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, marc.w.gonzalez@free.fr, mans@mansr.com, talel@amazon.com, jun.nie@linaro.org, shawnguo@kernel.org, phil@raspberrypi.org, yuehaibing@huawei.com, gregkh@linuxfoundation.org, david.hernandezsanchez@st.com, horms+renesas@verge.net.au, wsa+renesas@sang-engineering.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: linux-mediatek@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/thermal/kirkwood_thermal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/kirkwood_thermal.c b/drivers/thermal/kirkwood_thermal.c
index 189b675..762ef12 100644
--- a/drivers/thermal/kirkwood_thermal.c
+++ b/drivers/thermal/kirkwood_thermal.c
@@ -64,14 +64,12 @@ static int kirkwood_thermal_probe(struct platform_device *pdev)
 {
 	struct thermal_zone_device *thermal = NULL;
 	struct kirkwood_thermal_priv *priv;
-	struct resource *res;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->sensor = devm_ioremap_resource(&pdev->dev, res);
+	priv->sensor = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->sensor))
 		return PTR_ERR(priv->sensor);
 
-- 
2.7.4
