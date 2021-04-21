Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86274C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 05:31:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1FB86141E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 05:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1FB86141E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LFWeomWN9mYeIgSm0GmmpYPLHr7O9CgkqwUMg+TL06M=; b=ggY4qUJc2iRcNAIPQWmK2O7G1
	ofNMufRdXpC65ktmBXVAl8H2ShW7914OVAXeQvD4d1X4hwns+aILVeYBOW1eBXNVtGnqR54hCBIf8
	xVfUnvvuYw806pc1at9fxsHjDMsbT8GnW5TvB+USM5t04guCUmMo1LPOIsz8fwmS5ElUp3PybadVx
	2ekn0dKK3Mt/VjvAvToEu9BnGpVGDJOdOyGnF1xRoBPpWtl5u7/oRL6TlC4WNStSbzdiXtBdZq7wU
	sD0pL9OfQ0M42MnyE2NPccnam03i4RDhsb2xscg5YKnXjgjCOnp5zbGW9RN9tE8fPPUPzBvmXD/8i
	IARcOE5DQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ5SD-00DiBf-Aw; Wed, 21 Apr 2021 05:31:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ5QF-00Di59-UP
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 05:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=d2Ex8H/B2lVYbCEFqXrDb6QEUdQirbnByEdkR8Qupd8=; b=4Uh4wM6BkW+KH45eXqLIdCq02W
 b5rbMRSxL4EkghIP8/wYzpYj3nh5f3YxiafVO0zqTlPMhCSxd8ZaM/a5XgqteCC0l0ibQTgdKm3kF
 mME2AkKRSj/Gi+bsdArIjZfVAZEq2KAkLbsbCD7RRTHQp4xotoPC1WM2pgkFQxSrjaJvKzr+A2XKQ
 PXStc+m07a6Ob99lz4MwaKKxrvw5Doij+gLMIuF+Wieinwvodkp1OFzK8LsarQnbtkvFNzGm8tURj
 xLWQl1Ois4XbXrX6eydMFO7Fl6wXH8zLTStTLnx1HRVbQ9UlmS1GpH4A3yhnNOAysljZakU85zCUF
 mnH0RfuQ==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ5QC-00Cbyi-Ro
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 05:29:10 +0000
Received: by mail-pl1-x629.google.com with SMTP id e9so4000538plj.2
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 22:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d2Ex8H/B2lVYbCEFqXrDb6QEUdQirbnByEdkR8Qupd8=;
 b=ajQHA8APYObyWB5oqbzUMYZb1Ea5Ajix/xQg+3MMIW35RwIf61BVnbWO9GcOwFOp3v
 ob8Hmpuvv626h+CHKlOAcAIY0KdK46eyzVXH7oAodZtC49OvfQy8oGxzjMrEP7hr3bYU
 VaW628+eilqnSrrS5rRMZ19qGgOZ/KgDsLh/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d2Ex8H/B2lVYbCEFqXrDb6QEUdQirbnByEdkR8Qupd8=;
 b=nQl0PIznFuZ5SaQACufBBLDREJzZsfLPNhBwIkE6l1QUeUq4w2qcIqwmv0bcmJN3Q8
 ka7fuJft3l/nq2K0BRfGx7TCpwjidJtvJfuAHq9Wh7TeLpuTppDe0pDghIq3tsCn3YTY
 rtVAneBZQDKqaSHoKeGJdAvvQo7lSWT5uDmuhYN4yqfk2zscNF9jDEvyY/vMOXJoU/EC
 Gfduq88JsUi4wqfVp+/UkXkT/HNbFN7Ivw5AWRbtF64Nk0BR7Zui8xPW5MGbNf+JwHkj
 SBL9k+adghZcUi1NMCQqpuEkK9NKoO94m3mwMweiTMbW3/9mPbMzFF7YqO1H4kAW430v
 Exuw==
X-Gm-Message-State: AOAM532epwEo6/MHX2oXwvx3c8763ADKebRx9EfyTYyRgImEUSRjhE2A
 pKPGmv4YVBdJcPBIq3ZdhFtPZw==
X-Google-Smtp-Source: ABdhPJwRyhKP+Lo3SrnymSVn1o37Yt6+zT9t+RvWrGrqorV8znxZqGzETqdJcX8lJDuiPyr/zf5pSg==
X-Received: by 2002:a17:902:d48c:b029:ec:b2c9:62c5 with SMTP id
 c12-20020a170902d48cb02900ecb2c962c5mr9546958plg.51.1618982948171; 
 Tue, 20 Apr 2021 22:29:08 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:b3e5:49c0:4843:2bbe])
 by smtp.gmail.com with ESMTPSA id b6sm602537pfa.185.2021.04.20.22.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 22:29:07 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: fshao@chromium.org, hsinyi@chromium.org, hoegsberg@chromium.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, boris.brezillon@collabora.com,
 Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v13 2/4] arm64: dts: mt8183: Add node for the Mali GPU
Date: Wed, 21 Apr 2021 13:28:53 +0800
Message-Id: <20210421132841.v13.2.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210421052855.1279713-1-drinkcat@chromium.org>
References: <20210421052855.1279713-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_222908_922556_4C087633 
X-CRM114-Status: GOOD (  14.05  )
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

Add a basic GPU node for mt8183.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
The binding we use with out-of-tree Mali drivers includes more
clocks, this is used for devfreq: the out-of-tree driver switches
clk_mux to clk_sub_parent (26Mhz), adjusts clk_main_parent, then
switches clk_mux back to clk_main_parent:
(see https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#423)
clocks =
        <&topckgen CLK_TOP_MFGPLL_CK>,
        <&topckgen CLK_TOP_MUX_MFG>,
        <&clk26m>,
        <&mfgcfg CLK_MFG_BG3D>;
clock-names =
        "clk_main_parent",
        "clk_mux",
        "clk_sub_parent",
        "subsys_mfg_cg";
(based on discussions, this probably belongs in the clock core)

This only matters for devfreq, that is disabled anyway as we don't
have platform-specific code to handle >1 supplies.

(no changes since v12)

Changes in v12:
 - Add gpu node to mt8183-pumpkin.dts as well (Neil Armstrong).

Changes in v11:
 - mt8183*.dts: remove incorrect supply-names

Changes in v6:
 - Add gpu regulators to kukui dtsi as well.
 - Power domains are now attached to spm, not scpsys
 - Drop R-B.

Changes in v5:
 - Rename "2d" power domain to "core2" (keep R-B again).

Changes in v4:
 - Add power-domain-names to describe the 3 domains.
   (kept Alyssa's reviewed-by as the change is minor)

Changes in v2:
 - Use sram instead of mali_sram as SRAM supply name.
 - Rename mali@ to gpu@.

 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |   5 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 4 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index edff1e03e6fe..7bc0a6a7fadf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -42,6 +42,11 @@ &auxadc {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&mt6358_vgpu_reg>;
+	sram-supply = <&mt6358_vsram_gpu_reg>;
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c_pins_0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..e4e54be1c2b2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -279,6 +279,11 @@ dsi_out: endpoint {
 	};
 };
 
+&gpu {
+	mali-supply = <&mt6358_vgpu_reg>;
+	sram-supply = <&mt6358_vsram_gpu_reg>;
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 0aff5eb52e88..ee912825cfc6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -68,6 +68,11 @@ &auxadc {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&mt6358_vgpu_reg>;
+	sram-supply = <&mt6358_vsram_gpu_reg>;
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c_pins_0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b6b77a..c75fdeea8aa4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1118,6 +1118,111 @@ mfgcfg: syscon@13000000 {
 			#clock-cells = <1>;
 		};
 
+		gpu: gpu@13040000 {
+			compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
+			reg = <0 0x13040000 0 0x4000>;
+			interrupts =
+				<GIC_SPI 280 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_SPI 279 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "job", "mmu", "gpu";
+
+			clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
+
+			power-domains =
+				<&spm MT8183_POWER_DOMAIN_MFG_CORE0>,
+				<&spm MT8183_POWER_DOMAIN_MFG_CORE1>,
+				<&spm MT8183_POWER_DOMAIN_MFG_2D>;
+			power-domain-names = "core0", "core1", "core2";
+
+			operating-points-v2 = <&gpu_opp_table>;
+		};
+
+		gpu_opp_table: opp_table0 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+				opp-microvolt = <625000>, <850000>;
+			};
+
+			opp-320000000 {
+				opp-hz = /bits/ 64 <320000000>;
+				opp-microvolt = <631250>, <850000>;
+			};
+
+			opp-340000000 {
+				opp-hz = /bits/ 64 <340000000>;
+				opp-microvolt = <637500>, <850000>;
+			};
+
+			opp-360000000 {
+				opp-hz = /bits/ 64 <360000000>;
+				opp-microvolt = <643750>, <850000>;
+			};
+
+			opp-380000000 {
+				opp-hz = /bits/ 64 <380000000>;
+				opp-microvolt = <650000>, <850000>;
+			};
+
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+				opp-microvolt = <656250>, <850000>;
+			};
+
+			opp-420000000 {
+				opp-hz = /bits/ 64 <420000000>;
+				opp-microvolt = <662500>, <850000>;
+			};
+
+			opp-460000000 {
+				opp-hz = /bits/ 64 <460000000>;
+				opp-microvolt = <675000>, <850000>;
+			};
+
+			opp-500000000 {
+				opp-hz = /bits/ 64 <500000000>;
+				opp-microvolt = <687500>, <850000>;
+			};
+
+			opp-540000000 {
+				opp-hz = /bits/ 64 <540000000>;
+				opp-microvolt = <700000>, <850000>;
+			};
+
+			opp-580000000 {
+				opp-hz = /bits/ 64 <580000000>;
+				opp-microvolt = <712500>, <850000>;
+			};
+
+			opp-620000000 {
+				opp-hz = /bits/ 64 <620000000>;
+				opp-microvolt = <725000>, <850000>;
+			};
+
+			opp-653000000 {
+				opp-hz = /bits/ 64 <653000000>;
+				opp-microvolt = <743750>, <850000>;
+			};
+
+			opp-698000000 {
+				opp-hz = /bits/ 64 <698000000>;
+				opp-microvolt = <768750>, <868750>;
+			};
+
+			opp-743000000 {
+				opp-hz = /bits/ 64 <743000000>;
+				opp-microvolt = <793750>, <893750>;
+			};
+
+			opp-800000000 {
+				opp-hz = /bits/ 64 <800000000>;
+				opp-microvolt = <825000>, <925000>;
+			};
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8183-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
