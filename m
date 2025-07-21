Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5391DC83F1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwQIemyCwOlvlbDljJehhqxT16SpwNGlc4el61y9NyA=; b=rU1l7GSmraOl9Q
	52EOKL/gxuHrdkvJQPKQZ/ZxmlRrImdkVK2NnYcErMt677/6RUBoab0H5TX6Rp0wt0yHTzV3MNEPV
	yk9918hezfVRDfo6/QiGHmXF32n8wYzlChOi07k6ZPE+AGz1dbV2M7of9Tods984sRSPJW9JoPSPS
	kwUO2hY0575OyQBN2Cp5vGPnBxcVnusnZqTbEF5xDjLioIPbyzzJobePiG5P5LFfFidMadzTB8RNT
	cOUEOhglb6yUnJdxeSBjpa5PUmb0IhF3JOWPRsRCFxRHUKt9n+5rHGPkwDiqJYa0aU91Qwg1xbgCW
	44ULctJqUn+BCOXirgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlt2-0000000GepE-15P6;
	Mon, 21 Jul 2025 08:28:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlh8-0000000Gby8-2umW;
	Mon, 21 Jul 2025 08:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753085781;
	bh=UdWu+G1mayLNOq+LRtzhCX9nU6UsOGyouXKigDoIKz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FDsHqgapD1h51Q088eohb25j23NrBSWtQOCbM/1kGdUsakFFdMuGkWicXgFBUyJAB
	 AHBctInQsY+Z/ECcZbhLdi7icuJro9SJ6T8f+Im78yfL8Qvg+OrwiMOiOrD42uMEdX
	 2FqVi5uhxMWdP0AiBfOLdGrY20yji+sEr0lAbNmfj+YuElJB02EzyRDWj/1RGk8Mee
	 HrnnLZvy7bj0e6ZSlODXH0C7gO/2BgELNelsZq11rN22hFpYc6vlAImXA+vrI+XyX4
	 Hkz6Rrb8NwPg1VD1ArtTNIxw6nPN/eCClmRL6eFTNymoiAhR5w9HC54D1m+sWY/goY
	 CtrmpXOMweQJg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4487:69c6:40a:81be])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED9C017E1576;
	Mon, 21 Jul 2025 10:16:19 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH 4/9] thermal: mediatek: lvts: Add platform ops to support alternative conversion logic
Date: Mon, 21 Jul 2025 10:14:54 +0200
Message-Id: <20250721081459.16278-5-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721081459.16278-1-laura.nao@collabora.com>
References: <20250721081459.16278-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_011622_877374_F45F4E14 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce lvts_platform_ops struct to support SoC-specific versions of
lvts_raw_to_temp() and lvts_temp_to_raw() conversion functions.

This is in preparation for supporting SoCs like MT8196/MT6991, which
have a positive temp_factor and need a different lvts_temp_to_raw()
implementation.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 46 +++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index b80c2929ae74..db83137c7537 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -125,8 +125,14 @@ struct lvts_ctrl_data {
 			continue; \
 		else
 
+struct lvts_platform_ops {
+	int (*lvts_raw_to_temp)(u32 raw_temp, int temp_factor);
+	u32 (*lvts_temp_to_raw)(int temperature, int temp_factor);
+};
+
 struct lvts_data {
 	const struct lvts_ctrl_data *lvts_ctrl;
+	struct lvts_platform_ops ops;
 	int num_cal_offsets;
 	int num_lvts_ctrl;
 	int temp_factor;
@@ -296,6 +302,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl,
 						   sensors[lvts_sensor->id]);
 	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
+	const struct lvts_platform_ops *ops = &lvts_data->ops;
 	void __iomem *msr = lvts_sensor->msr;
 	u32 value;
 	int rc;
@@ -328,7 +335,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	if (rc)
 		return -EAGAIN;
 
-	*temp = lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);
+	*temp = ops->lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);
 
 	return 0;
 }
@@ -396,10 +403,11 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl,
 						   sensors[lvts_sensor->id]);
 	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
+	const struct lvts_platform_ops *ops = &lvts_data->ops;
 	void __iomem *base = lvts_sensor->base;
-	u32 raw_low = lvts_temp_to_raw(low != -INT_MAX ? low : LVTS_MINIMUM_THRESHOLD,
+	u32 raw_low = ops->lvts_temp_to_raw(low != -INT_MAX ? low : LVTS_MINIMUM_THRESHOLD,
 				       lvts_data->temp_factor);
-	u32 raw_high = lvts_temp_to_raw(high, lvts_data->temp_factor);
+	u32 raw_high = ops->lvts_temp_to_raw(high, lvts_data->temp_factor);
 	bool should_update_thresh;
 
 	lvts_sensor->low_thresh = low;
@@ -1751,6 +1759,10 @@ static const struct lvts_data mt7988_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT7988,
 	.gt_calib_bit_offset = 24,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8186_lvts_data = {
@@ -1761,6 +1773,10 @@ static const struct lvts_data mt8186_lvts_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 19000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8188_lvts_mcu_data = {
@@ -1771,6 +1787,10 @@ static const struct lvts_data mt8188_lvts_mcu_data = {
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8188_lvts_ap_data = {
@@ -1781,6 +1801,10 @@ static const struct lvts_data mt8188_lvts_ap_data = {
 	.gt_calib_bit_offset = 20,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8192_lvts_mcu_data = {
@@ -1791,6 +1815,10 @@ static const struct lvts_data mt8192_lvts_mcu_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8192_lvts_ap_data = {
@@ -1801,6 +1829,10 @@ static const struct lvts_data mt8192_lvts_ap_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8195_lvts_mcu_data = {
@@ -1811,6 +1843,10 @@ static const struct lvts_data mt8195_lvts_mcu_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct lvts_data mt8195_lvts_ap_data = {
@@ -1821,6 +1857,10 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 	.gt_calib_bit_offset = 24,
 	.def_calibration = 35000,
 	.num_cal_offsets = 3,
+	.ops = {
+		.lvts_raw_to_temp = lvts_raw_to_temp,
+		.lvts_temp_to_raw = lvts_temp_to_raw,
+	}
 };
 
 static const struct of_device_id lvts_of_match[] = {
-- 
2.39.5


