Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1BCC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:38:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF1A2071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NFwwMyu1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="G/ZMx01H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF1A2071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYWghzwCaJgIjdBCvq6Ns63Q2CyzekRzOBVvzLSPBic=; b=NFwwMyu1s78a+c
	qaamPTzY9mLJFAtUT6IgwFFpFVwIks9HGxlX31zeOTbPcnchf/X1ZnEwwaTLHUWzaeyHW8dVOYUoT
	h8qk0sKglFoSs8g5wR2Y8+/rCoa3++ouRRF5kPzikQ0DSb1NmmMTGaRqKn6LRBrKL+GkWKY2cvnYH
	AltD5EXt8uVMuQh1qLOAbvSfbY7Frc5byedBqGfp6TvG0TxUbnyNsafK/dPQP4s+6+ilmnhn0w+Y+
	KhBkG+gEPlw2raV3Em6D+rG+mmXKeyIbSfEpYYQsvH1jYEkWxHnByMaaFBTASuLNaP2xCVnxGHNLV
	79NEwMhpe49ziunGVT0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwBC-0001Ok-U6; Mon, 30 Dec 2019 14:37:58 +0000
Received: from fd.dlink.ru ([178.170.168.18])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwAj-0000xN-QJ; Mon, 30 Dec 2019 14:37:31 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 0913D1B210C1; Mon, 30 Dec 2019 17:31:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 0913D1B210C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716289; bh=L55d4XdjAtvKL0l9HxmdxPvldFzgURGS4JiXQm8SXdA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=G/ZMx01H4wK1kGPSkQ5hXbnB1LPCUOYawurey2dYWrN4V+lsdHzGjsnCQ6usv61m7
 44kBKmAJmJc/E6klpfzq/IvUguB+Lc+5bL44gy4VTg7gfUFwCiqRxK+J5mtgEuR5mQ
 gXtLyqlqRUqXEIUgU0sImBKvY9rQZEEicFJ/jegs=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id 83F871B20206;
 Mon, 30 Dec 2019 17:31:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 83F871B20206
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id C95A91B229D0;
 Mon, 30 Dec 2019 17:31:03 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:03 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 01/19] net: dsa: make .flow_dissect() callback
 returning void
Date: Mon, 30 Dec 2019 17:30:09 +0300
Message-Id: <20191230143028.27313-2-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_063730_221672_6392FF0C 
X-CRM114-Status: GOOD (  10.52  )
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

There are no tag protocols which return non-zero values from
flow_dissect() callback. Remove it to simplify code and save some
object size.
If a particular tagger can't calculate offset and proto for some
reason, it can simply leave the original values untouched.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 include/net/dsa.h         | 5 ++---
 net/core/flow_dissector.c | 8 ++++----
 net/dsa/tag_dsa.c         | 5 ++---
 net/dsa/tag_edsa.c        | 5 ++---
 net/dsa/tag_mtk.c         | 6 ++----
 net/dsa/tag_qca.c         | 6 ++----
 6 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index da5578db228e..633d9894ab87 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -72,8 +72,8 @@ struct dsa_device_ops {
 	struct sk_buff *(*xmit)(struct sk_buff *skb, struct net_device *dev);
 	struct sk_buff *(*rcv)(struct sk_buff *skb, struct net_device *dev,
 			       struct packet_type *pt);
-	int (*flow_dissect)(const struct sk_buff *skb, __be16 *proto,
-			    int *offset);
+	void (*flow_dissect)(const struct sk_buff *skb, __be16 *proto,
+			     int *offset);
 	/* Used to determine which traffic should match the DSA filter in
 	 * eth_type_trans, and which, if any, should bypass it and be processed
 	 * as regular on the master net device.
@@ -774,4 +774,3 @@ static struct dsa_tag_driver *dsa_tag_driver_array[] =	{		\
 };									\
 module_dsa_tag_drivers(dsa_tag_driver_array)
 #endif
-
diff --git a/net/core/flow_dissector.c b/net/core/flow_dissector.c
index 2dbbb030fbed..2c9d8c7c76b3 100644
--- a/net/core/flow_dissector.c
+++ b/net/core/flow_dissector.c
@@ -971,12 +971,12 @@ bool __skb_flow_dissect(const struct net *net,
 #if IS_ENABLED(CONFIG_NET_DSA)
 		if (unlikely(skb->dev && netdev_uses_dsa(skb->dev) &&
 			     proto == htons(ETH_P_XDSA))) {
-			const struct dsa_device_ops *ops;
+			typeof_member(struct dsa_device_ops, flow_dissect) fd;
 			int offset = 0;
 
-			ops = skb->dev->dsa_ptr->tag_ops;
-			if (ops->flow_dissect &&
-			    !ops->flow_dissect(skb, &proto, &offset)) {
+			fd = skb->dev->dsa_ptr->tag_ops->flow_dissect;
+			if (fd) {
+				fd(skb, &proto, &offset);
 				hlen -= offset;
 				nhoff += offset;
 			}
diff --git a/net/dsa/tag_dsa.c b/net/dsa/tag_dsa.c
index 7ddec9794477..ef15aee58dfc 100644
--- a/net/dsa/tag_dsa.c
+++ b/net/dsa/tag_dsa.c
@@ -142,12 +142,11 @@ static struct sk_buff *dsa_rcv(struct sk_buff *skb, struct net_device *dev,
 	return skb;
 }
 
-static int dsa_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
-				int *offset)
+static void dsa_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
+				 int *offset)
 {
 	*offset = 4;
 	*proto = ((__be16 *)skb->data)[1];
-	return 0;
 }
 
 static const struct dsa_device_ops dsa_netdev_ops = {
diff --git a/net/dsa/tag_edsa.c b/net/dsa/tag_edsa.c
index e8eaa804ccb9..37a99254b411 100644
--- a/net/dsa/tag_edsa.c
+++ b/net/dsa/tag_edsa.c
@@ -161,12 +161,11 @@ static struct sk_buff *edsa_rcv(struct sk_buff *skb, struct net_device *dev,
 	return skb;
 }
 
-static int edsa_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
-				 int *offset)
+static void edsa_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
+				  int *offset)
 {
 	*offset = 8;
 	*proto = ((__be16 *)skb->data)[3];
-	return 0;
 }
 
 static const struct dsa_device_ops edsa_netdev_ops = {
diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index b5705cba8318..c3ad7b7b142a 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -89,13 +89,11 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev,
 	return skb;
 }
 
-static int mtk_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
-				int *offset)
+static void mtk_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
+				 int *offset)
 {
 	*offset = 4;
 	*proto = ((__be16 *)skb->data)[1];
-
-	return 0;
 }
 
 static const struct dsa_device_ops mtk_netdev_ops = {
diff --git a/net/dsa/tag_qca.c b/net/dsa/tag_qca.c
index c95885215525..8e2dbaaffe59 100644
--- a/net/dsa/tag_qca.c
+++ b/net/dsa/tag_qca.c
@@ -90,13 +90,11 @@ static struct sk_buff *qca_tag_rcv(struct sk_buff *skb, struct net_device *dev,
 	return skb;
 }
 
-static int qca_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
-                                int *offset)
+static void qca_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
+				 int *offset)
 {
 	*offset = QCA_HDR_LEN;
 	*proto = ((__be16 *)skb->data)[0];
-
-	return 0;
 }
 
 static const struct dsa_device_ops qca_netdev_ops = {
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
