Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0407AC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:44:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA18F20663
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m3YU+TcN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="LOUIsUq7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA18F20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8SQwDC02APzlDpFYpUHM9hNi4WQjBRIggOCRemOKNU=; b=m3YU+TcNk/NLn/
	XMR9FRVVYGSYsYU889e39RlQqzUGTMM0OKKfA2mTHqo5pJ9kvjHteKaCZt3a81GNzFQO8t2dw2Ai7
	YvGms3Xy7ZkWpZLUxOabrmjUhRXp35dSsBtBd/3/O9D0Tf/DM66i0Wt/Zvau9pFHhSuTiMJS9lr58
	MPHAhATih8rlMXhNssaCAHjUMzLW3LL5JRxaHmwhxxHpDEzW+0bKSJre1Sc0BIPXyQhcYevg66yO/
	3be9JZPRuEmoxWbkMsHAjrg8f1Ld/6x+L8X+lxJBZHd1qAh5GxMdq3BXyzWi5xC1u/rhsfcZEfTKy
	mfeqGgcxGO0YlnukfbyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwHX-0005Pd-Ce; Mon, 30 Dec 2019 14:44:31 +0000
Received: from mail.dlink.ru ([178.170.168.18] helo=fd.dlink.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwFY-0003w1-Ju; Mon, 30 Dec 2019 14:42:31 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 5FD9C1B21990; Mon, 30 Dec 2019 17:32:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 5FD9C1B21990
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716377; bh=4XferhwJ+noZjvLLF7PDu0hDkxQ/WpPucldtTtVh1Bc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LOUIsUq7DpP0fdqTXl/cEoFtg6XNKAEYorBY7I8u4A/94vJm9VZb5B+ec7Uy+I6l/
 gpzckHhwSNoOWx8wim4ItsUqPXpxBnNt5KLsvk4SrnUYbGQqypMnPdcc7stSD3QIyT
 N3nkfuGBs5et62erZPnYwOn414kCfgrjYccnxeVc=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id C096F1B20954;
 Mon, 30 Dec 2019 17:31:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru C096F1B20954
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id D81481B229D0;
 Mon, 30 Dec 2019 17:31:39 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:39 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 19/19] net: dsa: tag_qca: add GRO callbacks
Date: Mon, 30 Dec 2019 17:30:27 +0300
Message-Id: <20191230143028.27313-20-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_064229_022565_D6BFAAE6 
X-CRM114-Status: GOOD (  13.09  )
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

...so that frames tagged with this CPU tag type can be correctly
processed by the GRO layer.
Misc: fix qca_netdev_ops structure identation.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 net/dsa/tag_qca.c | 88 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 6 deletions(-)

diff --git a/net/dsa/tag_qca.c b/net/dsa/tag_qca.c
index bee2788e034d..d0cb2299cbe9 100644
--- a/net/dsa/tag_qca.c
+++ b/net/dsa/tag_qca.c
@@ -106,13 +106,89 @@ static void qca_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
 	*proto = qca_tag_encap_proto(skb->data);
 }
 
+static struct sk_buff *qca_tag_gro_receive(struct list_head *head,
+					   struct sk_buff *skb)
+{
+	const struct packet_offload *ptype;
+	struct sk_buff *p, *pp = NULL;
+	u32 data_off, data_end;
+	const u8 *data;
+	int flush = 1;
+
+	data_off = skb_gro_offset(skb);
+	data_end = data_off + QCA_HDR_LEN;
+
+	data = skb_gro_header_fast(skb, data_off);
+	if (skb_gro_header_hard(skb, data_end)) {
+		data = skb_gro_header_slow(skb, data_end, data_off);
+		if (unlikely(!data))
+			goto out;
+	}
+
+	/* Data that is to the left to the current position is already
+	 * pulled to the head
+	 */
+	if (unlikely(!qca_tag_sanity_check(skb->data + data_off)))
+		goto out;
+
+	rcu_read_lock();
+
+	ptype = gro_find_receive_by_type(qca_tag_encap_proto(data));
+	if (!ptype)
+		goto out_unlock;
+
+	flush = 0;
+
+	list_for_each_entry(p, head, list) {
+		if (!NAPI_GRO_CB(p)->same_flow)
+			continue;
+
+		if (qca_tag_source_port(skb->data + data_off) ^
+		    qca_tag_source_port(p->data + data_off))
+			NAPI_GRO_CB(p)->same_flow = 0;
+	}
+
+	skb_gro_pull(skb, QCA_HDR_LEN);
+	skb_gro_postpull_rcsum(skb, data, QCA_HDR_LEN);
+
+	pp = call_gro_receive(ptype->callbacks.gro_receive, head, skb);
+
+out_unlock:
+	rcu_read_unlock();
+out:
+	skb_gro_flush_final(skb, pp, flush);
+
+	return pp;
+}
+
+static int qca_tag_gro_complete(struct sk_buff *skb, int nhoff)
+{
+	const struct packet_offload *ptype;
+	int err = -ENOENT;
+	__be16 proto;
+
+	proto = qca_tag_encap_proto(skb->data + nhoff);
+
+	rcu_read_lock();
+
+	ptype = gro_find_complete_by_type(proto);
+	if (ptype)
+		err = ptype->callbacks.gro_complete(skb, nhoff + QCA_HDR_LEN);
+
+	rcu_read_unlock();
+
+	return err;
+}
+
 static const struct dsa_device_ops qca_netdev_ops = {
-	.name	= "qca",
-	.proto	= DSA_TAG_PROTO_QCA,
-	.xmit	= qca_tag_xmit,
-	.rcv	= qca_tag_rcv,
-	.flow_dissect = qca_tag_flow_dissect,
-	.overhead = QCA_HDR_LEN,
+	.name		= "qca",
+	.proto		= DSA_TAG_PROTO_QCA,
+	.xmit		= qca_tag_xmit,
+	.rcv		= qca_tag_rcv,
+	.flow_dissect	= qca_tag_flow_dissect,
+	.gro_receive	= qca_tag_gro_receive,
+	.gro_complete	= qca_tag_gro_complete,
+	.overhead	= QCA_HDR_LEN,
 };
 
 MODULE_LICENSE("GPL");
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
