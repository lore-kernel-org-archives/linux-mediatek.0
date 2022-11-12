Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36FDC43219
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Nov 2022 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8h7HnuaIbJzS+1bSDsJciWFXEu36biz2822mlX20rAg=; b=Lx1niXo6ataHJz
	WiKjKuvMTWZRJH8RFFZ5ve6LmFeLWyEHYG+2c/F8Q3iGvs20jrUy4B6NRqef+sx9BDPsnm8gFz6ws
	CWdyf4q4I/AGqzqnUxxYfNSy3HZPGYkMbGkoPMnJXM8hQFTRWMLF1htzTtQ2Gs92gucS6RoZEAquW
	SIo1rNg4W5K8ctq3ggbFYOyiSkDu8m/Y9hRt20pcaT2ESO0lQxNkuDTtFdTEhEw2UV6Y74rL4VUGN
	tDBKyl2LPynINHkeAPTGa686JcQkGdoj1ywF9jCZve3Xcg2GjDr+Tm9f0inL/Y542Gt/1oojtS9xM
	BTnKw6iJtvYygMUmwK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otmdg-004ZKX-UO; Sat, 12 Nov 2022 09:17:24 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otmcI-004YRl-2n; Sat, 12 Nov 2022 09:16:01 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 10353604CC;
	Sat, 12 Nov 2022 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1668244534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8h7HnuaIbJzS+1bSDsJciWFXEu36biz2822mlX20rAg=;
	b=UPzPkiLVH4L2++lfu6zi7oUxA268Vr2ju1R+3f2m/ygukvVgXaWrE6m+bkH9cR0mcI+NIj
	lnzjGcQHWRCJpioXY7EQkMBP+iuU+JihfHO5m48yVXDCbsOt+/N4mHMuj8+zfvQbczNNHl
	yL747nbEtwLFdA+2JgzENhWT57d19Es=
Received: from frank-G5.. (fttx-pool-157.180.227.41.bambit.de [157.180.227.41])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 931A4360217;
	Sat, 12 Nov 2022 09:15:31 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 00/11] Add BananaPi R3
Date: Sat, 12 Nov 2022 10:15:07 +0100
Message-Id: <20221112091518.7846-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 0a530238-cec0-442a-b8de-6e8f0e31b058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_011558_427651_9B64D6AF 
X-CRM114-Status: GOOD (  10.86  )
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
https://patchwork.kernel.org/project/linux-mediatek/cover/20220427124741.18245-1-sam.shih@mediatek.com/

i had run full dtbs-check but i end up with some strange warnings in
ethernet-node that should not come up as phy-handle and sfp/managed
properties are already defined.

phy-handle made optional
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n265

property sfp/managed (which is included for mac subnode in yaml above):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/ethernet-controller.yaml#n137

changes:
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
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi | 458 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  | 166 +++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 162 ++++++-
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |  63 +++
 12 files changed, 1081 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi

-- 
2.34.1


