Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1C9C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jouKxGzkoDAwjwpevHSQL+PA+O4LZ0rs1vo78ngTc8g=; b=n17cDnUiHKL1Ff
	r0Y4sTZtkE7KE3t1RVT+NKHcaesQJ5nA323OWbmKzliqOSU6zXfObqPtJ69zHYqHrG2j+ImwkESx/
	qMH5fQdg1E9gKapyjB7FWZmTgnpJkaAD6zhtQL0qe25kpQKMfF7ETLxmtFmDc3zfWihgUOXVJ1hbk
	Ap2Dxh+Zf3cdagIoJ6lfqBmGrN3Uvfu5kf25tQNWSaLn9D4YQCJBYGmZ/sRAXBj/SnjB/7vFO2XNV
	iI8VHNiLdbUBQ5EjemfOjtSQPrfUlgL+mvhzd+3wM02dbKZASD46b7+Xq11LOM7D8F8DmCQOBTxdZ
	nNFoKavy3QJe+iOadPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orbOx-007lVI-H3; Sun, 06 Nov 2022 08:53:11 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orbMe-007k9t-4Q; Sun, 06 Nov 2022 08:50:50 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 816EA10077E;
	Sun,  6 Nov 2022 08:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667724639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jouKxGzkoDAwjwpevHSQL+PA+O4LZ0rs1vo78ngTc8g=;
	b=X2dXBdRsyVymoyfhv6COtytYsE2chnDv3yqk/Y3eVlS7SzXybFLUWRGm99sFbMVC49EVKM
	nvPa0c7YfZAW9uFzOfSDXCk8ok6eHRljXr4wqBWqA688/qmC0RyuaMoxQsan4WMUZ2uOrm
	hPhcU4b78VXP6IlU+qv3Wg/Kc4hh5V8=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id C20D836054A;
	Sun,  6 Nov 2022 08:50:38 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v3 00/11] Add BananaPi R3
Date: Sun,  6 Nov 2022 09:50:23 +0100
Message-Id: <20221106085034.12582-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f6d739d7-642e-4964-be09-097122ad3e8d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_015048_384344_9DEB7B9A 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Series adds some Nodes to mt7986 devicetree and the BananaPi R3

i included sams series for mt7986 DTS with small changes
https://patchwork.kernel.org/project/linux-mediatek/cover/20220427124741.18245-1-sam.shih@mediatek.com/

this series need these Patches:

i2c-support:
https://patchwork.kernel.org/project/linux-mediatek/cover/20221009101631.82380-1-linux@fw-web.de/

mmc bindings:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=688675

update pinctrl-bindings:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=692462

hwrng and pinctrl (uart splitting) are already applied to next

i had run full dtbs-check but i end up with some strange warnings in
ethernet-node that should not come up as phy-handle and sfp/managed
properties are already defined.

phy-handle made optional
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n265

property sfp/managed (which is included for mac subnode in yaml above):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/ethernet-controller.yaml#n137

changes:
v3:
- changed mmc pull-ups
- added patch for board binding (sent separately before)
- added pcie node in mt7986 (not yet again in r3)
- added dt overlays

Frank Wunderlich (5):
  arm64: dts: mt7986: add i2c node
  dt-bindings: arm64: dts: mediatek: add compatible for bananapi r3
  arm64: dts: mt7986: add Bananapi R3
  arm64: dts: mt7986: add PCIe nodes to BananaPi-R3
  arm64: dts: mt7986: add BPI-R3 nand/nor overlays

Sam Shih (6):
  arm64: dts: mt7986: harmonize device node order
  arm64: dts: mt7986: add spi related device nodes
  arm64: dts: mt7986: add usb related device nodes
  arm64: dts: mt7986: add crypto related device nodes
  arm64: dts: mt7986: add mmc related device nodes
  arm64: dts: mt7986: add pcie related device nodes

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +
 .../mediatek/mt7986a-bananapi-bpi-r3-emmc.dts |  31 ++
 .../mediatek/mt7986a-bananapi-bpi-r3-nand.dts |  53 ++
 .../mediatek/mt7986a-bananapi-bpi-r3-nor.dts  |  67 +++
 .../mediatek/mt7986a-bananapi-bpi-r3-sd.dts   |  25 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi | 458 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  | 264 ++++++++--
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 179 +++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |  83 +++-
 10 files changed, 1110 insertions(+), 55 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi

-- 
2.34.1


