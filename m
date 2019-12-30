Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E292C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:46:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2327220663
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:46:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFyRIENo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="IVVHVnaM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2327220663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmZFKrXphRaD99iqG4GTjw5zJooWmHESQzHLVVWZdzA=; b=RFyRIENoy5JNTg
	onys0CmeI/m59xjObC7AqjHwAFn3FIzK2oDBu8N2wk6fe/P8XFgXAxCaspPFKcLcotIEkM6CsnV/q
	myzMqOIUUoTjHm7EccfcCpLr5hm8Gumpsv73u49WxnwcjvJg2iE/fRWXZLF6OCuMBq1bn0IKGuoye
	BPQlUXe1VheXIAQmR4sBD3FfEGjdAPsqyPUQpgq+ndyIogeNt40Q0Z6EEDZpzvW9fIl2E45ZSHXTk
	ianPlHiY7ltcQ+FhEGryz5IR4qhf3n3gQ/TG/lTraQZ2wqcrxLRZjrLc33JMfTSk6/xUSveozN4Ho
	5BTcMLfC/dw5vOeMmEog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwJU-00081N-4W; Mon, 30 Dec 2019 14:46:32 +0000
Received: from mail.dlink.ru ([178.170.168.18] helo=fd.dlink.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwFb-0003xX-1a; Mon, 30 Dec 2019 14:42:34 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 1004F1B218DD; Mon, 30 Dec 2019 17:32:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 1004F1B218DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716367; bh=E3wS4CWwlylImJof0eomCAHaPV4aLBnqVAQ7xnSqdyA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IVVHVnaM/RM+UDv2UYa/dQtQ/GFA+1urOJh+VXrWV/uPNbowe6Rt8I20pPuEXrap7
 jcLdLQhThhhNiI6Y4YNa/SkZSscpCdqfuECR6wfrGmlcyzKINgSQ2ZkDCWae8ZBJmc
 7MgLJuXdK6F1c+t21rbp5crN4fJC1WbW5PFw5aKo=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id 70CB51B21845;
 Mon, 30 Dec 2019 17:31:37 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 70CB51B21845
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id 4683B1B229D0;
 Mon, 30 Dec 2019 17:31:35 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:35 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 17/19] net: dsa: tag_qca: switch to bitfield
 helpers
Date: Mon, 30 Dec 2019 17:30:25 +0300
Message-Id: <20191230143028.27313-18-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_064231_456137_E394F5E0 
X-CRM114-Status: GOOD (  11.09  )
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

Make code look cleaner and more readable by using bitfield macros.
Misc: fix several macro identation and phdr type in qca_tag_xmit().

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 net/dsa/tag_qca.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/net/dsa/tag_qca.c b/net/dsa/tag_qca.c
index e1c4dd04734a..8939abce36d7 100644
--- a/net/dsa/tag_qca.c
+++ b/net/dsa/tag_qca.c
@@ -3,15 +3,15 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/etherdevice.h>
 
 #include "dsa_priv.h"
 
-#define QCA_HDR_LEN	2
-#define QCA_HDR_VERSION	0x2
+#define QCA_HDR_LEN			2
+#define QCA_HDR_VERSION			0x2
 
-#define QCA_HDR_RECV_VERSION_MASK	GENMASK(15, 14)
-#define QCA_HDR_RECV_VERSION_S		14
+#define QCA_HDR_RECV_VERSION(tag)	FIELD_GET(GENMASK(15, 14), tag)
 #define QCA_HDR_RECV_PRIORITY_MASK	GENMASK(13, 11)
 #define QCA_HDR_RECV_PRIORITY_S		11
 #define QCA_HDR_RECV_TYPE_MASK		GENMASK(10, 6)
@@ -19,19 +19,20 @@
 #define QCA_HDR_RECV_FRAME_IS_TAGGED	BIT(3)
 #define QCA_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
 
-#define QCA_HDR_XMIT_VERSION_MASK	GENMASK(15, 14)
-#define QCA_HDR_XMIT_VERSION_S		14
+#define QCA_HDR_XMIT_VERSION		FIELD_PREP(GENMASK(15, 14), \
+						   QCA_HDR_VERSION)
 #define QCA_HDR_XMIT_PRIORITY_MASK	GENMASK(13, 11)
 #define QCA_HDR_XMIT_PRIORITY_S		11
 #define QCA_HDR_XMIT_CONTROL_MASK	GENMASK(10, 8)
 #define QCA_HDR_XMIT_CONTROL_S		8
 #define QCA_HDR_XMIT_FROM_CPU		BIT(7)
-#define QCA_HDR_XMIT_DP_BIT_MASK	GENMASK(6, 0)
+#define QCA_HDR_XMIT_DP(port)		FIELD_PREP(GENMASK(6, 0), BIT(port))
 
 static struct sk_buff *qca_tag_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct dsa_port *dp = dsa_slave_to_port(dev);
-	u16 *phdr, hdr;
+	const struct dsa_port *dp = dsa_slave_to_port(dev);
+	__be16 *phdr;
+	u16 hdr;
 
 	if (skb_cow_head(skb, 0) < 0)
 		return NULL;
@@ -39,11 +40,11 @@ static struct sk_buff *qca_tag_xmit(struct sk_buff *skb, struct net_device *dev)
 	skb_push(skb, QCA_HDR_LEN);
 
 	memmove(skb->data, skb->data + QCA_HDR_LEN, 2 * ETH_ALEN);
-	phdr = (u16 *)(skb->data + 2 * ETH_ALEN);
+	phdr = (__be16 *)(skb->data + 2 * ETH_ALEN);
 
 	/* Set the version field, and set destination port information */
-	hdr = QCA_HDR_VERSION << QCA_HDR_XMIT_VERSION_S |
-		QCA_HDR_XMIT_FROM_CPU | BIT(dp->index);
+	hdr = QCA_HDR_XMIT_VERSION | QCA_HDR_XMIT_FROM_CPU |
+	      QCA_HDR_XMIT_DP(dp->index);
 
 	*phdr = htons(hdr);
 
@@ -53,7 +54,6 @@ static struct sk_buff *qca_tag_xmit(struct sk_buff *skb, struct net_device *dev)
 static struct sk_buff *qca_tag_rcv(struct sk_buff *skb, struct net_device *dev,
 				   struct packet_type *pt)
 {
-	u8 ver;
 	int port;
 	__be16 *phdr, hdr;
 
@@ -68,8 +68,7 @@ static struct sk_buff *qca_tag_rcv(struct sk_buff *skb, struct net_device *dev,
 	hdr = ntohs(*phdr);
 
 	/* Make sure the version is correct */
-	ver = (hdr & QCA_HDR_RECV_VERSION_MASK) >> QCA_HDR_RECV_VERSION_S;
-	if (unlikely(ver != QCA_HDR_VERSION))
+	if (unlikely(QCA_HDR_RECV_VERSION(hdr) != QCA_HDR_VERSION))
 		return NULL;
 
 	/* Remove QCA tag and recalculate checksum */
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
