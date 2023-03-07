Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4A8C6FD1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 14:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxwMXMVHzfX0be9xjh/v8FRir/bg4Z2FDQF8dxvqQ/g=; b=Wr5MTtkPgG3VTIXgL+tmKn+99B
	TS5PNUIHf8Ps9Jm6CZ7hk4Pwy04lupb1q13aK+kiHj6EBNWlLjJwgu2jtjWCTNpQLKhTS1RCS1wN4
	wMd5tHHgIP/BB2fyagSMcARjFxL1xeb8w6bg25l5D5meuOZgGauEBpr9AoojFsxALcarYDqs1NRZg
	Gt6LU8JPNRjKaGBlRzjPEEgYgERWa6lhyFauC4LipEWgi3dbKaYYFMQS6OoW8fdbn98SWYgi/AXMC
	BTJxTuxykZCEeZ8jXcO0OtuqUdmH01hCGzSoqZi+5afrkQrfKEyNf/KhEg5EZMBJR/yP7hiN/7YC1
	X4JiAcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXvE-000cSu-B9; Tue, 07 Mar 2023 14:04:08 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXeN-000V3l-E0
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:46:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id l1so12129354wry.12
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678196799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxwMXMVHzfX0be9xjh/v8FRir/bg4Z2FDQF8dxvqQ/g=;
        b=5nT27x+qmjL5nvB/W87v9ODOkKtFTZyNzbIWkozBSPXT2hOsgHLmbfHIBKpmUvHlWl
         Z4qKfY3vTcSh5cayVVhsEhFWuTsXji6+24aEvugOMFlNyzuDy/cEAXFDovF1NHGakPp7
         RulkzeOCub7tOH7BuqgTYV28oaOUGG0PtpjZs3TPHlXNvyjwJGABLLzdRNeJebO7IEq0
         nvXZ0EWfI3FPPRwVmqLih1MV+M5k6Tewtbhef/dPkHk/6dOc3UDmEMdn79zX+ERrtOzY
         wgQo3jQoffKn6y4pRavLY91Zzhd4c32FdQE7Anv13x42fIK2sitDOanU3kO2kLUH5vCv
         HEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxwMXMVHzfX0be9xjh/v8FRir/bg4Z2FDQF8dxvqQ/g=;
        b=o9iO6HPGb6P1xcCRktwYw4dNLM6+xB6CBLVgPXbB37Tfgte8BKHXb8zN1Ewg9RNG8k
         IGtJn3vzf+HyepGCqHIDKQQ2WGqUTCkA2gNdtjXNAapC756DyviuPkKRajvVWwOPSguT
         cN3Zb5OaD+iL8LbgtFIKVWuiDqavdX3W15SaUCGiPszR3/9ZwW03ICCXr4ZgSmLh9Hq0
         ScrhzmnWdomsLTei8jd+/i9YcV+LaLPUSxP+HGoDN2bui+L56MHoGn3yh8qk0Y75h/sQ
         KzbNpjI0N50G4sf5FcmNgi61wpkMvka1SUE/Z9qkTRmKC8PXRFMl1y9N69xZ0EzBrroE
         gAbw==
X-Gm-Message-State: AO0yUKWmUR3aplswV6eMfpwNU8c2B8pmx4y9ZEpBb+1yy6/3Zg/ns7FN
	OrzDCv8EQgkuQmmoDMdHfnRYTQ==
X-Google-Smtp-Source: AK7set8STd6s2B3fdSv7zGYq3k9bbGhTL6AoRZSF/YiaVRwon0fmmQFX7C18oa/Eow02IpFUa4f70g==
X-Received: by 2002:adf:ff83:0:b0:2c7:1c8a:9183 with SMTP id j3-20020adfff83000000b002c71c8a9183mr8308888wrr.60.1678196799309;
        Tue, 07 Mar 2023 05:46:39 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o13-20020a5d670d000000b002c8476dde7asm12657607wru.114.2023.03.07.05.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:46:38 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:46:28 +0100
Subject: [PATCH 3/6] arm64: dts: mediatek: add power domain support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230207-iommu-support-v1-3-4f0c81fd52c1@baylibre.com>
References: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
In-Reply-To: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5185; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kZCaTFt0UdZkt9fKcKs/p0bzAc4OINn/W3im+K90/as=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkB0A7qva7P3Bh7A1qd+cuwNcGDeb8Wzyqd0IYjCiM
 T0kB8kCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAdAOwAKCRArRkmdfjHURbRRD/
 45q98Nji9hak/YdT3wIJhgy3uiIYGyWUl3xuNAbwsowRTdbL5bjIDAxZA7VXbL7St8XSOIC0eOPILa
 mS8cgcsI7zTnm9N08yH5PoCaq8wH3S7C3SlgoXvVxYeAfHHjaVElL0qKq96BaXeATqNU02d7pYMVFd
 w2exD/UDhnSzeAsnVtWSAV3jV0Ev33j3ZrVEHCCpMTBCiBPVisBg1F5waLF/jgU9tm0oc7LIMP4pS5
 5d3KsuvzpaNpCG0SnviIuPWWJn7uPTtlBknqJ2UNqeoyDHirOxoT4fnf1Bbnr6n5+0/HL1SpgO+N1e
 OZs/U8GNHYA3CoF6lWxUT8lfkbe3IbXTyRAraqYU5r3rykIGLWMsl2bY6T/oecWQlY/p/mj2S5PtVV
 EkC9HWDFnpGv/fRBT+B4Kw2OFBxCoPvnVzBx84pbFILpfpXItUtY6nc7RZ9FESzrVLXjsyJm1Wwa1k
 XIYDjSOFoHpmq2EO9flWBjMPo/0apbj/81HP2/Ze31wou5yqrpBX8ozvu2Hi+EN8H1F6zQVj53xyQW
 LTpTpCx4zCobGKrWsAM25nwN+v43wgQsPNBHZVLWZSdPaMgxFNjmO8GA2itmfsHd/I1FNv//rgdisB
 Vdb1aDjh2hU6HqtCrl46Npql+mfWeGuFVxztqIh+yqQd5gqQ7y6vvfK2MmiA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_054643_521851_440A56C2 
X-CRM114-Status: GOOD (  11.06  )
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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 129 +++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index b5f5c77f7f84..67b375fe2020 100644
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
@@ -592,6 +702,25 @@ u2port1: usb-phy@1000 {
 				#phy-cells = <1>;
 			};
 		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt8365-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys: syscon@15000000 {
+			compatible = "mediatek,mt8365-imgsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		apu: syscon@19020000 {
+			compatible = "mediatek,mt8365-apu", "syscon";
+			reg = <0 0x19020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 	};
 
 	timer {

-- 
b4 0.10.1

