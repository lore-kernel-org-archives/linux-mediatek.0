Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA86C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 12:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4daRIB+5Zl5wf4UHbKRQJ4+gpxaEhGHzs2uuT7QUHW4=; b=lF6cUQtV0QKlfv
	bVrLRKyWaAnfzuK/H+mGgpta8Fwt0AGPJ9C/N0SQBhh2k/NzwexeJeEpQSoto7pKkpdh3kuCfAPXG
	1ritScPsZQMszG7CWA0L0KrPjQKFoR08QnRyCoEnphynEpJOHG5KUHEdzuLTj9LQ/mAARA8lrHNkS
	lzQyk9jxOJFL8vmjW4r5R2ufEQKe6Bdl8CSubhTBAc4RZCBjxqnngVPWdm8WyApFyd7HQb4ElhD7H
	vjqePafj4gyCaK/IOjZPB8ib74IkTkVVin70ZFcRULyJFQKqcBCSRU07tlnTrk/p6agqwDIaBqtGy
	2upkasO/cvXd2Bo7uqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np7sM-00BmYt-G8; Thu, 12 May 2022 12:25:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7s2-00BmIZ-U3
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 12:24:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v12so6989872wrv.10
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tQMVyVqHgBWr9jrth3XGcb0oJTmc+ZSSOROdsenztjQ=;
 b=EI5SK+x2NOPcWAR0ZjAzXIc1jlEF/SB9Fbehmu8SsfBBkbmbBQIAsRnBRasB3L8DRd
 VIUWoiiTfSO1te4Tld0MYxOBuvqZV6klL8d3U5ttww/hvKZerH8ajUGxx2vvCmWMSFwh
 VMjwUIFKiurnw/aYrxIu8qrKoP9No2+SO4ROvXduNwE+gpLKnSnl59TibGRy0zNimL+g
 XTwtsw+cNX9VRZzaOIKaU5ZZId3crQh8ucJachBS1cHxEQKjpprnfI9irH5YbWSOna8F
 Sp5gro8X/z7WH0/h0bns/01hZf96UHpF/toQEbELjQNBq8TlOBuxhkkB+x8GtO1hcADO
 Rbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tQMVyVqHgBWr9jrth3XGcb0oJTmc+ZSSOROdsenztjQ=;
 b=OaCjX2eOkIYYU9zVyDXEK52lncejDt9CDTGgd2WWFf2/7aqUw5DhbEz6ZNvGarXS0c
 r39r840cTuhYv3w4kHSUNcVh4+cz7Ih963uQjkeqd6QwuHhRjm/VgvjUXhOXEa7zDetA
 mCRcV5nYuDIuIIdTCsjf1SV81aVkbwA3OzqasGg9eXIfj3z0xv6j8gDx7LN3Ugc1FF6k
 oIk3CS1YuCc4f0FdohbIS8oYjoeo1kWrTYd2rHd/kucy1b49Ik2spJibUgQjlTE8Orq6
 OJsLi4o/th8Ooswam3X+gPfirdAPRjk5bGN+D9DgpZ/jyPWNcq4yTKzqYOesXui5gmxK
 m1kA==
X-Gm-Message-State: AOAM533nDI4GxCGZ8B1FAIcgVNlGR14aZotgU7JhqgJsMPyAUwGJ3mjG
 /+8FtZAn4Gzg59XllrQvqDurqQ==
X-Google-Smtp-Source: ABdhPJwoYdXx8akupLRzTqMljKIUVeJymrNlpE7RVAeYS77j644kQJr6ac3Xa8fscPzbbEsY7SxgMg==
X-Received: by 2002:a5d:6843:0:b0:20a:def2:5545 with SMTP id
 o3-20020a5d6843000000b0020adef25545mr27456759wrw.89.1652358282399; 
 Thu, 12 May 2022 05:24:42 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc156000000b003942a244f30sm3047819wmi.9.2022.05.12.05.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:24:42 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Subject: [PATCH v6 5/7] thermal: mediatek: Add thermal zone settings for mt8195
Date: Thu, 12 May 2022 14:24:31 +0200
Message-Id: <20220512122433.1399802-6-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512122433.1399802-1-abailon@baylibre.com>
References: <20220512122433.1399802-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_052443_040307_99D4211E 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, rui.zhang@intel.com,
 ben.tseng@mediatek.com, linux-arm-kernel@lists.infradead.org
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
index 145ddd5fe409..1c83c4f9aa64 100644
--- a/drivers/thermal/mediatek/soc_temp_lvts.c
+++ b/drivers/thermal/mediatek/soc_temp_lvts.c
@@ -53,6 +53,7 @@
 
 #define CLOCK_26MHZ_CYCLE_NS	(38)
 #define BUS_ACCESS_US		(2)
+#define GOLDEN_TEMP_MAX		(62)
 
 #define FEATURE_DEVICE_AUTO_RCK	(BIT(0))
 #define FEATURE_CK26M_ACTIVE	(BIT(1))
@@ -549,21 +550,10 @@ static int prepare_calibration_data(struct lvts_data *lvts_data)
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
@@ -1247,6 +1237,190 @@ static struct lvts_data mt6873_lvts_data = {
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
@@ -1257,6 +1431,10 @@ static const struct of_device_id lvts_of_match[] = {
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
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
