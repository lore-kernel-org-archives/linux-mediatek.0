Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA347C4828F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Feb 2024 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8oY/U0wrHSNvX0qINFM5g1kvQbP1cs/QHS1aVPw9b8=; b=XTHTLNGcueVn32QVetTiXgKhV+
	wMZd3voYwvuRuFPDe9WJuiJJI59KncpCW4uZ9wInN+wJV+LNUIE7FxaCaxouF4hPbFtAOnzCe/vre
	6M8HEqTl2ilGUGUDhjAmvMNQoBDZK6yl8YltbQrnY8JhaiPkoHnUEusm9zaeR8/ItxSszep6QUwdn
	0c/XFYB53wKEG5QSjw0a7BfgoWneUuYY7zjKMPoUY4wDAQfMLA98oJcKeOG69GD/FHqgtGrvsR47U
	HKzXJLTABPepjp+mVgqtKSvdPFB/o3fxLh6PRF9zWP4XWlsgmROsks6wF6VH0i9nxP8G610vTVIs3
	lxKeho+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWfSV-000000018nG-29Mj;
	Sun, 04 Feb 2024 16:35:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWfSJ-000000018fG-3juA;
	Sun, 04 Feb 2024 16:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4CD5060EEF;
	Sun,  4 Feb 2024 16:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFD9DC433B2;
	Sun,  4 Feb 2024 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707064492;
	bh=d1jd+Fl7RNj7Psg5rAt5zL7BjJf3BEMUc++o5vPBRxo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AtsrW/icKD1jGN0Bnk+CzGhj4mZmVA26M3/AXSWIIRHBtQjuw/ycYdaplmLMWApjC
	 COMkEQ2bAlTBJRFMgpUj8g7p7VeSseGZmx7ZMX+ajV3MvaoaRQ4U9y9w51ZEhrUA4b
	 pq7zwx4zBY70POd8kvCf8lYhhx+QvdutBqf2OyPZWKaH3d/2xevyDGdYqgpqHtMG5d
	 9Ek2aTPgnI5fHb7MpiFzvTcbC9w1bvixMPfuoqZmvHh4c/rILx9sl2RAE0Xp8Bz1TV
	 nGmF5oeu5i4QRRBX6xR7xPMQkCQoiAhnBjHrlggqNITzfXT/tWWayXFMCiY0AdQOvb
	 NN9nGpqwqxeUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D221CC48298;
	Sun,  4 Feb 2024 16:34:51 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Sun, 04 Feb 2024 19:34:22 +0300
Subject: [PATCH net-next v4 4/7] net: dsa: mt7530: call port 6 setup from
 mt7530_mac_config()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240204-for-netnext-mt7530-improvements-2-v4-4-02bf0abaadb8@arinc9.com>
References: <20240204-for-netnext-mt7530-improvements-2-v4-0-02bf0abaadb8@arinc9.com>
In-Reply-To: <20240204-for-netnext-mt7530-improvements-2-v4-0-02bf0abaadb8@arinc9.com>
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
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707064489; l=2654;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=1hpZjAIapmRbOQsfxIUO58Y9kVJXnb7j8qJPy2E+m/0=;
 b=KHb2QUE4Hhz8YMEq0xZjyf+Oc+A45D3UsjybeXA537nc0jvbGMe2d2naSMjf3XoFDdD/1LQKB
 KAkJWugqAk1AMvSlKBf834UtyfBGuN0XIWeTtnQNLbG57lpcTOGRfHs
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_083456_233862_BDA1D0D9 
X-CRM114-Status: GOOD (  13.23  )
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

Change mt7530_setup_port6() to void as there're no error cases.

Leave an empty mt7530_pad_clk_setup() to satisfy the pad_setup function
pointer.

This is the code path for setting up the ports before:

dsa_switch_ops :: phylink_mac_config() -> mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt753x_info :: mac_port_config() -> mt7530_mac_config()
      -> mt7530_setup_port5()
-> mt753x_pad_setup()
   -> mt753x_info :: pad_setup() -> mt7530_pad_clk_setup()

This is after:

dsa_switch_ops :: phylink_mac_config() -> mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt753x_info :: mac_port_config() -> mt7530_mac_config()
      -> mt7530_setup_port5()
      -> mt7530_setup_port6()

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 82e90da1e52b..18842c759b63 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -414,8 +414,8 @@ mt753x_preferred_default_local_cpu_port(struct dsa_switch *ds)
 }
 
 /* Setup port 6 interface mode and TRGMII TX circuit */
-static int
-mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+static void
+mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, xtal;
@@ -465,7 +465,11 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 
 	/* Enable the MT7530 TRGMII clocks */
 	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
+}
 
+static int
+mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+{
 	return 0;
 }
 
@@ -2613,11 +2617,10 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 {
 	struct mt7530_priv *priv = ds->priv;
 
-	/* Only need to setup port5. */
-	if (port != 5)
-		return 0;
-
-	mt7530_setup_port5(priv->ds, interface);
+	if (port == 5) {
+		mt7530_setup_port5(priv->ds, interface);
+	else if (port == 6)
+		mt7530_setup_port6(priv->ds, interface);
 
 	return 0;
 }

-- 
2.40.1


