Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D7AC28B20
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Mar 2025 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJsR2+W6v3RnojP+wgIYk/sT/Hhyw76l4uAVukATtaQ=; b=D8F+dJGzpcfNHC2WRr7HS5Tt7G
	3vVMHMmLsDMiXIpjCtj6NXKHC9r0ZkVTOAZDioOC83DFI1p6MYzYEXEEpv8AL90gJ0oEAOGlBxPUh
	CP/cII++nCgjCEYj/AKFjKY9IgPVtlcMBJs3wCeX2KNp8BNBM9KvTkyGzqIqMnmbnLPbXxGCQlxp3
	OxckPnG0snbzraVnkHc57LhsyVjtW7WRWZjyJOgkNtKvc8kbEqgDlni60EwlIt3wPu++/W9EkjtjF
	tr2rnkR42KKtH1gwnYTLUcJ7z74P1FIEACKhx7KnEUsk5kM1QeP+9nBLoxtxjdW1w4ht8rGNriFQ6
	CbFQqkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4i-0000000GQ0U-27Hg;
	Sun, 30 Mar 2025 17:03:56 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4e-0000000GPvi-0pOc
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Mar 2025 17:03:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B27C92FB93B;
	Sun, 30 Mar 2025 19:03:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354230; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EJsR2+W6v3RnojP+wgIYk/sT/Hhyw76l4uAVukATtaQ=;
	b=nEHjLjnRNgdP9tiho9d4QUPt2XTxYsf1oZtt1bTNl72JvuQeGv517olX86zxBg2d65fZ2t
	J7D0OivXj+l3u0WNAFD5/P1jgEye5tk1OhTM5qg9LWdph1x+3BYJzmTWeEEQwCySgqUAUQ
	x4jDguiTdcvCvknJn/WE6mXk72hUN2A2tg5WZ2Vu02DTfsFyyaAKehiaSNDi6X8MGMbWUs
	MY5YaKrtmgZ4gSazBXQFv0xufN7vTMK3NQx2LfFRDEwe00zdkwQU6mQq3lFLx61il/dPTy
	EYQ4gtOQjq+JXB7RoTMDMLtPd9ZTMPgb76jRXvuWFQbMDB8PA4ryj49CMSu8ow==
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
Subject: [PATCH v3 07/10] mips: Add EcoNet MIPS platform support
Date: Sun, 30 Mar 2025 17:03:03 +0000
Message-Id: <20250330170306.2584136-8-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_100352_621597_F616023F 
X-CRM114-Status: GOOD (  16.55  )
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

Add platform support for EcoNet MIPS SoCs.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 arch/mips/Kbuild.platforms             |  1 +
 arch/mips/Kconfig                      | 25 +++++++++
 arch/mips/boot/compressed/uart-16550.c |  5 ++
 arch/mips/econet/Kconfig               | 37 ++++++++++++
 arch/mips/econet/Makefile              |  2 +
 arch/mips/econet/Platform              |  5 ++
 arch/mips/econet/init.c                | 78 ++++++++++++++++++++++++++
 7 files changed, 153 insertions(+)
 create mode 100644 arch/mips/econet/Kconfig
 create mode 100644 arch/mips/econet/Makefile
 create mode 100644 arch/mips/econet/Platform
 create mode 100644 arch/mips/econet/init.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index bca37ddf974b..41a00fa860c1 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -11,6 +11,7 @@ platform-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon/
 platform-$(CONFIG_EYEQ)			+= mobileye/
 platform-$(CONFIG_MIPS_COBALT)		+= cobalt/
 platform-$(CONFIG_MACH_DECSTATION)	+= dec/
+platform-$(CONFIG_ECONET)		+= econet/
 platform-$(CONFIG_MIPS_GENERIC)		+= generic/
 platform-$(CONFIG_MACH_JAZZ)		+= jazz/
 platform-$(CONFIG_LANTIQ)		+= lantiq/
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1924f2d83932..909bf0847af0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -390,6 +390,30 @@ config MACH_DECSTATION
 
 	  otherwise choose R3000.
 
+config ECONET
+	bool "EcoNet MIPS family"
+	select BOOT_RAW
+	select CPU_BIG_ENDIAN
+	select DEBUG_ZBOOT
+	select EARLY_PRINTK_8250
+	select ECONET_EN751221_TIMER
+	select SERIAL_OF_PLATFORM
+	select SYS_SUPPORTS_BIG_ENDIAN
+	select SYS_HAS_CPU_MIPS32_R1
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_HAS_EARLY_PRINTK
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_MIPS16
+	select SYS_SUPPORTS_ZBOOT_UART16550
+	select USE_GENERIC_EARLY_PRINTK_8250
+	select USE_OF
+	help
+	  EcoNet EN75xx MIPS devices are big endian MIPS machines used
+	  in XPON (fiber) and DSL applications. They have SPI, PCI, USB,
+	  GPIO, and Ethernet, with optional XPON, DSL, and VoIP DSP cores.
+	  Don't confuse these with the Airoha ARM devices sometimes referred
+	  to as "EcoNet", this family is for MIPS based devices only.
+
 config MACH_JAZZ
 	bool "Jazz family of machines"
 	select ARC_MEMORY
@@ -1019,6 +1043,7 @@ source "arch/mips/ath79/Kconfig"
 source "arch/mips/bcm47xx/Kconfig"
 source "arch/mips/bcm63xx/Kconfig"
 source "arch/mips/bmips/Kconfig"
+source "arch/mips/econet/Kconfig"
 source "arch/mips/generic/Kconfig"
 source "arch/mips/ingenic/Kconfig"
 source "arch/mips/jazz/Kconfig"
diff --git a/arch/mips/boot/compressed/uart-16550.c b/arch/mips/boot/compressed/uart-16550.c
index db618e72a0c4..529e77a6487c 100644
--- a/arch/mips/boot/compressed/uart-16550.c
+++ b/arch/mips/boot/compressed/uart-16550.c
@@ -20,6 +20,11 @@
 #define PORT(offset) (CKSEG1ADDR(INGENIC_UART_BASE_ADDR) + (4 * offset))
 #endif
 
+#ifdef CONFIG_ECONET
+#define EN75_UART_BASE	0x1fbf0003
+#define PORT(offset)	(CKSEG1ADDR(EN75_UART_BASE) + (4 * (offset)))
+#endif
+
 #ifndef IOTYPE
 #define IOTYPE char
 #endif
diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
new file mode 100644
index 000000000000..d03f90f3daa4
--- /dev/null
+++ b/arch/mips/econet/Kconfig
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0
+if ECONET
+
+choice
+	prompt "EcoNet SoC selection"
+	default SOC_ECONET_EN751221
+	help
+	  Select EcoNet MIPS SoC type. Individual SoCs within a family are
+	  very similar, so is it enough to select the right family, and
+	  then customize to the specific SoC using the device tree only.
+
+	config SOC_ECONET_EN751221
+		bool "EN751221 family"
+		select COMMON_CLK
+		select ECONET_EN751221_INTC
+		select IRQ_MIPS_CPU
+		select SMP
+		select SMP_UP
+		select SYS_SUPPORTS_SMP
+		help
+		  The EN751221 family includes EN7512, RN7513, EN7521, EN7526.
+		  They are based on single core MIPS 34Kc processors. To boot
+		  this kernel, you will need a device tree such as
+		  MIPS_RAW_APPENDED_DTB=y, and a root filesystem.
+endchoice
+
+choice
+	prompt "Devicetree selection"
+	default DTB_ECONET_NONE
+	help
+	  Select the devicetree.
+
+	config DTB_ECONET_NONE
+		bool "None"
+endchoice
+
+endif
diff --git a/arch/mips/econet/Makefile b/arch/mips/econet/Makefile
new file mode 100644
index 000000000000..7e4529e7d3d7
--- /dev/null
+++ b/arch/mips/econet/Makefile
@@ -0,0 +1,2 @@
+
+obj-y := init.o
diff --git a/arch/mips/econet/Platform b/arch/mips/econet/Platform
new file mode 100644
index 000000000000..ea5616447bcd
--- /dev/null
+++ b/arch/mips/econet/Platform
@@ -0,0 +1,5 @@
+# To address a 7.2MB kernel size limit in the EcoNet SDK bootloader,
+# we put the load address well above where the bootloader loads and then use
+# zboot. So please set CONFIG_ZBOOT_LOAD_ADDRESS to the address where your
+# bootloader actually places the kernel.
+load-$(CONFIG_ECONET)	+= 0xffffffff81000000
diff --git a/arch/mips/econet/init.c b/arch/mips/econet/init.c
new file mode 100644
index 000000000000..6f43ffb209cb
--- /dev/null
+++ b/arch/mips/econet/init.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * EcoNet setup code
+ *
+ * Copyright (C) 2025 Caleb James DeLisle <cjd@cjdns.fr>
+ */
+
+#include <linux/init.h>
+#include <linux/of_clk.h>
+#include <linux/irqchip.h>
+
+#include <asm/addrspace.h>
+#include <asm/io.h>
+#include <asm/bootinfo.h>
+#include <asm/time.h>
+#include <asm/prom.h>
+#include <asm/smp-ops.h>
+#include <asm/reboot.h>
+
+#define CR_AHB_RSTCR		((void __iomem *)CKSEG1ADDR(0x1fb00040))
+#define RESET			BIT(31)
+
+#define UART_BASE		CKSEG1ADDR(0x1fbf0003)
+#define UART_REG_SHIFT		2
+
+static void hw_reset(char *command)
+{
+	iowrite32(RESET, CR_AHB_RSTCR);
+}
+
+/* 1. Bring up early printk. */
+void __init prom_init(void)
+{
+	setup_8250_early_printk_port(UART_BASE, UART_REG_SHIFT, 0);
+	_machine_restart = hw_reset;
+}
+
+/* 2. Parse the DT and find memory */
+void __init plat_mem_setup(void)
+{
+	void *dtb;
+
+	set_io_port_base(KSEG1);
+
+	dtb = get_fdt();
+	if (!dtb)
+		panic("no dtb found");
+
+	__dt_setup_arch(dtb);
+
+	early_init_dt_scan_memory();
+}
+
+/* 3. Overload __weak device_tree_init(), add SMP_UP ops */
+void __init device_tree_init(void)
+{
+	unflatten_and_copy_device_tree();
+
+	register_up_smp_ops();
+}
+
+const char *get_system_type(void)
+{
+	return "EcoNet-EN75xx";
+}
+
+/* 4. Initialize the IRQ subsystem */
+void __init arch_init_irq(void)
+{
+	irqchip_init();
+}
+
+/* 5. Timers */
+void __init plat_time_init(void)
+{
+	of_clk_init(NULL);
+	timer_probe();
+}
-- 
2.39.5


