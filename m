Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F68AC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:43:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 518B12071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NvT6O7lo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="pVeNl+Pv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 518B12071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqDxjmcjMa2ySoBSO/X6nqbMFBZUY6EKjVkiF/9/DDU=; b=NvT6O7lo7bOzWC
	BbAPbOeFhfi6CIo8imU4gpdoLJtvQAESmCxSzoYHkfMLJgUuR2RYtqilDWfgZtUlFcVLGSzBFGhXF
	W000xrYK9CQxYU/WXBxYxY2KnEKFh5z9tWl6nq3T4b5GBx14x7i2w+oMpGyizrcazj/1DSe88usOa
	XD2gyAnMtcuYIHYi2kFFOYJqRu2LxQ4INzYSruawJdcXd7ErcaIUcfsfs0uqWhfAzfpqU8deXqFip
	RVh8hmm9/t4QYwUwUMNuBDJMBq52Uy4y6BvCjvbapHVvtk9OnG9qAlcVAO18JJIE2tnPjB9MMEOPe
	RMcSR+HAcyJO/YhbP/Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwGE-0004RH-Lx; Mon, 30 Dec 2019 14:43:10 +0000
Received: from mail.dlink.ru ([178.170.168.18] helo=fd.dlink.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwFY-0003vp-EY; Mon, 30 Dec 2019 14:42:30 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 027DC1B219A8; Mon, 30 Dec 2019 17:33:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 027DC1B219A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716428; bh=omc8QrcNvP8pME1zDqBdaSM8dT/TdIR/78ZE/IJu6BE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=pVeNl+Pvn4Yrzl89PReZ1MU+3rtkWE6p2QPhpzLcOjHUrlJ5bR93xJjnPnsswJH+1
 KdGgHRB0aNYEe98P84mc/T2kDlJ0XlRXUDKaumqX2OeUp31bMrDUvJY5ZONyQthfnB
 wMevs+aXuuptlgPhHYlCDzymqq3mrta5FiPoVCrE=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id 041281B21829;
 Mon, 30 Dec 2019 17:31:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 041281B21829
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id 3A52F1B229CB;
 Mon, 30 Dec 2019 17:31:29 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:29 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 14/19] net: dsa: tag_mtk: split out common tag
 accessors
Date: Mon, 30 Dec 2019 17:30:22 +0300
Message-Id: <20191230143028.27313-15-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_064228_852051_57D57C81 
X-CRM114-Status: GOOD (  11.16  )
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

Misc: fix identation of MTK_HDR_LEN and make use of it in
mtk_tag_flow_dissect() instead of open-coded value.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 net/dsa/tag_mtk.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index c3ad7b7b142a..b926ffdf5fb5 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -10,12 +10,27 @@
 
 #include "dsa_priv.h"
 
-#define MTK_HDR_LEN		4
+#define MTK_HDR_LEN			4
 #define MTK_HDR_XMIT_UNTAGGED		0
 #define MTK_HDR_XMIT_TAGGED_TPID_8100	1
 #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
 #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
 
+static inline int mtk_tag_source_port(const u8 *data)
+{
+	/* The MTK header is added by the switch between src addr
+	 * and ethertype at this point, skb->data points to 2 bytes
+	 * after src addr so header should be 2 bytes right before.
+	 * The source port field is in the second byte of the tag.
+	 */
+	return *(data - 1) & MTK_HDR_RECV_SOURCE_PORT_MASK;
+}
+
+static inline __be16 mtk_tag_encap_proto(const u8 *data)
+{
+	return *(__be16 *)(data + 2);
+}
+
 static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 				    struct net_device *dev)
 {
@@ -60,17 +75,15 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev,
 				   struct packet_type *pt)
 {
 	int port;
-	__be16 *phdr, hdr;
 
 	if (unlikely(!pskb_may_pull(skb, MTK_HDR_LEN)))
 		return NULL;
 
-	/* The MTK header is added by the switch between src addr
-	 * and ethertype at this point, skb->data points to 2 bytes
-	 * after src addr so header should be 2 bytes right before.
-	 */
-	phdr = (__be16 *)(skb->data - 2);
-	hdr = ntohs(*phdr);
+	port = mtk_tag_source_port(skb->data);
+
+	skb->dev = dsa_master_find_slave(dev, 0, port);
+	if (!skb->dev)
+		return NULL;
 
 	/* Remove MTK tag and recalculate checksum. */
 	skb_pull_rcsum(skb, MTK_HDR_LEN);
@@ -79,21 +92,14 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev,
 		skb->data - ETH_HLEN - MTK_HDR_LEN,
 		2 * ETH_ALEN);
 
-	/* Get source port information */
-	port = (hdr & MTK_HDR_RECV_SOURCE_PORT_MASK);
-
-	skb->dev = dsa_master_find_slave(dev, 0, port);
-	if (!skb->dev)
-		return NULL;
-
 	return skb;
 }
 
 static void mtk_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
 				 int *offset)
 {
-	*offset = 4;
-	*proto = ((__be16 *)skb->data)[1];
+	*offset = MTK_HDR_LEN;
+	*proto = mtk_tag_encap_proto(skb->data);
 }
 
 static const struct dsa_device_ops mtk_netdev_ops = {
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
