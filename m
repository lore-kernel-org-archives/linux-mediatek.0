Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508D9C04ABA
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPGaIcaBpYIsL+K5fU/g5XcubHkm1r3TP41OLpcHHUU=; b=EsDievX4jD5ArO
	/PzFcaW1OtB3ogY1sc/RYCsDG4hhw3Xdqtf+BBFDb22139xWtfv1OJL5LNjhzosf+w8BXtAzeDuNK
	wVWo4ts98DkNIglgWKeYCNqzin9FeotFoiKiSlWt0fyddKP4AwRM+yM3noMaRotpEyq9VocOpgLij
	ogWl0dJYNdlnTXJLPTZ+4jXD2LqWea5a0j2H0iOBnEJhXqHeYqkmZVyLfGeFfrr0bZWY1QNXLLigJ
	aXhMeWdr/YkEab9HXKjaqf4zj9OocTQmRErCJbpq+4hih2xwLich9JNOg0QUh0V89/w5Q/le1FBiD
	UqKhdBjEJaT60QBkQLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj1LO-003mIh-01;
	Wed, 20 Sep 2023 17:50:34 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj1L5-003m9X-0o;
	Wed, 20 Sep 2023 17:50:17 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 61A2462615;
	Wed, 20 Sep 2023 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1695232211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPGaIcaBpYIsL+K5fU/g5XcubHkm1r3TP41OLpcHHUU=;
	b=GFMXvfg9d/BnAHtYhKhiU8HFWdvHDME9Kkq9jXrc4St8oh4WGMX6qjBy7htYFri4oY6Ywd
	FzRkIuGF5Ck+VL6ggxHrghuu0+FbpJWQh10bnYEosuL556EtNBN+Cs7zbZ9AMPD1YprvgQ
	BqCDdPAxxEekoKME8GvQ9g8iWNO7/Zo=
Received: from frank-G5.. (fttx-pool-217.61.152.105.bambit.de [217.61.152.105])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 967111006BE;
	Wed, 20 Sep 2023 17:50:10 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/4] thermal/drivers/mediatek/lvts_thermal: add mt7988 support
Date: Wed, 20 Sep 2023 19:50:01 +0200
Message-Id: <20230920175001.47563-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920175001.47563-1-linux@fw-web.de>
References: <20230920175001.47563-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 28533bc3-42fd-4ddc-a511-be8c45e8489c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_105015_450189_B67E67CE 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add Support for Mediatek Filogic 880/MT7988 LVTS.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- use 105°C for hw shutdown
- move constants to binding file
- change coeff.a to temp_factor and coeff.b to temp_offset
- change to lvts to lvts-ap (Application Processor)
- drop comments about efuse offsets
- change comment of mt8195 to be similar to mt7988
---
 drivers/thermal/mediatek/lvts_thermal.c | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index c2669f405a94..8fd1dc5adb16 100644
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
@@ -89,6 +91,7 @@
 #define LVTS_MSR_READ_TIMEOUT_US	400
 #define LVTS_MSR_READ_WAIT_US		(LVTS_MSR_READ_TIMEOUT_US / 2)
 
+#define LVTS_HW_SHUTDOWN_MT7988		105000
 #define LVTS_HW_SHUTDOWN_MT8195		105000
 
 #define LVTS_MINIMUM_THRESHOLD		20000
@@ -1269,6 +1272,41 @@ static int lvts_remove(struct platform_device *pdev)
 	return 0;
 }
 
+/*
+ * LVTS MT7988
+ */
+
+static const struct lvts_ctrl_data mt7988_lvts_ap_data_ctrl[] = {
+	{
+		.cal_offset = { 0x00, 0x04, 0x08, 0x0c }, //918,91C,920,924
+		.lvts_sensor = {
+			{ .dt_id = MT7988_CPU_0 }, // CPU 0,1
+			{ .dt_id = MT7988_CPU_1 }, // CPU 2,3
+			{ .dt_id = MT7988_ETH2P5G_0 }, // internal 2.5G Phy 1
+			{ .dt_id = MT7988_ETH2P5G_1 }  // internal 2.5G Phy 2
+		},
+		.num_lvts_sensor = 4,
+		.offset = 0x0,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT7988,
+	},
+	{
+		.cal_offset = { 0x14, 0x18, 0x1c, 0x20 }, //92C,930,934,938
+		.lvts_sensor = {
+			{ .dt_id = MT7988_TOPS_0}, // TOPS
+			{ .dt_id = MT7988_TOPS_1}, // TOPS
+			{ .dt_id = MT7988_ETHWARP_0}, // WED 1
+			{ .dt_id = MT7988_ETHWARP_1}  // WED 2
+		},
+		.num_lvts_sensor = 4,
+		.offset = 0x100,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT7988,
+	}
+};
+
+/*
+ * LVTS MT8195
+ */
+
 static const struct lvts_ctrl_data mt8195_lvts_mcu_data_ctrl[] = {
 	{
 		.cal_offset = { 0x04, 0x07 },
@@ -1348,6 +1386,13 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_data_ctrl[] = {
 	}
 };
 
+static const struct lvts_data mt7988_lvts_ap_data = {
+	.lvts_ctrl	= mt7988_lvts_ap_data_ctrl,
+	.num_lvts_ctrl	= ARRAY_SIZE(mt7988_lvts_ap_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT7988,
+	.temp_offset	= LVTS_COEFF_B_MT7988,
+};
+
 static const struct lvts_data mt8195_lvts_mcu_data = {
 	.lvts_ctrl	= mt8195_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_mcu_data_ctrl),
@@ -1363,6 +1408,7 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 };
 
 static const struct of_device_id lvts_of_match[] = {
+	{ .compatible = "mediatek,mt7988-lvts-ap", .data = &mt7988_lvts_ap_data },
 	{ .compatible = "mediatek,mt8195-lvts-mcu", .data = &mt8195_lvts_mcu_data },
 	{ .compatible = "mediatek,mt8195-lvts-ap", .data = &mt8195_lvts_ap_data },
 	{},
-- 
2.34.1


