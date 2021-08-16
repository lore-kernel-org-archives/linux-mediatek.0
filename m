Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6152BC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 16:42:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29E2D60EFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 16:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29E2D60EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNFVk1j6QxtRajAqRnpmg8hk9rcqNi/H+TLGdOoeWZE=; b=Msghk5zg5YeB27
	itK7zdKVqQuAgKWPZaQzRI0aq1Dh4c0CLfpkoUYUuv36RKFwTeGOIA8KFWw3EXNsdVqDImijbAZ7x
	XyjYyzUcqa6UJgewucIBu/pUiYv0ucuJN90KNOn/hzg0iNbDbLFTLe96EL0XJAtLKzg0nl2YQic8n
	kglp16271SS1+ENlsz3DBWQgV8cF5MoAnN6MxkzkhjAoquHs62LFTsEys/SKbSpikupkUGNVBZ+jR
	FGA+wTdxDOXj8rydGgfqf8wWxQuZ70Y27pXI9hsON0UHewAE9b19UOUxsS8GY/fiWOmECHWki5K1E
	fdvakcBUHyrwuFoFCpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFfgr-00HRZo-Kw; Mon, 16 Aug 2021 16:42:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFfgM-00HRP4-G4
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 16:41:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id q10so24575423wro.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LikR4SFj4ATUIJU/5gMV0mpJ4XVxM4lGIJAeQD6Dp3E=;
 b=VPHHAPln+J/IXLEgdpzQwQhDbRCShoyhlbL0RBKIJrFq8hGBjg5TLVcXCKg9hpZtKM
 rACvFHgGQi9paw45pN+HOaOGhJEPSGcmeMnNhyy5jxCD1aB1LG8ng27lRXrM3CqGt+5i
 4zq43Hy7/yZbg5mrbrJ6uDMj2DdGAi38o4k6C812DzB3zHEC18X8ut2IKML9FXkt8UKM
 nNavnuz6UWnn0qLYvt53mm+nB4gm6YcwvPut2TfpS5LuX7+hId4zNErIaI11x+gsvJZN
 T9tMvfDC53gVHeKr7S/Z2cdNBQbZjWXLF9Nywtot4qINlxhNIwHgNski6Isl12pnTc9z
 VQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LikR4SFj4ATUIJU/5gMV0mpJ4XVxM4lGIJAeQD6Dp3E=;
 b=Uu+62dMAobFQacfuNEVNvCf0CvlqQF1pafb5csbZ8G7yw3643xeX+WYgiiRg3BygG3
 Lb9wHcG1soaPwzQmQYYrtF2lagFY5AXpyw5S+sBf92KzbXT5adXB54Yjuh05M7aD/L71
 +Rhh9WZ0lgonE6dX4EbgzUifW1fKSZ+kVJBKa5493iHBjzfvpnkyz+BE4yJbofEYT3Sa
 TlF5NlB1RMAx6WQ/GCfsb0+GSAEnOmAGcfCP4A13SePu2IeRlFh4RJbq6Czz7MnruQSk
 K9PKGNc6Yd++QDdwZrxlqhOHyYdvaeQmgoc118kC7gk2TltWOczQVUCXYuQe3rLfH5eo
 FLBA==
X-Gm-Message-State: AOAM531Y+k8ji7629mvSiH9JmlMhTSQXThl1V76pK3tHHHsUh8XHTqcY
 WP9Qh3prnhnZLXYnZ568CNKSLg==
X-Google-Smtp-Source: ABdhPJwvAQ1nVu7uLhVY1hP6hWwozEXssAqAMwoghFjaxtYVKlvqNka1X8OAOSin9KqYpvI4abYrNg==
X-Received: by 2002:adf:f08e:: with SMTP id n14mr19280029wro.427.1629132109322; 
 Mon, 16 Aug 2021 09:41:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3a81:3690:b885:8dcf:f8c6:7841])
 by smtp.gmail.com with ESMTPSA id m10sm15211730wro.63.2021.08.16.09.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 09:41:48 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: rui.zhang@intel.com, daniel.lezcano@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: ben.tseng@mediatek.com, michael.kao@mediatek.com, ethan.chang@mediatek.com,
 fparent@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 2/3] thermal: mediatek: Add thermal zone settings for mt8195
Date: Mon, 16 Aug 2021 18:43:06 +0200
Message-Id: <20210816164307.557315-3-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816164307.557315-1-abailon@baylibre.com>
References: <20210816164307.557315-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_094150_608076_676166B5 
X-CRM114-Status: GOOD (  16.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Michael Kao <michael.kao@mediatek.com>

Add thermal zone settings for mt8195

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/thermal/mediatek/soc_temp_lvts.c | 206 +++++++++++++++++++++--
 1 file changed, 192 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/mediatek/soc_temp_lvts.c b/drivers/thermal/mediatek/soc_temp_lvts.c
index 8153edaaf8150..ddcedcedbbc16 100644
--- a/drivers/thermal/mediatek/soc_temp_lvts.c
+++ b/drivers/thermal/mediatek/soc_temp_lvts.c
@@ -53,6 +53,7 @@
 
 #define CLOCK_26MHZ_CYCLE_NS	(38)
 #define BUS_ACCESS_US		(2)
+#define GOLDEN_TEMP_MAX		(62)
 
 #define FEATURE_DEVICE_AUTO_RCK	(BIT(0))
 #define FEATURE_CK26M_ACTIVE	(BIT(1))
@@ -577,21 +578,10 @@ static int prepare_calibration_data(struct lvts_data *lvts_data)
 	if (!cal_data->count_rc)
 		return -ENOMEM;
 
-	if (ops->efuse_to_cal_data)
+	if (ops->efuse_to_cal_data && !cal_data->use_fake_efuse)
 		ops->efuse_to_cal_data(lvts_data);
-
-	cal_data->use_fake_efuse = 1;
-	if (cal_data->golden_temp != 0) {
-		cal_data->use_fake_efuse = 0;
-	} else {
-		for (i = 0; i < lvts_data->num_sensor; i++) {
-			if (cal_data->count_r[i] != 0 ||
-			    cal_data->count_rc[i] != 0) {
-				cal_data->use_fake_efuse = 0;
-				break;
-			}
-		}
-	}
+	if (cal_data->golden_temp == 0 || cal_data->golden_temp > GOLDEN_TEMP_MAX)
+		cal_data->use_fake_efuse = 1;
 
 	if (cal_data->use_fake_efuse) {
 		/* It means all efuse data are equal to 0 */
@@ -1254,6 +1244,190 @@ static struct lvts_data mt6873_lvts_data = {
 	},
 };
 
+/*==================================================
+ * LVTS MT8195
+ *==================================================
+ */
+
+#define MT8195_NUM_LVTS (ARRAY_SIZE(mt8195_tc_settings))
+
+enum mt8195_lvts_domain {
+	MT8195_AP_DOMAIN,
+	MT8195_MCU_DOMAIN,
+	MT8195_NUM_DOMAIN
+};
+
+enum mt8195_lvts_sensor_enum {
+	MT8195_TS1_0,
+	MT8195_TS1_1,
+	MT8195_TS2_0,
+	MT8195_TS2_1,
+	MT8195_TS3_0,
+	MT8195_TS3_1,
+	MT8195_TS3_2,
+	MT8195_TS3_3,
+	MT8195_TS4_0,
+	MT8195_TS4_1,
+	MT8195_TS5_0,
+	MT8195_TS5_1,
+	MT8195_TS6_0,
+	MT8195_TS6_1,
+	MT8195_TS6_2,
+	MT8195_TS7_0,
+	MT8195_TS7_1,
+	MT8195_NUM_TS
+};
+
+static void mt8195_efuse_to_cal_data(struct lvts_data *lvts_data)
+{
+	struct sensor_cal_data *cal_data = &lvts_data->cal_data;
+
+	cal_data->golden_temp = GET_CAL_DATA_BITMASK(0, 31, 24);
+	cal_data->count_r[MT8195_TS1_0] = GET_CAL_DATA_BITMASK(1, 23, 0);
+	cal_data->count_r[MT8195_TS1_1] = (GET_CAL_DATA_BITMASK(2, 15, 0) << 8) +
+					   GET_CAL_DATA_BITMASK(1, 31, 24);
+	cal_data->count_r[MT8195_TS2_0] = GET_CAL_DATA_BITMASK(3, 31, 8);
+	cal_data->count_r[MT8195_TS2_1] = GET_CAL_DATA_BITMASK(4, 23, 0);
+	cal_data->count_r[MT8195_TS3_0] = (GET_CAL_DATA_BITMASK(6, 7, 0) << 16) +
+					   GET_CAL_DATA_BITMASK(5, 31, 16);
+	cal_data->count_r[MT8195_TS3_1] = GET_CAL_DATA_BITMASK(6, 31, 8);
+	cal_data->count_r[MT8195_TS3_2] = GET_CAL_DATA_BITMASK(7, 23, 0);
+	cal_data->count_r[MT8195_TS3_3] = (GET_CAL_DATA_BITMASK(8, 15, 0) << 8) +
+					   GET_CAL_DATA_BITMASK(7, 31, 24);
+	cal_data->count_r[MT8195_TS4_0] = GET_CAL_DATA_BITMASK(9, 31, 8);
+	cal_data->count_r[MT8195_TS4_1] = GET_CAL_DATA_BITMASK(10, 23, 0);
+	cal_data->count_r[MT8195_TS5_0] = (GET_CAL_DATA_BITMASK(12, 7, 0) << 16) +
+					   GET_CAL_DATA_BITMASK(11, 31, 16);
+	cal_data->count_r[MT8195_TS5_1] = GET_CAL_DATA_BITMASK(12, 31, 8);
+	cal_data->count_r[MT8195_TS6_0] = (GET_CAL_DATA_BITMASK(14, 15, 0) << 8) +
+					   GET_CAL_DATA_BITMASK(13, 31, 24);
+	cal_data->count_r[MT8195_TS6_1] = (GET_CAL_DATA_BITMASK(15, 7, 0) << 16) +
+					   GET_CAL_DATA_BITMASK(14, 31, 16);
+	cal_data->count_r[MT8195_TS6_2] = GET_CAL_DATA_BITMASK(15, 31, 8);
+	cal_data->count_r[MT8195_TS7_0] = (GET_CAL_DATA_BITMASK(17, 15, 0) << 8) +
+					   GET_CAL_DATA_BITMASK(16, 31, 24);
+	cal_data->count_r[MT8195_TS7_1] = (GET_CAL_DATA_BITMASK(18, 7, 0) << 16) +
+					   GET_CAL_DATA_BITMASK(17, 31, 16);
+	cal_data->count_rc[MT8195_TS1_0] = (GET_CAL_DATA_BITMASK(3, 7, 0) << 16) +
+					    GET_CAL_DATA_BITMASK(2, 31, 16);
+	cal_data->count_rc[MT8195_TS2_0] = (GET_CAL_DATA_BITMASK(5, 15, 0) << 8) +
+					    GET_CAL_DATA_BITMASK(4, 31, 24);
+	cal_data->count_rc[MT8195_TS3_0] = (GET_CAL_DATA_BITMASK(9, 7, 0) << 16) +
+					    GET_CAL_DATA_BITMASK(8, 31, 16);
+	cal_data->count_rc[MT8195_TS4_0] = (GET_CAL_DATA_BITMASK(11, 15, 0) << 8) +
+					    GET_CAL_DATA_BITMASK(10, 31, 24);
+	cal_data->count_rc[MT8195_TS5_0] = GET_CAL_DATA_BITMASK(13, 23, 0);
+	cal_data->count_rc[MT8195_TS6_0] = GET_CAL_DATA_BITMASK(16, 23, 0);
+	cal_data->count_rc[MT8195_TS7_0] = GET_CAL_DATA_BITMASK(18, 31, 8);
+}
+
+static struct tc_settings mt8195_tc_settings[] = {
+	[0] = {
+		.domain_index = MT8195_MCU_DOMAIN,
+		.addr_offset = 0x0,
+		.num_sensor = 2,
+		.sensor_map = {MT8195_TS1_0, MT8195_TS1_1},
+		.tc_speed = SET_TC_SPEED_IN_US(118, 118, 118, 118),
+		.hw_filter = LVTS_FILTER_2_OF_4,
+		.dominator_sensing_point = SENSING_POINT1,
+		.hw_reboot_trip_point = 117000,
+		.irq_bit = BIT(3),
+	},
+	[1] = {
+		.domain_index = MT8195_MCU_DOMAIN,
+		.addr_offset = 0x100,
+		.num_sensor = 2,
+		.sensor_map = {MT8195_TS2_0, MT8195_TS2_1},
+		.tc_speed = SET_TC_SPEED_IN_US(118, 118, 118, 118),
+		.hw_filter = LVTS_FILTER_2_OF_4,
+		.dominator_sensing_point = SENSING_POINT0,
+		.hw_reboot_trip_point = 117000,
+		.irq_bit = BIT(4),
+	},
+	[2] = {
+		.domain_index = MT8195_MCU_DOMAIN,
+		.addr_offset = 0x200,
+		.num_sensor = 4,
+		.sensor_map = {MT8195_TS3_0, MT8195_TS3_1, MT8195_TS3_2, MT8195_TS3_3},
+		.tc_speed = SET_TC_SPEED_IN_US(118, 118, 118, 118),
+		.hw_filter = LVTS_FILTER_2_OF_4,
+		.dominator_sensing_point = SENSING_POINT0,
+		.hw_reboot_trip_point = 117000,
+		.irq_bit = BIT(5),
+	},
+	[3] = {
+		.domain_index = MT8195_AP_DOMAIN,
+		.addr_offset = 0x0,
+		.num_sensor = 2,
+		.sensor_map = {MT8195_TS4_0, MT8195_TS4_1},
+		.tc_speed = SET_TC_SPEED_IN_US(118, 118, 118, 118),
+		.hw_filter = LVTS_FILTER_2_OF_4,
+		.dominator_sensing_point = SENSING_POINT0,
+		.hw_reboot_trip_point = 117000,
+		.irq_bit = BIT(3),
+	},
+	[4] = {
+		.domain_index = MT8195_AP_DOMAIN,
+		.addr_offset = 0x100,
+		.num_sensor = 2,
+		.sensor_map = {MT8195_TS5_0, MT8195_TS5_1},
+		.tc_speed = SET_TC_SPEED_IN_US(118, 118, 118, 118),
+		.hw_filter = LVTS_FILTER_2_OF_4,
+		.dominator_sensing_point = SENSING_POINT1,
+		.hw_reboot_trip_point = 117000,
+		.irq_bit = BIT(4),
+	},
+	[5] = {
+		.domain_index = MT8195_AP_DOMAIN,
+		.addr_offset = 0x200,
+		.num_sensor = 3,
+		.sensor_map = {MT8195_TS6_0, MT8195_TS6_1, MT8195_TS6_2},
+		.tc_speed = SET_TC_SPEED_IN_US(118, 118, 118, 118),
+		.hw_filter = LVTS_FILTER_2_OF_4,
+		.dominator_sensing_point = SENSING_POINT1,
+		.hw_reboot_trip_point = 117000,
+		.irq_bit = BIT(5),
+	},
+	[6] = {
+		.domain_index = MT8195_AP_DOMAIN,
+		.addr_offset = 0x300,
+		.num_sensor = 2,
+		.sensor_map = {MT8195_TS7_0, MT8195_TS7_1},
+		.tc_speed = SET_TC_SPEED_IN_US(118, 118, 118, 118),
+		.hw_filter = LVTS_FILTER_2_OF_4,
+		.dominator_sensing_point = SENSING_POINT0,
+		.hw_reboot_trip_point = 117000,
+		.irq_bit = BIT(6),
+	}
+};
+
+static struct lvts_data mt8195_lvts_data = {
+	.num_domain = MT8195_NUM_DOMAIN,
+	.num_tc = MT8195_NUM_LVTS,
+	.tc = mt8195_tc_settings,
+	.num_sensor = MT8195_NUM_TS,
+	.ops = {
+		.efuse_to_cal_data = mt8195_efuse_to_cal_data,
+		.device_enable_and_init = device_enable_and_init_v4,
+		.device_enable_auto_rck = device_enable_auto_rck_v4,
+		.device_read_count_rc_n = device_read_count_rc_n_v4,
+		.set_cal_data = set_calibration_data_v4,
+		.init_controller = init_controller_v4,
+	},
+	.feature_bitmap = FEATURE_DEVICE_AUTO_RCK,
+	.num_efuse_addr = 22,
+	.num_efuse_block = 2,
+	.cal_data = {
+		.default_golden_temp = 50,
+		.default_count_r = 35000,
+		.default_count_rc = 2750,
+	},
+	.coeff = {
+		.a = -250460,
+		.b = 250460,
+	},
+};
+
 /*==================================================
  *==================================================
  * Support chips
@@ -1264,6 +1438,10 @@ static const struct of_device_id lvts_of_match[] = {
 		.compatible = "mediatek,mt6873-lvts",
 		.data = (void *)&mt6873_lvts_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-lvts",
+		.data = (void *)&mt8195_lvts_data,
+	},
 	{
 	},
 };
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
