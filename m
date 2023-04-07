Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0264C76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KFcOYEAi46ZIl7QCtzcN5XD6VlwA2hJvytxtJEenkQ=; b=RL9zjmowWrGNdWFsYwTEUaAbO5
	IdwVWYDsl6wbJSYh0C3FN7EpbypHP8y0Wv35WGCQidPb80IQowTfBKaTGQ6mI1h/xuOn/kOuDSwIw
	p0l0teSzAbSeLITo4+5ahzvP2Z3U4c6tHo4cgZ6dm32mnOvw8m0qnr8qhD226U4nWyzJYqgUlVkA4
	0HjB3m3B/QGHGNw2pYishOyXcYt2kN4pzDCT5NvY8+t8vqtMMZi29unUjqNSlAb4QnYwnn1HIHdJ0
	E/zQsyVGL8Ih7RZL64UaD+pgyW4MOg0/GaMLQuiTtq9yUMP+60mbSCGuMvTfLVTiKM+Xnn7JWbK31
	u9cIqWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjax-009s2e-2b;
	Fri, 07 Apr 2023 10:45:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjav-009s24-2s
	for linux-mediatek@bombadil.infradead.org;
	Fri, 07 Apr 2023 10:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3KFcOYEAi46ZIl7QCtzcN5XD6VlwA2hJvytxtJEenkQ=; b=dCJ9FIFRqpAcgqdN6ylg47M3Fc
	mbKl9zm4pHvJ/rf3gGpFHo+o+/WeDmn56lgQsAt69aMGeTiy4lj//GGBCNJPpFV+0TtDc3/C5uQI5
	Xg5kNMnlw/+BZ6SzXrm5i7Md3Nhrvq4BRl+6KX87tW20h46uo6GP/Uzbnqcsr7kNqN84r5ccStN0b
	q+bYrdEvNmG3EDTtHvYFgsl3keINlbaH33bqHnNnpeh+f5yCLsR0JEWmyBry+2NHC+uSaqtGJnnqf
	H6jfnqymYbFR01TaICKqVRGNDHmQtG+p72e3bcJNQOenUSSe+iQGAogs0R0HF7NseHiPwNeDwyFzX
	QS/d+/ag==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUQ-00AzDU-2Z
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:36:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id j11so2178008wrd.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680860070; x=1683452070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KFcOYEAi46ZIl7QCtzcN5XD6VlwA2hJvytxtJEenkQ=;
        b=rC8CFk78Ear9yw17oS85VokG+Iofo1AOflOUpNSVcFrPRfhKZChYgbY6Lc0R8pO0/G
         IqeuRobc0vx2r+nYVnR6mn7zvus2uJjdS5yKMeGei6Uylo1BRVvuOcsZjWdKaTdTwKq0
         VAkCfLENFoIqZfkMuBrP6Lh1c1soi+HmmOBcEjx2p+3wzcDkBLw2MjNORRUytkavLRmK
         3blAnIADp7fkoWhhihP/damDXlGg+dmuuswb3j0JYJUWTH01az0CaXOSe8j8ySkNUxqj
         E7fGc5OfNwPyukrAwoxPiUzFvalAGSP5hiUTrUL6bIBdyoMPkjVm78cIVC0UPM6mKri9
         33eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680860070; x=1683452070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KFcOYEAi46ZIl7QCtzcN5XD6VlwA2hJvytxtJEenkQ=;
        b=MrAuhJTeoghZDRPxCZy4Hv5QcgW479v3WA2uYa5x99vVbGSMRhmWtdjEgsGCOQC2AS
         PD1fkMyCvNSiqa2FRPSaU5om3uW80lQ+MWI/IbYSvE6Ue/a25dIxOlteNKPkeslwNT/9
         DyANmiP5cV9aamCibP/1vleWDholkCNoL/nrRMdAiU+PY9rttLnzNznfnbRwE5su+yXs
         LYI9AMrnhI9mByTN9pmNEcYtbGRecFKRZbafO/VJ/L5cwkVMr3novtcS2XC730w1piog
         ygEH9AEf5s1VtCn+7SalcR4mFvBSIJvbwKFjq2KjvteGUjr0ogkcOFM3g1b4NbQxkG1Q
         nKQg==
X-Gm-Message-State: AAQBX9fCjVL67mV5O+e5TtY0ZyCmdKReLjISZ5yu8qdpNYHl/aJ2/bfd
	CRBCUcEW0rOJJjxVsDneqMLvWQ==
X-Google-Smtp-Source: AKy350aG9du0uwosq+FqixFFe8BXT07SgAILsAGexfDRZ7ImSOnkQuzCW7B0NCut1ljngJTh+NOpxA==
X-Received: by 2002:a5d:69c8:0:b0:2ef:b341:4a2d with SMTP id s8-20020a5d69c8000000b002efb3414a2dmr605249wrw.24.1680860070539;
        Fri, 07 Apr 2023 02:34:30 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id s13-20020a5d510d000000b002d64fcb362dsm4020432wrt.111.2023.04.07.02.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:34:30 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 11:34:15 +0200
Subject: [PATCH v3 4/7] arm64: dts: mediatek: add power domain support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v3-4-97e19ad4e85d@baylibre.com>
References: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
In-Reply-To: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4617; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=8SGgl6AnSEaP0TiVCLT5CLjF1FPWuK/os69MqWsUi8E=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL+OhYJB2BSSOnaWMDYSq5zrvNqXrrgEb/LQGOuDr
 XDl98PCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/joQAKCRArRkmdfjHURfwwEA
 CQXrE5TNxhv9xOA85ddxAywpvG6jv8pV5Eiy5GCVg9QUu+fCzZOjMd23dJyCqOgiPwHGwpTAbmCLco
 nfJaygKL70cBOElQTB+bkcDDyNmwa7yVbxU5fdFQNfA6gyASnf21NRskxCPnebZBHfRRY+U+pKGQAy
 OvrpoxdmY4e04GcN0V/LCXCT7GAQJOtar4fRJRwjXPh/e9qmLHm2Vanp6tDsV8zLkG48Xu+0492Kyn
 BdRX6qDKOuin6nC+vdkvS26MfdzelcqaB+DuhxJzgLYWSaAf/KQwKqNq4KyLJfxGveP3b3Ok89GgTg
 wy3WqwlsP8VSt4No7qqW3xaDQXmEuqmzHVlQekIgtVEeOT0N9gCit5iC+jUT4YM9giLkP9bRAPSP2S
 kgAwCEDS3MiLR85sb+EBreauTm7iIvrbzmOUXylDsjj9kjVAa/Pa8f97KiuXus1asSOYhUyP3/z/OP
 /x61gEjFyIpdFepotbTAT/xO5Crb0/6S7rEmf6YzNA5mtHOiiI8x3Mcsgrfihv05YkfAwqSFvpprER
 48Uo2aqssvj7DcXNeujgHi8cscdQn9vyev5HEHN0de614iriB1fjLd396gQ0QznL0n/QbgEpsiiWZf
 z1Zh9agJ9HI/o/6McjhJ2sy/TsUsTs3dMr6mvFukpx/mt5v7E2MGJ53a3sRw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_103441_213294_C581DE3C 
X-CRM114-Status: GOOD (  11.60  )
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

The following power domain are added to the SoC dts:
- MM (MultiMedia)
- CONN (Connectivity)
- MFG (MFlexGraphics)
- Audio
- Cam (Camera)
- DSP (Digital Signal Processor)
- Vdec (Video decoder)
- Venc (Video encoder)
- APU (AI Processor Unit)

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 110 +++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 386ab8902b55..0e4fa69a2415 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/mediatek,mt8365-power.h>
 
 / {
 	compatible = "mediatek,mt8365";
@@ -282,6 +283,115 @@ syscfg_pctl: syscfg-pctl@10005000 {
 			reg = <0 0x10005000 0 0x1000>;
 		};
 
+		scpsys: syscon@10006000 {
+			compatible = "mediatek,mt8365-syscfg", "syscon", "simple-mfd";
+			reg = <0 0x10006000 0 0x1000>;
+			#power-domain-cells = <1>;
+
+			/* System Power Manager */
+			spm: power-controller {
+				compatible = "mediatek,mt8365-power-controller";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#power-domain-cells = <1>;
+
+				/* power domains of the SoC */
+				power-domain@MT8365_POWER_DOMAIN_MM {
+					reg = <MT8365_POWER_DOMAIN_MM>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>,
+						 <&mmsys CLK_MM_MM_SMI_COMMON>,
+						 <&mmsys CLK_MM_MM_SMI_COMM0>,
+						 <&mmsys CLK_MM_MM_SMI_COMM1>,
+						 <&mmsys CLK_MM_MM_SMI_LARB0>;
+					clock-names = "mm", "mm-0", "mm-1",
+						      "mm-2", "mm-3";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+					mediatek,infracfg-nao = <&infracfg_nao>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					power-domain@MT8365_POWER_DOMAIN_CAM {
+						reg = <MT8365_POWER_DOMAIN_CAM>;
+						clocks = <&camsys CLK_CAM_LARB2>,
+							 <&camsys CLK_CAM_SENIF>,
+							 <&camsys CLK_CAMSV0>,
+							 <&camsys CLK_CAMSV1>,
+							 <&camsys CLK_CAM_FDVT>,
+							 <&camsys CLK_CAM_WPE>;
+						clock-names = "cam-0", "cam-1",
+							      "cam-2", "cam-3",
+							      "cam-4", "cam-5";
+						#power-domain-cells = <0>;
+						mediatek,infracfg = <&infracfg>;
+					};
+
+					power-domain@MT8365_POWER_DOMAIN_VDEC {
+						reg = <MT8365_POWER_DOMAIN_VDEC>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@MT8365_POWER_DOMAIN_VENC {
+						reg = <MT8365_POWER_DOMAIN_VENC>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@MT8365_POWER_DOMAIN_APU {
+						reg = <MT8365_POWER_DOMAIN_APU>;
+						clocks = <&infracfg CLK_IFR_APU_AXI>,
+							 <&apu CLK_APU_IPU_CK>,
+							 <&apu CLK_APU_AXI>,
+							 <&apu CLK_APU_JTAG>,
+							 <&apu CLK_APU_IF_CK>,
+							 <&apu CLK_APU_EDMA>,
+							 <&apu CLK_APU_AHB>;
+						clock-names = "apu", "apu-0",
+							      "apu-1", "apu-2",
+							      "apu-3", "apu-4",
+							      "apu-5";
+						#power-domain-cells = <0>;
+						mediatek,infracfg = <&infracfg>;
+					};
+				};
+
+				power-domain@MT8365_POWER_DOMAIN_CONN {
+					reg = <MT8365_POWER_DOMAIN_CONN>;
+					clocks = <&topckgen CLK_TOP_CONN_32K>,
+						 <&topckgen CLK_TOP_CONN_26M>;
+					clock-names = "conn", "conn1";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+
+				power-domain@MT8365_POWER_DOMAIN_MFG {
+					reg = <MT8365_POWER_DOMAIN_MFG>;
+					clocks = <&topckgen CLK_TOP_MFG_SEL>;
+					clock-names = "mfg";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+
+				power-domain@MT8365_POWER_DOMAIN_AUDIO {
+					reg = <MT8365_POWER_DOMAIN_AUDIO>;
+					clocks = <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+						 <&infracfg CLK_IFR_AUDIO>,
+						 <&infracfg CLK_IFR_AUD_26M_BK>;
+					clock-names = "audio", "audio1", "audio2";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+
+				power-domain@MT8365_POWER_DOMAIN_DSP {
+					reg = <MT8365_POWER_DOMAIN_DSP>;
+					clocks = <&topckgen CLK_TOP_DSP_SEL>,
+						 <&topckgen CLK_TOP_DSP_26M>;
+					clock-names = "dsp", "dsp1";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+			};
+		};
+
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8365-wdt",
 				     "mediatek,mt6589-wdt";

-- 
2.25.1


