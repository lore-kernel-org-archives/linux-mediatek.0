Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8E8C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okJUfe+J2lktOzbTBoR7fCmJ4uPpfts4ISVsUrRsL8s=; b=Rzsu9EAtLVrQoARIClMnBdSw1t
	aXPznvcaLeqQX7Rvgl9jkaGL8dT9LeAgzfK0IC40wYN2HfkHs751uujJaCLJ2ZOxWjhVluQfRN4dW
	Y1yPLo52INHkAxumU1ML3bTnq3MUnaFCUr7GWr3vidbJpVv3sjcewe4e9fbuOeQsQpEVnRAeK8YFS
	HwsUckSLd+NyNvvTYXJQp5yfgiIrLAGlPMNygdoYbTvr7jOLdbVOtX4t+7cAsefXhkuasC2vGRpET
	cGsv0hG92Iaficz7trjJUPgK0S82DVphZhbRK58Ft5maXFbOBBM8qsmyU9HU7O+7eg0E9wGACM8cG
	/b2BLY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fvC-00B9X9-2L;
	Mon, 29 May 2023 16:40:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fvB-00B9WU-0v
	for linux-mediatek@bombadil.infradead.org;
	Mon, 29 May 2023 16:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=okJUfe+J2lktOzbTBoR7fCmJ4uPpfts4ISVsUrRsL8s=; b=hyqhNJLJUi6Boy/EvF27xgpqBW
	e67nEAOfHBgj07YETsiypbAWDGeuyQyA5WZY8L5n7et4QqygiMNkp38ep0Fq7pzNqJIiC3B5d6wEU
	CofEsXGx+27ho26Vgn4izFVng36J0dJkWrZk5kHMYr+6DCVDl+kbUiBm7Vwuijrx8gOhHrjOEGggm
	RdMSLb9aIUxMQQUjIf5dvCSk7r7uJ6VJSCzT5BpzpiaXHo0U3MZB9Dvn5e1zx54hzWMS0DWVrwcxB
	wyy2rKXCfxUWGeieEN9B9WsZJj+nupncTqQQ1OTmM1EhvkRAeYGUBZG4/u2QrHcNGqVvx0gzZHk3D
	ZAyNk+Ng==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3euK-00BvXC-2t
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 15:35:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30ae61354fbso1084833f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685374539; x=1687966539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okJUfe+J2lktOzbTBoR7fCmJ4uPpfts4ISVsUrRsL8s=;
        b=NS0pX9COgJWbr5d79P8/3iY6bZnrVbpsLAZI49cLvjkr8spD9tqOztdfBCY3Gn6Lds
         /1uov4ZItcSTVxZKrPEQ6VSVFkYUHApadQdxAF9J6FPGSY6/tDxD/61t65Fje98Pffib
         VbpuICwrNoSBngs4Nf4rbyQJQRRt9p534nbEbqb1dsltYfnZCGm8yINHiTJOJRD2KghD
         Rz+Z0nRZZqTiaMLZn86FC0gzrB/Sp15ifze5nX4/fl6pppipyFHmBuz0MwSIX3/6thPR
         cRVodjoK6FB4nD5CX5Ea5r+32ROAX26J7NIbWwT5oK2RFwHJ8KDq7Y+H+phMbQri8eGY
         9u6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685374539; x=1687966539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okJUfe+J2lktOzbTBoR7fCmJ4uPpfts4ISVsUrRsL8s=;
        b=DIF0QENqXlpNtx4STKRrdtbqAarHukchoWOiHOnYJh9Kf1e+Zs09tyL2iOLb37n/wY
         8IkJP7RXG6f9r0SD1QR1KKO+s40iJ6hUesoUsYGdeX+zwn8ypT0GCwdcpDLKqK5GNumH
         oGt3V1zDPKpLcBCPj/Z5lLsOcPY46ClBsM0x2i9GPMEPgg9d4K+394NizgKdhbT9yPLS
         +AD4Z+ABSRWXcYn2kKOaO/tpzewEu/I8yiRvc930AuuiJ3eLcebxti1yonGb/0zCfsW/
         6+53AxIFvG66GWk7kUfVJFlH8oDtrPAcyNb0C9ci2ZI3YTWHyfu4NMWGqCDW/I3lMNrN
         /Dwg==
X-Gm-Message-State: AC+VfDwUtLG27J7teNDQyBgUqC1QtadSmxnI8AVu2MIy02TKjS/SE+AL
	avfWV+2hO1jLO2vjfwwTvgBGYQ==
X-Google-Smtp-Source: ACHHUZ5u2XpZ9IFBwAwLoRHz0ujidyfO2mfgl+1ahV/sz3Y7KccSdj1EbKTzlJTfC21W95MVkMiv2A==
X-Received: by 2002:adf:dd4b:0:b0:2f0:e287:1fbc with SMTP id u11-20020adfdd4b000000b002f0e2871fbcmr9100259wrm.11.1685374538821;
        Mon, 29 May 2023 08:35:38 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j27-20020a5d453b000000b003095a329e90sm269781wra.97.2023.05.29.08.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 08:35:38 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzystof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pangutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	wenst@chromium.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v3 3/5] thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
Date: Mon, 29 May 2023 17:35:30 +0200
Message-ID: <20230529153532.3541327-4-bero@baylibre.com>
X-Mailer: git-send-email 2.41.0.rc2
In-Reply-To: <20230529153532.3541327-1-bero@baylibre.com>
References: <20230529153532.3541327-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_163540_972175_57726FDA 
X-CRM114-Status: GOOD (  11.84  )
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

Add LVTS Driver support for MT8192.

Co-developed-by : Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 95 +++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 5ea8a9d569ea6..d5e5214784ece 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -80,6 +80,7 @@
 #define LVTS_MSR_FILTERED_MODE		1
 
 #define LVTS_HW_SHUTDOWN_MT8195		105000
+#define LVTS_HW_SHUTDOWN_MT8192		105000
 
 static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
 static int coeff_b = LVTS_COEFF_B;
@@ -1280,6 +1281,88 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_data_ctrl[] = {
 	}
 };
 
+static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
+	{
+		.cal_offset = { 0x04, 0x08 },
+		.lvts_sensor = {
+			{ .dt_id = MT8192_MCU_BIG_CPU0 },
+			{ .dt_id = MT8192_MCU_BIG_CPU1 }
+		},
+		.num_lvts_sensor = 2,
+		.offset = 0x0,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
+		.mode = LVTS_MSR_FILTERED_MODE,
+	},
+	{
+		.cal_offset = { 0x0c, 0x10 },
+		.lvts_sensor = {
+			{ .dt_id = MT8192_MCU_BIG_CPU2 },
+			{ .dt_id = MT8192_MCU_BIG_CPU3 }
+		},
+		.num_lvts_sensor = 2,
+		.offset = 0x100,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
+		.mode = LVTS_MSR_FILTERED_MODE,
+	},
+	{
+		.cal_offset = { 0x14, 0x18, 0x1c, 0x20 },
+		.lvts_sensor = {
+			{ .dt_id = MT8192_MCU_LITTLE_CPU0 },
+			{ .dt_id = MT8192_MCU_LITTLE_CPU1 },
+			{ .dt_id = MT8192_MCU_LITTLE_CPU2 },
+			{ .dt_id = MT8192_MCU_LITTLE_CPU3 }
+		},
+		.num_lvts_sensor = 4,
+		.offset = 0x200,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
+		.mode = LVTS_MSR_FILTERED_MODE,
+	}
+};
+
+static const struct lvts_ctrl_data mt8192_lvts_ap_data_ctrl[] = {
+		{
+		.cal_offset = { 0x24, 0x28 },
+		.lvts_sensor = {
+			{ .dt_id = MT8192_AP_VPU0 },
+			{ .dt_id = MT8192_AP_VPU1 }
+		},
+		.num_lvts_sensor = 2,
+		.offset = 0x0,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
+	},
+	{
+		.cal_offset = { 0x2c, 0x30 },
+		.lvts_sensor = {
+			{ .dt_id = MT8192_AP_GPU0 },
+			{ .dt_id = MT8192_AP_GPU1 }
+		},
+		.num_lvts_sensor = 2,
+		.offset = 0x100,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
+	},
+	{
+		.cal_offset = { 0x34, 0x38 },
+		.lvts_sensor = {
+			{ .dt_id = MT8192_AP_INFRA },
+			{ .dt_id = MT8192_AP_CAM },
+		},
+		.num_lvts_sensor = 2,
+		.offset = 0x200,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
+	},
+	{
+		.cal_offset = { 0x3c, 0x40, 0x44 },
+		.lvts_sensor = {
+			{ .dt_id = MT8192_AP_MD0 },
+			{ .dt_id = MT8192_AP_MD1 },
+			{ .dt_id = MT8192_AP_MD2 }
+		},
+		.num_lvts_sensor = 3,
+		.offset = 0x300,
+		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
+	}
+};
+
 static const struct lvts_data mt8195_lvts_mcu_data = {
 	.lvts_ctrl	= mt8195_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_mcu_data_ctrl),
@@ -1290,9 +1373,21 @@ static const struct lvts_data mt8195_lvts_ap_data = {
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_ap_data_ctrl),
 };
 
+static const struct lvts_data mt8192_lvts_mcu_data = {
+	.lvts_ctrl	= mt8192_lvts_mcu_data_ctrl,
+	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
+};
+
+static const struct lvts_data mt8192_lvts_ap_data = {
+	.lvts_ctrl	= mt8192_lvts_ap_data_ctrl,
+	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_ap_data_ctrl),
+};
+
 static const struct of_device_id lvts_of_match[] = {
 	{ .compatible = "mediatek,mt8195-lvts-mcu", .data = &mt8195_lvts_mcu_data },
 	{ .compatible = "mediatek,mt8195-lvts-ap", .data = &mt8195_lvts_ap_data },
+	{ .compatible = "mediatek,mt8192-lvts-mcu", .data = &mt8192_lvts_mcu_data },
+	{ .compatible = "mediatek,mt8192-lvts-ap", .data = &mt8192_lvts_ap_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, lvts_of_match);
-- 
2.41.0.rc2


