Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D402C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 14:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f2kD6uLUahWCwetY0srjgHVMcFiecwwZJBtlcQNY29k=; b=mEi686bl/H4CIZ
	LKhKQzTKgtvroWF/Vp5JORkqCOXcq0eR6idA8Q1myoZv5e1iknzTc3lEGdtcqRZdCo/QGYaKwcjjD
	hrUm+MRpCitk23eQLpT5gy4qBS2WDWN4w5i26zZCIjVergDKBTPHZXHgQVC9aPAs7/upDYUX+xx15
	9+DPaFkNz0XJIt9XCaLDVIMNsd4MSbK+tdwSvQ/XwzA7eTcPgwndWOOsa6OTEL4iEGK3NeGe67apj
	r9plg3RRHVeDOzNhHd8faa6XSdqcgiIrkqlTX46MIhbIXOXsluoCi9g0A0AGK78vXYa62lCi5yc0J
	dTPeHqUzpCvLqQN/Kqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBYh-006jHn-VI; Sun, 30 Jan 2022 14:52:03 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBYB-006izN-39; Sun, 30 Jan 2022 14:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4NFVqgQRdzCN0U19lihZZT8Qa41dAmts6V4HJLP1xhs=; b=On+Ojvzv0yvAwciqWvX0acvNDS
 PRjn4xhIFJ/tz2rz6wUpnMxwtsnwliS6BrktRIgGMmb4kxlG4frHCdjiDhUpUez8DMr4XK5oCj/FE
 DN9icfbuLrrJg/jUAw+HZ6CuNSvd3L8wTadsmdeEXUfstHtQkMgzS2L4I+2hAwVjNry0=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de
 ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nEBY4-0002if-PY; Sun, 30 Jan 2022 15:51:24 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, john@phrozen.org
Subject: [PATCH v9 00/13] Add support for Airoha EN7523 SoC
Date: Sun, 30 Jan 2022 15:51:03 +0100
Message-Id: <20220130145116.88406-1-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_065131_337919_521407B9 
X-CRM114-Status: GOOD (  11.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset adds support for the Airoha EN7523 SoC, intended primarily
for xPON/xDSL routers.

Felix Fietkau (4):
  clk: en7523: Add clock driver for Airoha EN7523 SoC
  ARM: dts: add clock support for Airoha EN7523
  PCI: mediatek: Allow building for ARCH_AIROHA
  ARM: dts: Add PCIe support for Airoha EN7523

John Crispin (9):
  dt-bindings: Add vendor prefix for Airoha
  dt-bindings: arm: airoha: Add binding for EN7523 SoC and EVB
  ARM: Add basic support for Airoha EN7523 SoC
  ARM: multi_v7_defconfig: Add support for Airoha EN7523 SoC
  dt-bindings: Add en7523-scu device tree binding documentation
  dt-bindings: PCI: Add support for Airoha EN7532
  dt-bindings: arm: airoha: Add binding for Airoha GPIO controller
  gpio: Add support for Airoha EN7523 GPIO controller
  ARM: dts: add GPIO support for Airoha EN7523

 .../devicetree/bindings/arm/airoha.yaml       |  28 ++
 .../bindings/clock/airoha,en7523-scu.yaml     |  58 +++
 .../bindings/gpio/airoha,en7523-gpio.yaml     |  67 ++++
 .../devicetree/bindings/pci/mediatek-pcie.txt |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/Kconfig                              |  12 +
 arch/arm/Makefile                             |   1 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/en7523-evb.dts              |  43 +++
 arch/arm/boot/dts/en7523.dtsi                 | 205 ++++++++++
 arch/arm/configs/multi_v7_defconfig           |   1 +
 arch/arm/mach-airoha/Makefile                 |   2 +
 arch/arm/mach-airoha/airoha.c                 |  16 +
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-en7523.c                      | 350 ++++++++++++++++++
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-en7523.c                    | 137 +++++++
 drivers/pci/controller/Kconfig                |   2 +-
 include/dt-bindings/clock/en7523-clk.h        |  17 +
 21 files changed, 964 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/airoha.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
 create mode 100644 arch/arm/boot/dts/en7523-evb.dts
 create mode 100644 arch/arm/boot/dts/en7523.dtsi
 create mode 100644 arch/arm/mach-airoha/Makefile
 create mode 100644 arch/arm/mach-airoha/airoha.c
 create mode 100644 drivers/clk/clk-en7523.c
 create mode 100644 drivers/gpio/gpio-en7523.c
 create mode 100644 include/dt-bindings/clock/en7523-clk.h

-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
