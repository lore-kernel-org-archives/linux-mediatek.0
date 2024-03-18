Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FCEC54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85ABx0PzzMwrMv1Iex7rokRVAfIflVF0oYoDnYFtE6Y=; b=pUbaSVzfHFi1YtNGj9TZ/h0fB8
	/2+BjOgqtt0WfjgD6a02CtXeMjoXEKbVQdejiIx466tehRkMAXf0YFZLTc4fQvp2CWI/GvXPnnWFF
	NqM3IrNbt1WJynGooPi7t6uusSai/rsGf8N+MG81aLIxMF+vwZ1GLEytKkiK/FpCD/fJJvF4WkEg/
	KpavRXylTjrLzOBuxGaZr1x/bs1vJOZpcoQm4VMsy/b7xkJ0lv03TPwXqc8u02ADzRnh3ao0y+XIN
	VhsxI37neUN2IwqpJ4OtmlYljKaOh9B2acmeQ3T63xJq3f9U+z5p99BG/PLQ7+6yv+KS4t2ygeKq+
	U1fl3Pww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm7iN-00000007ePY-1ewG;
	Mon, 18 Mar 2024 07:47:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm7iB-00000007eHj-2O7m;
	Mon, 18 Mar 2024 07:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BA9360BEC;
	Mon, 18 Mar 2024 07:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D36FAC43390;
	Mon, 18 Mar 2024 07:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710748028;
	bh=ITdv2pn5D4CqC5MwIs/6m1cR8j1oHZxQEiexAzXrA4A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o96972pkM02lrb3svhmh8szqud514TtEC+38sYeWCJV2mtuzlFDo2wmYF797V8aHp
	 0i8dXkxLEHsVohyn46NBAgDMbKIMEANoajNUa/4X+BoeCAV5jMsIewUBqf4CdwlW/1
	 DFPC2B8g+iFXijPPURDbEpT2bBYkM6YV20w38vbLjuhAER/TGx7nBiHGOSvNYmkt/K
	 cKpVqyQ3ov8G/CICVx0rAjl07SnuUULiOqR9lEA8PBLDMotEpSVv1y/0iaQcEz20YT
	 4Box+xyVoPMlT5YhVhE6+lrERzQEsNU2HqslCQD2Xo05Cn8UK5Xds57CAigYXv0xzI
	 MAVRfy02OHHRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23BEC54E58;
	Mon, 18 Mar 2024 07:47:08 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 18 Mar 2024 10:46:23 +0300
Subject: [PATCH 1/3] net: dsa: mt7530: fix enabling EEE on MT7531 switch on
 all boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: =?utf-8?q?=3C20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v?=
 =?utf-8?q?1-1-3f17226344e8=40arinc9=2Ecom=3E?=
References: =?utf-8?q?=3C20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v?=
 =?utf-8?q?1-0-3f17226344e8=40arinc9=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-?=
 =?utf-8?q?v1-0-3f17226344e8=40arinc9=2Ecom=3E?=
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
 Russell King <linux@armlinux.org.uk>, 
 SkyLake Huang <SkyLake.Huang@mediatek.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710748010; l=2411;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=n6GBg3P0wOtkdb07AnyqLGs2kfHYSdBgEmtkDwKT6B8=;
 b=I2LmPwjiQmjqjwCuXvNT3y9Oy+74/n1FBJ1U/eAziVxdZ8NilIckTM/4zYde6k4K5Ari39+4m
 ZWJOVvadHrTCRVVdUIeNpsCFYJciXsPmNKj4nHEmpDy9B+jOl3NrFwy
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_004711_763119_66490E85 
X-CRM114-Status: GOOD (  14.91  )
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

The commit 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
brought EEE support but did not enable EEE on MT7531 switch MACs. EEE is
enabled on MT7531 switch MACs either by pulling the LAN2LED0 pin low on the
board (bootstrapping), or unsetting the EEE_DIS bit on the trap register.

There are existing boards that were not designed to pull the pin low.
Therefore, unset the EEE_DIS bit on the trap register.

Unlike MT7530, the modifiable trap register won't be populated identical to
the trap status register after reset. Therefore, read from the trap status
register, modify the bits, then write to the modifiable trap register.

The disable EEE bit on the trap pertains to the LAN2LED0 pin which is
usually used to control an LED. Once the bit is unset, the pin will be low.
That will make the active low LED turn on.

The pin is controlled by the switch PHY. It seems that the PHY controls the
pin in the way that it inverts the pin state. That means depending on the
wiring of the LED connected to LAN2LED0 on the board, the LED may be on
without an active link.

Fixes: 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 7 +++++++
 drivers/net/dsa/mt7530.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 678b51f9cea6..d741d03969eb 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2458,6 +2458,13 @@ mt7531_setup(struct dsa_switch *ds)
 	/* Reset the switch through internal reset */
 	mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_SW_RST | SYS_CTRL_REG_RST);
 
+	/* Allow modifying the trap and enable Energy-Efficient Ethernet (EEE).
+	 */
+	val = mt7530_read(priv, MT7531_HWTRAP);
+	val |= CHG_STRAP;
+	val &= ~EEE_DIS;
+	mt7530_write(priv, MT7530_MHWTRAP, val);
+
 	if (!priv->p5_sgmii) {
 		mt7531_pll_setup(priv);
 	} else {
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index a71166e0a7fc..509ed5362236 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -457,6 +457,7 @@ enum mt7531_clk_skew {
 #define  XTAL_FSEL_M			BIT(7)
 #define  PHY_EN				BIT(6)
 #define  CHG_STRAP			BIT(8)
+#define  EEE_DIS			BIT(4)
 
 /* Register for hw trap modification */
 #define MT7530_MHWTRAP			0x7804

-- 
2.40.1


