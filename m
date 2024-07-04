Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5158C3271E
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 13:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0KWVZAazUejIoLcfyGV2EIZ0xgocIz1579DC73ilE8=; b=l/dRm9YysX2TNu02ZBxKGfbNpU
	mfeOpiiKQdJeP+8niCYWXpt7WbttxdKNNG+g53o5OgJ48rrRVTltEvocfa6g1Cj+bOXufw1sclzFH
	bUgK74WgzBuQMWjihvis1PLhdFcLwcnlVuAc8Ro1jJDN6UmsJ2pT5Lx0u627bRM4XvqerSWF1mo4B
	CWLUUjEFfkvSnAEKO7GPCQxByLBlrqsmlpio1AgJ9xH5rgEyOL/Gv5+I3z+R1m6h7eNzt7iSfE+4P
	mpdWUYxVC7nQ8FR8yViQ/daU74CHW5gvdtIjdqT49rwlX0+7/YWz3Edy5096ynKR/Da/e1V+pw0o0
	iOYZn8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMet-0000000DJIN-2QsN;
	Thu, 04 Jul 2024 13:37:59 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMdn-0000000DIoR-1HuQ
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jul 2024 13:36:58 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-52ea2b6a9f5so207776e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Jul 2024 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720100209; x=1720705009; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0KWVZAazUejIoLcfyGV2EIZ0xgocIz1579DC73ilE8=;
        b=werQFyQyLvElAGXZ1qehhOUOLGmUMvuCVP+9YEUyBaiqfHD2OhlkKQYy7Gl3kHI2D3
         ZOVKkibZ559wJubIQu5qf4IBzAWcpHbhDfI923q5NXqbQUxjRyFfooECvJBuoBV/2kGt
         12af5favpVawg8rkC6IR6FDSrlSEmvdv7a1XtWDSRbSSI2ns7Wv+cXxpVvNiTE6OUayn
         669KPeRGHp/nT7/icZnZ12go9R6kOUi2chlMf8ZSCAjCzMrS6GGaUXVjPr3bL2K2WTd7
         1gYBh7fSS9sicXzGwL6H66hmOrlmHmpLhnyQTFk/ithvNyoH420gkly8LozWbzOdbxpF
         o5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720100209; x=1720705009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0KWVZAazUejIoLcfyGV2EIZ0xgocIz1579DC73ilE8=;
        b=JgUg7Wn9TeJqIeS2cWeS/BsgedexyoPyBGgkK0z4bj3AvUznh/x3yOujd8xaFQOpOw
         52DgpXIb79cjeGaB78GYFyGWM/+2KkN9ToXLl6AljI/R+UKjFOHeMS3zZCi8iiIyptZX
         tejxDRWt0xznjrwTdl818RBEprMQAdNYFOywV+7YfOXLJVeXyPSHKgw6IGpcqgp21Vkr
         cI5y3dqFRHuinbEPXq9zTErQB2tvjJCFwLYQ64Ct01lRX/apik4NmC0iseBNPAWOHH3s
         7X02BLyfW0VBFZOBGNeTTDevCN0hBf1C/BqlYuuXJ83RgwLUlIJSoqq0qD7bRcObTcIf
         BVeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg4JKdLwu22oPgPKc9A3ZWVp1mC0+MDVvGj20kNkdptgz+s0TdHKBO32OBQeRx2VOAJgewuwHDvCGIw8Cl7ffzONClPVfhehDRZg7Svgw71nAc
X-Gm-Message-State: AOJu0Yy5NJ1lNdY8qV0ULHvWywkp8s1520t1c/0y7zi2HGicv/gR/mD8
	Ax52Vhq3IQrVfV9T7zBN0UxvgK0V4EQ/WZ+pmWWzv8uGnOmyS9oKcMQ505ssxr0=
X-Google-Smtp-Source: AGHT+IE+XUgzIP2fhSWzqNdccIr/yDFzS1seo1QGzBE8M/IswaP+OxSP7/SNQRIVCTgrLI5teEx4UA==
X-Received: by 2002:a19:c20b:0:b0:52e:768e:4d1f with SMTP id 2adb3069b0e04-52ea0643b98mr1166545e87.36.1720100207994;
        Thu, 04 Jul 2024 06:36:47 -0700 (PDT)
Received: from [192.168.42.0] ([2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca5d5sm25382025e9.30.2024.07.04.06.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 06:36:47 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 04 Jul 2024 15:36:44 +0200
Subject: [PATCH v5 5/5] arm64: dts: mediatek: mt8365: Add support for
 camera
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-add-mtk-isp-3-0-support-v5-5-bfccccc5ec21@baylibre.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_063651_545820_DEEBA8B8 
X-CRM114-Status: GOOD (  10.70  )
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

Add base support for cameras for mt8365 platforms. This requires nodes
for the sensor interface, camsv, and CSI receivers.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 125 +++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..cabdb51f4041 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mediatek,mt8365-power.h>
+#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
 
 / {
 	compatible = "mediatek,mt8365";
@@ -703,6 +704,23 @@ ethernet: ethernet@112a0000 {
 			status = "disabled";
 		};
 
+		mipi_csi0: mipi-csi0@11c10000 {
+			compatible = "mediatek,mt8365-csi-rx";
+			reg = <0 0x11c10000 0 0x2000>;
+			status = "disabled";
+			num-lanes = <4>;
+			#phy-cells = <1>;
+		};
+
+		mipi_csi1: mipi-csi1@11c12000 {
+			compatible = "mediatek,mt8365-csi-rx";
+			reg = <0 0x11c12000 0 0x2000>;
+			phy-type = <PHY_TYPE_DPHY>;
+			status = "disabled";
+			num-lanes = <4>;
+			#phy-cells = <0>;
+		};
+
 		u3phy: t-phy@11cc0000 {
 			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
@@ -773,6 +791,113 @@ larb2: larb@15001000 {
 			mediatek,larb-id = <2>;
 		};
 
+		seninf: seninf@15040000 {
+			compatible = "mediatek,mt8365-seninf";
+			reg = <0 0x15040000 0 0x6000>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&camsys CLK_CAM_SENIF>,
+				 <&topckgen CLK_TOP_SENIF_SEL>;
+			clock-names = "camsys", "top_mux";
+
+			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+			phys = <&mipi_csi0 PHY_TYPE_DPHY>, <&mipi_csi1>;
+			phy-names = "csi0", "csi1";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+					seninf_camsv1_endpoint: endpoint {
+						remote-endpoint =
+							<&camsv1_endpoint>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					seninf_camsv2_endpoint: endpoint {
+						remote-endpoint =
+							<&camsv2_endpoint>;
+					};
+				};
+			};
+		};
+
+		camsv1: camsv@15050000 {
+			compatible = "mediatek,mt8365-camsv";
+			reg = <0 0x15050000 0 0x0040>,
+			      <0 0x15050208 0 0x0020>,
+			      <0 0x15050400 0 0x0100>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&camsys CLK_CAM>,
+				 <&camsys CLK_CAMTG>,
+				 <&camsys CLK_CAMSV0>;
+			clock-names = "cam", "camtg", "camsv";
+			iommus = <&iommu M4U_PORT_CAM_IMGO>;
+			mediatek,larb = <&larb2>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					camsv1_endpoint: endpoint {
+						remote-endpoint = <&seninf_camsv1_endpoint>;
+					};
+				};
+			};
+		};
+
+		camsv2: camsv@15050800 {
+			compatible = "mediatek,mt8365-camsv";
+			reg = <0 0x15050800 0 0x0040>,
+			      <0 0x15050228 0 0x0020>,
+			      <0 0x15050c00 0 0x0100>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&camsys CLK_CAM>,
+				 <&camsys CLK_CAMTG>,
+				 <&camsys CLK_CAMSV1>;
+			clock-names = "cam", "camtg", "camsv";
+			iommus = <&iommu M4U_PORT_CAM_IMGO>;
+			mediatek,larb = <&larb2>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					camsv2_endpoint: endpoint {
+						remote-endpoint = <&seninf_camsv2_endpoint>;
+					};
+				};
+			};
+		};
+
 		vdecsys: syscon@16000000 {
 			compatible = "mediatek,mt8365-vdecsys", "syscon";
 			reg = <0 0x16000000 0 0x1000>;

-- 
2.45.1


