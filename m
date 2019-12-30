Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB98EC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:49:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0F322071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oivlaSSA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="WEUab1cB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0F322071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Of/LDPfbFb/AdUXmhtTYEjNIybuKq/S7J26QxoUfN9Q=; b=oivlaSSAIoNnDj
	wAKpDiBrrQre7i+7Kdkn6tLou+aPKRK0wpdveTF6AWqxg3ljjvTnpAhP4nH/DkFbPr7QQXGxj3QSb
	73Y6gMO2IN8N91r+DoFgjVgkxnFYZExJOzjEabj+y75JKgl4z1f/FvEEUBejY3nOg8KWzHFdxfzks
	3moAamjze5lg8dkUDsMmor/VUgjZkh7czgou+DbdHJR3Uq8NYixYqSZKUGPDZps/ZE6AjbPPmT3OF
	Zc4SzbTlv+BnITFizcYFQ5uLVhV6fYOxORBSmWrm8p6Yc3U8hubn2I9vvOwBw9YOl9V4oxMDBpfzL
	AYBkyvHfwKc5WkFIuhyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwM1-00023z-Lm; Mon, 30 Dec 2019 14:49:09 +0000
Received: from fd.dlink.ru ([178.170.168.18])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwFc-0003yr-Rs; Mon, 30 Dec 2019 14:42:36 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 631DA1B205DF; Mon, 30 Dec 2019 17:32:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 631DA1B205DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716329; bh=n2vYVzB39mJzBIUNOizuSzaLB2BB0ciDP2ax+76PUW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WEUab1cBnDDhdofGowRffq6sVSz1KrGZ8L+hGjnd6F1cW/SvyukpK2dFwGyzM9fZR
 o4lu4MS6p7AaWB9KoOoGq+mBqWH3V8QDsAESoCOF+RgY4FJqSMsRkVWlRF/gW/4e0s
 aFEChcMZ2MarNFOa93eVXP+6Apa7gyRrkU3zQhds=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id 113301B20B5F;
 Mon, 30 Dec 2019 17:31:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 113301B20B5F
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id E5D7D1B229D0;
 Mon, 30 Dec 2019 17:31:10 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:10 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 05/19] net: dsa: tag_ar9331: add GRO callbacks
Date: Mon, 30 Dec 2019 17:30:13 +0300
Message-Id: <20191230143028.27313-6-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_064233_301425_9EEF0AA2 
X-CRM114-Status: GOOD (  12.50  )
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

Add GRO callbacks to the AR9331 tagger so GRO layer can now process
such frames.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 net/dsa/tag_ar9331.c | 77 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/net/dsa/tag_ar9331.c b/net/dsa/tag_ar9331.c
index c22c1b515e02..99cc7fd92d8e 100644
--- a/net/dsa/tag_ar9331.c
+++ b/net/dsa/tag_ar9331.c
@@ -100,12 +100,89 @@ static void ar9331_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
 	*proto = ar9331_tag_encap_proto(skb->data);
 }
 
+static struct sk_buff *ar9331_tag_gro_receive(struct list_head *head,
+					      struct sk_buff *skb)
+{
+	const struct packet_offload *ptype;
+	struct sk_buff *p, *pp = NULL;
+	u32 data_off, data_end;
+	const u8 *data;
+	int flush = 1;
+
+	data_off = skb_gro_offset(skb);
+	data_end = data_off + AR9331_HDR_LEN;
+
+	data = skb_gro_header_fast(skb, data_off);
+	if (skb_gro_header_hard(skb, data_end)) {
+		data = skb_gro_header_slow(skb, data_end, data_off);
+		if (unlikely(!data))
+			goto out;
+	}
+
+	/* Data that is to the left from the current position is already
+	 * pulled to the head
+	 */
+	if (unlikely(!ar9331_tag_sanity_check(skb->data + data_off)))
+		goto out;
+
+	rcu_read_lock();
+
+	ptype = gro_find_receive_by_type(ar9331_tag_encap_proto(data));
+	if (!ptype)
+		goto out_unlock;
+
+	flush = 0;
+
+	list_for_each_entry(p, head, list) {
+		if (!NAPI_GRO_CB(p)->same_flow)
+			continue;
+
+		if (ar9331_tag_source_port(skb->data + data_off) ^
+		    ar9331_tag_source_port(p->data + data_off))
+			NAPI_GRO_CB(p)->same_flow = 0;
+	}
+
+	skb_gro_pull(skb, AR9331_HDR_LEN);
+	skb_gro_postpull_rcsum(skb, data, AR9331_HDR_LEN);
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
+static int ar9331_tag_gro_complete(struct sk_buff *skb, int nhoff)
+{
+	const struct packet_offload *ptype;
+	int err = -ENOENT;
+	__be16 proto;
+
+	proto = ar9331_tag_encap_proto(skb->data + nhoff);
+	nhoff += AR9331_HDR_LEN;
+
+	rcu_read_lock();
+
+	ptype = gro_find_complete_by_type(proto);
+	if (ptype)
+		err = ptype->callbacks.gro_complete(skb, nhoff);
+
+	rcu_read_unlock();
+
+	return err;
+}
+
 static const struct dsa_device_ops ar9331_netdev_ops = {
 	.name		= "ar9331",
 	.proto		= DSA_TAG_PROTO_AR9331,
 	.xmit		= ar9331_tag_xmit,
 	.rcv		= ar9331_tag_rcv,
 	.flow_dissect	= ar9331_tag_flow_dissect,
+	.gro_receive	= ar9331_tag_gro_receive,
+	.gro_complete	= ar9331_tag_gro_complete,
 	.overhead	= AR9331_HDR_LEN,
 };
 
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
