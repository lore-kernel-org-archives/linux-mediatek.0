Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68278C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 17:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zxyyte3ZV9sQzWsj3h47baU1T3B9xI8iY4bwc6fRj2M=; b=tq8dgye3D+fVRx
	YU613h3PW2C0Dh5Le/dn8L+kUnLofuMWVtvTCgPdPCpPESubbNtO+6Pqjc78vZsadrh/4CLAuSfqJ
	h4fK5jQGir5yuEzI1KQMxNjSjtVUEwtWv2F8dtnj4ekcPlg/haoRZ380pOy2ERRFiDgX5MW29S5xQ
	tEYChki5WPXVP0ExHljdXLnlYabQbY1Dc05gq+X+QW8ByLvYRT8ptO4fuwQhfx+FarcMx+kZNDH8w
	/uUwpAQPH+lhriHB+OX89THTAZEgj9HHN17bEHbKXOwdDWY8Q83BVBow4av0etsJrWSiFGkJiagP/
	om+SNUpSS2nxZdYLwbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzi6b-0094CV-O6; Fri, 10 Jun 2022 17:07:29 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzi5N-0093Tj-Hu; Fri, 10 Jun 2022 17:06:16 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id E0E68402D7;
	Fri, 10 Jun 2022 17:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1654880772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uLlva8Emcc5RehlfDPvdMknMWn6EeajUkWuEMhCA/yw=;
	b=MYF4NpavEXZUGNrlPUnY4d7VCGpcE+cCV1AJmIXmkPAFkEik6n9g5Rpl/QvrxjJXDVJM9w
	EqMqKFYe18nc7NVPPmF4alYGD3yxTxlaqqqFOdDUSjPCB7buEAU1Dm0WM/CEvk60A7GPs1
	JWJioWOeUjn1luaNGn0eBgLYxWNmpeY=
Received: from frank-G5.. (fttx-pool-217.61.154.155.bambit.de [217.61.154.155])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 76410100394;
	Fri, 10 Jun 2022 17:06:10 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 4/6] net: dsa: mt7530: get cpu-port via dp->cpu_dp instead of constant
Date: Fri, 10 Jun 2022 19:05:39 +0200
Message-Id: <20220610170541.8643-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220610170541.8643-1-linux@fw-web.de>
References: <20220610170541.8643-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mail-ID: 8b3b788e-848e-4a56-8530-0d42429e9387
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_100613_929632_25D37974 
X-CRM114-Status: GOOD (  18.42  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
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
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/mt7530.c | 27 ++++++++++++++++++++-------
 drivers/net/dsa/mt7530.h |  1 -
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9c14e46692ee..835807911be0 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1038,6 +1038,7 @@ static int
 mt7530_port_enable(struct dsa_switch *ds, int port,
 		   struct phy_device *phy)
 {
+	struct dsa_port *dp = dsa_to_port(ds, port);
 	struct mt7530_priv *priv = ds->priv;
 
 	mutex_lock(&priv->reg_mutex);
@@ -1046,7 +1047,11 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
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
@@ -1195,7 +1200,8 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 			struct netlink_ext_ack *extack)
 {
 	struct dsa_port *dp = dsa_to_port(ds, port), *other_dp;
-	u32 port_bitmap = BIT(MT7530_CPU_PORT);
+	struct dsa_port *cpu_dp = dp->cpu_dp;
+	u32 port_bitmap = BIT(cpu_dp->index);
 	struct mt7530_priv *priv = ds->priv;
 
 	mutex_lock(&priv->reg_mutex);
@@ -1272,9 +1278,12 @@ mt7530_port_set_vlan_unaware(struct dsa_switch *ds, int port)
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
@@ -1312,6 +1321,7 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 			 struct dsa_bridge bridge)
 {
 	struct dsa_port *dp = dsa_to_port(ds, port), *other_dp;
+	struct dsa_port *cpu_dp = dp->cpu_dp;
 	struct mt7530_priv *priv = ds->priv;
 
 	mutex_lock(&priv->reg_mutex);
@@ -1340,8 +1350,8 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 	 */
 	if (priv->ports[port].enable)
 		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
-			   PCR_MATRIX(BIT(MT7530_CPU_PORT)));
-	priv->ports[port].pm = PCR_MATRIX(BIT(MT7530_CPU_PORT));
+			   PCR_MATRIX(BIT(cpu_dp->index)));
+	priv->ports[port].pm = PCR_MATRIX(BIT(cpu_dp->index));
 
 	/* When a port is removed from the bridge, the port would be set up
 	 * back to the default as is at initial boot which is a VLAN-unaware
@@ -1508,6 +1518,9 @@ static int
 mt7530_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
 			   struct netlink_ext_ack *extack)
 {
+	struct dsa_port *dp = dsa_to_port(ds, port);
+	struct dsa_port *cpu_dp = dp->cpu_dp;
+
 	if (vlan_filtering) {
 		/* The port is being kept as VLAN-unaware port when bridge is
 		 * set up with vlan_filtering not being set, Otherwise, the
@@ -1515,7 +1528,7 @@ mt7530_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
 		 * for becoming a VLAN-aware port.
 		 */
 		mt7530_port_set_vlan_aware(ds, port);
-		mt7530_port_set_vlan_aware(ds, MT7530_CPU_PORT);
+		mt7530_port_set_vlan_aware(ds, cpu_dp->index);
 	} else {
 		mt7530_port_set_vlan_unaware(ds, port);
 	}
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 71e36b69b96d..e509af95c354 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -8,7 +8,6 @@
 
 #define MT7530_NUM_PORTS		7
 #define MT7530_NUM_PHYS			5
-#define MT7530_CPU_PORT			6
 #define MT7530_NUM_FDB_RECORDS		2048
 #define MT7530_ALL_MEMBERS		0xff
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
