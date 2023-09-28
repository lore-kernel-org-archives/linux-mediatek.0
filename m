Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D047CE7B10
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RDsOoxZ8MQollE3UstUsPbUGe0Wmv32bkmPy0XYkX1g=; b=1mG++MBZWNf0gkeU1t/MB3j88Q
	YYazURvU8zvChGZSPQSRG8nteZpXqGE9RhTA/1h+RusJZ0mVopHciV5KbZ1ztHCNiyv/CVhNNJs36
	IEMZqOf5J7Zbg8Kgdc0OzhEtyNDS1oYD0B9um7eC34iRVSmDX2Mp7W3g7QMaFVmEPvsSVa+/HhSc5
	OT/BBvLtPRneuPsAWejYEgN+gJK9j9zQnC09QsVWrFo823ftZ0a56x+EYylkNyQu8OPapLg7Hs/ak
	D+IgB9WFj4cjfiLepLW05m8I6FMYBzkeiv6q0Bn2XbpKytElKAFmNPqkI1RzUv4NqSDejJrSyOwVc
	KCRMI2Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qln6N-002huO-0S;
	Thu, 28 Sep 2023 09:14:31 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qln6I-002htK-2a
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 09:14:29 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c737d61a00so3602285ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 02:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695892465; x=1696497265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDsOoxZ8MQollE3UstUsPbUGe0Wmv32bkmPy0XYkX1g=;
        b=HzcPEHM8/Q/huTOW3o+qFZNHV43gGmur6MRfh0j2vitW9jAnijWQUIAi+sjgJbz+Z9
         /sRGnB+KspM/hQAG0czVVZW1/GpsAgFDvSTfvOAtzrq/CCSr1sGbxmMN1B1t8wvKYPKH
         HXFRO3C+VQ0/y/XWMmElBodjdrCTuJbdxNvtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695892465; x=1696497265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDsOoxZ8MQollE3UstUsPbUGe0Wmv32bkmPy0XYkX1g=;
        b=TaenyrfH5iYuXo+qcNnr7OkQglkB9Xus8BOti8/bI9UHPJ14XpyKtcTHalgF2baqvB
         TK1tohoiZKhVLRVUQpDuZzujjciNT5BGr33gNatqpXHX2eXjX3e6OKTlnO5Ih5UtzsoF
         BkKFhSSJ/iPfYFK8GaB32lwCu6SjF9PbPxN6njljRDF2vVVpcJL0+zcgJTWb/oBMUC6N
         HmHzw4i7i8YVRbnQ0ciXh+yPMMQhlPk5F9fGFEiQliKCB0taxqQAqEvjcGCbiGLq4YAl
         RENab0KLW9jhe5TAiyh6M66u007N5fAVpVJKiHxvrN174EDQ1onpVOkUtFfZmSWD9EyZ
         NBow==
X-Gm-Message-State: AOJu0Yzy/zOCJm/fMuxCyDp4FRNYhTF1D/6UspV8NBxl215mXzVcXlZ9
	MSeyJTUzNyoJpzL4XPdERPHOQw==
X-Google-Smtp-Source: AGHT+IGQLfQRO6gsAzpjJmhD3uDDJT6i1ivhb4wH5aRbZWrFU6QJUjUC4b4MjjaW5/BQCerEX2AaEw==
X-Received: by 2002:a17:902:8649:b0:1bb:9c45:130f with SMTP id y9-20020a170902864900b001bb9c45130fmr511604plt.69.1695892464799;
        Thu, 28 Sep 2023 02:14:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6747:c12a:dbfd:2cc7])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902860800b001bdb8c0b578sm8488024plo.192.2023.09.28.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 02:14:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: mt6358: Drop bogus "regulator-fixed" compatible properties
Date: Thu, 28 Sep 2023 17:14:11 +0800
Message-ID: <20230928091415.3253698-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_021426_835584_07B59663 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

Whether a regulator under the MT6358 PMIC is a fixed regulator or not is
derived from the node name. Compatible string properties are not used.
This causes validation errors after the regulator binding is converted
to DT schema.

Drop the bogus "regulator-fixed" compatible properties from the PMIC's
regulator sub-nodes.

Fixes: 9f8872221674 ("arm64: dts: mt6358: add PMIC MT6358 related nodes")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index 186898f9384b..ad5e4022e06d 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -128,7 +128,6 @@ mt6358_vibr_reg: ldo_vibr {
 			};
 
 			mt6358_vrf12_reg: ldo_vrf12 {
-				compatible = "regulator-fixed";
 				regulator-name = "vrf12";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
@@ -136,7 +135,6 @@ mt6358_vrf12_reg: ldo_vrf12 {
 			};
 
 			mt6358_vio18_reg: ldo_vio18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vio18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -153,7 +151,6 @@ mt6358_vusb_reg: ldo_vusb {
 			};
 
 			mt6358_vcamio_reg: ldo_vcamio {
-				compatible = "regulator-fixed";
 				regulator-name = "vcamio";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -168,7 +165,6 @@ mt6358_vcamd_reg: ldo_vcamd {
 			};
 
 			mt6358_vcn18_reg: ldo_vcn18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vcn18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -176,7 +172,6 @@ mt6358_vcn18_reg: ldo_vcn18 {
 			};
 
 			mt6358_vfe28_reg: ldo_vfe28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vfe28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -193,7 +188,6 @@ mt6358_vsram_proc11_reg: ldo_vsram_proc11 {
 			};
 
 			mt6358_vcn28_reg: ldo_vcn28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vcn28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -218,7 +212,6 @@ mt6358_vsram_gpu_reg: ldo_vsram_gpu {
 			};
 
 			mt6358_vxo22_reg: ldo_vxo22 {
-				compatible = "regulator-fixed";
 				regulator-name = "vxo22";
 				regulator-min-microvolt = <2200000>;
 				regulator-max-microvolt = <2200000>;
@@ -234,7 +227,6 @@ mt6358_vefuse_reg: ldo_vefuse {
 			};
 
 			mt6358_vaux18_reg: ldo_vaux18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vaux18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -249,7 +241,6 @@ mt6358_vmch_reg: ldo_vmch {
 			};
 
 			mt6358_vbif28_reg: ldo_vbif28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vbif28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -280,7 +271,6 @@ mt6358_vemc_reg: ldo_vemc {
 			};
 
 			mt6358_vio28_reg: ldo_vio28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vio28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -288,7 +278,6 @@ mt6358_vio28_reg: ldo_vio28 {
 			};
 
 			mt6358_va12_reg: ldo_va12 {
-				compatible = "regulator-fixed";
 				regulator-name = "va12";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
@@ -297,7 +286,6 @@ mt6358_va12_reg: ldo_va12 {
 			};
 
 			mt6358_vrf18_reg: ldo_vrf18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vrf18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -333,7 +321,6 @@ mt6358_vldo28_reg: ldo_vldo28 {
 			};
 
 			mt6358_vaud28_reg: ldo_vaud28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vaud28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
-- 
2.42.0.582.g8ccd20d70d-goog


