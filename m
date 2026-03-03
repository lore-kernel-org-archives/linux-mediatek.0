Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808F7EDEBE6
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 19:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YeYcHOU6O1PcxMMN13wZpxAP+6Z+ixxDNPaLXhkt61M=; b=mD0ZS3a022BzLhRKbQ5BgZrvU/
	N+ObqUF0ssf+wAjdXF7qh4Zhyy9i2iFgj9Bdm8AKQPlK60T2AGX5Fc0gl8bLDxlkFi1/P0ebzXeMh
	moHaGsX4zMJl66XmcJX0HMx1tK8AoXKg1ONX/tZH1WRHadz0dtn5AWJ4Nv9vF7XjFAwsq7UGW0Qj9
	4uw+pXgjv5gVLj4NcTltRzG/W0xAHC/GPSZLJ166ODyxSBZFjhtrbWcP7FxXpeTDXxkvxiAf9qmJ1
	NTIgJ8/b2zWsEMgJvjULNm6AULNNXQCd9ZetqRmixllgD+A0WZtBEeSu94y4Rx5URdmafWQYwd7YF
	sFpD3KxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxV8M-0000000FkbI-1seX;
	Tue, 03 Mar 2026 19:10:18 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxV8J-0000000FkaZ-3Cq6;
	Tue, 03 Mar 2026 19:10:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B8F120D516;
	Tue,  3 Mar 2026 20:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772565011; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=YeYcHOU6O1PcxMMN13wZpxAP+6Z+ixxDNPaLXhkt61M=;
	b=Oy4kMsIKUpN1ifXgxMapAw9eWZUzib2dteeWem3sYhWyzFArKtUyf3n1hZsmH9IaTWEhV+
	qPdtEvGKXnQOI+lDMeRoep+jsXV9Ya/XcNOY1r/bcjAbzjLiMQ8/KlJE7CmOVdDNVUOT8h
	cDB0BJvRwLk3aTYOlu4wJaAc1s2L8z8qa0IzCemII+0ANfi56E8OqGT6ddYuocq6vNGHGU
	uInyDrfuf93mq1wycS0x2/dHLdx751rIU1qQ03Yn08tWvIFAqIS5MP66vvn1tIs1QfPjX4
	/1Yl4egPmk/AwaZJOJXUrulS8+zzWDOfb+m7Id0lV8qZzUHSHIHhIFyE26hc/g==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjd@cjdns.fr,
	tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nbd@nbd.name,
	ansuelsmth@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/8] mips: econet: Add clk/reset and PCIe support
Date: Tue,  3 Mar 2026 19:09:40 +0000
Message-Id: <20260303190948.694783-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_111016_001577_14BD1365 
X-CRM114-Status: GOOD (  10.35  )
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

Add clock/reset and PCIe support to EcoNet EN751221 and related SoCs.
This builds on the Airoha EN7523 clock driver and the Mediatek PCIe driver.

Patch 6 is upstreaming of Ahmed Naseef's work on EcoNet PCIe, which was
developed to support the EN7528, but which works equally on the EN751221.

There is also a workaround in patch 7 to gracefully handle PCI hardware
which does not advertize a bridge window and instead always reads zero.

Caleb James DeLisle (8):
  dt-bindings: clock, reset: Add econet EN751221 bindings
  clk: airoha: Add econet EN751221 clock/reset support to en7523-scu
  dt-bindings: phy: Document PCIe PHY in EcoNet EN751221 and EN7528
  phy: econet: Add PCIe PHY driver for EcoNet EN751221 and EN7528 SoCs.
  dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
  PCI: mediatek: Add support for EcoNet EN7528 SoC
  PCI: Skip bridge window reads when window is not supported
  mips: dts: Add PCIe to EcoNet EN751221

 .../bindings/clock/airoha,en7523-scu.yaml     |  19 +-
 .../mips/econet,en751221-chip-scu.yaml        |  41 +++
 .../bindings/pci/mediatek-pcie.yaml           |   1 +
 .../phy/econet,en751221-pcie-phy.yaml         |  57 +++++
 MAINTAINERS                                   |  10 +
 arch/mips/boot/dts/econet/en751221.dtsi       | 114 +++++++++
 .../econet/en751221_smartfiber_xp8421-b.dts   |  21 ++
 arch/mips/econet/Kconfig                      |   2 +
 drivers/clk/Kconfig                           |   6 +-
 drivers/clk/clk-en7523.c                      | 236 +++++++++++++++++-
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 107 ++++++++
 drivers/pci/probe.c                           |   6 +
 drivers/phy/Kconfig                           |  12 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-econet-pcie.c                 | 180 +++++++++++++
 .../dt-bindings/clock/econet,en751221-scu.h   |  15 ++
 .../dt-bindings/reset/econet,en751221-scu.h   |  49 ++++
 18 files changed, 869 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
 create mode 100644 drivers/phy/phy-econet-pcie.c
 create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
 create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h


base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
-- 
2.39.5


