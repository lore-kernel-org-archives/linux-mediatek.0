Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F744C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj8a0YcRXjwwoVuxtWZa7leH8QPCDc+QQ3OI36VOixE=; b=LlJKSvbzu1QI254lk5PfdBm1Yi
	kxMzII7JtZnUdfnF3sPqoAGUHe99HTO5wrK9i7uwAmd/Sq5ByA1jAR0aaPDQGO4akizRLyZlOOIlI
	xQ6zwVxbDp21ov29qCkljoRQukcR2bp2LpsaOWcStD0D5QJjCVyBEcSIOWPV7j3Zq527yDt575LYn
	wL9TEt6zwPYKtSnvjRGHFLwA4CFTyDHWrxEEsN6HrBhOXImpN+0qxHhE0Lx4181hmLhVT9ySXplw4
	4ObMod5Urx+14fqtAaoS4Nez7heLnLcVHZOT+kZ5WJ+8D/w/3D2pf644THw/OCdCa/hzOAmKHju02
	aKdMCvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0MY-0000000HPeC-46Jo;
	Fri, 01 Mar 2024 10:43:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0M2-0000000HPCZ-0jqE;
	Fri, 01 Mar 2024 10:43:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D2EB60FF6;
	Fri,  1 Mar 2024 10:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23052C43399;
	Fri,  1 Mar 2024 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709289779;
	bh=9OAw1+rum7epPqDadmyP8sgcI2N4oduq36yqdy67hu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q6ytghsNRg8TjKbIqvx5vqLAdWrDW0Gy+9JujyLZr81xADgRM8+2WSmV5ipMMJMaW
	 W/0LDzR7AfAU56JPTDwdYHFq3uc7f+V2MputpyhNzIO3Q4WU/K0U2jCZ187kuYITvs
	 TLgQc6ZR8dwec5PrN5zn7Vm5DgU3PSM+YqioNKHXO2rlS7lfwwtcBKpP1liRvm6bBR
	 2oz86kTazcxneqbmvceETJiib14hPeuqBccDO38JKa+Amd1aeiw9iE2/v+aHWNKVpg
	 VG4HQ73zJGSVqexIjIZjlRxjtBIgZVLEegeL/o7a2Drp6uY0HOQcNYlUGZPvwVXU0y
	 WtnAPI/XyT5/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1246DC54E55;
	Fri,  1 Mar 2024 10:42:59 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 01 Mar 2024 12:43:04 +0200
Subject: [PATCH net-next v3 8/9] net: dsa: mt7530: sort link settings ops
 and force link down on all ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240301-for-netnext-mt7530-improvements-3-v3-8-449f4f166454@arinc9.com>
References: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
In-Reply-To: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709289776; l=2434;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=Lk4340C7GwrRpdUGlGvETd3f0JsF8UjRCdCF02XBua4=;
 b=UFudaq/QD+WxDRhDFOF14id6HYvCGEsmKQCDhlW4fp3Ns3/BchHbNue0R2ECqZJDdK0eCfeVT
 zR5NRb3Y2HeCfkGFSPZDRnPbva00Cun3Ki9O89cEU4ZvtTVlM/aEDBu
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront with auth_id=137
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_024302_457428_85DB5EB1 
X-CRM114-Status: GOOD (  11.36  )
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

port_enable and port_disable clears the link settings. Move that to
mt7530_setup() and mt7531_setup_common() which set up the switches. This
way, the link settings are cleared on all ports at setup, and then only
once with phylink_mac_link_down() when a link goes down.

Enable force mode at setup to apply the force part of the link settings.
This ensures that disabled ports will have their link down.

Suggested-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 5c8ad41ce8cd..91d927bb49f7 100644
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

-- 
2.40.1


