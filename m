Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F07C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 06:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EoEkMJv8tAdCChiR9JbkrXj44xTq3DpaMPwwAaSe/Cg=; b=AmOdvIuLxW7f0A
	ZboMFr3GSZyeq1yI8xsiGhn6lTfuMDeekhVJ/T6/liPgoikTx5rC9Q8MncytQHoqJ6PjlUDZi4Tpg
	GJeg/C5eXSuYzJ4t2LY+hhNGFm4mfoFsz1kHVrbGWMV6AqVPCTeYsm8DkLn6T6KlhSiMUO/hGKtg+
	1Ava6wticay/cAKtZrq8iPNXHsd1dfAlJyPxZIskDRZlRLjyXzwNRSSIPypa6qF2R0Id5Ta0RBbkx
	r1ybVYwD6upktxOU+gRIH812wRyRSRXBI48L2HbiZePduUxi/aiJ2aI9ymbFwI/7HYZz0ZrJztkBe
	ymakGtH+jjNAnT/nSvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrZVz-005G3h-Qu; Thu, 19 May 2022 06:20:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrZVw-005G2q-Oh; Thu, 19 May 2022 06:20:02 +0000
X-UUID: 39a983dfd0324f69b8b1b3bec1a9d2c0-20220518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:13703328-ce9e-469a-82c7-864ebea6fd1f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:be72c1e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 39a983dfd0324f69b8b1b3bec1a9d2c0-20220518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1729973795; Wed, 18 May 2022 23:19:53 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 23:09:50 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 14:09:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 May 2022 14:09:48 +0800
From: Tim Chang <jia-wei.chang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu
 <roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>, Jia-Wei Chang
 <jia-wei.chang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 4/4] soc: mediatek: svs: add support for mt8195
Date: Thu, 19 May 2022 14:09:24 +0800
Message-ID: <20220519060924.13493-5-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220519060924.13493-1-jia-wei.chang@mediatek.com>
References: <20220519060924.13493-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_232000_839214_D82EF66E 
X-CRM114-Status: GOOD (  19.02  )
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

From: Jia-Wei Chang <jia-wei.chang@mediatek.com>

To support svs on MT8195, add corresponding bank information, platform
data, probe and parsing function.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 193 +++++++++++++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 656d0361ff7d..919226faee6d 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1680,6 +1680,92 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 	return 0;
 }
 
+static bool svs_mt8195_efuse_parsing(struct svs_platform *svsp)
+{
+	struct svs_bank *svsb;
+	struct nvmem_cell *cell;
+	u32 idx, i, ft_pgm, vmin, golden_temp;
+
+	for (i = 0; i < svsp->efuse_max; i++)
+		if (svsp->efuse[i])
+			dev_info(svsp->dev, "M_HW_RES%d: 0x%08x\n",
+				 i, svsp->efuse[i]);
+
+	if (!svsp->efuse[10]) {
+		dev_notice(svsp->dev, "svs_efuse[10] = 0x0?\n");
+		return false;
+	}
+
+	/* Svs efuse parsing */
+	ft_pgm = svsp->efuse[0] & GENMASK(7, 0);
+	vmin = (svsp->efuse[19] >> 4) & GENMASK(1, 0);
+
+	for (idx = 0; idx < svsp->bank_max; idx++) {
+		svsb = &svsp->banks[idx];
+
+		if (svsb->sw_id != SVSB_GPU)
+			return false;
+
+		if (vmin == 0x1)
+			svsb->vmin = 0x1e;
+
+		if (ft_pgm == 0)
+			svsb->volt_flags |= SVSB_INIT01_VOLT_IGNORE;
+
+		if (svsb->type == SVSB_LOW) {
+			svsb->mtdes = svsp->efuse[10] & GENMASK(7, 0);
+			svsb->bdes = (svsp->efuse[10] >> 16) & GENMASK(7, 0);
+			svsb->mdes = (svsp->efuse[10] >> 24) & GENMASK(7, 0);
+			svsb->dcbdet = (svsp->efuse[8]) & GENMASK(7, 0);
+			svsb->dcmdet = (svsp->efuse[8] >> 8) & GENMASK(7, 0);
+		} else if (svsb->type == SVSB_HIGH) {
+			svsb->mtdes = svsp->efuse[9] & GENMASK(7, 0);
+			svsb->bdes = (svsp->efuse[9] >> 16) & GENMASK(7, 0);
+			svsb->mdes = (svsp->efuse[9] >> 24) & GENMASK(7, 0);
+			svsb->dcbdet = (svsp->efuse[8]) & GENMASK(7, 0);
+			svsb->dcmdet = (svsp->efuse[8] >> 8) & GENMASK(7, 0);
+		}
+
+		svsb->vmax += svsb->dvt_fixed;
+	}
+
+	/* Thermal efuse parsing */
+	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
+	if (IS_ERR_OR_NULL(cell)) {
+		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n",
+			PTR_ERR(cell));
+		return false;
+	}
+
+	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
+	if (IS_ERR(svsp->tefuse)) {
+		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
+			PTR_ERR(svsp->tefuse));
+		nvmem_cell_put(cell);
+		return false;
+	}
+
+	svsp->tefuse_max /= sizeof(u32);
+	nvmem_cell_put(cell);
+
+	for (i = 0; i < svsp->tefuse_max; i++)
+		if (svsp->tefuse[i] != 0)
+			break;
+
+	if (i == svsp->tefuse_max)
+		golden_temp = 50; /* All thermal efuse data are 0 */
+	else
+		golden_temp = (svsp->tefuse[0] >> 24) & GENMASK(7, 0);
+
+	for (idx = 0; idx < svsp->bank_max; idx++) {
+		svsb = &svsp->banks[idx];
+		svsb->mts = 500;
+		svsb->bts = (((500 * golden_temp + 250460) / 1000) - 25) * 4;
+	}
+
+	return true;
+}
+
 static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
@@ -2141,6 +2227,39 @@ static struct device *svs_add_device_link(struct svs_platform *svsp,
 	return dev;
 }
 
+static int svs_mt8195_platform_probe(struct svs_platform *svsp)
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
+		if (svsb->type == SVSB_HIGH)
+			svsb->opp_dev = svs_add_device_link(svsp, "mali");
+		else if (svsb->type == SVSB_LOW)
+			svsb->opp_dev = svs_get_subsys_device(svsp, "mali");
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
 static int svs_mt8192_platform_probe(struct svs_platform *svsp)
 {
 	struct device *dev;
@@ -2257,6 +2376,67 @@ static int svs_mt8183_platform_probe(struct svs_platform *svsp)
 	return 0;
 }
 
+static struct svs_bank svs_mt8195_banks[] = {
+	{
+		.sw_id			= SVSB_GPU,
+		.type			= SVSB_LOW,
+		.set_freq_pct		= svs_set_bank_freq_pct_v3,
+		.get_volts		= svs_get_bank_volts_v3,
+		.tzone_name		= "gpu1",
+		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT,
+		.mode_support		= SVSB_MODE_INIT02,
+		.opp_count		= MAX_OPP_ENTRIES,
+		.freq_base		= 640000000,
+		.turn_freq_base		= 640000000,
+		.volt_step		= 6250,
+		.volt_base		= 400000,
+		.vmax			= 0x38,
+		.vmin			= 0x14,
+		.age_config		= 0x555555,
+		.dc_config		= 0x1,
+		.dvt_fixed		= 0x1,
+		.vco			= 0x18,
+		.chk_shift		= 0x87,
+		.core_sel		= 0x0fff0100,
+		.int_st			= BIT(0),
+		.ctl0			= 0x00540003,
+		.tzone_htemp		= 85000,
+		.tzone_htemp_voffset	= 0,
+		.tzone_ltemp		= 25000,
+		.tzone_ltemp_voffset	= 7,
+	},
+	{
+		.sw_id			= SVSB_GPU,
+		.type			= SVSB_HIGH,
+		.set_freq_pct		= svs_set_bank_freq_pct_v3,
+		.get_volts		= svs_get_bank_volts_v3,
+		.tzone_name		= "gpu1",
+		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT |
+					  SVSB_MON_VOLT_IGNORE,
+		.mode_support		= SVSB_MODE_INIT02 | SVSB_MODE_MON,
+		.opp_count		= MAX_OPP_ENTRIES,
+		.freq_base		= 880000000,
+		.turn_freq_base		= 640000000,
+		.vboot			= 0x38,
+		.volt_step		= 6250,
+		.volt_base		= 400000,
+		.vmax			= 0x38,
+		.vmin			= 0x14,
+		.age_config		= 0x555555,
+		.dc_config		= 0x1,
+		.dvt_fixed		= 0x6,
+		.vco			= 0x18,
+		.chk_shift		= 0x87,
+		.core_sel		= 0x0fff0101,
+		.int_st			= BIT(1),
+		.ctl0			= 0x00540003,
+		.tzone_htemp		= 85000,
+		.tzone_htemp_voffset	= 0,
+		.tzone_ltemp		= 25000,
+		.tzone_ltemp_voffset	= 7,
+	},
+};
+
 static struct svs_bank svs_mt8192_banks[] = {
 	{
 		.sw_id			= SVSB_GPU,
@@ -2559,6 +2739,16 @@ static struct svs_bank svs_mt8183_banks[] = {
 	},
 };
 
+static const struct svs_platform_data svs_mt8195_platform_data = {
+	.name = "mt8195-svs",
+	.banks = svs_mt8195_banks,
+	.efuse_parsing = svs_mt8195_efuse_parsing,
+	.probe = svs_mt8195_platform_probe,
+	.irqflags = IRQF_TRIGGER_HIGH,
+	.regs = svs_regs_v2,
+	.bank_max = ARRAY_SIZE(svs_mt8195_banks),
+};
+
 static const struct svs_platform_data svs_mt8192_platform_data = {
 	.name = "mt8192-svs",
 	.banks = svs_mt8192_banks,
@@ -2591,6 +2781,9 @@ static const struct svs_platform_data svs_mt8183_platform_data = {
 
 static const struct of_device_id svs_of_match[] = {
 	{
+		.compatible = "mediatek,mt8195-svs",
+		.data = &svs_mt8195_platform_data,
+	}, {
 		.compatible = "mediatek,mt8192-svs",
 		.data = &svs_mt8192_platform_data,
 	}, {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
