From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 02/15] thermal: bcm2835: use devm_platform_ioremap_resource() to simplify code
Date: Wed, 4 Sep 2019 20:29:26 +0800
Message-ID: <20190904122939.23780-3-yuehaibing@huawei.com>
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
 drivers/thermal/broadcom/bcm2835_thermal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/broadcom/bcm2835_thermal.c b/drivers/thermal/broadcom/bcm2835_thermal.c
index 3199977..01eec8e 100644
--- a/drivers/thermal/broadcom/bcm2835_thermal.c
+++ b/drivers/thermal/broadcom/bcm2835_thermal.c
@@ -166,7 +166,6 @@ static int bcm2835_thermal_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct thermal_zone_device *tz;
 	struct bcm2835_thermal_data *data;
-	struct resource *res;
 	int err = 0;
 	u32 val;
 	unsigned long rate;
@@ -180,8 +179,7 @@ static int bcm2835_thermal_probe(struct platform_device *pdev)
 	if (!match)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->regs = devm_ioremap_resource(&pdev->dev, res);
+	data->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->regs)) {
 		err = PTR_ERR(data->regs);
 		dev_err(&pdev->dev, "Could not get registers: %d\n", err);
-- 
2.7.4
