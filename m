Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FC9CD54B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wGYSKJ+LCREMj4ZZPD+f0Pekeht6gsRJzvaQhiRmgU=; b=vvYzviYhXzzf3VjS38xGWYJ6B9
	f79ttMA+6HF+pfQDEmp1r0rb5zNBVbnljhqiRMuRRnaIgkjWgv54d1f1KXk8neIiHg4fYQDqmMq+M
	NhZiVSgUf9VUemijBj6tzuhPT6Gcp9e+f2sRXLG+945/aJDcBS4AzGDO3qVo0MPVLYhsJNGrN/zok
	dF1IDOEIEQVTOnmg4accYxtFafxZxgbIQSZbV4OfZ2qKkG17knpLPO9t13NwD3vwFkPcTinflqanp
	i+rOUDP8FttrOLurxPTbiP1cuVtg9jbBuej8pa9Wm3i3CiMmQVW8P+Y0OyiBFhbJF02f2QpHPDCeE
	spJio+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYHi-0005s6-2v;
	Tue, 19 Sep 2023 10:48:50 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYGp-0004qx-2q
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 10:47:59 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-578aca5a6bbso610839a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 03:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695120473; x=1695725273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wGYSKJ+LCREMj4ZZPD+f0Pekeht6gsRJzvaQhiRmgU=;
        b=WiGgsQARMfTO1dMt2+p8J2ltsOfkEBS4lkbL4EQAnWw+5IaWaj8Biyrd2ftMyoyNTw
         V9vbMYarxHXX5EmohOPW+jv++1ZTgCVYT+iXW1PBONvMonVk8x1zWbbQi/TGLmlewRIP
         kgOZ3iR5LHD1JtEQYO0CQ+zX7LMAkp8kU2pjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695120473; x=1695725273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wGYSKJ+LCREMj4ZZPD+f0Pekeht6gsRJzvaQhiRmgU=;
        b=SAxyc2Jgm8PMMTW4PKu3fHUpPIph0LYIy41KiI8/LDeCHWaS1kWuRS0w2tR1GNYQrH
         nypR59w9qht3kabt3YfuC0dw1kAbgOZXEPss3pL/cmHJuSxet5NY0/HIcDnBTa/rJh62
         a9W9f/nOaiuS8f3ODeXj1w18XMCZnA5FPF9GePN9LQmWgfLhvjEgc8EuqnxvxaUbh6Z4
         FAP4W+Xq6N2h0NNQXXYXtTQs3EHO+N5jmhD4efIDdWcHU6RIF68PBDQavVMdCHyojaZ0
         1dTwAonf0/ynJKsLLNM/Wm3jWzou2qilfRnmt+++ZndpVHfWX+gQQTcW+vNnaFWXy92U
         zOHw==
X-Gm-Message-State: AOJu0YyyTsmGgoeuB/aPsbNq0NbVFYjpU/TAZ45dyGJBV66vTFPmMu6v
	ZNYmoXl507Pr2GvVuJlNhduVNg==
X-Google-Smtp-Source: AGHT+IEmKxPbrVXvTZMke/E8nxAuI6FZj0Gbgh2pZBbB90/74RtIhcOTn7X3KsvzvN92RJtv02gvbg==
X-Received: by 2002:a05:6a21:6d88:b0:15b:2125:890f with SMTP id wl8-20020a056a216d8800b0015b2125890fmr7209933pzb.37.1695120472905;
        Tue, 19 Sep 2023 03:47:52 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:40a:900d:e731:5a43])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902d48a00b001bc445e249asm6719578plg.124.2023.09.19.03.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 03:47:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 11/12] regulator: mt6358: Add supply names for MT6366 regulators
Date: Tue, 19 Sep 2023 18:43:54 +0800
Message-ID: <20230919104357.3971512-12-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
In-Reply-To: <20230919104357.3971512-1-wenst@chromium.org>
References: <20230919104357.3971512-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_034755_931760_3A92F6D3 
X-CRM114-Status: GOOD (  12.75  )
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

The DT bindings for MT6366 regulator defines the supply names for the
PMIC.

Add support for them by adding .supply_name field settings for each
regulator. The buck regulators each have their own supply whose name
can be derived from the regulator name. The LDOs have shared supplies.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v2: none

Changes since v1:
- Replaced underscores in supply names with hyphens
- Reflowed a couple macros for readability

 drivers/regulator/mt6358-regulator.c | 77 +++++++++++++---------------
 1 file changed, 37 insertions(+), 40 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 4e7891e514b6..58ee93aa2a34 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -140,6 +140,7 @@ struct mt6358_regulator_info {
 [MT6366_ID_##vreg] = {	\
 	.desc = {	\
 		.name = #vreg,	\
+		.supply_name = "vsys-" match,		\
 		.of_match = of_match_ptr(match),	\
 		.ops = &mt6358_volt_range_ops,	\
 		.type = REGULATOR_VOLTAGE,	\
@@ -162,10 +163,11 @@ struct mt6358_regulator_info {
 	.modeset_mask = BIT(_modeset_shift),	\
 }
 
-#define MT6366_LDO(match, vreg, volt_ranges, enreg, enbit, vosel, vosel_mask) \
+#define MT6366_LDO(match, vreg, volt_ranges, supply, enreg, enbit, vosel, vosel_mask) \
 [MT6366_ID_##vreg] = {	\
 	.desc = {	\
 		.name = #vreg,	\
+		.supply_name = supply,		\
 		.of_match = of_match_ptr(match),	\
 		.ops = &mt6358_volt_table_ops,	\
 		.type = REGULATOR_VOLTAGE,	\
@@ -186,12 +188,12 @@ struct mt6358_regulator_info {
 	.qi = BIT(15),	\
 }
 
-#define MT6366_LDO1(match, vreg, min, max, step,	\
-	_da_vsel_reg, _da_vsel_mask,	\
-	vosel, vosel_mask)	\
+#define MT6366_LDO1(match, vreg, supply, min, max, step,	\
+		    _da_vsel_reg, _da_vsel_mask, vosel, vosel_mask)	\
 [MT6366_ID_##vreg] = {	\
 	.desc = {	\
 		.name = #vreg,	\
+		.supply_name = supply,		\
 		.of_match = of_match_ptr(match),	\
 		.ops = &mt6358_volt_range_ops,	\
 		.type = REGULATOR_VOLTAGE,	\
@@ -211,11 +213,11 @@ struct mt6358_regulator_info {
 	.qi = BIT(0),	\
 }
 
-#define MT6366_REG_FIXED(match, vreg,	\
-	enreg, enbit, volt)	\
+#define MT6366_REG_FIXED(match, vreg, supply, enreg, enbit, volt)	\
 [MT6366_ID_##vreg] = {	\
 	.desc = {	\
 		.name = #vreg,	\
+		.supply_name = supply,		\
 		.of_match = of_match_ptr(match),	\
 		.ops = &mt6358_volt_fixed_ops,	\
 		.type = REGULATOR_VOLTAGE,	\
@@ -584,57 +586,52 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 		    0x7f, MT6358_BUCK_VMODEM_DBG0, 0x7f, MT6358_VMODEM_ANA_CON0, 8),
 	MT6366_BUCK("vs1", VS1, 1000000, 2587500, 12500,
 		    0x7f, MT6358_BUCK_VS1_DBG0, 0x7f, MT6358_VS1_ANA_CON0, 8),
-	MT6366_REG_FIXED("vrf12", VRF12,
-			 MT6358_LDO_VRF12_CON0, 0, 1200000),
-	MT6366_REG_FIXED("vio18", VIO18,
-			 MT6358_LDO_VIO18_CON0, 0, 1800000),
-	MT6366_REG_FIXED("vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 2800000),
-	MT6366_REG_FIXED("vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 2800000),
-	MT6366_REG_FIXED("vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 2200000),
-	MT6366_REG_FIXED("vaux18", VAUX18,
-			 MT6358_LDO_VAUX18_CON0, 0, 1800000),
-	MT6366_REG_FIXED("vbif28", VBIF28,
-			 MT6358_LDO_VBIF28_CON0, 0, 2800000),
-	MT6366_REG_FIXED("vio28", VIO28, MT6358_LDO_VIO28_CON0, 0, 2800000),
-	MT6366_REG_FIXED("va12", VA12, MT6358_LDO_VA12_CON0, 0, 1200000),
-	MT6366_REG_FIXED("vrf18", VRF18, MT6358_LDO_VRF18_CON0, 0, 1800000),
-	MT6366_REG_FIXED("vaud28", VAUD28,
-			 MT6358_LDO_VAUD28_CON0, 0, 2800000),
-	MT6366_LDO("vdram2", VDRAM2, vdram2,
+	MT6366_REG_FIXED("vrf12", VRF12, "vs2-ldo2", MT6358_LDO_VRF12_CON0, 0, 1200000),
+	MT6366_REG_FIXED("vio18", VIO18, "vs1-ldo1", MT6358_LDO_VIO18_CON0, 0, 1800000),
+	MT6366_REG_FIXED("vfe28", VFE28, "vsys-ldo1", MT6358_LDO_VFE28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("vcn28", VCN28, "vsys-ldo1", MT6358_LDO_VCN28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("vxo22", VXO22, "vsys-ldo1", MT6358_LDO_VXO22_CON0, 0, 2200000),
+	MT6366_REG_FIXED("vaux18", VAUX18, "vsys-ldo1", MT6358_LDO_VAUX18_CON0, 0, 1800000),
+	MT6366_REG_FIXED("vbif28", VBIF28, "vsys-ldo1", MT6358_LDO_VBIF28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("vio28", VIO28, "vsys-ldo2", MT6358_LDO_VIO28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("va12", VA12, "vs2-ldo2", MT6358_LDO_VA12_CON0, 0, 1200000),
+	MT6366_REG_FIXED("vrf18", VRF18, "vs1-ldo1", MT6358_LDO_VRF18_CON0, 0, 1800000),
+	MT6366_REG_FIXED("vaud28", VAUD28, "vsys-ldo1", MT6358_LDO_VAUD28_CON0, 0, 2800000),
+	MT6366_LDO("vdram2", VDRAM2, vdram2, "vs2-ldo1",
 		   MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x10),
-	MT6366_LDO("vsim1", VSIM1, vsim,
+	MT6366_LDO("vsim1", VSIM1, vsim, "vsys-ldo1",
 		   MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00),
-	MT6366_LDO("vibr", VIBR, vibr,
+	MT6366_LDO("vibr", VIBR, vibr, "vsys-ldo3",
 		   MT6358_LDO_VIBR_CON0, 0, MT6358_VIBR_ANA_CON0, 0xf00),
-	MT6366_LDO("vusb", VUSB, vusb,
+	MT6366_LDO("vusb", VUSB, vusb, "vsys-ldo1",
 		   MT6358_LDO_VUSB_CON0_0, 0, MT6358_VUSB_ANA_CON0, 0x700),
-	MT6366_LDO("vefuse", VEFUSE, vefuse,
+	MT6366_LDO("vefuse", VEFUSE, vefuse, "vs1-ldo1",
 		   MT6358_LDO_VEFUSE_CON0, 0, MT6358_VEFUSE_ANA_CON0, 0xf00),
-	MT6366_LDO("vmch", VMCH, vmch_vemc,
+	MT6366_LDO("vmch", VMCH, vmch_vemc, "vsys-ldo2",
 		   MT6358_LDO_VMCH_CON0, 0, MT6358_VMCH_ANA_CON0, 0x700),
-	MT6366_LDO("vemc", VEMC, vmch_vemc,
+	MT6366_LDO("vemc", VEMC, vmch_vemc, "vsys-ldo3",
 		   MT6358_LDO_VEMC_CON0, 0, MT6358_VEMC_ANA_CON0, 0x700),
-	MT6366_LDO("vcn33", VCN33, vcn33,
+	MT6366_LDO("vcn33", VCN33, vcn33, "vsys-ldo3",
 		   MT6358_LDO_VCN33_CON0_0, 0, MT6358_VCN33_ANA_CON0, 0x300),
-	MT6366_LDO("vmc", VMC, vmc,
+	MT6366_LDO("vmc", VMC, vmc, "vsys-ldo2",
 		   MT6358_LDO_VMC_CON0, 0, MT6358_VMC_ANA_CON0, 0xf00),
-	MT6366_LDO("vsim2", VSIM2, vsim,
+	MT6366_LDO("vsim2", VSIM2, vsim, "vsys-ldo2",
 		   MT6358_LDO_VSIM2_CON0, 0, MT6358_VSIM2_ANA_CON0, 0xf00),
-	MT6366_LDO("vcn18", VCN18, mt6366_vcn18_vm18,
+	MT6366_LDO("vcn18", VCN18, mt6366_vcn18_vm18, "vs1-ldo1",
 		   MT6358_LDO_VCN18_CON0, 0, MT6358_VCN18_ANA_CON0, 0xf00),
-	MT6366_LDO("vm18", VM18, mt6366_vcn18_vm18,
+	MT6366_LDO("vm18", VM18, mt6366_vcn18_vm18, "vs1-ldo1",
 		   MT6358_LDO_VM18_CON0, 0, MT6358_VM18_ANA_CON0, 0xf00),
-	MT6366_LDO("vmddr", VMDDR, mt6366_vmddr,
+	MT6366_LDO("vmddr", VMDDR, mt6366_vmddr, "vs2-ldo1",
 		   MT6358_LDO_VMDDR_CON0, 0, MT6358_VMDDR_ANA_CON0, 0xf00),
-	MT6366_LDO1("vsram-proc11", VSRAM_PROC11, 500000, 1293750, 6250,
+	MT6366_LDO1("vsram-proc11", VSRAM_PROC11, "vs2-ldo3", 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_PROC11_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON0, 0x7f),
-	MT6366_LDO1("vsram-others", VSRAM_OTHERS, 500000, 1293750, 6250,
+	MT6366_LDO1("vsram-others", VSRAM_OTHERS, "vs2-ldo3", 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_OTHERS_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON2, 0x7f),
-	MT6366_LDO1("vsram-gpu", VSRAM_GPU, 500000, 1293750, 6250,
+	MT6366_LDO1("vsram-gpu", VSRAM_GPU, "vs2-ldo3", 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_GPU_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON3, 0x7f),
-	MT6366_LDO1("vsram-proc12", VSRAM_PROC12, 500000, 1293750, 6250,
+	MT6366_LDO1("vsram-proc12", VSRAM_PROC12, "vs2-ldo3", 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_PROC12_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON1, 0x7f),
-	MT6366_LDO1("vsram-core", VSRAM_CORE, 500000, 1293750, 6250,
+	MT6366_LDO1("vsram-core", VSRAM_CORE, "vs2-ldo3", 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_CORE_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON5, 0x7f),
 };
 
-- 
2.42.0.459.ge4e396fd5e-goog


