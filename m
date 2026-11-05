Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098A3606D825
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uDz6Beux;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRULhRKA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3gHxePExHDGCUUw0dEUJ6/bp6SdmytffH6Zxb6AKWmo=; b=uDz6Beuxo2lF+r
	IzTKfUhxC92V5kHMPUpgHxWXzfsu/YDC7q3YpQmx7+clyBSMQmPcLzkFZcUCDdmNEaipe6oto9Zxm
	GrGDols1mdBQ+neK22fOMIMTh25NMXZWkiZW3ajk+ECUdiRJgrSau6FhTEJkv3sRPjJZ+SaJsE7eO
	8wls4s7CNw7ujZbuyShCZQ6sjZUohbei3Bvf7PvUpH5ysnXSg+kQSAUdcUdEYQNuAJARJJuv5JD/X
	/pi4hXqqw4HgDMlONz/L9MHAJY2XGJEC3lC0i/GKPBOwE2n9IXBKtJTRl/0lRzOJnfCOeqUN95uiq
	0PxYgNarJqEhvdi+J5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gY-0000000AgNB-3B24;
	Thu, 05 Nov 2026 21:07:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gT-0000000AgFq-1VQ0
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:47 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2270085a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 13:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912864; x=1794517664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gHxePExHDGCUUw0dEUJ6/bp6SdmytffH6Zxb6AKWmo=;
        b=HRULhRKAcP5iRgyMqE1qNcHl5Ydj4tNBfHUT0Sn9tCo2875ORYmaiWFa1HGpEWMSz0
         woglza8dg0kodNGbkpP9XZ6bWQkNh1ktHdrchFgX+dKtY34Lba1Zqj020gYqPuetFTde
         HJic3cnNk3TsiMIaRlsI0g+ogYMPrsFNQzLaLom5cSEm3ev7Hhfyw3OJ/nJAf9lTF2Ci
         XNcPa9huAO9kZPznK3QZEbGzNxqQZGTzqYv35Oah8CVNiDESzHTXfuDyH3UEks1jqxCD
         IWhr1uOE6ijk2hxdpKMyMl+4JA4OwkWtzFygzQ7rivUFQUBKa4IYjLIw83aurAEN0Sd8
         EFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912864; x=1794517664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gHxePExHDGCUUw0dEUJ6/bp6SdmytffH6Zxb6AKWmo=;
        b=0hJPd3av0TEr5E0GOJAbaG85baSsizp8ZAvhgbzh8cdeQ+35O6LC4AexFTRwBfDf1W
         X6HQR/+ww3tLMeVM7PFXCtO1Cu+EZKO6XUqfuxfXhjzVZD+pXKC/GzIVnrwbMHrRBU0U
         FArXMBV0moQMsqvmJJPm3cpaZnV6lA426X+qDlrYBV6EvjkzkZ6OuNl4W+4RaNMcpkme
         Fe3iB+1mYBJcpucnFqLlv9CbOwrcj1qU6r2eccdq7i2q+B/NmP35uYxbbdPDKw7VNne2
         3ZvT6bExuYbnzvNBGPNKfvEfkzcHKB+vqliSRxGSyUPWhOw+xeTEyrpTCfYM/t4sfdsV
         Dd5A==
X-Forwarded-Encrypted: i=1; AKwUvByoFeGnmpkuKPgqUUK+RxD5WTRTF7I5o/YE7CiV6sRtzp/weRh1tgwAIijYEMoUFR+ff0mX0UMkw/Hh9PoJ5w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8krWRwZbWJswWnu6YNSVc+LkJ+v9HfjU2TbEUE84Fnr4iFP0Ua
	hV7il1ONlIOYMl4QX2F5yzwTeQHtbwZwLRUcyLOF2gtiUWekBbV/9JlY
X-Gm-Gg: AYBFou1vTz2PVGh08GS0A4ju5PlrmM4Wm0QX/uJEV28SZtOeEHT8fWR0h04SgRjzKmb
	q5eBX7n037cLPIaPBWpXzFjU1ov9tismHVaJuWsxPvRchcgWnDZV+b6g54yqHIITm7+FMKOva5l
	LgLyQzDX0RJFmD9zbG0CVpvsd4+qSqNCF2EkgX3C65RuBgZMYXDy6FEGONy+KXIdcCr6mdT/KlF
	adf6cQ2kUS5HHb0UQa4TQLu7Xdt3cmScrIMMVyBmlRb9oT43CaoV6LE+xuhI6S7dcI/kdQEoq+3
	ey/ZxIkZmM3VoZLc1illSwUM8RqYG33RnmZkZT6c0uvgZYvVrOKOENs08KkrKhZO2rRmmKLSE62
	xJgS9sGtaKVqdJ6rBIAOxEaTZERIzLC3jWNBVoV7yHurm6pHs9kZB9NHuJJbNa3KGx/lsHb7NFl
	304YrQR9K84GT3AiPyQM9Ao1m7xGTGdFXCuxLoB32hNmufFwP1+16FKuEAAx9nJPGSa5giU6ham
	cmDn6s63mbxopFfDQuLxeBMIp09MBitRveleeo317NRyT2h8NF9q9VrEYI9qFSosC1xzQatE0JL
	QrXdy1A5KRr/QJJBPX8VPhx+8YdPPI8L9bSXkbPt0yCr8Y5e0Q==
X-Received: by 2002:a05:6402:1ecf:b0:6b5:6478:a9a5 with SMTP id 4fb4d7f45d1cf-6b5977d8c85mr324805a12.10.1793912863653;
        Thu, 05 Nov 2026 13:07:43 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:43 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: mediatek: Add MT6895 SoC
Date: Fri,  6 Nov 2026 00:06:02 +0300
Message-ID: <20261105210622.523747-5-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130745_540511_F113CF39 
X-CRM114-Status: GOOD (  12.90  )
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

Add initial support for the MediaTek MT6895 (Dimensity 8100) SoC, which
has four Cortex-A55 and four Cortex-A78 cores.

Describe the CPUs, PSCI, the GICv3 interrupt controller, the architected
timer, two UARTs and the watchdog. There is no clock controller driver
for this SoC yet, so both UART clocks use a fixed 26 MHz clock.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6895.dtsi | 166 +++++++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6895.dtsi b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
new file mode 100644
index 000000000000..c80f30da7bf9
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "mediatek,mt6895";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
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
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x400>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x500>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x600>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x700>;
+			enable-method = "psci";
+		};
+	};
+
+	clk26m: clock-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
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
+		};
+
+		uart0: serial@11001000 {
+			compatible = "mediatek,mt6895-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001000 0 0x1000>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart1: serial@11002000 {
+			compatible = "mediatek,mt6895-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x1000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		watchdog: watchdog@1c007000 {
+			compatible = "mediatek,mt6895-wdt", "mediatek,mt6589-wdt";
+			reg = <0 0x1c007000 0 0x100>;
+		};
+	};
+};
-- 
2.56.0


