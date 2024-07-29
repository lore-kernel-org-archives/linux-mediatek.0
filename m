Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD30BC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 06:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gixYLGT5rnuhlP74NmM9/sA6F6unwXp4WvVoPLmSwqg=; b=fuSBfpY9UjaFz/
	1O6W3jEvxoyRZpdMI0I8GNpUkNOARS7G3JhERp6DvT97eblUx9ZxkUW8ABevtZeCA6KSt3ONMjbKs
	wuAmx1JwmJLWV2AwuvJWanrW/FzqoFbc6SQJL4iHdab6EkC1RmtMy1uvLvzH6KYGWuK+OziiwpvCc
	jQMDq4fR+StMrUxlgV17HY42o8iXNfzJfM5qNBW53xf4bA/vSnGDAYWtXYKQ5obhCzlGZwQ9PktLv
	2TRsmIEX4TcNJmnQB7yoUoqw/kmqMy4w4bkOIpsFrQ0t7VrfXKp8X8l4gPO8OTREUrv+BGJ56bRoa
	fuyuU7RcmOa38pQeRZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKJa-0000000ADtd-1kCa;
	Mon, 29 Jul 2024 06:57:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKJ9-0000000ADou-3fy9;
	Mon, 29 Jul 2024 06:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1722236195; x=1753772195;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4Bj6pOgZySaik8CfN968/6tFIMbD5TTGKEjxKtr17M4=;
  b=r7dPjmO+oXMU3MiO1o4AgjE76rHdsuOZfQUaVLLRROoToJzjaf0Q00q7
   pB2O4PIAwDtoRRXXbQjxeG7mka4tTCSMYkpMCDacpM/AKTtf+pr6VLOCm
   QaU+IcwFwo6seF79DQP/t28sTRP9bhTPo8k1FId9lgqY6C6Z/92ay2njJ
   2HB3vXxsMKat1zEbQ/svuNM5/Il4Ktu7aD385ch0fPk5FytROfMlJa/aB
   RK6GoUJKioEey8EMVnlF7N4kh9aou9kv5DicDP4grnUvlIuJ3qc7hW9cS
   RhTMcCaor0bd2UtfTuMI+0oG2oUtkBJ0AKx+3JCex+r27OhK/qTziuZHr
   w==;
X-CSE-ConnectionGUID: kDWal4QQS/6xpsg/XCP1jw==
X-CSE-MsgGUID: Q8MkapfqRxWh2kKHl5ZfZA==
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="30453453"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jul 2024 23:56:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Jul 2024 23:56:18 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 28 Jul 2024 23:56:06 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<tglx@linutronix.de>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>, <richard.genoud@bootlin.com>,
	<radu_nicolae.pirea@upb.ro>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <linux@armlinux.org.uk>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <ychuang3@nuvoton.com>,
	<schung@nuvoton.com>, <mihai.sain@microchip.com>,
	<varshini.rajendran@microchip.com>, <andrei.simion@microchip.com>,
	<arnd@arndb.de>, <Jason@zx2c4.com>, <dharma.b@microchip.com>,
	<rdunlap@infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v6 00/27] Add support for sam9x7 SoC family
Date: Mon, 29 Jul 2024 12:26:03 +0530
Message-ID: <20240729065603.1986074-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_235635_985681_281C4AAA 
X-CRM114-Status: GOOD (  28.82  )
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

This patch series adds support for the new SoC family - sam9x7.
 - The device tree, configs and drivers are added
 - Clock driver for sam9x7 is added
 - Support for basic peripherals is added
 - Target board SAM9X75 Curiosity is added

 Changes in v6:
 --------------

 - Addressed all the review comments in the patches
 - Picked up all Acked-by and Reviewed-by tags
 - Reverted the IRQ patch to that of version 3 of the same series
 - All the specific changes are captured in the corresponding patches

 Changes in v5:
 --------------

 - Addressed all the review comments in the patches
 - Picked up all Acked-by and Reviewed-by tags
 - Dropped applied patches from the series
 - Addressed the ABI breakage reported in the IRQ patch
 - All the specific changes are captured in the corresponding patches

 Changes in v4:
 --------------

 - Addressed all the review comments in the patches
 - Picked up all Acked-by and Reviewed-by tags
 - Dropped applied patches from the series
 - Added pwm node and related dt binding documentation
 - Added support for exporting some clocks to DT
 - Dropped USB related patches and changes. See NOTE.
 - All the specific changes are captured in the corresponding patches

 NOTE: Owing to the discussion here
 https://lore.kernel.org/linux-devicetree/CAL_JsqJ9PrX6fj-EbffeJce09MXs=B7t+KS_kOinxaRx38=WxA@mail.gmail.com/
 the USB related changes are dropped from this series in order to enable
 us to work on the mentioned issues before adding new compatibles as
 said. The issues/warnings will be addressed in subsequent patches.
 After which the USB related support for sam9x7 SoCs will be added. Hope
 this works out fine.

 Changes in v3:
 --------------

 - Fixed the DT documentation errors pointed out in v2.
 - Dropped Acked-by tag in tcb DT doc patch as it had to be adapted
   according to sam9x7 correctly.
 - Picked by the previously missed tags.
 - Dropped this patch "dt-bindings: usb: generic-ehci: Document clock-names
   property" as the warning was not found while validating DT-schema for
   at91-sam9x75_curiosity.dtb.
 - Dropped redundant words in the commit message.
 - Fixed the CHECK_DTBS warnings validated against
   at91-sam9x75_curiosity.dtb.
 - Renamed dt nodes according to naming convention.
 - Dropped unwanted status property in dts.
 - Removed nodes that are not in use from the board dts.
 - Removed spi DT doc patch from the series as it was already applied
   and a fix patch was applied subsequently. Added a patch to remove the
   compatible to adapt sam9x7.
 - Added sam9x7 compatibles in usb dt documentation.


 Changes in v2:
 --------------

 - Added sam9x7 specific compatibles in DT with fallbacks
 - Documented all the newly added DT compatible strings
 - Added device tree for the target board sam9x75 curiosity and
   documented the same in the DT bindings documentation
 - Removed the dt nodes that are not supported at the moment
 - Removed the configs added by previous version that are not supported
   at the moment
 - Fixed all the corrections in the commit message
 - Changed all the instances of copyright year to 2023
 - Added sam9x7 flag in PIT64B configuration
 - Moved macro definitions to header file
 - Added another divider in mck characteristics in the pmc driver
 - Fixed the memory leak in the pmc driver
 - Dropped patches that are no longer needed
 - Picked up Acked-by and Reviewed-by tags


Hari Prasath (1):
  irqchip/atmel-aic5: Add support for sam9x7 aic

Varshini Rajendran (26):
  dt-bindings: atmel-sysreg: add sam9x7
  dt-bindings: mfd: syscon: add microchip's sam9x7 sfr
  dt-bindings: atmel-ssc: add microchip,sam9x7-ssc
  dt-bindings: serial: atmel,at91-usart: add compatible for sam9x7.
  dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x7 compatible
  ARM: at91: pm: add support for sam9x7 SoC family
  ARM: at91: pm: add sam9x7 SoC init config
  ARM: at91: add support in SoC driver for new sam9x7
  dt-bindings: clocks: atmel,at91sam9x5-sckc: add sam9x7
  dt-bindings: clocks: atmel,at91rm9200-pmc: add sam9x7 clock controller
  clk: at91: clk-sam9x60-pll: re-factor to support individual core freq
    outputs
  clk: at91: sam9x7: add support for HW PLL freq dividers
  clk: at91: sama7g5: move mux table macros to header file
  dt-bindings: clock: at91: Allow PLLs to be exported and referenced in
    DT
  clk: at91: sam9x7: add sam9x7 pmc driver
  dt-bindings: interrupt-controller: Add support for sam9x7 aic
  power: reset: at91-poweroff: lookup for proper pmc dt node for sam9x7
  power: reset: at91-reset: add reset support for sam9x7 SoC
  power: reset: at91-reset: add sdhwc support for sam9x7 SoC
  dt-bindings: reset: atmel,at91sam9260-reset: add sam9x7
  dt-bindings: power: reset: atmel,sama5d2-shdwc: add sam9x7
  ARM: at91: Kconfig: add config flag for SAM9X7 SoC
  ARM: configs: at91: enable config flags for sam9x7 SoC family
  ARM: dts: at91: sam9x7: add device tree for SoC
  dt-bindings: arm: add sam9x75 curiosity board
  ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board

 .../devicetree/bindings/arm/atmel-at91.yaml   |    6 +
 .../devicetree/bindings/arm/atmel-sysregs.txt |    6 +-
 .../bindings/clock/atmel,at91rm9200-pmc.yaml  |    2 +
 .../bindings/clock/atmel,at91sam9x5-sckc.yaml |    4 +-
 .../interrupt-controller/atmel,aic.yaml       |    1 +
 .../devicetree/bindings/mfd/syscon.yaml       |  188 +--
 .../devicetree/bindings/misc/atmel-ssc.txt    |    1 +
 .../power/reset/atmel,sama5d2-shdwc.yaml      |    3 +
 .../reset/atmel,at91sam9260-reset.yaml        |    4 +
 .../bindings/serial/atmel,at91-usart.yaml     |    9 +-
 .../soc/microchip/atmel,at91rm9200-tcb.yaml   |   20 +-
 arch/arm/boot/dts/microchip/Makefile          |    3 +
 .../dts/microchip/at91-sam9x75_curiosity.dts  |  312 +++++
 arch/arm/boot/dts/microchip/sam9x7.dtsi       | 1226 +++++++++++++++++
 arch/arm/configs/at91_dt_defconfig            |    1 +
 arch/arm/mach-at91/Kconfig                    |   22 +-
 arch/arm/mach-at91/Makefile                   |    1 +
 arch/arm/mach-at91/generic.h                  |    2 +
 arch/arm/mach-at91/pm.c                       |   29 +
 arch/arm/mach-at91/sam9x7.c                   |   33 +
 drivers/clk/at91/Makefile                     |    1 +
 drivers/clk/at91/clk-sam9x60-pll.c            |   42 +-
 drivers/clk/at91/pmc.h                        |   18 +
 drivers/clk/at91/sam9x60.c                    |    7 +
 drivers/clk/at91/sam9x7.c                     |  946 +++++++++++++
 drivers/clk/at91/sama7g5.c                    |   42 +-
 drivers/irqchip/irq-atmel-aic5.c              |   10 +
 drivers/power/reset/Kconfig                   |    4 +-
 drivers/power/reset/at91-sama5d2_shdwc.c      |    1 +
 drivers/soc/atmel/soc.c                       |   23 +
 drivers/soc/atmel/soc.h                       |    9 +
 include/dt-bindings/clock/at91.h              |    4 +
 32 files changed, 2840 insertions(+), 140 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
 create mode 100644 arch/arm/boot/dts/microchip/sam9x7.dtsi
 create mode 100644 arch/arm/mach-at91/sam9x7.c
 create mode 100644 drivers/clk/at91/sam9x7.c

-- 
2.25.1


