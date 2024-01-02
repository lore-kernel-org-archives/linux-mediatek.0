Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF691C47074
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 21:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ajkx4bsq5FblcMrag9XMXkO7pdSXa2ulGlzhuPvkJzs=; b=mF86qgRRITlu9C1w7pftEx9mAM
	26HH4bblV2kFc8VN9fQZXX4d6UQCPPjc5zmbxer/7e5+6XYbvEtcJc8Te9yQ5Ymv05cArN0DJ2fA0
	otcYYVupyz6QYvv0D9WzG+nC6Ma1nPDK2/gX8kLYPz3/EBRs49hSGBLtYPlQLgJLR+x59p5xWhFEc
	70HbG3RXCtOKpzxJlpOPMm95U4t18WTH/NfVQDMyp4BH3yDGMRoaXhPtxBba1WC9RdmJgwy22qJ88
	DptYOTaFeqjo2d9HetgoSEGAaKq3C5NYwxQYXw2Gw5wCKg+wk8rGwOa7FG8RM9UqnShd0/iLBAkco
	ihYq09qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKlrn-008yhs-2j;
	Tue, 02 Jan 2024 21:00:03 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKlrh-008ycL-1I;
	Tue, 02 Jan 2024 21:00:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so756689366b.2;
        Tue, 02 Jan 2024 12:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704229192; x=1704833992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ajkx4bsq5FblcMrag9XMXkO7pdSXa2ulGlzhuPvkJzs=;
        b=Ss3wT2ItyWLsfvVbMzT1l2+R4U7ptv35DJkn/nQq+DQNs37bwdpxMLB7mUx5OUrcIR
         Z3+Nk+BvAVFCJv+HcmnCkTTuc55Z7pAjXpdQlEGSbWvlAJ+8tskrnySL7N2JlYsmEpSc
         X86s5h0IkVP4dcIYtDDZfqwHp8VUrUVMvkDVN44CrlgXRqFSaSwvuo3sMFX+OIqOWdwE
         nGjTkyiS82qIRjqpIbacsacStQvW8k87GkbJHx2pqkQspPUvWrM+fH1cQHZvgvwpeOIz
         IITnx0K6uxhFLpGvxUEJwoCBl6JYMO+UtYST1IARrSJb5aZMZVQO37AvQpQ1/1gxFSyf
         ARPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229192; x=1704833992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ajkx4bsq5FblcMrag9XMXkO7pdSXa2ulGlzhuPvkJzs=;
        b=CucmITrY+RUUKZ4GjxctvMh39JppcEQ4QFWhMrymzkU5A628SD5BITl97yA79Ohh/I
         73hLRvBZgTj4nj+O8Zen/BJGsViMIFfD0J++7AJA0rNHqnSpp6ruD7ICIGB/Nyk1PNy3
         wd3GxR8MInRt1MBAE+9a6+pyqKq04TJRh/7kgj1l5Loa86iV+9fzBVxfVMpR683jP5Gf
         Z+SJIpo7qrlh0MQwUSIbL963x5fezVdbHgUXPBJe5HAq1zW0QlPg2MAJuH/pOZW+ZIHf
         TMMkqeQrky6AU9XM8hQBbIRTQ7aZNx2a2UkZoeTh91Npl6mhaB7IYeUq/O6jAds+P+IY
         DXlg==
X-Gm-Message-State: AOJu0YygwR+eKRnkAGb1LIu+j/4TywUlHl7fHxRtMl/4y9/6zdt/ocQN
	DvbZBD2QnHaI+O6KHEiYaR4=
X-Google-Smtp-Source: AGHT+IHhDQdRAcYOHrrLF2vqGrpF1xEzF7AiAnQxEGAx2mAbQ4UFRo0J9Hw9Iabzet1I/707xTXfUg==
X-Received: by 2002:a17:906:1091:b0:a23:5b04:d2ed with SMTP id u17-20020a170906109100b00a235b04d2edmr4778977eju.142.1704229191786;
        Tue, 02 Jan 2024 12:59:51 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id f15-20020a17090660cf00b00a26f66ce72fsm7941200ejk.83.2024.01.02.12.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 12:59:51 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] arm64: dts: mediatek: Add initial MT7988A and BPI-R4
Date: Tue,  2 Jan 2024 21:59:41 +0100
Message-Id: <20240102205941.29654-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240102205941.29654-1-zajec5@gmail.com>
References: <20240102205941.29654-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_125957_530519_2B4E5028 
X-CRM114-Status: GOOD (  17.88  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7988A (AKA MediaTek Filogic 880) is a quad-core ARM Cortex-A73
platform designed for Wi-Fi 7 devices (there is no wireless on SoC
though). The first public MT7988A device is Banana Pi BPI-R4.

Many SoC parts remain to be added (they need their own bindings or
depend on missing clocks). Those present block however are correct and
having base .dtsi will help testing & working on missing stuff.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  11 ++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 149 ++++++++++++++++++
 3 files changed, 161 insertions(+)
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
index 000000000000..0f2ae9c7aef7
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "mediatek,mt7986a";
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
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
+		secmon@43000000 {
+			reg = <0 0x43000000 0 0x50000>;
+			no-map;
+		};
+
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
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+
+			trips {
+				crit {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				hot {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				active-high {
+					temperature = <115000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				active-med {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				active-low {
+					temperature = <40000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
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


