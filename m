Return-Path: <SRS0=FZAz=HY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8274C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 10:07:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CBC464E20
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 10:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CBC464E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3S2H9VwHczm0Yn6X3n7P929ezvYl4R2LxkYsW9IN9pc=; b=QAe5P3Ta5Ei9VvNe3QPqrJaobm
	tPVHuy2/DyUfXCILapPD5FquuMWnAlMdk+92PstideqKs5IK72B2Bxk8agVP2mBdxbZXS+KuHV8MD
	dRni/6AG1CDqPrfyH3RY4z5SNKZCnV3Lb0pVY2t4/nMVJpX8HyOo075G0szk5150wbL2knvsGzM+P
	GLmWHk6KrkTXOHKg+IIZsGUyKcLe4m11NKUMqCqFiQAmlP6rSOOeyOxUYH4g0LtcFYrz0N+Sy14Td
	Eaq/XCcSP447/x8RnPXKt/z5HXDLFakTvW2JARTb+HeIQrmSWPfm+UIokxXLOQdWCWE1qsqcOXLL8
	otVl7VxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE87u-0004lN-5Q; Mon, 22 Feb 2021 10:07:38 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE87p-0004kS-At; Mon, 22 Feb 2021 10:07:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id ba1so7438206plb.1;
 Mon, 22 Feb 2021 02:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Udsk+z6S+lmul3ghhLaA1MmOuPDaJpmhE/2DZlIxpH4=;
 b=TEF49KVVMWNsLlswBqRlelynbivwsoSQOJvdti1iBz7y6wQSK+YDDUw6N4qTsngxyt
 aFvJY+ZF5jdgwGyL+J3+jbU02AS2rhGBMNhh7gqN4bKz+Ich0CxQfhA1FzTueW4I5SdH
 pVxLvRZL6iXiYSXhIWmJ2VdvZ7dAPACvaCK8TvhgwM8aeScdsFZSJ/ij9e1nF6k/y6X/
 YguC69OdU9rEMwAzGU17PaiiJCODVTzNu5HJ7SkbZpP1DrKil3WaH4Y62fK29Hvg2iGV
 kBNAm4xvTucYXOClAerpJg4T4ah3fuMktt8PlS0uv+0hhCKaYgDUmlMfHUkf6mguLsUr
 MR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Udsk+z6S+lmul3ghhLaA1MmOuPDaJpmhE/2DZlIxpH4=;
 b=lz66QMCul3qiwrj3D0pfd/3ocB1bVuShShKWE6rRpMTDgDdDMfccCHLDgqzMOP6fnt
 12GbLw21Erp7H/a5u+/sYeV+0moD/dZTJ5VjefGyHNq2oHFQ3hpYnzu902Ojvjw4WU8V
 ounwGLAB1D3lz9pvK6Pnk5n0XasxF3YnGeU2Xv1/ERIp8UdnRZykGf1Bw6Riu7eCpIZc
 8P7z05Ony5R1i+8REpu/fxvzA6dpZj0krgJc1sY0+BRiX+cYEbtapXoYjaZhe/SITmdg
 cwLhaBct9zUbJM4NaojfqAoApN1zYOSS+KTyK/pfLQ8Eq6zRta8PlCAH4FTKvvYQHQps
 aMeA==
X-Gm-Message-State: AOAM533ZoTiLj6zJx4SZY7w8qFGtAyNC8jL4/J6tbjh7UCyTOA6Kxnsc
 qhDjEIXNiOvuReFVeGUI90g=
X-Google-Smtp-Source: ABdhPJyrTvPPv2k+hYwKfxlUJ73L09piHJhfK1M3zTlfpoK9V1u1YJefTgwbbsb+YFs9kfD1kV94qQ==
X-Received: by 2002:a17:902:ba91:b029:e3:fe6d:505c with SMTP id
 k17-20020a170902ba91b02900e3fe6d505cmr2630491pls.7.1613988451310; 
 Mon, 22 Feb 2021 02:07:31 -0800 (PST)
Received: from container-ubuntu.lan ([171.211.28.185])
 by smtp.gmail.com with ESMTPSA id ch14sm9317902pjb.22.2021.02.22.02.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 02:07:30 -0800 (PST)
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
Subject: [PATCH net-next v2] net: dsa: mt7530: support MDB operations
Date: Mon, 22 Feb 2021 18:07:17 +0800
Message-Id: <20210222100717.451-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_050733_418421_6800B70E 
X-CRM114-Status: GOOD (  15.22  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support port MDB add to/delete from MT7530 ARL.

As the hardware can manage multicast forwarding itself, trapping
multicast traffic to the CPU is no longer required.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
v1 -> v2: fix commit message

 drivers/net/dsa/mt7530.c | 58 +++++++++++++++++++++++++++++++++++++---
 net/dsa/tag_mtk.c        | 14 +---------
 2 files changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 28aab0ff6e7d..20e66cf13485 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1000,9 +1000,6 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	mt7530_write(priv, MT7530_PVC_P(port),
 		     PORT_SPEC_TAG);
 
-	/* Unknown multicast frame forwarding to the cpu port */
-	mt7530_rmw(priv, MT7530_MFC, UNM_FFP_MASK, UNM_FFP(BIT(port)));
-
 	/* Set CPU port number */
 	if (priv->id == ID_MT7621)
 		mt7530_rmw(priv, MT7530_MFC, CPU_MASK, CPU_EN | CPU_PORT(port));
@@ -1365,6 +1362,59 @@ mt7530_port_fdb_dump(struct dsa_switch *ds, int port,
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
@@ -3403,6 +3453,8 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_fdb_add		= mt7530_port_fdb_add,
 	.port_fdb_del		= mt7530_port_fdb_del,
 	.port_fdb_dump		= mt7530_port_fdb_dump,
+	.port_mdb_add		= mt7530_port_mdb_add,
+	.port_mdb_del		= mt7530_port_mdb_del,
 	.port_vlan_filtering	= mt7530_port_vlan_filtering,
 	.port_vlan_add		= mt7530_port_vlan_add,
 	.port_vlan_del		= mt7530_port_vlan_del,
diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index 38dcdded74c0..53b620e177ad 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -23,9 +23,6 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 	struct dsa_port *dp = dsa_slave_to_port(dev);
 	u8 *mtk_tag;
 	bool is_vlan_skb = true;
-	unsigned char *dest = eth_hdr(skb)->h_dest;
-	bool is_multicast_skb = is_multicast_ether_addr(dest) &&
-				!is_broadcast_ether_addr(dest);
 
 	/* Build the special tag after the MAC Source Address. If VLAN header
 	 * is present, it's required that VLAN header and special tag is
@@ -48,10 +45,6 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 		     MTK_HDR_XMIT_UNTAGGED;
 	mtk_tag[1] = (1 << dp->index) & MTK_HDR_XMIT_DP_BIT_MASK;
 
-	/* Disable SA learning for multicast frames */
-	if (unlikely(is_multicast_skb))
-		mtk_tag[1] |= MTK_HDR_XMIT_SA_DIS;
-
 	/* Tag control information is kept for 802.1Q */
 	if (!is_vlan_skb) {
 		mtk_tag[2] = 0;
@@ -67,9 +60,6 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev,
 	u16 hdr;
 	int port;
 	__be16 *phdr;
-	unsigned char *dest = eth_hdr(skb)->h_dest;
-	bool is_multicast_skb = is_multicast_ether_addr(dest) &&
-				!is_broadcast_ether_addr(dest);
 
 	if (unlikely(!pskb_may_pull(skb, MTK_HDR_LEN)))
 		return NULL;
@@ -95,9 +85,7 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev,
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
