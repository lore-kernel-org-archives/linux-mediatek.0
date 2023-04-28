Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A58C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 19:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nto3QpLIxq7f02fM9QgxTTYEGhXSmdxIDvVc6NTHq/k=; b=t3MXvB6M847UH32uBwwgGMCdWh
	54q0dpwZUWbZEwajD7V8ONOdh/Uz4LtSdQ266XNxijb5eFlgc7M4HdK8IOkvPdW59zSpEbJacjDxP
	H4baCJbGCeqrEucfTIdz+8T9D50IJxgPRNQrDuBVohDfOMU+OBz7Xu+PWM/ol/0e2kaNhqVWarQxe
	Qmyxv2psdIdNqsTc5/5NZaPVHmZUO0ZDNHixC6cICWU8T64A+w91pFUGsNPnokLdS3O0iZgyha70i
	yfNJt8PMa/+YMkwWd0SPlFuXdeg6miYDTBsArNsA4Fg3Ds9c2WDaDsoX6BJnRTaFbvuLR+ZKDR6AX
	WKe8rgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psUAa-00BfQE-2A;
	Fri, 28 Apr 2023 19:54:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psUAS-00BfKv-0U;
	Fri, 28 Apr 2023 19:54:09 +0000
Received: from notapiano.myfiosgateway.com (unknown [194.36.25.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B582B66032D2;
	Fri, 28 Apr 2023 20:54:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682711645;
	bh=d0b9MdV/5wAa6Hp3wihVNXWvZyuFwK31hjmQOR8KfI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UGaTJ76/5PyATVE9t5Pypv2rlMWHH/HDkdM8stiOLUAHuyQeMqw70L5z+LQzOfF+R
	 yC46NIjxjEb6ahLjlEkQqdfBuW/OmF+pamiqCpTGv9qNmdlD8ePD39031sIaOkwSJP
	 svAsMOx+Efr9bTpyaf0OqpccU1pdtuI/y3E4u9mUm3dX5op+4VIpa5ayKIDg5tjhhL
	 1HfzGzmUuxCIK3Iceqgl00vbmeZqV3fM2Zj5nDjueqjCIn1rfwGirSwAmPyMa2+TuF
	 CYMqT+NY69mey/DDMhGkOitr0wuQWagdHdvHUEeGMP9GXdHM5matF3AYlOpihvOqPl
	 kJBaEzp3iSFOA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 2/3] thermal/drivers/mediatek/lvts_thermal: Honor sensors in immediate mode
Date: Fri, 28 Apr 2023 15:53:46 -0400
Message-Id: <20230428195347.3832687-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428195347.3832687-1-nfraprado@collabora.com>
References: <20230428195347.3832687-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_125408_450637_0F459736 
X-CRM114-Status: GOOD (  16.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Each controller can be configured to operate on immediate or filtered
mode. On filtered mode, the sensors are enabled by setting the
corresponding bits in MONCTL0, while on immediate mode, by setting
MSRCTL1.

Previously, the code would set MSRCTL1 for all four sensors when
configured to immediate mode, but given that the controller might not
have all four sensors connected, this would cause interrupts to trigger
for non-existent sensors. Fix this by handling the MSRCTL1 register
analogously to the MONCTL0: only enable the sensors that were declared.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 drivers/thermal/mediatek/lvts_thermal.c | 50 +++++++++++++------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 56b24c5b645f..29d10eaa8dfc 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -894,24 +894,6 @@ static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 			LVTS_HW_FILTER << 3 | LVTS_HW_FILTER;
 	writel(value, LVTS_MSRCTL0(lvts_ctrl->base));
 
-	/*
-	 * LVTS_MSRCTL1 : Measurement control
-	 *
-	 * Bits:
-	 *
-	 * 9: Ignore MSRCTL0 config and do immediate measurement on sensor3
-	 * 6: Ignore MSRCTL0 config and do immediate measurement on sensor2
-	 * 5: Ignore MSRCTL0 config and do immediate measurement on sensor1
-	 * 4: Ignore MSRCTL0 config and do immediate measurement on sensor0
-	 *
-	 * That configuration will ignore the filtering and the delays
-	 * introduced below in MONCTL1 and MONCTL2
-	 */
-	if (lvts_ctrl->mode == LVTS_MSR_IMMEDIATE_MODE) {
-		value = BIT(9) | BIT(6) | BIT(5) | BIT(4);
-		writel(value, LVTS_MSRCTL1(lvts_ctrl->base));
-	}
-
 	/*
 	 * LVTS_MONCTL1 : Period unit and group interval configuration
 	 *
@@ -976,6 +958,8 @@ static int lvts_ctrl_start(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	struct lvts_sensor *lvts_sensors = lvts_ctrl->sensors;
 	struct thermal_zone_device *tz;
 	u32 sensor_map = 0;
+	u32 sensor_map_bits[][4] = {{BIT(4), BIT(5), BIT(6), BIT(9)},
+				    {BIT(0), BIT(1), BIT(2), BIT(3)}};
 	int i;
 
 	for (i = 0; i < lvts_ctrl->num_lvts_sensor; i++) {
@@ -1012,20 +996,38 @@ static int lvts_ctrl_start(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 		 * map, so we can enable the temperature monitoring in
 		 * the hardware thermal controller.
 		 */
-		sensor_map |= BIT(i);
+		sensor_map |= sensor_map_bits[lvts_ctrl->mode][i];
 	}
 
 	/*
-	 * Bits:
-	 *      9: Single point access flow
-	 *    0-3: Enable sensing point 0-3
-	 *
 	 * The initialization of the thermal zones give us
 	 * which sensor point to enable. If any thermal zone
 	 * was not described in the device tree, it won't be
 	 * enabled here in the sensor map.
 	 */
-	writel(sensor_map | BIT(9), LVTS_MONCTL0(lvts_ctrl->base));
+	if (lvts_ctrl->mode == LVTS_MSR_IMMEDIATE_MODE) {
+		/*
+		 * LVTS_MSRCTL1 : Measurement control
+		 *
+		 * Bits:
+		 *
+		 * 9: Ignore MSRCTL0 config and do immediate measurement on sensor3
+		 * 6: Ignore MSRCTL0 config and do immediate measurement on sensor2
+		 * 5: Ignore MSRCTL0 config and do immediate measurement on sensor1
+		 * 4: Ignore MSRCTL0 config and do immediate measurement on sensor0
+		 *
+		 * That configuration will ignore the filtering and the delays
+		 * introduced in MONCTL1 and MONCTL2
+		 */
+		writel(sensor_map, LVTS_MSRCTL1(lvts_ctrl->base));
+	} else {
+		/*
+		 * Bits:
+		 *      9: Single point access flow
+		 *    0-3: Enable sensing point 0-3
+		 */
+		writel(sensor_map | BIT(9), LVTS_MONCTL0(lvts_ctrl->base));
+	}
 
 	return 0;
 }
-- 
2.40.0


