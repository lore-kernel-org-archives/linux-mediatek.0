Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB515CD98C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 19:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+ncxXkpeUVoW5cCZvmXWNkl1daZvq6cCZNyQN2QNi4=; b=ctgGe5a2i1dhDOvAREylffBT6q
	jocKcONKVfHZ3YovlXVEmtOaQh0wn0VTFg+0k2w4kK0z/ooljJBPaI8u7vM+CiSz28+Djz56HSQiO
	GeQqODXGtHLxTyjNKy1B8hi34kv076xz6nWHeMW2efM2jTOQA8qbPLBVwbnQUJ7qL6q6MRXpDvj0o
	cDIUBv3mZ3w2Ms6IQupHcJcZbFGM+CW4Y9EBa6Op8893SS0LzWvObWbf5vxYoXRBvReqhBW3ijY7u
	Apf+F9oMvRgGuwIuq1edda2gZ2csgqYpUE828J1O5uILe/k+neoHoQWT2MP7oNsv41pRRpJoKQ5LZ
	Vv5U4yuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXP2x-00000008IhQ-3gi7;
	Wed, 10 Jun 2026 19:57:07 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXP2v-00000008IeG-03Wt;
	Wed, 10 Jun 2026 19:57:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wXP2p-000000000IG-3tQu;
	Wed, 10 Jun 2026 19:57:00 +0000
Date: Wed, 10 Jun 2026 20:56:57 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 8/8] net: dsa: mt7530: implement port_change_conduit
 op
Message-ID: <91ae0f87a6ca2cce3d072dba548545e02347bf13.1781119435.git.daniel@makrotopia.org>
References: <cover.1781119435.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781119435.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_125705_055796_B466C6D7 
X-CRM114-Status: GOOD (  12.59  )
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

Allow changing the CPU port affinity of user ports at runtime via
the IFLA_DSA_CONDUIT netlink attribute. This updates the port matrix
to forward to the new CPU port instead of the old one.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c96420c291d5..2f3e734b9f53 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3206,6 +3206,34 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int
+mt753x_port_change_conduit(struct dsa_switch *ds, int port,
+			   struct net_device *conduit,
+			   struct netlink_ext_ack *extack)
+{
+	struct dsa_port *new_cpu_dp = conduit->dsa_ptr;
+	struct dsa_port *dp = dsa_to_port(ds, port);
+	struct mt7530_priv *priv = ds->priv;
+
+	if (priv->id != ID_MT7531)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&priv->reg_mutex);
+
+	/* dp->cpu_dp still points to the old CPU port */
+	priv->ports[port].pm &= ~PCR_MATRIX(BIT(dp->cpu_dp->index));
+	priv->ports[port].pm |= PCR_MATRIX(BIT(new_cpu_dp->index));
+	if (priv->ports[port].enable)
+		regmap_update_bits(priv->regmap, MT7530_PCR_P(port),
+				   PCR_MATRIX_MASK, priv->ports[port].pm);
+
+	mutex_unlock(&priv->reg_mutex);
+
+	mt7530_port_fast_age(ds, port);
+
+	return 0;
+}
+
 static void
 mt753x_conduit_state_change(struct dsa_switch *ds,
 			    const struct net_device *conduit,
@@ -3317,6 +3345,7 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.setup			= mt753x_setup,
 	.teardown		= mt753x_teardown,
 	.preferred_default_local_cpu_port = mt753x_preferred_default_local_cpu_port,
+	.port_change_conduit	= mt753x_port_change_conduit,
 	.get_strings		= mt7530_get_strings,
 	.get_ethtool_stats	= mt7530_get_ethtool_stats,
 	.get_sset_count		= mt7530_get_sset_count,
-- 
2.54.0

