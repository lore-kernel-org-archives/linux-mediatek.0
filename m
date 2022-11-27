Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0482DC46467
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 11:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k349OVoE48gwODCSz008WxiHQQGH0IaZlGYvTDJxc5E=; b=ro7a4MhVsKL8ac
	wQHn50Ggq+ugZ7dPjMandTK8AhslONv41YsHZ5xZXpAW5eCj5pmsBt2Ue01z5Y66cZ2hSFWtbcawt
	xOwR5SVufzBF17vOkgIoY8JN6tgVCjTgAD6atNOtkDVeyODCj1Aob7OG29N6tKd7EiOt454YNtG1i
	kUZK6VRfpsJwj/Q/nW5sgz3LWKOl3F4AXmcasuaMe0RFFEAVViVVf8kah00d5m5liUweY+pjQ+vBN
	ZFxEeE+3KXu07ySS4+TUBrOOO0+Wce4ppYwjX5GyXqtgSQudXhoVxlPD5I90wgM63IzY8aPF7R+vw
	H3gE66wXgk+RS7CMu5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozG4K-00B62H-VZ; Sun, 27 Nov 2022 11:43:33 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozG2o-00B5JG-6s; Sun, 27 Nov 2022 11:42:01 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 5FD2C6049F;
	Sun, 27 Nov 2022 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1669549313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k349OVoE48gwODCSz008WxiHQQGH0IaZlGYvTDJxc5E=;
	b=RZy6qm4+4DH3SDLcK8KXNxCGuU2HeGprztTqRY5gnNFCoC+NR1HiQB8e9mNFbfIKS+EKdl
	c2cihu7sJIYT1zEWLapvwtP9mLxHoovLiV2xdFoDVKyyGvLqQZpQu3mjg4UmgNsFvklL8k
	UjLeJA55dnqVlpUbBv4bK4Vo5wCoxTY=
Received: from frank-G5.. (fttx-pool-217.61.157.144.bambit.de [217.61.157.144])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 0DE951226D4;
	Sun, 27 Nov 2022 11:41:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [next v7 0/8] Add BananaPi R3
Date: Sun, 27 Nov 2022 12:41:34 +0100
Message-Id: <20221127114142.156573-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_034158_583342_A351FE99 
X-CRM114-Status: GOOD (  14.60  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Series adds some Nodes to mt7986 devicetree and the BananaPi R3

This version is rebased on linux next from 2022/11/27.

i included sams series for mt7986 DTS with small changes
https://patchwork.kernel.org/project/linux-mediatek/cover/20220427124741.18245->

i had run full dtbs-check but i end up with some strange warnings in
ethernet-node that should not come up as phy-handle and sfp/managed
properties are already defined. These errors also came up for mt7986a-rfb.

phy-handle made optional
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n265

property sfp/managed (which is included for mac subnode in yaml above):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/ethernet-controller.yaml#n137

changes:
v7:
- rebase on next so dropped already applied patches
- squashed overlay-patch into the bpi-r3 base support
- moved regulators from mmc-dts to common dtsi
- changed dtsi to dts (as board base dtb) and mmc-dts to overlays
- renamed overlays to dtso
- removed angelos RB because of changes in bpi-r3 patch

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

Frank Wunderlich (5):
  dt-bindings: phy: mediatek,tphy: add support for mt7986
  dt-bindings: usb: mtk-xhci: add support for mt7986
  dt-bindings: PCI: mediatek-gen3: add SoC based clock config
  dt-bindings: PCI: mediatek-gen3: add support for mt7986
  arm64: dts: mt7986: add Bananapi R3

Sam Shih (3):
  arm64: dts: mt7986: add usb related device nodes
  arm64: dts: mt7986: add mmc related device nodes
  arm64: dts: mt7986: add pcie related device nodes

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  64 ++-
 .../bindings/phy/mediatek,tphy.yaml           |   1 +
 .../bindings/usb/mediatek,mtk-xhci.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   5 +
 .../mt7986a-bananapi-bpi-r3-emmc.dtso         |  30 ++
 .../mt7986a-bananapi-bpi-r3-nand.dtso         |  55 +++
 .../mediatek/mt7986a-bananapi-bpi-r3-nor.dtso |  68 +++
 .../mediatek/mt7986a-bananapi-bpi-r3-sd.dtso  |  24 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 448 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  | 120 +++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 122 +++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |   8 +
 12 files changed, 934 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts

-- 
2.34.1


