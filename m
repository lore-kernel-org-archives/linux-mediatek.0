Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC00C54754
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 18:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+JWgG7Xrb6kxHm/xBKBKplVRGDNZd7l9BWTCNftkPlo=; b=f4di+njl8bPZs6
	QbNDbN8+3gb4TPvGmDqnYOrip6gxPfhmQxNWgGqLvlMwoXl399EvdosfBihK73kzX+Z52+6xyxVj0
	6FlGH/Y9l/ErnXtKSvJshAE7AlCmSo9seoubZtsDG8Y1Z2oF3hKBd5rwugR6Q6lq4WJlCENhhzQ+y
	naze1MeeZZs/cHhAmH+b/Jo7YlufyYRCTH29KOmOXpluUaFqNOAl8cQ0gOgDbo2uoZWjveCqePcG6
	KmfX9znA7XClNK8+LULO0hwdlIRhdchsYKSfd0VC07gI+p/TyU4NJdAkPId+coI1S3u1me6nvbq8n
	1C97W5ZO12GTSsKaMcig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzhn-00000004Iky-20Ne;
	Fri, 16 May 2025 18:22:47 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzNh-00000004FKE-1ECc;
	Fri, 16 May 2025 18:02:05 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 0EC785FCB0;
	Fri, 16 May 2025 18:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747418515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+JWgG7Xrb6kxHm/xBKBKplVRGDNZd7l9BWTCNftkPlo=;
	b=IDpC/Q9nRdQRXK07+fcgEwZW75VKBwMst5E+e4D80srfYhdwyAFBS0ykeaQEhis9D5K/Mt
	rmlKzEUgu82nwjK21lyQeaGGsGmMjnq0r01km9cVo9aBAY6LLS3YRceQkPZavqqnicPigT
	9vp9f4y3eEFltnfyfLtyOoTmOkYIoQg=
Received: from frank-u24.. (fttx-pool-157.180.226.139.bambit.de [157.180.226.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id B069A1226D6;
	Fri, 16 May 2025 18:01:54 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 00/14] further mt7988 devicetree work
Date: Fri, 16 May 2025 20:01:30 +0200
Message-ID: <20250516180147.10416-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110201_658655_05DCD4D9 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series continues mt7988 devicetree work

- Add SPI with BPI-R4 nand to reach eMMC
- Add thermal protection (fan+cooling-points)
- Extend cpu frequency scaling with CCI
- Basic network-support (ethernet controller + builtin switch + SFP Cages)

depencies (i hope this list is complete and latest patches/series linked):

"Add Bananapi R4 variants and add xsphy" (reviewed, partially applied):
https://patchwork.kernel.org/project/linux-mediatek/list/?series=955733

"net: phy: mediatek: do not require syscon compatible for pio property":
https://patchwork.kernel.org/project/netdevbpf/patch/20250510174933.154589-1-linux@fw-web.de/
for phy led function (RFC not yet reviewed, resent without RFC)

for 2.5g phy function (currently disabled):
- net: ethernet: mtk_eth_soc: add support for MT7988 internal 2.5G PHY (already merged to 6.15-net-next)
- net: phy: mediatek: add driver for built-in 2.5G ethernet PHY on MT7988
  https://patchwork.kernel.org/project/netdevbpf/patch/20250516102327.2014531-3-SkyLake.Huang@mediatek.com/ (v4)

for SFP-Function (macs currently disabled):

PCS clearance which is a 1.5 year discussion currently ongoing

e.g. something like this (one of):
* https://patchwork.kernel.org/project/netdevbpf/patch/20250511201250.3789083-4-ansuelsmth@gmail.com/ (v4)
* https://patchwork.kernel.org/project/netdevbpf/patch/20250512161013.731955-4-sean.anderson@linux.dev/ (v4)
* https://patchwork.kernel.org/project/netdevbpf/patch/ba4e359584a6b3bc4b3470822c42186d5b0856f9.1721910728.git.daniel@makrotopia.org/

full usxgmii driver:
https://patchwork.kernel.org/project/netdevbpf/patch/07845ec900ba41ff992875dce12c622277592c32.1702352117.git.daniel@makrotopia.org/

first PCS-discussion is here:
https://patchwork.kernel.org/project/netdevbpf/patch/8aa905080bdb6760875d62cb3b2b41258837f80e.1702352117.git.daniel@makrotopia.org/

and then dts nodes for sgmiisys+usxgmii

when above depencies are solved the mac1/2 can be enabled and 2.5G phy/SFP slots will work.

changes:
v2:
  - change reg to list of items in eth binding
  - changed mt7530 binding:
    - unevaluatedProperties=false
    - mediatek,pio subproperty
    - from patternProperty to property
  - board specific properties like led function and labels moved to bpi-r4 dtsi

Frank Wunderlich (14):
  dt-bindings: net: mediatek,net: update for mt7988
  dt-bindings: net: dsa: mediatek,mt7530: add dsa-port definition for
    mt7988
  dt-bindings: net: dsa: mediatek,mt7530: add internal mdio bus
  arm64: dts: mediatek: mt7988: add spi controllers
  arm64: dts: mediatek: mt7988: move uart0 and spi1 pins to soc dtsi
  arm64: dts: mediatek: mt7988: add cci node
  arm64: dts: mediatek: mt7988: add phy calibration efuse subnodes
  arm64: dts: mediatek: mt7988: add basic ethernet-nodes
  arm64: dts: mediatek: mt7988: add switch node
  arm64: dts: mediatek: mt7988a-bpi-r4: Add fan and coolingmaps
  arm64: dts: mediatek: mt7988a-bpi-r4: configure spi-nodes
  arm64: dts: mediatek: mt7988a-bpi-r4: add proc-supply for cci
  arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
  arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  24 +-
 .../devicetree/bindings/net/mediatek,net.yaml |  10 +-
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |  11 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  18 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 158 ++++++-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 389 +++++++++++++++++-
 6 files changed, 590 insertions(+), 20 deletions(-)

-- 
2.43.0


