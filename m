Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C22CC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0dpw8AgsTIrUWx34LKeqU4wVt9f4efe1RzhjQJq/dc=; b=xyKWRrcQjeVAe9q9tpnZyp9Bl0
	DttqnqgrLKi3KMzGFsfMc9GtUiaWxcS1kwFh5/4E1a7Grk/qtHqLV0dagBzXi1STb71tx/R8oqQHv
	H9LzO9Kk5OpwfHqLVwmh3kminBwQb1OmCqVGi2yPfIA65dE2et4kwxG/XPeNp5Vwj7LgdgyOkM70Q
	jh0v3Ko4RArVvvvPZNUTD+zausT4PvL2mn51d9ciywGvlb/0+GFdZGppMnJvNacrwXKGtnU3fYcw8
	kl7Lc7bxlzl1ulz9l/ZS0XnPMX+lqvxSE1BSu5QfQ7yCdooLSXUGM6XxPP+as3cLCXBs87U8YBJvv
	sSEspP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scLEN-0000000AivC-2k22;
	Fri, 09 Aug 2024 08:44:15 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scLEK-0000000AiuT-1bir
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Aug 2024 08:44:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fc611a0f8cso16675745ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Aug 2024 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723193051; x=1723797851; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y0dpw8AgsTIrUWx34LKeqU4wVt9f4efe1RzhjQJq/dc=;
        b=m+G6Eh6f1w1ujSzBaMPV58y01H5VveWwIgqI168l/mxHEeIvKZN46kTlKqEAUZfvAM
         K+8IpGclxvkRvVPN59vuTEVygrGp4Vzimhzlo1Y6i00I0y9BzoKfNDHp2mRyAWqcPmIb
         Qyt7RKvtVIkzaPodSd8KZe8l9p9HCRBdUPdJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193051; x=1723797851;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0dpw8AgsTIrUWx34LKeqU4wVt9f4efe1RzhjQJq/dc=;
        b=fZb2aUEb0gJGMrheVfG7bdlTl9IQGRp5o6v4tMKdkgwCpfnZNHaNtNbPSbPZ/LFgke
         qOHYMFJE5Ju1NIaw8bw+wDmYXtyeD7drTUHhf+4WoqgdMdWmyag6QEAMtZ6wul4uu0Un
         W8k6gU34Lj8GOtCnYz9WtlT9wVU/PX/+PDNc+g7izvL5HaA3s5025pJycI9RsGbqcGms
         Rqf5F9TqJLGHfJkrkuz1OfZc+bR0PuFneTEbdM3L30MHvask+jIdxum6IpFaooiBL6UV
         wWMcsLTxMK9nrzMPTFWkAXpaHldXOiRimSnB9Y6cP28EeCp3O3SrICKXwsbWBWP9xG8S
         74wA==
X-Forwarded-Encrypted: i=1; AJvYcCXf+/R3MSrEk0wheUrrGpCkv++PK6QHty7WlknMwANs1uOCF5BzIo1IdXJtD8MKbaDNq/gOIFoZjL1O42F5tlBPr/7Xa7VB38OhPhL8nQMFUIMM
X-Gm-Message-State: AOJu0Yz4SOjwJhSFGhtHnP1sz0dnsquPN+zYJo8Xwizc+9GRJ90MFzuu
	89DSWwjjH7IaqAS+SSxXGeimPzMke/2gZvmapmmbr0b+KlfLg+v9MFzkErBgmtU5NO64UjI0ioo
	=
X-Google-Smtp-Source: AGHT+IGGsGMiUcvqjnFicMWVFbGdRWqa1sapo0jRgPkfp/Vxg1YwskwbsK0XDEVYAwmw4zGopgZQMg==
X-Received: by 2002:a17:903:32d0:b0:1ff:4535:9b57 with SMTP id d9443c01a7336-200ae60f46bmr7553385ad.51.1723193051051;
        Fri, 09 Aug 2024 01:44:11 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (46.165.189.35.bc.googleusercontent.com. [35.189.165.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f21794sm137237355ad.27.2024.08.09.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:44:10 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 09 Aug 2024 08:44:04 +0000
Subject: [PATCH v11] thermal/drivers/mediatek: add another get_temp ops for
 thermal sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-auxadc_thermal-v11-1-af36cc74f3a3@chromium.org>
X-B4-Tracking: v=1; b=H4sIANTWtWYC/x2MQQqAIBAAvyJ7TtDsYH0lItS2WigLrRCkvycdZ
 2AmQ8RAGKFjGQI+FOnwBaSsGLjV+AU5TUVALepGaNFycyczufFaMexm461FpTQ6baWDEp0BZ0r
 /sR/e9wOzRNHeYQAAAA==
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 James Lo <james.lo@mediatek.com>, Michael Kao <michael.kao@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Ben Tseng <ben.tseng@mediatek.com>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_014412_495451_8D8BCE30 
X-CRM114-Status: GOOD (  24.37  )
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

From: James Lo <james.lo@mediatek.com>

Provide thermal zone to read thermal sensor
in the SoC. We can read all the thermal sensors
value in the SoC by the node /sys/class/thermal/

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Signed-off-by: James Lo <james.lo@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Resurrecting this patch specifically for MediaTek MT8183 Kukui devices.

Changes in V11:
    - Rebase on kernel v6.11-rc2
    - Use mtk_thermal_temp_is_valid in mtk_read_sensor_temp just like
      mtk_thermal_bank_temperature
    - Change the error handling of devm_thermal_of_zone_register return
      value
    - link to V10: https://lore.kernel.org/lkml/20220519101044.16765-1-james.lo@mediatek.com/

Changes in V10:
    - Rebase to kernel-v5.18-rc7
    - Resend

Changes in V9:
    - Rebase to kernel-v5.14-rc1
    - Bind raw_to_mcelsius_v1 or raw_to_mcelsius_v2 to compatible
      data of struct mtk_thermal_data
    - Remove duplicate struct 'mtk_thermal_bank'
    - Remove unnecessary if condition check
    - Return error if any thermal zone fail to register

Changes in V8:
    - Rebase to kernel-v5.13-rc1
    - Resend

Changes in v7:
    - Fix build error in v6.

Changes in v6:
    - Rebase to kernel-5.11-rc1.
    - [1/3]
        - add interrupts property.
    - [2/3]
        - add the Tested-by in the commit message.
    - [3/3]
        - use the mt->conf->msr[id] instead of conf->msr[id] in the
          _get_sensor_temp and mtk_thermal_bank_temperature.
        - remove the redundant space in _get_sensor_temp and
          mtk_read_sensor_temp.
        - change kmalloc to dev_kmalloc in mtk_thermal_probe.

Changes in v5:
    - Rebase to kernel-5.9-rc1.
    - Revise the title of cover letter.
    - Drop "[v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESEL"
    - [2/2]
        -  Add the judgement to the version of raw_to_mcelsius.

Changes in v4:
    - Rebase to kernel-5.6-rc1.
    - [1/7]
        - Squash thermal zone settings in the dtsi from [v3,5/8]
          arm64: dts: mt8183: Increase polling frequency for CPU thermal zone.
        - Remove the property of interrupts and mediatek,hw-reset-temp.
    - [2/7]
        - Correct commit message.
    - [4/7]
        - Change the target temperature to the 80C and change the commit message.
    - [6/7]
        - Adjust newline alignment.
        - Fix the judgement on the return value of registering thermal zone.

Changes in v3:
    - Rebase to kernel-5.5-rc1.
    - [1/8]
        - Update sustainable power of cpu, tzts1~5 and tztsABB.
    - [7/8]
        - Bypass the failure that non cpu_thermal sensor is not find in thermal-zones
          in dts, which is normal for mt8173, so prompt a warning here instead of
          failing.

    Return -EAGAIN instead of -EACCESS on the first read of sensor that
        often are bogus values. This can avoid following warning on boot:

          thermal thermal_zone6: failed to read out thermal zone (-13)

Changes in v2:
    - [1/8]
        - Add the sustainable-power,trips,cooling-maps to the tzts1~tztsABB.
    - [4/8]
        - Add the min opp of cpu throttle.
---

---
 drivers/thermal/mediatek/auxadc_thermal.c | 71 +++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index 9ee2e7283435..8b50d560bbf9 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -847,7 +847,8 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 
 static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
 {
-	struct mtk_thermal *mt = thermal_zone_device_priv(tz);
+	struct mtk_thermal_bank *bank = thermal_zone_device_priv(tz);
+	struct mtk_thermal *mt = bank->mt;
 	int i;
 	int tempmax = INT_MIN;
 
@@ -866,10 +867,46 @@ static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
 	return 0;
 }
 
+static int mtk_read_sensor_temp(struct thermal_zone_device *tz, int *temperature)
+{
+	struct mtk_thermal_bank *bank = thermal_zone_device_priv(tz);
+	struct mtk_thermal *mt = bank->mt;
+	const struct mtk_thermal_data *conf = mt->conf;
+	int id = bank->id - 1;
+	int temp = INT_MIN;
+	u32 raw;
+
+	if (id < 0)
+		return  -EACCES;
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
+	if (!mtk_thermal_temp_is_valid(temp)) {
+		temp = THERMAL_TEMP_INVALID;
+		return -EAGAIN;
+	}
+
+	*temperature = temp;
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
@@ -1199,6 +1236,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	u64 auxadc_phys_base, apmixed_phys_base;
 	struct thermal_zone_device *tzdev;
 	void __iomem *apmixed_base, *auxadc_base;
+	struct mtk_thermal_bank *tz;
 
 	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
 	if (!mt)
@@ -1285,14 +1323,31 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 			mtk_thermal_init_bank(mt, i, apmixed_phys_base,
 					      auxadc_phys_base, ctrl_id);
 
-	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
-					      &mtk_thermal_ops);
-	if (IS_ERR(tzdev))
-		return PTR_ERR(tzdev);
+	for (i = 0; i < mt->conf->num_sensors + 1; i++) {
+		tz = devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
+		if (!tz)
+			return -ENOMEM;
+
+		tz->mt = mt;
+		tz->id = i;
+
+		tzdev = devm_thermal_of_zone_register(&pdev->dev, i,
+				tz, (i == 0) ?
+				&mtk_thermal_ops : &mtk_thermal_sensor_ops);
+
+		if (IS_ERR(tzdev)) {
+			if (PTR_ERR(tzdev) == -ENODEV) {
+				dev_warn(&pdev->dev, "can't find thermal sensor %d\n", i);
+				continue;
+			}
+			if (PTR_ERR(tzdev) != -EACCES)
+				return PTR_ERR(tzdev);
+		}
 
-	ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
-	if (ret)
-		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
+		ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
+		if (ret)
+			dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs: %d\n", ret);
+	}
 
 	return 0;
 }

---
base-commit: ee9a43b7cfe2d8a3520335fea7d8ce71b8cabd9d
change-id: 20240809-auxadc_thermal-9be338ec8b1c

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


