Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8CBC47073
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 08:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5MAavEp4GRQ8ByO63q+MnUAR25rHkk0tfYwSOvmf5+U=; b=ZaS/bC3htTXapp
	Yq83T9u8lh+nDPTnjU9i+UcIE46FHuAAByDVnWsOFKUyrZ8LD0BQrzGvDPNa1fDc/6f4+eZMyq9ZI
	koDcHNfPRzfB2ZOEQ0VpzO4GmDTcGmsC+iFfSOBBNv0UcOALIgQwzTUNBHp6b5Km/+ObfpDwFe5Dx
	j785FPNDkGUKjgvyL2nSia5O4I62i9n2VtxPrBI/EwCuYWhx8iVE8kZVaeVPOO8mAtCqA9dp6gXxj
	URjpuGF95B7vWIhBis3Ws4iwlBfqQMNWUuU36UF7JmnRNzf4xRYKLuG69nkYqPYfiu+gGtREpB/ef
	nZsd1dtuAbxCcL1ibJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMlNS-004N8U-26;
	Mon, 08 Jan 2024 08:52:58 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMlNM-004N3e-2K;
	Mon, 08 Jan 2024 08:52:54 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a28d61ba65eso155654266b.3;
        Mon, 08 Jan 2024 00:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704703971; x=1705308771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MAavEp4GRQ8ByO63q+MnUAR25rHkk0tfYwSOvmf5+U=;
        b=EQqoBwuqA9hJ7U9IFdeavEvrzVDoN+sFe4+N1JlkaIgOVGAKZZAPyZPDa4dQDv0hCM
         xo1vvRYWy0gJVlWWA+pMEmljl0fLftT1x+AXrGMdAF5u6vvkXhluDeUFDxQPzR4XM13N
         7wRmJlZAy/QPq3IHbHPm72s7mDxOZXdTbQsUHO35kxPsTQZMAi/R+Z4YJjjgc+e15jWp
         rGosSshEtes+NgQIo1Yh4PuHK2bmykC4BU83FijG1o1/rxpWqOYKacevk/wBtA/04gZv
         X3iUuvRZJGJilJDqBpbSdT8mzKVbGYgCMmVnTNFzXJcqk9kJGaN105n6/Ufatois9RYk
         gs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704703971; x=1705308771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MAavEp4GRQ8ByO63q+MnUAR25rHkk0tfYwSOvmf5+U=;
        b=jEqvxpmlRZBBU4IPUeZGsLIw5hSHGNwKPROojmugLaiUKtwQ4YUUx90j1no55HcCmG
         xGIVJ0LpuCmjFD+Z1+9j/V5NTOuUVaDGkp70IyiJ4G+eaIEbnh39B7xXaB06zvpw04p3
         /cm3Kow5skuJ3Km0m8Y8JZk97K6Fj2kpoomXOBoxXUxxsXF60tXkvz7/nM0S6twSyrXL
         eqjRs9pjqYUUg1MB2FyKu7rZ3CEupYcCvOhZ0Wt04TKCa5Zwsp9UxXTSAiQ5nM/UCnno
         QhfYZVEJ5RyVptpiK34rTS/Uw6L/FET+gEEHcF6X8UKbOH0q2TwxBKI/B6BydTq5CB35
         PL1A==
X-Gm-Message-State: AOJu0YwA1/AzthB/AaJduECTAm7T5JtSZc+LEEJgpPksK7A6CgJ1BYua
	M42/+LGJO0yKXA0iFzz7bXU=
X-Google-Smtp-Source: AGHT+IHFSe/T3E6nBi9RJvETekIde80UBx4iiRCg1sXHrFOWTPmfA+ufoG1KXL5sczNPhTL1eQpTpw==
X-Received: by 2002:a17:906:cb10:b0:a29:529c:1db7 with SMTP id lk16-20020a170906cb1000b00a29529c1db7mr822402ejb.44.1704703971134;
        Mon, 08 Jan 2024 00:52:51 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id uz29-20020a170907119d00b00a2aae23b414sm666046ejb.26.2024.01.08.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 00:52:50 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH V2 2/3] arm64: dts: mediatek: Add initial MT7988A and BPI-R4
Date: Mon,  8 Jan 2024 09:52:27 +0100
Message-Id: <20240108085228.4727-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240108085228.4727-1-zajec5@gmail.com>
References: <20240108085228.4727-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_005252_774556_27534764 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, jason-ch chen <Jason-ch.Chen@mediatek.com>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

MT7988A (AKA MediaTek Filogic 880) is a quad-core ARM Cortex-A73
platform designed for Wi-Fi 7 devices (there is no wireless on SoC
though). The first public MT7988A device is Banana Pi BPI-R4.

Many SoC parts remain to be added (they need their own bindings or
depend on missing clocks). Those present block however are correct and
having base .dtsi will help testing & working on missing stuff.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Drop thermal zones & reserved memory from .dtsi (those don't belong
    there and we also need thermal controller first). Fix compatible.

 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 11 +++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 97 +++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 1e6f91731e92..0a189d5d8006 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
new file mode 100644
index 000000000000..efc4ad0b08b8
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+/dts-v1/;
+
+#include "mt7988a.dtsi"
+
+/ {
+	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
+	model = "Banana Pi BPI-R4";
+	chassis-type = "embedded";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
new file mode 100644
index 000000000000..5a778188ac21
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "mediatek,mt7988a";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a73";
+			reg = <0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a73";
+			reg = <0x1>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu@2 {
+			compatible = "arm,cortex-a73";
+			reg = <0x2>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu@3 {
+			compatible = "arm,cortex-a73";
+			reg = <0x3>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+	};
+
+	oscillator-40m {
+		compatible = "fixed-clock";
+		clock-frequency = <40000000>;
+		#clock-cells = <0>;
+		clock-output-names = "clkxtal";
+	};
+
+	pmu {
+		compatible = "arm,cortex-a73-pmu";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
+			      <0 0x0c080000 0 0x200000>, /* GICR */
+			      <0 0x0c400000 0 0x2000>,   /* GICC */
+			      <0 0x0c410000 0 0x1000>,   /* GICH */
+			      <0 0x0c420000 0 0x2000>;   /* GICV */
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		watchdog@1001c000 {
+			compatible = "mediatek,mt7988-wdt";
+			reg = <0 0x1001c000 0 0x1000>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			#reset-cells = <1>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
2.35.3


