Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911C7CD342F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjcVEJCK/cwTNvVbr5CQaLiCjWyMPPoiyKPAoaxLvx8=; b=hwkSBVnxGglhdjErGWrrvlNDJk
	+p8vKdWLF8UNbM0gu0o1Geya7GsWsLuV38a/dNqy9bg7ctXigAqNMhWhB9z7wExwvSFIbxTTkUxqI
	meUzpvgRI1Yc0FFX6AhuOPMKYck4xewkqUaoizBi6NqkBnT7r2EOLHU5BCc2fCBd/Uivr75fwCRso
	E+cwmBfbEJS2lavXXF11/y8eNoianYg6EhDpFFMu0lKx0y6+dskVD7/4OqiBSF42RtLzJlHETcJvM
	ohCncNKCf8fVOqfn0/WBOQsvyHtGh+7Qaa1vkh7+OFoaFL6AWSP8/MapTulUejVBznrfUKKsPdkIS
	jp7WPmVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnL-0000000Fqig-2RZB;
	Tue, 05 May 2026 10:14:27 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnI-0000000FqfH-1fPD
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:25 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82faf871346so3111439b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976063; x=1778580863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjcVEJCK/cwTNvVbr5CQaLiCjWyMPPoiyKPAoaxLvx8=;
        b=mN9RPnMr0RRixrBIOq899wKM6zcYa4J3YcY6j/+/lVyDSPLE7+yqfModunxHSopKSx
         PRcXSftbJPi/RCLgY/CJeAK0I9HBBTeHN6Cb58u9r1DFbbielnMZ9sAd2Q7o6oE2+Ylj
         1Sq7CccpGZA/e7ma5n0wc44FfaSs0vjLkBADc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976063; x=1778580863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZjcVEJCK/cwTNvVbr5CQaLiCjWyMPPoiyKPAoaxLvx8=;
        b=ToQjw/PFB5r8fEO7/4EwMyNU7MxKc2vVOrRKYTNedpebE5CkOzZO5vJ0SPxrv34AV6
         nb+i8QQcyoUE1oa+iWuO/uTrElSR8rpakfLy8Pe7zWFfw6GikSO0TlJwbX5LGMUStmOg
         EDqCsCbEg4WM7XsGiG6lO+pLlJXfh9q0pwo/hD0hbowdu7Yjnw0XebGu0suB3snIXOTU
         B5ojdhviInzTlo/gpXDxqqKKwLCNg3yjcJVyJezqSUIo65zD1REGblfqJHNMhAO9tB5q
         RmgSthcTHoUc1V8bYpEvZ06/fswFy6Ibn2L6CL7jTYxCNNu8oiUsNgqnaH0uog1W6PZl
         lhsA==
X-Forwarded-Encrypted: i=1; AFNElJ/oN9tMVpwzYdt5PK913bMlTUbKvk7yxBuWgvSFueDo98Sox0WSICWjkbQKYcd1TFjcsIt8M50mDsqmIKzVlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJWz/VpX3LBJvWE2AQYRZcz0FVc4tLfBT63VTGcdKr5WquBDbG
	RY0BRRnRh2mLO2+xN1jWJ0QDlVmnG9iAepjrig9dPKwYifdN0oE7t4cmjk+NI0Ik5w==
X-Gm-Gg: AeBDieuBzZtiFlzo/YNdWv3q1NDPnGgrLISr0yuR2YWLnAIvMmTIMrnPUiBzwvP8yci
	ULBEohe7T7gfCmupzwxKXFyb16zHqANVIYkeZAKBEsVzVjbTbvIU3r2NJFUjBTSuyPFDw07WSiI
	5hDpx6UOoAxzeGKeCDJomSgaDweslCI2fCbQ+GVlLxLT3RiCZQA7cFjLJBMtdXR3kdHsoOfYYFy
	Wn4PxN37wpLRg+hb0WUOU5IkZhKbwzmIjGiXMETvy1lsXS+OC/zljiWNS8GaAZ3zkOpvTlrVqcH
	9jnGLgWBaUpVT16MSOF9BKTcEC6OXQV169G11RK4F/tt5ZxmaGEU2Rsw2bpurT16RX/xeqOsTIE
	dvlTumW71JxbAUDlbGY6yVMo9x2LvMhDs13WNaBA95+U2iLILlJCnWC2iUtzZSzrcndxSARAWSA
	767B+qPMh6E6H0PHbj6axKqjm5t7qEbpBRi+YzBy0dHqJjD1O8dMpHAw4kGvnRuzwZ7RoUaGHOp
	31Ij+zKPEuAIwSDLOg=
X-Received: by 2002:a05:6a00:3a19:b0:827:2a07:231d with SMTP id d2e1a72fcca58-839228c94bamr2443788b3a.17.1777976063465;
        Tue, 05 May 2026 03:14:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/16] arm64: dts: mediatek: mt6359: Switch to proper ldo_vcn33_[12] regulators
Date: Tue,  5 May 2026 18:13:52 +0800
Message-ID: <20260505101408.1796563-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_031424_442496_56D2ADB7 
X-CRM114-Status: GOOD (  13.20  )
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

The ldo_vcn33_[12]_wifi and ldo_vcn33_[12]_bt are just two regulator
outputs instead of four. The wifi and bt parts refer to separate enable
bits that are OR-ed together to affect the actual regulator output. The
separate bits allow the wifi and bt stacks to enable their power without
coordination between them. These have been deprecated in favor of proper
nodes matching the output.

Add proper ldo_vcn33_[12] nodes and drop the old ones. No default voltage
ranges are given as they don't make sense, and the existing ranges are
about to be removed. In-tree users of the existing *_(wifi|bt) regulator
nodes are converted over to use the new ones.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Use non-suffixed names (ldo_vcn33_[12]) instead
- Convert existing users
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      | 22 ++++---------------
 .../dts/mediatek/mt8390-genio-common.dtsi     |  4 ++--
 .../dts/mediatek/mt8390-grinn-genio-som.dtsi  |  2 +-
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  6 ++---
 .../dts/mediatek/mt8395-genio-common.dtsi     |  6 ++---
 .../mt8395-radxa-nio-12l-8-hd-panel.dtso      |  4 ++--
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  2 +-
 7 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 45ad69ee49ed..a953fb527b69 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -164,15 +164,8 @@ mt6359_vcn13_ldo_reg: ldo_vcn13 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1300000>;
 			};
-			mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
-				regulator-name = "vcn33_1_bt";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
-			};
-			mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
-				regulator-name = "vcn33_1_wifi";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
+			mt6359_vcn33_1_ldo_reg: ldo_vcn33_1 {
+				regulator-name = "vcn33_1";
 			};
 			mt6359_vaux18_ldo_reg: ldo_vaux18 {
 				regulator-name = "vaux18";
@@ -231,15 +224,8 @@ mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <3300000>;
 			};
-			mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
-				regulator-name = "vcn33_2_bt";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
-			};
-			mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
-				regulator-name = "vcn33_2_wifi";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
+			mt6359_vcn33_2_ldo_reg: ldo_vcn33_2 {
+				regulator-name = "vcn33_2";
 			};
 			mt6359_va12_ldo_reg: ldo_va12 {
 				regulator-name = "va12";
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 2062506f6cc5..ae11cd73e333 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -445,7 +445,7 @@ typec-mux@48 {
 		mode-switch;
 		orientation-switch;
 
-		vcc-supply = <&mt6359_vcn33_1_bt_ldo_reg>;
+		vcc-supply = <&mt6359_vcn33_1_ldo_reg>;
 
 		port {
 			it5205_sbu_mux: endpoint {
@@ -637,7 +637,7 @@ &mt6359_vcn18_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-name = "vcn33_2_pmu";
 	regulator-always-on;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
index 8da47c916313..84064511fa0d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
@@ -58,7 +58,7 @@ &mt6359_vcn18_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-name = "vcn33_2_pmu";
 	regulator-always-on;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index 40b381d4cc35..2e68e997dff3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -592,7 +592,7 @@ &mmc2 {
 	interrupt-names = "msdc", "sdio_wakeup";
 	interrupts-extended = <&gic GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>,
 			      <&pio 172 IRQ_TYPE_LEVEL_LOW>;
-	vmmc-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+	vmmc-supply = <&mt6359_vcn33_2_ldo_reg>;
 	vqmmc-supply = <&mt6359_vcn18_ldo_reg>;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	status = "okay";
@@ -617,12 +617,12 @@ &mt6359_vcn18_ldo_reg {
 	regulator-boot-on;
 };
 
-&mt6359_vcn33_1_bt_ldo_reg {
+&mt6359_vcn33_1_ldo_reg {
 	regulator-name = "vcn33_1_pmu";
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-name = "vcn33_2_pmu";
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index 62c336e21500..4259291a52a3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -701,7 +701,7 @@ &mt6359_vcamio_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
 };
@@ -1216,8 +1216,8 @@ can0: can@0 {
 		clocks = <&can_clk>;
 		spi-max-frequency = <20000000>;
 		interrupts-extended = <&pio 16 IRQ_TYPE_LEVEL_LOW>;
-		vdd-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
-		xceiver-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+		vdd-supply = <&mt6359_vcn33_2_ldo_reg>;
+		xceiver-supply = <&mt6359_vcn33_2_ldo_reg>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso
index 0389c9cb8581..ecc9fd27b82d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso
@@ -29,7 +29,7 @@ panel@0 {
 		compatible = "radxa,display-8hd-ad002", "jadard,jd9365da-h3";
 		reg = <0>;
 		backlight = <&backlight>;
-		vdd-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+		vdd-supply = <&mt6359_vcn33_2_ldo_reg>;
 		vccio-supply = <&mt6360_ldo2>;
 		reset-gpios = <&pio 108 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
@@ -57,7 +57,7 @@ touchscreen@14 {
 		interrupts-extended = <&pio 132 IRQ_TYPE_EDGE_RISING>;
 		irq-gpios = <&pio 132 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&pio 133 GPIO_ACTIVE_HIGH>;
-		VDDIO-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+		VDDIO-supply = <&mt6359_vcn33_2_ldo_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&touch_pins>;
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index bf91305e8e4a..4530434015a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -614,7 +614,7 @@ &mt6359_vcamio_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
 };
-- 
2.54.0.545.g6539524ca2-goog


