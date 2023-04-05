Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DFEC761AF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KFcOYEAi46ZIl7QCtzcN5XD6VlwA2hJvytxtJEenkQ=; b=sOSxXYBsCUbbeFE4ut9cKcufH9
	VA3o256gMjdQrxxki4GqJeqWyJijrc6r/mPqa7zRi/FOtGD323BeQCbM3wHd8LvskEQFg0FK7c25p
	wjKki9ZEJTGusNozKrfQ5iBo4yNqBmyOTzAqq2xZ4yftWD1Sw6PICXzph9tOYBjv16GycgCJC2IBv
	iqzWQ4pN/3qN5vznzkqP+1t1++TiBH6ppcA1D8HTivTjEiA2rhrbNt6EoI4YHk3D2Icuw/0It741l
	qn33YqrTtTOB6yvA0bpDYujId38FGAGqDxgoXCmMTMSROh5EKLBTa26ImMHDqYdc+V7LZLK84e762
	AuR0Z6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzjl-0040Ul-2M;
	Wed, 05 Apr 2023 09:47:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyll-003pgN-0M
	for linux-mediatek@bombadil.infradead.org;
	Wed, 05 Apr 2023 08:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3KFcOYEAi46ZIl7QCtzcN5XD6VlwA2hJvytxtJEenkQ=; b=IONOTBHOuM74fQR5i9Ji620s2a
	NkQqhaU3FlYHbuqdvMrUKrU274qUWy0RS5z9IqZYIQN1ijHmRsfNXZSoVet80fWfpThNVOHUWAvpe
	Q+PJzcMwlfnJSmCOpIckgpyugjt3TQIO0YFhH3J/RjH7hHioqBJziGRPgZASKOdbaxiIl8v3sGm5n
	6a6a7qrKRn4WefY6p6p/ojiZWvwGcm0qRcBvqvz4esuxpVKaddqrBNi4ABkXQucFy6tDcF5dfDo6s
	45nL20cJEn1+6+4QWattm7+UFyHW3BEKD3qbCJB2+PF5i3dor9/xwAFelUpcFMPR15+y6SzeGyavi
	F65DexRA==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBT-009pUR-1I
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id n19so20386029wms.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KFcOYEAi46ZIl7QCtzcN5XD6VlwA2hJvytxtJEenkQ=;
        b=vC37SPRuGSTtJnMrgLOqcrANQR2a4Xjl57wIS2cFdSmSDXVTJv87ZOCMnfWR/ekZmg
         zmxTY9Vly7gEaFZr9rrndEJL0fwvCfEZiKMlSh88tTP80g5ga2H1lyFQpRAlTRkVWs70
         95EV1zgB4kEyXhwIRYRZZw80RPSRh6ov4mHpFvrQ5bN+e8gyxcFjA/gQyZZG1XylGquC
         j+V3A8UVrRtnCasdq/MNHMUYZctcx8+VlPJNWCdwRrAa8aYZnbVOm1K80TIFQqCX6GaY
         zoywVAJrYtnG8mUZh1tZwAOt7bb7qKHRnwVc1F9pawsXXjGSnOd3Vv+la8xLUP6nKrJ9
         mZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KFcOYEAi46ZIl7QCtzcN5XD6VlwA2hJvytxtJEenkQ=;
        b=T4e5Y55mKt50yxqwK/bNp5mM1ACw77MIefT+A2nLhCPv+gewjkzpq7kcC2Gf2y4f7w
         2eJiUoAfCKtJkC2Z4Y/jsGvotq+Qy8+UXZSs5q+sxSPO7EuWWz8gj8ixyjR9bL51a9iO
         Cw13x4ma7Z7o97y4XUeTsZ3JjTLipSPcTyc2sy3YoIXUfCfeFCUtJAu9ALDMqnCWvAir
         tXl0Di/HL67BYOL8XIW1GmihCt8C8WRRKvViqoBokA91UZIGUGBsVbpxJJg0AAWBZT+S
         eeCiS/I+Zn9+STUHDdPMbyLSlRCGWX66CBch2apvent1Mp7phENqWzTUdR8mBG/thpIL
         lqLA==
X-Gm-Message-State: AAQBX9f+miMhR1om6n+DTh7A0lPnvOc9Aazz1Fg/Aklq+rKqp3y/Zr9G
	wmsR1uwd3ucsoXZ9B8b91+c0Tw==
X-Google-Smtp-Source: AKy350ZlwKxcKrdi1y+uB18vJkxgLBTl7GEMfPyPnXCKZka9q56+j7miIS2FFOvPTDEe5qCNKGJp+A==
X-Received: by 2002:a05:600c:2054:b0:3ee:d7f:6676 with SMTP id p20-20020a05600c205400b003ee0d7f6676mr3956095wmg.11.1680682074529;
        Wed, 05 Apr 2023 01:07:54 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:54 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Apr 2023 10:06:48 +0200
Subject: [PATCH v2 06/10] arm64: dts: mediatek: add power domain support
 for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v2-6-60d5fa00e4e5@baylibre.com>
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
In-Reply-To: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxSZvY7WYtrVZZ048+sAksLv7mZ/3DDV3PIV9FZ
 VuXyio2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUgAKCRArRkmdfjHUReXKD/
 98PT57pl0/HAZiA9k2UQRohub2R1PIJLlVB/FWhUTECl1UlKdYDJROhK19Y90ApxgQ82t2+uStIZwa
 j0LF0qW5GFKDCpUD+twPVbP5YyYTpojOnn3oFVZrvS2WSZg3udt/ZNxXPsu5UFC7MVaWq15AJk/7fS
 7hLKrUjQA6s+3IBgfG+LqEV6XdPM5I49Tw3WWOUuyM0WOTHSTA6Wy4TuD2zdRwBRf5dBi4w6NgsV0A
 adG7XQbITYgCX7L9Z0xR6ApUjn2q0hAN2LbGCUi7zCLNkwWc4m25NICMHGXy6rlPk2B/Mjx9t41GBv
 eB64iiuQTvBqYPARuWv1KT1QhXVgbw7YNbHzQijc4omjkmYmQQebCMJSKi8VtV39f7hICaBvNNq23z
 +o299/8ex3ABSkjh9QcGFsL4NwEhf6tjcDqweQo/LjANxqBWK2i53aEuX7R0jAo2YtjTuYFuj9q3v/
 s/oShVO7bYnWhC+/JY1rW60pCuY+pM7m+ypT4qZvH1SzRmZH/uJ5Ds08MtzMf85KNypMOr/W+uF4lt
 7dpC68Fc0LIkIap8feQJm5Lt5RBstpS1j+iW1/jMFE1FoPrrRg9IfwmS5QpaR3ibMV5hYfMDESSour
 k1aI4F2WQ4ieUmj3D+vt+hmORx8vkhAwh8nrCTy4uJ6SdR4Fd++loOxV79WA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_090759_962715_F3BA300A 
X-CRM114-Status: GOOD (  11.51  )
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


