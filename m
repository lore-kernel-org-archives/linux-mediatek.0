Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8946C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RqJ9M+vBiRIQTW4bKSTUxpGTbeg6wh3ICQI1R6i0GdU=; b=vHi5PG6Vd6KuXx
	VbgqzV9JuvrRjWhUltdgVUfToP5kk0ZhAlSEShDun7z+eg2JdyWOltJUQ1UHBgfrT1IHJNaeFNxOP
	tI8Av6aGmAZBJ8WGIjuMCwfOd55idSHO36sw1WtEE7Gma3TBc2O5KyMONjo9jwByzfk1BPFXh0MBP
	YVWBUjEaEyjcxr7AsdXMBCI981bpmqRMM8DL1rMVeaOJaznz6OMY+Rzcn+N2T6yhH9pSONx9sn+wC
	MUqsOa457VKS5vxKAJBTbFCMPKZ8mXpOBFwa2J1QwU80ycsqnkTxt7+IWm5qheD2g7WiWD8kVBQIR
	6GIV1Xs+s+cJMm/BIFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNbi-00APhC-E5; Mon, 17 Oct 2022 10:44:30 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZJ-00ANAK-IP; Mon, 17 Oct 2022 10:42:05 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout1.routing.net (Postfix) with ESMTP id 448863FC7E;
	Mon, 17 Oct 2022 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666003314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RqJ9M+vBiRIQTW4bKSTUxpGTbeg6wh3ICQI1R6i0GdU=;
	b=jzvRgAUYn7yrV189wQL6kxur+Iz26HEgIh0B+NKnNwMaSp2aQr3pRHjXiLlDyYDIZ6wGni
	UzOin78/Fv8XJ3yo0eyYw71wsWZ1E0u2azu05p71bZzn016CJXUgRki50T+fNFxlGzqLwP
	itb77151ZVYO9IleLryWtUGc15pyx2s=
Received: from frank-G5.. (fttx-pool-217.61.154.127.bambit.de [217.61.154.127])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 6150B403ED;
	Mon, 17 Oct 2022 10:41:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 00/12] Add BananaPi R3
Date: Mon, 17 Oct 2022 12:41:29 +0200
Message-Id: <20221017104141.7338-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 0d90a5ee-935f-4cb3-851d-912040432dc3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_034201_794661_599E69A1 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

- Add mt7986 i2c support
  https://patchwork.kernel.org/project/linux-mediatek/cover/20221009101631.82380-1-linux@fw-web.de/
- Add mmc-support for mt7986
  https://patchwork.kernel.org/project/linux-mediatek/cover/20221008165627.114782-1-linux@fw-web.de/
- hwrng: mediatek: add mt7986 support
  https://patchwork.kernel.org/project/linux-mediatek/patch/20221008164553.113260-1-linux@fw-web.de/
- pinctrl: mediatek: allow configuring uart rx/tx and rts/cts separately
  https://patchwork.kernel.org/project/linux-mediatek/patch/20221008164807.113590-1-linux@fw-web.de/

Frank Wunderlich (6):
  dt-bindings: phy: mediatek,tphy: add support for mt7986
  dt-bindings: PCI: mediatek-gen3: add support for mt7986
  dt-bindings: usb: mtk-xhci: add support for mt7986
  dt-bindings: arm64: dts: mediatek: add compatible for bananapi r3
  arm64: dts: mt7986: add i2c node
  arm64: dts: mt7986: add Bananapi R3

Sam Shih (6):
  arm64: dts: mt7986: harmonize device node order
  arm64: dts: mt7986: add spi related device nodes
  arm64: dts: mt7986: add pcie related device nodes
  arm64: dts: mt7986: add usb related device nodes
  arm64: dts: mt7986: add crypto related device nodes
  arm64: dts: mt7986: add mmc related device nodes

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 .../bindings/pci/mediatek-pcie-gen3.yaml      |   1 +
 .../bindings/phy/mediatek,tphy.yaml           |   1 +
 .../bindings/usb/mediatek,mtk-xhci.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt7986a-bananapi-bpi-r3-emmc.dts |  34 +
 .../mediatek/mt7986a-bananapi-bpi-r3-sd.dts   |  29 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi | 609 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  | 263 ++++++--
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 183 ++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |  83 ++-
 11 files changed, 1152 insertions(+), 55 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi

-- 
2.34.1


