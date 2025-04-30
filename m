Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A411DC369D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Apr 2025 13:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/36ujSLIAfT1/bczMYnnhA2ecNfiw2Pfe9nP6xpk+jc=; b=uTvujh3Z97zHOmtka170cXGRTR
	ksmF1pnYxkKoqt3kAINrgeWaHdHaCWLmIqp38c75+6NICxP4G8FMtAF5vrySyblNPVCsw83nbpQWd
	/73H+0CUi9M3IYWynSEnv578DzbjP9s1fVwkR0w5EwZwiIGeUHWNmAnJ4Z1j7LPK0IjlpT6xLZLG4
	QLixFb+/ylLEp2vtNdY82Rm+30oHmwT2IJZJm7lMZv2U2LNQzfChH7tp/8zglobVG3y9mZfZSox4L
	Dp0wnB2YhI2Wrt6HtD+W78LeVKWK3LRFa/ukWgAoGH0JdeMzxw6cvMooqDvB7eX/7YcTxaayB3E4y
	atj1hzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7cA-0000000D1E9-1xuJ;
	Wed, 30 Apr 2025 13:36:42 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7aO-0000000D0zM-2S4J
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Apr 2025 13:34:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F4EB90C65;
	Wed, 30 Apr 2025 15:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746020087; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=/36ujSLIAfT1/bczMYnnhA2ecNfiw2Pfe9nP6xpk+jc=;
	b=FAqiWrIAIiODWGrPVUG5Vg9b+hG2ncDybQkKTcP2PcNzfpDKszMTRDNFNDqPVAmNrQG+XN
	IkfckDQOA7DFa0+HN33OxV/dA6/KLDmh71aNPWkV4OpJ9HVKh9iFF+VUEaErL1nr0f/Ygo
	ZWc/Rfy+kmWB/Mucvsr1vJcSPnzJLdIt87KbZQFlycctPGQtLIiredNBia3mDabaC1u16a
	IrpE4RfimtdY3WJlkzbxtX//dM8Q+n5Zs0G/OJ+5HCnf9Pd7uM0bLgyhj2guiouNQRS7NJ
	j7Y/cw72OlfZ4Z8bkpysxPqy/nUD6ATouCwOltQ74ppqVHApjODu63fSYsSqIg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr
Subject: [PATCH v4 0/7] Add EcoNet EN751221 MIPS platform support
Date: Wed, 30 Apr 2025 13:34:26 +0000
Message-Id: <20250430133433.22222-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_063452_998430_0E76203A 
X-CRM114-Status: GOOD (  11.16  )
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

EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
processors. They are found in xDSL and xPON modems, and contain PCM
(VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.

The EcoNet MIPS SoCs are divided broadly into two families, the
EN751221 family based on the 34Kc, and the EN751627 family based on
the 1004Kc. Individual SoCs within a family are very similar, only
with different peripherals.

This patchset adds basic "boots to a console" support for the EN751221
family and adds SmartFiber XP8421-B, a low cost commercially available
board that is useful for testing and development.

Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
peripherals, and for historical reasons Airoha chips are sometimes
referred to with the EN75xx prefix. However this is a different
platform because Airoha chips are ARM based.

This patchset is against mips-next.

v3 -> v4
* Rebase to 3b3704261e851e25983860e4c352f1f73786f4ab
* Omit already accepted patches (thanks guys!):
  - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-2-cjd@cjdns.fr/
  - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-3-cjd@cjdns.fr/
  - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-4-cjd@cjdns.fr/

v2 -> v3
* econet,en751221-timer.yaml -> Improve code style
* vendor-prefixes.yaml -> Correct alphabetic order
* en751221.dtsi
  - interrupt-controller code style
  - serial: Explain reason for clock-frequency = <1843200>
* v3->v3 diff provided for reference
  - https://gist.github.com/cjdelisle/21c9f0cd225f499bdff3c574c7f185f2
* CC: linux-mediatek@lists.infradead.org who may be interested.

v1 -> v2
* Codestyle
  - Apply codestyle from "The tip tree handbook" and recommendations
  - Remove "_rai" and "_m" symbol suffixes which are not standard
* irq-econet-en751221.c
  - Use cleanup.h _guard() and _free()
  - Separate irq_domain_ops from irq_chip, eliminating econet_intc struct
  - Remove irqsave in econet_wreg, irqs are already disabled in mask/unmask
  - Add explainatory comments
  - Refactor shadow logic for clarity, e.g. INTC_NO_SHADOW -> NOT_PERCPU
  - Improve error handling in case of invalid DTS
* econet,timer-hpt.yaml
  - Rename to econet,timer-en751221.yaml
  - Impose rule: "reg" must have 1 item on EN751221 and 2 on EN751627
* timer-econet-hpt.c
  - Rename to timer-econet-en751221.c to follow naming scheme from DT
* econet,en751221-intc.yaml
  - Fix validation error from required: interrupt-parent
  - shadow-interrupts -> switch to uint32-matrix for list of pairs
* MAINTAINERS -> Fixed accidental F: MAINTAINERS
* Replace "test image" with device SmartFiber-XP8421-B
* Restructure arch/mips/econet/Kconfig per arch/mips/ralink example
* v1->v2 diff is offered for reference:
  - https://gist.github.com/cjdelisle/bb3acab78b5f70dcdfe5dd6338293efe


Caleb James DeLisle (7):
  dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
  clocksource/drivers: Add EcoNet Timer HPT driver
  dt-bindings: mips: Add EcoNet platform binding
  mips: Add EcoNet MIPS platform support
  dt-bindings: vendor-prefixes: Add SmartFiber
  mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board
  MAINTAINERS: Add entry for newly added EcoNet platform.

 .../devicetree/bindings/mips/econet.yaml      |  26 +++
 .../bindings/timer/econet,en751221-timer.yaml |  80 +++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  12 +
 arch/mips/Kbuild.platforms                    |   1 +
 arch/mips/Kconfig                             |  25 ++
 arch/mips/boot/compressed/uart-16550.c        |   5 +
 arch/mips/boot/dts/Makefile                   |   1 +
 arch/mips/boot/dts/econet/Makefile            |   2 +
 arch/mips/boot/dts/econet/en751221.dtsi       |  67 ++++++
 .../econet/en751221_smartfiber_xp8421-b.dts   |  19 ++
 arch/mips/econet/Kconfig                      |  48 ++++
 arch/mips/econet/Makefile                     |   2 +
 arch/mips/econet/Platform                     |   5 +
 arch/mips/econet/init.c                       |  78 +++++++
 drivers/clocksource/Kconfig                   |   8 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-econet-en751221.c   | 216 ++++++++++++++++++
 18 files changed, 598 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/econet.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
 create mode 100644 arch/mips/boot/dts/econet/Makefile
 create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
 create mode 100644 arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
 create mode 100644 arch/mips/econet/Kconfig
 create mode 100644 arch/mips/econet/Makefile
 create mode 100644 arch/mips/econet/Platform
 create mode 100644 arch/mips/econet/init.c
 create mode 100644 drivers/clocksource/timer-econet-en751221.c

-- 
2.39.5


