Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA31AE77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2025 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0vdEZ4/pRHsUp9cm8HEUVp7ajHvoJqZ5Fn7zAfqqbs=; b=sorEjMb3/skWEpUdH7XA9cdAvt
	GO37w9rC2NzdhfmHjkbIL8cjkNWgjI90k5NN4HJGDOhOtKyTF8WQoDPrddMyaWX0qYTTJaYxcQ/aM
	1j1PAPnPg5IbxrEYljTzS8r6G5jpixOmwnSwQ3fw5ZZ6K8ZcUlaPlKql6HWEW9p+zG5GoQmBCnJxz
	qUp8+QWDvHuQ+XPdjYNDCIE8/ZO9MbrvTZSjex4oTkVSbfImjLUnBupGDd74IM/vV4QCVuRLofonN
	dehbCJugTL9qQnw2Du8ZFAShPLBrVHsl56xszBQEyIecglHctAWAnggdkdDpXHqwVTsywBh3dJr0F
	xP44miGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFCw-0000000FVHw-3QjT;
	Fri, 10 Jan 2025 13:37:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6q-0000000FTvi-2wP4
	for linux-mediatek@bombadil.infradead.org;
	Fri, 10 Jan 2025 13:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+0vdEZ4/pRHsUp9cm8HEUVp7ajHvoJqZ5Fn7zAfqqbs=; b=e5PlJlcQ9I7z5OPH/66ikz6tm3
	RFRUvnIfHlZ7J6ZzkbeQCUeaAeN6D02ljeYhIoP9aKqI1FuSvWAiFs6obEFV2xwDscBshmPtVkeDN
	L81aDwp0rrscUXfzFbmmqwPOs0uxEr97ezP1c9Mcpudl2j2lIjF5nLTON9aUT5xmbdb5uzXCpxPIj
	dMAmaRNTauoNTuT5SgAWXQybxbUY523hT2ffYB8Hjq7k3msJ8dOwz9G4vj5elqF21oBu8fv7VdMq+
	ecSKLA7Y/dP54Jwt2YXWTZVKTLvZHO22p0yofaaa0QvOa24QDXEq3t5O/mL0Gb4ssyJjQATHcffpz
	CP8G9C+w==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWF6n-00000009mAX-3xyr
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jan 2025 13:31:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso2077371f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jan 2025 05:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515888; x=1737120688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0vdEZ4/pRHsUp9cm8HEUVp7ajHvoJqZ5Fn7zAfqqbs=;
        b=KQ4nHqqATd/qAgQSkGo5jAcfK8IIQ4ais0l0D8li5mkdq9O3ctLVA5hhdlCVkkBEDh
         eyS8Tz53dO2aRkue9aooQ+U7qWkgkQLN66A7H42zNw3jGwpOvsCRBiFVuAWq7DGzOl2a
         bE43tP1+obyYYVWARFO8Xvkf7UwLlFOqf1d+c04iAJTdtzmGrWSd6UB23WKFDmDSz1tG
         MqZYNF77WznyqvdiaMTqhVVFK2O2esgTXBMCKEaTnwJVrxheR2a9jvgP1Nm08aOjwAwM
         aE8JoZVGj/wyESnr57+87gRQleh7TcvskXcRpG87/iz2DXglp/B1fnmrwbwbD2DNbmwS
         mTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515888; x=1737120688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0vdEZ4/pRHsUp9cm8HEUVp7ajHvoJqZ5Fn7zAfqqbs=;
        b=qFQPrKntKMrDmKLp26rTOfGlaZigf++fRzV9RVfDKdAC4N5YDRfhQXZRatbvuGcRMv
         2z/xWAkn8a0AlMoIm9jdCILvbHYuEOFSSoi6i3vxUwsSsTyjv5PT1o0Tl429Vxnt7kCr
         xJkVBd94JLCmcvGie+js0glKoe2Rvu83Ywds/w/lXZkVxNEVdcglW6XUiUJk+tQhIHGo
         b+gH5ctK9juUj9zHx06UhcsSs3r9/Jmc/3PHa65Uo+CDOy1+jhIAWhDAtIawLbBD6hTO
         DK44UUiMtXuTcAP0WTYBxZuwC4LFDDGXXW630h/3rlN8q4jt/TEJugA4PNc4nmIeM+mQ
         aEmw==
X-Forwarded-Encrypted: i=1; AJvYcCV4sx/vheNedJOespwsXvcjjOl0anNauwdkdbYLViFwbW5k3Ol3G6bTg9xwkblbtyLoKQISYlfJ/QlFF49dtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxTmqFTCbr1aEp/Q7hCqGJtKskbSPK/m3JNSCu93Q0I6asXoBf
	dFboeiBObX77AghWGmqIqcZJDGZzPznFSbGwBXpUkjFmXmVHOhE+im2SfpDYYWPvFybtgf7gCik
	5QTk=
X-Gm-Gg: ASbGncuc2KGZWPVqCpKV8qPL4nV7aq0C7w7QnVPgWad0MM1mQmNzSbjcjgvGsidyG71
	moQMeUSQLobl1VM4xYPzVXL8nT5VQkV4z85skMdIgBfK55xf0ZKuydJ6PHQWOpnH6uwdInxfRu2
	8MPmMxdsmGXzkYlELRkchzm1ruWDl4wpNW6yCOknCAyQ49+/IV4oNZzlT+izJ9jFHjYHHU6YiPA
	Tj5W5afvRuZxNNUE3wwEWkOiqd/y1qzyab+f/bHXx2veHTBliLhH7s+waln
X-Google-Smtp-Source: AGHT+IFfMAh2JaR0t80N2VsgZR7cjryTPe8kE/cEI3QSekxtSPLAeT2emtZmRY3kopEDIDNrOMRjFQ==
X-Received: by 2002:a05:6000:712:b0:385:ee3f:5cbf with SMTP id ffacd0b85a97d-38a87305369mr10032616f8f.20.1736515887726;
        Fri, 10 Jan 2025 05:31:27 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:31:27 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 10 Jan 2025 14:31:15 +0100
Subject: [PATCH v7 5/6] arm64: dts: mediatek: add display blocks support
 for the MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-5-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10929;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=+OaC+AS/ZJpzKH7N8zU/4tgRlbo/T8ud5Vnk6GoVL3w=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEnPwMFjYzMaBFfO/Sq6y01Xk2waqkyXb7hWlXE
 LjKwbOWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURS6wD/
 9x/2GE7BKkRFhoH4+VVtGcmMFGxmQYDTjniSRkhszKSbdSj44cFe6fW9QF4VNWFy9yh4J5SLHCVfC6
 uf1BDilgAYQziKHsK+xZjkhkpsqYYfNpABFGQR6PtOSlCKATeahQSf8phrBK7SzSOdStXmWoaU0+Yo
 pVNnZX2msGcM8wIOypqhEZ9uIUvM1xV+S1f37E4JfHrgTNs9d8DKv4FA8rKkccKUlRba9we11fYPIv
 Br5tly2kELCh30/BzrMOC2RNbNsPTQ6Wq+vtpyJEObrwSPLBIX8xx00LzmvyN6X7BcwRFdRXMXXmqZ
 k9hSro3VeCYoQFbz4H5M+Qik40Cc/43+gtNllnCxzaaZz65l8+cTppDU+JzM9JQxdP3ZV/nbYoOD2t
 C5En/cIXD9Y02G9/3IBmmzRYNbn/RP6g3TsdI5BO9YuwOThtu7sj1rKiW2ydpa55KREtwnoQFzvti9
 zJbXC3rOM/mS1sAojNOD8XKzrQ9UJbyKHt4pPmKJYT+rrauh7WbLgqA80JFSO/3Py/sQmMzH/Ffv9u
 wvIdjiZv16dikK8TrsNWrAKBWwn1xSP5ejygtxr6l/T8GCuBlcnof0rvvXOyG2Yu+N4ETJkSLWUx1n
 74XEhj4yMCvTdDTzgB6eAi/6SRG/AV+FjPiOtArWf+fC4N8q9hrMKd8vM0Dw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_133130_147999_069C4D0D 
X-CRM114-Status: GOOD (  11.78  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 336 +++++++++++++++++++++++++++++++
 1 file changed, 336 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 9c91fe8ea0f9..fdd570ca2d20 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mediatek,mt8365-power.h>
 
@@ -19,6 +20,19 @@ / {
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
@@ -608,6 +622,15 @@ spi: spi@1100a000 {
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
@@ -704,6 +727,15 @@ ethernet: ethernet@112a0000 {
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
@@ -731,6 +763,26 @@ mmsys: syscon@14000000 {
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
@@ -756,6 +808,290 @@ larb0: larb@14003000 {
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


