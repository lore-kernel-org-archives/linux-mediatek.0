Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B74AC25B44
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7LsImvOXL0o3XHHExR7Yh7FPNSroEzRfhHt2s1V9mI=; b=TC0q0owxxR2YXctWV0VMoZ/GNI
	6LBqWsZQZOifZlbq7o6g21lTguoh4Afxzdt6ilobEouWPlpDuk9E1lRDzEmJdSkuT2ol+3f2Q3dB/
	C1mkDNDxfY5xLiNxzfwpRCxKbLx6cdyV8U2TbXmA7mj25TJXsAM0l2JjiCzJJ7uBoIaVd072XHHaK
	4GMMyo3APf/Td19pjMgMKy0iCHPBlB2lTFbp533ZcE51X7H/9cSpRQ0NBvcYlSsbDdkvX6x1/a91l
	PRF4QFK7keepcY4ZD0RjUaLqy2ViJsc9KA/2b1u5WNpAZ27JB7ro7OkOsbqFPtzSa5PzLMSVwMEyh
	Nm55bOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw84-007aer-0i;
	Mon, 23 Oct 2023 14:42:04 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7K-007a19-2z
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:41:20 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-778999c5ecfso239462685a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072078; x=1698676878; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7LsImvOXL0o3XHHExR7Yh7FPNSroEzRfhHt2s1V9mI=;
        b=yS6RfUU68Ck1BD1EX0d+yrCu1bZVU5pLG1Qg36Ip9YUSdbFhxS58TFU1SjkE+hm9Bd
         1JH+Gronloy19CUuBy8cDRiLYG60K4SyIjtSRm/quV1uaQsS0Eg4WwUnbrNsFjK9rBj1
         OBsSnTRIky6zXlBcjEv1Z5W2C8tX++qRk88rkbEdE+jwC6pR17Enoa3cjfkIx6JT7ugB
         QUFmmqF31nbp38h5tj8mHya/Ee9jsljem3uE4O7rhQfI3Skt6rqQaKmZwmCdcrp6YkVG
         ChFEDLo/E5Ogr8i/nsMG1fWT6qwnhe9VnzeiSYdu36q1ZBJ724APz6ckOa6C7qKmkp2D
         k8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072078; x=1698676878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7LsImvOXL0o3XHHExR7Yh7FPNSroEzRfhHt2s1V9mI=;
        b=PnvAPpcy64m2CZjNoyNeznVCTUYHIobYpYpzeRFL+0bXFz1o2k4qn/m+TwnXflZ0VX
         B1NL4D35WxC1ifZ9xtIJyeEvqNdej/QxbaenqPtbDVsZ4x91kVXmiE9CyNE/CSsJ4W2c
         0BtVA+HrHpUyCglM/dEL9qSrAQrzeDHFNcumMeKdxmQ7Kgoew/pad2P8PHBbLCO7MX0a
         p0mJZxkQFySZzXok0ZsOLOoUKIICh8qzWz5LJyYn/t1khz37OLYMN584mSrNSg2xgrNu
         CGU2IXjbfaAxFkGZFzbw5gvkTFAAAX4wHtD7Aop0AFWdoAWz/Rf4wqVysQ5MJTZEVvlA
         CnKw==
X-Gm-Message-State: AOJu0YyLVZIYnhZwAeZWXFM6Quvkv0zQ7dGL7ZIvKrAMYC233fZwnd6+
	M2ScRbOKXKGy8dCDQdWZcdKfXA==
X-Google-Smtp-Source: AGHT+IGiTzHbMfjG/TOhYPZrSyreD2Vic10suD7z5G5gbFvXkGq//tiEzy6adCX/CC/3rJOsIkieCA==
X-Received: by 2002:a05:620a:440a:b0:76c:ea3f:9010 with SMTP id v10-20020a05620a440a00b0076cea3f9010mr10992717qkp.16.1698072078098;
        Mon, 23 Oct 2023 07:41:18 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:41:17 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:17 +0200
Subject: [PATCH 17/18] arm64: dts: mediatek: add display blocks support for
 the MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-17-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7082; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=GrqIHwd0l9+44q9ggVwPid+Zd2sZPQpFOwpuTf1SwWY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPPcsd/oUE0a9NY68W+0Ky2eNYAfmRaFOVUlwY
 Fr2tBLWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURVuAD/
 9o/qWcsErVbAO5/ec3rAt7R2x0P+I5D9RaBuukKd7b5m0IE8U2CBqbNivJTaA/t1LbRzwHzC/ah3SS
 qcyz6vE38fXyjCrpFRt42IuTSxMk4lIIuK4BsyGjPznAyL/HH+70O88uzw4B83x9VvvjFAVjB5YVMt
 SAwZL+wQ0bI0FnauDW3PCkEqasdIzWz3BRGIolJ7iKRM7iZwkqPdgE9FHCNYIyQvdn+fnFG6ZEDHUA
 fyJs0SK2JzrQugPsFxjQsQawuQRMPm+/WME13iCojHuImZbJCQIeLyhem98xq7c0ludW+1oMLfifTK
 y5h+azpqOFnG4PAV2bZN2ECUI/tRB4BQxsCIk3gPprDxOFnDGe7A1F9ubDPtJJijvDMF1P+kiLHFEU
 RMPk8O/Y3/c2bV7RzKBjy00byPbBTAuXzn1AQZBEf5OtXaRs7wBoe/RzeUUAU2zOzy3wimMs60FYmy
 DKhDKnjDBkS9199Ia+X3b4UeW1l6EhCWGSmovYgyBiR6sG3/H6l5TK93YAKRw0SQH9gsdZHHwJ9iE2
 Dwza+H2EfJkCqNLCWo4QEyZ3kq9oK0VipWezsJM97k7wcb4wwC9QyPoN5P0uQdPvIJoaNvdibfJTjC
 CtBA02Hj+qRBmGlS6x6KvQfcGrgNZn3l/9H00K1MIdGTlw1bgYX4tfEJKang==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074118_976357_588B31DB 
X-CRM114-Status: GOOD (  11.77  )
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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 146 +++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..6096358f7d07 100644
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
@@ -607,6 +621,17 @@ spi: spi@1100a000 {
 			status = "disabled";
 		};
 
+		disp_pwm: pwm@1100e000 {
+			compatible = "mediatek,mt8365-disp-pwm",
+				     "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100e000 0 0x1000>;
+			clock-names = "main", "mm";
+			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>,
+				 <&infracfg CLK_IFR_DISP_PWM>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			#pwm-cells = <2>;
+		};
+
 		i2c3: i2c@1100f000 {
 			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
 			reg = <0 0x1100f000 0 0xa0>, <0 0x11000200 0 0x80>;
@@ -703,6 +728,15 @@ ethernet: ethernet@112a0000 {
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
@@ -732,6 +766,13 @@ mmsys: syscon@14000000 {
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
@@ -755,6 +796,111 @@ larb0: larb@14003000 {
 			mediatek,larb-id = <0>;
 		};
 
+		ovl0: ovl@1400b000 {
+			compatible = "mediatek,mt8365-disp-ovl",
+				     "mediatek,mt8192-disp-ovl";
+			reg = <0 0x1400b000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_OVL0>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		rdma0: rdma@1400d000 {
+			compatible = "mediatek,mt8365-disp-rdma",
+				     "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1400d000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_RDMA0>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			mediatek,rdma-fifo-size = <5120>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		color0: color@1400f000 {
+			compatible = "mediatek,mt8365-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x1400f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_COLOR0>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		ccorr0: ccorr@14010000 {
+			compatible = "mediatek,mt8365-disp-ccorr",
+				     "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x14010000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_CCORR0>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		aal0: aal@14011000 {
+			compatible = "mediatek,mt8365-disp-aal",
+				     "mediatek,mt8183-disp-aal";
+			reg = <0 0x14011000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_AAL0>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		gamma0: gamma@14012000 {
+			compatible = "mediatek,mt8365-disp-gamma",
+				     "mediatek,mt8183-disp-gamma";
+			reg = <0 0x14012000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_GAMMA0>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		dither0: dither@14013000 {
+			compatible = "mediatek,mt8365-disp-dither",
+				     "mediatek,mt8183-disp-dither";
+			reg = <0 0x14013000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_DITHER0>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		dsi0: dsi@14014000 {
+			compatible = "mediatek,mt8183-dsi";
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
+			compatible = "mediatek,mt8365-disp-rdma",
+				     "mediatek,mt8183-disp-rdma";
+			reg = <0 0x14016000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_RDMA1>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+			mediatek,rdma-fifo-size = <2048>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+		};
+
+		dpi0: dpi@14018000 {
+			compatible = "mediatek,mt8365-dpi";
+			reg = <0 0x14018000 0 0x1000>;
+			assigned-clock-parents = <&topckgen CLK_TOP_LVDSPLL_D4>;
+			assigned-clocks = <&topckgen CLK_TOP_DPI0_SEL>;
+			clock-names = "pixel", "engine", "pll", "dpi";
+			clocks = <&topckgen CLK_TOP_DPI0_SEL>,
+				 <&mmsys CLK_MM_MM_DPI0>,
+				 <&apmixedsys CLK_APMIXED_LVDSPLL>,
+				 <&mmsys CLK_MM_DPI0_DPI0>;
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


