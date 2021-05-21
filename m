Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25351C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 12:01:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BC7C6008E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 12:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BC7C6008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8WbLkCZ/5uvQUfxtmgAWsuc7T2j9v5hL4i2IIoCS2ms=; b=f9zjDlD4i2lA4bGinNbns3CsgI
	yVmG4AeZA5XGu+oyYA5FkEzI+WzpR03D9xufZ0Vbg51hs+wlRDjKdhH/EsLPAB3V8YJDMDq3kEDxw
	2XDRWWU2JvLhoCQTt43GVxLF4Co0OUXtUCJLFrFuiicc38BJPX0zM77rNkNClMkKC1noZUerMoqme
	UT1UTBA9cKf7Qnqug/wVo/cePKnOXroRGMtAjXJ7XwwXY7tWzL6P1020Z4OdrnJoyQXJpGce5mmA5
	AiY1w4RrNa0HHbYjhjPygIgZeN3dzcQYssnBljJS/6tlPi/4tYrkXcfdjZVBMM0xoj824Sh+3nfiT
	4KInur3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk3px-005Fhf-N0; Fri, 21 May 2021 12:01:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk3pk-005FgH-MX
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 12:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=yKit9IhNnje4u7TM5jWeNBt4R4Vn/cra4nG2xzvb8rE=; b=wfXRo0qJXUb2FuSF+9U7XkINiJ
 TFtqFwnidnzma2dCBrXb1UM6yyL59rfUaZfpMLoVDoK5Pc4VEjmXPnNQ10mwX9MTpdFSocqOt8vNE
 QqOIQRT6lO9EKkCUvzNkKR08iXvNbIYUORpJa69xXQZ9AKMLIfoHAACIg3vtZh6p1ZLzReyrZjrCH
 e62sFGM5fYyUQ4WJXCFLDVyryJ1fcxsOEv7iPzYeqgCtqT9S3OlEqRzKcrHM8mSJxzRRwoDQNkr7Y
 2qhTAcloSzITP65kJ0TiXA8AxoSFgg7x4EjTmev/Rk/U2zzTOR5XyfG+YCwWdD0q+IPbMbYmFVVPx
 3R2FF8pQ==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk3ph-00H5GP-B3
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 12:00:51 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d78so13873281pfd.10
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 05:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yKit9IhNnje4u7TM5jWeNBt4R4Vn/cra4nG2xzvb8rE=;
 b=H7ydYfvqb2QBTbICOM+wM1WoaTY7UAWGKW2ehZY8QGtueacpOSgxqMsNwUA/BidKo1
 gw8dCHmnRA0vjV4FWbJI1QAafzodt6z5Ii+9kleUUDzpu8CROEI85v4vPDdvOwAv+O4z
 wwU2VxlHq6en5m9b3NQLzsMunYO/SFjZ30OYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yKit9IhNnje4u7TM5jWeNBt4R4Vn/cra4nG2xzvb8rE=;
 b=CS8pRoeTpgMnn00Ri5ZIejoGyy4f6pEwagv00e+cP55PZeWoJXQtWtCtMDV/2eoOlW
 L2PL6OkC5o8GwUZBHlV7S4aSWAMjxHZc1VkxbO9YlVvCceFGJsyvThpEvm/gf1vy+cPL
 lLs55PfRc81hY/fUgF996v8+K9nfIFFrbdKEWMHR2+m6k9evqS/KzgIy2zA0H/X4f1dS
 rk00BMaj7WumsWpuJb2kchK6vjJ/3LHDUIq3oYYsbRsZ3CjYU91MNd24FeGV7dQaXo8z
 hsK5ZOaF9cUJdSDHPkP6maU6uZ88LbuaTbf8xhKAvyTinEUJ2r5ls0+g9cg6kDdb0BZ9
 R0Ew==
X-Gm-Message-State: AOAM533XVk1IoQQ7aFG/d8IqwXh4bZBdh5cFWzw3hM1RxbYjk4FVa9ZL
 WBTHLMmPrEDz0daE/Fvc3rMdjQ==
X-Google-Smtp-Source: ABdhPJzl+MBeN4cfrorcKpDgECjxpGGvwdcbzjuMEb1xEYIHsqFmyeAsl+FYxQNIIG0QO73USrwnFw==
X-Received: by 2002:a63:9316:: with SMTP id b22mr9704917pge.70.1621598447240; 
 Fri, 21 May 2021 05:00:47 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:95:4:4821:2312:cddc:dd0f])
 by smtp.gmail.com with ESMTPSA id 21sm4077399pfh.103.2021.05.21.05.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 05:00:46 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, hoegsberg@chromium.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, boris.brezillon@collabora.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, fshao@chromium.org,
 hsinyi@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v14] arm64: dts: mt8183: Add node for the Mali GPU
Date: Fri, 21 May 2021 20:00:41 +0800
Message-Id: <20210521200038.v14.1.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_050049_422744_2FDF54A5 
X-CRM114-Status: GOOD (  15.00  )
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

Add a basic GPU node for mt8183, as well as OPP table.

Note that with the current panfrost driver, devfreq is not
actually functional, as the we do not have platform-specific
support for >1 supplies. Also, we are missing code to handle
frequency change, as the GPU frequency needs to be switched
away to a stable 26Mhz clock during the transition.

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

Changes in v14:
 - Move gpu_opp_table from soc to root "/" node of dts.

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
index c5e822b6b77a..0afd351f9a9b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -197,6 +197,91 @@ CLUSTER_SLEEP1: cluster-sleep-1 {
 		};
 	};
 
+	gpu_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <625000>, <850000>;
+		};
+
+		opp-320000000 {
+			opp-hz = /bits/ 64 <320000000>;
+			opp-microvolt = <631250>, <850000>;
+		};
+
+		opp-340000000 {
+			opp-hz = /bits/ 64 <340000000>;
+			opp-microvolt = <637500>, <850000>;
+		};
+
+		opp-360000000 {
+			opp-hz = /bits/ 64 <360000000>;
+			opp-microvolt = <643750>, <850000>;
+		};
+
+		opp-380000000 {
+			opp-hz = /bits/ 64 <380000000>;
+			opp-microvolt = <650000>, <850000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <656250>, <850000>;
+		};
+
+		opp-420000000 {
+			opp-hz = /bits/ 64 <420000000>;
+			opp-microvolt = <662500>, <850000>;
+		};
+
+		opp-460000000 {
+			opp-hz = /bits/ 64 <460000000>;
+			opp-microvolt = <675000>, <850000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <687500>, <850000>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+			opp-microvolt = <700000>, <850000>;
+		};
+
+		opp-580000000 {
+			opp-hz = /bits/ 64 <580000000>;
+			opp-microvolt = <712500>, <850000>;
+		};
+
+		opp-620000000 {
+			opp-hz = /bits/ 64 <620000000>;
+			opp-microvolt = <725000>, <850000>;
+		};
+
+		opp-653000000 {
+			opp-hz = /bits/ 64 <653000000>;
+			opp-microvolt = <743750>, <850000>;
+		};
+
+		opp-698000000 {
+			opp-hz = /bits/ 64 <698000000>;
+			opp-microvolt = <768750>, <868750>;
+		};
+
+		opp-743000000 {
+			opp-hz = /bits/ 64 <743000000>;
+			opp-microvolt = <793750>, <893750>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <825000>, <925000>;
+		};
+	};
+
 	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupt-parent = <&gic>;
@@ -1118,6 +1203,26 @@ mfgcfg: syscon@13000000 {
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
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8183-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.31.1.818.g46aad6cb9e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
