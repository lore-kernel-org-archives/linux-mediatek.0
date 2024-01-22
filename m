Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C98C47DDC
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 05:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fl2fK8cJA7SyAmXjPhNpqqbHZNKiM4L6I2KHhZMj2fQ=; b=QlFj0XisVIdTn9rCOB+lgGmGMl
	DrQXtK6WFQYoZc8lVnSCQ6ifedsvAkvHuftT7Ytp7SmX/KQbmJUZ/1GnO5sdtnxznrLhgtRW92UpB
	00toB9b9X7s3xEvGwAv8S7jTfXuj110gqHmR3tvPRJ6Z2QuWAtnncg1SJtC/p/WoyaqRMJiQ0BGEI
	7uwRUUrfxm1uAtTkxhu9sc7X2MgCEGTLfvA7+FVpilw243v/vSJxcdxlt0Cl8L5ViuINGqyWgLnyS
	C4u/xXe0dU1rsOu5mPSzS1zmbY/TcZiKNIbfXXEaxDnlxDtzUE3GNMOKOq/kdSRIc5zDGdqvnDnJQ
	foJXDkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmym-00Abgk-1o;
	Mon, 22 Jan 2024 05:36:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmya-00AbYS-10;
	Mon, 22 Jan 2024 05:36:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 117D66102E;
	Mon, 22 Jan 2024 05:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 581CCC433A6;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705901758;
	bh=Bgfx+EXSTylXwbNtkkMqzd6UQvp2lUWMn2C6vtoawQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XKE25fjzDV/7nvKO1u8VP9DMhM4FhykMky9I7YxP8Ezrkm9QY7pv+FO95Z043mrav
	 eEJCD5NR0gWNVOBdMvdGMF/64rVCHR8VdszdOzqujUgwA1AYRLikEVEe2Xuuz6QU4w
	 wU6E00CpxkfFXKjP1MVUCbYuSoDUR0VA9UMEV7M0XIXLiFyULO51ccUN+lAb4Ho5/y
	 G7VkyEmEvUeeXrwq7IZYU0FWwAn28snmS8EBGNtqvOSpRucBB09FX0fbnKNk6qnBoQ
	 HbHAjTaPSFUFOZqfVFkiAUY+Umpkpxfhn/QgTa14ASLcn2FnykpOblx5rxujemZSy/
	 +G+zKzzDpSJ7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457C5C47DDF;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Jan 2024 08:35:55 +0300
Subject: [PATCH net-next v3 4/7] net: dsa: mt7530: improve comments
 regarding switch ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240122-for-netnext-mt7530-improvements-1-v3-4-042401f2b279@arinc9.com>
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
In-Reply-To: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, 
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705901755; l=4567;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=rLcHCbYDzkt28v28nq9XIDczR9kM3jpJ8YmzJ0uoUlo=;
 b=P9VOv8+icSWtarQqBoOfyPHXdJUQtTer/Hw1RKxWe3HptZ6UWnYL15uVjd13g8sHELrl5aVez
 DZ0Bb8gDDuYBbL8SBFGTOYBY/b98Q7SFPz4h42o7MxTgYsK7IPd7/fB
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_213604_467855_4589FB9E 
X-CRM114-Status: GOOD (  13.33  )
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

There's no logic to numerically order the CPU ports. Just state the port
number instead.

Remove the irrelevant PHY muxing information from
mt7530_mac_port_get_caps(). Explain the supported MII modes instead.

Remove the out of place PHY muxing information from
mt753x_phylink_mac_config(). The function is for MT7530, MT7531, and the
switch on the MT7988 SoC but there's no PHY muxing on MT7531 or the switch
on the MT7988 SoC.

These comments were gradually introduced with the commits below.
commit ca366d6c889b ("net: dsa: mt7530: Convert to PHYLINK API")
commit 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
commit 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding
a new hardware")
commit c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/mt7530.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c77092506c3f..93d8498ce274 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2520,12 +2520,14 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 				     struct phylink_config *config)
 {
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	/* Ports which are connected to switch PHYs. There is no MII pinout. */
+	case 0 ... 4:
 		__set_bit(PHY_INTERFACE_MODE_GMII,
 			  config->supported_interfaces);
 		break;
 
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+	/* Port 5 supports rgmii with delays, mii, and gmii. */
+	case 5:
 		phy_interface_set_rgmii(config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_MII,
 			  config->supported_interfaces);
@@ -2533,7 +2535,8 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 			  config->supported_interfaces);
 		break;
 
-	case 6: /* 1st cpu port */
+	/* Port 6 supports rgmii and trgmii. */
+	case 6:
 		__set_bit(PHY_INTERFACE_MODE_RGMII,
 			  config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_TRGMII,
@@ -2548,19 +2551,24 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 	struct mt7530_priv *priv = ds->priv;
 
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	/* Ports which are connected to switch PHYs. There is no MII pinout. */
+	case 0 ... 4:
 		__set_bit(PHY_INTERFACE_MODE_GMII,
 			  config->supported_interfaces);
 		break;
 
-	case 5: /* 2nd cpu port supports either rgmii or sgmii/8023z */
+	/* Port 5 supports rgmii with delays on MT7531BE, sgmii/802.3z on
+	 * MT7531AE.
+	 */
+	case 5:
 		if (!priv->p5_sgmii) {
 			phy_interface_set_rgmii(config->supported_interfaces);
 			break;
 		}
 		fallthrough;
 
-	case 6: /* 1st cpu port supports sgmii/8023z only */
+	/* Port 6 supports sgmii/802.3z. */
+	case 6:
 		__set_bit(PHY_INTERFACE_MODE_SGMII,
 			  config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
@@ -2579,11 +2587,13 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 	phy_interface_zero(config->supported_interfaces);
 
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	/* Ports which are connected to switch PHYs. There is no MII pinout. */
+	case 0 ... 4:
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
 		break;
 
+	/* Port 6 is connected to SoC's XGMII MAC. There is no MII pinout. */
 	case 6:
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
@@ -2747,12 +2757,12 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	u32 mcr_cur, mcr_new;
 
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	case 0 ... 4:
 		if (state->interface != PHY_INTERFACE_MODE_GMII &&
 		    state->interface != PHY_INTERFACE_MODE_INTERNAL)
 			goto unsupported;
 		break;
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+	case 5:
 		if (priv->p5_interface == state->interface)
 			break;
 
@@ -2762,7 +2772,7 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		if (priv->p5_intf_sel != P5_DISABLED)
 			priv->p5_interface = state->interface;
 		break;
-	case 6: /* 1st cpu port */
+	case 6:
 		if (priv->p6_interface == state->interface)
 			break;
 

-- 
2.40.1


