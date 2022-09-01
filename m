Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADDEECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXZk2g+XOqGMjXGT66nViEOp7155I8tzUe2hmezbk9c=; b=482Ps7N/ZpeEEdXr0sQg8KBRzg
	NKB7m2PAhDlih79kpg2kGpxWLAaVOsqOWmdVK+TjdXVgq9zSZeJmEpB1/vXNAeyZkGwbNo7TSGvzz
	IJDqrFzRJoGcIfnQ+4/69TuFKbWwYe8K8o2xXxN0WEhO7dSY0cVcEKGL3pznW8wEhJGWd0ZTY3sxc
	HSUEdE7JALVllCbrcAPfj2MOrrtf4cxa6MtnpwhGqhyF+Z5u+B+5SIsxHICbQOX5rPsqA44PwAezB
	2kKPU+tTiY8tkW1Ahic+NPuOvWjZwBChL+VR8gbN20TREte/MNIsNTbN36CnL2xE6wtcRywpDgHbx
	GBeWvheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTknC-00CJ6h-2x; Thu, 01 Sep 2022 14:03:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkmr-00CIuS-0G
	for linux-mediatek@bombadil.infradead.org; Thu, 01 Sep 2022 14:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PXZk2g+XOqGMjXGT66nViEOp7155I8tzUe2hmezbk9c=; b=Due//869WhZL2EgtTzybamVv9Q
	/aGK8iy+Cv9cDMFcdUKkWj/nNHBZGAeK7ujeH/RQ2ThQe3FxIWqigWIapEcDSrRsXOYaUA9WjyB3P
	czvrD5GdWSD2Xo8tLZSohS0ZfhVtzWZvB9QsCOUtRCDhmSt4b4uLa8J3LME1jbXV1ZqUuIjlT9lny
	mQqSOchgyU4UHfttnaTsdkdge6e467Qay0f4i/RW0ZKuU2xpnLvFs5su+zoKzeVdgBp+gGRRfSb9z
	spew1dk3HrXmJUfRyQHDh51ke9oC8z3NJKZVRftslyPFc+GBrUCpbXutrzaFNVSahS6/1QXAQclS7
	5fhIkj5Q==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkQT-008PWk-62
	for linux-mediatek@lists.infradead.org; Thu, 01 Sep 2022 13:40:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso1474663wmr.3
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Sep 2022 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PXZk2g+XOqGMjXGT66nViEOp7155I8tzUe2hmezbk9c=;
        b=17fsFK3ztgm/SVq5u0ayzndJktrteVKsCKcEqAK3Qn//5L3IkRaOUCawLwShBDJFtl
         euAItBnkxj6Kr+gObW2PdMQJyW+JNckoeeEdJcOyJ8odVyjv9qwSo+Aa+Agrw1D7uadm
         NjFL4ytCQsfAsiYRX2ZCnWbkqyjhSvU2ArcGakqT0/pe/tzKAGY5ANhWjbKSskm01+SV
         e08NiN7JfQwTyq8kqygPzg04A3j1sVIHbYcg2+MQmLJ0G2Z5+pbYD3vww9tiFNQdTwNx
         Wb/b6iHsoxdWnVPAvK6uJ58Bt5C5ENxo+MtunbH7ABwWaEcZ0kMUtDms8wCLcCUx5Vlk
         EiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PXZk2g+XOqGMjXGT66nViEOp7155I8tzUe2hmezbk9c=;
        b=m5Tjt+Muo8EBsVSdGIAcg4xhVEddb1LpW3fGEW8H9Jo2ROtl9wfLDLfC+L776ZAFUN
         Xjt4UgCJzjSLg6Ii2iaRr1o6+/ix5nDwqtiH7eUbBXNC7LYpDlFN0ITRB7/a9pKYCPxa
         HkQHBC7mil0DMjyE1sWZqxjTlUcaQp7tQWjBCUT1FDJol3gd0iJ6xWMz4uv4VTtu+UDK
         npdP/HLyMQvEK2ZOdNAmTk1LtI7jP1Mvl2ZIrxJbJOQuKcBmLNnRrE54/GgcCOwbhDiv
         wlBuvOPMuLhfHfypIq34e8Cm9dSjpJfEQozbckViDb8h70U3gkO/MMbYLOS0QEuzvyfx
         YPTQ==
X-Gm-Message-State: ACgBeo3GZPmS2EIl3E8/h8i/H+tw4vfb4dq0yHU+d0Op8OddwxTWGVvg
	+m+uJUMu5DFKSGmOEtMpLtD7Ag==
X-Google-Smtp-Source: AA6agR42cS6iV9udNENWfEp+1c99N36znNphQvHct12z9G9cTwZBqzId0Md8KfkxH6g9DJOJUI8Dcw==
X-Received: by 2002:a05:600c:4148:b0:3a5:4f94:577b with SMTP id h8-20020a05600c414800b003a54f94577bmr5357868wmm.167.1662039606770;
        Thu, 01 Sep 2022 06:40:06 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id e3-20020adfe383000000b0021ef34124ebsm15399016wrm.11.2022.09.01.06.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 06:40:06 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	rafael@kernel.org,
	fparent@baylibre.com,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	robh+dt@kernel.org,
	rui.zhang@intel.com,
	Michael Kao <michael.kao@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v3 4/4] thermal: mediatek: add another get_temp ops for thermal sensors
Date: Thu,  1 Sep 2022 15:39:50 +0200
Message-Id: <20220901133950.115122-5-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901133950.115122-1-aouledameur@baylibre.com>
References: <20220901133950.115122-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_144009_284631_5FCA2EFE 
X-CRM114-Status: GOOD (  21.88  )
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
---
Changes in V3:
- Use proper types.
- Use devm_kmalloc() instead of kmalloc().
- Fix tabs and spaces.

 drivers/thermal/mtk_thermal.c | 100 ++++++++++++++++++++++++++--------
 1 file changed, 76 insertions(+), 24 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 088c388da241..5901787c57f5 100644
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
@@ -709,6 +714,32 @@ static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
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
+	if (mt->conf->version == MTK_THERMAL_V1)
+		temp = raw_to_mcelsius_v1(mt, id, raw);
+	else
+		temp = raw_to_mcelsius_v2(mt, id, raw);
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
@@ -721,26 +752,9 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
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
@@ -751,7 +765,8 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 
 static int mtk_read_temp(void *data, int *temperature)
 {
-	struct mtk_thermal *mt = data;
+	struct mtk_thermal_zone *tz = data;
+	struct mtk_thermal *mt = tz->mt;
 	int i;
 	int tempmax = INT_MIN;
 
@@ -770,10 +785,28 @@ static int mtk_read_temp(void *data, int *temperature)
 	return 0;
 }
 
+static int mtk_read_sensor_temp(void *data, int *temperature)
+{
+	struct mtk_thermal_zone *tz = data;
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
 static const struct thermal_zone_of_device_ops mtk_thermal_ops = {
 	.get_temp = mtk_read_temp,
 };
 
+static const struct thermal_zone_of_device_ops mtk_thermal_sensor_ops = {
+	.get_temp = mtk_read_sensor_temp,
+};
+
 static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
 				  u32 apmixed_phys_base, u32 auxadc_phys_base,
 				  int ctrl_id)
@@ -1072,6 +1105,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	u64 auxadc_phys_base, apmixed_phys_base;
 	struct thermal_zone_device *tzdev;
 	void __iomem *apmixed_base, *auxadc_base;
+	struct mtk_thermal_zone *tz;
 
 	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
 	if (!mt)
@@ -1161,11 +1195,29 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mt);
 
-	tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
-						     &mtk_thermal_ops);
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
+		tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, i, tz, (i == 0) ?
+							     &mtk_thermal_ops :
+							     &mtk_thermal_sensor_ops);
+
+		if (IS_ERR(tzdev)) {
+			if (PTR_ERR(tzdev) == -ENODEV) {
+				dev_warn(&pdev->dev,
+					 "sensor %d not registered in thermal zone in dt\n", i);
+				continue;
+			}
+			if (PTR_ERR(tzdev) == -EACCES) {
+				ret = PTR_ERR(tzdev);
+				goto err_disable_clk_peri_therm;
+			}
+		}
 	}
 
 	ret = devm_thermal_add_hwmon_sysfs(tzdev);
-- 
2.37.3


