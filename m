Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AACE7D0C9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 05:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4PGtOOvMqPAJvUztaljSdd3cxuehsc/o+gXiODesZ0=; b=BdD5yWE9oOCAZo
	iBn8i1FdbsZutQ8lNOD3DR+iQPElt34hHvFqJlwtkAk+stztCk0FR1eyz8TCVaF5vKVB13pLTlNIk
	d9zNtqx5kqT87OxuRrJFSz8UHSyEY19l/oFIWElKZ/26iFXCnKSzcKfqQLw/TV+ZPijDyLrx3kvrY
	1dTA3w/IpEgxeaSXyo4YoYClmdaBEUwP9v1zGc42UY+6dQwMR3zHqawUhSSXS/ragU91qqRfu19Pe
	2s0op7y/2Gd1Tctho+qKzdLzVIiPPGqtBFtk+VllAagn0Km7u0IKPEwGQEQ9n1kZFfd6vhFuGiH0/
	OktuPhsyOcEWpTypHSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZ3t-007xgj-15;
	Fri, 22 Sep 2023 05:50:45 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZ3g-007xXi-39;
	Fri, 22 Sep 2023 05:50:35 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout1.routing.net (Postfix) with ESMTP id 2B12540551;
	Fri, 22 Sep 2023 05:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1695361828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4PGtOOvMqPAJvUztaljSdd3cxuehsc/o+gXiODesZ0=;
	b=obn2gtLmKsMbQ7oTfVG3YzYrZftXFejU2vWsy4x5Pd+z5Px6Sw1WnQvyLI0WNeK/d/uFs7
	x+R9eFgmlu52E7Tyz8ruFx2RaVJ7YIAcPaDNfYPSSpN+yLH+jnI4w3q47q8jZeqlMCGkqz
	UqWyV7pLZvrJvgJpkMzoc/49xJ/BUkU=
Received: from frank-G5.. (fttx-pool-217.61.149.125.bambit.de [217.61.149.125])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 46C5B403BF;
	Fri, 22 Sep 2023 05:50:27 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/4] thermal/drivers/mediatek/lvts_thermal: make coeff configurable
Date: Fri, 22 Sep 2023 07:50:19 +0200
Message-Id: <20230922055020.6436-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922055020.6436-1-linux@fw-web.de>
References: <20230922055020.6436-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: fa0f46da-b851-4668-a9a5-c9f39f15d774
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_225033_288571_EB299146 
X-CRM114-Status: GOOD (  19.39  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

The upcoming mt7988 has different temperature coefficients so we
cannot use constants in the functions lvts_golden_temp_init,
lvts_golden_temp_init and lvts_raw_to_temp anymore.

Add a field in the lvts_ctrl pointing to the lvts_data which now
contains the soc-specific temperature coefficents.

To make the code better readable, rename static int coeff_b to
golden_temp_offset, COEFF_A to temp_factor and COEFF_B to temp_offset.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v2:
- rename static int coeff_b to golden_temp_offset
- rename coeff.a to temp_factor and coeff.b to temp_offset
---
 drivers/thermal/mediatek/lvts_thermal.c | 51 ++++++++++++++++---------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index effd9b00a424..c2669f405a94 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -80,8 +80,8 @@
 #define LVTS_SENSOR_MAX				4
 #define LVTS_GOLDEN_TEMP_MAX		62
 #define LVTS_GOLDEN_TEMP_DEFAULT	50
-#define LVTS_COEFF_A				-250460
-#define LVTS_COEFF_B				250460
+#define LVTS_COEFF_A_MT8195			-250460
+#define LVTS_COEFF_B_MT8195			250460
 
 #define LVTS_MSR_IMMEDIATE_MODE		0
 #define LVTS_MSR_FILTERED_MODE		1
@@ -94,7 +94,7 @@
 #define LVTS_MINIMUM_THRESHOLD		20000
 
 static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
-static int coeff_b = LVTS_COEFF_B;
+static int golden_temp_offset;
 
 struct lvts_sensor_data {
 	int dt_id;
@@ -112,6 +112,8 @@ struct lvts_ctrl_data {
 struct lvts_data {
 	const struct lvts_ctrl_data *lvts_ctrl;
 	int num_lvts_ctrl;
+	int temp_factor;
+	int temp_offset;
 };
 
 struct lvts_sensor {
@@ -126,6 +128,7 @@ struct lvts_sensor {
 
 struct lvts_ctrl {
 	struct lvts_sensor sensors[LVTS_SENSOR_MAX];
+	const struct lvts_data *lvts_data;
 	u32 calibration[LVTS_SENSOR_MAX];
 	u32 hw_tshut_raw_temp;
 	int num_lvts_sensor;
@@ -247,21 +250,21 @@ static void lvts_debugfs_exit(struct lvts_domain *lvts_td) { }
 
 #endif
 
-static int lvts_raw_to_temp(u32 raw_temp)
+static int lvts_raw_to_temp(u32 raw_temp, int temp_factor)
 {
 	int temperature;
 
-	temperature = ((s64)(raw_temp & 0xFFFF) * LVTS_COEFF_A) >> 14;
-	temperature += coeff_b;
+	temperature = ((s64)(raw_temp & 0xFFFF) * temp_factor) >> 14;
+	temperature += golden_temp_offset;
 
 	return temperature;
 }
 
-static u32 lvts_temp_to_raw(int temperature)
+static u32 lvts_temp_to_raw(int temperature, int temp_factor)
 {
-	u32 raw_temp = ((s64)(coeff_b - temperature)) << 14;
+	u32 raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
 
-	raw_temp = div_s64(raw_temp, -LVTS_COEFF_A);
+	raw_temp = div_s64(raw_temp, -temp_factor);
 
 	return raw_temp;
 }
@@ -269,6 +272,9 @@ static u32 lvts_temp_to_raw(int temperature)
 static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct lvts_sensor *lvts_sensor = thermal_zone_device_priv(tz);
+	struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl,
+						   sensors[lvts_sensor->id]);
+	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
 	void __iomem *msr = lvts_sensor->msr;
 	u32 value;
 	int rc;
@@ -301,7 +307,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	if (rc)
 		return -EAGAIN;
 
-	*temp = lvts_raw_to_temp(value & 0xFFFF);
+	*temp = lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);
 
 	return 0;
 }
@@ -348,10 +354,13 @@ static bool lvts_should_update_thresh(struct lvts_ctrl *lvts_ctrl, int high)
 static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 {
 	struct lvts_sensor *lvts_sensor = thermal_zone_device_priv(tz);
-	struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl, sensors[lvts_sensor->id]);
+	struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl,
+						   sensors[lvts_sensor->id]);
+	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
 	void __iomem *base = lvts_sensor->base;
-	u32 raw_low = lvts_temp_to_raw(low != -INT_MAX ? low : LVTS_MINIMUM_THRESHOLD);
-	u32 raw_high = lvts_temp_to_raw(high);
+	u32 raw_low = lvts_temp_to_raw(low != -INT_MAX ? low : LVTS_MINIMUM_THRESHOLD,
+				       lvts_data->temp_factor);
+	u32 raw_high = lvts_temp_to_raw(high, lvts_data->temp_factor);
 	bool should_update_thresh;
 
 	lvts_sensor->low_thresh = low;
@@ -692,7 +701,7 @@ static int lvts_calibration_read(struct device *dev, struct lvts_domain *lvts_td
 	return 0;
 }
 
-static int lvts_golden_temp_init(struct device *dev, u32 *value)
+static int lvts_golden_temp_init(struct device *dev, u32 *value, int temp_offset)
 {
 	u32 gt;
 
@@ -701,7 +710,7 @@ static int lvts_golden_temp_init(struct device *dev, u32 *value)
 	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
 		golden_temp = gt;
 
-	coeff_b = golden_temp * 500 + LVTS_COEFF_B;
+	golden_temp_offset = golden_temp * 500 + temp_offset;
 
 	return 0;
 }
@@ -724,7 +733,7 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
 	 * The golden temp information is contained in the first chunk
 	 * of efuse data.
 	 */
-	ret = lvts_golden_temp_init(dev, (u32 *)lvts_td->calib);
+	ret = lvts_golden_temp_init(dev, (u32 *)lvts_td->calib, lvts_data->temp_offset);
 	if (ret)
 		return ret;
 
@@ -735,6 +744,7 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
 	for (i = 0; i < lvts_data->num_lvts_ctrl; i++) {
 
 		lvts_ctrl[i].base = lvts_td->base + lvts_data->lvts_ctrl[i].offset;
+		lvts_ctrl[i].lvts_data = lvts_data;
 
 		ret = lvts_sensor_init(dev, &lvts_ctrl[i],
 				       &lvts_data->lvts_ctrl[i]);
@@ -758,7 +768,8 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
 		 * after initializing the calibration.
 		 */
 		lvts_ctrl[i].hw_tshut_raw_temp =
-			lvts_temp_to_raw(lvts_data->lvts_ctrl[i].hw_tshut_temp);
+			lvts_temp_to_raw(lvts_data->lvts_ctrl[i].hw_tshut_temp,
+					 lvts_data->temp_factor);
 
 		lvts_ctrl[i].low_thresh = INT_MIN;
 		lvts_ctrl[i].high_thresh = INT_MIN;
@@ -1223,6 +1234,8 @@ static int lvts_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	golden_temp_offset = lvts_data->temp_offset;
+
 	ret = lvts_domain_init(dev, lvts_td, lvts_data);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to initialize the lvts domain\n");
@@ -1338,11 +1351,15 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_data_ctrl[] = {
 static const struct lvts_data mt8195_lvts_mcu_data = {
 	.lvts_ctrl	= mt8195_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_mcu_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT8195,
+	.temp_offset	= LVTS_COEFF_B_MT8195,
 };
 
 static const struct lvts_data mt8195_lvts_ap_data = {
 	.lvts_ctrl	= mt8195_lvts_ap_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_ap_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT8195,
+	.temp_offset	= LVTS_COEFF_B_MT8195,
 };
 
 static const struct of_device_id lvts_of_match[] = {
-- 
2.34.1


