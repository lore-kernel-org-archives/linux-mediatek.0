Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DDCC02181
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2025 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjObFV+5+IOFwxOPwnSxQhyUg3oWIAesTKvlJmdJGqo=; b=lFv+6hmLbgaB4Ee2KcuLp+uYwC
	Wauf3uYKYAsPUQxtVGBTqb6MBYodzkJ2LmgVQH+jfpRUxwRaaArBz4XNbbVIevVzDhkDHAEq8Fzre
	X9gbV3bq2K/DzYhVxcjtHTtbixQ8r0gqfy/0ax0JoIYW/QQ3OtLJRgq6CHw4cUyByqpRnbP6eCwbi
	UUjxyTthvBGLzKB2NNxYWu2eBqBC6hLmCCqp/BInqbpWCiWSMMOnPlZWicIVVjVZNRrNRTGzdTbeI
	x/EUxa0kJygccTcRhGQYEkHRPof73hyjlXpf2fKCS9uNO2Z9+f6PuTY3pC30VvXaOwvd0Q0n1AWRB
	f+dLMXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabMc-0000000AMzQ-1bog;
	Wed, 22 Jan 2025 14:05:50 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabGJ-0000000ALvw-3J62
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jan 2025 13:59:22 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385deda28b3so4380568f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jan 2025 05:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737554358; x=1738159158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjObFV+5+IOFwxOPwnSxQhyUg3oWIAesTKvlJmdJGqo=;
        b=qRch1QdyiOVl9SaUbQs7WSEpwQX1YA7kSontW8DiIDt99+LC0S7q7pYOWe0sBBjs/W
         pUUfFzbvKMdbs2CSPND4sKyo8du9+Wlo7+lHEKGwsfasiv1hfKKyJ7EqDuEB7spv0QjB
         sY/+oha9ipFuf8l/t5NBiT++FgydSGCkDXisVb9kxVVDKqD73p3Tub/yIwxbhLtB6DQT
         bST8BXyK/91bEarboBzXvlFxFrJhIIa7cQwFStdTXGSSo4LhO5RxLGOsPXuuSXUJiis4
         610b9qAdypSHWxBXReTnNxGZEEhAT5YEM5MV3IYnslLcGnxYJ9seU83YJOdrrxpFUYJC
         rNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554358; x=1738159158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjObFV+5+IOFwxOPwnSxQhyUg3oWIAesTKvlJmdJGqo=;
        b=QjcdCJqD8j2sfq+jFWsjtZddeH4EqebN199lJ6+mlnHXOPeRMrMjh9uKjt4DmpvMCw
         xXbMIl/yDkVXenoWLkuZfhLFRpTf7Y8Giuuxh3ul7vicD9zGjUwbrpraFkml2qqCc8gW
         hwS6C/UrfRSqBzAFm0UgeC3PwNSR4mFvwQpdenj5uUEz11JxBSJUQ0Fw+/AeJ9aXJwjA
         STxAx+25w0v1Uz0G93Ti5TCMEgVer6A9XPnfQ6ouw1oEF98I+NfEQlELMI/0Qme3VvpZ
         +7wUkIor3sg1M6O2jY829o/ZN524U8C6ptjLt+4pJhMexmFk0NWod3Ksc3/Ju1dkNhLU
         jI0g==
X-Forwarded-Encrypted: i=1; AJvYcCW4BFrlw69F4nqyP5XCwA5EHnB2APYRWtll0C+4ISeSabWm7mxpQirTxepZCtlzLtZvGk/dM+ZjBLcXiQT2kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtT9ZxNQdApuWJi7M4VooVQH0TkZY/szw1PlP/Sz5/bZQ0qlfq
	GTYpi1KNXdYKlPvsxYymMFU5pXCy+MM40q9muCrPHTrCqikZsEj9n9/75HwVrbI=
X-Gm-Gg: ASbGnctcRCkU7Pq83Om6pi5YDPYVE3+adH0zfMvk5B9tnyY5g8cqfUb2rWo9oJIQL6n
	+r6U4DymAbGjj6xg5ESEB7agKYhJQ4pJRkC8dOMnuyPHh9sSMktY9xr5AtzxVA3bcUB96fpgRm6
	rnYeXIYk0vnobHDbb0EsGi6n1iani3wD+HgLFoYCGVBqSerBPCp3K/LcfDJJqweSQPDytEfJ8r9
	vTv98VdJ0zE6GjmsnKBbFE6FM+UzIs8HUYmOiGmPGBmMjFidRfll7BIPOxajk7tebFjJXA8eTL9
	hXK5ndg/T5dKe7wsPMMxMrlbs/3eNvP+PgnF2Y9DlUtXvAF/Icm9XswXIN4FCrJ7
X-Google-Smtp-Source: AGHT+IEcBubbGcRatIlVSw9RDhs2ejWQE884JQiPuWEigDo6YpqYA+Dt/gIHnHhfGQdtnsFdI/cyCg==
X-Received: by 2002:a05:6000:18a7:b0:386:4312:53ec with SMTP id ffacd0b85a97d-38bf5663683mr21211301f8f.17.1737554357727;
        Wed, 22 Jan 2025 05:59:17 -0800 (PST)
Received: from [192.168.42.0] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278f06sm16418985f8f.70.2025.01.22.05.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:59:17 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 22 Jan 2025 14:59:14 +0100
Subject: [PATCH v8 5/5] arm64: dts: mediatek: mt8365: Add support for
 camera
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-add-mtk-isp-3-0-support-v8-5-a3d3731eef45@baylibre.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
In-Reply-To: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_055919_827219_0A1BF8DB 
X-CRM114-Status: GOOD (  10.90  )
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
index 9c91fe8ea0f969770a611f90b593683f93ff3e22..f3aae8d76cbece5779fe0b23139d594c0ea52579 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mediatek,mt8365-power.h>
+#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
 
 / {
 	compatible = "mediatek,mt8365";
@@ -704,6 +705,23 @@ ethernet: ethernet@112a0000 {
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
@@ -774,6 +792,113 @@ larb2: larb@15001000 {
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
2.47.1


