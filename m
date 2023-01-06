Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357A3C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VlzESD4AMk00u+w+7MAyrnnGklzWyK8ppGmGNp+UR0Y=; b=nxFfRdfnwMBzgX
	EFTSNMOLyilKIh/e8fAZB2QCvglr4cUi63KDgbWZSeQg72EPyaknUTR1nXzx1L0dB5TQu+asOxwDs
	e9EHrNJfLggVUEOG9NcvQhPO2pZ+xxXhKEmh+1GMB4ABYDMj2kAlO2W/xKFEVD+8rA+574N4YXDTl
	9pD7ZzBkXTQ7tguV6Cv6EPdxDWv/1LHA1GHun5Qf82+Q/ZjUFtlVCJE3+1wx120TyEywY+joYKk0f
	rRsZxoVhVJQAkmSeugYr1VOHKcw7TEpNOCrF2x5SNlQX/vrj8g+21nOohzEgwotGtMiM9LOTzMKHx
	vr++Vh8ilnkeAldE0SQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDoex-009GmQ-SB; Fri, 06 Jan 2023 15:29:31 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDoeX-009GOS-1r; Fri, 06 Jan 2023 15:29:06 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 4ECAD603D5;
	Fri,  6 Jan 2023 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1673018938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VlzESD4AMk00u+w+7MAyrnnGklzWyK8ppGmGNp+UR0Y=;
	b=iYOKjdIBw69DVeQTSxdvEfTa7z0YG38I7Ud2d/IR7ypZSET8zzgJzAupernvaoSNLmYa4x
	dy74jzsitVgCZLYhwVVSrQxgLosWCzdl0RqwV+1osYdy3N5ejdkyCsiNFecezcUo5ciYTC
	J3JrHT+WwEbdm/hBGjFjuZ8tev0hKM8=
Received: from frank-G5.. (fttx-pool-217.61.159.6.bambit.de [217.61.159.6])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 977C31226D4;
	Fri,  6 Jan 2023 15:28:57 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v9 0/5] Add BananaPi R3
Date: Fri,  6 Jan 2023 16:28:40 +0100
Message-Id: <20230106152845.88717-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_072905_294144_B632538B 
X-CRM114-Status: GOOD (  14.87  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Series adds some Nodes to mt7986 devicetree and the BananaPi R3

This version is rebased on linux 6.2-rc1 and i dropped already applied
Patches from v7.

i had run full dtbs-check but i end up with some strange warnings in
ethernet-node that should not come up as phy-handle and sfp/managed
properties are already defined. These errors also came up for mt7986a-rfb.

phy-handle made optional
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n265

property sfp/managed (which is included for mac subnode in yaml above):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/ethernet-controller.yaml#n137

changes:
v9:
- drop model string override in sd-dtso

v8:
- drop model string override in emmc-dtso
- drop cs-gpios from spi-nodes
- add interrupt-settings for mt7531 switch

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

Frank Wunderlich (2):
  dt-bindings: phy: mediatek,tphy: add support for mt7986
  arm64: dts: mt7986: add Bananapi R3

Sam Shih (3):
  arm64: dts: mt7986: add usb related device nodes
  arm64: dts: mt7986: add mmc related device nodes
  arm64: dts: mt7986: add pcie related device nodes

 .../bindings/phy/mediatek,tphy.yaml           |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   5 +
 .../mt7986a-bananapi-bpi-r3-emmc.dtso         |  29 ++
 .../mt7986a-bananapi-bpi-r3-nand.dtso         |  55 +++
 .../mediatek/mt7986a-bananapi-bpi-r3-nor.dtso |  68 +++
 .../mediatek/mt7986a-bananapi-bpi-r3-sd.dtso  |  23 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 450 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  | 120 +++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 122 +++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |   8 +
 10 files changed, 881 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts

-- 
2.34.1


