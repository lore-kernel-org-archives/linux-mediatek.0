Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC75C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 01:18:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0619C23104
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 01:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0619C23104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5d5tQE+pw9OboKcjuX7U8b3JX0DIkiWpb0dTNdgA1zY=; b=e/8/DBbQcsx/QStfU57kTUf/b
	cy4G2XNWFU9/DCPg9vSXzBg0yiy4YJPcgDLMQY8FpW1oRiKZCVVsZcfmCibXld1jf5DZ4pAaHAS2r
	kw04C8pmAlbOS2ngmgUWVSLnX1r8Blv60bFznp/eaXU9MfCEdp8mhwb7+uoninTnYpsWJGuByeqPX
	oY4GgPfQh8R334Z3U5eSZBvnuoFP/1+JNfyYGke56HDUi7nvdyE1iquH8KgyBLl/oVxPKooGJrxdo
	T59FPjLxHeFS+2L6vFtYudnYZE4+yrG2LvzBZfY1dYdd8FW9nGY7ib7/npBRVn4ahHv3xxWfwgdug
	zJI0OlTOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4D03-0007wh-9V; Tue, 26 Jan 2021 01:18:31 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Czr-0007s1-9f
 for linux-mediatek@lists.infradead.org; Tue, 26 Jan 2021 01:18:24 +0000
Received: by mail-pj1-x102c.google.com with SMTP id cq1so700509pjb.4
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Jan 2021 17:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MZcK/Jikfq4/3qPuHsl4/GCY0KQe1j7Y0TQEvfb5i8=;
 b=nvdo3uVv94+13BzyqdNas3z+qbMzBpHaOdRF61DAhnICJQlAoqgP4IUKqOjXm/Pekj
 VfcYNpJya5TS4YLBmKG3NqozoMwrJP1VYiNcljGrKGhtnXAnXxycPldQR1ITy8Wr7VKR
 dxAXFWM2qISsNskt2aXA2PwYChFtzFIJuakj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MZcK/Jikfq4/3qPuHsl4/GCY0KQe1j7Y0TQEvfb5i8=;
 b=BlvBr1lyv19wOTsk8qVkA7LqcoaSKy4+fr/ROlokF/xDPCmOqscLK1ixDEd8QynmKw
 eoVuvJifoHWWf3IBWRvaWZFtNLJP+LtBceMRZiNIjdqOiAD0nMv0Lla1fSs0TTNYvt0o
 KEr59Oby6t5Cl32JTVPZTTmynLks/qeBbkPR01W+YneCfGQlbJXGkh0ClGzl1WOH7Kxb
 vhILg66Jcg/Sk1vFU/dFZRB4jq56DZ8vgx63EkMlrbATBJi1ufckjA/Z06ckUTKfL88L
 2W9ycI5OO/WkOhVZMClrPz2V0FUSMTzX54t6ZfRc3ebxwpS4hBQXs/czppeyF0+Mc/hQ
 nDXQ==
X-Gm-Message-State: AOAM530wk4UbevkY1kP6fFRyN/NQ/yb2tenQBfKlrQ4j1FwpUcMtyxVw
 htswxS7hRn+4Htif7O4CoDb4wQ==
X-Google-Smtp-Source: ABdhPJxrn0j7lZ3wKb5X4YSyB87XaVDn1bKvzM0KGnUMLv4HqJPROOVEFmDoZxDDsLvPK9wCG5GTjg==
X-Received: by 2002:a17:902:ec04:b029:de:9184:7247 with SMTP id
 l4-20020a170902ec04b02900de91847247mr3192407pld.57.1611623896956; 
 Mon, 25 Jan 2021 17:18:16 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:50cc:9282:4fdd:3979])
 by smtp.gmail.com with ESMTPSA id k9sm522248pji.8.2021.01.25.17.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 17:18:16 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v11 2/4] arm64: dts: mt8183: Add node for the Mali GPU
Date: Tue, 26 Jan 2021 09:17:57 +0800
Message-Id: <20210126091747.v11.2.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210126011759.1605641-1-drinkcat@chromium.org>
References: <20210126011759.1605641-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_201819_447967_7B04A40D 
X-CRM114-Status: GOOD (  13.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 boris.brezillon@collabora.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
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

Changes in v11:
 - mt8183*.dts: remove incorrect supply-names

Changes in v10: None
Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6:
 - Add gpu regulators to kukui dtsi as well.
 - Power domains are now attached to spm, not scpsys
 - Drop R-B.

Changes in v5:
 - Rename "2d" power domain to "core2" (keep R-B again).

Changes in v4:
 - Add power-domain-names to describe the 3 domains.
   (kept Alyssa's reviewed-by as the change is minor)

Changes in v3: None
Changes in v2:
 - Use sram instead of mali_sram as SRAM supply name.
 - Rename mali@ to gpu@.

 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index cba2d8933e79..1cfbea5a0101 100644
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
index bf2ad1294dd3..a38315b604df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -249,6 +249,11 @@ &cpu7 {
 	proc-supply = <&mt6358_vproc11_reg>;
 };
 
+&gpu {
+	mali-supply = <&mt6358_vgpu_reg>;
+	sram-supply = <&mt6358_vsram_gpu_reg>;
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7..5430e05e18a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -964,6 +964,111 @@ mfgcfg: syscon@13000000 {
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
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
