Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07E7C54FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTKmtzreYp6eWtQ5S0t/6HBgaj9w8EWKw4RUjSZVyiY=; b=uosECcvgp9DP7Ijsen7MRX0J3L
	uL/XWY2ae04emR4YRKE5jPyGO7X21Pzwd0F8s1oTFyjfwjv5Vk2o1jIwTelZc+p9+x7obeyYvoX9l
	Y7++kg3rE3qnfwJlvjL5QhnfRo0wnDDdrjmdJCnIKAaa309SS6uG6apvLjV5lNt7zlNMxq5uofuhk
	pCH5R7fHSv5T5zorWzTkehFieO/4bE6S70TrMczpr0v5QF58HUDT7aGhWlXmJrdWtZWT9Th+ehcLy
	Hx/2PhH4upm4i5CssKvISKcUHkXS2k1/w2VLsvPLUNCXXZmCGJqW6+ovw0/7VGFbyx/wiN+l25YAi
	YE0wNcRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aUW-003DoO-1e;
	Thu, 16 Nov 2023 11:25:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aUS-003Dnk-2r;
	Thu, 16 Nov 2023 11:24:58 +0000
X-UUID: c39d8eb0847211ee86758d4a7c00f3a0-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NTKmtzreYp6eWtQ5S0t/6HBgaj9w8EWKw4RUjSZVyiY=;
	b=ib9QLwxxsK6R7NgJG4BDVTJcQtqQhK3R0EVNAx9laGx1raQUMBaoN9IF/05rNBm8aHijO5xbJletVTSo/ea7YvVDMPXEqnjHVjR81zgHQHw8QWUFiDALgvWSeZpF94+wletK4gDW1BF1Ar4F/cB4nsLjTH67C0m0mFpa0Mc7jDk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:843d8534-d6ec-43a1-b98e-4eb4a94c1819,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:de5aba72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c39d8eb0847211ee86758d4a7c00f3a0-20231116
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 330643488; Thu, 16 Nov 2023 04:24:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 Nov 2023 19:04:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 Nov 2023 19:04:50 +0800
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
Subject: [PATCH v2 2/3] soc: mediatek: svs: Add support for MT8186 SoC
Date: Thu, 16 Nov 2023 19:04:46 +0800
Message-ID: <20231116110447.3598-3-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231116110447.3598-1-chun-jen.tseng@mediatek.com>
References: <20231116110447.3598-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_032456_935061_E775AA41 
X-CRM114-Status: GOOD (  18.16  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


