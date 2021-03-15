Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CE3C4332E
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 17:10:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8AC61494
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 17:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA8AC61494
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=39gO4x/72LYJRQXuzCXRP9/iWhXtbVd0RVYBHKw0pyo=; b=Z1U1TGoWDirpdIAflIStXTsPpM
	Ru9BMKMlVyUxrGR/haOAVVItXzpD2fnbBU2KY5HYlczXXvHrivCZ+As/CRe+pdpSHNFilw7pSzYHq
	ysxfD/dH1w+GazB88OYS8agd8HZwhalsi2/NNvMCWWQib76a3NKGB9klhVkTwu9Zgphcv0XdDtq0M
	G1nZpq9oVEr3hshXojIWJ7xLQRm1BYUJng1Qqhile+sRm/0TXojTFvFOsggQ1jyTmTHbWAmp5Be1g
	MOsuWW+bpVDrx7ggGL6JXLSSxXrDDk5UgcaltzDoShyseKj+i/uZrWwCpPhIjx1lhiW+RkK0L99bm
	Kj/XRsCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLqjT-00GT6w-V3; Mon, 15 Mar 2021 17:10:20 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLqj1-00GT1X-4y; Mon, 15 Mar 2021 17:09:59 +0000
Received: by mail-pj1-x1029.google.com with SMTP id t18so9142735pjs.3;
 Mon, 15 Mar 2021 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gVx9Pv6PF+gvg4bUX5R/A8d5/YPrI5l7pmHtd3cE+qE=;
 b=QeuiYMZQbXOp1ZPqMRl0R797j0LbFfYcmg55F/EhdPYt/+GYF6XrcfEYGCI2/6kiN3
 oy5J6pK1YcjaziwXvDZufwJ3dRJfO1MPrULpPBs/o5VCzZ28cZ6ttAKaFRLkGrwj+aNe
 1sSLd/N7yTtGPUmXMHWdKN/6107JrnjuYC9/yBm5FHULCkQzGMgRzTVc+pRNxUPJyoN0
 o4/8hHjW0YH3+YVE5qJfIlE617ouI+3GDsa2/MzD2Uy7Wbzfbko5C41ppZU7jjPnWF4R
 V6gO1vcxNQxCOgQzQ2ymcDKHRw0HeqVSWyS2IawMu0orn3EjR43yXn6FhYYwU+3mqWMU
 d6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gVx9Pv6PF+gvg4bUX5R/A8d5/YPrI5l7pmHtd3cE+qE=;
 b=OUmKKoMZE2Y7Hs5foqIA3HELm/ypAbg9+6dLGj4Pq/kjCl760260l9W5R3/DClnDds
 ii38RuLn39fa5Ys7vSa52yPKPzHxfmU1V5bUbEA2Qn8pSJVzQIq+kxvI+cWKiU+a9MT0
 wmpSkspaAWaZzBokn0CE57mHcD39yZP8KlGHzwKfkft7igK+/0a98JzCzCGKAo+I3cGP
 KdXB4gxPT+D7TC81PoUEmSEhUZBDzoB3Ktql8QB75USbWnQUPi5P6lT4DQImEkLG9N29
 sUxbXurtIGnoZ+QAOF6Ot4aFFEzWDDK52C2HSO1A142a0EjyAmLiondk9URdq49oOPeD
 PaPQ==
X-Gm-Message-State: AOAM5329VqIYZTMO1RICQct9QrWudXj5ggZ7j5IkdVflsJaEh+eE69ZM
 1JDm8Rbxd/OXOk/C/bhZtU4=
X-Google-Smtp-Source: ABdhPJywCavdQIXmIQDkguNJ+qt5BapJfqmaDbzyt7G1QhVz3ck1507LWgBrfyNKqGtjgVxyo8SrSg==
X-Received: by 2002:a17:902:aa0c:b029:e5:da5f:5f66 with SMTP id
 be12-20020a170902aa0cb02900e5da5f5f66mr12798299plb.81.1615828188892; 
 Mon, 15 Mar 2021 10:09:48 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id 186sm15221799pfb.143.2021.03.15.10.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:09:48 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net-next] net: dsa: mt7530: support MDB and bridge flag
 operations
Date: Tue, 16 Mar 2021 01:09:40 +0800
Message-Id: <20210315170940.2414854-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_170951_474702_3A776F6E 
X-CRM114-Status: GOOD (  17.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support port MDB and bridge flag operations.

As the hardware can manage multicast forwarding itself, offload_fwd_mark
can be unconditionally set to true.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
Changes since RFC:
  Replaced BR_AUTO_MASK with BR_FLOOD | BR_LEARNING

 drivers/net/dsa/mt7530.c | 124 +++++++++++++++++++++++++++++++++++++--
 drivers/net/dsa/mt7530.h |   1 +
 net/dsa/tag_mtk.c        |  14 +----
 3 files changed, 122 insertions(+), 17 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2342d4528b4c..f765984330c9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1000,8 +1000,9 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	mt7530_write(priv, MT7530_PVC_P(port),
 		     PORT_SPEC_TAG);
 
-	/* Unknown multicast frame forwarding to the cpu port */
-	mt7530_rmw(priv, MT7530_MFC, UNM_FFP_MASK, UNM_FFP(BIT(port)));
+	/* Disable flooding by default */
+	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
+		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
 
 	/* Set CPU port number */
 	if (priv->id == ID_MT7621)
@@ -1138,6 +1139,56 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
 	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK, stp_state);
 }
 
+static int
+mt7530_port_pre_bridge_flags(struct dsa_switch *ds, int port,
+			     struct switchdev_brport_flags flags,
+			     struct netlink_ext_ack *extack)
+{
+	if (flags.mask & ~(BR_LEARNING | BR_FLOOD | BR_MCAST_FLOOD |
+			   BR_BCAST_FLOOD))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int
+mt7530_port_bridge_flags(struct dsa_switch *ds, int port,
+			 struct switchdev_brport_flags flags,
+			 struct netlink_ext_ack *extack)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	if (flags.mask & BR_LEARNING)
+		mt7530_rmw(priv, MT7530_PSC_P(port), SA_DIS,
+			   flags.val & BR_LEARNING ? 0 : SA_DIS);
+
+	if (flags.mask & BR_FLOOD)
+		mt7530_rmw(priv, MT7530_MFC, UNU_FFP(BIT(port)),
+			   flags.val & BR_FLOOD ? UNU_FFP(BIT(port)) : 0);
+
+	if (flags.mask & BR_MCAST_FLOOD)
+		mt7530_rmw(priv, MT7530_MFC, UNM_FFP(BIT(port)),
+			   flags.val & BR_MCAST_FLOOD ? UNM_FFP(BIT(port)) : 0);
+
+	if (flags.mask & BR_BCAST_FLOOD)
+		mt7530_rmw(priv, MT7530_MFC, BC_FFP(BIT(port)),
+			   flags.val & BR_BCAST_FLOOD ? BC_FFP(BIT(port)) : 0);
+
+	return 0;
+}
+
+static int
+mt7530_port_set_mrouter(struct dsa_switch *ds, int port, bool mrouter,
+			struct netlink_ext_ack *extack)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	mt7530_rmw(priv, MT7530_MFC, UNM_FFP(BIT(port)),
+		   mrouter ? UNM_FFP(BIT(port)) : 0);
+
+	return 0;
+}
+
 static int
 mt7530_port_bridge_join(struct dsa_switch *ds, int port,
 			struct net_device *bridge)
@@ -1349,6 +1400,59 @@ mt7530_port_fdb_dump(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int
+mt7530_port_mdb_add(struct dsa_switch *ds, int port,
+		    const struct switchdev_obj_port_mdb *mdb)
+{
+	struct mt7530_priv *priv = ds->priv;
+	const u8 *addr = mdb->addr;
+	u16 vid = mdb->vid;
+	u8 port_mask = 0;
+	int ret;
+
+	mutex_lock(&priv->reg_mutex);
+
+	mt7530_fdb_write(priv, vid, 0, addr, 0, STATIC_EMP);
+	if (!mt7530_fdb_cmd(priv, MT7530_FDB_READ, NULL))
+		port_mask = (mt7530_read(priv, MT7530_ATRD) >> PORT_MAP)
+			    & PORT_MAP_MASK;
+
+	port_mask |= BIT(port);
+	mt7530_fdb_write(priv, vid, port_mask, addr, -1, STATIC_ENT);
+	ret = mt7530_fdb_cmd(priv, MT7530_FDB_WRITE, NULL);
+
+	mutex_unlock(&priv->reg_mutex);
+
+	return ret;
+}
+
+static int
+mt7530_port_mdb_del(struct dsa_switch *ds, int port,
+		    const struct switchdev_obj_port_mdb *mdb)
+{
+	struct mt7530_priv *priv = ds->priv;
+	const u8 *addr = mdb->addr;
+	u16 vid = mdb->vid;
+	u8 port_mask = 0;
+	int ret;
+
+	mutex_lock(&priv->reg_mutex);
+
+	mt7530_fdb_write(priv, vid, 0, addr, 0, STATIC_EMP);
+	if (!mt7530_fdb_cmd(priv, MT7530_FDB_READ, NULL))
+		port_mask = (mt7530_read(priv, MT7530_ATRD) >> PORT_MAP)
+			    & PORT_MAP_MASK;
+
+	port_mask &= ~BIT(port);
+	mt7530_fdb_write(priv, vid, port_mask, addr, -1,
+			 port_mask ? STATIC_ENT : STATIC_EMP);
+	ret = mt7530_fdb_cmd(priv, MT7530_FDB_WRITE, NULL);
+
+	mutex_unlock(&priv->reg_mutex);
+
+	return ret;
+}
+
 static int
 mt7530_vlan_cmd(struct mt7530_priv *priv, enum mt7530_vlan_cmd cmd, u16 vid)
 {
@@ -2492,9 +2596,13 @@ mt7530_setup(struct dsa_switch *ds)
 			ret = mt753x_cpu_port_enable(ds, i);
 			if (ret)
 				return ret;
-		} else
+		} else {
 			mt7530_port_disable(ds, i);
 
+			/* Disable learning by default on all user ports */
+			mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
+		}
+
 		/* Enable consistent egress tag */
 		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
 			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
@@ -2656,9 +2764,12 @@ mt7531_setup(struct dsa_switch *ds)
 			ret = mt753x_cpu_port_enable(ds, i);
 			if (ret)
 				return ret;
-		} else
+		} else {
 			mt7530_port_disable(ds, i);
 
+			/* Disable learning by default on all user ports */
+			mt7530_set(priv, MT7530_PSC_P(i), SA_DIS);
+		}
 		/* Enable consistent egress tag */
 		mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
 			   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
@@ -3385,11 +3496,16 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_change_mtu	= mt7530_port_change_mtu,
 	.port_max_mtu		= mt7530_port_max_mtu,
 	.port_stp_state_set	= mt7530_stp_state_set,
+	.port_pre_bridge_flags	= mt7530_port_pre_bridge_flags,
+	.port_bridge_flags	= mt7530_port_bridge_flags,
+	.port_set_mrouter	= mt7530_port_set_mrouter,
 	.port_bridge_join	= mt7530_port_bridge_join,
 	.port_bridge_leave	= mt7530_port_bridge_leave,
 	.port_fdb_add		= mt7530_port_fdb_add,
 	.port_fdb_del		= mt7530_port_fdb_del,
 	.port_fdb_dump		= mt7530_port_fdb_dump,
+	.port_mdb_add		= mt7530_port_mdb_add,
+	.port_mdb_del		= mt7530_port_mdb_del,
 	.port_vlan_filtering	= mt7530_port_vlan_filtering,
 	.port_vlan_add		= mt7530_port_vlan_add,
 	.port_vlan_del		= mt7530_port_vlan_del,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index e4a4c8d1fbc8..fd7b66776c4e 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -34,6 +34,7 @@ enum mt753x_id {
 /* Registers to mac forward control for unknown frames */
 #define MT7530_MFC			0x10
 #define  BC_FFP(x)			(((x) & 0xff) << 24)
+#define  BC_FFP_MASK			BC_FFP(~0)
 #define  UNM_FFP(x)			(((x) & 0xff) << 16)
 #define  UNM_FFP_MASK			UNM_FFP(~0)
 #define  UNU_FFP(x)			(((x) & 0xff) << 8)
diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index 59748487664f..f9b2966d1936 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -24,9 +24,6 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 	struct dsa_port *dp = dsa_slave_to_port(dev);
 	u8 xmit_tpid;
 	u8 *mtk_tag;
-	unsigned char *dest = eth_hdr(skb)->h_dest;
-	bool is_multicast_skb = is_multicast_ether_addr(dest) &&
-				!is_broadcast_ether_addr(dest);
 
 	/* Build the special tag after the MAC Source Address. If VLAN header
 	 * is present, it's required that VLAN header and special tag is
@@ -55,10 +52,6 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 	mtk_tag[0] = xmit_tpid;
 	mtk_tag[1] = (1 << dp->index) & MTK_HDR_XMIT_DP_BIT_MASK;
 
-	/* Disable SA learning for multicast frames */
-	if (unlikely(is_multicast_skb))
-		mtk_tag[1] |= MTK_HDR_XMIT_SA_DIS;
-
 	/* Tag control information is kept for 802.1Q */
 	if (xmit_tpid == MTK_HDR_XMIT_UNTAGGED) {
 		mtk_tag[2] = 0;
@@ -74,9 +67,6 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev,
 	u16 hdr;
 	int port;
 	__be16 *phdr;
-	unsigned char *dest = eth_hdr(skb)->h_dest;
-	bool is_multicast_skb = is_multicast_ether_addr(dest) &&
-				!is_broadcast_ether_addr(dest);
 
 	if (unlikely(!pskb_may_pull(skb, MTK_HDR_LEN)))
 		return NULL;
@@ -102,9 +92,7 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev,
 	if (!skb->dev)
 		return NULL;
 
-	/* Only unicast or broadcast frames are offloaded */
-	if (likely(!is_multicast_skb))
-		skb->offload_fwd_mark = 1;
+	skb->offload_fwd_mark = 1;
 
 	return skb;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
