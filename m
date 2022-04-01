Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D364C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S96AJH74u6tLDzLmq5I/NhUgpMy0Cv+AV6C1Bi0SNHA=; b=Pr9FPsTzGQJjLw
	Yl5r03xtam/jyI3M7wpXvdRCywmHMhgCkIuhrFWGRjCF+rqgpcjLkt+rvWEA2IA11ghC+5fYtTBW4
	+P50isMBMGs+rXMosNuch2AkC5APy2jfROxtQTgZuSnHWQyBv1magOOIX9b6/c5ghaUH5psNTH4TR
	s28mHEVO/24wDcMR6bDnHybSpRpkT9X1KVtUWtj5+/B4wWaBBppOijdAXfbLTlq4Fv480BNzOw1tE
	cCzbVjiW+VmzLhC0fgsrZ/lOWfdPHo5EgusgopKzN8sxPIl6tY2UDu6ZUOaftHXVHErz41nyhnBUQ
	zcfFKcVBIioDzWrrOCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naCOk-004tj7-Re; Fri, 01 Apr 2022 08:12:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naCOi-004tiR-3W; Fri, 01 Apr 2022 08:12:46 +0000
X-UUID: bbc78e541ca84da886a10285d43d518e-20220401
X-UUID: bbc78e541ca84da886a10285d43d518e-20220401
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 846999124; Fri, 01 Apr 2022 01:12:37 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 01:02:35 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 1 Apr 2022 16:02:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Apr 2022 16:02:26 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [RESEND v2 1/2] regulator: mt6366: Add support for MT6366 regulator
Date: Fri, 1 Apr 2022 16:02:11 +0800
Message-ID: <20220401080212.27383-2-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220401080212.27383-1-johnson.wang@mediatek.com>
References: <20220401080212.27383-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_011244_181665_9C8592FC 
X-CRM114-Status: GOOD (  16.92  )
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

The MT6366 is a regulator found on boards based on MediaTek MT8186 and
probably other SoCs. It is a so called pmic and connects as a slave to
SoC using SPI, wrapped inside the pmic-wrapper.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
---
 drivers/regulator/mt6358-regulator.c       | 213 ++++++++++++++++++++-
 include/linux/regulator/mt6358-regulator.h |  45 +++++
 2 files changed, 253 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index eb8027813b99..8a5ce990f1bf 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -130,6 +130,102 @@ struct mt6358_regulator_info {
 	.qi = BIT(15),							\
 }
 
+#define MT6366_BUCK(match, vreg, min, max, step,		\
+	volt_ranges, vosel_mask, _da_vsel_reg, _da_vsel_mask,	\
+	_modeset_reg, _modeset_shift)		\
+[MT6366_ID_##vreg] = {	\
+	.desc = {	\
+		.name = #vreg,	\
+		.of_match = of_match_ptr(match),	\
+		.ops = &mt6358_volt_range_ops,	\
+		.type = REGULATOR_VOLTAGE,	\
+		.id = MT6366_ID_##vreg,		\
+		.owner = THIS_MODULE,		\
+		.n_voltages = ((max) - (min)) / (step) + 1,	\
+		.linear_ranges = volt_ranges,		\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),	\
+		.vsel_reg = MT6358_BUCK_##vreg##_ELR0,	\
+		.vsel_mask = vosel_mask,	\
+		.enable_reg = MT6358_BUCK_##vreg##_CON0,	\
+		.enable_mask = BIT(0),	\
+		.of_map_mode = mt6358_map_mode,	\
+	},	\
+	.status_reg = MT6358_BUCK_##vreg##_DBG1,	\
+	.qi = BIT(0),	\
+	.da_vsel_reg = _da_vsel_reg,	\
+	.da_vsel_mask = _da_vsel_mask,	\
+	.modeset_reg = _modeset_reg,	\
+	.modeset_mask = BIT(_modeset_shift),	\
+}
+
+#define MT6366_LDO(match, vreg, ldo_volt_table,	\
+	ldo_index_table, enreg, enbit, vosel,	\
+	vosel_mask)	\
+[MT6366_ID_##vreg] = {	\
+	.desc = {	\
+		.name = #vreg,	\
+		.of_match = of_match_ptr(match),	\
+		.ops = &mt6358_volt_table_ops,	\
+		.type = REGULATOR_VOLTAGE,	\
+		.id = MT6366_ID_##vreg,	\
+		.owner = THIS_MODULE,	\
+		.n_voltages = ARRAY_SIZE(ldo_volt_table),	\
+		.volt_table = ldo_volt_table,	\
+		.vsel_reg = vosel,	\
+		.vsel_mask = vosel_mask,	\
+		.enable_reg = enreg,	\
+		.enable_mask = BIT(enbit),	\
+	},	\
+	.status_reg = MT6358_LDO_##vreg##_CON1,	\
+	.qi = BIT(15),	\
+	.index_table = ldo_index_table,	\
+	.n_table = ARRAY_SIZE(ldo_index_table),	\
+}
+
+#define MT6366_LDO1(match, vreg, min, max, step,	\
+	volt_ranges, _da_vsel_reg, _da_vsel_mask,	\
+	vosel, vosel_mask)	\
+[MT6366_ID_##vreg] = {	\
+	.desc = {	\
+		.name = #vreg,	\
+		.of_match = of_match_ptr(match),	\
+		.ops = &mt6358_volt_range_ops,	\
+		.type = REGULATOR_VOLTAGE,	\
+		.id = MT6366_ID_##vreg,	\
+		.owner = THIS_MODULE,	\
+		.n_voltages = ((max) - (min)) / (step) + 1,	\
+		.linear_ranges = volt_ranges,	\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),	\
+		.vsel_reg = vosel,	\
+		.vsel_mask = vosel_mask,	\
+		.enable_reg = MT6358_LDO_##vreg##_CON0,	\
+		.enable_mask = BIT(0),	\
+	},	\
+	.da_vsel_reg = _da_vsel_reg,	\
+	.da_vsel_mask = _da_vsel_mask,	\
+	.status_reg = MT6358_LDO_##vreg##_DBG1,	\
+	.qi = BIT(0),	\
+}
+
+#define MT6366_REG_FIXED(match, vreg,	\
+	enreg, enbit, volt)	\
+[MT6366_ID_##vreg] = {	\
+	.desc = {	\
+		.name = #vreg,	\
+		.of_match = of_match_ptr(match),	\
+		.ops = &mt6358_volt_fixed_ops,	\
+		.type = REGULATOR_VOLTAGE,	\
+		.id = MT6366_ID_##vreg,	\
+		.owner = THIS_MODULE,	\
+		.n_voltages = 1,	\
+		.enable_reg = enreg,	\
+		.enable_mask = BIT(enbit),	\
+		.min_uV = volt,	\
+	},	\
+	.status_reg = MT6358_LDO_##vreg##_CON1,	\
+	.qi = BIT(15),							\
+}
+
 static const struct linear_range buck_volt_range1[] = {
 	REGULATOR_LINEAR_RANGE(500000, 0, 0x7f, 6250),
 };
@@ -409,6 +505,9 @@ static struct mt6358_regulator_info mt6358_regulators[] = {
 	MT6358_BUCK("buck_vcore", VCORE, 500000, 1293750, 6250,
 		    buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_DBG0, 0x7f,
 		    MT6358_VCORE_VGPU_ANA_CON0, 1),
+	MT6358_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
+		    buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_SSHUB_ELR0, 0x7f,
+		    MT6358_VCORE_VGPU_ANA_CON0, 1),
 	MT6358_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
 		    buck_volt_range3, 0x3f, MT6358_BUCK_VPA_DBG0, 0x3f,
 		    MT6358_VPA_ANA_CON0, 3),
@@ -488,6 +587,10 @@ static struct mt6358_regulator_info mt6358_regulators[] = {
 	MT6358_LDO1("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750, 6250,
 		    buck_volt_range1, MT6358_LDO_VSRAM_OTHERS_DBG0, 0x7f00,
 		    MT6358_LDO_VSRAM_CON2, 0x7f),
+	MT6358_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
+		    1293750, 6250, buck_volt_range1,
+		    MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f,
+		    MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
 	MT6358_LDO1("ldo_vsram_gpu", VSRAM_GPU, 500000, 1293750, 6250,
 		    buck_volt_range1, MT6358_LDO_VSRAM_GPU_DBG0, 0x7f00,
 		    MT6358_LDO_VSRAM_CON3, 0x7f),
@@ -496,24 +599,124 @@ static struct mt6358_regulator_info mt6358_regulators[] = {
 		    MT6358_LDO_VSRAM_CON1, 0x7f),
 };
 
+/* The array is indexed by id(MT6366_ID_XXX) */
+static struct mt6358_regulator_info mt6366_regulators[] = {
+	MT6366_BUCK("buck_vdram1", VDRAM1, 500000, 2087500, 12500,
+		    buck_volt_range2, 0x7f, MT6358_BUCK_VDRAM1_DBG0, 0x7f,
+		    MT6358_VDRAM1_ANA_CON0, 8),
+	MT6366_BUCK("buck_vcore", VCORE, 500000, 1293750, 6250,
+		    buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_DBG0, 0x7f,
+		    MT6358_VCORE_VGPU_ANA_CON0, 1),
+	MT6366_BUCK("buck_vcore_sshub", VCORE_SSHUB, 500000, 1293750, 6250,
+		    buck_volt_range1, 0x7f, MT6358_BUCK_VCORE_SSHUB_ELR0, 0x7f,
+		    MT6358_VCORE_VGPU_ANA_CON0, 1),
+	MT6366_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
+		    buck_volt_range3, 0x3f, MT6358_BUCK_VPA_DBG0, 0x3f,
+		    MT6358_VPA_ANA_CON0, 3),
+	MT6366_BUCK("buck_vproc11", VPROC11, 500000, 1293750, 6250,
+		    buck_volt_range1, 0x7f, MT6358_BUCK_VPROC11_DBG0, 0x7f,
+		    MT6358_VPROC_ANA_CON0, 1),
+	MT6366_BUCK("buck_vproc12", VPROC12, 500000, 1293750, 6250,
+		    buck_volt_range1, 0x7f, MT6358_BUCK_VPROC12_DBG0, 0x7f,
+		    MT6358_VPROC_ANA_CON0, 2),
+	MT6366_BUCK("buck_vgpu", VGPU, 500000, 1293750, 6250,
+		    buck_volt_range1, 0x7f, MT6358_BUCK_VGPU_ELR0, 0x7f,
+		    MT6358_VCORE_VGPU_ANA_CON0, 2),
+	MT6366_BUCK("buck_vs2", VS2, 500000, 2087500, 12500,
+		    buck_volt_range2, 0x7f, MT6358_BUCK_VS2_DBG0, 0x7f,
+		    MT6358_VS2_ANA_CON0, 8),
+	MT6366_BUCK("buck_vmodem", VMODEM, 500000, 1293750, 6250,
+		    buck_volt_range1, 0x7f, MT6358_BUCK_VMODEM_DBG0, 0x7f,
+		    MT6358_VMODEM_ANA_CON0, 8),
+	MT6366_BUCK("buck_vs1", VS1, 1000000, 2587500, 12500,
+		    buck_volt_range4, 0x7f, MT6358_BUCK_VS1_DBG0, 0x7f,
+		    MT6358_VS1_ANA_CON0, 8),
+	MT6366_REG_FIXED("ldo_vrf12", VRF12,
+			 MT6358_LDO_VRF12_CON0, 0, 1200000),
+	MT6366_REG_FIXED("ldo_vio18", VIO18,
+			 MT6358_LDO_VIO18_CON0, 0, 1800000),
+	MT6366_REG_FIXED("ldo_vcn18", VCN18, MT6358_LDO_VCN18_CON0, 0, 1800000),
+	MT6366_REG_FIXED("ldo_vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("ldo_vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("ldo_vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 2200000),
+	MT6366_REG_FIXED("ldo_vaux18", VAUX18,
+			 MT6358_LDO_VAUX18_CON0, 0, 1800000),
+	MT6366_REG_FIXED("ldo_vbif28", VBIF28,
+			 MT6358_LDO_VBIF28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("ldo_vio28", VIO28, MT6358_LDO_VIO28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("ldo_va12", VA12, MT6358_LDO_VA12_CON0, 0, 1200000),
+	MT6366_REG_FIXED("ldo_vrf18", VRF18, MT6358_LDO_VRF18_CON0, 0, 1800000),
+	MT6366_REG_FIXED("ldo_vaud28", VAUD28,
+			 MT6358_LDO_VAUD28_CON0, 0, 2800000),
+	MT6366_LDO("ldo_vdram2", VDRAM2, vdram2_voltages, vdram2_idx,
+		   MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x10),
+	MT6366_LDO("ldo_vsim1", VSIM1, vsim_voltages, vsim_idx,
+		   MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00),
+	MT6366_LDO("ldo_vibr", VIBR, vibr_voltages, vibr_idx,
+		   MT6358_LDO_VIBR_CON0, 0, MT6358_VIBR_ANA_CON0, 0xf00),
+	MT6366_LDO("ldo_vusb", VUSB, vusb_voltages, vusb_idx,
+		   MT6358_LDO_VUSB_CON0_0, 0, MT6358_VUSB_ANA_CON0, 0x700),
+	MT6366_LDO("ldo_vefuse", VEFUSE, vefuse_voltages, vefuse_idx,
+		   MT6358_LDO_VEFUSE_CON0, 0, MT6358_VEFUSE_ANA_CON0, 0xf00),
+	MT6366_LDO("ldo_vmch", VMCH, vmch_vemc_voltages, vmch_vemc_idx,
+		   MT6358_LDO_VMCH_CON0, 0, MT6358_VMCH_ANA_CON0, 0x700),
+	MT6366_LDO("ldo_vemc", VEMC, vmch_vemc_voltages, vmch_vemc_idx,
+		   MT6358_LDO_VEMC_CON0, 0, MT6358_VEMC_ANA_CON0, 0x700),
+	MT6366_LDO("ldo_vcn33_bt", VCN33_BT, vcn33_bt_wifi_voltages,
+		   vcn33_bt_wifi_idx, MT6358_LDO_VCN33_CON0_0,
+		   0, MT6358_VCN33_ANA_CON0, 0x300),
+	MT6366_LDO("ldo_vcn33_wifi", VCN33_WIFI, vcn33_bt_wifi_voltages,
+		   vcn33_bt_wifi_idx, MT6358_LDO_VCN33_CON0_1,
+		   0, MT6358_VCN33_ANA_CON0, 0x300),
+	MT6366_LDO("ldo_vmc", VMC, vmc_voltages, vmc_idx,
+		   MT6358_LDO_VMC_CON0, 0, MT6358_VMC_ANA_CON0, 0xf00),
+	MT6366_LDO("ldo_vsim2", VSIM2, vsim_voltages, vsim_idx,
+		   MT6358_LDO_VSIM2_CON0, 0, MT6358_VSIM2_ANA_CON0, 0xf00),
+	MT6366_LDO1("ldo_vsram_proc11", VSRAM_PROC11, 500000, 1293750, 6250,
+		    buck_volt_range1, MT6358_LDO_VSRAM_PROC11_DBG0, 0x7f00,
+		    MT6358_LDO_VSRAM_CON0, 0x7f),
+	MT6366_LDO1("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750, 6250,
+		    buck_volt_range1, MT6358_LDO_VSRAM_OTHERS_DBG0, 0x7f00,
+		    MT6358_LDO_VSRAM_CON2, 0x7f),
+	MT6366_LDO1("ldo_vsram_others_sshub", VSRAM_OTHERS_SSHUB, 500000,
+		    1293750, 6250, buck_volt_range1,
+		    MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f,
+		    MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1, 0x7f),
+	MT6366_LDO1("ldo_vsram_gpu", VSRAM_GPU, 500000, 1293750, 6250,
+		    buck_volt_range1, MT6358_LDO_VSRAM_GPU_DBG0, 0x7f00,
+		    MT6358_LDO_VSRAM_CON3, 0x7f),
+	MT6366_LDO1("ldo_vsram_proc12", VSRAM_PROC12, 500000, 1293750, 6250,
+		    buck_volt_range1, MT6358_LDO_VSRAM_PROC12_DBG0, 0x7f00,
+		    MT6358_LDO_VSRAM_CON1, 0x7f),
+};
+
 static int mt6358_regulator_probe(struct platform_device *pdev)
 {
 	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
-	int i;
+	struct mt6358_regulator_info *mt6358_info;
+	int i, max_regulator;
+
+	if (mt6397->chip_id == MT6366_CHIP_ID) {
+		max_regulator = MT6366_MAX_REGULATOR;
+		mt6358_info = mt6366_regulators;
+	} else {
+		max_regulator = MT6358_MAX_REGULATOR;
+		mt6358_info = mt6358_regulators;
+	}
 
-	for (i = 0; i < MT6358_MAX_REGULATOR; i++) {
+	for (i = 0; i < max_regulator; i++) {
 		config.dev = &pdev->dev;
-		config.driver_data = &mt6358_regulators[i];
+		config.driver_data = &mt6358_info[i];
 		config.regmap = mt6397->regmap;
 
 		rdev = devm_regulator_register(&pdev->dev,
-					       &mt6358_regulators[i].desc,
+					       &mt6358_info[i].desc,
 					       &config);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev, "failed to register %s\n",
-				mt6358_regulators[i].desc.name);
+				mt6358_info[i].desc.name);
 			return PTR_ERR(rdev);
 		}
 	}
diff --git a/include/linux/regulator/mt6358-regulator.h b/include/linux/regulator/mt6358-regulator.h
index 1cc304946d09..bdcf83cd719e 100644
--- a/include/linux/regulator/mt6358-regulator.h
+++ b/include/linux/regulator/mt6358-regulator.h
@@ -48,9 +48,54 @@ enum {
 	MT6358_ID_VLDO28,
 	MT6358_ID_VAUD28,
 	MT6358_ID_VSIM2,
+	MT6358_ID_VCORE_SSHUB,
+	MT6358_ID_VSRAM_OTHERS_SSHUB,
 	MT6358_ID_RG_MAX,
 };
 
+enum {
+	MT6366_ID_VDRAM1 = 0,
+	MT6366_ID_VCORE,
+	MT6366_ID_VPA,
+	MT6366_ID_VPROC11,
+	MT6366_ID_VPROC12,
+	MT6366_ID_VGPU,
+	MT6366_ID_VS2,
+	MT6366_ID_VMODEM,
+	MT6366_ID_VS1,
+	MT6366_ID_VDRAM2,
+	MT6366_ID_VSIM1,
+	MT6366_ID_VIBR,
+	MT6366_ID_VRF12,
+	MT6366_ID_VIO18,
+	MT6366_ID_VUSB,
+	MT6366_ID_VCN18,
+	MT6366_ID_VFE28,
+	MT6366_ID_VSRAM_PROC11,
+	MT6366_ID_VCN28,
+	MT6366_ID_VSRAM_OTHERS,
+	MT6366_ID_VSRAM_GPU,
+	MT6366_ID_VXO22,
+	MT6366_ID_VEFUSE,
+	MT6366_ID_VAUX18,
+	MT6366_ID_VMCH,
+	MT6366_ID_VBIF28,
+	MT6366_ID_VSRAM_PROC12,
+	MT6366_ID_VEMC,
+	MT6366_ID_VIO28,
+	MT6366_ID_VA12,
+	MT6366_ID_VRF18,
+	MT6366_ID_VCN33_BT,
+	MT6366_ID_VCN33_WIFI,
+	MT6366_ID_VMC,
+	MT6366_ID_VAUD28,
+	MT6366_ID_VSIM2,
+	MT6366_ID_VCORE_SSHUB,
+	MT6366_ID_VSRAM_OTHERS_SSHUB,
+	MT6366_ID_RG_MAX,
+};
+
 #define MT6358_MAX_REGULATOR	MT6358_ID_RG_MAX
+#define MT6366_MAX_REGULATOR	MT6366_ID_RG_MAX
 
 #endif /* __LINUX_REGULATOR_MT6358_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
