Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3314EC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:43:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0094820663
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MrvY8g6E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="C4PUPT5a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0094820663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CSAPOd+1scB/ASognPvZPuXpIPOkuvFu8FfMDO3kjA=; b=MrvY8g6EQt0wLU
	UK6Fb4f+2OXEKrETaVvymny767mhUCvZIcLlrMoiKU70rYFUoRE4RZlkWFwnkdRZJIMN5FXQDzX6A
	MY2HWl+CnUwSAENl30LvGLhVJ3wqJVld8V9kMdsiLs2c6JnUJOgwdcOW6WZFB7JvGADCLH4j0hB9I
	XyinIKSCaW9SfZVL5S+QFSUjPub9JqFxsKZXwshTYqRUMkSzfwO7QCWv8F17CGOGkoF/Iuz3Zkqvl
	avfwJj5rmLes8HBQgEnE966zR0DW6ciM4XX7SS7IN4sMJyh8Q/sSi3dI2H2rJrx0VZABUw1PlUWcD
	hafvypqNis+n9ILdYVnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwGH-0004TH-QB; Mon, 30 Dec 2019 14:43:13 +0000
Received: from mail.dlink.ru ([178.170.168.18] helo=fd.dlink.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwFY-0003vw-GW; Mon, 30 Dec 2019 14:42:30 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 596BE1B21812; Mon, 30 Dec 2019 17:32:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 596BE1B21812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716363; bh=vMMdZPRhhDCtnbuTLqLyjTW+Dv/ebEhvjE+SEn3R/dc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=C4PUPT5aZfqEy+kMGpyrZc5ufQXKbyCgxM7U9mAmBzS8gDrxUVI19cHu+u6DxK4SF
 ejToayX02+FTnft8J8lMXgehX4n9JP1J/GUGg6Ms13QzXNvWeRgEY1xh2sQkpGEgIy
 a3T3fWwmwDRKya9tWVewHt8NCB/ALfqPS/rxGCJ4=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id DD1001B21836;
 Mon, 30 Dec 2019 17:31:39 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru DD1001B21836
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id 6D13F1B229CB;
 Mon, 30 Dec 2019 17:31:37 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:37 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 18/19] net: dsa: tag_qca: split out common tag
 accessors
Date: Mon, 30 Dec 2019 17:30:26 +0300
Message-Id: <20191230143028.27313-19-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_064228_906483_4AF08DCF 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Alexander Lobakin <alobakin@dlink.ru>,
 Yoshiki Komachi <komachi.yoshiki@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Matteo Croce <mcroce@redhat.com>, Edward Cree <ecree@solarflare.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Sean Wang <sean.wang@mediatek.com>, Jiri Pirko <jiri@mellanox.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Paul Blakey <paulb@mellanox.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

...to make them available for the upcoming GRO callbacks.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 net/dsa/tag_qca.c | 45 +++++++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/net/dsa/tag_qca.c b/net/dsa/tag_qca.c
index 8939abce36d7..bee2788e034d 100644
--- a/net/dsa/tag_qca.c
+++ b/net/dsa/tag_qca.c
@@ -28,6 +28,27 @@
 #define QCA_HDR_XMIT_FROM_CPU		BIT(7)
 #define QCA_HDR_XMIT_DP(port)		FIELD_PREP(GENMASK(6, 0), BIT(port))
 
+static inline bool qca_tag_sanity_check(const u8 *data)
+{
+	/* The QCA header is added by the switch between src addr and Ethertype
+	 * At this point, skb->data points to ethertype so header should be
+	 * right before
+	 */
+	u16 hdr = ntohs(*(__be16 *)(data - 2));
+
+	return QCA_HDR_RECV_VERSION(hdr) == QCA_HDR_VERSION;
+}
+
+static inline int qca_tag_source_port(const u8 *data)
+{
+	return *(data - 1) & QCA_HDR_RECV_SOURCE_PORT_MASK;
+}
+
+static inline __be16 qca_tag_encap_proto(const u8 *data)
+{
+	return *(__be16 *)data;
+}
+
 static struct sk_buff *qca_tag_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	const struct dsa_port *dp = dsa_slave_to_port(dev);
@@ -55,34 +76,26 @@ static struct sk_buff *qca_tag_rcv(struct sk_buff *skb, struct net_device *dev,
 				   struct packet_type *pt)
 {
 	int port;
-	__be16 *phdr, hdr;
 
 	if (unlikely(!pskb_may_pull(skb, QCA_HDR_LEN)))
 		return NULL;
 
-	/* The QCA header is added by the switch between src addr and Ethertype
-	 * At this point, skb->data points to ethertype so header should be
-	 * right before
-	 */
-	phdr = (__be16 *)(skb->data - 2);
-	hdr = ntohs(*phdr);
-
 	/* Make sure the version is correct */
-	if (unlikely(QCA_HDR_RECV_VERSION(hdr) != QCA_HDR_VERSION))
+	if (unlikely(!qca_tag_sanity_check(skb->data)))
 		return NULL;
 
-	/* Remove QCA tag and recalculate checksum */
-	skb_pull_rcsum(skb, QCA_HDR_LEN);
-	memmove(skb->data - ETH_HLEN, skb->data - ETH_HLEN - QCA_HDR_LEN,
-		ETH_HLEN - QCA_HDR_LEN);
-
 	/* Get source port information */
-	port = (hdr & QCA_HDR_RECV_SOURCE_PORT_MASK);
+	port = qca_tag_source_port(skb->data);
 
 	skb->dev = dsa_master_find_slave(dev, 0, port);
 	if (!skb->dev)
 		return NULL;
 
+	/* Remove QCA tag and recalculate checksum */
+	skb_pull_rcsum(skb, QCA_HDR_LEN);
+	memmove(skb->data - ETH_HLEN, skb->data - ETH_HLEN - QCA_HDR_LEN,
+		ETH_HLEN - QCA_HDR_LEN);
+
 	return skb;
 }
 
@@ -90,7 +103,7 @@ static void qca_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
 				 int *offset)
 {
 	*offset = QCA_HDR_LEN;
-	*proto = ((__be16 *)skb->data)[0];
+	*proto = qca_tag_encap_proto(skb->data);
 }
 
 static const struct dsa_device_ops qca_netdev_ops = {
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
