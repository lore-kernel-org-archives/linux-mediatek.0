Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D834C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 11:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXRPB3JgawBUJiVUofK6OmJyzttuKnkImFf/wIqxXmQ=; b=Grqy9GcG/7nrdsg+kLhHEbmc4i
	Tl2nAjXRhvV8BmlebigbjsYF8dofsAsMLKD+/9MTzBoeRsA9NDxebFWdsKDTtR/IGjOYy9txDTk8V
	QvtV1cjNYGOYD49qkNVEK6/u36qpMKDeU1xuNosro/3VVVG1guCSPmT7t/vm1vJL4xN2G9dT1XRV8
	lceRX+3F3wTCWGsO7gd2ZNx8rkiQupJtF8yKi2WiLiD1yIkt6C8z6wS0MQ6G7cbT6ZsK4U+ZsZPZc
	MSZYOUXEk97UztVbigUXDQ8UcuYiMn1FHe7youxBpCmm8s1Y+NnFNwqtSJZUVRRTNkWQMN4w0wmsW
	zFRagnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzC0-003XmI-NE; Fri, 18 Nov 2022 11:05:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzAv-003XIR-Mi
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 11:05:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso3771270wmp.5
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 03:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXRPB3JgawBUJiVUofK6OmJyzttuKnkImFf/wIqxXmQ=;
        b=KXz1x7PVIRSygnZq/WJqqkYdJAeEDf2cq41xcS/VX2QD44aZpL/6lsm2HYsNKak+t8
         /QWHfu2YG+yNalsfGy2TueUVs/X53k15FQI48MzsUPxpw1S4ln+wwSAsRAIvhDMmfXw0
         KTAOa9lLsbcNgwNUn4Xs3JX0gY0CAHcO1+mbHfLhZc/n0nBYl/Xq5QJU6S3Y/8if/IBz
         NmkDpgR118kqV/5krIRGUAYrbm1+yjNiyTb7F/XHu5kCQQX9X0QX+WE+00NctK7bPhoH
         JBERSXbdr1NvnbpGMZTYdv2D30JElwiupgig90mF1sS0vBG6qHDz8GBnJ3rCQUensy7u
         vH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXRPB3JgawBUJiVUofK6OmJyzttuKnkImFf/wIqxXmQ=;
        b=oxzGsvyNtS5TMrif+WP5R+ZjCmA1Po1AzqTwGhQ5b1VWYdDlwQZ+144KRUsA8Za6h/
         aRDRkt0eOFnXsiEaTPMlEZBSSJNB9+kYqQGOepNPToQDw32VtorWXvuug/L2/JWUzZ++
         iJU+HJZ32mzjh8dJHTxk1q4Sj2oRpxAmNiYLQCxg8Q+lJzCQ75RePejmp4ZQaf5pT8RY
         Nk4qpt5yFSm4tsdP8auWPpj+7R4pEfFT0BFRqheEMyjyqAQP+f9U7uw+jXjAeKssE5Zn
         t6Rk7RLbPl+5Gf8CIUcUxLtDXyI+oNhRAyHiB1p5VQGa94cumZ5vVKyFDgND4Cc8heK1
         cCTg==
X-Gm-Message-State: ANoB5plMqIQ86klarAZ9CGW4v24MzXAMfaAWoBGFGeYnHYL0SvlBB9Iq
	u9HsjJ/92IJ6TB46y0aqU/8naw==
X-Google-Smtp-Source: AA0mqf4noqAkLrD8nO79AzLNSsDEAuGqJCo7qrG3F363wEgGHqzwkv5UvNt3lw56apWS3nKQ5YhY2Q==
X-Received: by 2002:a1c:7318:0:b0:3cf:cb16:f24a with SMTP id d24-20020a1c7318000000b003cfcb16f24amr7919556wmb.182.1668769486966;
        Fri, 18 Nov 2022 03:04:46 -0800 (PST)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id i14-20020adff30e000000b002368a6deaf8sm3316948wro.57.2022.11.18.03.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:04:46 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 18 Nov 2022 12:04:30 +0100
Subject: [PATCH v7 4/4] thermal: mediatek: add another get_temp ops for thermal
 sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-up-i350-thermal-bringup-v7-4-ebf08ff2eddb@baylibre.com>
References: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
In-Reply-To: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Michael Kao <michael.kao@mediatek.com>, linux-kernel@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1668769481; l=5806;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=5USa4lcv1habf94U1XG70OWqS+dbiiwFE4XST76LPQw=;
 b=q86fGiC3Ko/ELXbxUMsvp4Vbrh6THMSWdimMwXIsJH+k/u3tdJb48xYGQChhrRRufTNbxy5XmkZE
 kcwXutTNAvno1UuMFE6rPBUgiToMXKGm3WKQ5GYFs0QFwK6+uWJg
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_030449_766119_FEA54197 
X-CRM114-Status: GOOD (  20.20  )
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

Provide thermal zone to read thermal sensor in the SoC. We can read all the
thermal sensors value in the SoC by the node /sys/class/thermal/

In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
on the first read of sensor that often are bogus values.
This can avoid following warning on boot:

  thermal thermal_zone6: failed to read out thermal zone (-13)

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mtk_thermal.c | 99 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 74 insertions(+), 25 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 3a5df1440822..b1f4d19edd4f 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -259,6 +259,11 @@ enum mtk_thermal_version {
 
 struct mtk_thermal;
 
+struct mtk_thermal_zone {
+	struct mtk_thermal *mt;
+	int id;
+};
+
 struct thermal_bank_cfg {
 	unsigned int num_sensors;
 	const int *sensors;
@@ -307,6 +312,8 @@ struct mtk_thermal {
 
 	const struct mtk_thermal_data *conf;
 	struct mtk_thermal_bank banks[MAX_NUM_ZONES];
+
+	int (*raw_to_mcelsius)(struct mtk_thermal *mt, int sensno, s32 raw);
 };
 
 /* MT8183 thermal sensor data */
@@ -709,6 +716,29 @@ static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
 		mutex_unlock(&mt->lock);
 }
 
+static int _get_sensor_temp(struct mtk_thermal *mt, int id)
+{
+	u32 raw;
+	int temp;
+
+	const struct mtk_thermal_data *conf = mt->conf;
+
+	raw = readl(mt->thermal_base + conf->msr[id]);
+
+	temp = mt->raw_to_mcelsius(mt, id, raw);
+
+	/*
+	 * The first read of a sensor often contains very high bogus
+	 * temperature value. Filter these out so that the system does
+	 * not immediately shut down.
+	 */
+
+	if (temp > 200000)
+		return -EAGAIN;
+	else
+		return temp;
+}
+
 /**
  * mtk_thermal_bank_temperature - get the temperature of a bank
  * @bank:	The bank
@@ -721,26 +751,9 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 	struct mtk_thermal *mt = bank->mt;
 	const struct mtk_thermal_data *conf = mt->conf;
 	int i, temp = INT_MIN, max = INT_MIN;
-	u32 raw;
 
 	for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
-		raw = readl(mt->thermal_base + conf->msr[i]);
-
-		if (mt->conf->version == MTK_THERMAL_V1) {
-			temp = raw_to_mcelsius_v1(
-				mt, conf->bank_data[bank->id].sensors[i], raw);
-		} else {
-			temp = raw_to_mcelsius_v2(
-				mt, conf->bank_data[bank->id].sensors[i], raw);
-		}
-
-		/*
-		 * The first read of a sensor often contains very high bogus
-		 * temperature value. Filter these out so that the system does
-		 * not immediately shut down.
-		 */
-		if (temp > 200000)
-			temp = 0;
+		temp = _get_sensor_temp(mt, i);
 
 		if (temp > max)
 			max = temp;
@@ -749,9 +762,10 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 	return max;
 }
 
-static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
+static int mtk_read_temp(struct thermal_zone_device *tzdev, int *temperature)
 {
-	struct mtk_thermal *mt = tz->devdata;
+	struct mtk_thermal_zone *tz = tzdev->devdata;
+	struct mtk_thermal *mt = tz->mt;
 	int i;
 	int tempmax = INT_MIN;
 
@@ -770,10 +784,28 @@ static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
 	return 0;
 }
 
+static int mtk_read_sensor_temp(struct thermal_zone_device *tzdev, int *temperature)
+{
+	struct mtk_thermal_zone *tz = tzdev->devdata;
+	struct mtk_thermal *mt = tz->mt;
+	int id = tz->id - 1;
+
+	if (id < 0)
+		return -EACCES;
+
+	*temperature = _get_sensor_temp(mt, id);
+
+	return 0;
+}
+
 static const struct thermal_zone_device_ops mtk_thermal_ops = {
 	.get_temp = mtk_read_temp,
 };
 
+static const struct thermal_zone_device_ops mtk_thermal_sensor_ops = {
+	.get_temp = mtk_read_sensor_temp,
+};
+
 static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
 				  u32 apmixed_phys_base, u32 auxadc_phys_base,
 				  int ctrl_id)
@@ -1072,6 +1104,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	u64 auxadc_phys_base, apmixed_phys_base;
 	struct thermal_zone_device *tzdev;
 	void __iomem *apmixed_base, *auxadc_base;
+	struct mtk_thermal_zone *tz;
 
 	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
 	if (!mt)
@@ -1150,6 +1183,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	mtk_thermal_turn_on_buffer(mt, apmixed_base);
 
+	mt->raw_to_mcelsius = (mt->conf->version == MTK_THERMAL_V1) ?
+				raw_to_mcelsius_v1 : raw_to_mcelsius_v2;
+
 	if (mt->conf->version == MTK_THERMAL_V2) {
 		mtk_thermal_release_periodic_ts(mt, auxadc_base);
 	}
@@ -1161,11 +1197,24 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mt);
 
-	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
-					      &mtk_thermal_ops);
-	if (IS_ERR(tzdev)) {
-		ret = PTR_ERR(tzdev);
-		goto err_disable_clk_peri_therm;
+	for (i = 0; i < mt->conf->num_sensors + 1; i++) {
+		tz = devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
+		if (!tz)
+			return -ENOMEM;
+
+		tz->mt = mt;
+		tz->id = i;
+
+		tzdev = devm_thermal_of_zone_register(&pdev->dev, i, tz, (i == 0) ?
+							     &mtk_thermal_ops :
+							     &mtk_thermal_sensor_ops);
+
+		if (IS_ERR(tzdev)) {
+			ret = PTR_ERR(tzdev);
+			if (ret == -ENODEV)
+				continue;
+			goto err_disable_clk_peri_therm;
+		}
 	}
 
 	ret = devm_thermal_add_hwmon_sysfs(tzdev);

-- 
b4 0.10.1

