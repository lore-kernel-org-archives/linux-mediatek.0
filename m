Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB8AC4332B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 09:56:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A707E20722
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 09:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lw3BPf7V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hDWyToAO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A707E20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfXO0q++Da13n3aEeV5bwYTswJCw2/TOhUj3BwrGaZ8=; b=Lw3BPf7Vx8KgiJ
	i5hcUmcVnCb2ygXDqm9CkpMrey2B2SzieTG7Zb+HXzUro7N7WDB+o9o1BiIlx1EwP3wkO5GO6jqUS
	7gEyozC7E6io5Nys0l1JdRRDCTRJuLxH8sUY7E+DNly0akTEKdD0ftfp3dn4uqSyqbieBssOzNfpL
	lJuhkPyfuUD6xvv/jfM4ZnEauQ/rp3GX69ZPgA/rdK0APUzYf0OGFC8PAHdbReBjj1mQA/pHNOwzN
	jK6A0zccnRuSiWqf25epz+dNqSR+3h9//FuscjRrJjP5F8KTZeMpkA8KuiqJwoL7iAdfdQve/PHAj
	hLsbfTKflYVrmlOu3J/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEruc-00036S-Rm; Thu, 19 Mar 2020 09:56:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jErtx-0002OG-Mn; Thu, 19 Mar 2020 09:55:47 +0000
X-UUID: a86a32e420554ac182796a11bc3f877b-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EgjJ4/ozN7amIJ2TNqfWpzKzRvybv6gnG75eeEAlrTA=; 
 b=hDWyToAOP+cLBPWrdgTVFUSXIVixELalE8FQAS8xj/Ov7TkSOWfr5eUc7g+QXlxiVxvXmgkRf5DCgN3+MdmOY/rJ699HqTcESMJNrpaBJWn9BasY9E0USy0iNfwAffc294xZ5cmQkU82Q029tv1FvkgUWzuwAI8jgWPt8R7dXfQ=;
X-UUID: a86a32e420554ac182796a11bc3f877b-20200319
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <henry.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 274401742; Thu, 19 Mar 2020 01:55:41 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 02:56:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 17:52:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 19 Mar 2020 17:52:33 +0800
From: Henry Yen <henry.yen@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] thermal: mediatek: add tsensor support for MT7622 SoC
Date: Thu, 19 Mar 2020 17:54:53 +0800
Message-ID: <1584611693-3553-3-git-send-email-henry.yen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1584611693-3553-1-git-send-email-henry.yen@mediatek.com>
References: <1584611693-3553-1-git-send-email-henry.yen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3BE1D2BE5077A5896A53555467BB7CAAAF41036944F071EE7B81B4AA7364ADF02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_025545_828633_EE25EE9C 
X-CRM114-Status: GOOD (  15.44  )
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

This patch adds the support for version 2 thermal system(e.g., MT7622 SoC).
The changes include the way of reading calibration data, the way of
converting temperature and hardware initialization specific for version 2
thermal system.

Signed-off-by: Henry Yen <henry.yen@mediatek.com>
---
 drivers/thermal/mtk_thermal.c | 100 +++++++++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 13e17c31ba3b..9e6807f6abd4 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -38,6 +38,7 @@
 #define TEMP_MONIDET0		0x014
 #define TEMP_MONIDET1		0x018
 #define TEMP_MSRCTL0		0x038
+#define TEMP_MSRCTL1		0x03c
 #define TEMP_AHBPOLL		0x040
 #define TEMP_AHBTO		0x044
 #define TEMP_ADCPNP0		0x048
@@ -133,6 +134,20 @@
 #define CALIB_BUF0_O_SLOPE_SIGN_V1(x)	(((x) >> 7) & 0x1)
 #define CALIB_BUF1_ID_V1(x)		(((x) >> 9) & 0x1)
 
+/*
+ * Layout of the fuses providing the calibration data
+ * These macros could be used for MT7622.
+ */
+#define CALIB_BUF0_ADC_OE_V2(x)		(((x) >> 22) & 0x3ff)
+#define CALIB_BUF0_ADC_GE_V2(x)		(((x) >> 12) & 0x3ff)
+#define CALIB_BUF0_DEGC_CALI_V2(x)	(((x) >> 6) & 0x3f)
+#define CALIB_BUF0_O_SLOPE_V2(x)	(((x) >> 0) & 0x3f)
+#define CALIB_BUF1_VTS_TS1_V2(x)	(((x) >> 23) & 0x1ff)
+#define CALIB_BUF1_VTS_TS2_V2(x)	(((x) >> 14) & 0x1ff)
+#define CALIB_BUF1_VTS_TSABB_V2(x)	(((x) >> 5) & 0x1ff)
+#define CALIB_BUF1_VALID_V2(x)		(((x) >> 4) & 0x1)
+#define CALIB_BUF1_O_SLOPE_SIGN_V2(x)	(((x) >> 3) & 0x1)
+
 enum {
 	VTS1,
 	VTS2,
@@ -266,8 +281,10 @@ struct mtk_thermal {
 
 	/* Calibration values */
 	s32 adc_ge;
+	s32 adc_oe;
 	s32 degc_cali;
 	s32 o_slope;
+	s32 o_slope_sign;
 	s32 vts[MAX_NUM_VTS];
 
 	const struct mtk_thermal_data *conf;
@@ -367,7 +384,9 @@ static const int mt7622_vts_index[MT7622_NUM_SENSORS] = { VTS1 };
 static const int mt7622_tc_offset[MT7622_NUM_CONTROLLER] = { 0x0, };
 
 static int mtk_thermal_extract_efuse_v1(struct mtk_thermal *mt, u32 *buf);
+static int mtk_thermal_extract_efuse_v2(struct mtk_thermal *mt, u32 *buf);
 static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw);
+static int raw_to_mcelsius_v2(struct mtk_thermal *mt, int sensno, s32 raw);
 
 /*
  * The MT8173 thermal controller has four banks. Each bank can read up to
@@ -503,8 +522,8 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
 	.adcpnp = mt7622_adcpnp,
 	.sensor_mux_values = mt7622_mux_values,
 	.version = MTK_THERMAL_V2,
-	.extract = mtk_thermal_extract_efuse_v1,
-	.convert = raw_to_mcelsius_v1,
+	.extract = mtk_thermal_extract_efuse_v2,
+	.convert = raw_to_mcelsius_v2,
 };
 
 /*
@@ -566,6 +585,36 @@ static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
 	return mt->degc_cali * 500 - tmp;
 }
 
+static int raw_to_mcelsius_v2(struct mtk_thermal *mt, int sensno, s32 raw)
+{
+	s32 format_1 = 0;
+	s32 format_2 = 0;
+	s32 g_oe = 1;
+	s32 g_gain = 1;
+	s32 g_x_roomt = 0;
+	s32 tmp = 0;
+
+	if (raw == 0)
+		return 0;
+
+	raw &= 0xfff;
+	g_gain = 10000 + (((mt->adc_ge - 512) * 10000) >> 12);
+	g_oe = mt->adc_oe - 512;
+	format_1 = mt->vts[VTS2] + 3105 - g_oe;
+	format_2 = (mt->degc_cali * 10) >> 1;
+	g_x_roomt = (((format_1 * 10000) >> 12) * 10000) / g_gain;
+
+	tmp = (((((raw - g_oe) * 10000) >> 12) * 10000) / g_gain) - g_x_roomt;
+	tmp = tmp * 10 * 100 / 11;
+
+	if (mt->o_slope_sign == 0)
+		tmp = tmp / (165 - mt->o_slope);
+	else
+		tmp = tmp / (165 + mt->o_slope);
+
+	return (format_2 - tmp) * 100;
+}
+
 /**
  * mtk_thermal_get_bank - get bank
  * @bank:	The bank
@@ -831,6 +880,23 @@ static int mtk_thermal_extract_efuse_v1(struct mtk_thermal *mt, u32 *buf)
 	return 0;
 }
 
+static int mtk_thermal_extract_efuse_v2(struct mtk_thermal *mt, u32 *buf)
+{
+	if (!CALIB_BUF1_VALID_V2(buf[1]))
+		return -EINVAL;
+
+	mt->adc_oe = CALIB_BUF0_ADC_OE_V2(buf[0]);
+	mt->adc_ge = CALIB_BUF0_ADC_GE_V2(buf[0]);
+	mt->degc_cali = CALIB_BUF0_DEGC_CALI_V2(buf[0]);
+	mt->o_slope = CALIB_BUF0_O_SLOPE_V2(buf[0]);
+	mt->vts[VTS1] = CALIB_BUF1_VTS_TS1_V2(buf[1]);
+	mt->vts[VTS2] = CALIB_BUF1_VTS_TS2_V2(buf[1]);
+	mt->vts[VTSABB] = CALIB_BUF1_VTS_TSABB_V2(buf[1]);
+	mt->o_slope_sign = CALIB_BUF1_O_SLOPE_SIGN_V2(buf[1]);
+
+	return 0;
+}
+
 static int mtk_thermal_get_calibration_data(struct device *dev,
 					    struct mtk_thermal *mt)
 {
@@ -900,6 +966,28 @@ static const struct of_device_id mtk_thermal_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
 
+static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
+{
+	int tmp;
+
+	tmp = readl(apmixed_base + APMIXED_SYS_TS_CON1);
+	tmp &= ~(0x37);
+	tmp |= 0x1;
+	writel(tmp, apmixed_base + APMIXED_SYS_TS_CON1);
+	udelay(200);
+}
+
+static void mtk_thermal_release_periodic_ts(struct mtk_thermal *mt,
+					    void __iomem *auxadc_base)
+{
+	int tmp;
+
+	writel(0x800, auxadc_base + AUXADC_CON1_SET_V);
+	writel(0x1, mt->thermal_base + TEMP_MONCTL0);
+	tmp = readl(mt->thermal_base + TEMP_MSRCTL1);
+	writel((tmp & (~0x10e)), mt->thermal_base + TEMP_MSRCTL1);
+}
+
 static int mtk_thermal_probe(struct platform_device *pdev)
 {
 	int ret, i, ctrl_id;
@@ -908,6 +996,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	struct resource *res;
 	u64 auxadc_phys_base, apmixed_phys_base;
 	struct thermal_zone_device *tzdev;
+	void __iomem *apmixed_base, *auxadc_base;
 
 	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
 	if (!mt)
@@ -942,6 +1031,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	auxadc_base = of_iomap(auxadc, 0);
 	auxadc_phys_base = of_get_phys_base(auxadc);
 
 	of_node_put(auxadc);
@@ -957,6 +1047,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	apmixed_base = of_iomap(apmixedsys, 0);
 	apmixed_phys_base = of_get_phys_base(apmixedsys);
 
 	of_node_put(apmixedsys);
@@ -982,6 +1073,11 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		goto err_disable_clk_auxadc;
 	}
 
+	if (mt->conf->version == MTK_THERMAL_V2) {
+		mtk_thermal_turn_on_buffer(apmixed_base);
+		mtk_thermal_release_periodic_ts(mt, auxadc_base);
+	}
+
 	for (ctrl_id = 0; ctrl_id < mt->conf->num_controller ; ctrl_id++)
 		for (i = 0; i < mt->conf->num_banks; i++)
 			mtk_thermal_init_bank(mt, i, apmixed_phys_base,
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
