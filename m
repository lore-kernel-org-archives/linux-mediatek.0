Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37376C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 18:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/Gp1HOJQpVt6kzdG1jbBjVVoqID2dO0BkBbfKI/SKo=; b=MzqtLiJ8F5s1Qv
	IIFrTLlm09SMq38xnTqMem4shMJZA85u4cDYXJupbt5h3Cogf8ViKKTORYXwlVsLcrlftBbq7Pmzf
	CRZn5fhvOMbS/1ToV8liNO6iuRQ1D3kB4o6UOb/gX0m4aUskHuqSu6p0fDs+xc5X3kIgmnhl5X/Pz
	3fw2CJIcO8vKn1fgEycGR6KjPUuC1x1Gyr52mdaTmWcwMrQsBQaciZbxB4TAKqgIi12kqL9DOCDLR
	leY5vI96uLh7a6NGtuvqbdK1RYpVCyug5s3SCD80Yq672SrpRZAaEGjAFuHvF08Nwz+yzfr97rf9a
	J7QCSf8qzPQAHqaig50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfljm-0018Cs-0U;
	Mon, 11 Sep 2023 18:34:18 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfljd-00189W-33;
	Mon, 11 Sep 2023 18:34:12 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 8F86460546;
	Mon, 11 Sep 2023 18:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1694457245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E/Gp1HOJQpVt6kzdG1jbBjVVoqID2dO0BkBbfKI/SKo=;
	b=T3GbUsbwnNVvUGY8yPZLniV/AUr8EG6aIW6ALp3mgTsJWef6nYUREpaG8EOemJtykiHkQ5
	eTAS+00g8kHtMzUm+FHLwKOp/uKUm3tO1MDyJEZoSTxBFuRlLubzs8VwykqborcfnTnBc1
	iSDMWmVoR0c/Z+OrRYdz9sCwYAJkhYs=
Received: from frank-G5.. (fttx-pool-217.61.151.158.bambit.de [217.61.151.158])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id A9F8636077E;
	Mon, 11 Sep 2023 18:34:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 3/3] thermal/drivers/mediatek/lvts_thermal: add mt7988 support
Date: Mon, 11 Sep 2023 20:33:54 +0200
Message-Id: <20230911183354.11487-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911183354.11487-1-linux@fw-web.de>
References: <20230911183354.11487-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a4e93b6f-45bb-4e0f-b9a9-b41ceba0b075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_113410_124061_343A95EF 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add Support for mediatek fologic 880/MT7988.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/thermal/mediatek/lvts_thermal.c | 73 +++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index c1004b4da3b6..48b257a3c80e 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -82,6 +82,8 @@
 #define LVTS_GOLDEN_TEMP_DEFAULT	50
 #define LVTS_COEFF_A_MT8195			-250460
 #define LVTS_COEFF_B_MT8195			250460
+#define LVTS_COEFF_A_MT7988			-204650
+#define LVTS_COEFF_B_MT7988			204650
 
 #define LVTS_MSR_IMMEDIATE_MODE		0
 #define LVTS_MSR_FILTERED_MODE		1
@@ -1272,6 +1274,67 @@ static int lvts_remove(struct platform_device *pdev)
 	return 0;
 }
 
+/*
+ * LVTS MT7988
+ */
+#define LVTS_HW_SHUTDOWN_MT7988	117000
+//enum mt7988_lvts_domain { MT7988_AP_DOMAIN, MT7988_NUM_DOMAIN };
+
+enum mt7988_lvts_sensor_enum {
+	MT7988_TS3_0,
+	MT7988_TS3_1,
+	MT7988_TS3_2,
+	MT7988_TS3_3,
+	MT7988_TS4_0,
+	MT7988_TS4_1,
+	MT7988_TS4_2,
+	MT7988_TS4_3,
+	MT7988_NUM_TS
+};
+
+//Efuse base : 0x11f50000
+//lvts offset in efuse : 0x918 (set in efuse dts node as calibration data)
+//offsets:
+//918 = LVTS_3_0_COUNT_R
+//91C = LVTS_3_1_COUNT_R
+//920 = LVTS_3_2_COUNT_R
+//924 = LVTS_3_3_COUNT_R
+//928 = LVTS_3_COUNT_RC
+
+//92C = LVTS_4_0_COUNT_R
+//930 = LVTS_4_1_COUNT_R
+//934 = LVTS_4_2_COUNT_R
+//938 = LVTS_4_3_COUNT_R
+//93C = LVTS_4_COUNT_RC
+
+static const struct lvts_ctrl_data mt7988_lvts_data_ctrl[] = {
+	{
+		.cal_offset = { 0x00, 0x04, 0x08, 0x0c }, //918,91C,920,924
+		.lvts_sensor = {
+			{ .dt_id = MT7988_TS3_0 },
+			{ .dt_id = MT7988_TS3_1 },
+			{ .dt_id = MT7988_TS3_2 },
+			{ .dt_id = MT7988_TS3_3 }
+		},
+		.num_lvts_sensor = 4,
+		.offset = 0x0,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT7988,
+	},
+	{
+		.cal_offset = { 0x14, 0x18, 0x1c, 0x20 }, //92C,930,934,938
+		.lvts_sensor = {
+			{ .dt_id = MT7988_TS4_0},
+			{ .dt_id = MT7988_TS4_1},
+			{ .dt_id = MT7988_TS4_2},
+			{ .dt_id = MT7988_TS4_3}
+		},
+		.num_lvts_sensor = 4,
+		.offset = 0x100,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT7988,
+	}
+};
+
+//MT8195
 static const struct lvts_ctrl_data mt8195_lvts_mcu_data_ctrl[] = {
 	{
 		.cal_offset = { 0x04, 0x07 },
@@ -1351,6 +1414,15 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_data_ctrl[] = {
 	}
 };
 
+static const struct lvts_data mt7988_lvts_data = {
+	.lvts_ctrl	= mt7988_lvts_data_ctrl,
+	.num_lvts_ctrl	= ARRAY_SIZE(mt7988_lvts_data_ctrl),
+	.coeff = {
+		.a = LVTS_COEFF_A_MT7988,
+		.b = LVTS_COEFF_B_MT7988,
+	},
+};
+
 static const struct lvts_data mt8195_lvts_mcu_data = {
 	.lvts_ctrl	= mt8195_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_mcu_data_ctrl),
@@ -1372,6 +1444,7 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 };
 
 static const struct of_device_id lvts_of_match[] = {
+	{ .compatible = "mediatek,mt7988-lvts", .data = &mt7988_lvts_data },
 	{ .compatible = "mediatek,mt8195-lvts-mcu", .data = &mt8195_lvts_mcu_data },
 	{ .compatible = "mediatek,mt8195-lvts-ap", .data = &mt8195_lvts_ap_data },
 	{},
-- 
2.34.1


