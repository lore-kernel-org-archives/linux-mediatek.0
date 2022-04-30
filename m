Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E61AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgdzwoJ8qN5oQBxpy/hi11+6gH8c09d2S7a9/smf36g=; b=3Zl4Z+nS3pntp0
	rGvk8O8q6RVf8cwFjzHVIaJFL8vrmyuUYZ6cDwzd2xvbXktEGscaYN8MEsskgOMANCMk4N9wDgXNW
	+eZa7ThMK//1yl4tQrGSf1pkhhVhULofldEqtLWsLtPB3oLdw4a63x9efqD6oe0j9pLfwg8Dq5Ka4
	gCWoF9UAp0mw6GwBp4eoszmCMe1teRYtt6TXQXjpeqXiVLdrBiSZc7SCno9Oe68ivVaZ6Us17/vTI
	vZh5aTSwapXC6BxdF/eDutSxO5Sl0w3kY1cqLMxPLtePIXu7VQsetktTvG5llrQuu8E9v8AsbOVxN
	MTspQYGUxUvMnyltx0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmmP-00EH9f-PV; Sat, 30 Apr 2022 13:04:57 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmla-00EGh0-L3; Sat, 30 Apr 2022 13:04:08 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id 4DFB640122;
 Sat, 30 Apr 2022 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1651323843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHk/R7XWF+PP9RES1F29YyiBjdrdYn1Yc+tzMfwAjJA=;
 b=vCxDkcs6eswsxcnyS+yAqPvasCUnNMfJ5gexTcIfoMrOHC1VX/Zc8J6atnZxaMSJXyKpJ1
 7BVsXG/GQ9+lcxbSprF1gDUbGUCJY9MKjEGkjkg7Q3pqxdu3RnF8uwCNf0lFt/QBsIL5g2
 FM+AZ/b6JpLDmfIM2a0MKlhQnX/22UA=
Received: from localhost.localdomain (fttx-pool-80.245.72.211.bambit.de
 [80.245.72.211])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 53A1E3600EF;
 Sat, 30 Apr 2022 13:04:02 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [RFC v2 3/4] net: dsa: mt7530: get cpu-port via dp->cpu_dp instead of
 constant
Date: Sat, 30 Apr 2022 15:03:46 +0200
Message-Id: <20220430130347.15190-4-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220430130347.15190-1-linux@fw-web.de>
References: <20220430130347.15190-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mail-ID: decb6aa7-c82c-4968-8d24-776ead25e4c4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_060407_027798_3657E842 
X-CRM114-Status: GOOD (  17.79  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Replace last occurences of hardcoded cpu-port by cpu_dp member of
dsa_port struct.

Now the constant can be dropped.

Suggested-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/dsa/mt7530.c | 27 ++++++++++++++++++++-------
 drivers/net/dsa/mt7530.h |  1 -
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 144c29f8fefc..8bf27937e577 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1033,6 +1033,7 @@ static int
 mt7530_port_enable(struct dsa_switch *ds, int port,
 		   struct phy_device *phy)
 {
+	struct dsa_port *dp = dsa_to_port(ds, port);
 	struct mt7530_priv *priv = ds->priv;
 
 	mutex_lock(&priv->reg_mutex);
@@ -1041,7 +1042,11 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
 	 * restore the port matrix if the port is the member of a certain
 	 * bridge.
 	 */
-	priv->ports[port].pm |= PCR_MATRIX(BIT(MT7530_CPU_PORT));
+	if (dsa_port_is_user(dp)) {
+		struct dsa_port *cpu_dp = dp->cpu_dp;
+
+		priv->ports[port].pm |= PCR_MATRIX(BIT(cpu_dp->index));
+	}
 	priv->ports[port].enable = true;
 	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
 		   priv->ports[port].pm);
@@ -1190,7 +1195,8 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 			struct netlink_ext_ack *extack)
 {
 	struct dsa_port *dp = dsa_to_port(ds, port), *other_dp;
-	u32 port_bitmap = BIT(MT7530_CPU_PORT);
+	struct dsa_port *cpu_dp = dp->cpu_dp;
+	u32 port_bitmap = BIT(cpu_dp->index);
 	struct mt7530_priv *priv = ds->priv;
 
 	mutex_lock(&priv->reg_mutex);
@@ -1267,9 +1273,12 @@ mt7530_port_set_vlan_unaware(struct dsa_switch *ds, int port)
 	 * the CPU port get out of VLAN filtering mode.
 	 */
 	if (all_user_ports_removed) {
-		mt7530_write(priv, MT7530_PCR_P(MT7530_CPU_PORT),
+		struct dsa_port *dp = dsa_to_port(ds, port);
+		struct dsa_port *cpu_dp = dp->cpu_dp;
+
+		mt7530_write(priv, MT7530_PCR_P(cpu_dp->index),
 			     PCR_MATRIX(dsa_user_ports(priv->ds)));
-		mt7530_write(priv, MT7530_PVC_P(MT7530_CPU_PORT), PORT_SPEC_TAG
+		mt7530_write(priv, MT7530_PVC_P(cpu_dp->index), PORT_SPEC_TAG
 			     | PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
 	}
 }
@@ -1307,6 +1316,7 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 			 struct dsa_bridge bridge)
 {
 	struct dsa_port *dp = dsa_to_port(ds, port), *other_dp;
+	struct dsa_port *cpu_dp = dp->cpu_dp;
 	struct mt7530_priv *priv = ds->priv;
 
 	mutex_lock(&priv->reg_mutex);
@@ -1335,8 +1345,8 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 	 */
 	if (priv->ports[port].enable)
 		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
-			   PCR_MATRIX(BIT(MT7530_CPU_PORT)));
-	priv->ports[port].pm = PCR_MATRIX(BIT(MT7530_CPU_PORT));
+			   PCR_MATRIX(BIT(cpu_dp->index)));
+	priv->ports[port].pm = PCR_MATRIX(BIT(cpu_dp->index));
 
 	/* When a port is removed from the bridge, the port would be set up
 	 * back to the default as is at initial boot which is a VLAN-unaware
@@ -1503,6 +1513,9 @@ static int
 mt7530_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
 			   struct netlink_ext_ack *extack)
 {
+	struct dsa_port *dp = dsa_to_port(ds, port);
+	struct dsa_port *cpu_dp = dp->cpu_dp;
+
 	if (vlan_filtering) {
 		/* The port is being kept as VLAN-unaware port when bridge is
 		 * set up with vlan_filtering not being set, Otherwise, the
@@ -1510,7 +1523,7 @@ mt7530_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
 		 * for becoming a VLAN-aware port.
 		 */
 		mt7530_port_set_vlan_aware(ds, port);
-		mt7530_port_set_vlan_aware(ds, MT7530_CPU_PORT);
+		mt7530_port_set_vlan_aware(ds, cpu_dp->index);
 	} else {
 		mt7530_port_set_vlan_unaware(ds, port);
 	}
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 91508e2feef9..5895bcfc0f7d 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -8,7 +8,6 @@
 
 #define MT7530_NUM_PORTS		7
 #define MT7530_NUM_PHYS			5
-#define MT7530_CPU_PORT			6
 #define MT7530_NUM_FDB_RECORDS		2048
 #define MT7530_ALL_MEMBERS		0xff
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
