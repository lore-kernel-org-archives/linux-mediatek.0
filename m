Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176A3C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 18:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8GZXE0840GdJHnO2uBoIBi5fo1U2aHRtPmGmKRJrds=; b=N2fSUwREcbTqy66V1OIRszUwEt
	ZJ65YxQjjzvZ50bcGUQhZuHPzxhghjT0z1ZmGAPI/ZTEExGbIjyUN+foQFfFcvsN8bJ5xc6KLqG3J
	xkQ5lB/BcD2eyWw8xIb+L5RGv23yVx9lqKpqpGo09phmcQspqgkCEgu75WzqkCyVlWJG+IJKlHET4
	P6Lu6zbJ1h+l6snMXqHJXAI61LiZl7dX9T4xjQL9raZY8uE1to3bdcs/BSgnkQo2arnrwZmgflHdR
	M/rM51X0ybkplFZ7wxN8Iw4gwFxfi5AkJ0UgrdP6cd4u8amOCqNd2zaYPwsN3AhlAqYkOXOZipXPJ
	IhhGg3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUX4G-009ImF-UF; Tue, 21 Feb 2023 18:08:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUX3Y-009IPZ-Q9
	for linux-mediatek@bombadil.infradead.org; Tue, 21 Feb 2023 18:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=f8GZXE0840GdJHnO2uBoIBi5fo1U2aHRtPmGmKRJrds=; b=W5lRT6GPfRvrcMoICsAGqyy7iz
	bdOgK5lCcs7fiGFinnkaLwb18GoKR69t2lLbkKXKuX4+QeDijXAT8elz31+wywVwltoJ2l8KfQt1W
	GfyVEWum9zpqxgvbduSzh08GcCdycGJQtYOnQiXhGS1K9jHN66ow5bOsaqcctlu5QATlK0uwyybSG
	9pAU+EKSy4TNsC2jDIPBvcVPa5m6AOahaKSSJxqrGUSAje0XQt96mZZ4lyA1fQfpYTtFohpYsxlAr
	UlXROshY4t3TepouF5XgMALrO+kLh1lANbCYBqyHo87SmJ+Ha6JgmEYWWALF9MBtebhDB266Fn362
	pZKrg5xg==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUX3V-00CFR6-23
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Feb 2023 18:07:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id j2-20020a05600c1c0200b003e1e754657aso4337425wms.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 10:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8GZXE0840GdJHnO2uBoIBi5fo1U2aHRtPmGmKRJrds=;
        b=e1I106DjtsgR5g0BYqPMWPCfKpA1g6y2v1L8WqJUjD98xO99ONKig8sGpbMNrmC4ex
         HQiN07RJJG665nXQSWqbikDPuvEBQDkYDpUpfbXrbbaO1L4zPKQusnxpJ+O1HaA8Lrur
         TdwJyqGlQCw4m3AxZBzr357Ltj+uB/LIgibBvZurMo8ZxZWfOuvrhTVjiXkSkZi6KmcV
         vFDQyMe/hBEZYCMunAM9TAP3FTX4JKQNLUv1/ozA4fifuebuv2lQZfLL6YTBZ5a8a3EH
         c/+ZLncMPZLa5I8hzqMABZ2KqON/ZQn4BkP1tfwgsMDobES6xuMhsCQwwr7TkD36EbER
         JQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8GZXE0840GdJHnO2uBoIBi5fo1U2aHRtPmGmKRJrds=;
        b=sMwWTOZ75/tOiQt7mvo7cCT3WJSIsmON+G2I4spKR/VF8s+W9mMilq7qApRGD495GG
         N/CgrH9FW4dcDYrES3lWCxlV1wORGBP+7WfH2QBebYlRjBA6DX3fYdqRDZcKggYQjF11
         AoWpgpLPQ2+UOkPQ+loeAsNPdwpK7xK8N8OKCf4m6HpluPVdxlUMt0c5DBg4eFp1CWXa
         s5WxYJWQZXN/7qurxQ4GB5d9EvNPcrIDoHxSCip230Qdd0w3w/LayIcAaUIIsRtJD5Ix
         Qx/UAMm+NkrjyDmdZK+37o4gw6o523Q8AJ1nP18Y2hamNA2J6gQqLsVvEt9hrRGMduIH
         PlFg==
X-Gm-Message-State: AO0yUKXkwbA0yMFloMmS1sW6TruNHFGX7113tNUFCAszkH7v9iAbJwLX
	VeC2dyBfxK9QaJhaY5eB4WUHJA==
X-Google-Smtp-Source: AK7set9TuEPVvN0M7H00DgRQhX9X1xkkCCLmkRhIeEu5Otj4NsCKBr+CiQOeT55lRd/pjJ3PXi85CA==
X-Received: by 2002:a05:600c:3481:b0:3df:9858:c038 with SMTP id a1-20020a05600c348100b003df9858c038mr4483414wmq.13.1677002876145;
        Tue, 21 Feb 2023 10:07:56 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:1e9:315c:bb40:e382])
        by smtp.gmail.com with ESMTPSA id c128-20020a1c3586000000b003e21558ee9dsm5107815wma.2.2023.02.21.10.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:07:55 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Balsam CHIHI <bchihi@baylibre.com>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v2 06/16] thermal: Don't use 'device' internal thermal zone structure field
Date: Tue, 21 Feb 2023 19:07:00 +0100
Message-Id: <20230221180710.2781027-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_180757_779633_25C217DE 
X-CRM114-Status: GOOD (  15.76  )
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

Some drivers are directly using the thermal zone's 'device' structure
field.

Use the driver device pointer instead of the thermal zone device when
it is available.

Remove the traces when they are duplicate with the traces in the core
code.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek LVTS
---
 drivers/thermal/imx_thermal.c                 | 37 ++++---------------
 drivers/thermal/mediatek/lvts_thermal.c       |  4 +-
 drivers/thermal/thermal_hwmon.c               |  4 +-
 .../ti-soc-thermal/ti-thermal-common.c        |  2 +-
 4 files changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index a0b8de269986..c3136978adee 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -285,13 +285,13 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 		if (data->alarm_temp == trips[IMX_TRIP_CRITICAL].temperature &&
 			*temp < trips[IMX_TRIP_PASSIVE].temperature) {
 			imx_set_alarm_temp(data, trips[IMX_TRIP_PASSIVE].temperature);
-			dev_dbg(&tz->device, "thermal alarm off: T < %d\n",
+			dev_dbg(data->dev, "thermal alarm off: T < %d\n",
 				data->alarm_temp / 1000);
 		}
 	}
 
 	if (*temp != data->last_temp) {
-		dev_dbg(&tz->device, "millicelsius: %d\n", *temp);
+		dev_dbg(data->dev, "millicelsius: %d\n", *temp);
 		data->last_temp = *temp;
 	}
 
@@ -367,36 +367,16 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz, int trip,
 static int imx_bind(struct thermal_zone_device *tz,
 		    struct thermal_cooling_device *cdev)
 {
-	int ret;
-
-	ret = thermal_zone_bind_cooling_device(tz, IMX_TRIP_PASSIVE, cdev,
-					       THERMAL_NO_LIMIT,
-					       THERMAL_NO_LIMIT,
-					       THERMAL_WEIGHT_DEFAULT);
-	if (ret) {
-		dev_err(&tz->device,
-			"binding zone %s with cdev %s failed:%d\n",
-			tz->type, cdev->type, ret);
-		return ret;
-	}
-
-	return 0;
+	return thermal_zone_bind_cooling_device(tz, IMX_TRIP_PASSIVE, cdev,
+						THERMAL_NO_LIMIT,
+						THERMAL_NO_LIMIT,
+						THERMAL_WEIGHT_DEFAULT);
 }
 
 static int imx_unbind(struct thermal_zone_device *tz,
 		      struct thermal_cooling_device *cdev)
 {
-	int ret;
-
-	ret = thermal_zone_unbind_cooling_device(tz, IMX_TRIP_PASSIVE, cdev);
-	if (ret) {
-		dev_err(&tz->device,
-			"unbinding zone %s with cdev %s failed:%d\n",
-			tz->type, cdev->type, ret);
-		return ret;
-	}
-
-	return 0;
+	return thermal_zone_unbind_cooling_device(tz, IMX_TRIP_PASSIVE, cdev);
 }
 
 static struct thermal_zone_device_ops imx_tz_ops = {
@@ -558,8 +538,7 @@ static irqreturn_t imx_thermal_alarm_irq_thread(int irq, void *dev)
 {
 	struct imx_thermal_data *data = dev;
 
-	dev_dbg(&data->tz->device, "THERMAL ALARM: T > %d\n",
-		data->alarm_temp / 1000);
+	dev_dbg(data->dev, "THERMAL ALARM: T > %d\n", data->alarm_temp / 1000);
 
 	thermal_zone_device_update(data->tz, THERMAL_EVENT_UNSPECIFIED);
 
diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index fb4b1b4db245..beb835d644e2 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -305,7 +305,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	 * 14-0 : Raw temperature for threshold
 	 */
 	if (low != -INT_MAX) {
-		dev_dbg(&tz->device, "Setting low limit temperature interrupt: %d\n", low);
+		pr_debug("%s: Setting low limit temperature interrupt: %d\n", tz->type, low);
 		writel(raw_low, LVTS_H2NTHRE(base));
 	}
 
@@ -318,7 +318,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	 *
 	 * 14-0 : Raw temperature for threshold
 	 */
-	dev_dbg(&tz->device, "Setting high limit temperature interrupt: %d\n", high);
+	pr_debug("%s: Setting high limit temperature interrupt: %d\n", tz->type, high);
 	writel(raw_high, LVTS_HTHRE(base));
 
 	return 0;
diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
index 964db7941e31..bc02095b314c 100644
--- a/drivers/thermal/thermal_hwmon.c
+++ b/drivers/thermal/thermal_hwmon.c
@@ -228,14 +228,14 @@ void thermal_remove_hwmon_sysfs(struct thermal_zone_device *tz)
 	hwmon = thermal_hwmon_lookup_by_type(tz);
 	if (unlikely(!hwmon)) {
 		/* Should never happen... */
-		dev_dbg(&tz->device, "hwmon device lookup failed!\n");
+		dev_dbg(hwmon->device, "hwmon device lookup failed!\n");
 		return;
 	}
 
 	temp = thermal_hwmon_lookup_temp(hwmon, tz);
 	if (unlikely(!temp)) {
 		/* Should never happen... */
-		dev_dbg(&tz->device, "temperature input lookup failed!\n");
+		dev_dbg(hwmon->device, "temperature input lookup failed!\n");
 		return;
 	}
 
diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
index 216b29068b08..060f46cea5ff 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -43,7 +43,7 @@ static void ti_thermal_work(struct work_struct *work)
 
 	thermal_zone_device_update(data->ti_thermal, THERMAL_EVENT_UNSPECIFIED);
 
-	dev_dbg(&data->ti_thermal->device, "updated thermal zone %s\n",
+	dev_dbg(data->bgp->dev, "updated thermal zone %s\n",
 		data->ti_thermal->type);
 }
 
-- 
2.34.1


