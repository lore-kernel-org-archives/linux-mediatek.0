Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08813C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xDvvUPmtzf8YnX5VO4+ExnFhszPyGilyEKMtRDvoyg=; b=JL5HMGmx9P1InWwI4Yl82x+kz8
	3Ow67G6C7t3k+BEblNDGBWYp9qh4bB1K9vex01BgyupJ5J+Q7Djscq0fEW4o4rOTBB8QHmIqCjwFE
	B/2n+xHMLfD0i8t/k9vm41t82AOOxNCkZ8EMNjep7qR2jMPSD9/142ISxHQpE+lhmx6LENjMQMfKq
	gD7JO0CZXjhdMr60EtUqgKk+gkKfJfqyMv04wtEP+9kYxmdlLQNOpa4ujVG9L3hY9nnjCEsieAIOr
	44PpMZXmwCUr4CpAXHtr+Ht+aCJgirWCUEqwAWkpywMtewHmT4K2S8DDkKJw0YMUlAE8Chkfa63cM
	LCcdoV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlA2-0000000CsF9-1ijX;
	Tue, 16 Apr 2024 15:55:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl84-0000000CqxW-2k2O
	for linux-mediatek@bombadil.infradead.org;
	Tue, 16 Apr 2024 15:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9xDvvUPmtzf8YnX5VO4+ExnFhszPyGilyEKMtRDvoyg=; b=mezcN5w2T8RdEt432jQtN4y8G9
	O0/11EQbfRMOBbdaHNzjtPxVU3Zx0rhOKVoSwXwusjCvbP/6iaCMEfBVhH8i26TZ1cJNdmqL+AYnD
	x3OSw5MtrPFBQ/5Y+Ba8qs3/Mn1mUwSu40hLh40J2UKjGcETB7RajFecZJ5DCeVgs02z1rHe/dq+Y
	PNH1/gRTP6c2Hvm9ZASZp0FyQFJ8X2NAoliggmGsG13StEyCiWZ7T3nx365JIwZXDyIutIk14x+ov
	JZVMWJWO0etlNT0sUxljLbC6S6AC3tthAwyxayLjUAXNMWb5gh6KpxL2yXwFRV66F0HWQGRFuQeW+
	Mc5RoR1A==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl80-0000000B8fq-3IEp
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:51 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5701dec0c0aso3296953a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282827; x=1713887627; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xDvvUPmtzf8YnX5VO4+ExnFhszPyGilyEKMtRDvoyg=;
        b=2ZM1/+h0duEqi6LRB/bxkW1ga9xkeZV+cSmY/jO+aHUsf4s/7QGUae2GE+Sa0iyIVl
         V8xAw7sLPCygMo9K/ucyArRYReSDehtuDO30GuoNwmma7ikuN+2J6CfsoNVy0vFlckYN
         0VfL3zKINBfqrG2C/wGt7n1J3A4yJCHDLTpTg69cXkxwO6ZLMTCEvGGtpyo/jmKqJYyS
         xV+TRKK2f0GRt3eUySOFJfB7HgBaD04Xz9YLdLL+udjZyzgcnnG4T2CG7kqyCnB7ij5g
         mgnkXzPU1ZJSnHBhO1R+PjN0NJwPVLkNEFUIK/Sa9aQ860q+x+UxYPKbQEEKgKYdakBF
         9Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282827; x=1713887627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xDvvUPmtzf8YnX5VO4+ExnFhszPyGilyEKMtRDvoyg=;
        b=kGz9y74UNRO/8fcS7NrvS7BIo5YIoHUxgEO0Y3BKDe/kH/PeuGH+pYuvrJ0IaC5mg2
         9/b+5pQeOuqbdbjrR9E3xOSOXT8xZxVC6WK/1Zw+b5Fb1vjpiRejDRVlRcjziKJ+WXaU
         33o5mW7XMdlvlGDNg6Gurle4INBuUQ64MBpxVgTxRL3AIjHHsPWBaqSbOaacZophnwVQ
         lknvDZCdjBo/32WaB83nMVvOnlMWovhXM8yDj4RrMVE9ySHxqEWpj9Cg/Bx6u8Uwx64L
         CukplxjQeaXvqCBSR12++rO3PaJaV0vYJQFOK/zEYxBNxIw8NkRm4SgVSBepqZ6VgrQr
         jteQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFKiT4fiCU45tcU/tWUBCiReTdLHPMP7weyoJYmZ/7fS9g7eDDUH3uEDFJlzpICFx7IbKEniig7Y4/MQAURdjv4lmzoOTO6wJm5qnQY5e8g4Fq
X-Gm-Message-State: AOJu0YxjbES6AnFM7f++45Kd7S0bfMzF5+DfximeufUG+XyK5HxHmezG
	mtxPXop691SWr9B10yKF+oQS1N/3vKTV98N7Z6GB/11yL40LJjTIgW+d1pj+bIs=
X-Google-Smtp-Source: AGHT+IHqNP4eDOND/pFYT6lJIoBvlaJeTeBp+Ry8h2SJ1b6D3Xlvm3LQ0ugDLQZI0f8tW/Be9psq0w==
X-Received: by 2002:a17:906:54e:b0:a52:6cdc:c83 with SMTP id k14-20020a170906054e00b00a526cdc0c83mr3507234eja.64.1713282826850;
        Tue, 16 Apr 2024 08:53:46 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:18 +0200
Subject: [PATCH v2 17/18] arm64: dts: mediatek: add display blocks support
 for the MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-17-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7069; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Je6MV7zYnEgJBAa2y3wMLhKFqHHT2W/QwQ4yB0KiBX0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qQc67h9xNW7lKwOqsAZ3Awb5scXlRwhswlbAG
 QHw8dqOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURQt2D/
 4shkLROp4fn+W8X8AYfb0+SNisDC0+HXTJXzj/kLqUswJuSRpCpG9qKW3DdNyzo/jeUF2yuY5XtsjI
 +1VprTswJP/Q43UJauQVODzpI39BKk5jlq2awci+ltU+b540du62GsCocim+JNj1MSMLT8R/MXfcqc
 d9YGbkXJljT9cqDnN0splwAnA9i644til2L53dqsWnHIJEcoYdcdy8SnslSh14csHT89E2zENgArGZ
 JKl3XffXEZtZ9kr2kn8KGhp2p3gR6e5mxPNuro8FcN2kxr3lZwDz9VyLfw3sSTGh08b0nWKKEdHVKE
 lQLGmjCLUkeqywtUD2QJbUUH8I7a6/nzoLl5st2ytSHxdgWQmWI8jOrypayX/vGGkZyYRuzIWBCS2n
 XQDtlay+oBOXwkqKHk5Sx+iJLtHvxsU/7LX/rK6NbPzz0CnCaSWj50gxYFslCxm5ITSZydTqXAPgAB
 kGOPHpcywWP1axdoYPlIxbuxxrlRylJrgjNtzwWN8ve2fSy2LI3z4qHTJi83K8kGJRxTB8PP263EgA
 28uC8eQwWOyebX32OL95YfUiKsPJJ9RwkhdjWjOiqqrHGH7JiwosVNiiCK2wWWT5ccxOoLtKrOX/9W
 6FI8HKw+Tsq8KBDKVmNVQahuDPUswOtm+o+/+y5yWpIDbtOy5Kpb8NpuwMFA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_165349_068721_B1D39FA2 
X-CRM114-Status: GOOD (  11.68  )
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
index 24581f7410aa..a95f90da4491 100644
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
+			compatible = "mediatek,mt8365-dsi",
+				     "mediatek,mt8183-dsi";
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
+			assigned-clocks = <&mmsys CLK_MM_DPI0_DPI0>;
+			assigned-clock-parents = <&topckgen CLK_TOP_LVDSPLL_D4>;
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


