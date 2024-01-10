Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F0EC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eyRxR6bVp9zc7fZy28Xp4h3YUMVLD6VRe57ZqeUulk=; b=u53HgQUPrgnceTc9IxXeZmhCIn
	VhK+4Du8vaSAZrvOVvN/vkGx0GXj6g8FwgoUDkk8/2cCfasCrcASkSxJbjfQoB7YKIfYzndcdvdHK
	5ySaqKefWUB3bppPm+2+AHPRBRy5/2PNvO3OpRiFmfqD0f7KKVUhqe1sA9ph9EOlbXDIS7NMx+8g0
	G5d2L4O5QIeifVP35mp+NfJUlwLcXjjzqhV9z1jufsxgQK/fHM1PZwDBKrQbZekpaxfsg0XaskMyV
	M07FM6OKaQZLYDtVfTPQKVAiSWTK6tykQPFTHfa+8vXvBtzrb19Krl7E+RcgbZC4s12bXX1hPU1RU
	Q023HNKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVFi-00Avi3-2m;
	Wed, 10 Jan 2024 09:52:02 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVFd-00Avfh-2Q;
	Wed, 10 Jan 2024 09:51:59 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a27cd5850d6so417044366b.1;
        Wed, 10 Jan 2024 01:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704880314; x=1705485114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eyRxR6bVp9zc7fZy28Xp4h3YUMVLD6VRe57ZqeUulk=;
        b=BHEY9xbq2Xg7e2EAyzzPRJTo/gUb/h65Ta8nK5sAaGSEPFXQq/1x55U6C/JXbKO+29
         8KcsTpk53Aml6RAyFA2G9cscCUR4RJZxaQyfXCw/lDsyUTeqr8i5/1jgswyNx1Zw01y1
         QKSgwROcOAurSJI/faA+0qxVgBmS9VFyX6HVZv3eNQoC8cwJlCbWGnxjnsEF5RM4/4vo
         Ijjsl9epxGpII4mN3ew+HLV7Y8AjlN9SMod7wsBgsryyfqRc9DJlm1oC13dPBqPBLn0x
         tvWkNcJXFHDmQF0Q46kMDz13Bmkq8ls1u24B5E0auBzoVdEqMU99KzCLjM6xfdGIn3i3
         Oseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704880314; x=1705485114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eyRxR6bVp9zc7fZy28Xp4h3YUMVLD6VRe57ZqeUulk=;
        b=Fky/h5wg0VoYs0YyP6Wu5ZIog8dWSgUOkSvnhyXu8XFBzF0e1nmdlmQqnfy1JOEy8Y
         SgKSwS1fXWAncZKO20qUZ21Zfoudt1++bkcaSFRL9KXZ1zff7ZD6KHajCRGsE7vcmD3S
         DWVEo0vHtff13vCuExpalGXTkDstfpVAmWlulwXiPU6ivVbbYlpjiyCR8FdYAPlD1M8G
         1/tsST2H/f4YQ0cDLoVS70lLq2pMc+X4G2Rea6f0u17sWyDkeap4i+wRL2mRr4aJCmYF
         BYKRt7PvesH0qqNXckLY6uyN2ZKEerEiVUsMiwS0g/xtJGwyMseUMG3zuClsWCbWjCGI
         7v8Q==
X-Gm-Message-State: AOJu0Yx0ox3dkEDA9jsVC494IgNkX61rrCCZ4jUVbzF5ThXe1bwtHG4C
	j95UWoHqBIU477K/93yfD0k=
X-Google-Smtp-Source: AGHT+IFXWlA0EPX7UHPNM67MuIcwZijEcSqO48IFxFR++3r/e5jyzK+T5oMMlCUtrM8McxTDaD/oAg==
X-Received: by 2002:a17:906:1c0f:b0:a26:f2da:3bfe with SMTP id k15-20020a1709061c0f00b00a26f2da3bfemr476791ejg.124.1704880313791;
        Wed, 10 Jan 2024 01:51:53 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id c24-20020a170906529800b00a27aabff0dcsm1947617ejm.179.2024.01.10.01.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 01:51:53 -0800 (PST)
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
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] arm64: dts: mediatek: Add initial MT7981B and Xiaomi AX3000T
Date: Wed, 10 Jan 2024 10:51:18 +0100
Message-Id: <20240110095118.25598-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240110095118.25598-1-zajec5@gmail.com>
References: <20240110095118.25598-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_015157_787491_9790E4A6 
X-CRM114-Status: GOOD (  15.90  )
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

MT7981B (AKA MediaTek Filogic 820) is a dual-core ARM Cortex-A53 SoC.
One of market devices using this SoC is Xiaomi AX3000T.

This is initial contribution with basic SoC support. More hardware block
will get added later. Some will need their bindings (like auxadc).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   |  15 +++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 108 ++++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 0a189d5d8006..8bff11acfe1f 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
new file mode 100644
index 000000000000..a314c3e05e50
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+/dts-v1/;
+
+#include "mt7981b.dtsi"
+
+/ {
+	compatible = "xiaomi,ax3000t", "mediatek,mt7981b";
+	model = "Xiaomi AX3000T";
+
+	memory@40000000 {
+		reg = <0 0x40000000 0 0x10000000>;
+		device_type = "memory";
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
new file mode 100644
index 000000000000..ce878ad55204
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+#include <dt-bindings/clock/mediatek,mt7981-clk.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "mediatek,mt7981b";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+	};
+
+	oscillator-40m {
+		compatible = "fixed-clock";
+		clock-frequency = <40000000>;
+		clock-output-names = "clkxtal";
+		#clock-cells = <0>;
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
+		infracfg: clock-controller@10001000 {
+			compatible = "mediatek,mt7981-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		clock-controller@1001b000 {
+			compatible = "mediatek,mt7981-topckgen", "syscon";
+			reg = <0 0x1001b000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		clock-controller@1001e000 {
+			compatible = "mediatek,mt7981-apmixedsys";
+			reg = <0 0x1001e000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pwm@10048000 {
+			compatible = "mediatek,mt7981-pwm";
+			reg = <0 0x10048000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_PWM_STA>,
+				<&infracfg CLK_INFRA_PWM_HCK>,
+				<&infracfg CLK_INFRA_PWM1_CK>,
+				<&infracfg CLK_INFRA_PWM2_CK>,
+				<&infracfg CLK_INFRA_PWM3_CK>;
+			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
+			#pwm-cells = <2>;
+		};
+
+		clock-controller@15000000 {
+			compatible = "mediatek,mt7981-ethsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
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


