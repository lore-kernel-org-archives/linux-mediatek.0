Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB027D0C600
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GAt6KZ2pcfQy1Q7Rf4LRIXYYKzgia9CxnAXXiCJCkII=; b=XO2RaeSye7C1SouRGjonlwsMNh
	LoXCT4kV+t5sRmnquDI5Cxc2neuaIRZelKG0xbDyJ0hkeeYEGJzPOt/B4TgpIxpJt1f4okaa69nw5
	uUgiAXdnWYTooS+fJjMkepEH28OqaaaSVH9nCTcbnFVA26C8Di2F4PRXJ09u2ftNeWX+a6JRsqU6V
	gPW/BjYSAZV4CdiBq/9CdDgC2KIxZ/CYJdtAvXakSMid0Fcde1Q9MP3OjZlJM5FeDPMCRnkouRcDY
	TMZYGKi6q2wvynHtcxxyjURLMKMpgxIdNQVWYOAe4I9yhKtlVBX79AcT4QndoPzojp9cmOqMDcFQz
	8OzpG4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IBy-00000003Sma-0Pt0;
	Fri, 25 Oct 2024 11:09:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hw8-00000003Q1i-0yMx
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 10:52:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20cbb1cf324so15346185ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 03:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853575; x=1730458375; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAt6KZ2pcfQy1Q7Rf4LRIXYYKzgia9CxnAXXiCJCkII=;
        b=AUPEbvoXSxuU/D4ognx5pMPG+zm7VLgd8Lr9s9wP38dTFN2OQm6nXTNK+2vNTzz322
         7z/yY86cAede1FAioCXauckJ1rQ9HCkXTgxDq1HDhVNmpbCJMiri5JwhPsXgKXJ2e8if
         7RUPMhIYY4HE+RtKoapJRXiXJNi2gp8LY8w7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853575; x=1730458375;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAt6KZ2pcfQy1Q7Rf4LRIXYYKzgia9CxnAXXiCJCkII=;
        b=rZSj4PM3MEtakU4urkShjrScjR6WsEalHlbEIoS+BbvTMaqP25GH0T0NCNpM2wkTxf
         c47mQLG0LnoyL2CXVIz8Nyzkrbnl56U7B2eu5IPy7aT85JnZJDIQu3h8811lwkPTEEeF
         FccttrapC1iR+yLu0H9y2bX0gBqSoiYufPDcsCUl9hz4TgXkYfsYu+GGKciXYZ1c6l8A
         V4y/0Nu1iofehCPAzOpDmJFK9iuRshkrlhdJIneFVb+l2LojYS+GyMqHbSd7iMLe+ukO
         qjFI1c7FYJh4yjNFACy7d5CaVaE/Z13m0ZUi9jCDvzRib2vFcSw+Ge/55yRj24fLE5Ql
         6akw==
X-Forwarded-Encrypted: i=1; AJvYcCU6gOcNg3+33hfv1UJLMj6lGzXYZvv9kMMLdvxGLJ8+6K0SyEd9QJBz+JV9xlCTo+MoW7Bv+JTcsXBAW387pg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1LX93qvVKGloP15JEE6LO2DrrWqcPVQE29AHakVTMdnWF7uDZ
	nI72vcrHh7XZrCsB8Lpu1vKmcfYMC1/Irm/l85MyryGGKkWAe1b1gVyGg69OLQ==
X-Google-Smtp-Source: AGHT+IG9X1lMdE2CHaDjkcTeXOKM/Gxm5oeIssvu8bLQJ/WsfELPrdu9PDORMYQ1aCw+SrJH6uZIVw==
X-Received: by 2002:a17:902:ce04:b0:20b:9f8c:e9d3 with SMTP id d9443c01a7336-20fb9a57581mr69168945ad.55.1729853575328;
        Fri, 25 Oct 2024 03:52:55 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02ea58sm7276935ad.196.2024.10.25.03.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:52:54 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 25 Oct 2024 10:52:50 +0000
Subject: [PATCH v13] thermal/drivers/mediatek/auxadc_thermal: expose all
 thermal sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-auxadc_thermal-v13-1-a5231c52dccb@chromium.org>
X-B4-Tracking: v=1; b=H4sIAIF4G2cC/3XNTQrCMBAF4KuUrI1kkhAbV95DRNJxYgLWSqqlU
 np30yKCf8v3hvfNwFpKkVq2LgaWqIttbM45gFoUDIM7H4nHQy6YFFKLUljubr074P4aKNXuxG1
 FSpWEZQXI8uiSyMd+Fre7nENsr026zw86gKn+a+U7B+68Mogr7ZVTGwypqeOtXjbpyCavA/kyQ
 Aj4NmQ2ZFUaFFZ7r827sSieUzC/pyi0UmS9Aec/3o/j+ABrmLH2MQEAAA==
X-Change-ID: 20240809-auxadc_thermal-9be338ec8b1c
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
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_035256_325652_8FA17B9D 
X-CRM114-Status: GOOD (  24.17  )
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

Previously, the driver only supported reading the temperature from all
sensors and returning the maximum value. This update adds another
get_temp ops to support reading the temperature from each sensor
separately.

Especially, some thermal zones registered by this patch are needed by
MT8183 since those thermal zones are necessary for mtk-svs driver.

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Signed-off-by: James Lo <james.lo@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v13:
- Make subject and commit message more clear.
- Make error message more clear.
- Link to v12: https://lore.kernel.org/r/20241016-auxadc_thermal-v12-1-c0433e9f61af@chromium.org

Changes in v12:
- Remove unnecessary check and unused variable assignment in mtk_read_sensor_temp.
- Add more about what this patch achieves in the commit message.
- Link to v11: https://lore.kernel.org/r/20240809-auxadc_thermal-v11-1-af36cc74f3a3@chromium.org

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
 drivers/thermal/mediatek/auxadc_thermal.c | 70 +++++++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index 9ee2e7283435acfcbb1a956303b6122a08affecc..85cd26bfcc111b8a2ddcf76c697ac60b69d16354 100644
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
 
@@ -866,10 +867,41 @@ static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
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
+	if (unlikely(!mtk_thermal_temp_is_valid(temp)))
+		return -EAGAIN;
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
@@ -1199,6 +1231,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	u64 auxadc_phys_base, apmixed_phys_base;
 	struct thermal_zone_device *tzdev;
 	void __iomem *apmixed_base, *auxadc_base;
+	struct mtk_thermal_bank *tz;
 
 	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
 	if (!mt)
@@ -1285,14 +1318,35 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 			mtk_thermal_init_bank(mt, i, apmixed_phys_base,
 					      auxadc_phys_base, ctrl_id);
 
-	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
-					      &mtk_thermal_ops);
-	if (IS_ERR(tzdev))
-		return PTR_ERR(tzdev);
+	for (i = 0; i <= mt->conf->num_sensors; i++) {
+		tz = devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
+		if (!tz)
+			return -ENOMEM;
+
+		tz->mt = mt;
+		tz->id = i;
+
+		tzdev = devm_thermal_of_zone_register(&pdev->dev, i,
+						      tz, (i == 0) ?
+						      &mtk_thermal_ops
+						      : &mtk_thermal_sensor_ops);
+
+		if (IS_ERR(tzdev)) {
+			ret = PTR_ERR(tzdev);
+			if (ret == -ENODEV) {
+				dev_warn(&pdev->dev, "Can't find thermal zone for sensor %d; sensor skipped.\n", i);
+				continue;
+			}
+			dev_err(&pdev->dev,
+				"Error: Failed to register thermal zone %d, ret = %d\n",
+				i, ret);
+			return dev_err_probe(&pdev->dev, ret, "Failed to register thermal zone %d.\n", i);
+		}
 
-	ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
-	if (ret)
-		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
+		ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
+		if (ret)
+			dev_warn(&pdev->dev, "Sensor %d: Error in thermal_add_hwmon_sysfs: %d\n", i, ret);
+	}
 
 	return 0;
 }

---
base-commit: b589839414be04b2b37e4bf6f84af576c99faf64
change-id: 20240809-auxadc_thermal-9be338ec8b1c

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


