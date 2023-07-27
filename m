Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7F4C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bzuTh1NVs4GWRrmVfFpsJRGIUEzZM0pTAQIqXVT60KU=; b=PsnqI8BKVj24S68vrP1VWZ/uTt
	HyBXMpvicIhW6F/dckrKl2tRFCMLSP2CsXHffrqmAp/mMl3klLHYvg//SQFK28xixSfUmWQzCaGRR
	MjSAAd4k71WkFnpYTi6PqPhInBKUl3Qn0cGDnBwuy3KChtEMKEWzW+STxZHRDusQeGmFieZu+VxFA
	oA4xa94uBB6wuSC9Ogc5a2jsobomJ8EN+NuxPT6t1vijossGs7AkZr+IffP8gEq3RtenM2YitBO2F
	dQcFWLHObiP2JvDMdjxkEuNNP+6gLiQXjTxhGoC4kvmmdn0fxXolG6HmBA07tZCiDpkBYXlYayxZO
	+u25TgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3su-00GasH-2R;
	Thu, 27 Jul 2023 16:30:40 +0000
Received: from mx2.hosting.skole.hr ([161.53.165.186] helo=mx.skole.hr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3sf-00GaQz-24;
	Thu, 27 Jul 2023 16:30:27 +0000
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 7145383693;
	Thu, 27 Jul 2023 18:30:11 +0200 (CEST)
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
Subject: [PATCH v2 0/9] Initial Marvell PXA1908 support
Date: Thu, 27 Jul 2023 18:28:58 +0200
Message-ID: <20230727162909.6031-1-duje.mihanovic@skole.hr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_093025_894323_13548628 
X-CRM114-Status: GOOD (  17.48  )
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

v1 -> v2:
- Remove earlycon patch as it's been merged into tty-next
- Address maintainer comments:
  - Clarify GPIO regressions on older PXA platforms
  - Add Fixes tag to commit disabling GPIO pinctrl calls for this SoC
  - Add missing includes to clock driver
  - Clock driver uses HZ_PER_MHZ, u32_fract and GENMASK
  - Dual license clock bindings
  - Change clock IDs to decimal
  - Fix underscores in dt node names
  - Move chosen node to top of board dts
  - Clean up documentation
  - Reorder commits
  - Drop pxa,rev-id
- Rename muic-i2c to i2c-muic
- Reword some commits
- Move framebuffer node to chosen
- Add aliases for mmc nodes
- Rebase on v6.5-rc3

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
[    0.101816] arm-smmu c0010000.iommu:         no translation support!

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

Andy Shevchenko (1):
  clk: mmp: Switch to use struct u32_fract instead of custom one

Duje Mihanović (8):
  gpio: pxa: disable pinctrl calls for MMP_GPIO
  gpio: pxa: use dynamic allocation of base
  dt-bindings: clock: Add Marvell PXA1908 clock bindings
  clk: mmp: Add Marvell PXA1908 clock driver
  dt-bindings: marvell: Document PXA1908 SoC
  arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
  arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
  MAINTAINERS: add myself as Marvell PXA1908 maintainer

 .../bindings/arm/marvell/marvell,pxa1908.yaml |  22 ++
 .../bindings/clock/marvell,pxa1908.yaml       |  47 +++
 MAINTAINERS                                   |  10 +
 arch/arm64/Kconfig.platforms                  |  11 +
 arch/arm64/boot/dts/marvell/Makefile          |   3 +
 .../pxa1908-samsung-coreprimevelte.dts        | 329 ++++++++++++++++++
 arch/arm64/boot/dts/marvell/pxa1908.dtsi      | 292 ++++++++++++++++
 drivers/clk/mmp/Makefile                      |   2 +-
 drivers/clk/mmp/clk-frac.c                    |  57 ++-
 drivers/clk/mmp/clk-mmp2.c                    |   6 +-
 drivers/clk/mmp/clk-of-mmp2.c                 |  26 +-
 drivers/clk/mmp/clk-of-pxa168.c               |   4 +-
 drivers/clk/mmp/clk-of-pxa1908.c              | 286 +++++++++++++++
 drivers/clk/mmp/clk-of-pxa1928.c              |   6 +-
 drivers/clk/mmp/clk-of-pxa910.c               |   4 +-
 drivers/clk/mmp/clk-pxa168.c                  |   4 +-
 drivers/clk/mmp/clk-pxa910.c                  |   4 +-
 drivers/clk/mmp/clk.h                         |  10 +-
 drivers/gpio/gpio-pxa.c                       |   2 +
 include/dt-bindings/clock/marvell,pxa1908.h   |  93 +++++
 20 files changed, 1154 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,pxa1908.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
 create mode 100644 arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts
 create mode 100644 arch/arm64/boot/dts/marvell/pxa1908.dtsi
 create mode 100644 drivers/clk/mmp/clk-of-pxa1908.c
 create mode 100644 include/dt-bindings/clock/marvell,pxa1908.h

-- 
2.41.0



