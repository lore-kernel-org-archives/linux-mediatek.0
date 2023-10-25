Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332ABC0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 09:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8eODRSxQvH6l/Czcg0/j2iz+S1VUweybADz6qXDQINA=; b=RaTSudIvx0MNGF2b2wVm5iTy2x
	0A+S7VDA9HBKaiI1CPil4BddN28xbNw3ANqUi8Z/8x4VViTgbTyUSdccdYdsQs3UlNRkSGFNuE4JR
	7MlPgh0OCho4Pw0nXUK1JAs54WrZ2TvAPJLp4kXkTk5wohwkenE6hY2AsNabFtGDVLKvEhd9Uj3Bu
	KHA33SLQ9nBEu0PvX+8FMkWJb1nCikpvWQsiDHHGlgREggAPSiD89PVsKrgZPFIEcHcw/H9NeIgoG
	NE6LVANnaM/TAQw8TDPTsjV0pg4WNcj4K/bBctvH8FawiGG/sIRcLKqL/0FsFtQJGkT81tJDuR6ol
	a7aPul7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaLV-00BqOo-0M;
	Wed, 25 Oct 2023 09:38:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaLR-00BqMB-1b;
	Wed, 25 Oct 2023 09:38:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C8D5966071C9;
	Wed, 25 Oct 2023 10:38:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698226709;
	bh=ZrAdIgYw0YdPdTX7tItDF5DGAV3QupHqDDWzmNm1c+c=;
	h=From:To:Cc:Subject:Date:From;
	b=EhfPYNC3T4Ms23Bb5R5utO6DTa+B1SQAOTbXoR8CVO3FmUBTc3XdlwGhViTjyvpVT
	 QpMUqAvl77CKwtxzmoNF2QBw+YY/EkHnerpKFbJ9Uzrcd1gsExqWDPytB1EcdvqKmu
	 nFNZXOzldsNOuzweFKFPHt5gXDzWnikp+G4dF0GkQ8I7lv0ByFzNiKlY2l9lrhvtC2
	 m0H806Mds/D3QD6Dg1unFBQZ2FkJPf0NJnYoYseVoVPPfI162tAghcfJ6n7LxiOASI
	 vxZJ6nBT8j6mJ/S5QiFeAoNGTwcO9B2uaYugUFePyc/CmuK8A23U+pO9CJlTej0/H7
	 wZfymARrR2Jeg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: hsinyi@chromium.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	erin.lo@mediatek.com,
	eddie.huang@mediatek.com,
	pihsun@chromium.org,
	fparent@baylibre.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	michael.kao@mediatek.com,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/8] MediaTek ARM64 devicetrees fixes and improvements
Date: Wed, 25 Oct 2023 11:38:08 +0200
Message-ID: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_023833_729274_627C86A9 
X-CRM114-Status: UNSURE (   9.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series performs some cleanup and adds some fixes to the MediaTek
ARM64 devicetrees.

In short:
 - Changes all instances of interrupt-parent = <...>; interrupts = <...>
   to one single interrupts-extended = <...> line
 - Moves interrupts from MT6358 dtsi to board files (as those are board
   specific, not PMIC specific!)
 - Fixes various devicetree warnings

AngeloGioacchino Del Regno (8):
  arm64: dts: mediatek: mt8183: Use interrupts-extended where possible
  arm64: dts: mediatek: mt8173: Use interrupts-extended where possible
  arm64: dts: mediatek: Use interrupts-extended where possible
  arm64: dts: mediatek: Move MT6358 PMIC interrupts to MT8183 boards
  arm64: dts: mediatek: mt8183: Fix unit address for scp reserved memory
  arm64: dts: mediatek: mt8183-evb: Fix unit_address_vs_reg warning on
    ntc
  arm64: dts: mediatek: mt8173-evb: Fix regulator-fixed node names
  arm64: dts: mediatek: mt8183: Move thermal-zones to the root node

 arch/arm64/boot/dts/mediatek/mt6358.dtsi      |   2 -
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |   3 +-
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  |   3 +-
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   9 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  24 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |   7 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   8 +-
 .../mediatek/mt8183-kukui-audio-da7219.dtsi   |   3 +-
 .../mediatek/mt8183-kukui-audio-ts3a227e.dtsi |   3 +-
 .../mediatek/mt8183-kukui-jacuzzi-damu.dts    |   3 +-
 .../mt8183-kukui-jacuzzi-fennel-sku1.dts      |   3 +-
 .../mt8183-kukui-jacuzzi-fennel-sku6.dts      |   3 +-
 .../mt8183-kukui-jacuzzi-fennel-sku7.dts      |   3 +-
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |   3 +-
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     |   3 +-
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |   3 +-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  12 +-
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |   4 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 242 +++++++++---------
 .../dts/mediatek/mt8395-genio-1200-evk.dts    |   6 +-
 20 files changed, 165 insertions(+), 182 deletions(-)

-- 
2.42.0


