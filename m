Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AC4C48BF0
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 11:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIzEFlH6tYf3kxvRpoFe19I6y15/TS7x6hzPIBM8miw=; b=ktlHCJRrVWxgQ376dnJ7ugv6jk
	ASnhqRtj2F5osmOX6kXwXQFZPCUpVpI5GMCIrLaDbbjLQ8ZgwPJdYgZv2bdpXMJymeAauFr1e9Tzh
	9Mn6GZZYUFtGhbmONSrBMedvLU809JIDzNzdKur8C+mqvsyq3M4U2LxTwuOVSiHS/Jf0YGTANARb9
	FC3KfhNKcub38ZaGjkADIv4Zaxr/R+xIlia7CUrKCzk1WqqEF2bLPjOgMU13J0a5Zc1/hKDin7nzg
	Da7gf9I/2apvQIcpbI6Cn+7VjEkzNqomEvQ4BOjjnkAtNXPOwWrLruzLMpM3FV1t/SPy59Y1KKXei
	dznQmW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raw2k-000000024bz-1xDe;
	Fri, 16 Feb 2024 11:06:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raw2L-000000024HF-3nKy;
	Fri, 16 Feb 2024 11:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1653761F56;
	Fri, 16 Feb 2024 11:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AED7C4166A;
	Fri, 16 Feb 2024 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708081544;
	bh=td9ArVknXuzyTB8FXUOyI13YbxdPw2V6dLjZ0FXccDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P/XlO3pL9pqeVzP2EWfZwOcV2OYLrhF091DQWn2r3Xh05ASkcpAfRXC7K8LqTd6qG
	 YkTF1FpLRBkWHwrJ1HaojsFK8zM+6lrD2wmtut0YQXyXHklYO8HNzoUP/sAscb//+A
	 NsNAUWFQ+TWc/vuduAHUKPNCISoqyYMmT2cQOL4yx//uPdNd7H3qnh0YLzO7iuzpTW
	 Ep4dx1OTUVvkydxCTIQC3N7Hjx+Lv7b0NQ6mYc/+RsmxQCNHJ9vOfhqgoEyIvluVIX
	 5hwLey8r9HLbVY6hI2BPmfO801DakYk/2xpzqb4CCruR5iIbuf7ogDrkPfPm8+bgr9
	 NLzUr0QNmei4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491E8C48BF0;
	Fri, 16 Feb 2024 11:05:44 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 16 Feb 2024 14:05:36 +0300
Subject: [PATCH net-next v2 8/8] net: dsa: mt7530: simplify link operations
 and force link down on all ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240216-for-netnext-mt7530-improvements-3-v2-8-094cae3ff23b@arinc9.com>
References: <20240216-for-netnext-mt7530-improvements-3-v2-0-094cae3ff23b@arinc9.com>
In-Reply-To: <20240216-for-netnext-mt7530-improvements-3-v2-0-094cae3ff23b@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708081540; l=5194;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=3PnEpSD/b9sLXrH/ouiQE55BJAdoplXfAHA3Ch+TLls=;
 b=mSaVHEzCy4ejGcjX96SnPb/qltroYfKxJok9jX4XC6EEKUgprqU+eyIwYXvYzGj3FGdeQTMiz
 RZCb+leeyYiAYQTbPcfrjcTZTQSfLKSqIKcXmsLArrQw1X2bfF2KpZu
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_030546_202637_1F9E65CC 
X-CRM114-Status: GOOD (  15.69  )
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

Currently, the link operations for switch MACs are scattered across
port_enable, port_disable, phylink_mac_config, phylink_mac_link_up, and
phylink_mac_link_down.

port_enable and port_disable clears the link settings. Move that to
mt7530_setup() and mt7531_setup_common() which set up the switches. This
way, the link settings are cleared on all ports at setup, and then only
once with phylink_mac_link_down() when a link goes down.

Enable force mode at setup to apply the force part of the link settings.
This ensures that only active ports will have their link up.

Now that the bit for setting the port on force mode is done on
mt7530_setup() and mt7531_setup_common(), get rid of PMCR_FORCE_MODE_ID()
which helped determine which bit to use for the switch model.

The "MT7621 Giga Switch Programming Guide v0.3", "MT7531 Reference Manual
for Development Board v1.0", and "MT7988A Wi-Fi 7 Generation Router
Platform: Datasheet (Open Version) v0.1" documents show that these bits are
enabled at reset:

PMCR_IFG_XMIT(1) (not part of PMCR_LINK_SETTINGS_MASK)
PMCR_MAC_MODE (not part of PMCR_LINK_SETTINGS_MASK)
PMCR_TX_EN
PMCR_RX_EN
PMCR_BACKOFF_EN (not part of PMCR_LINK_SETTINGS_MASK)
PMCR_BACKPR_EN (not part of PMCR_LINK_SETTINGS_MASK)
PMCR_TX_FC_EN
PMCR_RX_FC_EN

These bits also don't exist on the MT7530_PMCR_P(6) register of the switch
on the MT7988 SoC:

PMCR_IFG_XMIT()
PMCR_MAC_MODE
PMCR_BACKOFF_EN
PMCR_BACKPR_EN

Remove the setting of the bits not part of PMCR_LINK_SETTINGS_MASK on
phylink_mac_config as they're already set.

Suggested-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 26 +++++++++++++-------------
 drivers/net/dsa/mt7530.h |  2 --
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 5c8ad41ce8cd..1ae11b180d54 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1018,7 +1018,6 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
 	priv->ports[port].enable = true;
 	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
 		   priv->ports[port].pm);
-	mt7530_clear(priv, MT7530_PMCR_P(port), PMCR_LINK_SETTINGS_MASK);
 
 	mutex_unlock(&priv->reg_mutex);
 
@@ -1038,7 +1037,6 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
 	priv->ports[port].enable = false;
 	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
 		   PCR_MATRIX_CLR);
-	mt7530_clear(priv, MT7530_PMCR_P(port), PMCR_LINK_SETTINGS_MASK);
 
 	mutex_unlock(&priv->reg_mutex);
 }
@@ -2257,6 +2255,12 @@ mt7530_setup(struct dsa_switch *ds)
 	mt7530_mib_reset(ds);
 
 	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+		/* Clear link settings and enable force mode to force link down
+		 * on all ports until they're enabled later.
+		 */
+		mt7530_rmw(priv, MT7530_PMCR_P(i), PMCR_LINK_SETTINGS_MASK |
+			   PMCR_FORCE_MODE, PMCR_FORCE_MODE);
+
 		/* Disable forwarding by default on all ports */
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
 			   PCR_MATRIX_CLR);
@@ -2359,6 +2363,12 @@ mt7531_setup_common(struct dsa_switch *ds)
 		     UNU_FFP_MASK);
 
 	for (i = 0; i < MT7530_NUM_PORTS; i++) {
+		/* Clear link settings and enable force mode to force link down
+		 * on all ports until they're enabled later.
+		 */
+		mt7530_rmw(priv, MT7530_PMCR_P(i), PMCR_LINK_SETTINGS_MASK |
+			   MT7531_FORCE_MODE, MT7531_FORCE_MODE);
+
 		/* Disable forwarding by default on all ports */
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
 			   PCR_MATRIX_CLR);
@@ -2657,23 +2667,13 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 			  const struct phylink_link_state *state)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 mcr_cur, mcr_new;
 
 	if ((port == 5 || port == 6) && priv->info->mac_port_config)
 		priv->info->mac_port_config(ds, port, mode, state->interface);
 
-	mcr_cur = mt7530_read(priv, MT7530_PMCR_P(port));
-	mcr_new = mcr_cur;
-	mcr_new &= ~PMCR_LINK_SETTINGS_MASK;
-	mcr_new |= PMCR_IFG_XMIT(1) | PMCR_MAC_MODE | PMCR_BACKOFF_EN |
-		   PMCR_BACKPR_EN | PMCR_FORCE_MODE_ID(priv->id);
-
 	/* Are we connected to external phy */
 	if (port == 5 && dsa_is_user_port(ds, 5))
-		mcr_new |= PMCR_EXT_PHY;
-
-	if (mcr_new != mcr_cur)
-		mt7530_write(priv, MT7530_PMCR_P(port), mcr_new);
+		mt7530_set(priv, MT7530_PMCR_P(port), PMCR_EXT_PHY);
 }
 
 static void mt753x_phylink_mac_link_down(struct dsa_switch *ds, int port,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 8a8144868eaa..a71166e0a7fc 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -304,8 +304,6 @@ enum mt7530_vlan_port_acc_frm {
 					 MT7531_FORCE_DPX | \
 					 MT7531_FORCE_RX_FC | \
 					 MT7531_FORCE_TX_FC)
-#define  PMCR_FORCE_MODE_ID(id)		((((id) == ID_MT7531) || ((id) == ID_MT7988)) ?	\
-					 MT7531_FORCE_MODE : PMCR_FORCE_MODE)
 #define  PMCR_LINK_SETTINGS_MASK	(PMCR_TX_EN | PMCR_FORCE_SPEED_1000 | \
 					 PMCR_RX_EN | PMCR_FORCE_SPEED_100 | \
 					 PMCR_TX_FC_EN | PMCR_RX_FC_EN | \

-- 
2.40.1


