Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA65CC48291
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 09:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9wyiNwWfFjOffwnEaBPMBQdrIFm56ebopuAE0kIvag=; b=LO1+zVqJrS7okWuE39jNA4mZ2r
	mSe5j1RiLrVIGQYNMcwQzs0QKnOQHGS2pYBPLkEdFPKjNbauEfXSOXhiiar3A5ITiHUO6e8ODVGd2
	2mEw1spD25gGGi63DrqQHsfhKXOhTWpP2kP4iWN2rMrzaawpp20uLA6oZO3A2ynPHW3iyiEAXOZF/
	kz2c3WqUVaNf+9j5Su0/j6rv0mvO8lMR3iU2a69Am2w6INo9LwjM8RNuK2tGBqZI04MMhcDZQUzsT
	FR1rY3TN/Et/ejnLqErgrIyRS0mLNgYVBkUAttGl6VOiP3Ykw6WAimkc6mZJv/d/7k64gNPhcTzXV
	ddmOrFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVpiB-0000000AuiP-439O;
	Fri, 02 Feb 2024 09:19:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVphv-0000000AuWU-3gPv;
	Fri, 02 Feb 2024 09:19:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19B5B623F3;
	Fri,  2 Feb 2024 09:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC4B3C43394;
	Fri,  2 Feb 2024 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706865572;
	bh=urKbjaUWgGpmRsfGLlhmq0QU5w9x/bMdWCZ0Tma4ii8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PujNNZovB8TFADhjdZ+fXuswL1UiwaS355iNsNditbq32kP6JJH8HG/CV4GN/7OM2
	 uj51ZtoB/w5NKhHdPrIh8/4G6/Nizara0C998nxHW65ZrzSjKHjMMX7Vdzg3rFXRbR
	 /PMBU7sIZl+Uh5BrUHTquDkrt8qhI4HJ6ssn7+5Pl0A7XPldlxMy8C6pDQ8EVgOCnn
	 qiillI+YseDzOHmYWL48wktvtAQjPxsbteZfKfhQAt94NcLmWFqvUVePtHFXVhUDtU
	 cKHf7RV7gDWlSvEb114+p2vzuC8vB2nHttckNrC+dgXIY7JgPNCy4KMHsx0eaYV3zF
	 CtFOfl+gQlMHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14DFC4828E;
	Fri,  2 Feb 2024 09:19:32 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 02 Feb 2024 12:19:08 +0300
Subject: [PATCH net-next v3 2/7] net: dsa: mt7530: call port 6 setup from
 mt7530_mac_config()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240202-for-netnext-mt7530-improvements-2-v3-2-63d5adae99ca@arinc9.com>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
In-Reply-To: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706865569; l=2415;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=B4ubcnj0kkoG/x10O/6vsrHgrghUPFvE8EQyfqv241o=;
 b=3S1dUOXUt3XkWFYjkGi5E5aLXTgWmOauxCmS+JNwup4u8gHV95Ic0EIcSiuILU+dmpv06jo/I
 E6WP/g3PbsZAlC92rWs/2qG4cixotc26yIkGHOOyDwrKwkNIE/P//P2
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_011936_002115_6F6C5C50 
X-CRM114-Status: GOOD (  14.44  )
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

mt7530_pad_clk_setup() is called if port 6 is enabled. It used to do more
things than setting up port 6. That part was moved to more appropriate
locations, mt7530_setup() and mt7530_pll_setup().

Now that all it does is set up port 6, rename it to mt7530_setup_port6(),
and move it to a more appropriate location, under mt7530_mac_config().

Leave an empty mt7530_pad_clk_setup() to satisfy the pad_setup function
pointer.

This is the code path for setting up the ports before:

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
-> mt753x_pad_setup()
   -> mt7530_pad_clk_setup()

This is after:

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
      -> mt7530_setup_port6()

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/mt7530.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 330e22abc076..2d468a5f2e70 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -415,7 +415,7 @@ mt753x_preferred_default_local_cpu_port(struct dsa_switch *ds)
 
 /* Setup port 6 interface mode and TRGMII TX circuit */
 static int
-mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, xtal;
@@ -487,6 +487,12 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	return 0;
 }
 
+static int
+mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+{
+	return 0;
+}
+
 static int
 mt7531_pad_setup(struct dsa_switch *ds, phy_interface_t interface)
 {
@@ -2624,12 +2630,15 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
+	int ret;
 
-	/* Only need to setup port5. */
-	if (port != 5)
-		return 0;
-
-	mt7530_setup_port5(priv->ds, interface);
+	if (port == 5) {
+		mt7530_setup_port5(priv->ds, interface);
+	} else if (port == 6) {
+		ret = mt7530_setup_port6(priv->ds, interface);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }

-- 
2.40.1


