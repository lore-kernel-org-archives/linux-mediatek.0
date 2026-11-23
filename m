Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CF1606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F7Ww92P9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ApU9cEi9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2ImmBlyem+dKD8BtksWY7e6g1iRuBiOaIKzcItgpI8E=; b=F7Ww92P9M9Yo8+
	WA1neHeNk8+H3+BatAc8p0FJwvPozjYxwGruL8b5WIGBd4CT57MaQR7Fj/J2xKiU9zKuW4wMMsMXU
	o1ZFBrtNeSqcgbXAWk75a2B7zxvseHbyUHYmGvk2JMieTob91+Nk8kFnUPKsM7BAdlUqMnepwfhXS
	qwVcW3Pr7gS0rOO0Y2ftZJXKEgbl91m4cMzsnI77ElNXCDOVd3R7N1l84uLYNzP5gWRaasRMRYX7q
	VFde2/gag9Bkk5mB3t+Ysfq91lDu3O5VEPeDPYAz0foRnf0rj6FowP7I69Ic1qqCsIi3wg1ziGcYa
	KVeC4CF82oK1dBlYoGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS67-000000037qt-1Y8k;
	Mon, 23 Nov 2026 11:20:35 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4s-000000036qt-079r
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c5126505cb3so398583666b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 03:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432755; x=1796037555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ImmBlyem+dKD8BtksWY7e6g1iRuBiOaIKzcItgpI8E=;
        b=ApU9cEi9eozKZGK1a5YkAX6vCM43FVRAudFI+BlWn0yL+9+c/uaV6mClEp3vJNeAp9
         +945OEl3t+rUumYmQ1Uoqmsy1i4/fPyhDpcb2iSp1b3swr5xkbXiYfy9vm/vWUQ5IMUp
         8uxrZ/Fq9aPmYWSkWxEsGqYO9wzx2+VHCB8afWbq2ZOhKDGsQK1xjTc4qiHBVVAOA/OU
         1krOK1yaFiHAyg5P712JqTC9wwI8itMQIBw9wzTeZG2Bk1fhTyNavHWyPmY7VkQ17Oyg
         Xh/BHMKSx0ERAeuirX+orxDmPjn8yM4SRPrC9611keY4GK08fqou75/jYKqvS0wTa48b
         BJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432755; x=1796037555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ImmBlyem+dKD8BtksWY7e6g1iRuBiOaIKzcItgpI8E=;
        b=mzlMB/W230Zyu6o9Gp/FOfkqtN35ZR5WrEAVDgHN0exjx+tBzdaM+SXbrubGnVy2Pl
         57kDyW4J8WUHJeaWoL5qlDMGle4+941JbAQ3bLYE7dbm2soQMbWDh6VIdmfBHDQ6UYSt
         hsIdyI5s8U0N8lfOqaQlND0Ascgq7DbzRTxhFivWGlECVNmyx2PP9ZuAxBB0dbhumGaT
         fYkXbbeaKNanTNktM+rnKHKwVlp3NZ3hP5VaoF6VImJOKULFehHDlZGhd9xCjYYfUU3W
         dZT7HfDEF9xTVP6tVQM76Cz/ZAUXw2tJZ7+hd+leahn3Z11OgJD7eY/P0yy2+jBrVYo0
         yIzQ==
X-Forwarded-Encrypted: i=1; AL+hErEpgKwifW4Arcz1E/k2xr3Medv2jCPeUf7aM8akPgx850zFwnWjEkJpo0WHHPR/F4D8SeEpL1Bg/dSaan9TSA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9+vS5z2BOy/OSnXlxg4MwiQElYT6gza/r0Ot3gX03diOQ10tFK
	hnPXb6haHTvF51DlBD5NtQg6YdC7LJWtlUL28JQnZsLR3ElQfa07gGG6
X-Gm-Gg: AZFdTZf2eCP4S6zDtQ80QOnyOB73G7ylm2SYka3j3Ddi3PWV0CzUoxWPz2MD6+RasIe
	TzNKIDMGeYb1H7dDLVrXTJdnmVfrbbitB+myF2T3KzXtoHRngzQgggDb+bgfveJHAgp+Kun8eE8
	2oW/wP8f9uriz4jVfMMQsv1jOmlaav/9wdqccCoHq6Tu0e69V1ZRtLS1yy6KGtCFZI42PJ0bhqL
	H4gbUTalBpMAa68Yka9PYriN+pVquwpSTlTPxq4LffINFh7zI+/ProRlVPUbmaxxZJNtvr3mF5s
	AT2RBKYpN529bQM9cemRBZEtJOQJlzch2rD5wP1ovrfYKIicZkOaT2jAqFfPbTtOJpi1h18ow5w
	DkrvtO5N0C1Y1rJKakwr1AiNcqFdLwUklSgwALR/PO/DtezxlVresi18dRlFv/qPYxH3lYVxO6G
	vgUpGRIGLcTD1GeYPBVRf+0QY7bxrJnhcwl9jeej2+rpMF/ox0UibbCFsIRYJLtzuT9qvh58d3W
	w8qCMgAJjyTeRgQC0m8jJF8qR/Pv5lNHbiJFQNhUAy593LqIrVWHIpHVLma3gyIrYKtVVtFpPCu
	r8UiszUH7U4CKm6P6uGiICGkya14Snl64yHj2UNNI5A8Iu6oxxG14FeIYXiCnrXjcw==
X-Received: by 2002:a17:907:d40a:b0:c40:f89f:d91d with SMTP id a640c23a62f3a-c513ab2082fmr899555066b.28.1795432754704;
        Mon, 23 Nov 2026 03:19:14 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:14 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:39 +0300
Subject: [PATCH v3 6/7] arm64: dts: mediatek: Add MT6895 SoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-6-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031919_042024_7616576D 
X-CRM114-Status: GOOD (  15.33  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add initial support for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
which has four Cortex-A55 and four Cortex-A78 cores sharing a DynamIQ
cluster with 4 MiB of L3 cache.

Describe the CPUs with their caches, PSCI, the GICv3 interrupt
controller, the CPU and DSU PMUs, the architected timer, the system
timer, the pin controller, two UARTs, the watchdog and the keypad.
There is no clock controller driver for this SoC yet, so the UARTs and
the keypad use a fixed 26 MHz clock, and the system timer a fixed
13 MHz clock derived from it.

Only the CPU and cluster power down idle states are described. The
deeper states that also power down the MCUSYS or the whole system need
the SPM and the vendor low power driver, which aren't supported yet.
The system timer serves as the broadcast timer while the CPUs are in
these states.

The cache geometry was checked against the CCSIDR registers of each
core.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6895.dtsi | 461 +++++++++++++++++++++++++++++++
 1 file changed, 461 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6895.dtsi b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
new file mode 100644
index 000000000000..62584cec0f4f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "mt6895-pinfunc.h"
+
+/ {
+	compatible = "mediatek,mt6895";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clk13m: clock-13m {
+		compatible = "fixed-factor-clock";
+		#clock-cells = <0>;
+		clocks = <&clk26m>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "clk13m";
+	};
+
+	clk26m: clock-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
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
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+
+				core6 {
+					cpu = <&cpu6>;
+				};
+
+				core7 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <380>;
+			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <380>;
+			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_1>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <380>;
+			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_2>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <380>;
+			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_3>;
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x400>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_4>;
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x500>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_5>;
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x600>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_6>;
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x700>;
+			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_7>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cluster_off_b: cluster-off-b {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				entry-latency-us = <100>;
+				exit-latency-us = <250>;
+				min-residency-us = <1900>;
+				arm,psci-suspend-param = <0x01010102>;
+			};
+
+			cluster_off_l: cluster-off-l {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				entry-latency-us = <100>;
+				exit-latency-us = <250>;
+				min-residency-us = <2100>;
+				arm,psci-suspend-param = <0x01010101>;
+			};
+
+			cpu_off_b: cpu-off-b {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				entry-latency-us = <50>;
+				exit-latency-us = <100>;
+				min-residency-us = <1400>;
+				arm,psci-suspend-param = <0x00010002>;
+			};
+
+			cpu_off_l: cpu-off-l {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				entry-latency-us = <50>;
+				exit-latency-us = <100>;
+				min-residency-us = <1600>;
+				arm,psci-suspend-param = <0x00010001>;
+			};
+		};
+
+		l2_0: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <131072>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_1: l2-cache1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <131072>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_2: l2-cache2 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <131072>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_3: l2-cache3 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <131072>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_4: l2-cache4 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <524288>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_5: l2-cache5 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <524288>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_6: l2-cache6 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <524288>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l2_7: l2-cache7 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <524288>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			next-level-cache = <&l3_0>;
+			cache-unified;
+		};
+
+		l3_0: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-size = <4194304>;
+			cache-line-size = <64>;
+			cache-sets = <4096>;
+			cache-unified;
+		};
+	};
+
+	dsu-pmu {
+		compatible = "arm,dsu-pmu";
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
+		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
+		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
+	};
+
+	pmu-a78 {
+		compatible = "arm,cortex-a78-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
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
+			reg = <0 0x0c000000 0 0x40000>,
+			      <0 0x0c040000 0 0x200000>;
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu4 &cpu5 &cpu6 &cpu7>;
+				};
+			};
+		};
+
+		pio: pinctrl@10005000 {
+			compatible = "mediatek,mt6895-pinctrl";
+			reg = <0 0x10005000 0 0x1000>,
+			      <0 0x11c20000 0 0x1000>,
+			      <0 0x11c30000 0 0x1000>,
+			      <0 0x11c40000 0 0x1000>,
+			      <0 0x11d10000 0 0x1000>,
+			      <0 0x11d30000 0 0x1000>,
+			      <0 0x11d40000 0 0x1000>,
+			      <0 0x11d50000 0 0x1000>,
+			      <0 0x11d60000 0 0x1000>,
+			      <0 0x11e10000 0 0x1000>,
+			      <0 0x11ea0000 0 0x1000>,
+			      <0 0x11eb0000 0 0x1000>,
+			      <0 0x11f20000 0 0x1000>,
+			      <0 0x11f30000 0 0x1000>,
+			      <0 0x11e50000 0 0x1000>,
+			      <0 0x11ce0000 0 0x1000>,
+			      <0 0x11de0000 0 0x1000>,
+			      <0 0x11fe0000 0 0x1000>,
+			      <0 0x1c01e000 0 0x1000>;
+			reg-names = "base", "rm", "rt", "rmm", "bl", "bm", "br",
+				    "brr", "lb", "lm", "rtt", "tr", "tl", "lt",
+				    "eint-w", "eint-e", "eint-s", "eint-n", "eint-c";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 227>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
+			#interrupt-cells = <2>;
+		};
+
+		uart0: serial@11001000 {
+			compatible = "mediatek,mt6895-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001000 0 0x1000>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+
+			status = "disabled";
+		};
+
+		uart1: serial@11002000 {
+			compatible = "mediatek,mt6895-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x1000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+
+			status = "disabled";
+		};
+
+		watchdog: watchdog@1c007000 {
+			compatible = "mediatek,mt6895-wdt";
+			reg = <0 0x1c007000 0 0x100>;
+		};
+
+		keypad: keypad@1c00e000 {
+			compatible = "mediatek,mt6895-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x1c00e000 0 0x1000>;
+			wakeup-source;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_EDGE_RISING 0>;
+			clocks = <&clk26m>;
+			clock-names = "kpd";
+
+			status = "disabled";
+		};
+
+		systimer: timer@1c011000 {
+			compatible = "mediatek,mt6895-timer",
+				     "mediatek,mt6765-timer";
+			reg = <0 0x1c011000 0 0x1000>;
+			interrupts = <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk13m>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+};

-- 
2.56.0


