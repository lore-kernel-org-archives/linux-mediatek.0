Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19560D75BD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2024 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sA8zIvCeVehOTON6gWSJevS8rNPym+2I4qMSEQq/Vfs=; b=pYDhVpzg+xmH/d8xLW5u2tQXNM
	6Wd7YQE34BdNMVr/5sYz22JRyLtP6SlGhCdeFz9kE6YW3Ty0Xrld+ll+uM63mhnTojxCuxELtSz1m
	wqFMECZZ6wH0+yz84FRNvds5arKXUKQPTcPfhtRgbXemdmN/GhFZVZovMMVN/fLCuD+1RCf9FT27L
	rvoNWTZWX0+nZEp0hGERkry5DINbiCgJFOR54KP14mbuQPCPL28JOlxYGQEovoxLRV8ElSyHS7mTg
	PazCzGw1T6kW/4mJTcv4QowHgNO6Z/ornzni9zNu7zP0IYfkZt95QYOK2Kod5U8BY90BDi7YRsYHW
	YXSNu1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE31k-0000000HAA3-08wf;
	Thu, 21 Nov 2024 08:59:04 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2wE-0000000H8xj-1wqy
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Nov 2024 08:53:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3823cf963f1so356326f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Nov 2024 00:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732179201; x=1732784001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sA8zIvCeVehOTON6gWSJevS8rNPym+2I4qMSEQq/Vfs=;
        b=dhfp1G4T+cWUp5RrvFuu2YA/Fc7MIoE78FVqgECTJ/Tth0Sx9ZuBx5nDciv3FCRMez
         W7P7aa8MD3Ii0aZkB5eiMHP6XcHyKT0rJwO708RHjvDObAoYKA1w8AKd2tf68nca7LUf
         OHFpEJqvIttgiV3dHY6y+Z4l/mSYqdg74rf2Z3NhfIg5M6CMxQQ1jjWFTZPI31yZxjVx
         qCOxRAF66F9yUwUQSQF6qIHOmz3TlLq6LM2Z7FxMq0SRZXIV6/EiRmN0xStUyHZZ5ojN
         +O9GQ9M+rsGzJ69LETVh0d+vohBi2xNSDbtRQGJa/q+awkjPDv5rYygKSpXz6p7wi4C2
         sRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732179201; x=1732784001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sA8zIvCeVehOTON6gWSJevS8rNPym+2I4qMSEQq/Vfs=;
        b=SLq63MDQ+8Vp0VZqUIIFYIsKI++4WOa2kBND3XoIW0v8AsVXOycKL031CYcVUHGdEi
         LlzBRuLwJgfYLjl40nVGe7q00oLaPa3jIG7Q5M+nfcDcB06p85xD8a2kY5dmcSq4YZLv
         Nuc+9TG13cqq+KF6I1UvZFx+ZOGZZptDW0n2moIdxqGcubeegH2EVhdqqyqYkcQhaeQi
         fvn8EXoTPdxfNG3aIw2iEc7FvHdMs3cPX+QH3Q3hDZTkjiJdm5VDB6w3m20i9Nx04o0S
         YyCPbMYSY1q9kgJHeMR2EsivPm0xjFGA26q9Wesjm7iZiKakVxkrA/WRBWqj41cDLgws
         hP+w==
X-Forwarded-Encrypted: i=1; AJvYcCUITkzoSs4BfKONP6XApG6hgAsUivF4CbnW9c+R5yI2c4p007ssAc8wfQt6CPfJCWo8IpTaD54LE/z85pXrCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHfxAo/4RTPQyXUdY/5Q5/ZUP+AOMZ+MULplPUl2hm5hQA8QHd
	Ei54BgYfiFKTBspna4aL/pl3JPFd+fmn/QNaYXZIs9BPSIuL2FS4zH75lChZrR0=
X-Gm-Gg: ASbGncueNrRc9677SEu9Vocg+OHCVe/yiTvd6WUeTvOBhRx3YbGKhj21ZlkJacdAgvt
	WLRWKIp9gBQGmhs27cYlyLoOlCdGd8YpqbK7Szv2gVY9n/Z4HlQP71SM9vYjjtlSm7G9ZD9/nK0
	8DGoarNGZNcfwbTHumTwN7dSzxXyjj4nbzACfXQzYNEAT1jR4xV3XRxoRyyQDQ5cdMIIB2oUVZq
	lkdfTUSE3dfFHGTyc+eF+GfZ6gy9u+kIROOVdY+X4ouR8/HiceMsYttFh5Qj897B0eCfrohQDbG
	qN2Y7OScOuEsuyedTJ/9K5YZdqst43o1MgBNEh/cR3s=
X-Google-Smtp-Source: AGHT+IEb1ziv6SCjdyDQL96zzjg5G/z4Gi8F8wOiJmIAV34djYMshwdbu/LEIi6CkwPFG6A8w8/SPQ==
X-Received: by 2002:a5d:584a:0:b0:382:5492:4670 with SMTP id ffacd0b85a97d-38254b163c4mr4639144f8f.40.1732179201134;
        Thu, 21 Nov 2024 00:53:21 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382549111fdsm4219900f8f.58.2024.11.21.00.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 00:53:20 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 21 Nov 2024 09:53:19 +0100
Subject: [PATCH v7 5/5] arm64: dts: mediatek: mt8365: Add support for
 camera
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-add-mtk-isp-3-0-support-v7-5-b04dc9610619@baylibre.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
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
X-CRM114-CacheID: sfid-20241121_005322_572401_8609D261 
X-CRM114-Status: GOOD (  10.19  )
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
2.47.0


