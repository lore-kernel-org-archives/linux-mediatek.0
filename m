Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D7DC43332
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 09:56:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7800620724
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 09:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eKWttkoa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oDu5HOAe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7800620724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0E7/kTpyAxnnvMlFiTRNdxPbxrQggiAtoZ2jKrWu7fQ=; b=eKWttkoavs2RtH
	eEjwu4cmnaF2UzJ7SWylFM9+X8xLIfP2hFFcFQYMmFQgc6foGDiFkBnYgNhl9+X98QspX7UneAQaI
	5GJOHdN+SpQsk8/Q0x0QyB8t9u7GmZshNcLM4+2Yks3PiS0myjkDW0T3BoTanIZko8A2Ns+gKbIfd
	WU42UPauaSV7HYdN+t9ZzIPD6WjYZjzPcNye+MfkiUnxwAoKFcA8GTTG1Ac30XQo7vvEM/7deBPzb
	FvVpsSI9FWilbtAtngc0Enggyj1zRta9iwOTeujqegO7b/W9gps2bzbMqScspMjN+OL2ose3WI7B/
	ZAPYm/g1vglHtfMvaqHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEruF-0002j4-MG; Thu, 19 Mar 2020 09:56:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jErtt-0002Ll-32; Thu, 19 Mar 2020 09:55:42 +0000
X-UUID: f72db802757a41cb94733655e389e2a2-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zswPWHVhfJ7nFxwbL6xqlaMcZR4nTaQJcaTzmyhFPTc=; 
 b=oDu5HOAerXAicaIbeHfR2aPCrO5CalBDSdIwGBGs+dq6PbbQfQtS4IO7VVW7r9lAOGRJ9Ur+MWReom8m8M0tVn5QKYLC/Iiz+trpXHTHLSyqhd1P72gODT7CTf+0Gwlbt0JlBwY1nMs9WAjznU68DuGQ55Pw/PTBpPNi2KA5Qto=;
X-UUID: f72db802757a41cb94733655e389e2a2-20200319
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henry.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2020755195; Thu, 19 Mar 2020 01:55:39 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 02:56:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 17:54:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 19 Mar 2020 17:52:32 +0800
From: Henry Yen <henry.yen@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] thermal: mediatek: prepare to add support for other
 platforms
Date: Thu, 19 Mar 2020 17:54:52 +0800
Message-ID: <1584611693-3553-2-git-send-email-henry.yen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1584611693-3553-1-git-send-email-henry.yen@mediatek.com>
References: <1584611693-3553-1-git-send-email-henry.yen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_025541_184184_D88098B2 
X-CRM114-Status: GOOD (  15.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Steven Liu <steven.liu@mediatek.com>, Henry Yen <henry.yen@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Michael
 Kao <michael.kao@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It is known that Mediatek owns two thermal system, which differs
in the way of reading calibration data and converting temperature.
MT8173, MT2701, MT2712 and MT8183 belongs to version 1 thermal
system, and MT7622 belongs to version 2 thermal system.
For platform compatibility, we add two sensor ops (extract and
convert) to the thermal data structure. Each platform will register
the sensor ops to the proper function implementation according to
its version.

Signed-off-by: Henry Yen <henry.yen@mediatek.com>
---
 drivers/thermal/mtk_thermal.c | 148 +++++++++++++++++++++-------------
 1 file changed, 93 insertions(+), 55 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 76e30603d4d5..13e17c31ba3b 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -120,18 +120,18 @@
  * MT2701 has 3 sensors and needs 3 VTS calibration data.
  * MT2712 has 4 sensors and needs 4 VTS calibration data.
  */
-#define CALIB_BUF0_VALID		BIT(0)
-#define CALIB_BUF1_ADC_GE(x)		(((x) >> 22) & 0x3ff)
-#define CALIB_BUF0_VTS_TS1(x)		(((x) >> 17) & 0x1ff)
-#define CALIB_BUF0_VTS_TS2(x)		(((x) >> 8) & 0x1ff)
-#define CALIB_BUF1_VTS_TS3(x)		(((x) >> 0) & 0x1ff)
-#define CALIB_BUF2_VTS_TS4(x)		(((x) >> 23) & 0x1ff)
-#define CALIB_BUF2_VTS_TS5(x)		(((x) >> 5) & 0x1ff)
-#define CALIB_BUF2_VTS_TSABB(x)		(((x) >> 14) & 0x1ff)
-#define CALIB_BUF0_DEGC_CALI(x)		(((x) >> 1) & 0x3f)
-#define CALIB_BUF0_O_SLOPE(x)		(((x) >> 26) & 0x3f)
-#define CALIB_BUF0_O_SLOPE_SIGN(x)	(((x) >> 7) & 0x1)
-#define CALIB_BUF1_ID(x)		(((x) >> 9) & 0x1)
+#define CALIB_BUF0_VALID_V1		BIT(0)
+#define CALIB_BUF1_ADC_GE_V1(x)		(((x) >> 22) & 0x3ff)
+#define CALIB_BUF0_VTS_TS1_V1(x)	(((x) >> 17) & 0x1ff)
+#define CALIB_BUF0_VTS_TS2_V1(x)	(((x) >> 8) & 0x1ff)
+#define CALIB_BUF1_VTS_TS3_V1(x)	(((x) >> 0) & 0x1ff)
+#define CALIB_BUF2_VTS_TS4_V1(x)	(((x) >> 23) & 0x1ff)
+#define CALIB_BUF2_VTS_TS5_V1(x)	(((x) >> 5) & 0x1ff)
+#define CALIB_BUF2_VTS_TSABB_V1(x)	(((x) >> 14) & 0x1ff)
+#define CALIB_BUF0_DEGC_CALI_V1(x)	(((x) >> 1) & 0x3f)
+#define CALIB_BUF0_O_SLOPE_V1(x)	(((x) >> 26) & 0x3f)
+#define CALIB_BUF0_O_SLOPE_SIGN_V1(x)	(((x) >> 7) & 0x1)
+#define CALIB_BUF1_ID_V1(x)		(((x) >> 9) & 0x1)
 
 enum {
 	VTS1,
@@ -143,6 +143,11 @@ enum {
 	MAX_NUM_VTS,
 };
 
+enum mtk_thermal_version {
+	MTK_THERMAL_V1 = 1,
+	MTK_THERMAL_V2,
+};
+
 /* MT2701 thermal sensors */
 #define MT2701_TS1	0
 #define MT2701_TS2	1
@@ -245,6 +250,9 @@ struct mtk_thermal_data {
 	const int *controller_offset;
 	bool need_switch_bank;
 	struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
+	enum mtk_thermal_version version;
+	int (*extract)(struct mtk_thermal *mt, u32 *buf);
+	int (*convert)(struct mtk_thermal *mt, int sensno, s32 raw);
 };
 
 struct mtk_thermal {
@@ -358,6 +366,9 @@ static const int mt7622_mux_values[MT7622_NUM_SENSORS] = { 0, };
 static const int mt7622_vts_index[MT7622_NUM_SENSORS] = { VTS1 };
 static const int mt7622_tc_offset[MT7622_NUM_CONTROLLER] = { 0x0, };
 
+static int mtk_thermal_extract_efuse_v1(struct mtk_thermal *mt, u32 *buf);
+static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw);
+
 /*
  * The MT8173 thermal controller has four banks. Each bank can read up to
  * four temperature sensors simultaneously. The MT8173 has a total of 5
@@ -398,6 +409,9 @@ static const struct mtk_thermal_data mt8173_thermal_data = {
 	.msr = mt8173_msr,
 	.adcpnp = mt8173_adcpnp,
 	.sensor_mux_values = mt8173_mux_values,
+	.version = MTK_THERMAL_V1,
+	.extract = mtk_thermal_extract_efuse_v1,
+	.convert = raw_to_mcelsius_v1,
 };
 
 /*
@@ -428,6 +442,9 @@ static const struct mtk_thermal_data mt2701_thermal_data = {
 	.msr = mt2701_msr,
 	.adcpnp = mt2701_adcpnp,
 	.sensor_mux_values = mt2701_mux_values,
+	.version = MTK_THERMAL_V1,
+	.extract = mtk_thermal_extract_efuse_v1,
+	.convert = raw_to_mcelsius_v1,
 };
 
 /*
@@ -458,6 +475,9 @@ static const struct mtk_thermal_data mt2712_thermal_data = {
 	.msr = mt2712_msr,
 	.adcpnp = mt2712_adcpnp,
 	.sensor_mux_values = mt2712_mux_values,
+	.version = MTK_THERMAL_V1,
+	.extract = mtk_thermal_extract_efuse_v1,
+	.convert = raw_to_mcelsius_v1,
 };
 
 /*
@@ -482,6 +502,9 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
 	.msr = mt7622_msr,
 	.adcpnp = mt7622_adcpnp,
 	.sensor_mux_values = mt7622_mux_values,
+	.version = MTK_THERMAL_V2,
+	.extract = mtk_thermal_extract_efuse_v1,
+	.convert = raw_to_mcelsius_v1,
 };
 
 /*
@@ -514,6 +537,9 @@ static const struct mtk_thermal_data mt8183_thermal_data = {
 	.msr = mt8183_msr,
 	.adcpnp = mt8183_adcpnp,
 	.sensor_mux_values = mt8183_mux_values,
+	.version = MTK_THERMAL_V1,
+	.extract = mtk_thermal_extract_efuse_v1,
+	.convert = raw_to_mcelsius_v1,
 };
 
 /**
@@ -525,7 +551,7 @@ static const struct mtk_thermal_data mt8183_thermal_data = {
  * This converts the raw ADC value to mcelsius using the SoC specific
  * calibration constants
  */
-static int raw_to_mcelsius(struct mtk_thermal *mt, int sensno, s32 raw)
+static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
 {
 	s32 tmp;
 
@@ -594,9 +620,9 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 		raw = readl(mt->thermal_base +
 			    conf->msr[conf->bank_data[bank->id].sensors[i]]);
 
-		temp = raw_to_mcelsius(mt,
-				       conf->bank_data[bank->id].sensors[i],
-				       raw);
+		temp = conf->convert(mt,
+				     conf->bank_data[bank->id].sensors[i],
+				     raw);
 
 		/*
 		 * The first read of a sensor often contains very high bogus
@@ -698,9 +724,11 @@ static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
 	writel(auxadc_phys_base + AUXADC_CON1_CLR_V,
 	       controller_base + TEMP_ADCMUXADDR);
 
-	/* AHB address for pnp sensor mux selection */
-	writel(apmixed_phys_base + APMIXED_SYS_TS_CON1,
-	       controller_base + TEMP_PNPMUXADDR);
+	if (mt->conf->version == MTK_THERMAL_V1) {
+		/* AHB address for pnp sensor mux selection */
+		writel(apmixed_phys_base + APMIXED_SYS_TS_CON1,
+		       controller_base + TEMP_PNPMUXADDR);
+	}
 
 	/* AHB value for auxadc enable */
 	writel(BIT(conf->auxadc_channel), controller_base + TEMP_ADCEN);
@@ -758,6 +786,51 @@ static u64 of_get_phys_base(struct device_node *np)
 	return of_translate_address(np, regaddr_p);
 }
 
+static int mtk_thermal_extract_efuse_v1(struct mtk_thermal *mt, u32 *buf)
+{
+	int i;
+
+	if (!(buf[0] & CALIB_BUF0_VALID_V1))
+		return -EINVAL;
+
+	mt->adc_ge = CALIB_BUF1_ADC_GE_V1(buf[1]);
+
+	for (i = 0; i < mt->conf->num_sensors; i++) {
+		switch (mt->conf->vts_index[i]) {
+		case VTS1:
+			mt->vts[VTS1] = CALIB_BUF0_VTS_TS1_V1(buf[0]);
+			break;
+		case VTS2:
+			mt->vts[VTS2] = CALIB_BUF0_VTS_TS2_V1(buf[0]);
+			break;
+		case VTS3:
+			mt->vts[VTS3] = CALIB_BUF1_VTS_TS3_V1(buf[1]);
+			break;
+		case VTS4:
+			mt->vts[VTS4] = CALIB_BUF2_VTS_TS4_V1(buf[2]);
+			break;
+		case VTS5:
+			mt->vts[VTS5] = CALIB_BUF2_VTS_TS5_V1(buf[2]);
+			break;
+		case VTSABB:
+			mt->vts[VTSABB] =
+				CALIB_BUF2_VTS_TSABB_V1(buf[2]);
+			break;
+		default:
+			break;
+		}
+	}
+
+	mt->degc_cali = CALIB_BUF0_DEGC_CALI_V1(buf[0]);
+	if (CALIB_BUF1_ID_V1(buf[1]) &
+	    CALIB_BUF0_O_SLOPE_SIGN_V1(buf[0]))
+		mt->o_slope = -CALIB_BUF0_O_SLOPE_V1(buf[0]);
+	else
+		mt->o_slope = CALIB_BUF0_O_SLOPE_V1(buf[0]);
+
+	return 0;
+}
+
 static int mtk_thermal_get_calibration_data(struct device *dev,
 					    struct mtk_thermal *mt)
 {
@@ -793,43 +866,8 @@ static int mtk_thermal_get_calibration_data(struct device *dev,
 		goto out;
 	}
 
-	if (buf[0] & CALIB_BUF0_VALID) {
-		mt->adc_ge = CALIB_BUF1_ADC_GE(buf[1]);
-
-		for (i = 0; i < mt->conf->num_sensors; i++) {
-			switch (mt->conf->vts_index[i]) {
-			case VTS1:
-				mt->vts[VTS1] = CALIB_BUF0_VTS_TS1(buf[0]);
-				break;
-			case VTS2:
-				mt->vts[VTS2] = CALIB_BUF0_VTS_TS2(buf[0]);
-				break;
-			case VTS3:
-				mt->vts[VTS3] = CALIB_BUF1_VTS_TS3(buf[1]);
-				break;
-			case VTS4:
-				mt->vts[VTS4] = CALIB_BUF2_VTS_TS4(buf[2]);
-				break;
-			case VTS5:
-				mt->vts[VTS5] = CALIB_BUF2_VTS_TS5(buf[2]);
-				break;
-			case VTSABB:
-				mt->vts[VTSABB] = CALIB_BUF2_VTS_TSABB(buf[2]);
-				break;
-			default:
-				break;
-			}
-		}
-
-		mt->degc_cali = CALIB_BUF0_DEGC_CALI(buf[0]);
-		if (CALIB_BUF1_ID(buf[1]) &
-		    CALIB_BUF0_O_SLOPE_SIGN(buf[0]))
-			mt->o_slope = -CALIB_BUF0_O_SLOPE(buf[0]);
-		else
-			mt->o_slope = CALIB_BUF0_O_SLOPE(buf[0]);
-	} else {
+	if (mt->conf->extract(mt, buf))
 		dev_info(dev, "Device not calibrated, using default calibration values\n");
-	}
 
 out:
 	kfree(buf);
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
