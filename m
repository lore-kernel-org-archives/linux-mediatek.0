Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3949DEB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jgqpuM0U/+n1THvXDHH+do3sOEHcg4nAH1f0/m6O2+4=; b=Scs1S3Jn/41unFLULcIqIxG0B1
	LyFYbFsqCFkZUGodY9SFRqdr7JYuaQFkvv/IrMAfXIB3GN3mjysSI6hHCjVf9UqauoknjklLXkHTl
	67ZWakqcJd87IE0rcJcu6c84E0lnEyYgHGDU7iqtNR2D21L6qmaH6f0j+4WFxwrowQXZVjXZ2y4+4
	YfiMrpkp4lP8VVzDGfTZpxZM8DDYQQvgOSM1QbixEgJwDpZD99U1F34u/X7fJEGRw1f4fxvngQfMe
	0BMlwI4YmJOOa7X3U1Eqq65xN3ujLzQmF56px6neVi1kQTRGTV49FCDejVz3yGz3BzQHx4u6OFSo9
	ypm2GVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMxKc-00F7Ux-0Y;
	Fri, 21 Jul 2023 21:06:34 +0000
Received: from mx2.hosting.skole.hr ([161.53.165.186] helo=mx.skole.hr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMxKL-00F7Ov-0o;
	Fri, 21 Jul 2023 21:06:21 +0000
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id BF357880C0;
	Fri, 21 Jul 2023 23:06:11 +0200 (CEST)
From: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	afaerber@suse.com,
	=?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: [PATCH 00/10] Initial Marvell PXA1908 support
Date: Fri, 21 Jul 2023 22:37:42 +0200
Message-ID: <20230721210042.21535-1-duje.mihanovic@skole.hr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_140617_470765_203D5DC9 
X-CRM114-Status: GOOD (  13.97  )
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

Hello,

This series adds initial support for the Marvell PXA1908 SoC and
"samsung,coreprimevelte", a smartphone using the SoC.

USB works and the phone can boot a rootfs from an SD card, but there are
some warnings in the dmesg:

During SMP initialization:
[    0.006519] CPU features: SANITY CHECK: Unexpected variation in SYS_CNTFRQ_EL0. Boot CPU: 0x000000018cba80, CPU1: 0x00000000000000
[    0.006542] CPU features: Unsupported CPU feature variation detected.
[    0.006589] CPU1: Booted secondary processor 0x0000000001 [0x410fd032]
[    0.010710] Detected VIPT I-cache on CPU2
[    0.010716] CPU features: SANITY CHECK: Unexpected variation in SYS_CNTFRQ_EL0. Boot CPU: 0x000000018cba80, CPU2: 0x00000000000000
[    0.010758] CPU2: Booted secondary processor 0x0000000002 [0x410fd032]
[    0.014849] Detected VIPT I-cache on CPU3
[    0.014855] CPU features: SANITY CHECK: Unexpected variation in SYS_CNTFRQ_EL0. Boot CPU: 0x000000018cba80, CPU3: 0x00000000000000
[    0.014895] CPU3: Booted secondary processor 0x0000000003 [0x410fd032]

SMMU probing fails:
[    0.101798] arm-smmu c0010000.iommu: probing hardware configuration...
[    0.101809] arm-smmu c0010000.iommu: SMMUv1 with:
[    0.101816] arm-smmu c0010000.iommu: 	no translation support!

On Samsung's PXA1908 phones, the bootloader does not start the ARM
system timer, and my temporary solution (which isn't present in this
series) was to put the code for starting the timer in the clock driver.
Would this hack be accepted upstream in the form of a platform or
clocksource driver such as drivers/clocksource/timer-mediatek-cpux.c?

A 3.14 based Marvell tree is available on GitHub
acorn-marvell/brillo_pxa_kernel, and a Samsung one on GitHub
CoderCharmander/g361f-kernel.

Andreas Färber attempted to upstream support for this SoC in 2017:
https://lore.kernel.org/lkml/20170222022929.10540-1-afaerber@suse.de/

Duje Mihanović (10):
  tty: serial: 8250: Define earlycon for mrvl,mmp-uart
  gpio: pxa: use dynamic allocation of base
  gpio: pxa: make pxa_gpio_has_pinctrl return false for MMP_GPIO
  clk: mmp: Add Marvell PXA1908 clock driver
  dt-bindings: clock: Add Marvell PXA1908 clock bindings
  dt-bindings: clock: Add documentation for Marvell PXA1908
  arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
  arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
  dt-bindings: marvell: Document PXA1908 SoC
  MAINTAINERS: add myself as Marvell PXA1908 maintainer

 .../bindings/arm/marvell/marvell,pxa1908.yaml |  33 ++
 .../bindings/clock/marvell,pxa1908.yaml       |  53 +++
 MAINTAINERS                                   |  10 +
 arch/arm64/Kconfig.platforms                  |  11 +
 arch/arm64/boot/dts/marvell/Makefile          |   1 +
 .../pxa1908-samsung-coreprimevelte.dts        | 321 ++++++++++++++++++
 arch/arm64/boot/dts/marvell/pxa1908.dtsi      | 298 ++++++++++++++++
 drivers/clk/mmp/Makefile                      |   2 +-
 drivers/clk/mmp/clk-of-pxa1908.c              | 282 +++++++++++++++
 drivers/gpio/gpio-pxa.c                       |   2 +
 drivers/tty/serial/8250/8250_pxa.c            |   1 +
 include/dt-bindings/clock/marvell,pxa1908.h   |  93 +++++
 12 files changed, 1106 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,pxa1908.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
 create mode 100644 arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts
 create mode 100644 arch/arm64/boot/dts/marvell/pxa1908.dtsi
 create mode 100644 drivers/clk/mmp/clk-of-pxa1908.c
 create mode 100644 include/dt-bindings/clock/marvell,pxa1908.h

-- 
2.41.0



