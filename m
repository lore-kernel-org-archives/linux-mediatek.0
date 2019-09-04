From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 10/15] thermal: spear: use devm_platform_ioremap_resource() to simplify code
Date: Wed, 4 Sep 2019 20:29:34 +0800
Message-ID: <20190904122939.23780-11-yuehaibing@huawei.com>
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
 drivers/thermal/spear_thermal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/spear_thermal.c b/drivers/thermal/spear_thermal.c
index f68f581..19c690f 100644
--- a/drivers/thermal/spear_thermal.c
+++ b/drivers/thermal/spear_thermal.c
@@ -91,7 +91,6 @@ static int spear_thermal_probe(struct platform_device *pdev)
 	struct thermal_zone_device *spear_thermal = NULL;
 	struct spear_thermal_dev *stdev;
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *res;
 	int ret = 0, val;
 
 	if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
@@ -104,8 +103,7 @@ static int spear_thermal_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* Enable thermal sensor */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	stdev->thermal_base = devm_ioremap_resource(&pdev->dev, res);
+	stdev->thermal_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(stdev->thermal_base))
 		return PTR_ERR(stdev->thermal_base);
 
-- 
2.7.4
