Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714BDC27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 07:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WjDNOwJqf5KIN3O/F2yuKgC9HI9toUXrNF9F3EBnK4=; b=4dCyEKlZem2TCnlnJBqSy4GDr3
	wLeQy06ZOixKKEN5gK3uAfe2z2OEcQfLNdkgRz+0EImLNN2TwPBqeO9yL4lhSZ8fG/2knoNeeudpi
	KNxVG0y8sa04APf5pBtiP+DMqN2HD6NJ1+KA8WJ1MsfH0MXjnbMRdtSqpCzTOjsBcFFs6EYzGnXRP
	v0tz5zp62SL9szYtKlWmvDj7h8xOBkUk7nOPS7WtqUGAL/b7mA1YF2VLUK8ycVusFcuv+mrNEHgR/
	KH2pTEbOvkp1JEkTIWradIEWXOAmS1a9Tr9Gxw3Qvl71j2COOBDr0oAUV49sJm6thTmssC1CYOA4P
	Sr6nuojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJT5z-0000000DvcJ-1g6Q;
	Tue, 18 Jun 2024 07:17:35 +0000
Received: from orthanc.universe-factory.net ([2001:19f0:6c01:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJT5s-0000000DvaJ-3Aiy;
	Tue, 18 Jun 2024 07:17:31 +0000
Received: from avalon.fritz.box (unknown [IPv6:2001:19f0:6c01:100::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by orthanc.universe-factory.net (Postfix) with ESMTPSA id 5C52B1FC32;
	Tue, 18 Jun 2024 09:17:26 +0200 (CEST)
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
Subject: [PATCH net-next v3 2/2] net: dsa: mt7530: add support for bridge port isolation
Date: Tue, 18 Jun 2024 09:17:13 +0200
Message-ID: <499be699382f8b674d19516b6a365b2265de2151.1718694181.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <15c28e5ed5fa02ca7904c71540e254617d571eb8.1718694181.git.mschiffer@universe-factory.net>
References: <15c28e5ed5fa02ca7904c71540e254617d571eb8.1718694181.git.mschiffer@universe-factory.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_001729_015286_CD276972 
X-CRM114-Status: GOOD (  14.40  )
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

v2: removed unintended formatting change
v3: no changes

 drivers/net/dsa/mt7530.c | 18 ++++++++++++++++--
 drivers/net/dsa/mt7530.h |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9ce27ce07d77..ec18e68bf3a8 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1311,6 +1311,7 @@ static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
 	struct dsa_port *cpu_dp = dp->cpu_dp;
 	u32 port_bitmap = BIT(cpu_dp->index);
 	int other_port;
+	bool isolated;
 
 	dsa_switch_for_each_user_port(other_dp, priv->ds) {
 		other_port = other_dp->index;
@@ -1327,7 +1328,9 @@ static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
 		if (!dsa_port_offloads_bridge_dev(other_dp, bridge_dev))
 			continue;
 
-		if (join) {
+		isolated = p->isolated && other_p->isolated;
+
+		if (join && !isolated) {
 			other_p->pm |= PCR_MATRIX(BIT(port));
 			port_bitmap |= BIT(other_port);
 		} else {
@@ -1354,7 +1357,7 @@ mt7530_port_pre_bridge_flags(struct dsa_switch *ds, int port,
 			     struct netlink_ext_ack *extack)
 {
 	if (flags.mask & ~(BR_LEARNING | BR_FLOOD | BR_MCAST_FLOOD |
-			   BR_BCAST_FLOOD))
+			   BR_BCAST_FLOOD | BR_ISOLATED))
 		return -EINVAL;
 
 	return 0;
@@ -1383,6 +1386,17 @@ mt7530_port_bridge_flags(struct dsa_switch *ds, int port,
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


