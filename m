Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD88C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDUOEs+XSiOfyiNiOvW3qp6/s0S8NXRmgJF421g68As=; b=AOvImU98G74o770xHW6+ScHx8S
	U6jaMTSXwxJUO74FAIOZG+HdX9yTqjbcQAQXP1Xg6hfyV+aWLFgfWvGPbPtxUtWQ04c4sFnkz8365
	m/tOttEySwzT3Fk1Xaw/mYvWH9xI6kXynIqjkct+EswAiDjJFyVthzyt7q0k36dFUw+1UviWQWPk0
	xQhiGzy+yPhBVengaVcdffQei0GmSU6SfpGbZMq2v/7V8MULu0iiHFOo06f3bnVcp7WGm9nI22tFw
	b3u7go2Z7XONzxu0BSUGsvD45d7P7Wr58vaC5I7wrqR3izujcdLWRSuhqAsZ8PnvLDwTFqGbyC1Io
	Y3RriwKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaRv-001dLO-FE; Tue, 07 Mar 2023 16:46:03 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZVK-001IQr-A3
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 15:45:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id j2so12560808wrh.9
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 07:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678203929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDUOEs+XSiOfyiNiOvW3qp6/s0S8NXRmgJF421g68As=;
        b=T2+UqBQ/B0o7lX4P+fFNGS8AxIhdRQnYL4u4eNa7vRwBpDax96IfUm5+btsWfAbHcK
         Sdr3j0hYKmTAbAHYv/qL/mPpQQJJPqyKnKMepnHYk3PdPsyrRt5pQVsB4wYuygFJ7jg5
         H0Ic8Yt+QpJOslls+C9511LK9mHgITHGmgRC6e4n2N8NOVMCiP2ueRTdPubfescwcybS
         61uLpz+0u8U9qoUSjalcknogymte+g8ZLweUlmmH0L/cH0M4DaN7UOYZVZZ7MHUOBmzM
         L97fKVMk6hNpf4IT17R9VddhXt8Rr0OKI/efvPyffo6FYMDI7YjO9u0YsRXDmxX0e8TL
         uXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDUOEs+XSiOfyiNiOvW3qp6/s0S8NXRmgJF421g68As=;
        b=b+ANaErFjZf2h3x/j2lbCJ2js56cJRaDrCD/KMAf1JdjJ3aK+JYy1rk2BlYAbj74zo
         HWBwCHf2ajx1qCWljHPLOG5Qoz3BYS53nOPd9lZ27VLgilN5zDPgf1PJOKEykcd/npqk
         rDqJIPF0DZuug1/fVZiduxsId1nlWTFN018juQzmNZ5UR30wo9ch7usm/qCPYIqoQGiN
         qtTgUYzkN9onxSKuupfGi1d+0r5AienB++jAINl7N0zB6FYIkOFBQ/NcN/fL/cwRdTwG
         og9BbqbNFmSxDx+NIfadp3+/82fMex6FSdps6CoPNnVmPUvViBkBvRNciQvDE4lNJPcZ
         OceA==
X-Gm-Message-State: AO0yUKWHfOPzTpkDCQtDrZww0EMDeIcfKhFheXRMCpPfNBP/md8/+fGS
	CLd49YacrrRlaeqNKiuuQ4+baQ==
X-Google-Smtp-Source: AK7set+D4VvEr8Bpnmjt43C/gu6jiUPUyAHWRjw53NuTFxCehWbsdbW+MiO3KVlZBzRA8OdTuO/NLw==
X-Received: by 2002:a5d:634d:0:b0:2c7:ae57:5acc with SMTP id b13-20020a5d634d000000b002c7ae575accmr9993378wrw.26.1678203929163;
        Tue, 07 Mar 2023 07:45:29 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d50c2000000b002c704271b05sm12697905wrt.66.2023.03.07.07.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:45:29 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH 2/4] thermal/drivers/mediatek/lvts_thermal: Add AP domain for mt8195
Date: Tue,  7 Mar 2023 16:45:22 +0100
Message-Id: <20230307154524.118541-3-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307154524.118541-1-bchihi@baylibre.com>
References: <20230307154524.118541-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_074530_383871_700EBDB4 
X-CRM114-Status: GOOD (  14.01  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add MT8195 AP Domain support to LVTS Driver.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 94 +++++++++++++++++++------
 1 file changed, 74 insertions(+), 20 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 5dbc80ba961b..7565def6b27c 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -528,29 +528,33 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
  * The efuse blob values follows the sensor enumeration per thermal
  * controller. The decoding of the stream is as follow:
  *
- *                        <--?-> <----big0 ???---> <-sensor0-> <-0->
- *                        ------------------------------------------
- * index in the stream: : | 0x0 | 0x1 | 0x2 | 0x3 | 0x4 | 0x5 | 0x6 |
- *                        ------------------------------------------
+ * stream index map for MCU Domain :
  *
- *                        <--sensor1--><-0-> <----big1 ???---> <-sen
- *                        ------------------------------------------
- *                        | 0x7 | 0x8 | 0x9 | 0xA | 0xB | OxC | OxD |
- *                        ------------------------------------------
+ * <-----mcu-tc#0-----> <-----sensor#0-----> <-----sensor#1----->
+ *  0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09
  *
- *                        sor0-> <-0-> <-sensor1-> <-0-> ..........
- *                        ------------------------------------------
- *                        | 0x7 | 0x8 | 0x9 | 0xA | 0xB | OxC | OxD |
- *                        ------------------------------------------
+ * <-----mcu-tc#1-----> <-----sensor#2-----> <-----sensor#3----->
+ *  0x0A | 0x0B | 0x0C | 0x0D | 0x0E | 0x0F | 0x10 | 0x11 | 0x12
  *
- * And so on ...
+ * <-----mcu-tc#2-----> <-----sensor#4-----> <-----sensor#5-----> <-----sensor#6-----> <-----sensor#7----->
+ *  0x13 | 0x14 | 0x15 | 0x16 | 0x17 | 0x18 | 0x19 | 0x1A | 0x1B | 0x1C | 0x1D | 0x1E | 0x1F | 0x20 | 0x21
+ *
+ * stream index map for AP Domain :
+ *
+ * <-----ap--tc#0-----> <-----sensor#0-----> <-----sensor#1----->
+ *  0x22 | 0x23 | 0x24 | 0x25 | 0x26 | 0x27 | 0x28 | 0x29 | 0x2A
+ *
+ * <-----ap--tc#1-----> <-----sensor#2-----> <-----sensor#3----->
+ *  0x2B | 0x2C | 0x2D | 0x2E | 0x2F | 0x30 | 0x31 | 0x32 | 0x33
+ *
+ * <-----ap--tc#2-----> <-----sensor#4-----> <-----sensor#5-----> <-----sensor#6----->
+ *  0x34 | 0x35 | 0x36 | 0x37 | 0x38 | 0x39 | 0x3A | 0x3B | 0x3C | 0x3D | 0x3E | 0x3F
+ *
+ * <-----ap--tc#3-----> <-----sensor#7-----> <-----sensor#8----->
+ *  0x40 | 0x41 | 0x42 | 0x43 | 0x44 | 0x45 | 0x46 | 0x47 | 0x48
  *
  * The data description gives the offset of the calibration data in
  * this bytes stream for each sensor.
- *
- * Each thermal controller can handle up to 4 sensors max, we don't
- * care if there are less as the array of calibration is sized to 4
- * anyway. The unused sensor slot will be zeroed.
  */
 static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
 					const struct lvts_ctrl_data *lvts_ctrl_data,
@@ -1163,7 +1167,7 @@ static int lvts_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct lvts_ctrl_data mt8195_lvts_data_ctrl[] = {
+static const struct lvts_ctrl_data mt8195_lvts_mcu_data_ctrl[] = {
 	{
 		.cal_offset = { 0x04, 0x07 },
 		.lvts_sensor = {
@@ -1198,13 +1202,63 @@ static const struct lvts_ctrl_data mt8195_lvts_data_ctrl[] = {
 	}
 };
 
+static const struct lvts_ctrl_data mt8195_lvts_ap_data_ctrl[] = {
+		{
+		.cal_offset = { 0x25, 0x28 },
+		.lvts_sensor = {
+			{ .dt_id = MT8195_AP_VPU0 },
+			{ .dt_id = MT8195_AP_VPU1 }
+		},
+		.num_lvts_sensor = 2,
+		.offset = 0x0,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8195,
+	},
+	{
+		.cal_offset = { 0x2e, 0x31 },
+		.lvts_sensor = {
+			{ .dt_id = MT8195_AP_GPU0 },
+			{ .dt_id = MT8195_AP_GPU1 }
+		},
+		.num_lvts_sensor = 2,
+		.offset = 0x100,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8195,
+	},
+	{
+		.cal_offset = { 0x37, 0x3a, 0x3d },
+		.lvts_sensor = {
+			{ .dt_id = MT8195_AP_VDEC },
+			{ .dt_id = MT8195_AP_IMG },
+			{ .dt_id = MT8195_AP_INFRA },
+		},
+		.num_lvts_sensor = 3,
+		.offset = 0x200,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8195,
+	},
+	{
+		.cal_offset = { 0x43, 0x46 },
+		.lvts_sensor = {
+			{ .dt_id = MT8195_AP_CAM0 },
+			{ .dt_id = MT8195_AP_CAM1 }
+		},
+		.num_lvts_sensor = 2,
+		.offset = 0x300,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8195,
+	}
+};
+
 static const struct lvts_data mt8195_lvts_mcu_data = {
-	.lvts_ctrl	= mt8195_lvts_data_ctrl,
-	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_data_ctrl),
+	.lvts_ctrl	= mt8195_lvts_mcu_data_ctrl,
+	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_mcu_data_ctrl),
+};
+
+static const struct lvts_data mt8195_lvts_ap_data = {
+	.lvts_ctrl	= mt8195_lvts_ap_data_ctrl,
+	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_ap_data_ctrl),
 };
 
 static const struct of_device_id lvts_of_match[] = {
 	{ .compatible = "mediatek,mt8195-lvts-mcu", .data = &mt8195_lvts_mcu_data },
+	{ .compatible = "mediatek,mt8195-lvts-ap", .data = &mt8195_lvts_ap_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, lvts_of_match);
-- 
2.34.1


