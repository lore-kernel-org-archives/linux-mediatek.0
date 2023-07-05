Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95383EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zoj6PovRbQtOS9C5HOPl6B505HcYhQOk1Hb8p+qbuDo=; b=qljt5jRUfdLJy/6MegnTx/qHts
	CyxJHfjdJ5AtJXzIDRvLN1koM/RvEEVMqyYbnB5ZA5mwqJ/Dvzh06l8QOMnJ2FaJCWcv6X7ddOTkv
	FZPhkapfrUTd8J6JWPOmae4LGqihrOOGG0zz3C2vblIlFQ8M1PD4N3FhcX+24i/Kb7+K3wQaev8wm
	vwntxsXrTQV3KjkYmlkScqXxraWSxbEy97aJ5wRvma8E8w3sQUQ3DmM50QfM2At29IOnpk4HX5sUf
	1d43dcXPVM4lWd7+dhQq8Rpedyh6aSvO/8fKA/CX6jmfjLODS3F6Btwfo9Szk2T6uNcV+1u6f5gM3
	Wq4Yr9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3zx-00GFDO-0e;
	Wed, 05 Jul 2023 15:00:53 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3zK-00GEuM-2s
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Jul 2023 15:00:16 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9923833737eso612419566b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Jul 2023 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688569211; x=1691161211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zoj6PovRbQtOS9C5HOPl6B505HcYhQOk1Hb8p+qbuDo=;
        b=wERFDEO1li69fIU+KUHWAEHjn5+bMAooEiWlHlYDnVIdlK61szQC42sOaqaQuGZIUm
         UjnmbaTahZNA+QNdIM6/H/oO4EeDWcGNIqSnomfPTc2WTLCtxI+RJknsLFPfNd25nNA0
         tnk8vZC/wMzqIz0r8tzICRVLBShcB1aCssW0QlWWyYAxUwBTn7eUchBCd/FMfWDcukd7
         4ApwEGLy3HBIeYl8iuHtnsYPSkwXkPtVAzC2TSr+M6I/4lN4nAAuSib4dJ1rR43kvMBU
         rCFmON1Fac8Wyo0v8gyCzmxevqMPmiPa74ZQWK+7zUxPDcAffRloEOizwBX7KQpvrPas
         iL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688569211; x=1691161211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoj6PovRbQtOS9C5HOPl6B505HcYhQOk1Hb8p+qbuDo=;
        b=cYauODpLb9sdow3q/g4t45LBy2tpP5DfNZhkZ3SgTJRoEmfx861Ewkt5Gy2UFFAJfh
         3tZnl9hoSbip5p6fd8MUzLAotv/OE694S18Ns1Wan57Ay3hYA98S7IeO5RXznqiCf2sN
         o2eDP0P2jpnBeWmb9DYOQGlFsBCucNxBpaK8d3a3fxLTj95fiwUy0DREFzogph4vvfze
         C8Bm2UIH6OO8z9/s3pPnSfTekb5VlqAcDSXd226sa66/sAzpNznZkc56fiDo4wYaf6by
         Z0kaLXMovJN1VV5zmsJYNRy87zhYicEKtdHRPtlJdWSJLSCZM3ZuOmgWMcdUW+wEjuDt
         nZWg==
X-Gm-Message-State: ABy/qLbCmQMoGAYNJxmm1TJjiZePwxLfwrODHUZ+tMK6J4lxeolzo6jV
	oQ1VtoQzQF5Ce8UVHjmtdRshxw==
X-Google-Smtp-Source: APBJJlHDuJ57DJRbSpm3ZfMkLb71JQyDqyG9Z9b+EwOVBs6eGnhnuvhmGOHJSm6o09XJiYLYJsZSyQ==
X-Received: by 2002:a17:906:5904:b0:98e:18ea:442c with SMTP id h4-20020a170906590400b0098e18ea442cmr12854691ejq.45.1688569211231;
        Wed, 05 Jul 2023 08:00:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bu5-20020a170906a14500b0096f6a131b9fsm14704838ejb.23.2023.07.05.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:00:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: mediatek: add missing space before {
Date: Wed,  5 Jul 2023 17:00:05 +0200
Message-Id: <20230705150006.293690-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_080014_942904_41927999 
X-CRM114-Status: GOOD (  10.12  )
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

Add missing whitespace between node name/label and opening {.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/mediatek/mt2701-evb.dts |  2 +-
 arch/arm/boot/dts/mediatek/mt6323.dtsi    | 58 +++++++++++------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt2701-evb.dts b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
index d1535f385f36..9c7325f18933 100644
--- a/arch/arm/boot/dts/mediatek/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
@@ -244,7 +244,7 @@ &uart0 {
 &usb2 {
 	status = "okay";
 	usb-role-switch;
-	connector{
+	connector {
 		compatible = "gpio-usb-b-connector", "usb-b-connector";
 		type = "micro";
 		id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index 7fda40ab5fe8..c230c865116d 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -21,10 +21,10 @@ mt6323_leds: leds {
 			status = "disabled";
 		};
 
-		mt6323regulator: mt6323regulator{
+		mt6323regulator: mt6323regulator {
 			compatible = "mediatek,mt6323-regulator";
 
-			mt6323_vproc_reg: buck_vproc{
+			mt6323_vproc_reg: buck_vproc {
 				regulator-name = "vproc";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1350000>;
@@ -33,7 +33,7 @@ mt6323_vproc_reg: buck_vproc{
 				regulator-boot-on;
 			};
 
-			mt6323_vsys_reg: buck_vsys{
+			mt6323_vsys_reg: buck_vsys {
 				regulator-name = "vsys";
 				regulator-min-microvolt = <1400000>;
 				regulator-max-microvolt = <2987500>;
@@ -42,13 +42,13 @@ mt6323_vsys_reg: buck_vsys{
 				regulator-boot-on;
 			};
 
-			mt6323_vpa_reg: buck_vpa{
+			mt6323_vpa_reg: buck_vpa {
 				regulator-name = "vpa";
 				regulator-min-microvolt = < 500000>;
 				regulator-max-microvolt = <3650000>;
 			};
 
-			mt6323_vtcxo_reg: ldo_vtcxo{
+			mt6323_vtcxo_reg: ldo_vtcxo {
 				regulator-name = "vtcxo";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -57,28 +57,28 @@ mt6323_vtcxo_reg: ldo_vtcxo{
 				regulator-boot-on;
 			};
 
-			mt6323_vcn28_reg: ldo_vcn28{
+			mt6323_vcn28_reg: ldo_vcn28 {
 				regulator-name = "vcn28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
 				regulator-enable-ramp-delay = <185>;
 			};
 
-			mt6323_vcn33_bt_reg: ldo_vcn33_bt{
+			mt6323_vcn33_bt_reg: ldo_vcn33_bt {
 				regulator-name = "vcn33_bt";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3600000>;
 				regulator-enable-ramp-delay = <185>;
 			};
 
-			mt6323_vcn33_wifi_reg: ldo_vcn33_wifi{
+			mt6323_vcn33_wifi_reg: ldo_vcn33_wifi {
 				regulator-name = "vcn33_wifi";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3600000>;
 				regulator-enable-ramp-delay = <185>;
 			};
 
-			mt6323_va_reg: ldo_va{
+			mt6323_va_reg: ldo_va {
 				regulator-name = "va";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -87,14 +87,14 @@ mt6323_va_reg: ldo_va{
 				regulator-boot-on;
 			};
 
-			mt6323_vcama_reg: ldo_vcama{
+			mt6323_vcama_reg: ldo_vcama {
 				regulator-name = "vcama";
 				regulator-min-microvolt = <1500000>;
 				regulator-max-microvolt = <2800000>;
 				regulator-enable-ramp-delay = <216>;
 			};
 
-			mt6323_vio28_reg: ldo_vio28{
+			mt6323_vio28_reg: ldo_vio28 {
 				regulator-name = "vio28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -103,7 +103,7 @@ mt6323_vio28_reg: ldo_vio28{
 				regulator-boot-on;
 			};
 
-			mt6323_vusb_reg: ldo_vusb{
+			mt6323_vusb_reg: ldo_vusb {
 				regulator-name = "vusb";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -111,7 +111,7 @@ mt6323_vusb_reg: ldo_vusb{
 				regulator-boot-on;
 			};
 
-			mt6323_vmc_reg: ldo_vmc{
+			mt6323_vmc_reg: ldo_vmc {
 				regulator-name = "vmc";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
@@ -119,7 +119,7 @@ mt6323_vmc_reg: ldo_vmc{
 				regulator-boot-on;
 			};
 
-			mt6323_vmch_reg: ldo_vmch{
+			mt6323_vmch_reg: ldo_vmch {
 				regulator-name = "vmch";
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3300000>;
@@ -127,7 +127,7 @@ mt6323_vmch_reg: ldo_vmch{
 				regulator-boot-on;
 			};
 
-			mt6323_vemc3v3_reg: ldo_vemc3v3{
+			mt6323_vemc3v3_reg: ldo_vemc3v3 {
 				regulator-name = "vemc3v3";
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3300000>;
@@ -135,49 +135,49 @@ mt6323_vemc3v3_reg: ldo_vemc3v3{
 				regulator-boot-on;
 			};
 
-			mt6323_vgp1_reg: ldo_vgp1{
+			mt6323_vgp1_reg: ldo_vgp1 {
 				regulator-name = "vgp1";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <216>;
 			};
 
-			mt6323_vgp2_reg: ldo_vgp2{
+			mt6323_vgp2_reg: ldo_vgp2 {
 				regulator-name = "vgp2";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-enable-ramp-delay = <216>;
 			};
 
-			mt6323_vgp3_reg: ldo_vgp3{
+			mt6323_vgp3_reg: ldo_vgp3 {
 				regulator-name = "vgp3";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-enable-ramp-delay = <216>;
 			};
 
-			mt6323_vcn18_reg: ldo_vcn18{
+			mt6323_vcn18_reg: ldo_vcn18 {
 				regulator-name = "vcn18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-enable-ramp-delay = <216>;
 			};
 
-			mt6323_vsim1_reg: ldo_vsim1{
+			mt6323_vsim1_reg: ldo_vsim1 {
 				regulator-name = "vsim1";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-enable-ramp-delay = <216>;
 			};
 
-			mt6323_vsim2_reg: ldo_vsim2{
+			mt6323_vsim2_reg: ldo_vsim2 {
 				regulator-name = "vsim2";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-enable-ramp-delay = <216>;
 			};
 
-			mt6323_vrtc_reg: ldo_vrtc{
+			mt6323_vrtc_reg: ldo_vrtc {
 				regulator-name = "vrtc";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -185,28 +185,28 @@ mt6323_vrtc_reg: ldo_vrtc{
 				regulator-boot-on;
 			};
 
-			mt6323_vcamaf_reg: ldo_vcamaf{
+			mt6323_vcamaf_reg: ldo_vcamaf {
 				regulator-name = "vcamaf";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <216>;
 			};
 
-			mt6323_vibr_reg: ldo_vibr{
+			mt6323_vibr_reg: ldo_vibr {
 				regulator-name = "vibr";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <36>;
 			};
 
-			mt6323_vrf18_reg: ldo_vrf18{
+			mt6323_vrf18_reg: ldo_vrf18 {
 				regulator-name = "vrf18";
 				regulator-min-microvolt = <1825000>;
 				regulator-max-microvolt = <1825000>;
 				regulator-enable-ramp-delay = <187>;
 			};
 
-			mt6323_vm_reg: ldo_vm{
+			mt6323_vm_reg: ldo_vm {
 				regulator-name = "vm";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1800000>;
@@ -215,7 +215,7 @@ mt6323_vm_reg: ldo_vm{
 				regulator-boot-on;
 			};
 
-			mt6323_vio18_reg: ldo_vio18{
+			mt6323_vio18_reg: ldo_vio18 {
 				regulator-name = "vio18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -224,14 +224,14 @@ mt6323_vio18_reg: ldo_vio18{
 				regulator-boot-on;
 			};
 
-			mt6323_vcamd_reg: ldo_vcamd{
+			mt6323_vcamd_reg: ldo_vcamd {
 				regulator-name = "vcamd";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-enable-ramp-delay = <216>;
 			};
 
-			mt6323_vcamio_reg: ldo_vcamio{
+			mt6323_vcamio_reg: ldo_vcamio {
 				regulator-name = "vcamio";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-- 
2.34.1


