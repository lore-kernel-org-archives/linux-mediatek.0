Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA498CE7AB9
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 18:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clF9IqfWOEF59ajJbesUMGqxvJHi1IjyVraJZokbP8Y=; b=tF1R4ejovmgX9wV1j5IShrEQHc
	DUifSTtwV9u/8/2U8DZpzE1PYWcUi4k0OExkw/OFGFwnEIP4imtnJWxHFTX6cClF/GTn14XWtqkHZ
	WW/Ki84wgT8B1697tsTsRLHN4Wiae9UcwN92NErRa5VqH1cGllJ79STU8Kw/WjBpoDdegBneMWl3W
	vKzGtzyHyhVNV2DOQ2iO9MGeG1P9HzjdJPbt8GHRBkCp1JQTmvKDiQwSZP6HSSRIx3SDp1s5jd/vx
	Np6yf9w7286PDU479a00zWHYeS+oDaN9D9qPjbnMhFXmjXHNrJI55ivu7KL+MzJRVIiAg4UJppNmC
	rdt5os+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9v-00Eopn-2B;
	Mon, 25 Sep 2023 18:18:15 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9W-00EoZd-2a
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 18:17:52 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so18251286a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 11:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695665869; x=1696270669; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clF9IqfWOEF59ajJbesUMGqxvJHi1IjyVraJZokbP8Y=;
        b=Y9WkI8/Pebq6Teb+fI+Ys4WDuFDczygxFJy2UcRryGYa1grrWX3whmIsJUbe7y3LcW
         jQVLpwBmGm8KqrrfRLAI283Qf2p3e7KPm/fuIlriYnS8z3Y/GuobUVUdsrBEKetwR1IY
         rCnPzV0fHUs1DQSAYXvNQPtLahvbX6F+nD1sDYq9TJ2BBAYyUjQeFNqxPErQ+pji5wZ1
         F+peJeZ/miDVAbsK6+Jme9cQP2qqeHyQE22p/nHwp+SJT+QAQtV2SsUGrwrdzfrMZuYD
         HAaQdrAbIqZ3hXxXnyv2r//DkK58Jn5dIf0MKLIMCn1vBJAI0hilBdI6b3qaA/HV8pU+
         u9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665869; x=1696270669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clF9IqfWOEF59ajJbesUMGqxvJHi1IjyVraJZokbP8Y=;
        b=QudtlCpBdZjEqvLVJiNrer4lUREWd0QdWMp+Gtn/MGbduXx3rWp8NHWDiPj/bvJ3tH
         y65Svp7VSugWBb9AhT6a+2qiSjo+bbXmw2dcWVf0HqyKRYcMhYgC4BktY4qwzECCA+yI
         rQz8pBmePwlsrMnFyAGWKokzyRUSkw/jp6aiiiBj84sX00XNifMVdU6RQPlVWuawSpqN
         R/79md1C5x6UiS+vWzMkg/PCD1xoxDnMqpSDTAF373B+7JN//3ti4PndBTbTPuq+ANbP
         kKvoTKDwNuB4QO9JEpd41XHz1GQV94ZQ6VxyAcpu7praGf3GN1nr1wVyQ1B20asTz+f/
         R5Iw==
X-Gm-Message-State: AOJu0Yxfgg7E6BYfuaCAWYmfF/I5gW84PGk2+asZ1QL6HCbo7PUQiTu5
	qbidL80Dj0I4zaEuhzUpZ7XhH9FnNgOUErsnU5k=
X-Google-Smtp-Source: AGHT+IGbtIueYW57+I4iFokcXH6J8RHtXJU48dD1b/v/MmmPRNtR1ucVnPDEPwiPW+QXE197AdcNnw==
X-Received: by 2002:a17:907:97c9:b0:9ae:50ec:bd81 with SMTP id js9-20020a17090797c900b009ae50ecbd81mr682486ejc.21.1695665869012;
        Mon, 25 Sep 2023 11:17:49 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j26-20020a170906831a00b00997d7aa59fasm6793962ejx.14.2023.09.25.11.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:17:48 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 25 Sep 2023 20:17:38 +0200
Subject: [PATCH v6 4/7] arm64: dts: mediatek: add power domain support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v6-4-24453c8625b3@baylibre.com>
References: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
In-Reply-To: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4724; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=gs34qYbpVZeuz1fNLXc7xbInSDTbehayNY8q/g3uDQE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlEc7FTl0niKBNPCGJeVVRHlwIKP3BNxOpKFNI/WZ3
 aOVdKlaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZRHOxQAKCRArRkmdfjHURdtSEA
 CatxECkwOq3wcsJTPGcFEU7RSbi/wBwvLt7VskfT0wIhq1yCI+pjsjzrz9oNGZipCxfnMHNlFBgdyZ
 WOOHDr/BpKDfM1yF/seseJVXGCX0x1xT7G85YWFG/LIlkNVHXCYa/UryKUbXPF22L51DC9gAA0R5qD
 2w7PMEfH4THcTCu6515DnrKwohESLR/qzv0cLyDleR0/Ro4TxgO8nZXk2QggcZxNphC5FVK8C0OqBY
 oC6fyvk5/SevsuAjkxuP2RSw9WkolLHdMFFFEKKwdo8Xq0dl1yF/jjB4pcTaB6bINLf9Kcrvx6uoL4
 YO/1RbmWQ0sXmQNt5cHwF5OSxiYGFP6p398uo/RpSzSzr0AJRMS6jg45iIMNVuYhWqHE8LiWA08KtJ
 +7nWiLl8pFpOcW4AbK8w+mVN/SNSAYU5nFxq34y/NPpgCwSD5oJgBknXodsXkYfJ/uP/iYcsZQAsRE
 QBYzKJu9L7Z5hHyogwLGDi/qy3SkE+8+oaXZfxTnQoLySs9SwYTjjxDw+rNDsBLaCtTcu5447y44my
 JVCuvhGX6Zv0xBK1jzB50JOMDyHCi1O4622FblOwHQpyVSW1LgqKlraU4rTQmUxFQEzBpjKd5u01Au
 wMfOrTbGpDQKp7BjsIOt4WDTAqI6KVA8c7faZwV3i+alLzaGBd7oG3pvXKdQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_111750_846300_520A8927 
X-CRM114-Status: GOOD (  12.00  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 110 +++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index c3ad7cbc89ab..c2f88d153dee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/mediatek,mt8365-power.h>
 
 / {
 	compatible = "mediatek,mt8365";
@@ -298,6 +299,115 @@ syscfg_pctl: syscfg-pctl@10005000 {
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
 			compatible = "mediatek,mt8365-wdt", "mediatek,mt6589-wdt";
 			reg = <0 0x10007000 0 0x100>;

-- 
2.25.1


