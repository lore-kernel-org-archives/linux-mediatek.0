Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17776E81A40
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Feb 2026 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJLEWAJZbkTSUhDN6FgXaNbVOkziSPvNw1KOrm6JAtg=; b=xrR7KpxvCVENotNpbnTTCY0i5x
	Cpj+kctdt1pzA+AEYRznGyl1msYb2xd879mdH0lHVHqQLC8ge9J5TyJsLi7HgxHsmRangLqRUNWw2
	c5owRBeN1CTtsUtDTm5X1LDiM3Fewq0UFJt5fn0F1BDihl+WBzOP0TempMaHb/rtUPJAbBc0z3MWf
	HdcPOvMebLAUYEhzLMScWYv3Q27Il08Nk6wsgN2GJXAfd/R7KU0vkL8fyeiRaRLAU1lScjZy6uq2Q
	8Wzs6coDOmg04eV+gSpeLMPqonfTBTJ9jqMJeJbZbnGvlsYhfoi7jdu/1dDLS4eDJl6ehesWbSEiI
	L78/NpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1PN-000000071BT-1o1D;
	Mon, 16 Feb 2026 16:25:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1PD-000000070vc-2gNQ
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Feb 2026 16:25:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43638a3330dso2694189f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Feb 2026 08:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259102; x=1771863902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJLEWAJZbkTSUhDN6FgXaNbVOkziSPvNw1KOrm6JAtg=;
        b=hW/RxH7fr9SPmbakDC2qnh0I4AbfpEkhAMVtDggWj6s2fjZpqkug5AGvU5xECJGQmF
         hlYpCeKmSmOxnwmDitMEOFoFdaM8nDwOP3uupFWvBH+ejAGcGGIVUDgJyUgxka2G37pi
         kjLYHF4vxsOSaaPuTjw9afMdfSls4FRQWpi6shr5H/JW72d7Q3yp9bokxudDxkZo3qlj
         1K2FB6ZJPKIn9p/xa8YdbpuHdckd9XfXUyw/0pYXVbO4158xwogh91OBoGcTERMS76Df
         om5Y+6Tv/1aWb0S0eFdqbVKMOmKVaSFLhrnFFmcFuDFow73kDZ65sXyRayLfKFwuSzmO
         RVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259102; x=1771863902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJLEWAJZbkTSUhDN6FgXaNbVOkziSPvNw1KOrm6JAtg=;
        b=WVqalUjtjgyUKsZ9++e6UYwHP4IQyQpGEQ6+SRHjGsqbyWYthtkOz8KpW5WO3EFF1E
         utRKsCna0fYLodYJRLoqtctQfp71HpKEoww0IMd8l0hh29hhE9XbdORPbF/S50HJ/z6d
         AwdQ9VTW3cVsuhaIcVyY8Pmsvqv2jgh4jcXVe/xaRrOiOfs83i7mHEhU0myLzltuPh0Q
         l17trlPWp6Oi1o/sH1+N5F79AYv+jj2IBcIePutWXb9Mfn5ztHDkIjbS2kn11n0JBKws
         4uFxFGe3uaGWS3dQn6lD3AIn4356ud+Rm7rbSFj6HTjJ4iipVAt8AJ2Fy9rADT0IC31y
         dTuw==
X-Gm-Message-State: AOJu0Yz468c6L+s1yQT0Wrrp7qpGiZ4Ghov8kYTq2dg1Uq76uFwCwuC9
	KicoZhj2liHoIIgypcFa93o3ak3B3YchQXUt4Ug2o1ztYHYq9nbNFOn49cMUFA==
X-Gm-Gg: AZuq6aKEA3B8dJrJjUCeZWhGN9cUs8YX10JpggZqiOuDLA/wOaQxsqw6WJkqWvmTrGh
	y9uRgh8MeEnFlzuqGX78Uh+yG5z3NEuTRj/oU8p1kljSBIesujjrok6rqRg03d1XkO/iOCF2suC
	hISBwrLQHvILQ3skAEe1tltzRGVBvFwz+ZjMAmBUuv+z3EnNO/x33zjBNs6QMhNymyDIiCXuwac
	0LR7vetvSbygtFh2OpICINRJHNd1ILeh+4SGljx8/aph/j2z1SBieK3kJ34i8lwmqG1zwLRkiQm
	ejHjX6NaZJdgrls8HuvRHpkUp4/4641Aa5/sP7aA5D1jkf/y1kl5NlUE1POBUuC7TzvnkhyRpjX
	EQnAeMmHCCtG2bKLHmZbY9+L2JWVxN3sBFgcizScKmnrXcoKDM7G4YLweTZRs+uYgvm1PoU8uSX
	NMXcOotJt2PrKjL5Swh5M=
X-Received: by 2002:a05:6000:613:b0:430:fa52:9ea9 with SMTP id ffacd0b85a97d-4379dbaf10dmr16510236f8f.62.1771259101433;
        Mon, 16 Feb 2026 08:25:01 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:25:01 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 5/6] arm64: dts: mediatek: mt8167: Add DRM nodes
Date: Mon, 16 Feb 2026 16:22:16 +0000
Message-ID: <1e9cc053a4e80acfea492aaa186ed493115f318b.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771258407.git.l.scorcia@gmail.com>
References: <cover.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_082503_737261_22700597 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Add all the DRM nodes required to get DSI to work on MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 317 +++++++++++++++++++++++
 1 file changed, 317 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..c131513ba240 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -16,6 +16,20 @@
 / {
 	compatible = "mediatek,mt8167";
 
+	aliases {
+		aal0 = &aal;
+		ccorr0 = &ccorr;
+		color0 = &color;
+		dither0 = &dither;
+		dsi0 = &dsi;
+		gamma0 = &gamma;
+		ovl0 = &ovl0;
+		pwm0 = &disp_pwm;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+		wdma0 = &wdma;
+	};
+
 	soc {
 		topckgen: topckgen@10000000 {
 			compatible = "mediatek,mt8167-topckgen", "syscon";
@@ -120,10 +134,303 @@ iommu: m4u@10203000 {
 			#iommu-cells = <1>;
 		};
 
+		disp_pwm: pwm@1100f000 {
+			compatible = "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm";
+			reg = <0 0x1100f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_PWM_26M>, <&mmsys CLK_MM_DISP_PWM_MM>;
+			clock-names = "main", "mm";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 			#clock-cells = <1>;
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mmsys_main: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&ovl0_in>;
+				};
+
+				mmsys_ext: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&rdma1_in>;
+				};
+			};
+		};
+
+		ovl0: ovl0@14007000 {
+			compatible = "mediatek,mt8167-disp-ovl";
+			reg = <0 0x14007000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl0_in: endpoint {
+						remote-endpoint = <&mmsys_main>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl0_out: endpoint {
+						remote-endpoint = <&color_in>;
+					};
+				};
+			};
+		};
+
+		rdma0: rdma0@14009000 {
+			compatible = "mediatek,mt8167-disp-rdma", "mediatek,mt2701-disp-rdma";
+			reg = <0 0x14009000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma0_in: endpoint {
+						remote-endpoint = <&dither_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma0_out: endpoint {
+						remote-endpoint = <&dsi_in>;
+					};
+				};
+			};
+		};
+
+		rdma1: rdma1@1400a000 {
+			compatible = "mediatek,mt8167-disp-rdma", "mediatek,mt2701-disp-rdma";
+			reg = <0 0x1400a000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma1_in: endpoint {
+						remote-endpoint = <&mmsys_ext>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma1_out: endpoint { };
+				};
+			};
+		};
+
+		wdma: wdma0@1400b000 {
+			compatible = "mediatek,mt8167-disp-wdma", "mediatek,mt8173-disp-wdma";
+			reg = <0 0x1400b000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_WDMA>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		};
+
+		color: color@1400c000 {
+			compatible = "mediatek,mt8167-disp-color";
+			reg = <0 0x1400c000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					color_in: endpoint {
+						remote-endpoint = <&ovl0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					color_out: endpoint {
+						remote-endpoint = <&ccorr_in>;
+					};
+				};
+			};
+		};
+
+		ccorr: ccorr@1400d000 {
+			compatible = "mediatek,mt8167-disp-ccorr", "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x1400d000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ccorr_in: endpoint {
+						remote-endpoint = <&color_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ccorr_out: endpoint {
+						remote-endpoint = <&aal_in>;
+					};
+				};
+			};
+		};
+
+		aal: aal@1400e000 {
+			compatible = "mediatek,mt8167-disp-aal", "mediatek,mt8173-disp-aal";
+			reg = <0 0x1400e000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_AAL>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					aal_in: endpoint {
+						remote-endpoint = <&ccorr_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					aal_out: endpoint {
+						remote-endpoint = <&gamma_in>;
+					};
+				};
+			};
+		};
+
+		gamma: gamma@1400f000 {
+			compatible = "mediatek,mt8167-disp-gamma", "mediatek,mt8173-disp-gamma";
+			reg = <0 0x1400f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					gamma_in: endpoint {
+						remote-endpoint = <&aal_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					gamma_out: endpoint {
+						remote-endpoint = <&dither_in>;
+					};
+				};
+			};
+		};
+
+		dither: dither@14010000 {
+			compatible = "mediatek,mt8167-disp-dither", "mediatek,mt8183-disp-dither";
+			reg = <0 0x14010000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dither_in: endpoint {
+						remote-endpoint = <&gamma_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dither_out: endpoint {
+						remote-endpoint = <&rdma0_in>;
+					};
+				};
+			};
+		};
+
+		dsi: dsi@14012000 {
+			compatible = "mediatek,mt8167-dsi", "mediatek,mt2701-dsi";
+			reg = <0 0x14012000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DSI_ENGINE>, <&mmsys CLK_MM_DSI_DIGITAL>,
+				 <&mipi_tx>;
+			clock-names = "engine", "digital", "hs";
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&mipi_tx>;
+			phy-names = "dphy";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&rdma0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_out: endpoint { };
+				};
+			};
+		};
+
+		mutex: mutex@14015000 {
+			compatible = "mediatek,mt8167-disp-mutex";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
 		larb0: larb@14016000 {
@@ -145,6 +452,16 @@ smi_common: smi@14017000 {
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
+		mipi_tx: dsi-phy@14018000 {
+			compatible = "mediatek,mt8167-mipi-tx", "mediatek,mt2701-mipi-tx";
+			reg = <0 0x14018000 0 0x90>;
+			clocks = <&topckgen CLK_TOP_MIPI_26M_DBG>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		imgsys: syscon@15000000 {
 			compatible = "mediatek,mt8167-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.43.0


