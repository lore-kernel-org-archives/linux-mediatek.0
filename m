Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3E9C3ABCB
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PF2ufsspbUyVXcyj52+f3BIvslTKbWkBdC0SAWy4kPQ=; b=OjDSfUGF124r8/Vfi+8QeId8lD
	4rFz2WqOLE4FP2A5Y81h/Z4GmWgOO4cJU4/Bx0Oss65iWB6+5hUbnxod1u0HI8Ndq0Ki82BY+szN+
	2MtTcHnhedcdJQKxV68/0wyh8phLksIFKW+Ao7QUY+Fv9K0G1XEgMEYFQHftYWHLl9rn9whmfIHXv
	PeGc6hPG1YIcPOMM3MY0nqXKKy3G21zAtbfg7z+r66CBO7+hrtMFMrna3OA5WlsuyR/HJpLMdK4RA
	7mS70pnCN98cpWyBZJU4kJKqFUWG3aAUApsJ1Pt6QnFM4W/mQp1rc7NPt5CBbmutFDqsa++8Xn94x
	EX4vRSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfF5-0000000Felb-0Wdq;
	Wed, 07 May 2025 13:55:23 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf5P-0000000Fbz3-1nKZ
	for linux-mediatek@lists.infradead.org;
	Wed, 07 May 2025 13:45:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34A91DBBB9;
	Wed,  7 May 2025 15:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746625518; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=PF2ufsspbUyVXcyj52+f3BIvslTKbWkBdC0SAWy4kPQ=;
	b=L1CM2kf9iVEkWz5MAbbCF21OykDRYZF39ogC6VUkflOl4FY3iD5PggXE7eu3Qw1HiL6jGe
	NxoWoqzjvwidjj9H8RvsMDHZwVfIIr9WKLN5Vy+8xbf7Wk3JvtDGlepVBtKqARlsbOJAOS
	SPrMw5u+w7484QVvR/EqGdsEYmyq8X+odj8hMYqCgpLH7djQnOyOP6751CXAPdKAdlFRHK
	3pCPOmE74bgrcciaEpt0Fxep+N73x4vETTPF9jC10xj894KjTeKpw+MUzcnnZEJwQj/qYd
	tXBglMgBaJPkTbDARIKkxwGhzw7PJ/AfZ74QpGmi/D1rO1T1hsGVVkUQtYzKXA==
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
Subject: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
Date: Wed,  7 May 2025 13:44:53 +0000
Message-Id: <20250507134500.390547-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_064523_845485_BC9D3F94 
X-CRM114-Status: GOOD (  11.03  )
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

v4 -> v5
* 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
  * Improve explanation of HPT timer in changelog
  * Move pr_info to pr_debug per recommendation
  * Remove pointless debug on spurious interrupt
  * Small code-style change

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


