Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D986C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MTOvxtIiI/1rSVsnyqK5ede7Xf3BGz8mkXjO1sfkrcE=; b=qGPgJC4ByQYM8v
	bAooRjorp/4OfmIg+6e0Dp6JRXcDkzjmj7cDuzbCiTNJk17OPIaRwuurz/XwDwPo9O1mDA0U9OHyO
	fzq0M674syPrxxrL4lc8E8BxpQx+xRQoJdbvzz++XgKUsAMeG6OiKmPQKvigjFXP+bMMKnDUkWs7l
	ZmqvzWl8cERkM3L9Lyx2qSMHwH9B1pgaLd3RZp9hFraT3/MI/cyKfLdy93VJZO0yxmJ0yviZIYR9V
	FVND2LFvlwqQNiVw6gCKLbmb1FXnXd3oTX3+KrVKgpRdbpOS7fETHhJcqQAv0lOAuX2SuptdGT985
	Hjlbx1qZjTXgo7Vc/cPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKE0j-00000004MUf-440w;
	Thu, 20 Jun 2024 09:23:17 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKE0g-00000004MTw-2BqI
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 09:23:15 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2598a57b2c1so327365fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718875392; x=1719480192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MTOvxtIiI/1rSVsnyqK5ede7Xf3BGz8mkXjO1sfkrcE=;
        b=ejkZg93voxGXjvbanK0NouEuel4JgWsK2WD5vAmAgCz+a7ltBBE0f7XwxnsAfg7VU5
         G/EJ35ud9rx88XLv1EDJ8gq9L2l2fX1kaKvJ21d/OcwMcYvpzz8fXULfzgdZdhF//7hA
         /k/9os/hl7KqXNNGPhoWPqnFbbr5MprJZSzt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718875392; x=1719480192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTOvxtIiI/1rSVsnyqK5ede7Xf3BGz8mkXjO1sfkrcE=;
        b=JGb08zwnsBq8zrNH459uV4Cu4OnkphihZ+XBzcw8fjjWiIrQi3Rbl4g9jXaTreW5UO
         ZXYc9MGAzNziI1S6ThEvX4v2VOirxmRwHCIfN1kGqNrbvAiBgHTIiTK+bSN3vk160k/A
         SvVmWL0Q/Pf7OHveMtcfHtl5ZObB/8pNH38SpR6abMVHXmJPJ8Md2gYUY9yKYcSqrlHL
         +12dON5c4nSFLv9C1PuBHHJXCf72RkYPe3/U3wAoz9K64d9rok8y75y5wTDizkIclx3P
         iCqDDDDxziUT50xs5ontWn6y+rOuBjuP+XkMWrzRcxvCqyjhm8QjSCQSKtMRGM3gLmPp
         z6/w==
X-Forwarded-Encrypted: i=1; AJvYcCXnhj6jAFAlPe8WrZ1/6TbkRqdjejaE71ZJ/hostAWMaBnjxjKPo9bRDF3Lg4S2W/3bkVnQL6Xw3mIxIGy56LnOs7IZWTTXzWHj5jqjC7MVVBT7
X-Gm-Message-State: AOJu0Yyb1ACcC2gToJv/2eo2/9ru0PsLNfSChMZOoNP06yENJ6FyHeLw
	9+q0LbwSZQS8pJ2Q8Eg8MmJ7ofqAdtWCyKl78jStNWYXtHiPAIjagN8A5zNY6w==
X-Google-Smtp-Source: AGHT+IHG1Qywf1NHXqmplHsfBSGZmQpZMD312c+7WzkDmSDb1JUiu8ehCBtziKheqH469mAnY8PkLQ==
X-Received: by 2002:a05:6871:586:b0:25c:be22:8ae2 with SMTP id 586e51a60fabf-25cbe2290eamr1168729fac.33.1718875392592;
        Thu, 20 Jun 2024 02:23:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c53a:5326:7f72:759f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc96aee8sm11950339b3a.73.2024.06.20.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:23:12 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Provide default calibration data
Date: Thu, 20 Jun 2024 17:23:03 +0800
Message-ID: <20240620092306.2352606-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_022314_615065_7196B301 
X-CRM114-Status: GOOD (  15.88  )
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Alexandre Mergnat <amergnat@baylibre.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <npitre@baylibre.com>, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, Julien Panis <jpanis@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On some pre-production hardware, the SoCs do not contain calibration
data for the thermal sensors. The downstream drivers provide default
values that sort of work, instead of having the thermal sensors not
work at all.

Port the default values to the upstream driver. These values are from
the ChromeOS kernels, which sadly do not cover the MT7988.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/thermal/mediatek/lvts_thermal.c | 34 +++++++++++++++++++------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 73148bd8da1f..1997e91bb3be 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -128,6 +128,7 @@ struct lvts_data {
 	int temp_factor;
 	int temp_offset;
 	int gt_calib_bit_offset;
+	unsigned int def_calibration;
 };
 
 struct lvts_sensor {
@@ -689,6 +690,10 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
 					size_t calib_len)
 {
 	int i;
+	u32 gt;
+
+	/* A zero value for gt means that device has invalid efuse data */
+	gt = (((u32 *)efuse_calibration)[0] >> lvts_ctrl->lvts_data->gt_calib_bit_offset) & 0xff;
 
 	lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
 		const struct lvts_sensor_data *sensor =
@@ -699,10 +704,17 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
 		    sensor->cal_offsets[2] >= calib_len)
 			return -EINVAL;
 
-		lvts_ctrl->calibration[i] =
-			(efuse_calibration[sensor->cal_offsets[0]] << 0) +
-			(efuse_calibration[sensor->cal_offsets[1]] << 8) +
-			(efuse_calibration[sensor->cal_offsets[2]] << 16);
+		if (gt) {
+			lvts_ctrl->calibration[i] =
+				(efuse_calibration[sensor->cal_offsets[0]] << 0) +
+				(efuse_calibration[sensor->cal_offsets[1]] << 8) +
+				(efuse_calibration[sensor->cal_offsets[2]] << 16);
+		} else if (lvts_ctrl->lvts_data->def_calibration) {
+			lvts_ctrl->calibration[i] = lvts_ctrl->lvts_data->def_calibration;
+		} else {
+			dev_err(dev, "efuse contains invalid calibration data and no default given.\n");
+			return -ENODATA;
+		}
 	}
 
 	return 0;
@@ -770,14 +782,13 @@ static int lvts_golden_temp_init(struct device *dev, u8 *calib,
 	gt = (((u32 *)calib)[0] >> lvts_data->gt_calib_bit_offset) & 0xff;
 
 	/* A zero value for gt means that device has invalid efuse data */
-	if (!gt)
-		return -ENODATA;
-
-	if (gt < LVTS_GOLDEN_TEMP_MAX)
+	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
 		golden_temp = gt;
 
 	golden_temp_offset = golden_temp * 500 + lvts_data->temp_offset;
 
+	dev_info(dev, "%sgolden temp=%d\n", gt ? "" : "fake ", golden_temp);
+
 	return 0;
 }
 
@@ -1701,6 +1712,7 @@ static const struct lvts_data mt8186_lvts_data = {
 	.temp_factor	= LVTS_COEFF_A_MT7988,
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
+	.def_calibration = 19000,
 };
 
 static const struct lvts_data mt8188_lvts_mcu_data = {
@@ -1709,6 +1721,7 @@ static const struct lvts_data mt8188_lvts_mcu_data = {
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 20,
+	.def_calibration = 35000,
 };
 
 static const struct lvts_data mt8188_lvts_ap_data = {
@@ -1717,6 +1730,7 @@ static const struct lvts_data mt8188_lvts_ap_data = {
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 20,
+	.def_calibration = 35000,
 };
 
 static const struct lvts_data mt8192_lvts_mcu_data = {
@@ -1725,6 +1739,7 @@ static const struct lvts_data mt8192_lvts_mcu_data = {
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
+	.def_calibration = 35000,
 };
 
 static const struct lvts_data mt8192_lvts_ap_data = {
@@ -1733,6 +1748,7 @@ static const struct lvts_data mt8192_lvts_ap_data = {
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
+	.def_calibration = 35000,
 };
 
 static const struct lvts_data mt8195_lvts_mcu_data = {
@@ -1741,6 +1757,7 @@ static const struct lvts_data mt8195_lvts_mcu_data = {
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
+	.def_calibration = 35000,
 };
 
 static const struct lvts_data mt8195_lvts_ap_data = {
@@ -1749,6 +1766,7 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 	.temp_factor	= LVTS_COEFF_A_MT8195,
 	.temp_offset	= LVTS_COEFF_B_MT8195,
 	.gt_calib_bit_offset = 24,
+	.def_calibration = 35000,
 };
 
 static const struct of_device_id lvts_of_match[] = {
-- 
2.45.2.741.gdbec12cfda-goog


