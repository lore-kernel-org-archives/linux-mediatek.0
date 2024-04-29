Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55643C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 23:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zo8D3lsFdEeXxAxf62RcXBt5LC5gx4r/O8NQQwJG9EY=; b=gBH2BVZlDog9zzzuLj0M+nMThy
	K+3sDnW5XQ8K0As84k6fzw3f8UP00XdJa94+68wC2i7YYZue1t0QLE5/H2ikUO33Q+3LJIrcIHHgg
	xjHuddSDrmiQo8WLbrmnKc9NA9E+iShWQHU10gwwMbB+v9jyx+ENfH7PbTkGnpUr1DPbdFnWhI4oi
	n+xNPDheA4d90J1SQF5W2fJiBr9G2W+5aVYWlJuqcYlWtk7MmFABEJJmUrtNsZwKX8YJYZnBv044A
	4VTc2sdAxZMe2bgESVWXPmwlYwEcGPjyxqZkySdxf27E/pgtwIX8kuqUSF7mj2r/jxoe7cdT9+ZqB
	BcVm1dQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ahM-00000004VVj-1CA9;
	Mon, 29 Apr 2024 23:46:16 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ahI-00000004VUv-3YBA;
	Mon, 29 Apr 2024 23:46:14 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s1ah2-000000003Ss-0jtq;
	Mon, 29 Apr 2024 23:45:56 +0000
Date: Tue, 30 Apr 2024 00:45:46 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Felix Fietkau <nbd@nbd.name>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: dsa: mt7530: fix impossible MDIO address and issue
 warning
Message-ID: <e615351aefba25e990215845e4812e6cb8153b28.1714433716.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_164612_914340_B999C7B1 
X-CRM114-Status: GOOD (  15.26  )
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

The MDIO address of the MT7530 and MT7531 switch ICs can be configured
using bootstrap pins. However, there are only 4 possible options for the
switch itself: 7, 15, 23 and 31 (ie. only 3 and 4 can be configured, bit
0~2 are always 111). Practically all boards known as of today use the
default setting which is to have the switch respond to address 31, while
the built-in switch PHYs respond to address 0~4 in this case.

However, even in MediaTek's SDK the address of the switch is wrongly
stated in the device trees as 0 (while in reality it is 31), so warn the
user about such broken device tree and make a good guess what was
actually intended.

This is imporant to not break compatibility with older Device Trees as
with commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of
switch from device tree") the address in device tree will be taken into
account. Doing so instead of assuming the switch is always at
address 31 which was previously hard-coded will obviously break things
for many existing downstream device trees as they contain the wrong
address (0) which previously didn't matter.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530-mdio.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index fa3ee85a99c1..119630fd9060 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -193,6 +193,19 @@ mt7530_probe(struct mdio_device *mdiodev)
 			return PTR_ERR(priv->io_pwr);
 	}
 
+	/* Only MDIO bus address 7, 15, 23 and 31 are valid options */
+	if (~(priv->mdiodev->addr & 0x7) & 0x7) {
+		/* If the address in DT must be wrong, make a good guess about
+		 * the most likely intention, and issue a warning.
+		 */
+		int correct_addr = ((((priv->mdiodev->addr - 7) & ~0x7) % 0x20) + 7) & 0x1f;
+
+		dev_warn(&mdiodev->dev,
+			 "impossible switch MDIO address in device tree: %d, assuming %d\n",
+			 priv->mdiodev->addr, correct_addr);
+		priv->mdiodev->addr = correct_addr;
+	}
+
 	regmap_config = devm_kzalloc(&mdiodev->dev, sizeof(*regmap_config),
 				     GFP_KERNEL);
 	if (!regmap_config)
-- 
2.44.0


