Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946A2C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 19:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tIrruqxgGUKR45e8ULgdGbdEj9XfIBvvNexGoXFlZDI=; b=G1uLlqaEsFIr3J
	WFVuyQYB3GkkzYHwGXvw6pGmobuvzgTUImGdkvnB0Wx13o2kPvMAsE7cD7cTW1Sw072PL2p86hJ2f
	FJv2Wet13u4yxzd6GJ2wc/pyN8uTqM1/BabgOsGzsz1lKXOZG54MRVz3YkHMZxcpDOnNcgYOlFuau
	bJN/Pzzgxk+/2RU0FiECWFutwVdu9UCgNoBYA6Ii6+7aukGdjN7RZGDkMawMnxg4mRcHHIOCge3UV
	ggMEZ15II+plydFg5NIjF+0rI/+Nhbqptdro4srCbRBzeM+H+l3SJob45SrWP3eYX2NtFkeKPihYW
	0uPRWPwE//CGBzPiQDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6sV-007WBU-5I; Fri, 18 Nov 2022 19:18:19 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6cQ-007Oda-Md; Fri, 18 Nov 2022 19:01:46 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 1B946400E3;
	Fri, 18 Nov 2022 19:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1668798096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tIrruqxgGUKR45e8ULgdGbdEj9XfIBvvNexGoXFlZDI=;
	b=WYQyKBQoonzUkxFQmgY+Sn5nCFRUz1ruinJbU+uYHqnmcYeMlz9KJqL6lVAo4pZ1JAIKIN
	Up8k7qnjLuprSa8icZXDNxAzm3CFs687jbAauINQwbMZMqd5uIMrh19PvWoeE0Bpf5gUrD
	VDdSaqmIpKMtwWNkOWE/rpVpfmH+7zc=
Received: from frank-G5.. (fttx-pool-80.245.77.125.bambit.de [80.245.77.125])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id B5A5C1226BC;
	Fri, 18 Nov 2022 19:01:35 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v6 00/11] Add BananaPi R3
Date: Fri, 18 Nov 2022 20:01:15 +0100
Message-Id: <20221118190126.100895-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_110143_112789_287AF7DC 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Series adds some Nodes to mt7986 devicetree and the BananaPi R3

This version is rebased on Matthias' DTS64 next Branch from 2022/11/11.

i included sams series for mt7986 DTS with small changes
https://patchwork.kernel.org/project/linux-mediatek/cover/20220427124741.18245->

6.2 will support dtso extension for dt overlays:

"kbuild: Allow DTB overlays to built from .dtso named source files"
https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=363547d2191cbc32ca954ba75d72908712398ff2

There is some discussion about inclusion of dt-overlays and if it is
better to support mmc also by these:

https://patchwork.kernel.org/comment/25092116/
https://patchwork.kernel.org/comment/25085681/

i had run full dtbs-check but i end up with some strange warnings in
ethernet-node that should not come up as phy-handle and sfp/managed
properties are already defined.

phy-handle made optional
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n265

property sfp/managed (which is included for mac subnode in yaml above):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/ethernet-controller.yaml#n137

changes:
v6:
- dropped regulators from usb-patch as suggested by chunfeng yun
- moved 3v3 regulator to mmc-patch as it is needed for emmc to work
  rfbs were tested by sam shih, r3 by me
- dropped RB from AngeloGioacchino from mmc-patch due to this change
- fixed links in coverletter which were broken in v5
- i hope this series is sent without errors now (my mailprovider limited
  mails last 2 times while sending part 10)

v5:
- changed usb ranges/reg/unit-adress
- added reviewd-by's except usb-part due to changes

v4:
- dropped RFC prefix
- rebase on matthias' mtk dts-next (for 6.2) branch
- added author information to overlays
- fixed sfp binding error
- added fix for moving wed_pcie node
- readded missing compatible patches

v3:
- changed mmc pull-ups
- added patch for board binding (sent separately before)
- added pcie node in mt7986 (not yet again in r3)
- added dt overlays

Frank Wunderlich (7):
  arm64: dts: mt7986: move wed_pcie node
  dt-bindings: phy: mediatek,tphy: add support for mt7986
  dt-bindings: usb: mtk-xhci: add support for mt7986
  dt-bindings: PCI: mediatek-gen3: add SoC based clock config
  dt-bindings: PCI: mediatek-gen3: add support for mt7986
  arm64: dts: mt7986: add Bananapi R3
  arm64: dts: mt7986: add BPI-R3 nand/nor overlays

Sam Shih (4):
  arm64: dts: mt7986: add spi related device nodes
  arm64: dts: mt7986: add usb related device nodes
  arm64: dts: mt7986: add mmc related device nodes
  arm64: dts: mt7986: add pcie related device nodes

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  64 ++-
 .../bindings/phy/mediatek,tphy.yaml           |   1 +
 .../bindings/usb/mediatek,mtk-xhci.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +
 .../mediatek/mt7986a-bananapi-bpi-r3-emmc.dts |  31 ++
 .../mediatek/mt7986a-bananapi-bpi-r3-nand.dts |  55 +++
 .../mediatek/mt7986a-bananapi-bpi-r3-nor.dts  |  69 +++
 .../mediatek/mt7986a-bananapi-bpi-r3-sd.dts   |  25 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi | 446 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  | 155 ++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 162 ++++++-
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |  43 ++
 12 files changed, 1038 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi

-- 
2.34.1


