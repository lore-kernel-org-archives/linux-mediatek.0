Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BF2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 21:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X8KCNMo7456JenzPO4xejxKfNGF/yAGCZRWqxzN9f1U=; b=X7kxhGhY3ChX1x
	zLq8IH72AVXi7lLvVTJ/yFDKx0JekMmr04NBBDN5EozilmxzwgUlqzpUlaeoapB3X6KLUX534h7Xi
	G3RFgZlSJ15Fmw/dudzkm1B7gId8/VpHxTtLfk6GapzZPAlodXVeHznQk8ulJkHdClqBIAYw4hJTP
	iNfpZnpeND6oyXmdYQTIsCq6iRWC7TnsRh7myqC9snwgWun/QyYgQKBOi1/K8XSnPOACOSqYwGgOW
	68WKK2+i4pMje59M0bCn+PbzdegXVq5bQEucUbakkDQXoR3lg868iaBeSdhMtdVIkL5UQgLiYxicn
	2QtzI7QGGhQkC6iSUyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzQ49-004OyW-F8; Mon, 20 Dec 2021 21:19:29 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzQ3n-004OpW-65; Mon, 20 Dec 2021 21:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rnWHr3gk1JUaY3GWwzxnEJtJfoCNUo6RN7dwBSSq+kU=; b=WyTApfjGR6Dg6jG28YaYUkb45o
 4ngN2cZ0qA9xj0nvn8P+67Yx0Co+QJcgZKl6I9Oojb22uOyp5K6YFLYj2wxzehrCseN8cVL7I1Z02
 +inEU3IBMz0fFjYpt57wsLPyIgo1gM+CnT1nomWJPXq+TrQOmxhGEPyQ0LC7yRRJvcOY=;
Received: from p54ae911a.dip0.t-ipconnect.de ([84.174.145.26]
 helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mzQ3h-0000zo-7C; Mon, 20 Dec 2021 22:19:01 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: john@phrozen.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v8 00/14] Add support for Airoha EN7523 SoC
Date: Mon, 20 Dec 2021 22:18:40 +0100
Message-Id: <20211220211854.89452-1-nbd@nbd.name>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_131907_437476_FF1441A0 
X-CRM114-Status: GOOD (  11.19  )
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

John Crispin (10):
  dt-bindings: Add vendor prefix for Airoha
  dt-bindings: arm: airoha: Add binding for EN7523 SoC and EVB
  ARM: dts: Add basic support for Airoha EN7523
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
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/en7523-evb.dts              |  43 +++
 arch/arm/boot/dts/en7523.dtsi                 | 202 ++++++++++
 arch/arm/configs/multi_v7_defconfig           |   1 +
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-en7523.c                      | 350 ++++++++++++++++++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-en7523.c                    | 134 +++++++
 drivers/pci/controller/Kconfig                |   2 +-
 include/dt-bindings/clock/en7523-clk.h        |  17 +
 18 files changed, 938 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/airoha.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
 create mode 100644 arch/arm/boot/dts/en7523-evb.dts
 create mode 100644 arch/arm/boot/dts/en7523.dtsi
 create mode 100644 drivers/clk/clk-en7523.c
 create mode 100644 drivers/gpio/gpio-en7523.c
 create mode 100644 include/dt-bindings/clock/en7523-clk.h

-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
