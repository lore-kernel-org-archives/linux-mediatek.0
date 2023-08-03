Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B9AC41513
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clF9IqfWOEF59ajJbesUMGqxvJHi1IjyVraJZokbP8Y=; b=WYSYLHtNZDtroUMlgwRKgn0qF4
	3R5BXQCq3U2gPZFm4zGRxXGzIHGZzKlZ4YgZb+9spKjnix4BKTtF5+q/NpkZ5ZFnZeW9/dOj1iFZl
	MHtGV84pQnUywlA0uI5LHRkFWfbMGooMQaAaLVHuHZcKF5wsKdCk4mJjTAenT04qV+uoKGPFjfB3Y
	3DOC0Wncb2nAUEqYFqGotDNscv3/uQF9afyi3DxyxvWMv/+lNPEHSMyA6Lr2pGZVoBq1Ehw0vaWU/
	RpgcJotwmcR5I0OcCNY32xvBdOWydr9NSCMYM9C45XducghLkER6oHyCWQMlTNxzGmPY6Wns6m4Fq
	n7Y5UrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpc-007EVa-2F;
	Thu, 03 Aug 2023 09:41:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUpT-007EMv-25
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 09:41:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe24dd8898so7543415e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691055669; x=1691660469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clF9IqfWOEF59ajJbesUMGqxvJHi1IjyVraJZokbP8Y=;
        b=0ISQ8Lo/ASgOw6BMl4soyuuhNLzsU8HS7uncz+RCCeIc73Rrw1pWWr7bEFo2wkMQ0M
         wuFRWAg80MNJZiQrj5p7B9NkH1L6oAQbWuYAZtTnFHwk3BeH5sddKOa5/U69jQJ/p0+9
         n2c4u0Su+q56+qVldmm2Jk8xkjV2FKGr8cyXAi8mTCGZ4cvb2KjUDgCg1MFJ4N8JYUrO
         NTUMVHuKfLWpnebC1Fen1TttoXT9N9Us73gzkoBbQIP9BR/jnUSODhsHAaF/2oqQlbnH
         T5mu/77TYy/82Ugpy27fmZDodT469bg3aPQmaod8k1xS8AeQ+axwJ+R1Aalw053oATJN
         Q0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691055669; x=1691660469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clF9IqfWOEF59ajJbesUMGqxvJHi1IjyVraJZokbP8Y=;
        b=hLUDfm42X1kFtnqGL737rMScZp640d3/p9PpCrPYV2x4XhUKvmpGEvKC2nNKWjuH3x
         eUjzgvkZUTebSSXtwELCHimjG1WC9dVUZAuAR1oktu9RfNML/i0k9J0SbSkfM70NuJ/v
         rcNZJXA9siS/+EngtXUySY39GXne1WM0xaovjDX7nLDDMPJMpnuAwkfN/vdVjX+ol2Je
         BAP2v35aCs4yUlQ5SuPoarCnArruV2/UzaIBazyk6nGYwzbPdD3zIW4+cpBhQskSk8kF
         jIrD+5F4oPYwPkG8STQ4u6ERgkrGs4iqii+0ZsQUkc2YqpgEo0ynhu3SEW6/jbtx2Gfo
         nHpQ==
X-Gm-Message-State: ABy/qLZTmY+DyhRQz5+fovj4e7FB+vrxRrZ0t9y34woj7LDH6FvRCudb
	JnTsR2rNrAjR3KFjGNRgWaOvGw==
X-Google-Smtp-Source: APBJJlE3by0F6c1qaNJJE0oCQERl3BjHvR2sER5coiEYQssCjchkL8Vd91jlP/q+gyny/RmSIIP3Xw==
X-Received: by 2002:a7b:c40a:0:b0:3fe:2102:8085 with SMTP id k10-20020a7bc40a000000b003fe21028085mr6843537wmi.8.1691055669279;
        Thu, 03 Aug 2023 02:41:09 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id n1-20020a05600c4f8100b003fe15ac0934sm13294994wmq.1.2023.08.03.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:41:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 03 Aug 2023 11:40:56 +0200
Subject: [PATCH v4 4/7] arm64: dts: mediatek: add power domain support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v4-4-84798657c410@baylibre.com>
References: <20230207-iommu-support-v4-0-84798657c410@baylibre.com>
In-Reply-To: <20230207-iommu-support-v4-0-84798657c410@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBky3Yuxk3ppHTVskoqexjTkK+EC1B0pEDG+RJOQWCy
 OHthgxuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMt2LgAKCRArRkmdfjHURURaD/
 9110SUqOn4t8I75q0ja4UGGQhOX629Wt2AihGU2K8qbKmMcg/3VfzQ0PTat3HhrGR5TTAJHwGfI723
 N1PvAFMQ3bRf7OV/+aNDdW2YqQBOz6NKklqpKuK1bib/OQk1rCt6lkp+OwsticsF/7Hs9R3CmFHR+l
 obV5678xnmbqwQkxwYTgQHWxEePhwWBxn9NSeMm6TswlsBSIaA0KTWf1cTKeKlKk6SSljRIcFuQBnD
 Cof/ng7LtBUJZ0aMsJbAECj6NWVdgTKVBHAqIBEeX2qWNMW+1dR9ZYcGwvUVaTgBnYAMS1+p/V0Po1
 Et6pBbquLm2UFxJACNJKG0nkCAIgYHWypxG+EPkExG9N0yxsSXWUGVVPERU25p7jNokVp3B04mV1VO
 mDaykMnG7HVFtE+u6XdEhXgnzFoH1zElFh4RQeWScuemSs/fv1NZaqwfYD1QwrBtgj2OJACIu5nuJl
 V3+sxPYTMUU2xff7FbAKrYDEBB/SYxCtHybKlRg61wq4RKlO583LOJJNQIS1V84KkU0zMxJAm5r4gR
 OWdnN5+9actrzJIm6p46Qnier709S9J7m87eq6c8mDdbnNRFYV1K92QOrImUgYHWymOZrZNVhUKnsM
 HzKV5RaiZOe2V5UegYa0RBt7kQuQ5h7JreyFEFpcyXyDKjCZK4IpfS+o6J2Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_024111_776383_877B3C02 
X-CRM114-Status: GOOD (  12.24  )
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


