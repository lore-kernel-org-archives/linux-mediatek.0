Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922EFC05023
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKnhFSmX8zSOSVxyc9nDkp/gYNXTQ5M2zgPpBqUyXTg=; b=o4PIpGA7MV6UJF6tqcj7lXEAlV
	3j1LClSurz/cYn/TT7KBvnx3mp4bMcbaZYVUkErbp+uKlRxmgKQTi05K+KLvq+KHHU1LRviz5aUjX
	KTOhtmlcRSNX3efdHxGdPEvAiS4R0puCPAdJZSY2VoHxTnbHzLhI5pVVw8ihFybIG+JdGqgyfZ2KV
	wKWO9Lz10zn4MVY/o70ZZ4gcr/yOVKtGakstD3nIBzqIIulvbbiVhvGdGKi/0Q96lyd7dWnYjIP9I
	pxnlQnQuaioEpWqwJSNrFpTsgPgkMhsJrEW+SKwKS5/IbnXZcdAaztu0ypmII40uRfAHMnqeEUoW+
	gcW4vKdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSbI-00000002ZYn-32mi;
	Thu, 18 Apr 2024 14:18:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSaB-00000002Yrk-0M0M
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BKnhFSmX8zSOSVxyc9nDkp/gYNXTQ5M2zgPpBqUyXTg=; b=qOmCh5pgunfyjU/yETYkesRNmM
	tyABBIpmmraNPuZTpeETs6ADMrecgcCMz4KLYR9fyEHFAyi5zqcGqphIZTul8vLUQU5JUNzZqkyDE
	hKondAjN/ugo4Stox7C+yHCsrOnBYunXRXj/QKJipWcvsB8GY0h9OVeJoQOKYcP4C+ffI8uBPTDZr
	mQJigGd5pb+mIf2TWCBHpJoiM/I4yEU2Bb32dkRhD/9jNP+pucQsiM+UVjGBVixloGdRsHlKeB+1G
	p7HytYcb2wCgbykiHLg3ySe2dBk5bi4lHfr9dM0Ldrdrp/Gg7qmUeTqx5OI5jDf6kBFiYpGyE4hCU
	+o/ikILw==;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSa2-0000000C2B2-0VAn
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:45 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-418f1d77adaso3404495e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449856; x=1714054656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKnhFSmX8zSOSVxyc9nDkp/gYNXTQ5M2zgPpBqUyXTg=;
        b=TegvqeENVoKUyCSDD5a27p9URXoK9C+ci8hA3YhmIfkTMsJbffhXD0kOwnvNCj9lbI
         /Incl6zbtXuAn0N656rmQLSU+ruf72t+uML3eUhY403S+DyuzfaoRtTIAYtY3XTAYRDd
         CF4sk7N0rXiMSJzxzMJBKpnvhdRn5yoqRB12OuejBC6KyX0nvN0aza7s45l3aTqa6xms
         daiBrPfE7sKVHPxxkjIClWINoY8SzkD7h0dKIqVqj9GxLHwRmqGQUhMpuyWdLmazfVS9
         nl9NKk92mleYU2WMLlggZd8HtZPspgPc7DCOQvTgyE630jl0VFrIgJtA4dYk1Lgj03Dr
         Sk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449856; x=1714054656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKnhFSmX8zSOSVxyc9nDkp/gYNXTQ5M2zgPpBqUyXTg=;
        b=rIJ9EfhBXjD201KjoFqbGxKLQxK4B15WeAQ8O0aQYxI1Uhlesvo/7DRVH7eeZLoHax
         aqX7b5jg+2DjOR/p1VX7KF6LLjisLvyM5YAdL7KFK9QcBGBZqm1wPl3uRTIJZAXkvDb5
         miqXtOxZ7cmx6+RxEz0bVjdkgUD+u5AFlS+qEuMeCuGdbBEcLm8KdMHkpcBHrdsTMqA4
         7KmBhDhCHFiTfF0f4AoPpNflVWPfzImTv/C92l4xhbNeTEOadmsFnXcrLIV/KylqRB5f
         k6S2nrV5Ff9Upb7UOiKUJLOf+AL7oBCwGMTxIEV4tR81oTzQ30XO9SQVedPmMQ/E0fQd
         DTDA==
X-Forwarded-Encrypted: i=1; AJvYcCVvTSm/0TjqZrGLd6TTYT0N+oCrbgkTjU91GvG/AV2/b/wkmIvqhlRkRKIriq+9uCBprrnsRO6J5zw20mEJ500fVM/GylzFLEKZ0bg0Yqz++t6q
X-Gm-Message-State: AOJu0YxO2L3AePiIpJd+nQK4wFQrUoZuvh/osepe1jThsvl2cWIgc4df
	2d/oeCDt3TS8UF/zUPnMnBNRCXFR6/bBoQ4isDgw2tdQtYCFAYCBqYMyOp3DAL4=
X-Google-Smtp-Source: AGHT+IHV6YC7NiCV8wvsPwyJwjBjjFxowgPmgZfERu3x6iWLoTi9PZue++xGzmyJpfGKLQL/ABBBIw==
X-Received: by 2002:a05:600c:3b27:b0:418:a7a7:98f8 with SMTP id m39-20020a05600c3b2700b00418a7a798f8mr2547667wms.29.1713449856103;
        Thu, 18 Apr 2024 07:17:36 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:04 +0200
Subject: [PATCH v3 16/17] arm64: dts: mediatek: add display blocks support
 for the MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-16-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6863; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=WWkNfvm63b8mfbdUkjQECD7o+l4Hcro7XXjY2cPobPM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjHZhIa3fY5nxorBC0R3lpzo6CCzKyGQm7MXb2
 Bk0bklGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURXrDEA
 CHSpmGb4lHyRMDF2zf3UxtaZp7opzlLezB3PtVoL3AHHGLUsdQPIsXtmkGdw5Z1vWoKCYUvwRdvpib
 TIw6xMuunM5ZvPi/Esn4gR8giEmd2khCCS5VrTo/UgbN+cVEiblK+CbnV8+RvenHaMCUOoSFK6KTo7
 h5pcvuuMx8Hsdverr6bLh9MSYPpK7BOMFam0AJ4goQ9s5VXzGWlpFPWigBgro62f0Y7+5UmISZcVOC
 cyeKvqiDzGzxE4WOliscb4aWDHmsj69N+TlpojvskSYbkthZOq6NbqfneE2w2ri0XZO9/V4nUubu7H
 E1Q51YVP0Un6MRInc9/RelQ7ukhlrc1Bt1/24EmKHfX9w0rrKDI+iIKVsiPwELDHpwHDELu+M/Abmu
 5LjEsME6SaXuVMhQaq0QOuyPYcmXZYy7mk+gfTCFLxCtYKHQMFCfyGFQwzSXPcnSvvpiKOa1RL6HH7
 aN16Z9/+93DKCrPMQZEs+Xm3fLI1LzCch7R/1micwdOEaNhwJ/sBtJsqQXavvVYAd1yo2un28Jprro
 1Bo/LQ1i9EeQlztlxqNpOhZhulB0kVfWOVTKu4K7RNeOhmB0VqpFOWmnsBsOP3pgVjFJVZOroys+jI
 nlSigI7Y9lZhHWZnkv0GeeXq5ojEUZtIPYLm0ZHHo+ay/GfOvL8afNHgLlcg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151738_534875_F3179C4A 
X-CRM114-Status: GOOD (  11.65  )
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

- Add aliases for each display components to help display drivers.
- Add the Display Pulse Width Modulation (DISP_PWM) to provide PWM signals
  for the LED driver of mobile LCM.
- Add the MIPI Display Serial Interface (DSI) PHY support. (up to 4-lane
  output)
- Add the display mutex support.
- Add the following display component support:
  - OVL0 (Overlay)
  - RDMA0 (Data Path Read DMA)
  - Color0
  - CCorr0 (Color Correction)
  - AAL0 (Adaptive Ambient Light)
  - GAMMA0
  - Dither0
  - DSI0 (Display Serial Interface)
  - RDMA1 (Data Path Read DMA)
  - DPI0 (Display Parallel Interface)

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 133 +++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..d34519a33c90 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mediatek,mt8365-power.h>
 
@@ -17,6 +18,19 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		aal0 = &aal0;
+		ccorr0 = &ccorr0;
+		color0 = &color0;
+		dither0 = &dither0;
+		dpi0 = &dpi0;
+		dsi0 = &dsi0;
+		gamma0 = &gamma0;
+		ovl0 = &ovl0;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -607,6 +621,15 @@ spi: spi@1100a000 {
 			status = "disabled";
 		};
 
+		disp_pwm: pwm@1100e000 {
+			compatible = "mediatek,mt8365-disp-pwm", "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100e000 0 0x1000>;
+			clock-names = "main", "mm";
+			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>, <&infracfg CLK_IFR_DISP_PWM>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			#pwm-cells = <2>;
+		};
+
 		i2c3: i2c@1100f000 {
 			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
 			reg = <0 0x1100f000 0 0xa0>, <0 0x11000200 0 0x80>;
@@ -703,6 +726,15 @@ ethernet: ethernet@112a0000 {
 			status = "disabled";
 		};
 
+		mipi_tx0: dsi-phy@11c00000 {
+			compatible = "mediatek,mt8365-mipi-tx", "mediatek,mt8183-mipi-tx";
+			reg = <0 0x11c00000 0 0x800>;
+			clock-output-names = "mipi_tx0_pll";
+			clocks = <&clk26m>;
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+		};
+
 		u3phy: t-phy@11cc0000 {
 			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
@@ -732,6 +764,13 @@ mmsys: syscon@14000000 {
 			#clock-cells = <1>;
 		};
 
+		mutex: mutex@14001000 {
+			compatible =  "mediatek,mt8365-disp-mutex";
+			reg = <0 0x14001000 0 0x1000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
 		smi_common: smi@14002000 {
 			compatible = "mediatek,mt8365-smi-common";
 			reg = <0 0x14002000 0 0x1000>;
@@ -755,6 +794,100 @@ larb0: larb@14003000 {
 			mediatek,larb-id = <0>;
 		};
 
+		ovl0: ovl@1400b000 {
+			compatible = "mediatek,mt8365-disp-ovl", "mediatek,mt8192-disp-ovl";
+			reg = <0 0x1400b000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_OVL0>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		rdma0: rdma@1400d000 {
+			compatible = "mediatek,mt8365-disp-rdma", "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1400d000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_RDMA0>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			mediatek,rdma-fifo-size = <5120>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		color0: color@1400f000 {
+			compatible = "mediatek,mt8365-disp-color", "mediatek,mt8173-disp-color";
+			reg = <0 0x1400f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_COLOR0>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		ccorr0: ccorr@14010000 {
+			compatible = "mediatek,mt8365-disp-ccorr", "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x14010000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_CCORR0>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		aal0: aal@14011000 {
+			compatible = "mediatek,mt8365-disp-aal", "mediatek,mt8183-disp-aal";
+			reg = <0 0x14011000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_AAL0>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		gamma0: gamma@14012000 {
+			compatible = "mediatek,mt8365-disp-gamma", "mediatek,mt8183-disp-gamma";
+			reg = <0 0x14012000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_GAMMA0>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		dither0: dither@14013000 {
+			compatible = "mediatek,mt8365-disp-dither", "mediatek,mt8183-disp-dither";
+			reg = <0 0x14013000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_DITHER0>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		dsi0: dsi@14014000 {
+			compatible = "mediatek,mt8365-dsi", "mediatek,mt8183-dsi";
+			reg = <0 0x14014000 0 0x1000>;
+			clock-names = "engine", "digital", "hs";
+			clocks = <&mmsys CLK_MM_MM_DSI0>,
+				 <&mmsys CLK_MM_DSI0_DIG_DSI>,
+				 <&mipi_tx0>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+			phy-names = "dphy";
+			phys = <&mipi_tx0>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		rdma1: rdma@14016000 {
+			compatible = "mediatek,mt8365-disp-rdma", "mediatek,mt8183-disp-rdma";
+			reg = <0 0x14016000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_RDMA1>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+			mediatek,rdma-fifo-size = <2048>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		dpi0: dpi@14018000 {
+			compatible = "mediatek,mt8365-dpi", "mediatek,mt8192-dpi";
+			reg = <0 0x14018000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DPI0_DPI0>,
+				 <&mmsys CLK_MM_MM_DPI0>,
+				 <&apmixedsys CLK_APMIXED_LVDSPLL>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			status = "disabled";
+		};
+
 		camsys: syscon@15000000 {
 			compatible = "mediatek,mt8365-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;

-- 
2.25.1


