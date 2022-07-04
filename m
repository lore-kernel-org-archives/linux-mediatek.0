Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DCAC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AJHhgoeiAOWeYhV5SmKkReQIIqJw3VMbxK6MAJnq1/A=; b=O1cqY52DYFxoGuEyw3nIGvLVir
	22CpIZirF2kB2x9W8Q43tgnQCzZ4ldmMqejDcdyJdtIuNJGZisLn/k+BICE9sLKYTBLgeG+IrBrnC
	D5Tcez9BcSYKuYlOXFzGiEGmsBMlzZ9W6ZHTswG4sjX7Si+zbxKITpnD4FDAs6IZDKQrrZz/iILCW
	rDWowj4wK7WfR8xqRt5XyWpg6P7NPMeopD8nBE2xIGpUo+QfaivAJMUDc/2uidFb/J01moFIYOcnG
	jbqBFKtcBSX0AZ25S+cugH1tCnEbQkxx8h91o1Tl5gupCLBN/w8cPqTDROvO9QceQZM86ADPrnlXN
	4Wg0gsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5X-006pue-6s; Mon, 04 Jul 2022 10:13:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J59-006pbY-1Q; Mon, 04 Jul 2022 10:13:32 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 66AEF66017F7;
	Mon,  4 Jul 2022 11:13:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656929608;
	bh=HW6iJNpEd9bIAvKSJ5WiS1laYwYlZBUsBTzloi+AeCk=;
	h=From:To:Cc:Subject:Date:From;
	b=JeUh14jJtuzk8vMhxL1qPUCQRSyDEDuAfYWWNJ+JUfEkPwhGujQa6ZEcOAgcmChMj
	 sF/C3VFNwUmUI5wmpZavlmNrGauWmsC7nZVRwKEPPdK7AGJumqoCGB/z3CEEwk5Yhb
	 UOBWNVyOQ2OvwVp22PCTU7rI81cKoce64f42G/soZGHskID9S41YODFYn0KEoRSlMa
	 1IXzRAatF/XTub8UITdEpQyQvx8nlTy+WPA/dRX1gmzyvM3Gn6Z7HY7FB5fSJimadm
	 zNLRytmjOeRuzmmPWhGPB/bbNy0LomnX0q7AzLBfG2hUsfiU86Rf1mGJ4+wIwz1lfH
	 lHsxaw5IGIG4g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v2 00/11] MT8195 Chromebooks devicetrees - Google Tomato
Date: Mon,  4 Jul 2022 12:13:10 +0200
Message-Id: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031331_443460_7A632124 
X-CRM114-Status: GOOD (  11.69  )
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

This is the first part for upstreaming Google's Cherry Tomato
Chromebook (Acer Chromebook Spin 513): in this series, we introduce
the devicetrees for the four revisions of this Chromebook and enable
every controller and feature that can be added as per the current
state of the main SoC devicetrees (mt8195.dtsi) and its PMIC
devicetree (mt6359.dtsi).

More parts will come as soon as more support will be added by
MediaTek in the mt8195 devicetree.

Note: This series will introduce a dtbs_check warning about a failure
      to match compatible for 'mediatek,mt6359': that's expected, as
      this is defined in devicetree/bindings/mfd/mt6397.txt (so there
      is no schema, yet).

Changes in v2:
 - Added changes from Nìcolas' review
 - Changed board 'model' from 'MediaTek Tomato' to 'Acer Tomato'

This series depends on the following fixes:
[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220630110453.186526-1-angelogioacchino.delregno@collabora.com/
[2]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220630122334.216903-1-angelogioacchino.delregno@collabora.com/
[3]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220630131543.225554-1-angelogioacchino.delregno@collabora.com/


And it depends on Nìcolas' dt-bindings patch for the [01/11] to
apply cleanly (this is done to keep mediatek.yaml ordered):
[4]: https://lore.kernel.org/all/20220629155956.1138955-2-nfraprado@collabora.com/


AngeloGioacchino Del Regno (11):
  dt-bindings: arm: mediatek: Add MT8195 Cherry Tomato Chromebooks
  arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato
  arm64: dts: mediatek: cherry: Add platform regulators layout and
    config
  arm64: dts: mediatek: cherry: Assign interrupt line to MT6359 PMIC
  arm64: dts: mediatek: cherry: Add support for internal eMMC storage
  arm64: dts: mediatek: cherry: Document gpios and add default pin
    config
  arm64: dts: mediatek: cherry: Enable I2C and SPI controllers
  arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers
  arm64: dts: mediatek: cherry: Enable MT6360 sub-pmic on I2C7
  arm64: dts: mediatek: cherry: Enable support for the SPI NOR flash
  arm64: dts: mediatek: cherry: Add I2C-HID touchscreen on I2C4

 .../devicetree/bindings/arm/mediatek.yaml     |  13 +
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  15 +
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  35 +
 .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  36 +
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 702 ++++++++++++++++++
 6 files changed, 804 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi

-- 
2.35.1


