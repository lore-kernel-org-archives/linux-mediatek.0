Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E99CAC5A0
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Sep 2025 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KAascs3KaV3Z3mHhvMTLU3s9nCHKKshT+qkVXRYo2g=; b=hjnmtZYzcBYXzLGV3RBmLQm+gK
	TKjpHKCPlFR1oFiaQeWSfvc178XfwiDjzwdsvg9Q7/mIktC9VmP/gfZsgX2AxF+I+n6EuvbcqG/lt
	byPX2Run8JmDDikX0zXxsxBA7Yix2d6ABZQ+1+r0cCjvjGbCSalNRK0deOZeq4haeCmS3n92lNsmk
	sdN33j+2XC8gD2thcnRHpfeCVHcQauRmbwRBuMECEQ8t4RQUJl20+Ycs+i46KqoqVno0IpYKM1VFK
	uvk56YNN8To9g1jh+s/y9xjI9P6m6xvVsWZiAIUjjHPFpdMP8esAEEGiaxdcNPs71fizLd+ICRpdV
	8j2YbFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzteG-000000055rf-0qkG;
	Sat, 20 Sep 2025 09:12:52 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzteA-000000055op-0Jpc
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Sep 2025 09:12:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so1398097f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Sep 2025 02:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758359564; x=1758964364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KAascs3KaV3Z3mHhvMTLU3s9nCHKKshT+qkVXRYo2g=;
        b=SD1/o1F4hvQw7PTi04B2D9ZZ/zakDNWa1vMk81uQUyDTlCQBrbHyqgIe59ViT8/GU4
         b7goBBsNWNGB5in8wR5VuyGDIYT2AwM4H9YT+CeqhMwnH+Sd/iIF/FieWL0FjeA15N2N
         /aogT/Eyx27p6qvfUHCG//jjfHOSNNNPttRGvnabqoe03yEj+/qRSFPrBZG+PLKCTSEg
         ZTtIec494ARGv/SwpUA2vRClFnhirlvNQTpOlFZBFv/spG+nuUEYwsFz8grig7dlzZMY
         DMnITLj1bHuJ6kFl9MupuyaVbi1vhXAS5xPyUFrX6cgjcdls+nxWj7lAqqGcbUOBD+5N
         e2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758359564; x=1758964364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KAascs3KaV3Z3mHhvMTLU3s9nCHKKshT+qkVXRYo2g=;
        b=wvt73Wh53WkFRCRYHIdozZepEOZL/j8JxloNiQY91UyWh7Fg8U8mRc+XCB/I9m+4cH
         kVhZolkMhV6BdHCDUpNG2jQCBXv3rE1DxooPQcXf9l5k5P3U3ajFRGubuqggiTzEYm60
         rjHK8Wd5Wd+L9gJ/OGERtsxlDvyS85ih2c2qu2vdk0xAMFtIEKG/mbCCuucDIo3UQarj
         P+lGMwU0QgTKwyDUkSx0FofhZGdYIrR7wNj3sTspWeZyR0g3avhJob/f6V1iQRRDHUNr
         lBqJKqRescMdnx8J+M5Nz2SfCIh3K8lq9eH9Gf8xwUE8k1JK/ZkvGeq76qaSEFA7mpNs
         NEKA==
X-Forwarded-Encrypted: i=1; AJvYcCUNBG1qvO8+0OvY5n81jzJEe1k0xBRZ+fFnX25pS5Y9pUKOY6r7bW50oygUMHHceLrJX3Ngr8VmZt8px3UYFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi9yehbR4ZSv/qRawXuId0UmDpARB119hLtyDi6AIODtHVj347
	BscJc854BhnsRarmFS6OxUVS9vjQkDFXfALsFNqKaQB9SoJdyHy/7h1Y
X-Gm-Gg: ASbGncuY7tvFhJlJywqWRk36MbZu8asRuTWj+82c2MIReUGj7H3UCNq+OA7nPzxO5gj
	jWe0Bfc9yPwTYOq053Zx5FeItYTq56QZbATWlLkP4xv11I07ptjdkdJ+HHnhQZmiE01geraQPYX
	CZKGfCGAi2a8PisIGkgUtHXfnXoJTuBY9XqCIUgfT7r3TYdlDnG6lnd4kWzRcJ792oJmhBF9nCL
	E3Sx2crSdkeBDVGO9PhOg4BQZ+tpERGGVZxZ9ZotYH1SMcP1u9fWJ9cPzh5IPNsbBHzOXMa4To0
	U8EUBaqr3V2NGel9zVBj90Dq88xH/Io+49WgTgMZ8PZ0pHUV/L8Vvu+tIIwXGs5ySQvbrQpH287
	oGCZSdsT0XMiXggLDP0JXwCg5y5gRb07jt7WD9+cSBnckMEEykJYDyHRA1A0WNsAkiVm4F/E=
X-Google-Smtp-Source: AGHT+IHrh+ndXxTb1EFVumE+GYJ79IR8tl0ePHWHwP2BuY3hk84NbTQ7ULb7XUOoja074PzYe5xg8A==
X-Received: by 2002:a05:6000:310e:b0:3e9:2fea:6795 with SMTP id ffacd0b85a97d-3ee852a434cmr6002416f8f.53.1758359564118;
        Sat, 20 Sep 2025 02:12:44 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ef166e62e5sm6375782f8f.40.2025.09.20.02.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 02:12:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board
Date: Sat, 20 Sep 2025 11:12:29 +0200
Message-ID: <20250920091230.17702-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920091230.17702-1-ansuelsmth@gmail.com>
References: <20250920091230.17702-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_021246_152425_D40AF944 
X-CRM114-Status: GOOD (  14.32  )
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

Introduce Airoha AN7583 SoC initial DTSI and AN7583 Evaluation Board
DTS and add the required entry in the Makefile.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/Makefile       |   1 +
 arch/arm64/boot/dts/airoha/an7583-evb.dts |  22 ++
 arch/arm64/boot/dts/airoha/an7583.dtsi    | 282 ++++++++++++++++++++++
 3 files changed, 305 insertions(+)
 create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi

diff --git a/arch/arm64/boot/dts/airoha/Makefile b/arch/arm64/boot/dts/airoha/Makefile
index ebea112ce1d7..7a604ae249b5 100644
--- a/arch/arm64/boot/dts/airoha/Makefile
+++ b/arch/arm64/boot/dts/airoha/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 dtb-$(CONFIG_ARCH_AIROHA) += en7581-evb.dtb
+dtb-$(CONFIG_ARCH_AIROHA) += an7583-evb.dtb
diff --git a/arch/arm64/boot/dts/airoha/an7583-evb.dts b/arch/arm64/boot/dts/airoha/an7583-evb.dts
new file mode 100644
index 000000000000..a7f83436825e
--- /dev/null
+++ b/arch/arm64/boot/dts/airoha/an7583-evb.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "an7583.dtsi"
+
+/ {
+	model = "Airoha EN7583 Evaluation Board";
+	compatible = "airoha,an7583-evb", "airoha,an7583";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x2 0x00000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/airoha/an7583.dtsi b/arch/arm64/boot/dts/airoha/an7583.dtsi
new file mode 100644
index 000000000000..74044811efc0
--- /dev/null
+++ b/arch/arm64/boot/dts/airoha/an7583.dtsi
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			operating-points-v2 = <&cpu_opp_table>;
+			enable-method = "psci";
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
+			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			operating-points-v2 = <&cpu_opp_table>;
+			enable-method = "psci";
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
+			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-size = <0x80000>;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	cpufreq: cpufreq {
+		compatible = "airoha,en7581-cpufreq";
+
+		operating-points-v2 = <&cpu_smcc_opp_table>;
+
+		#power-domain-cells = <0>;
+		#clock-cells = <0>;
+	};
+
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			required-opps = <&smcc_opp0>;
+		};
+
+		opp-550000000 {
+			opp-hz = /bits/ 64 <550000000>;
+			required-opps = <&smcc_opp1>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			required-opps = <&smcc_opp2>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&smcc_opp3>;
+		};
+
+		opp-7000000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			required-opps = <&smcc_opp4>;
+		};
+
+		opp-7500000000 {
+			opp-hz = /bits/ 64 <750000000>;
+			required-opps = <&smcc_opp5>;
+		};
+
+		opp-8000000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			required-opps = <&smcc_opp6>;
+		};
+
+		opp-8500000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			required-opps = <&smcc_opp7>;
+		};
+
+		opp-9000000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			required-opps = <&smcc_opp8>;
+		};
+
+		opp-9500000000 {
+			opp-hz = /bits/ 64 <950000000>;
+			required-opps = <&smcc_opp9>;
+		};
+
+		opp-10000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			required-opps = <&smcc_opp10>;
+		};
+
+		opp-10500000000 {
+			opp-hz = /bits/ 64 <1050000000>;
+			required-opps = <&smcc_opp11>;
+		};
+
+		opp-11000000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			required-opps = <&smcc_opp12>;
+		};
+
+		opp-11500000000 {
+			opp-hz = /bits/ 64 <1150000000>;
+			required-opps = <&smcc_opp13>;
+		};
+
+		opp-12000000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			required-opps = <&smcc_opp14>;
+		};
+	};
+
+	cpu_smcc_opp_table: opp-table-cpu-smcc {
+		compatible = "operating-points-v2";
+
+		smcc_opp0: opp0 {
+			opp-level = <0>;
+		};
+
+		smcc_opp1: opp1 {
+			opp-level = <1>;
+		};
+
+		smcc_opp2: opp2 {
+			opp-level = <2>;
+		};
+
+		smcc_opp3: opp3 {
+			opp-level = <3>;
+		};
+
+		smcc_opp4: opp4 {
+			opp-level = <4>;
+		};
+
+		smcc_opp5: opp5 {
+			opp-level = <5>;
+		};
+
+		smcc_opp6: opp6 {
+			opp-level = <6>;
+		};
+
+		smcc_opp7: opp7 {
+			opp-level = <7>;
+		};
+
+		smcc_opp8: opp8 {
+			opp-level = <8>;
+		};
+
+		smcc_opp9: opp9 {
+			opp-level = <9>;
+		};
+
+		smcc_opp10: opp10 {
+			opp-level = <10>;
+		};
+
+		smcc_opp11: opp11 {
+			opp-level = <11>;
+		};
+
+		smcc_opp12: opp12 {
+			opp-level = <12>;
+		};
+
+		smcc_opp13: opp13 {
+			opp-level = <13>;
+		};
+
+		smcc_opp14: opp14 {
+			opp-level = <14>;
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
+
+	sys_hclk: clk-oscillator-100mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "sys_hclk";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@9000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x0 0x09000000 0x0 0x20000>,
+			      <0x0 0x09080000 0x0 0x80000>,
+			      <0x0 0x09400000 0x0 0x2000>,
+			      <0x0 0x09500000 0x0 0x2000>,
+			      <0x0 0x09600000 0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+
+		crypto@1e004000 {
+			compatible = "inside-secure,safexcel-eip93ies";
+			reg = <0x0 0x1fb70000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		uart1: serial@1fbf0000 {
+			compatible = "ns16550";
+			reg = <0x0 0x1fbf0000 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <1843200>;
+		};
+
+		watchdog@1fbf0100 {
+			compatible = "airoha,en7581-wdt";
+			reg = <0x0 0x1fbf0100 0x0 0x38>;
+
+			clocks = <&sys_hclk>;
+			clock-names = "bus";
+		};
+	};
+};
-- 
2.51.0


