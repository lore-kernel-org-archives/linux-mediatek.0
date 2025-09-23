Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749C4CAC5AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 18:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qsargsG3Xjd0R/oGc+s7Pbra0Jf2F5gcNclGZX2m+g=; b=r0VldTvJ0RsEfhhLhTQeaPlpos
	PBwpPo4sv18lwJRuWGGQtZ15IdKPAyqbGIw6HUvWjl3AMWbZKzHWIKk2ePSIS2Z2jgWtlL+enWuHE
	cd4i5iTt4Q9HxZiWD6P5ZL91ovYTLNupTtM/1znc5Qkd2EARWsPwGSW4LqS/QkvnAq2eFS1oePvPd
	+oi8yPV2F4o9ZRa7///kaWZEZ8MtAp+QLcNdwdQGDm7O4Rpw8j3M5cTtELgUpYnZJHPhMqyKwwYgw
	NZileNIodIEJUZxTwn9iACHOGEuQuWEkZfPYIVuwXsE08mDYtPguHSw6VlM7w5NSFbzxlW6gDpGFq
	/phBm2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v189D-0000000EZyl-1quO;
	Tue, 23 Sep 2025 18:53:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v189A-0000000EZxP-39G2
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 18:53:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46e23a6617dso8310745e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 11:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758653631; x=1759258431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qsargsG3Xjd0R/oGc+s7Pbra0Jf2F5gcNclGZX2m+g=;
        b=PDokHgUhy9AD6SCCIg7gVnnuBhZwcY9U6j3SAVyC/HU26r/i3bbl6o3sAjeXTSFPdj
         HdfyJRDqzjhflzd4CMJ9B9WuiZ7puuGCKdWPvqR7XzzECbL+vrudS9fU/4X2+n3nAHKz
         PddtzP+ArvMicbe+H6JWYXnAqluPrpPyN6n3+nTOcqA0nyM5KJC6pHw69BUuqf7wuJoO
         4BFMKDjdXEf5IIxXhbwBxqXxV0jeF54EFaVgVo5XHt/qKXjgB1ZcZDzq+R4G6jPG0g8G
         dslhurLFPL14sWMm/b8KUR+d56OmVovb3sH84yoxF5tdSXQ/fKGlhOJitEtEVqL47nTv
         nKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758653631; x=1759258431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qsargsG3Xjd0R/oGc+s7Pbra0Jf2F5gcNclGZX2m+g=;
        b=wjkGmmJPXIPSd5EzSwdytAuk53CKMmU+6RXkkkdJwsSffeuIoiAJ9t+TWkz033xCHr
         BevqCoWjvu0QtwMcbPOuYbZKqNDiTkYvhRGwrcoGB4ZbJJYy6tyU0AxlVWU2Pzvqaj0E
         BVyntJEoIajqLjTb0lvoGQUW9EdWgDGtQIb0HKgg/PLqOSS2Pa3arbb1u588JOW22y+2
         t76XKVgHQkVswmapaoeSJiCQx7WW7ELzLxRXLZP1aiCvDS8pi8+9QAhtte1dIRNang9g
         zqlgoAaijxA42Z6lyjWOhPNS+S8m2HwdrfNq6OMv5Fa58JP4xl01mzX6dMGU03MPVHpo
         1+GA==
X-Forwarded-Encrypted: i=1; AJvYcCXxOMVkGN5n7mJQFDHG2h+DRrr4RyKsZK0xu+84Z5tQVwMbWlDnLldniNEzvWPcslUHWnVCUZeVMX2DdqTEJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBN8JjmJL1mZgKwMMvaENf5DZavE0YWL8gv//NVFGzwGwc7RKI
	V8e2HxusEnnwnkmV/N9Zmom2Rv6v0bGCkz79ugV0eOPRnHc5zsp5Nipu
X-Gm-Gg: ASbGncsNUWzEFumWrjc15SBeiJmOgJNmCbgRclcc5s+RUMHe0hjQbnVLZDVBkY0ZrGV
	eyLcOw3bnQq3PbvutrNDhBJfpqk+SHyEiG+UckjrW1ZslsJaLv122/TZKfiyaaCNE/nqDbPaEJW
	I5lrhUKq/qKU6J28wwqiyM5ff7t6MWdMb2LBO8QY9pXX+76kZ4uPcyUiiAAC8qxJShtrOBeL6X4
	F0U3iRA6hcbzBQi3Lynbh7MPbSr6VF/ZN7xLf+ho6MZrFHxscF0GgFU1NuzN90tNSK9J4+LN9hh
	4mXF1hXOtm/WAWe/34mzUc+m26DVtT74yj1B/m2ap8cEbpaJvgqFgx9If7XKue+9jPaPYmyNUeD
	wcBbPESiGs/k5NK1Me7MFsIhowYkaeFhofS/+GyM8eO8uT81ayXi7FQNKtdbwxe1+XOfg5HSJ57
	GdZLrYbg==
X-Google-Smtp-Source: AGHT+IE3dNzwBOjOE7rjv4mkl8cmybZcfy3o8nS6BzyT1HjdFN3zod7ldO2Vh9ROO7zgz2v9kzgn7Q==
X-Received: by 2002:a05:600c:468a:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-46e1dac8d5dmr36648915e9.32.1758653630602;
        Tue, 23 Sep 2025 11:53:50 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-464f64ad30csm295014655e9.23.2025.09.23.11.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:53:50 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board
Date: Tue, 23 Sep 2025 20:53:35 +0200
Message-ID: <20250923185340.21526-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923185340.21526-1-ansuelsmth@gmail.com>
References: <20250923185340.21526-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_115352_829094_027530ED 
X-CRM114-Status: GOOD (  14.40  )
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
Changes v2:
- Fix DTB BOT warning (fix crypto compatible and OPP node name)

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
index 000000000000..a6a5df60d0e1
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
+		operating-points-v2 = <&smcc_opp_table>;
+
+		#power-domain-cells = <0>;
+		#clock-cells = <0>;
+	};
+
+	cpu_opp_table: opp-table-cpu {
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
+	smcc_opp_table: opp-table-smcc {
+		compatible = "operating-points-v2";
+
+		smcc_opp0: opp-0 {
+			opp-level = <0>;
+		};
+
+		smcc_opp1: opp-1 {
+			opp-level = <1>;
+		};
+
+		smcc_opp2: opp-2 {
+			opp-level = <2>;
+		};
+
+		smcc_opp3: opp-3 {
+			opp-level = <3>;
+		};
+
+		smcc_opp4: opp-4 {
+			opp-level = <4>;
+		};
+
+		smcc_opp5: opp-5 {
+			opp-level = <5>;
+		};
+
+		smcc_opp6: opp-6 {
+			opp-level = <6>;
+		};
+
+		smcc_opp7: opp-7 {
+			opp-level = <7>;
+		};
+
+		smcc_opp8: opp-8 {
+			opp-level = <8>;
+		};
+
+		smcc_opp9: opp-9 {
+			opp-level = <9>;
+		};
+
+		smcc_opp10: opp-10 {
+			opp-level = <10>;
+		};
+
+		smcc_opp11: opp-11 {
+			opp-level = <11>;
+		};
+
+		smcc_opp12: opp-12 {
+			opp-level = <12>;
+		};
+
+		smcc_opp13: opp-13 {
+			opp-level = <13>;
+		};
+
+		smcc_opp14: opp-14 {
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
+			compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
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


