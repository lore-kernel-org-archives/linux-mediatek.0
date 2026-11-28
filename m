Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CDE606A321
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ln4Vf7Lz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6Hp8F6b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/byIlVMP9LxJ2ciT0gDQ4yghuuOkdLHgAUlgdYldohc=; b=Ln4Vf7LzvzYRBd
	hI9zaskd/LLLduR1s0MhWvVCVlNeCp2cWXlxD13nr/uoDUi0E4Pal9MCmh6MbKZGdfsqH8VPkKo70
	wkMD1Lwuj0vwnydpd3SO7MKtHjw4H0PeRsQ49oIqW7kV6In0SCSbJSiK0033sTvzaiejM3sedVIke
	cVdz8n79po9isKyKxcneRUPNsPlZjDPZEkb+AkYhwkJtSY9ERlGUFt0mNQyh8Hk0k1NUA8Z54qa+7
	0+C04AOOWjldM7+dojMU7mUXGu2r4GHLaKgZrLhmFGz0kr5H4S0e1EysQOSMdZ6IHG+/zETAnDfnw
	5stYPpqeqWqWieC9OjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDc-00000000pVG-14fC;
	Sat, 28 Nov 2026 14:16:00 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDM-00000000pKz-2eZo
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 14:15:47 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-385d8a00598so14488949eec.1
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Nov 2026 06:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875344; x=1796480144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/byIlVMP9LxJ2ciT0gDQ4yghuuOkdLHgAUlgdYldohc=;
        b=X6Hp8F6byGvKHpJh+n00nEe5hnffAIWRHS+6OqDxsw88oa8WG4VY/oZHO0aNUgJUoQ
         tXYufqhVIkPsQcZFlLq2vgwf3z9devpn9ELK1l0iHwaPCt+0cwOMyUNpLWaaiZwaKbyv
         QwsvvDAu0VRhplg6pUUAsrTqCk+GSU0LDLztd5TI0PEMzNP5rezU9i6ds8uRv7vv1RD6
         OekzdIbbsXCiGTmZr4M/pSw7HHSRZ/YgpiETKiaMz5GYUuwwG7A73xp6oVcsLhQv6cch
         5p/g/6eAnKb9waGfJjI4A7HQ/sSX1pe2+JNLYf+xY6flM+qMsI06kVRjKrwOgRNTXxkX
         gl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875344; x=1796480144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/byIlVMP9LxJ2ciT0gDQ4yghuuOkdLHgAUlgdYldohc=;
        b=KDpusMC25hoj+u/Quo6qpi3LU26ZKeVDX4tiuwTtCJBknx68KBe++ZBnaWGZAu1CQl
         p7KhPVLDjSw5qPv2x3DtnlWbVNRxElDkb7gR2r4Xjlp2XWcJXoWZeWcmveqfLqcRtKDk
         WSiweNZVq9MrgphSy6WlSt9PKfH0KpVuGoSmPf3ijnkMxg8tYy1KcxHoi5V6qIwUy1Sn
         iQhmcDJABWN0S+z8u68deMYJKp0lQQcsFh0OEP5GU5n2hxw8KD4rgP3UYqeinqVXfzWy
         w61n/ybwwHR1YFKcTI9JJbcMbXV7QkTtXlm/yX0KILzlg8RMQnxZg1tYqYb5Yq8Rs9vs
         yqvg==
X-Forwarded-Encrypted: i=1; AL+hErF06p0IX0gacWIYxe8yZvnsiJHftO+HE2KBsstFUUx2J7stvB1GfkAe9LOlfh9Y3WRwyZZ0x5G80/3c8lc6AA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/LoceXNw6paQAWhQ9hxL51BE3Znnot6wrpBK1WFKnASulDBkdj
	34y1urzCfY0FSweH6tbTLgCg20QiQtPBfVH4WTSPQz0x2V4meQ2VnBMA
X-Gm-Gg: AZFdTZfcOScrx7mP4jQrBTCOUWYfYVM9/LF2+Ny2giNznGAR2ZKmg5dgbVsV6A2xFh7
	zf/vhCntOS08RxpWy3Hp6nHWMJvngu2Ja+Iuo0RWYhGe1Z6s2t8p9Ul2kzPsuSbwtSZgq0y1aLO
	SM5KkElpHOneFEq+zQqwbOd9BcMfliXmhCSlaIFI1nPEh/fBs+elPUj/XzgXG51fMU/BCauaef0
	7zi0a1Sx2yHcjNiRL5Q9ZEDDa9qVvurACu3Q6V60C/Y9bunciImQ/7WvRBqjL/yMoIxtVNoJQZy
	Too6YdPiDH5CyUEjkQLuetyjSVWBw4xfN05/O/6K6AtCeeqzSOSxvMbXTNB71dxRbnPhWraNDTA
	GBWFgoD05EhXutveRoRkIpPehaHgeE/DZpqr8WDJNVf6JoqwMEBk1RTvZGxVKhQOTZtOZ6aImWA
	DYYs0QnPshSa1zdp6OryyiIUFFIHkcW0/hh4QLgeq05jJurNsCb/qPYg7QYcESfyBP0PSmJVf9p
	AwCZpDDqnpAQawt5MA/LWyaGNjzNqGlDfcIbbaTYr+T1ZxwtKEEeIS+Y16YB4AulzhLzlUJ15lV
	W2CHfGfipBIMu0vb2fb3XFnaHZ+ksdtnQEIpwQ8DKOnyzJ0CXyNfuSR1CGI7yeYzmkzNtOfvFKH
	nOlA7FEUJ8eyp1TuSaMRw1lU8j2+C
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr28974642eec.19.1795875343193;
        Sat, 28 Nov 2026 06:15:43 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:42 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 5/6] arm64: dts: mediatek: Add MT8189 Skywalker platform based Tarkin
Date: Sat, 28 Nov 2026 19:44:29 +0530
Message-ID: <20261128141443.13065-6-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061545_958171_1B8EB4EA 
X-CRM114-Status: GOOD (  17.70  )
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

Tarkin is an ASUS Chromebook (CM1405, CM1406) built on Google's MT8189
Skywalker reference design. Add the common Skywalker dtsi and a board
file for Tarkin.

This covers what the MT8189 bindings support today: the debug UART,
eMMC and the SD slot, the PMIC, the EC on SPI0 with the keyboard,
battery and Type-C ports, the GSC TPM and the trackpad. Tarkin can have
a HID over I2C trackpad at 0x15 or an Elan one at 0x2c, so both are
marked fail-needs-probe and left to the ChromeOS hardware prober.

The EC resets the PMIC on these boards, so the watchdog external reset
is disabled, as on the other MediaTek Chromebooks.

Display, GPU, audio, USB, UFS and PCIe are left out until the SoC side
for them is upstream.

The Skywalker and Tarkin descriptions are based on mt8189-skywalker.dtsi
and mt8189-skywalker-tarkin.dts from the ChromeOS kernel.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8189-skywalker-tarkin.dts  |  62 +++
 .../boot/dts/mediatek/mt8189-skywalker.dtsi   | 453 ++++++++++++++++++
 3 files changed, 516 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index e6a8109ff..cb8c01ea8 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku4.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku6.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku7.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8189-skywalker-tarkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin.dts b/arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin.dts
new file mode 100644
index 000000000..5b76d0ca9
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin.dts
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Google Inc.
+ */
+
+/dts-v1/;
+#include "mt8189-skywalker.dtsi"
+
+/ {
+	model = "Google Tarkin board";
+	chassis-type = "laptop";
+	compatible = "google,tarkin", "mediatek,mt8189";
+};
+
+&i2c7 {
+	trackpad@2c {
+		compatible = "elan,ekth3000";
+		reg = <0x2c>;
+		interrupts-extended = <&pio 125 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pins>;
+		vcc-supply = <&pp3300_s3>;
+		wakeup-source;
+
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c_tunnel {
+	/delete-node/ sbs-battery@b;
+
+	battery: sbs-battery@f {
+		compatible = "sbs,sbs-battery";
+		reg = <0xf>;
+		sbs,i2c-retry-count = <2>;
+		sbs,poll-retry-count = <10>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&mt6359_vemc_1_ldo_reg>;
+	vqmmc-supply = <&mt6359_vufs_ldo_reg>;
+
+	status = "okay";
+};
+
+&mmc1 {
+	status = "disabled";
+};
+
+&mt6359_vpa_buck_reg {
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1000000>;
+};
+
+&mt6359_vufs_ldo_reg {
+	regulator-always-on;
+};
+
+&trackpad {
+	status = "fail-needs-probe";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtsi b/arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtsi
new file mode 100644
index 000000000..f0c5a0da7
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtsi
@@ -0,0 +1,453 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Google Inc.
+ */
+
+#include "mt8189.dtsi"
+#include "mt6359.dtsi"
+#include "mt8189-pinfunc.h"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	aliases {
+		i2c3 = &i2c3;
+		i2c7 = &i2c7;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	ppvar_sys: regulator-ppvar-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "ppvar_sys";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	/* system wide 3.3V rail, controlled by the EC */
+	pp3300_z1: regulator-pp3300-z1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_z1";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
+	/* separately switched 3.3V rail, controlled by the PMIC */
+	pp3300_s3: regulator-pp3300-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&pp3300_z1>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+
+	status = "okay";
+
+	tpm@50 {
+		compatible = "google,cr50";
+		reg = <0x50>;
+		interrupts-extended = <&pio 138 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gsc_int_pin>;
+	};
+};
+
+&i2c7 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c7_pins>;
+
+	status = "okay";
+
+	trackpad: trackpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+		hid-descr-addr = <0x0001>;
+		interrupts-extended = <&pio 125 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pins>;
+		post-power-on-delay-ms = <10>;
+		vdd-supply = <&pp3300_s3>;
+		wakeup-source;
+	};
+};
+
+&mmc0 {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	cap-mmc-hw-reset;
+	hs400-ds-delay = <0x1481b>;
+	max-frequency = <200000000>;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_default>;
+	pinctrl-1 = <&mmc0_pins_uhs>;
+	supports-cqe;
+};
+
+&mmc1 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&pio 136 GPIO_ACTIVE_LOW>;
+	max-frequency = <200000000>;
+	no-mmc;
+	no-sdio;
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_pins_default>;
+	pinctrl-1 = <&mmc1_pins_uhs>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&mt6359_vpa_buck_reg>;
+	vqmmc-supply = <&mt6359_vsim1_ldo_reg>;
+	mediatek,tuning-step = <64>;
+
+	status = "okay";
+};
+
+/*
+ * Rails the bootloader turns on that no driver here claims. Keep them on
+ * so they survive the regulator core disabling unused supplies.
+ */
+&mt6359_va09_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vaux18_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vbbck_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vgpu11_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vmodem_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vpa_buck_reg {
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+};
+
+&mt6359_vproc2_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vpu_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vrf12_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vrfck_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vsram_md_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vsram_proc2_ldo_reg {
+	regulator-always-on;
+};
+
+&pio {
+	uart0_pins: uart0-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO31__FUNC_UTXD0>,
+				 <PINMUX_GPIO32__FUNC_URXD0>;
+			bias-pull-up;
+		};
+	};
+
+	i2c3_pins: i2c3-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO57__FUNC_SCL3>,
+				 <PINMUX_GPIO58__FUNC_SDA3>;
+			bias-disable;
+		};
+	};
+
+	i2c7_pins: i2c7-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO65__FUNC_SCL7>,
+				 <PINMUX_GPIO66__FUNC_SDA7>;
+			bias-disable;
+			drive-strength = <4>;
+		};
+	};
+
+	spi0_pins: spi0-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO69__FUNC_SPIM0_CSB>,
+				 <PINMUX_GPIO70__FUNC_SPIM0_CLK>,
+				 <PINMUX_GPIO71__FUNC_SPIM0_MO>,
+				 <PINMUX_GPIO72__FUNC_SPIM0_MI>;
+		};
+	};
+
+	ec_int_pins: ec-int-pins {
+		pins-int {
+			pinmux = <PINMUX_GPIO132__FUNC_GPIO132>;
+			bias-disable;
+			input-enable;
+		};
+	};
+
+	gsc_int_pin: gsc-int-pins {
+		pins-int {
+			pinmux = <PINMUX_GPIO138__FUNC_GPIO138>;
+			input-enable;
+		};
+	};
+
+	trackpad_pins: trackpad-pins {
+		pins-int {
+			pinmux = <PINMUX_GPIO125__FUNC_GPIO125>;
+			bias-disable;
+			input-enable;
+		};
+	};
+
+	mmc0_pins_default: mmc0-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
+				 <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
+				 <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
+				 <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
+				 <PINMUX_GPIO161__FUNC_MSDC0_CMD>,
+				 <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
+				 <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
+				 <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
+				 <PINMUX_GPIO166__FUNC_MSDC0_DAT0>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <6>;
+			input-enable;
+		};
+		pins-clk {
+			pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <6>;
+		};
+		pins-rst {
+			pinmux = <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
+			drive-strength = <6>;
+		};
+	};
+
+	mmc0_pins_uhs: mmc0-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
+				 <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
+				 <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
+				 <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
+				 <PINMUX_GPIO161__FUNC_MSDC0_CMD>,
+				 <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
+				 <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
+				 <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
+				 <PINMUX_GPIO166__FUNC_MSDC0_DAT0>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <8>;
+			input-enable;
+		};
+		pins-clk {
+			pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
+		};
+		pins-ds {
+			pinmux = <PINMUX_GPIO167__FUNC_MSDC0_DSL>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
+		};
+		pins-rst {
+			pinmux = <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
+		};
+	};
+
+	mmc1_pins_default: mmc1-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO168__FUNC_MSDC1_CMD>,
+				 <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
+				 <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
+				 <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
+				 <PINMUX_GPIO173__FUNC_MSDC1_DAT3>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <8>;
+			input-enable;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
+		};
+
+		pins-insert {
+			pinmux = <PINMUX_GPIO136__FUNC_GPIO136>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
+	mmc1_pins_uhs: mmc1-uhs-pins{
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO168__FUNC_MSDC1_CMD>,
+				 <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
+				 <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
+				 <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
+				 <PINMUX_GPIO173__FUNC_MSDC1_DAT3>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <8>;
+			input-enable;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
+		};
+	};
+
+};
+
+&pmic {
+	interrupts-extended = <&pio 194 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+	mediatek,pad-select = <0>;
+
+	status = "okay";
+
+	cros_ec: ec@0 {
+		compatible = "google,cros-ec-spi";
+		reg = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupts-extended = <&pio 132 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ec_int_pins>;
+		spi-max-frequency = <3000000>;
+
+		i2c_tunnel: i2c-tunnel {
+			compatible = "google,cros-ec-i2c-tunnel";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			google,remote-bus = <4>;
+		};
+
+		typec {
+			compatible = "google,cros-ec-ucsi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb_c0: connector@0 {
+				compatible = "usb-c-connector";
+				reg = <0>;
+				data-role = "host";
+				label = "left";
+				power-role = "dual";
+				try-power-role = "source";
+			};
+
+			usb_c1: connector@1 {
+				compatible = "usb-c-connector";
+				reg = <1>;
+				data-role = "host";
+				label = "right";
+				power-role = "dual";
+				try-power-role = "source";
+			};
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+
+	status = "okay";
+};
+
+&watchdog {
+	mediatek,disable-extrst;
+};
+
+#include <arm/cros-ec-keyboard.dtsi>
+#include <arm/cros-ec-sbs.dtsi>
+
+&keyboard_controller {
+	keypad,num-columns = <15>;
+
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
+		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
+		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
+		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
+		MATRIX_KEY(0x00, 0x01, 0)	/* T11 */
+		MATRIX_KEY(0x01, 0x05, 0)	/* T12 */
+	>;
+
+	linux,keymap = <
+		CROS_STD_MAIN_KEYMAP
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)		/* T1 */
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)		/* T2 */
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)		/* T3 */
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)		/* T4 */
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)		/* T5 */
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)	/* T6 */
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)	/* T7 */
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)		/* T8 */
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)		/* T9 */
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)		/* T10 */
+		MATRIX_KEY(0x00, 0x01, KEY_MICMUTE)		/* T11 */
+		MATRIX_KEY(0x01, 0x05, KEY_CONTROLPANEL)	/* T12 */
+		MATRIX_KEY(0x03, 0x05, KEY_PREVIOUSSONG)	/* T13 */
+		MATRIX_KEY(0x00, 0x09, KEY_PLAYPAUSE)		/* T14 */
+		MATRIX_KEY(0x00, 0x0b, KEY_NEXTSONG)		/* T15 */
+		MATRIX_KEY(0x03, 0x00, KEY_LEFTMETA)		/* Search */
+		MATRIX_KEY(0x01, 0x0e, KEY_LEFTCTRL)		/* Left Control */
+		MATRIX_KEY(0x06, 0x0d, KEY_LEFTALT)		/* Left Alt */
+		MATRIX_KEY(0x03, 0x0e, KEY_RIGHTCTRL)		/* Right Control */
+		MATRIX_KEY(0x06, 0x0a, KEY_BACKSLASH)		/* Backslash */
+	>;
+};
-- 
2.46.0


