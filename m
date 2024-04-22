Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D39C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 07:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B52CH/LWotRm+ktn912y/5Ma1+52TVQq++PSTIRh8V4=; b=28mWwVwYvEfS/+78K7cFgQqfS1
	Ic+1sw3t+ZRfAHpE7YDhvcfwupV/sX58fcoDPLceBrNaPpXIDZtMV04QC9knlmzHQ7P1TiZ0dNZRm
	a46dWOd+j8Z3pzmv4FTOehR3WYCel3rgmsig6CaQ9fYaMTEVAzeKhgdPIisVRzy+xAX7CpCvybfzo
	1aOv1hZZeYHXMIsgY8Gj+PFJRTLuWm29mpQeFtD7he7jF2kl0jnR3smHpC9KYEvnzRQ4N6Zk4xFRW
	Tsggv5s5G/QQXN3V0MgMzw1kePXA0yWNbJ0XV2FqpoidGlF0hUeAmJiP/w2Z5xBIEE6SxsUjcXr4U
	FpDtshgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynvM-0000000COIC-3QJ2;
	Mon, 22 Apr 2024 07:17:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryntm-0000000CNMw-3JjF;
	Mon, 22 Apr 2024 07:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5B2260CF9;
	Mon, 22 Apr 2024 07:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CFE9C4AF61;
	Mon, 22 Apr 2024 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713770131;
	bh=E4bOiJx1q+nQyx91LA+lMd4HNz7Gscld/4vQtZGnbwQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ajM1UMJ2pU9y8p0WzVLRgrTnFqnBgLHP56xFT+M5+xuc6vUkf2Xc8GCvl4ZOCqQSr
	 ALjNg3hM0HgykkcnBsOhk2Pq+wRHEozYfeukHOLG9XVN/GErHZeGraFB073hiA/QAy
	 174e36wrHQot9JZv4SuYSGHZYKlSPcXXXs3YTRzxC9Vji6Ut28pnKXwB/kQIFtRbf8
	 CtolqRWeJhUOQmw2jGpRGHX/lrmliu5abN7l5xIrw84ZOKFqIjYbp0Rm/bgRctbbJA
	 i7jglt+Wr1agneYewuOh1x4vEaIGTFgxWFIET9BF3LzgprQWhWKHyWHNYiODQa8aYz
	 yAxFN7iijpqsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB70C10F16;
	Mon, 22 Apr 2024 07:15:31 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Apr 2024 10:15:20 +0300
Subject: [PATCH net-next v2 13/15] net: dsa: mt7530: use
 priv->ds->num_ports instead of MT7530_NUM_PORTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240422-for-netnext-mt7530-improvements-4-v2-13-a75157ba76ad@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713770127; l=2051;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=LO57rTtyBbOCREdPUpi6qHUsoyqRRLXYGv733cnzF7I=;
 b=qqzctkZQES8NF5LlMYDv98BTmFXbTZaEoakWJoA2/kDTUoi9+aBTltYqJHlK1JsL0us/ZvI7Q
 +CO9tadFy7qCeAsJ9tbPawfjSyWV1IroyQul4j0q174vvcq7p9mKQjL
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_001535_153375_C1522A9B 
X-CRM114-Status: GOOD (  12.19  )
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

Use priv->ds->num_ports on all for loops which configure the switch
registers. In the future, the value of MT7530_NUM_PORTS will depend on
priv->id. Therefore, this change prepares the subdriver for a simpler
implementation.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 5e69ff0a4b24..55954a165a15 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1411,7 +1411,7 @@ mt7530_port_set_vlan_unaware(struct dsa_switch *ds, int port)
 	mt7530_rmw(priv, MT7530_PPBV1_P(port), G0_PORT_VID_MASK,
 		   G0_PORT_VID_DEF);
 
-	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+	for (i = 0; i < priv->ds->num_ports; i++) {
 		if (dsa_is_user_port(ds, i) &&
 		    dsa_port_is_vlan_filtering(dsa_to_port(ds, i))) {
 			all_user_ports_removed = false;
@@ -2428,7 +2428,7 @@ mt7530_setup(struct dsa_switch *ds)
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
-	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+	for (i = 0; i < priv->ds->num_ports; i++) {
 		/* Clear link settings and enable force mode to force link down
 		 * on all ports until they're enabled later.
 		 */
@@ -2539,7 +2539,7 @@ mt7531_setup_common(struct dsa_switch *ds)
 	mt7530_clear(priv, MT753X_MFC, BC_FFP_MASK | UNM_FFP_MASK |
 		     UNU_FFP_MASK);
 
-	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+	for (i = 0; i < priv->ds->num_ports; i++) {
 		/* Clear link settings and enable force mode to force link down
 		 * on all ports until they're enabled later.
 		 */
@@ -2626,7 +2626,7 @@ mt7531_setup(struct dsa_switch *ds)
 	priv->p5_sgmii = !!(val & PAD_DUAL_SGMII_EN);
 
 	/* Force link down on all ports before internal reset */
-	for (i = 0; i < MT7530_NUM_PORTS; i++)
+	for (i = 0; i < priv->ds->num_ports; i++)
 		mt7530_write(priv, MT753X_PMCR_P(i), MT7531_FORCE_MODE_LNK);
 
 	/* Reset the switch through internal reset */

-- 
2.40.1



