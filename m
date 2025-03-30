Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EADAC28B20
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Mar 2025 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkLMSOjML/6N8DjLAPOdlpsVnmShX6qoQxfMpsHdiGM=; b=TOTksP5cenZOtf3m8KaxXXOVaL
	yoHTs6H4Sbnxb4LL345lAJ52MeD8gQYQYtLG/Jqi8OTlNmYyUf1z1NaJruAjukgSKlKPl5ZsuOwzX
	MO4LbmnaE9sRm4o+0kSd+nUM93r3AolUy1/ndD/eE0lJABBetjp+QkcjFJCUXg31Iq3gVRQLXFztC
	mKf4jgTVJkDK+gXx8FJsrU4ah4FU1D+IjTjHD/VxY4dLDl/eW6KcL5AbbefTaNLeyBiEyg7ifsyg7
	CX5pIskgi8cyN6Tkr2EYGberiw410HZUZmpkXB0MzV/3WcG57mDfA9r/ttrIkdZT4GoDIpqRMZsu9
	GprvrPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4m-0000000GQ3r-0qAt;
	Sun, 30 Mar 2025 17:04:00 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4i-0000000GPzo-20FC
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Mar 2025 17:03:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB5532FC928;
	Sun, 30 Mar 2025 19:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354234; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hkLMSOjML/6N8DjLAPOdlpsVnmShX6qoQxfMpsHdiGM=;
	b=PRdHDok8gcx7WyR8qx08NP40qJpAYubJHFl3/gaob7srq1s24jDF/qO/c1BFG4hD9XAV6P
	stWub7sDCHvsllzclSHifpT1MHpn9AOnomUUTsXjaBcUbQk7nmOvy6NVz1qeeHj8Nd9gMj
	mUz4CwNQmIbOGg4NCMyKadHVI8gCRD/qr4Tvt34E/IBW1S7q99efvk+vV84fn/vBVEZ6nu
	3LsAMZAFfD33F3rlWli6pGsTM/6ZUVpCyvMbwfjqvUAN+hVLl/rXPMgqwlyU7i0XmvOWb0
	HTxIxW82ApH8VqhvrTLZPOd4SQarR5pISAuzPWUUYFLR34TstbXzUKkXlmZ6ww==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 09/10] mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board
Date: Sun, 30 Mar 2025 17:03:05 +0000
Message-Id: <20250330170306.2584136-10-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_100356_924450_FE643708 
X-CRM114-Status: GOOD (  14.65  )
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

Add DTS files in support of EcoNet platform, including SmartFiber XP8421-B,
a low cost commercially available board based on EN751221.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
To my knowledge, evaluation boards from EcoNet are not currently available.
SmartFiber XP8421-B is currently manufactured, low cost, and can be
purchased as single units by the general public.
---
 arch/mips/boot/dts/Makefile                   |  1 +
 arch/mips/boot/dts/econet/Makefile            |  2 +
 arch/mips/boot/dts/econet/en751221.dtsi       | 67 +++++++++++++++++++
 .../econet/en751221_smartfiber_xp8421-b.dts   | 19 ++++++
 arch/mips/econet/Kconfig                      | 11 +++
 5 files changed, 100 insertions(+)
 create mode 100644 arch/mips/boot/dts/econet/Makefile
 create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
 create mode 100644 arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index ff468439a8c4..7375c6ced82b 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
 subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
+subdir-$(CONFIG_ECONET)			+= econet
 subdir-$(CONFIG_EYEQ)			+= mobileye
 subdir-$(CONFIG_FIT_IMAGE_FDT_MARDUK)   += img
 subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
diff --git a/arch/mips/boot/dts/econet/Makefile b/arch/mips/boot/dts/econet/Makefile
new file mode 100644
index 000000000000..b467d5624e39
--- /dev/null
+++ b/arch/mips/boot/dts/econet/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_DTB_ECONET_SMARTFIBER_XP8421_B)	+= en751221_smartfiber_xp8421-b.dtb
diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts/econet/en751221.dtsi
new file mode 100644
index 000000000000..66197e73d4f0
--- /dev/null
+++ b/arch/mips/boot/dts/econet/en751221.dtsi
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+/ {
+	compatible = "econet,en751221";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	hpt_clock: clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;  /* 200 MHz */
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "mips,mips24KEc";
+			reg = <0>;
+		};
+	};
+
+	cpuintc: interrupt-controller {
+		compatible = "mti,cpu-interrupt-controller";
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+	};
+
+	intc: interrupt-controller@1fb40000 {
+		compatible = "econet,en751221-intc";
+		reg = <0x1fb40000 0x100>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
+	};
+
+	uart: serial@1fbf0000 {
+		compatible = "ns16550";
+		reg = <0x1fbf0000 0x30>;
+		reg-io-width = <4>;
+		reg-shift = <2>;
+		interrupt-parent = <&intc>;
+		interrupts = <0>;
+		/*
+		 * Conversion of baud rate to clock frequency requires a
+		 * computation that is not in the ns16550 driver, so this
+		 * uart is fixed at 115200 baud.
+		 */
+		clock-frequency = <1843200>;
+	};
+
+	timer_hpt: timer@1fbf0400 {
+		compatible = "econet,en751221-timer";
+		reg = <0x1fbf0400 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <30>;
+		clocks = <&hpt_clock>;
+	};
+};
diff --git a/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts b/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
new file mode 100644
index 000000000000..8223c5bce67f
--- /dev/null
+++ b/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "en751221.dtsi"
+
+/ {
+	model = "SmartFiber XP8421-B";
+	compatible = "smartfiber,xp8421-b", "econet,en751221";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x1c000000>;
+	};
+
+	chosen {
+		stdout-path = "/serial@1fbf0000:115200";
+		linux,usable-memory-range = <0x00020000 0x1bfe0000>;
+	};
+};
diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
index d03f90f3daa4..fd69884cc9a8 100644
--- a/arch/mips/econet/Kconfig
+++ b/arch/mips/econet/Kconfig
@@ -32,6 +32,17 @@ choice
 
 	config DTB_ECONET_NONE
 		bool "None"
+
+	config DTB_ECONET_SMARTFIBER_XP8421_B
+		bool "EN751221 SmartFiber XP8421-B"
+		depends on SOC_ECONET_EN751221
+		select BUILTIN_DTB
+		help
+		  The SmartFiber XP8421-B is a device based on the EN751221 SoC.
+		  It has 512MB of memory and 256MB of NAND flash. This kernel
+		  needs only an appended initramfs to boot. It can be loaded
+		  through XMODEM and booted from memory in the bootloader, or
+		  it can be packed in tclinux.trx format and written to flash.
 endchoice
 
 endif
-- 
2.39.5


