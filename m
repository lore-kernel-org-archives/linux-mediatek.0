Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE51C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0KWVZAazUejIoLcfyGV2EIZ0xgocIz1579DC73ilE8=; b=MyqJYeQQqiuUmibAQKK5YiCJGz
	GwYUx5AUs3tbSh68X1lISqoneuYynSqtzVkxRgmPREjkzwe2BmpzIj4TMT+g/16RDfmNpY8KLpvEB
	lFPeae6HonmqK2Vhlyl7CotzeHWzgUgmg+MKG3EFrKp01cU+3GLHTHY39DQ+hNyqQckkIBlqrNmhg
	JKJNjr7wd2cqvAwtrPMMvWRyhVOoCItRhtpS90jftvhpq/My3hE5H0arghZpDNIWTSBxgwS1eo1Ie
	qfFlQcqh/DBRdWJYuP9js4KKp+WPRF27YCQdsTOGPlpm/7sOESvlqShecu8yIX59HkNn9lTykgEox
	p0m/LEOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRnz-0000000BlbP-2uAl;
	Mon, 29 Jul 2024 14:56:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRfa-0000000Bj0J-3nBY
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 14:48:18 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4281f00e70cso6010055e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jul 2024 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722264493; x=1722869293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0KWVZAazUejIoLcfyGV2EIZ0xgocIz1579DC73ilE8=;
        b=xJGrQTF3FarMun7f8VBq4ndbNcN3a3eUUVcq7x5waOcKoj2vfmPULFRD6J4rx0KdWy
         +ScLI94j1/ukguN0piH2Cu+szkGL2SZmLkXgQYGtxagCtNkjpshrEZrNyD92HAIeaMR/
         WDMSs89uii4vdlOF8BMXMAIrKwjuNCPuP/UDhjnX/HOn/F/rSN/UkGtwTjpbWw4VMp65
         uSV9pFZF2fDhwmKxlOcmV3E3LTfM4NSsKUk1cBnVKjHhAHpoJsADBnOhzmD6ZiJoS/9X
         jFyYoXu5+zTnKKXPpXRDhk3c7yYS+p/OineRxk042xxFVs1cLvCnvnb0xl3B25OLmlF/
         piMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722264493; x=1722869293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0KWVZAazUejIoLcfyGV2EIZ0xgocIz1579DC73ilE8=;
        b=Vyi6RAxto+vePMAlncarZUqTYIKSCG4Wx0kqUF2HIOUr4RB+83x/A9o8SDLSV4Jl97
         G4TpxDRiu5vbbiKH3i+yO1CrkwkQaH+ujh88+3VyhaQE4F9CXTLqP9rPZcycpwTJ0r43
         wjRZ+13BFKpiiKajUivf+/dHy1+RlGjs0P8ThP8RAPuNU0I65J2+OUZ0ozsnHq0bL2v1
         NCDumMLgGriG1TTOJ//RCegDymYJsJ41nId5LeWEX/8bYXNW/5RTZMZsaeZkQwJv20nG
         wVY2qj2G9oLTTZeXTV3thp8NXAc7XGMaFj2tuuP6m/hE7aSKsTHstbiMjqvBqI8Zm1MO
         E6+w==
X-Forwarded-Encrypted: i=1; AJvYcCXAMj315Y6AqZU6DpPdtSfVmeqvyJAN7j10I9amD2CiZh2gGh4+aqKi5RXeHihCT9ZsVyI5MDsCeOIOr9NFeIsCfwF+MZOTUyIQscCcOug0l1Ct
X-Gm-Message-State: AOJu0Yyif4tGV6asAA17llKu9a3kR0ITfZgaBE9aOArLBoQh3MQnc1LV
	Hpld6lLfykQWh7h1x00r6jgA7x+9r4vGrAfsb4cYTR0Iftypp4uGxoyvJ7+ZbRM=
X-Google-Smtp-Source: AGHT+IES43dsB88pOWowCZDjQUgfhJCapGqHMmVWsAEmurz0DmUV9AN94vXTX24YzUWQSKDYVqd96g==
X-Received: by 2002:a05:600c:4fcf:b0:426:62c6:4341 with SMTP id 5b1f17b1804b1-42811d9cb8emr51617445e9.20.1722264493259;
        Mon, 29 Jul 2024 07:48:13 -0700 (PDT)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057b645dsm180091705e9.43.2024.07.29.07.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:48:13 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 29 Jul 2024 16:48:04 +0200
Subject: [PATCH v6 5/5] arm64: dts: mediatek: mt8365: Add support for
 camera
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-add-mtk-isp-3-0-support-v6-5-c374c9e0c672@baylibre.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
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
X-CRM114-CacheID: sfid-20240729_074815_261156_EF29FD8D 
X-CRM114-Status: GOOD (  10.76  )
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


