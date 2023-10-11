Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A71BCD98EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMDZBWJj2yyMAv/YyKVQ8KEAr1thJ0u8eV+aFL/LCXI=; b=3JwMqzLcj/Dtm0gFKZzjnY33j8
	pTCyBEiDPSpO9PpWGsRJcdS/1s4w/rMcRFKe+TpLujOI1Qk+fHJnz4PKXyIkxXdOOkz8uEkEs+TSw
	vxvs2twdw59hNFOgMNm39y7p4BIQe8exVKGMWJnHtW3Uo0mO3Q/48ptRN5LeB9to4jsMn8BOhIXWW
	OdwT37cLZKT2fZzN/dARsTEN5pwh7MI5JTxL8jdliLG6O9cP5qDMoVZusTN/hixHnFNpO/vnYsn3o
	cSsrwb3DjRphEshvJcfuie5ODZ0I+WUlwWPRL5McNId4u20QMvFA+GKt25hMkkKzcaVEO+LlZjDls
	cxIMWM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqQ84-00Eg0P-0B;
	Wed, 11 Oct 2023 03:43:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqQ80-00EfzU-1a;
	Wed, 11 Oct 2023 03:43:23 +0000
X-UUID: 4cfacf6267e811ee86758d4a7c00f3a0-20231010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zMDZBWJj2yyMAv/YyKVQ8KEAr1thJ0u8eV+aFL/LCXI=;
	b=GY7+2uldjC7y0nXwcIJ9qe5WKGrG543ZvEEy9U0dgG73T5/jcy7pXh1XUjVG/Ndej28a243BFx0hxFoT21X45zzRJ0tryZLfqxJ8CpyKSQH8TL+v3zEJ2Io+g0FobCCm6IGC0p/tv+3DtaY6OLyHGU03hO05zVZCU/dbXcFJpkI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:11ac4c8f-d853-42f0-9869-0a03f964c8ce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:7924a6f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4cfacf6267e811ee86758d4a7c00f3a0-20231010
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1977783297; Tue, 10 Oct 2023 20:43:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Oct 2023 11:43:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Oct 2023 11:43:08 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>, Kevin Hilman
	<khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v1 2/3] soc: mediatek: svs: Add support for MT8186 SoC
Date: Wed, 11 Oct 2023 11:43:06 +0800
Message-ID: <20231011034307.24641-3-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231011034307.24641-1-chun-jen.tseng@mediatek.com>
References: <20231011034307.24641-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_204320_873575_600C23EF 
X-CRM114-Status: GOOD (  18.70  )
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

MT8186 svs has a number of banks which used as optimization of opp
voltage table for corresponding dvfs drivers.
MT8186 svs big core uses 2-line high bank and low bank to optimize the
voltage of opp table for higher and lower frequency respectively.

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 282 +++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 317c402e673a..0f7cfbe5630b 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1986,6 +1986,89 @@ static bool svs_mt8188_efuse_parsing(struct svs_platform *svsp)
 	return true;
 }
 
+static bool svs_mt8186_efuse_parsing(struct svs_platform *svsp)
+{
+	struct svs_bank *svsb;
+	u32 idx, i, golden_temp;
+	int ret;
+
+	for (i = 0; i < svsp->efuse_max; i++)
+		if (svsp->efuse[i])
+			dev_info(svsp->dev, "M_HW_RES%d: 0x%08x\n",
+				 i, svsp->efuse[i]);
+
+	if (!svsp->efuse[0]) {
+		dev_notice(svsp->dev, "svs_efuse[0] = 0x0?\n");
+		return false;
+	}
+
+	/* Svs efuse parsing */
+	for (idx = 0; idx < svsp->bank_max; idx++) {
+		svsb = &svsp->banks[idx];
+
+		switch (svsb->sw_id) {
+		case SVSB_CPU_BIG:
+			if (svsb->type == SVSB_HIGH) {
+				svsb->mdes = (svsp->efuse[2] >> 24) & GENMASK(7, 0);
+				svsb->bdes = (svsp->efuse[2] >> 16) & GENMASK(7, 0);
+				svsb->mtdes = svsp->efuse[2] & GENMASK(7, 0);
+				svsb->dcmdet = (svsp->efuse[13] >> 8) & GENMASK(7, 0);
+				svsb->dcbdet = svsp->efuse[13] & GENMASK(7, 0);
+			} else if (svsb->type == SVSB_LOW) {
+				svsb->mdes = (svsp->efuse[3] >> 24) & GENMASK(7, 0);
+				svsb->bdes = (svsp->efuse[3] >> 16) & GENMASK(7, 0);
+				svsb->mtdes = svsp->efuse[3] & GENMASK(7, 0);
+				svsb->dcmdet = (svsp->efuse[14] >> 24) & GENMASK(7, 0);
+				svsb->dcbdet = (svsp->efuse[14] >> 16) & GENMASK(7, 0);
+			}
+			break;
+		case SVSB_CPU_LITTLE:
+			svsb->mdes = (svsp->efuse[4] >> 24) & GENMASK(7, 0);
+			svsb->bdes = (svsp->efuse[4] >> 16) & GENMASK(7, 0);
+			svsb->mtdes = svsp->efuse[4] & GENMASK(7, 0);
+			svsb->dcmdet = (svsp->efuse[14] >> 8) & GENMASK(7, 0);
+			svsb->dcbdet = svsp->efuse[14] & GENMASK(7, 0);
+			break;
+		case SVSB_CCI:
+			svsb->mdes = (svsp->efuse[5] >> 24) & GENMASK(7, 0);
+			svsb->bdes = (svsp->efuse[5] >> 16) & GENMASK(7, 0);
+			svsb->mtdes = svsp->efuse[5] & GENMASK(7, 0);
+			svsb->dcmdet = (svsp->efuse[15] >> 24) & GENMASK(7, 0);
+			svsb->dcbdet = (svsp->efuse[15] >> 16) & GENMASK(7, 0);
+			break;
+		case SVSB_GPU:
+			svsb->mdes = (svsp->efuse[6] >> 24) & GENMASK(7, 0);
+			svsb->bdes = (svsp->efuse[6] >> 16) & GENMASK(7, 0);
+			svsb->mtdes = svsp->efuse[6] & GENMASK(7, 0);
+			svsb->dcmdet = (svsp->efuse[15] >> 8) & GENMASK(7, 0);
+			svsb->dcbdet = svsp->efuse[15] & GENMASK(7, 0);
+			break;
+		default:
+			dev_err(svsb->dev, "unknown sw_id: %u\n", svsb->sw_id);
+			return false;
+		}
+
+		svsb->vmax += svsb->dvt_fixed;
+	}
+
+	ret = svs_get_efuse_data(svsp, "t-calibration-data",
+				 &svsp->tefuse, &svsp->tefuse_max);
+	if (ret)
+		return false;
+
+	golden_temp = (svsp->tefuse[0] >> 24) & GENMASK(7, 0);
+	if (!golden_temp)
+		golden_temp = 50;
+
+	for (idx = 0; idx < svsp->bank_max; idx++) {
+		svsb = &svsp->banks[idx];
+		svsb->mts = 409;
+		svsb->bts = (((500 * golden_temp + 204650) / 1000) - 25) * 4;
+	}
+
+	return true;
+}
+
 static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
@@ -2252,6 +2335,50 @@ static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 	return 0;
 }
 
+static int svs_mt8186_platform_probe(struct svs_platform *svsp)
+{
+	struct device *dev;
+	struct svs_bank *svsb;
+	u32 idx;
+
+	svsp->rst = devm_reset_control_get_optional(svsp->dev, "svs_rst");
+	if (IS_ERR(svsp->rst))
+		return dev_err_probe(svsp->dev, PTR_ERR(svsp->rst),
+				     "cannot get svs reset control\n");
+
+	dev = svs_add_device_link(svsp, "lvts");
+	if (IS_ERR(dev))
+		return dev_err_probe(svsp->dev, PTR_ERR(dev),
+				     "failed to get lvts device\n");
+
+	for (idx = 0; idx < svsp->bank_max; idx++) {
+		svsb = &svsp->banks[idx];
+
+		switch (svsb->sw_id) {
+		case SVSB_CPU_LITTLE:
+		case SVSB_CPU_BIG:
+			svsb->opp_dev = get_cpu_device(svsb->cpu_id);
+			break;
+		case SVSB_CCI:
+			svsb->opp_dev = svs_add_device_link(svsp, "cci");
+			break;
+		case SVSB_GPU:
+			svsb->opp_dev = svs_add_device_link(svsp, "gpu");
+			break;
+		default:
+			dev_err(svsb->dev, "unknown sw_id: %u\n", svsb->sw_id);
+			return -EINVAL;
+		}
+
+		if (IS_ERR(svsb->opp_dev))
+			return dev_err_probe(svsp->dev, PTR_ERR(svsb->opp_dev),
+					     "failed to get OPP device for bank %d\n",
+					     idx);
+	}
+
+	return 0;
+}
+
 static int svs_mt8183_platform_probe(struct svs_platform *svsp)
 {
 	struct device *dev;
@@ -2461,6 +2588,149 @@ static struct svs_bank svs_mt8188_banks[] = {
 	},
 };
 
+static struct svs_bank svs_mt8186_banks[] = {
+	{
+		.sw_id			= SVSB_CPU_BIG,
+		.type			= SVSB_LOW,
+		.set_freq_pct		= svs_set_bank_freq_pct_v3,
+		.get_volts		= svs_get_bank_volts_v3,
+		.cpu_id			= 6,
+		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT,
+		.mode_support		= SVSB_MODE_INIT02,
+		.opp_count		= MAX_OPP_ENTRIES,
+		.freq_base		= 1670000000,
+		.turn_freq_base		= 1670000000,
+		.volt_step		= 6250,
+		.volt_base		= 400000,
+		.volt_od		= 4,
+		.vmax			= 0x59,
+		.vmin			= 0x20,
+		.age_config		= 0x1,
+		.dc_config		= 0x1,
+		.dvt_fixed		= 0x3,
+		.vco			= 0x10,
+		.chk_shift		= 0x87,
+		.core_sel		= 0x0fff0100,
+		.int_st			= BIT(0),
+		.ctl0			= 0x00540003,
+	},
+	{
+		.sw_id			= SVSB_CPU_BIG,
+		.type			= SVSB_HIGH,
+		.set_freq_pct		= svs_set_bank_freq_pct_v3,
+		.get_volts		= svs_get_bank_volts_v3,
+		.cpu_id			= 6,
+		.tzone_name		= "cpu_big0",
+		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT |
+					  SVSB_MON_VOLT_IGNORE,
+		.mode_support		= SVSB_MODE_INIT02 | SVSB_MODE_MON,
+		.opp_count		= MAX_OPP_ENTRIES,
+		.freq_base		= 2050000000,
+		.turn_freq_base		= 1670000000,
+		.volt_step		= 6250,
+		.volt_base		= 400000,
+		.volt_od		= 4,
+		.vmax			= 0x73,
+		.vmin			= 0x20,
+		.age_config		= 0x1,
+		.dc_config		= 0x1,
+		.dvt_fixed		= 0x6,
+		.vco			= 0x10,
+		.chk_shift		= 0x87,
+		.core_sel		= 0x0fff0101,
+		.int_st			= BIT(1),
+		.ctl0			= 0x00540003,
+		.tzone_htemp		= 85000,
+		.tzone_htemp_voffset	= 8,
+		.tzone_ltemp		= 25000,
+		.tzone_ltemp_voffset	= 8,
+	},
+	{
+		.sw_id			= SVSB_CPU_LITTLE,
+		.set_freq_pct		= svs_set_bank_freq_pct_v2,
+		.get_volts		= svs_get_bank_volts_v2,
+		.cpu_id			= 0,
+		.tzone_name		= "cpu_zone0",
+		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT |
+					  SVSB_MON_VOLT_IGNORE,
+		.mode_support		= SVSB_MODE_INIT02 | SVSB_MODE_MON,
+		.opp_count		= MAX_OPP_ENTRIES,
+		.freq_base		= 2000000000,
+		.volt_step		= 6250,
+		.volt_base		= 400000,
+		.volt_od		= 3,
+		.vmax			= 0x65,
+		.vmin			= 0x20,
+		.age_config		= 0x1,
+		.dc_config		= 0x1,
+		.dvt_fixed		= 0x6,
+		.vco			= 0x10,
+		.chk_shift		= 0x87,
+		.core_sel		= 0x0fff0102,
+		.int_st			= BIT(2),
+		.ctl0			= 0x3210000f,
+		.tzone_htemp		= 85000,
+		.tzone_htemp_voffset	= 8,
+		.tzone_ltemp		= 25000,
+		.tzone_ltemp_voffset	= 8,
+	},
+	{
+		.sw_id			= SVSB_CCI,
+		.set_freq_pct		= svs_set_bank_freq_pct_v2,
+		.get_volts		= svs_get_bank_volts_v2,
+		.tzone_name		= "cpu_zone0",
+		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT |
+					  SVSB_MON_VOLT_IGNORE,
+		.mode_support		= SVSB_MODE_INIT02 | SVSB_MODE_MON,
+		.opp_count		= MAX_OPP_ENTRIES,
+		.freq_base		= 1400000000,
+		.volt_step		= 6250,
+		.volt_base		= 400000,
+		.volt_od		= 3,
+		.vmax			= 0x65,
+		.vmin			= 0x20,
+		.age_config		= 0x1,
+		.dc_config		= 0x1,
+		.dvt_fixed		= 0x6,
+		.vco			= 0x10,
+		.chk_shift		= 0x87,
+		.core_sel		= 0x0fff0103,
+		.int_st			= BIT(3),
+		.ctl0			= 0x3210000f,
+		.tzone_htemp		= 85000,
+		.tzone_htemp_voffset	= 8,
+		.tzone_ltemp		= 25000,
+		.tzone_ltemp_voffset	= 8,
+	},
+	{
+		.sw_id			= SVSB_GPU,
+		.set_freq_pct		= svs_set_bank_freq_pct_v2,
+		.get_volts		= svs_get_bank_volts_v2,
+		.tzone_name		= "mfg",
+		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT |
+					  SVSB_MON_VOLT_IGNORE,
+		.mode_support		= SVSB_MODE_INIT02 | SVSB_MODE_MON,
+		.opp_count		= MAX_OPP_ENTRIES,
+		.freq_base		= 850000000,
+		.volt_step		= 6250,
+		.volt_base		= 400000,
+		.vmax			= 0x58,
+		.vmin			= 0x20,
+		.age_config		= 0x555555,
+		.dc_config		= 0x1,
+		.dvt_fixed		= 0x4,
+		.vco			= 0x10,
+		.chk_shift		= 0x87,
+		.core_sel		= 0x0fff0104,
+		.int_st			= BIT(4),
+		.ctl0			= 0x00100003,
+		.tzone_htemp		= 85000,
+		.tzone_htemp_voffset	= 8,
+		.tzone_ltemp		= 25000,
+		.tzone_ltemp_voffset	= 7,
+	},
+};
+
 static struct svs_bank svs_mt8183_banks[] = {
 	{
 		.sw_id			= SVSB_CPU_LITTLE,
@@ -2592,6 +2862,15 @@ static const struct svs_platform_data svs_mt8188_platform_data = {
 	.bank_max = ARRAY_SIZE(svs_mt8188_banks),
 };
 
+static const struct svs_platform_data svs_mt8186_platform_data = {
+	.name = "mt8186-svs",
+	.banks = svs_mt8186_banks,
+	.efuse_parsing = svs_mt8186_efuse_parsing,
+	.probe = svs_mt8186_platform_probe,
+	.regs = svs_regs_v2,
+	.bank_max = ARRAY_SIZE(svs_mt8186_banks),
+};
+
 static const struct svs_platform_data svs_mt8183_platform_data = {
 	.name = "mt8183-svs",
 	.banks = svs_mt8183_banks,
@@ -2611,6 +2890,9 @@ static const struct of_device_id svs_of_match[] = {
 	}, {
 		.compatible = "mediatek,mt8188-svs",
 		.data = &svs_mt8188_platform_data,
+	}, {
+		.compatible = "mediatek,mt8186-svs",
+		.data = &svs_mt8186_platform_data,
 	}, {
 		.compatible = "mediatek,mt8183-svs",
 		.data = &svs_mt8183_platform_data,
-- 
2.18.0


