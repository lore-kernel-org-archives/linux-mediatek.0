Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C5CE71080
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clF9IqfWOEF59ajJbesUMGqxvJHi1IjyVraJZokbP8Y=; b=WErGj4BlFq9egz8+iHzl7/rSAo
	Ty15QJIQMyrCKS7GbcpKuv3NGFgeE0Wu2rx9dWYd1X6o4WS5ejttbM5tjKhUtTsvoxSfcMhz9xHfs
	klRUtC9H3gFhzQmCofA9S5bHsc5uwOc4DCMlf9F+kqFly4xiyS2zVd2zgabUTrbJ4uJpSJ6ZukFZq
	to2l2rt3tzSrvdl01ZNt4/jzXrU1ueqX1bBLD0KzUWA7OUrCWMb/CmK3ncX6+wtUyvEwxjmoBKtiZ
	cNBA3Z4j5gLzvk5FVg3Lwu3fSXRhvuuCTISyehXPvEx/AZHQkpccOgV4mjgkX9kTFcAeL+ZM46JIw
	xqRfxjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjo-006Hyf-2H;
	Thu, 21 Sep 2023 14:33:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjg-006Hsr-2w
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 14:32:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31f7400cb74so992897f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306774; x=1695911574; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clF9IqfWOEF59ajJbesUMGqxvJHi1IjyVraJZokbP8Y=;
        b=o8P6GzUtXCHZbKwkrwjezWvv4ljwq82qQgO6rS8kFbzuYcxwsqw9Epcix+8xxIBlwH
         VbP6EFaqeg1nsrNB59NMD+Q3d//iAw49pJ6fXNoSwwrTk7+QlFB5TzqzEFg1EQZpmclR
         wz1csuU1zd5rqx/+H3zcKkHqqoNPj7afgsgWjZddkFqiix47HhzfRaVkV6gJcxgDYG8A
         t4rAsv5Tl9CD+pFfW1grXVM8iTtG0k3aVF5TUycSzAHwVakChHIgsfHNbawAJ0+gKv9Q
         LVhYPibsdc6RU8OyofCbdxkCfNUqIvzHCXy2N7uK0HC9eqaGgI/zO+krIv1YAofhbvtD
         rwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306774; x=1695911574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clF9IqfWOEF59ajJbesUMGqxvJHi1IjyVraJZokbP8Y=;
        b=bgSvabIestqS2sQQQkmf1gUuzdEceYPYYfU56o53kffE1MfCtf4cu45S/aYGqE4VRJ
         xpeaIxzPyUY8lWJwMBb0Rj2rN2nwHftzlksKT1xMVckSKEBnrZfRchr4bwvnt/YrTg89
         0X6VsG0RRtprSooa/hX476Bu0QcLoqLIFodnCCCfGSq4H1VGq9i3Az/FQvNlRnCtavih
         aNUDYaKpyqBUp6LpQEXfdh8sjAjwcsyOw4hR2lTUg8sJCFm6LnQoW/A24ZoC3EmZGigh
         9KtIvTFpzMP/kJ1vo6n8q+E7FxbOpINToVPE7BNquyKj+JoI0i1cAb2V/V5xFeVJvdx/
         A64A==
X-Gm-Message-State: AOJu0YzaWAEvBvhbAhv58jjcYMfPfq0fgGpNSJp2796HFIrQZFGnxnIu
	fedCPdgebb3wyokzvFWH8zP2qA==
X-Google-Smtp-Source: AGHT+IGL6wW3Rr3w7swzuaKhiPgr5LXLt/JSurYW2bGA+fNjoRuyyz3oGNC765SMK7LS/TQpTDlyyg==
X-Received: by 2002:adf:e18f:0:b0:321:8181:601e with SMTP id az15-20020adfe18f000000b003218181601emr2755407wrb.8.1695306774656;
        Thu, 21 Sep 2023 07:32:54 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id lt12-20020a170906fa8c00b009a219ecbaf1sm1153327ejb.85.2023.09.21.07.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:32:54 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 21 Sep 2023 16:32:43 +0200
Subject: [PATCH v5 4/7] arm64: dts: mediatek: add power domain support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v5-4-fa6f03680832@baylibre.com>
References: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
In-Reply-To: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlDFQPaUQqGai3yH9GDhiKpdCa0NV6X3mBNft+IK0B
 FGe/ky2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZQxUDwAKCRArRkmdfjHURTsaD/
 963hW5XvHhEhM+Lk7WW13Ll1D0xFvoL9s3ixFhZf3TLG5k5S8VjBvoLUpy2/rYh8K+dgaffMknD/o7
 6N7WDsyCjN8LE89S/7DyXP1mxT/685L6TTNjwO3hBpdWIG4lpfgqtjeVZbMGELceLG6T5WRymm0Eh9
 WIUHQBrXQdkyZOeIXcqLUw4jRdFB50olpwRA5CCJqI21sTzDfe9DgPQdtZrq+R08OhKJ5tehnLlGL8
 51ahNbgFsT8ZlS740Up6Nijebsa0JOZUeI6nDh6DSnMA1eGF0ExD9tEmIaDNfsiOOGaWlEdqqIZ6pl
 yIS8xK4UWq9ut/shJpSTyHj5x7VGBu7mUyQZo1u9hw7v2IA3lKe8FkPWKzvYkPblA7xGEczvLJK/1v
 pwCE5leSLQCFrW4VE5Gyx6oyK3QQF6+Ewb6dTaLKD0OXzYxz19zZW1MvPALuSTsCxfz6oJxLBecI5S
 Y0nbYq81Brve4rzoSe7vh+AS7SpN8tbtmY2rLPEDHD9UF+03ohSJvS11RsJ27ehts6KYzc32YTeZyQ
 3MsDC43KwUXhQLCRIg4rXYE4jAt9qNI4RM7ifDY9BEyDoWWayQzWELxCiqFHtkTUxn5t30HedixOR9
 xPXcTpwhPD/x3yms/HXehgUXNIseyzEExN2XmFR0Y9rHJ5Ro8M25sH2N2R3A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_073256_955004_6D6677A3 
X-CRM114-Status: GOOD (  12.08  )
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


