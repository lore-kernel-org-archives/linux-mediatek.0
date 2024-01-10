Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69547C4707B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 14:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxtigJcFkwv9zaWo7GK9kjRZG8IVTttxdOGtGMzq6k0=; b=Beo1s/PSAMpazjpw5IPF9SZKtG
	jI9+HKCqiXy0HUKVPEUJ+aZokSIX7qo5DGI58MIBa5tmjU9jSyB0ewM6jkOXEKETQzjG8I6B4ALJd
	eTcRs3QyHYqk5HGG27DCZQSnF51m7apAxNhqoKhR8UhO5xAzt3eFNOu6hZvnbZqbtOWrSkeT3wLZ3
	3qAtUUJ62fS4nOLknK+MxSCkX0QEryP9W2RxUP8pguejy0ICqSdJmZhU/3aBKm8AgycgRc4Uz6t97
	HMV+Adk1SKybh28MJrxx6gNyHhOoYUyYhdroat0mnXXdIbY2nX2aD1hA8jl6tGP5fZykFwsmN6nUx
	DV5+HCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZMI-00CF5Z-2F;
	Wed, 10 Jan 2024 14:15:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZM9-00CEzI-2Z
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jan 2024 14:15:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3368b9bbeb4so4107624f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jan 2024 06:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704896095; x=1705500895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxtigJcFkwv9zaWo7GK9kjRZG8IVTttxdOGtGMzq6k0=;
        b=UYUPw8LyVuhlJ9dwMxuaMLPhn7qVolBvhbs9pTbewwGHDao9J5cfQK2zh+Vj+AHn7N
         e7HurfrdSB5YCrdwL/JRV2L5pCaQRrbT4mj8LxS4gH0iWEehR96tcaiDSsW2Wbz+Gf13
         PgNPaiGmv9pOrWdM6U79U4QB0/luJEm/PwYV0v6z/S5t5f2gal3sMIjP+WCwyZNhy3pR
         2OnsgFfkmRQEPZRz31cq09fTfxEJybh/G2TRbrsF3TdzLiJ51twCRUsldBGzGser8vkj
         xT4ak1o2cMolpHf4hmP1uS+nAXy6n2bhbTfU62NAul3j/b6XAh4tFd+tvkwPD6kc4M/e
         vr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704896095; x=1705500895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxtigJcFkwv9zaWo7GK9kjRZG8IVTttxdOGtGMzq6k0=;
        b=nJWm1BkaZ3QWXBTWOQphg7I5NOX4bGlnjhYY/dx9guxr9pjjLYb/8Qss5dI8fHPqXX
         cn5gLsSAyBmUiKY5TZ35MYiMDChiadNjnWG7auRSoAyEFYO44RZY+pn+xt0GKZr8k7bj
         27CuD4/bSnIze/VefcURd4+YHnqrB7gtKsGRwkc5Usl15DesZWFzx+4NZRZnpuSIKQeg
         IqT4KmZxY3bIeifBd/bHBTJZNVlzSwV5HQGQgktzm0ZBgTIkANkZ2p1wJbZhYjBAOM7j
         rUw2lallGNPJTMHOHo7Q+vutlv93jaa+pbynFOIwwXD19dnwCqvldZprqyOHC/rgqV0J
         pzGQ==
X-Gm-Message-State: AOJu0YwgMR/XlfLL6a2/SSEg1/igzMFF9QBp22yUsAM3VF/g0MTdMJLX
	Z/IMfXf2tNFptJAlmTqG03Mnphc1HDA9nA==
X-Google-Smtp-Source: AGHT+IG/gRhIPiGPqyamkimIkReGcw0IBFDLM3nG6+THKuTuyI62b0qDYD3Si8C1sYPA5JMHsQDEdQ==
X-Received: by 2002:a05:600c:4ecc:b0:40d:9377:faff with SMTP id g12-20020a05600c4ecc00b0040d9377faffmr327887wmq.189.1704896095738;
        Wed, 10 Jan 2024 06:14:55 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id j17-20020a05600c1c1100b0040c46719966sm2363890wms.25.2024.01.10.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:14:55 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 5/5] arm64: dts: mediatek: mt8365: Add support for camera
Date: Wed, 10 Jan 2024 15:14:42 +0100
Message-ID: <20240110141443.364655-6-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110141443.364655-1-jstephan@baylibre.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_061457_886910_52B5C491 
X-CRM114-Status: GOOD (  11.52  )
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

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 128 +++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..9059b2f83b83 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mediatek,mt8365-power.h>
+#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
 
 / {
 	compatible = "mediatek,mt8365";
@@ -703,6 +704,133 @@ ethernet: ethernet@112a0000 {
 			status = "disabled";
 		};
 
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
+						remote-endpoint =
+							<&seninf_camsv1_endpoint>;
+					};
+				};
+			};
+		};
+
+		camsv2: camsv@15050800 {
+			compatible = "mediatek,mt8365-camsv";
+			reg = <0 0x15050800 0 0x0040>,
+			      <0 0x15050228 0 0x0020>,
+			      <0 0x15050C00 0 0x0100>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&camsys CLK_CAM>,
+				 <&camsys CLK_CAMTG>,
+				 <&camsys CLK_CAMSV1>;
+			clock-names = "cam", "camtg", "camsv";
+			iommus = <&iommu M4U_PORT_CAM_IMGO>;
+
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
+						remote-endpoint =
+							<&seninf_camsv2_endpoint>;
+					};
+				};
+			};
+		};
+
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
+		mipi_csi0: mipi-csi0@11c10000 {
+			compatible = "mediatek,mt8365-csi-rx";
+			reg = <0 0x11C10000 0 0x2000>;
+			status = "disabled";
+			num-lanes = <4>;
+			#phy-cells = <1>;
+		};
+
+		mipi_csi1: mipi-csi1@11c12000 {
+			compatible = "mediatek,mt8365-csi-rx";
+			reg = <0 0x11C12000 0 0x2000>;
+			phy-type = <PHY_TYPE_DPHY>;
+			status = "disabled";
+			num-lanes = <4>;
+			#phy-cells = <0>;
+		};
+
 		u3phy: t-phy@11cc0000 {
 			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
-- 
2.43.0


