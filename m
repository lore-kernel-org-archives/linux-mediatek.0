Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5DDC25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Se5yKiZY3cYmLG86r4HoJS7Sn93sN289pgSkPgaOq50=; b=zkKmZYRTnVFXf0dOlYLDG9ODPA
	pwGEs51WcIFQia5//lTCJa79H9ZUMpQazGvuom/rFEQ464W2Gel+RDHRlW49x/DA6Oe62VN2Cd3cO
	85lA7uWiUq9oS+qH1pTjP9wCImwxyFoDk0M++WSq8lZb6bfRawFeH2uw6pD51h6RZhmJuqsqYfhh4
	VwWFhQG9qBkIfL/+hLJvuknjbjrXglS0xeNgUXlxu10eTAYGIPNiKa2ECE6XJVIA0Oew4/r2WL3zB
	PSW610dtOImsoqqCNooMbbvoqYi9FhYI4XkGJKEakMi5R/Fx+1JUhm2VGyK//RE62EWBdXdjBvODa
	vhSHkKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7vS-00000006GdF-2g4x;
	Thu, 23 May 2024 12:52:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7tE-00000006F7n-07BJ
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-354c5b7fafaso2001165f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468585; x=1717073385; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Se5yKiZY3cYmLG86r4HoJS7Sn93sN289pgSkPgaOq50=;
        b=Msa5DeXLTeq+TemjBcGVDCa2RwP3M8hKx6GZAOnB3iMoJKwm4WNNtE6fxLwO9IhN3l
         dF9la1x3n/Lw9DYUi6RuJFMrF00b8rDx2FJQuHl7ipwuCFVvkYFYYYIx8alwVpCq05yq
         uwRkTFGKFPLOaVw2G7JuCo8uk72pmUoP56CwhXTGzD7ieIUnKV7aS64c2HqjsA95i6NI
         gqpVBKw0IBZNxLfDI6D0MlwkKAD5EQ+cQWKK3oxWAskPoNtk+d7S0MtDMQQQI/slM+9V
         c1Cv3R/3I33LDLCtaA3UvBF4nSkDR1TaR4ZYIZ/oNV37OhlfZAspOWuo9O21XPWXNkcq
         +YtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468585; x=1717073385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Se5yKiZY3cYmLG86r4HoJS7Sn93sN289pgSkPgaOq50=;
        b=s+hbGvHTXiht6XYtA73mrCiSPWKxY+x7g7U2NbQDjarBcPfAeMzT67g6ry24zCxAYL
         Iu//N7IwD0yD6nj861XrBCNtjdng+a3OTpgVD9cVgRw2oF+gqKrdZrTkzDyzKBH94j7T
         BpWFxpsGJrZ40/Hh40CyH/PLm4opXGbM/KchQvf4MZ4sQ1cSK3eRAPPYvMfxPQUWo9NK
         rP9O+0Eu/5Xtr9z24FMZeI1YO0h6UT6PUpjdJtdow4Q9c2PWXQoj+BJLLePstkQb7lm4
         8SzvkV3+vE7mWSWCkhwwsag5rOLKICxJBZkRSM5jtKesRYB4hCswbx85FhGQU1frb5Vz
         miPg==
X-Forwarded-Encrypted: i=1; AJvYcCWbj1mha3EfJxf1VBFjqul6M0gpOGLdr3JPP0N5iyRMh2q2OzqB9lcmqTopBcv/wsxXM3wyIlKGSw5Q2+SD+h3Us8a3a+qpfeEXiFi8bfQItFi0
X-Gm-Message-State: AOJu0YzjcK8ERkL2T1iCmaSbQtHhrh/N8/8dZFXK0UaHwdcdZWd+H+Pp
	rdPuN3d6qhHc1qo5QasrPj3OizM7imVuxlV7iz0WZZXWnlHu5lKAsyG3HYtb9Tc=
X-Google-Smtp-Source: AGHT+IFe0EMNXxp/jyDkREWoIn7QKBFlEltWoXTiTialrbLA2YC5vXnZQFAJzQyRCRWD39PWDNl05A==
X-Received: by 2002:adf:cc89:0:b0:354:f1b2:543d with SMTP id ffacd0b85a97d-354f1b254ccmr3454090f8f.40.1716468585244;
        Thu, 23 May 2024 05:49:45 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:27 +0200
Subject: [PATCH v4 14/15] arm64: dts: mediatek: add display blocks support
 for the MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-14-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10844;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=lU/uMCxAKyj9AwKsnWy/Ow0+0Mx6C47OWj2fk20wygs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTqnu9b2aIaIWJ0hKtpp6UVCNGX6RPUv4DdKew
 40JNF3uJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURQ0AD/
 wJ5MXROUA1rCDxyx9Zh/bqVBknkCecExjt0trkPcZlYfI60rgOMu6mExpqddwpH//jmORvwkmTrfoa
 ZJva/9O3YVSBR40g9DnbZi8e3f3JUNPPMl3PlBT9/BzaO90E1x20HljKzSbytkXL42tk7pY8vvt5UJ
 +9ESt9dMQTkCUG0UOx1wmEv/K4Ns3ouzelOOywp9ldxoNPwy8II+UTShFOhdlT3Sf/lkee++msz1D1
 xG2/bY/DUoTGNF1fBUBCodnVbbEvOtZmGqLThfB277uY0Ji43emAmZ36MxyfSAb9Eyp9eN3qj8e+d6
 EG2TkKsve6nO19v4s/BNAwZEF3Xp1OuISKzk4RmVJrUGGSB7f5a5dJEaKHDnrBf+usQ62Y+ZROL/6/
 9nC7QqtdpKZTL3rSGF+u626zHep3p5o0vnUTxVXdUASpvEjjC5jdPqGXuYkDUGAWWEzJCKaAw+wwIb
 NmyIVgzwpQLtddb0fCqIsVP1x/4hSn2lQMAJ9c3mbfIKjyzIZ6cCAfTWqw3LbNYPU87pZVnLnOWOh3
 qhlfN2ibFv8iB3JkTUMe8YL/Ws4lqsLtQYtO6tJqoe66PW1/3tWhKVs1VwmbK3PmOx2h0e+zTLlYYI
 woB1FosuLGBwKI952wUzq7xh3Z6Y2B7qNArUtDuDKAMh+uZUspx0A+qnoDtA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054948_626234_9C930813 
X-CRM114-Status: GOOD (  11.80  )
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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 336 +++++++++++++++++++++++++++++++
 1 file changed, 336 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..9f88645141d6 100644
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
@@ -730,6 +762,26 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8365-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mmsys_main: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&ovl0_in>;
+				};
+				mmsys_ext: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&rdma1_in>;
+				};
+			};
+		};
+
+		mutex: mutex@14001000 {
+			compatible =  "mediatek,mt8365-disp-mutex";
+			reg = <0 0x14001000 0 0x1000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
 		};
 
 		smi_common: smi@14002000 {
@@ -755,6 +807,290 @@ larb0: larb@14003000 {
 			mediatek,larb-id = <0>;
 		};
 
+		ovl0: ovl@1400b000 {
+			compatible = "mediatek,mt8365-disp-ovl", "mediatek,mt8192-disp-ovl";
+			reg = <0 0x1400b000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_OVL0>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+					ovl0_in: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mmsys_main>;
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					ovl0_out: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&rdma0_in>;
+					};
+				};
+			};
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
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+					rdma0_in: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&ovl0_out>;
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					rdma0_out: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&color0_in>;
+					};
+				};
+			};
+		};
+
+		color0: color@1400f000 {
+			compatible = "mediatek,mt8365-disp-color", "mediatek,mt8173-disp-color";
+			reg = <0 0x1400f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_COLOR0>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+					color0_in: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&rdma0_out>;
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					color0_out: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&ccorr0_in>;
+					};
+				};
+			};
+		};
+
+		ccorr0: ccorr@14010000 {
+			compatible = "mediatek,mt8365-disp-ccorr", "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x14010000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_CCORR0>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+					ccorr0_in: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&color0_out>;
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					ccorr0_out: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&aal0_in>;
+					};
+				};
+			};
+		};
+
+		aal0: aal@14011000 {
+			compatible = "mediatek,mt8365-disp-aal", "mediatek,mt8183-disp-aal";
+			reg = <0 0x14011000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_AAL0>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+					aal0_in: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&ccorr0_out>;
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					aal0_out: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&gamma0_in>;
+					};
+				};
+			};
+		};
+
+		gamma0: gamma@14012000 {
+			compatible = "mediatek,mt8365-disp-gamma", "mediatek,mt8183-disp-gamma";
+			reg = <0 0x14012000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_GAMMA0>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+					gamma0_in: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&aal0_out>;
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					gamma0_out: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dither0_in>;
+					};
+				};
+			};
+		};
+
+		dither0: dither@14013000 {
+			compatible = "mediatek,mt8365-disp-dither", "mediatek,mt8183-disp-dither";
+			reg = <0 0x14013000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_MM_DISP_DITHER0>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+					dither0_in: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&gamma0_out>;
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					dither0_out: endpoint@0 {
+						reg = <0>;
+					};
+				};
+			};
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
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+					rdma1_in: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mmsys_ext>;
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					rdma1_out: endpoint@1 {
+						reg = <1>;
+					};
+				};
+			};
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


