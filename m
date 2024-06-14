Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764A7C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgKv1nf2InzknbbhRxhqes0hIrFbLNhzNu3kfbETYm8=; b=SovAVoXmzzeOlFGWrE36KZJ+KH
	/sJMqHAMsmY3H5jt49TuCT+aRhHi45GTeDRzbQVIfYFzw4Q8kEEZx6N/N33nNl3Ia8SsYjML9vNN9
	z7HkBFP0z7UQvHQOkbSVOOu/URNV5END/cdIdTwty08Fa+ZL+lVV4OpS/6I6UwK+Hge2zLuHh/SaC
	oQMZfgh+sl8/de6pg5CLsuH08DAe21fDn4m5R897oo7Hw2A/1KguO8sGwEjKsNph1saSPsrd5RwLW
	5OZFHpfuCItSgSa4EDlxeVfYmbL6a5aQf/sf8leEI27Mb/KZ3z/HRAe3WMX6hfcnhNIOt+UlLd+IA
	PFI6gW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIFJe-000000049SY-2Szt;
	Fri, 14 Jun 2024 22:22:38 +0000
Received: from orthanc.universe-factory.net ([2001:19f0:6c01:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIFJa-000000049RD-1DNG;
	Fri, 14 Jun 2024 22:22:35 +0000
Received: from avalon.fritz.box (unknown [IPv6:2001:19f0:6c01:100::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by orthanc.universe-factory.net (Postfix) with ESMTPSA id 1A8BF1FC32;
	Sat, 15 Jun 2024 00:22:28 +0200 (CEST)
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Schiffer <mschiffer@universe-factory.net>
Subject: [PATCH net-next 2/2] net: dsa: mt7530: add support for bridge port isolation
Date: Sat, 15 Jun 2024 00:21:54 +0200
Message-ID: <15263cb9bbc63d5cc66428e7438e0b5324306aa4.1718400508.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <378bc964b49f9e9954336e99009932ac22bfe172.1718400508.git.mschiffer@universe-factory.net>
References: <378bc964b49f9e9954336e99009932ac22bfe172.1718400508.git.mschiffer@universe-factory.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_152234_497740_4882677B 
X-CRM114-Status: GOOD (  14.55  )
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

Remove a pair of ports from the port matrix when both ports have the
isolated flag set.

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
 drivers/net/dsa/mt7530.c | 21 ++++++++++++++++++---
 drivers/net/dsa/mt7530.h |  1 +
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index ecacaefdd694..44939379aba8 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1303,7 +1303,8 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
 }
 
 static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
-				      const struct net_device *bridge_dev, bool join)
+				      const struct net_device *bridge_dev,
+				      bool join)
 	__must_hold(&priv->reg_mutex)
 {
 	struct dsa_port *dp = dsa_to_port(priv->ds, port), *other_dp;
@@ -1311,6 +1312,7 @@ static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
 	struct dsa_port *cpu_dp = dp->cpu_dp;
 	u32 port_bitmap = BIT(cpu_dp->index);
 	int other_port;
+	bool isolated;
 
 	dsa_switch_for_each_user_port(other_dp, priv->ds) {
 		other_port = other_dp->index;
@@ -1327,7 +1329,9 @@ static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
 		if (!dsa_port_offloads_bridge_dev(other_dp, bridge_dev))
 			continue;
 
-		if (join) {
+		isolated = p->isolated && other_p->isolated;
+
+		if (join && !isolated) {
 			other_p->pm |= PCR_MATRIX(BIT(port));
 			port_bitmap |= BIT(other_port);
 		} else {
@@ -1352,7 +1356,7 @@ mt7530_port_pre_bridge_flags(struct dsa_switch *ds, int port,
 			     struct netlink_ext_ack *extack)
 {
 	if (flags.mask & ~(BR_LEARNING | BR_FLOOD | BR_MCAST_FLOOD |
-			   BR_BCAST_FLOOD))
+			   BR_BCAST_FLOOD | BR_ISOLATED))
 		return -EINVAL;
 
 	return 0;
@@ -1381,6 +1385,17 @@ mt7530_port_bridge_flags(struct dsa_switch *ds, int port,
 		mt7530_rmw(priv, MT753X_MFC, BC_FFP(BIT(port)),
 			   flags.val & BR_BCAST_FLOOD ? BC_FFP(BIT(port)) : 0);
 
+	if (flags.mask & BR_ISOLATED) {
+		struct dsa_port *dp = dsa_to_port(ds, port);
+		struct net_device *bridge_dev = dsa_port_bridge_dev_get(dp);
+
+		priv->ports[port].isolated = !!(flags.val & BR_ISOLATED);
+
+		mutex_lock(&priv->reg_mutex);
+		mt7530_update_port_member(priv, port, bridge_dev, true);
+		mutex_unlock(&priv->reg_mutex);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 2ea4e24628c6..28592123070b 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -721,6 +721,7 @@ struct mt7530_fdb {
  */
 struct mt7530_port {
 	bool enable;
+	bool isolated;
 	u32 pm;
 	u16 pvid;
 	struct phylink_pcs *sgmii_pcs;
-- 
2.45.2


