Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DCCC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 18:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnHprbBz+W/86A0exZy3GZpnEQGESnoFjgTW6IcD/SE=; b=SonOKuN81CN26S
	Ox2tkI+ze+cdx2ydmHn6U6JPpj3cjZfS/InmzlDZYyyoWl44V9GHXSB+kI9jf3WZzBG9B6+HmVbiD
	Hksmd/L6gL8UF6hCgCKVHu0MPrjU9SP3RltNkBsu+SZzfRsjuJe/pdZy8FzgsRQ3TBbfaq9q+W6wP
	HWVMMZQ6+K82TYLUXsN7igC9L1XkT5zHAlADRsDyOA8h1EOeVZAlEJ/8DLpGLbUfcfkz/sMnyp64H
	qLz5PXYdzAOHMyle9kxDCd0KL+mx9BX/O3VyIlFG2/Rw0n3fgMkfgAEHE8CBELG9ddKWut0xRUv0Q
	3oEa864Y3dSfqV5xdvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvkIO-007tP4-L2; Mon, 30 May 2022 18:39:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvkHu-007tFZ-V7
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 18:38:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id f7-20020a1c3807000000b0039c1a10507fso18135wma.1
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 11:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I4hdlp+GYVPBs6R4foXhQq7p2uMZUA0mfmfEeHgfRYk=;
        b=19tb2GL/1qRBKMqZm5zYI+65NBh09iLJkI8fSi75gG8zVVacNL7XTN6OKcOhzq1lgd
         1PCchVSQjds59pnBW1wV+QCDXcCL7ISKsnU69TRH9KFDVc91P1OmwLvuQI5WWxSmRUWS
         XGnRibmhkzoqQM/NHSyY9G97RbvVKFhKoI+k8tlQO/shmRcbrp43Q9Zb5qeOURJaM4oU
         WYpHBN+4LNbGZPkNxZObrezrgFN0t64jgdY+Me4bB54G5Pw78OMJ8VimPoaODMtEqCaA
         a1PvgJ+aPria8O/Sa/z3etrpGfFt1LYqfJ4pDZTRKfgx2wZ3jShyRAhMpxiZZwqBf6du
         wJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4hdlp+GYVPBs6R4foXhQq7p2uMZUA0mfmfEeHgfRYk=;
        b=fzDpZs4TBWpDpKouMF4kKRvCBtrxTDCnPT2LLID3NfEnpJI3RNXYV3AK40WvjFkN2e
         a/nOGyUL09zOuS0dFglLi/jmnGt9wEkuMdeF183xHiEimUXSqYBgbWxuvKadWAJ6s741
         Ntv2f841xB0jZN+0XvM+kgDubHSl/bwC3VRRlUa0r7NEpVoajpgve3s/ixX5t06Zig+Q
         1Vxj10CI9iqiBFAcwKh3ma+Daj2od+gSiLqCF0XlJsgtrDmrfXa7k7g/rS2htMxCl4rZ
         AKxIs2iqf1YHCjfUho+FYEGHUiTr+3zrKV0Udkrap+P9VbqslhOJOIJY+yo7IJIPQutT
         bb3Q==
X-Gm-Message-State: AOAM5311UIVt7ciG31Wr3f5U24uCrssBzYw91kuyqIZxmt5CXknuZc61
	9pAjbx0VAl+zB4Lkvkw+byr2Pg==
X-Google-Smtp-Source: ABdhPJx9KVi6CXIWVNzmMisTNLD6VHqR22nnfGs1eiDSZW7q0N8TSs74mOGgf2QHNFDAhlf4nj5b0A==
X-Received: by 2002:a05:600c:1e8a:b0:397:171e:92a9 with SMTP id be10-20020a05600c1e8a00b00397171e92a9mr20018831wmb.159.1653935923393;
        Mon, 30 May 2022 11:38:43 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id e9-20020adfe389000000b0020c5253d8fcsm11459088wrm.72.2022.05.30.11.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:38:42 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] thermal: mediatek: add support for MT8365 SoC
Date: Mon, 30 May 2022 20:38:33 +0200
Message-Id: <20220530183833.863040-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530183833.863040-1-fparent@baylibre.com>
References: <20220530183833.863040-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_113847_029687_9130149B 
X-CRM114-Status: GOOD (  15.46  )
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

MT8365 is similar to the other SoCs supported by the driver. It has only
one bank and 3 actual sensors that can be multiplexed. There is another
one sensor that does not have usable data.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/thermal/mtk_thermal.c | 68 +++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index b09738ef1093..1dc276f8c4f1 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -31,6 +31,7 @@
 #define AUXADC_CON2_V		0x010
 #define AUXADC_DATA(channel)	(0x14 + (channel) * 4)
 
+#define APMIXED_SYS_TS_CON0	0x600
 #define APMIXED_SYS_TS_CON1	0x604
 
 /* Thermal Controller Registers */
@@ -245,6 +246,17 @@ enum mtk_thermal_version {
 /* The calibration coefficient of sensor  */
 #define MT8183_CALIBRATION	153
 
+/* MT8365 */
+#define MT8365_TEMP_AUXADC_CHANNEL 11
+#define MT8365_CALIBRATION 164
+#define MT8365_NUM_CONTROLLER 1
+#define MT8365_NUM_BANKS 1
+#define MT8365_NUM_SENSORS 3
+#define MT8365_NUM_SENSORS_PER_ZONE 3
+#define MT8365_TS1 0
+#define MT8365_TS2 1
+#define MT8365_TS3 2
+
 struct mtk_thermal;
 
 struct thermal_bank_cfg {
@@ -389,6 +401,24 @@ static const int mt7622_mux_values[MT7622_NUM_SENSORS] = { 0, };
 static const int mt7622_vts_index[MT7622_NUM_SENSORS] = { VTS1 };
 static const int mt7622_tc_offset[MT7622_NUM_CONTROLLER] = { 0x0, };
 
+/* MT8365 thermal sensor data */
+static const int mt8365_bank_data[MT8365_NUM_SENSORS] = {
+	MT8365_TS1, MT8365_TS2, MT8365_TS3
+};
+
+static const int mt8365_msr[MT8365_NUM_SENSORS_PER_ZONE] = {
+	TEMP_MSR0, TEMP_MSR1, TEMP_MSR2
+};
+
+static const int mt8365_adcpnp[MT8365_NUM_SENSORS_PER_ZONE] = {
+	TEMP_ADCPNP0, TEMP_ADCPNP1, TEMP_ADCPNP2
+};
+
+static const int mt8365_mux_values[MT8365_NUM_SENSORS] = { 0, 1, 2 };
+static const int mt8365_tc_offset[MT8365_NUM_CONTROLLER] = { 0 };
+
+static const int mt8365_vts_index[MT8365_NUM_SENSORS] = { VTS1, VTS2, VTS3 };
+
 /*
  * The MT8173 thermal controller has four banks. Each bank can read up to
  * four temperature sensors simultaneously. The MT8173 has a total of 5
@@ -463,6 +493,40 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
 	.version = MTK_THERMAL_V1,
 };
 
+/*
+ * The MT8365 thermal controller has one bank, which can read up to
+ * four temperature sensors simultaneously. The MT8365 has a total of 3
+ * temperature sensors.
+ *
+ * The thermal core only gets the maximum temperature of this one bank,
+ * so the bank concept wouldn't be necessary here. However, the SVS (Smart
+ * Voltage Scaling) unit makes its decisions based on the same bank
+ * data.
+ */
+static const struct mtk_thermal_data mt8365_thermal_data = {
+	.auxadc_channel = MT8365_TEMP_AUXADC_CHANNEL,
+	.num_banks = MT8365_NUM_BANKS,
+	.num_sensors = MT8365_NUM_SENSORS,
+	.vts_index = mt8365_vts_index,
+	.cali_val = MT8365_CALIBRATION,
+	.num_controller = MT8365_NUM_CONTROLLER,
+	.controller_offset = mt8365_tc_offset,
+	.need_switch_bank = false,
+	.bank_data = {
+		{
+			.num_sensors = MT8365_NUM_SENSORS,
+			.sensors = mt8365_bank_data
+		},
+	},
+	.msr = mt8365_msr,
+	.adcpnp = mt8365_adcpnp,
+	.sensor_mux_values = mt8365_mux_values,
+	.version = MTK_THERMAL_V1,
+	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON0,
+	.apmixed_buffer_ctl_mask = (u32) ~GENMASK(29, 28),
+	.apmixed_buffer_ctl_set = 0,
+};
+
 /*
  * The MT2712 thermal controller has one bank, which can read up to
  * four temperature sensors simultaneously. The MT2712 has a total of 4
@@ -964,6 +1028,10 @@ static const struct of_device_id mtk_thermal_of_match[] = {
 	{
 		.compatible = "mediatek,mt8183-thermal",
 		.data = (void *)&mt8183_thermal_data,
+	},
+	{
+		.compatible = "mediatek,mt8365-thermal",
+		.data = (void *)&mt8365_thermal_data,
 	}, {
 	},
 };
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
