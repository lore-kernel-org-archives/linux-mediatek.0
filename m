Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F070C10F15
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 07:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJ2J40jA1KN0cspCubPzHwkddc78J0xLaRi01c02sNs=; b=PfKmCtbZALac2LdWrWIwBIWrEI
	O2T/ys2pbHYrghP2CIbYDRSdFi5vkqzyEOjTL4hyRSm6ep+H5JHu+5U9KwPWFBhtHnl+QPypxCCNu
	BFxX+I3RQRdGzC33/3cqZ4ExAUULWzgaU9DvviTl6rWggO/gUY3wOFLPZGuuTcmuI1j640YwPW6IE
	P6SJ23oN/00U488mRZUDerEtgBkh7i4fz4yVRwpEfrlHc8+oh09RNfkBa8+KCM5fuQtp3/AUEdV+A
	3La79zedZK6oHqIW/09JArGL6mRWIQqE1pxlEunBe29IcL6b1lIbFQTdoSS/APGGmHg79YPpFoYUI
	URYzxVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynvv-0000000COde-2zEV;
	Mon, 22 Apr 2024 07:17:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynto-0000000CNPx-1ZUM;
	Mon, 22 Apr 2024 07:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E78CA60D2B;
	Mon, 22 Apr 2024 07:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B10DC3277B;
	Mon, 22 Apr 2024 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713770131;
	bh=cg3WzltntgM9sJaif7yixpNGnhWKABN+vYsiEpkpVJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gp5i4WjbIb/VLanMYMuvzox2mfHc+rqg2JLUGYzBW3vM8FOOZSjpaEPCRZj54LfrN
	 NeOqrI8oDN2FR8AbX9uNdTv9jygAqNYOcy8tdni3vhwQXP7AkmacEwxBhspFC7W3jL
	 8ijXWOmfBtcpiEEqBMj4/6Sik7rNnSku6YumbSFxjTMnE+1EQ2wDojf2Es4v6FJBqw
	 Y8NdbOpEcE6kPJO6Ep7fc/rxM1fBDWkv2xIJ3GAvlmR6ZhPBjJ5oa7ge/IcyN7POPN
	 lDPuwRI0eQG2aiUx4iBY2xhp8uTPuNwbJOplNUlDHld+TGx554eA7A8Dq3l4bXCo6L
	 kYAjJdInQhL3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608C2C4345F;
	Mon, 22 Apr 2024 07:15:31 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Apr 2024 10:15:22 +0300
Subject: [PATCH net-next v2 15/15] net: dsa: mt7530: explain exposing MDIO
 bus of MT7531AE better
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240422-for-netnext-mt7530-improvements-4-v2-15-a75157ba76ad@arinc9.com>
References: <20240422-for-netnext-mt7530-improvements-4-v2-0-a75157ba76ad@arinc9.com>
In-Reply-To: <20240422-for-netnext-mt7530-improvements-4-v2-0-a75157ba76ad@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713770127; l=1109;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=vLvtlbHMBxKy/N+5hO2kjs9XkvkZFD7LvDK5jmVwOt0=;
 b=rrMcStwgZhwRYkv1smaK4/6fyCCBXYnzMSeDeY5COCE0JpnpNyuwBmAa+EH2zLbVYygTr8jEZ
 xmxYYbP6SFjBC2xJ1TKMAKURIjla8Ln7p8UXbk0E9eIB0v4YTX21ANp
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_001536_747271_89F7B4B7 
X-CRM114-Status: GOOD (  12.00  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Unlike MT7531BE, the GPIO 6-12 pins are not used for RGMII on MT7531AE.
Therefore, the GPIO 11-12 pins are set to function as MDC and MDIO to
expose the MDIO bus of the switch. Replace the comment with a better
explanation.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 1f6cd24de4b7..2b9f904a98f0 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2635,7 +2635,10 @@ mt7531_setup(struct dsa_switch *ds)
 	if (!priv->p5_sgmii) {
 		mt7531_pll_setup(priv);
 	} else {
-		/* Let ds->user_mii_bus be able to access external phy. */
+		/* Unlike MT7531BE, the GPIO 6-12 pins are not used for RGMII on
+		 * MT7531AE. Set the GPIO 11-12 pins to function as MDC and MDIO
+		 * to expose the MDIO bus of the switch.
+		 */
 		mt7530_rmw(priv, MT7531_GPIO_MODE1, MT7531_GPIO11_RG_RXD2_MASK,
 			   MT7531_EXT_P_MDC_11);
 		mt7530_rmw(priv, MT7531_GPIO_MODE1, MT7531_GPIO12_RG_RXD3_MASK,

-- 
2.40.1



