Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442ACC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyrG+wdMwG3tEnB297H5jomua+CxIp/Y7DT6v/MHhuk=; b=KFUKbRBD2xdPDf
	Lo2y02Z4EaRcS61Zyh3WruaGkVUmSa99HBrZrxmFrSH3JvkVw3AfCRhTOU80Fo6rdgI8V1ogZ4zmj
	f9L1UsImR2Am8W2KMOxr1sAKhuPyvm48zc4mvZYJrnzxSFC7OArvQoF+Q9/PCXqz/xQaUxYeqewa1
	op9B8IbQVt42pSJt5IPDeBZD+0RaXFA4027CJL8g/u5r4iNobwp/6EiY1VlzBXRB2M3iKRGIVq2BR
	p79D89puAnXY7+2tNgkCA5jJ9OZeJE1u9xUVqtKBCVYTtgN96g4mp9H1qB48aXqdY3iaSPJUGrCNt
	TC70hgdA1qvu6vo8OYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzi5x-0093p0-At; Fri, 10 Jun 2022 17:06:49 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzi5N-0093TN-L6; Fri, 10 Jun 2022 17:06:16 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 689A7402BE;
	Fri, 10 Jun 2022 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1654880769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OiDXiX3+ohOSCGU9q1Sj2B+8XnWjxvtMqaz4HJgYSs=;
	b=XmJOFNXHvm0O9R/yZJ3s+zkpaajgyYfcSEhlMPgj87WKLVKmRJAkcl1f12yVTNMyAdJpQx
	qqQw78dd3G2EunxEcisMrknH9NigjWBLFDIIUzouHuuJzijXcbZYvcHs8FN8w+vLkJ+AI5
	x8uTV/ywYM19uPBJaJGGHQdT80MuKvs=
Received: from frank-G5.. (fttx-pool-217.61.154.155.bambit.de [217.61.154.155])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id ED07B100863;
	Fri, 10 Jun 2022 17:06:07 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 2/6] net: dsa: mt7530: rework mt7530_hw_vlan_{add,del}
Date: Fri, 10 Jun 2022 19:05:37 +0200
Message-Id: <20220610170541.8643-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220610170541.8643-1-linux@fw-web.de>
References: <20220610170541.8643-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mail-ID: 4aec4d63-e3d2-46a1-a6e3-ac451d837153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_100613_888967_18CBD874 
X-CRM114-Status: GOOD (  17.16  )
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

Rework vlan_add/vlan_del functions in preparation for dynamic cpu port.

Currently BIT(MT7530_CPU_PORT) is added to new_members, even though
mt7530_port_vlan_add() will be called on the CPU port too.

Let DSA core decide when to call port_vlan_add for the CPU port, rather
than doing it implicitly.

We can do autonomous forwarding in a certain VLAN, but not add br0 to that
VLAN and avoid flooding the CPU with those packets, if software knows it
doesn't need to process them.

Suggested-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v2: new patch
---
 drivers/net/dsa/mt7530.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b02d823d497..c1922eaba67a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1527,11 +1527,11 @@ static void
 mt7530_hw_vlan_add(struct mt7530_priv *priv,
 		   struct mt7530_hw_vlan_entry *entry)
 {
+	struct dsa_port *dp = dsa_to_port(priv->ds, entry->port);
 	u8 new_members;
 	u32 val;
 
-	new_members = entry->old_members | BIT(entry->port) |
-		      BIT(MT7530_CPU_PORT);
+	new_members = entry->old_members | BIT(entry->port);
 
 	/* Validate the entry with independent learning, create egress tag per
 	 * VLAN and joining the port as one of the port members.
@@ -1542,22 +1542,20 @@ mt7530_hw_vlan_add(struct mt7530_priv *priv,
 
 	/* Decide whether adding tag or not for those outgoing packets from the
 	 * port inside the VLAN.
-	 */
-	val = entry->untagged ? MT7530_VLAN_EGRESS_UNTAG :
-				MT7530_VLAN_EGRESS_TAG;
-	mt7530_rmw(priv, MT7530_VAWD2,
-		   ETAG_CTRL_P_MASK(entry->port),
-		   ETAG_CTRL_P(entry->port, val));
-
-	/* CPU port is always taken as a tagged port for serving more than one
+	 * CPU port is always taken as a tagged port for serving more than one
 	 * VLANs across and also being applied with egress type stack mode for
 	 * that VLAN tags would be appended after hardware special tag used as
 	 * DSA tag.
 	 */
+	if (dsa_port_is_cpu(dp))
+		val = MT7530_VLAN_EGRESS_STACK;
+	else if (entry->untagged)
+		val = MT7530_VLAN_EGRESS_UNTAG;
+	else
+		val = MT7530_VLAN_EGRESS_TAG;
 	mt7530_rmw(priv, MT7530_VAWD2,
-		   ETAG_CTRL_P_MASK(MT7530_CPU_PORT),
-		   ETAG_CTRL_P(MT7530_CPU_PORT,
-			       MT7530_VLAN_EGRESS_STACK));
+		   ETAG_CTRL_P_MASK(entry->port),
+		   ETAG_CTRL_P(entry->port, val));
 }
 
 static void
@@ -1576,11 +1574,7 @@ mt7530_hw_vlan_del(struct mt7530_priv *priv,
 		return;
 	}
 
-	/* If certain member apart from CPU port is still alive in the VLAN,
-	 * the entry would be kept valid. Otherwise, the entry is got to be
-	 * disabled.
-	 */
-	if (new_members && new_members != BIT(MT7530_CPU_PORT)) {
+	if (new_members) {
 		val = IVL_MAC | VTAG_EN | PORT_MEM(new_members) |
 		      VLAN_VALID;
 		mt7530_write(priv, MT7530_VAWD1, val);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
