Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD24DC83000
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jun 2025 09:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cg6t0GmzXyLQwVr+cFNcsHeCoMT3E75vS7FIvnaXPx0=; b=OfFDGbJQixyBGy
	MRCJs9pGp5EdvX68u1WQmMVkHldjrPiRAesgem9EHOZ6i6IS1p3Z7pgC+WHsH19CQwgfuDHw8V4pF
	fXao9oY21gobG2IVwOdyK4uzqc0hbIndU5/AvsjMzztdMPYZoOamkS+iIWLwMAbOrkFdaFIjeGmC1
	VtlcyP1W270TbPazMPmqUdSG6z4M1vXssWmsdGepmbKXPqlMYyEBUE7U/Vkj9ojze5zwnqr2LD/cr
	BeqNlTTvol8aBmq5PGomiccmqeolFHxe97CY1rmKWQunrwCe2FgGLZP8QJwJMl8K50whw0hbHS/dl
	dEhyVtThhj5gtXLZg9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRTM-0000000GaU8-14P0;
	Sat, 28 Jun 2025 09:03:44 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRTI-0000000GaSY-2nSY
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Jun 2025 09:03:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751101416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cg6t0GmzXyLQwVr+cFNcsHeCoMT3E75vS7FIvnaXPx0=;
	b=VvYviVDe590rbGNhEBRSisMwRdgi+FBV1JFAvLsSSi4xvgRuzZwsuLQMVwNaUuIC9d6ygw
	RVhbZjoqS4dRbBqtXCLZw1ROh8H7kVGNt92/Q8BGzqv+tVxdwX0LkvdjAdVXfq/T1W4C4N
	604tYVcNXe6PyxT0pfNSm2kWikDsYIM=
From: Frank Wunderlich <frank.wunderlich@linux.dev>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 00/15] further mt7988 devicetree work
Date: Sat, 28 Jun 2025 11:03:11 +0200
Message-ID: <20250628090330.57264-1-frank.wunderlich@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_020341_207564_765771FF 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-pm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series continues mt7988 devicetree work

- Extend cpu frequency scaling with CCI
- GPIO leds
- Basic network-support (ethernet controller + builtin switch + SFP Cages)

depencies (i hope this list is complete and latest patches/series linked):

support interrupt-names is optional again as i re-added the reserved IRQs
(they are not unusable as i thought and can allow features in future)
https://patchwork.kernel.org/project/netdevbpf/patch/20250619132125.78368-2-linux@fw-web.de/

needs change in mtk ethernet driver for the sram to be read from separate node:
https://patchwork.kernel.org/project/netdevbpf/patch/566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org/

for SFP-Function (macs currently disabled):

PCS clearance which is a 1.5 year discussion currently ongoing

Daniel asked netdev for a way 2 go:
https://lore.kernel.org/netdev/aEwfME3dYisQtdCj@pidgin.makrotopia.org/

e.g. something like this (one of):
* https://patchwork.kernel.org/project/netdevbpf/patch/20250610233134.3588011-4-sean.anderson@linux.dev/ (v6)
* https://patchwork.kernel.org/project/netdevbpf/patch/20250511201250.3789083-4-ansuelsmth@gmail.com/ (v4)
* https://patchwork.kernel.org/project/netdevbpf/patch/ba4e359584a6b3bc4b3470822c42186d5b0856f9.1721910728.git.daniel@makrotopia.org/

full usxgmii driver:
https://patchwork.kernel.org/project/netdevbpf/patch/07845ec900ba41ff992875dce12c622277592c32.1702352117.git.daniel@makrotopia.org/

first PCS-discussion is here:
https://patchwork.kernel.org/project/netdevbpf/patch/8aa905080bdb6760875d62cb3b2b41258837f80e.1702352117.git.daniel@makrotopia.org/
some more here:
https://lore.kernel.org/netdev/20250511201250.3789083-4-ansuelsmth@gmail.com/

and then dts nodes for sgmiisys+usxgmii+2g5 firmware

when above depencies are solved the mac1/2 can be enabled and 2.5G phy/SFP slots will work.

changes:
v6:
binding:
- split out the interrupt-names into separate patch
- update irq(name) min count to 4
- move interrupt-names up
- add sram-property
- drop second reg entry and minitems as there is only 1 item left

dts:
- fix whitespace-errors for pdma irqs (spaces vs. tabs)
- move sram from eth reg to own sram node (needs CONFIG_SRAM)

v5:
- add reserved irqs and change names
- update binding for 8 irqs with different names (rx,tx => fe1+fe2, rx-ringX => pdmaX)
(dropped Robs RB due to this change again, sorry)

v4:
net-binding:
- allow interrupt names and increase max interrupts to 6 because of RSS/LRO interrupts
  (dropped Robs RB due to this change)

dts-patches:
- add interrupts for RSS/LRO and interrupt-names for ethernet node
- eth-reg and clock whitespace-fix
- comment for fixed-link on gmac0
- drop phy-mode properties as suggested by andrew
- drop phy-connection-type on 2g5 board
- reorder some properties
- update 2g5 phy node
- unit-name dec instead of hex to match reg property
- move compatible before reg
- drop phy-mode

v3:
- dropped patches already applied (SPI+thermal)
- added soc specific cci compatible (new binding patch + changed dts)
- enable 2g5 phy because driver is now merged
- add patch for cleaning up unnecessary pins
- add patch for gpio-leds
- add patch for adding ethernet aliases

v2:
- change reg to list of items in eth binding
- changed mt7530 binding:
- unevaluatedProperties=false
- mediatek,pio subproperty
- from patternProperty to property
- board specific properties like led function and labels moved to bpi-r4 dtsi


Frank Wunderlich (15):
  dt-bindings: net: mediatek,net: update for mt7988
  dt-bindings: net: mediatek,net: allow irq names
  dt-bindings: net: mediatek,net: update for mt7988
  dt-bindings: net: dsa: mediatek,mt7530: add dsa-port definition for
    mt7988
  dt-bindings: net: dsa: mediatek,mt7530: add internal mdio bus
  dt-bindings: interconnect: add mt7988-cci compatible
  arm64: dts: mediatek: mt7988: add cci node
  arm64: dts: mediatek: mt7988: add basic ethernet-nodes
  arm64: dts: mediatek: mt7988: add switch node
  arm64: dts: mediatek: mt7988a-bpi-r4: add proc-supply for cci
  arm64: dts: mediatek: mt7988a-bpi-r4: drop unused pins
  arm64: dts: mediatek: mt7988a-bpi-r4: add gpio leds
  arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
  arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
  arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds

 .../bindings/interconnect/mediatek,cci.yaml   |  11 +-
 .../bindings/net/dsa/mediatek,mt7530.yaml     |  24 +-
 .../devicetree/bindings/net/mediatek,net.yaml |  47 ++-
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |  11 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  19 ++
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 198 ++++++-----
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 318 +++++++++++++++++-
 7 files changed, 529 insertions(+), 99 deletions(-)

-- 
2.43.0


