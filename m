Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635E1C79F99
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2026 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSBnT3FwZUixZgWDq520Ci5om1V2mRpux1OuDBHI5/I=; b=EIcEcQ+4rAXvJOkCrYTpKoT75p
	WRu3uWJCyM1lwhmFZ1+1ttMTs5UgvuY6n20ajYWGd3Giw2+kGRsQtgQA2cxr99P3Vhh2uB89QnmOc
	5VrTnmorXJfaPJuzjI9GfwuJ2cAFt8Ze8R0GsgEaXDpD9kC6oZTCkZvtRRfX4afA8McTetLj1Djmr
	3fZ2y/HYgbjKbgBw9wnkTjWk6svjgGtSwO87Xe/VxnKgkBjSoRHrdgsixREcH4tp/Uw9JzraOTLW9
	kqxx9gDcRSCnv7OmhD7aaVftFxXVWM9N0BUlNvWz/pd6buvdTvtx9PPlrC4Br/G6jWlYoxMpChNr5
	ZLcFL/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Dk-00000004kOx-0q4M;
	Sun, 06 Sep 2026 06:19:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Di-00000004kNy-3KK8
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Sep 2026 06:19:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2caced6038eso23740785ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 05 Sep 2026 23:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675554; x=1789280354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSBnT3FwZUixZgWDq520Ci5om1V2mRpux1OuDBHI5/I=;
        b=XcWEfa79I3g3VYJ3uuIl6sXwczCsO3vGopWfAtey9FSOLQjyjl3T04/IyixcsSdqow
         MMkrp2u4LUVCTgMSsvMZN2FhIIoZIxiduCs3uIRJQKuuRP/mjLFcolw8S9PU3QdnZah/
         J4gROJPEGUyLLF9Q0qeDTub/uylG40pcG+9j/L9dKdykm24jJEnV/vGylrnFxaV+x4AN
         T2YZv9oRFV2IRehAsJKz5OuIC94X+vhzjZAT8asMqf+kHCaIIxDQ9TKQy4hlAbdJAjVZ
         DTTKW4M+TzOx8DZfOWTkYe1NqSRvBCDVSSrxo44W0hWTHlzWUT6j1UWgn4WRt4vT/LSs
         RX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675554; x=1789280354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSBnT3FwZUixZgWDq520Ci5om1V2mRpux1OuDBHI5/I=;
        b=j8n4OQf0gvUONqwiou88fk22P291kFEMV8woPNPaiXEisxKWIFfUA6Pv0JExkdZrtd
         QuoDzlwVRatBjc/WpPVEiugJ+iMenvdRCk2yWlbKGiV9+GcMysqEUkVuYpc9gTxv0fzJ
         WvgWJnrADYz+cwBWkBp3ZHUQef6XrpYdnQN2kbT8xdLNHgTugzhxhgL4Wee/ZuStW41T
         m7boByOd8x89AWkMjL2dZFRd4Tvl5hrOxeGB71GB8HHocVCho2uMXGYTtiHAocUlbWMZ
         UeP2mg640N7MbjRU3b3G4FfbBMOlPC1zANLTU06o6b95I9xA6lzg84+6JqoBj3Zn2oiH
         lTqQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+HVqJpbUhtuMPHtgW/aM66tQIRlC8VOKBLVDF3wr8edYlqC9bx4fGa6gjTiBJCyujvlgFphq087/jt3m8Cw==@lists.infradead.org
X-Gm-Message-State: AFuF++lewQ9eWsOYzJ+kUzb1Fl0aJp2iK0e+CpIXK4QGXJk60TslSCX5
	GGk8Yj7b358musVkl60TrtyTaQTYDaDCPELXGCsNexFiJV6Cs5MLx09K
X-Gm-Gg: AYBFou2pIBjbuMG8uavlcvgUr4ULZWN9CpFb/MLpe6mnSfEnY76TPD9HQ4EAx68Vjfc
	Ro7+HXDV35PEugLXpR4RGZ8N9AC2+WAPAomNoGo5Yxe5rI1/6GpMJLruwyC+VI1S9QUx2vxUr//
	FkqE99IKPTD70dIWBH2GN4KRw+dxDkZL8CBlLmRAlNo06vhq8w50cTuYK7Kpe844X8cqFpSHpD3
	m5PKImpv0DrGR7VJZs1ctPRWpVYTAON1fUtSXhKV4pLbXEaIqTVPdQTDsZ1CWEqW+gza69LNVzR
	UV4PxOOn8cXXN+4YU2thIs0VUIngbM0oE37xe204YltgDiQZPWRB6XeYd7RBi19x7o0kGh3kFi5
	1iznY/gbYCdlQKcxYUsyRWwKljWQMXAPWIqp0JCi6MylO/nQnTQPr4TZIMXk2XprkFmOws1Ux3i
	/M2WRS7CRtHQHhimxEcbj5F3gCvXFJdiyw0OSA+1L+DZ6FqgzI4OtpKsHkzmw=
X-Received: by 2002:a17:902:da85:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2dafad14a8fmr205668835ad.0.1788675553947;
        Sat, 05 Sep 2026 23:19:13 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:19:13 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 5/5] power: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:54 +0530
Message-ID: <20260906061755.5103-6-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_231914_841070_1BD900D0 
X-CRM114-Status: GOOD (  13.32  )
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

Replace PTR_ERR() and %ld/%li with %pe and pass the original pointer
directly to dev_info(), dev_warn(), dev_err() and dev_dbg(). The %pe
format specifier prints a symbolic error name (e.g. -ENOMEM) when
CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back gracefully
and prints the raw integer value. This makes messages more readable
without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/axp20x_battery.c      | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/cw2015_battery.c      | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/power/reset/macsmc-reboot.c b/drivers/power/reset/macsmc-reboot.c
index 9fc36fa68676..7b8460a55e9d 100644
--- a/drivers/power/reset/macsmc-reboot.c
+++ b/drivers/power/reset/macsmc-reboot.c
@@ -221,8 +221,8 @@ static int macsmc_reboot_probe(struct platform_device *pdev)
 		if (IS_ERR(cell)) {
 			if (PTR_ERR(cell) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
-			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%ld)\n",
-				 nvmem_names[i], PTR_ERR(cell));
+			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%pe)\n",
+				 nvmem_names[i], cell);
 			/* Non fatal, we'll deal with it */
 			cell = NULL;
 		}
diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
index ee8701a6e907..915b6f6881db 100644
--- a/drivers/power/supply/axp20x_battery.c
+++ b/drivers/power/supply/axp20x_battery.c
@@ -1123,8 +1123,8 @@ static int axp20x_power_probe(struct platform_device *pdev)
 						       axp20x_batt->data->bat_ps_desc,
 						       &psy_cfg);
 	if (IS_ERR(axp20x_batt->batt)) {
-		dev_err(&pdev->dev, "failed to register power supply: %ld\n",
-			PTR_ERR(axp20x_batt->batt));
+		dev_err(&pdev->dev, "failed to register power supply: %pe\n",
+			axp20x_batt->batt);
 		return PTR_ERR(axp20x_batt->batt);
 	}
 
diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index 34a57dd5c3cf..d423a8bdc0c2 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -808,8 +808,8 @@ static void cpcap_charger_init_optional_gpios(struct cpcap_charger_ddata *ddata)
 		ddata->gpio[i] = devm_gpiod_get_index(ddata->dev, "mode",
 						      i, GPIOD_OUT_HIGH);
 		if (IS_ERR(ddata->gpio[i])) {
-			dev_info(ddata->dev, "no mode change GPIO%i: %li\n",
-				 i, PTR_ERR(ddata->gpio[i]));
+			dev_info(ddata->dev, "no mode change GPIO%i: %pe\n",
+				 i, ddata->gpio[i]);
 			ddata->gpio[i] = NULL;
 		}
 	}
diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supply/cw2015_battery.c
index 1bcb60cf763d..48643f7bf503 100644
--- a/drivers/power/supply/cw2015_battery.c
+++ b/drivers/power/supply/cw2015_battery.c
@@ -658,8 +658,8 @@ static int cw_bat_probe(struct i2c_client *client)
 
 	cw_bat->regmap = devm_regmap_init_i2c(client, &cw2015_regmap_config);
 	if (IS_ERR(cw_bat->regmap)) {
-		dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
-			PTR_ERR(cw_bat->regmap));
+		dev_err(cw_bat->dev, "Failed to allocate regmap: %pe\n",
+			cw_bat->regmap);
 		return PTR_ERR(cw_bat->regmap);
 	}
 
diff --git a/drivers/power/supply/intel_dc_ti_battery.c b/drivers/power/supply/intel_dc_ti_battery.c
index cb6fa8d88b43..5819df23a543 100644
--- a/drivers/power/supply/intel_dc_ti_battery.c
+++ b/drivers/power/supply/intel_dc_ti_battery.c
@@ -349,7 +349,7 @@ static int dc_ti_battery_probe(struct platform_device *pdev)
 
 	chip->vbat_channel = devm_iio_channel_get(dev, "VBAT");
 	if (IS_ERR(chip->vbat_channel)) {
-		dev_dbg(dev, "devm_iio_channel_get() ret %ld\n", PTR_ERR(chip->vbat_channel));
+		dev_dbg(dev, "devm_iio_channel_get() ret %pe\n", chip->vbat_channel);
 		return dev_err_probe(dev, -EPROBE_DEFER, "Waiting for VBAT IIO channel\n");
 	}
 
diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
index 67fdb4335338..c8e242341d04 100644
--- a/drivers/power/supply/qcom_smbx.c
+++ b/drivers/power/supply/qcom_smbx.c
@@ -613,7 +613,7 @@ static int smb_get_iio_chan(struct smb_chip *chip, struct iio_channel *chan,
 	}
 
 	if (IS_ERR(chan)) {
-		dev_err(chip->dev, "Failed to chan, err = %li", PTR_ERR(chan));
+		dev_err(chip->dev, "Failed to chan, err = %pe", chan);
 		return PTR_ERR(chan);
 	}
 
-- 
2.43.0


