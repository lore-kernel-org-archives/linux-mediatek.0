Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B38EE4993
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63jQ1kY7su1lCsx2tRGAaWVTfzqHu9OQUezgv59mi30=; b=hM8EMu4aXXjpnr0YukABBJHewU
	+TuVr5ZgIUXunzCBpJRIPZyFkVrLwI1lvZKvckIjnB4xqBYGpX/ACVqkjfX8FXeXqcTXeiyjJ8Igb
	BDdJX+CMxLhA3hihF9AYIoT1FG6Wr+Qe7D+P45Xoz/trkQ2MzrsBA0KQmoIlbvMwpfWSyqynedpJN
	dFT0W6NbM8CLGi+MmjOwZRVGZ4kfCNoktxDCXtFVcYBwzLodfQamxcydK5ieYLVNZ67HTLvA61n6k
	s3xoSSNMLstdqwxxyrb1sLypKUTwIZ7ofYAEUcJGXt+7ZJECp9yrirp0LMFgHtaf3A4lhJgvRTl9i
	h4FdpRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN1w-00FUgV-1K;
	Tue, 22 Aug 2023 08:46:28 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN1K-00FUC6-0P
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 08:45:51 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68a3daf4cf7so1431684b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692693948; x=1693298748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63jQ1kY7su1lCsx2tRGAaWVTfzqHu9OQUezgv59mi30=;
        b=euyhApvgxt/Q4MkWGgkXf2m0xVZQ1jlXwo0cwZ2kR/Ph6JsCAdfPXn+6pi/yNAeRFg
         YLyHGIpJVdGgyp+ZNKHhHDJut16oUyPkQ6gZxy2SdFbIMcU6r9iX/zzxyOwVyY0Z/LQy
         Hh0DbdYOmHaGtyMFJ9uhSmuY+B1lNZO8aJN2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692693948; x=1693298748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63jQ1kY7su1lCsx2tRGAaWVTfzqHu9OQUezgv59mi30=;
        b=ca+9yCMBP1Y3V2FWOHRjLC4NV24zNbC3uTHAuHHzLBh1Pm7gz0eT2AFQyByVCtyZ8A
         FR/xpidE6ly8KspkDinngtdCKLtUTzU7PjmDFMIVWd2F12piwygKTGSG9rT8aRjaVdZN
         c61vxlfKb/eLr7CmkDNsT8IZMoangEoym90luXeLcRUnq+qA7hJ35NdMPkyRAgJphk2X
         yt88xpbrvAWI/DgHHZnv7E3IIyJ5pzZ01WDER4ZaQdgHkRwtR9vrXdpZ81xdij7Dw5sg
         ItHHgR1uFxpiqfjf13afvoGZiEpLNOau7lAQKFCMr+E7LRDtQMh0o0hna2blUMAmlQhi
         Pqrw==
X-Gm-Message-State: AOJu0YwcSq5+Q1IT05ps8fP9oQaPgCOHGaQHm+PPGURzTBjz5VGHuF4H
	uC+0jH20VyjBWTjrbCqZh+jU85ZxMXdG8ClotB4=
X-Google-Smtp-Source: AGHT+IEfnsEAyLuzQuoLVVkbddi+FiEa94olPQ1J53s6w9Y/lSnpqa4nTLNupC70/wdRTpHMMRNvAA==
X-Received: by 2002:a05:6a00:1a56:b0:687:41cb:e274 with SMTP id h22-20020a056a001a5600b0068741cbe274mr7774159pfv.9.1692693948082;
        Tue, 22 Aug 2023 01:45:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e619:3fa0:1a90:6bb0])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00666b012baedsm7304790pfe.158.2023.08.22.01.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:45:47 -0700 (PDT)
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
Subject: [PATCH v2 07/11] regulator: mt6358: fix and drop type prefix in MT6366 regulator node names
Date: Tue, 22 Aug 2023 16:45:15 +0800
Message-ID: <20230822084520.564937-8-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822084520.564937-1-wenst@chromium.org>
References: <20230822084520.564937-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_014550_174121_B4EF2778 
X-CRM114-Status: GOOD (  10.90  )
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

The new MT6366 binding does away with the type prefix ("buck_", "ldo_")
in the regulator node names. This better matches the PMIC pin names.
Remaining underscores in names are also replaced with hyphens.

Drop the type prefixes and replace remaining underscores to match the
MT6366 binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mt6358-regulator.c | 70 ++++++++++++++--------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index db75f644966a..bc7fe2ff189d 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -532,68 +532,68 @@ static const struct mt6358_regulator_info mt6358_regulators[] = {
 
 /* The array is indexed by id(MT6366_ID_XXX) */
 static const struct mt6358_regulator_info mt6366_regulators[] = {
-	MT6366_BUCK("buck_vdram1", VDRAM1, 500000, 2087500, 12500,
+	MT6366_BUCK("vdram1", VDRAM1, 500000, 2087500, 12500,
 		    0x7f, MT6358_BUCK_VDRAM1_DBG0, 0x7f, MT6358_VDRAM1_ANA_CON0, 8),
-	MT6366_BUCK("buck_vcore", VCORE, 500000, 1293750, 6250,
+	MT6366_BUCK("vcore", VCORE, 500000, 1293750, 6250,
 		    0x7f, MT6358_BUCK_VCORE_DBG0, 0x7f, MT6358_VCORE_VGPU_ANA_CON0, 1),
-	MT6366_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
+	MT6366_BUCK("vpa", VPA, 500000, 3650000, 50000,
 		    0x3f, MT6358_BUCK_VPA_DBG0, 0x3f, MT6358_VPA_ANA_CON0, 3),
-	MT6366_BUCK("buck_vproc11", VPROC11, 500000, 1293750, 6250,
+	MT6366_BUCK("vproc11", VPROC11, 500000, 1293750, 6250,
 		    0x7f, MT6358_BUCK_VPROC11_DBG0, 0x7f, MT6358_VPROC_ANA_CON0, 1),
-	MT6366_BUCK("buck_vproc12", VPROC12, 500000, 1293750, 6250,
+	MT6366_BUCK("vproc12", VPROC12, 500000, 1293750, 6250,
 		    0x7f, MT6358_BUCK_VPROC12_DBG0, 0x7f, MT6358_VPROC_ANA_CON0, 2),
-	MT6366_BUCK("buck_vgpu", VGPU, 500000, 1293750, 6250,
+	MT6366_BUCK("vgpu", VGPU, 500000, 1293750, 6250,
 		    0x7f, MT6358_BUCK_VGPU_ELR0, 0x7f, MT6358_VCORE_VGPU_ANA_CON0, 2),
-	MT6366_BUCK("buck_vs2", VS2, 500000, 2087500, 12500,
+	MT6366_BUCK("vs2", VS2, 500000, 2087500, 12500,
 		    0x7f, MT6358_BUCK_VS2_DBG0, 0x7f, MT6358_VS2_ANA_CON0, 8),
-	MT6366_BUCK("buck_vmodem", VMODEM, 500000, 1293750, 6250,
+	MT6366_BUCK("vmodem", VMODEM, 500000, 1293750, 6250,
 		    0x7f, MT6358_BUCK_VMODEM_DBG0, 0x7f, MT6358_VMODEM_ANA_CON0, 8),
-	MT6366_BUCK("buck_vs1", VS1, 1000000, 2587500, 12500,
+	MT6366_BUCK("vs1", VS1, 1000000, 2587500, 12500,
 		    0x7f, MT6358_BUCK_VS1_DBG0, 0x7f, MT6358_VS1_ANA_CON0, 8),
-	MT6366_REG_FIXED("ldo_vrf12", VRF12,
+	MT6366_REG_FIXED("vrf12", VRF12,
 			 MT6358_LDO_VRF12_CON0, 0, 1200000),
-	MT6366_REG_FIXED("ldo_vio18", VIO18,
+	MT6366_REG_FIXED("vio18", VIO18,
 			 MT6358_LDO_VIO18_CON0, 0, 1800000),
-	MT6366_REG_FIXED("ldo_vcn18", VCN18, MT6358_LDO_VCN18_CON0, 0, 1800000),
-	MT6366_REG_FIXED("ldo_vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 2800000),
-	MT6366_REG_FIXED("ldo_vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 2800000),
-	MT6366_REG_FIXED("ldo_vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 2200000),
-	MT6366_REG_FIXED("ldo_vaux18", VAUX18,
+	MT6366_REG_FIXED("vcn18", VCN18, MT6358_LDO_VCN18_CON0, 0, 1800000),
+	MT6366_REG_FIXED("vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 2200000),
+	MT6366_REG_FIXED("vaux18", VAUX18,
 			 MT6358_LDO_VAUX18_CON0, 0, 1800000),
-	MT6366_REG_FIXED("ldo_vbif28", VBIF28,
+	MT6366_REG_FIXED("vbif28", VBIF28,
 			 MT6358_LDO_VBIF28_CON0, 0, 2800000),
-	MT6366_REG_FIXED("ldo_vio28", VIO28, MT6358_LDO_VIO28_CON0, 0, 2800000),
-	MT6366_REG_FIXED("ldo_va12", VA12, MT6358_LDO_VA12_CON0, 0, 1200000),
-	MT6366_REG_FIXED("ldo_vrf18", VRF18, MT6358_LDO_VRF18_CON0, 0, 1800000),
-	MT6366_REG_FIXED("ldo_vaud28", VAUD28,
+	MT6366_REG_FIXED("vio28", VIO28, MT6358_LDO_VIO28_CON0, 0, 2800000),
+	MT6366_REG_FIXED("va12", VA12, MT6358_LDO_VA12_CON0, 0, 1200000),
+	MT6366_REG_FIXED("vrf18", VRF18, MT6358_LDO_VRF18_CON0, 0, 1800000),
+	MT6366_REG_FIXED("vaud28", VAUD28,
 			 MT6358_LDO_VAUD28_CON0, 0, 2800000),
-	MT6366_LDO("ldo_vdram2", VDRAM2, vdram2,
+	MT6366_LDO("vdram2", VDRAM2, vdram2,
 		   MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x10),
-	MT6366_LDO("ldo_vsim1", VSIM1, vsim,
+	MT6366_LDO("vsim1", VSIM1, vsim,
 		   MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00),
-	MT6366_LDO("ldo_vibr", VIBR, vibr,
+	MT6366_LDO("vibr", VIBR, vibr,
 		   MT6358_LDO_VIBR_CON0, 0, MT6358_VIBR_ANA_CON0, 0xf00),
-	MT6366_LDO("ldo_vusb", VUSB, vusb,
+	MT6366_LDO("vusb", VUSB, vusb,
 		   MT6358_LDO_VUSB_CON0_0, 0, MT6358_VUSB_ANA_CON0, 0x700),
-	MT6366_LDO("ldo_vefuse", VEFUSE, vefuse,
+	MT6366_LDO("vefuse", VEFUSE, vefuse,
 		   MT6358_LDO_VEFUSE_CON0, 0, MT6358_VEFUSE_ANA_CON0, 0xf00),
-	MT6366_LDO("ldo_vmch", VMCH, vmch_vemc,
+	MT6366_LDO("vmch", VMCH, vmch_vemc,
 		   MT6358_LDO_VMCH_CON0, 0, MT6358_VMCH_ANA_CON0, 0x700),
-	MT6366_LDO("ldo_vemc", VEMC, vmch_vemc,
+	MT6366_LDO("vemc", VEMC, vmch_vemc,
 		   MT6358_LDO_VEMC_CON0, 0, MT6358_VEMC_ANA_CON0, 0x700),
-	MT6366_LDO("ldo_vcn33", VCN33, vcn33,
+	MT6366_LDO("vcn33", VCN33, vcn33,
 		   MT6358_LDO_VCN33_CON0_0, 0, MT6358_VCN33_ANA_CON0, 0x300),
-	MT6366_LDO("ldo_vmc", VMC, vmc,
+	MT6366_LDO("vmc", VMC, vmc,
 		   MT6358_LDO_VMC_CON0, 0, MT6358_VMC_ANA_CON0, 0xf00),
-	MT6366_LDO("ldo_vsim2", VSIM2, vsim,
+	MT6366_LDO("vsim2", VSIM2, vsim,
 		   MT6358_LDO_VSIM2_CON0, 0, MT6358_VSIM2_ANA_CON0, 0xf00),
-	MT6366_LDO1("ldo_vsram_proc11", VSRAM_PROC11, 500000, 1293750, 6250,
+	MT6366_LDO1("vsram-proc11", VSRAM_PROC11, 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_PROC11_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON0, 0x7f),
-	MT6366_LDO1("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750, 6250,
+	MT6366_LDO1("vsram-others", VSRAM_OTHERS, 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_OTHERS_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON2, 0x7f),
-	MT6366_LDO1("ldo_vsram_gpu", VSRAM_GPU, 500000, 1293750, 6250,
+	MT6366_LDO1("vsram-gpu", VSRAM_GPU, 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_GPU_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON3, 0x7f),
-	MT6366_LDO1("ldo_vsram_proc12", VSRAM_PROC12, 500000, 1293750, 6250,
+	MT6366_LDO1("vsram-proc12", VSRAM_PROC12, 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_PROC12_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON1, 0x7f),
 };
 
-- 
2.42.0.rc1.204.g551eb34607-goog


