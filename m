Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A896C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD7B20722
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jOMfjTqC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="GmdgPLyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DD7B20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLHZO9v+5BTG0K84byWuo4I4hBclK2YAqlT/2M7sUu0=; b=jOMfjTqCwx6+0H
	eaRWdVFEPbNzLy0nAXB5KplwBE7bthMWN7FJ9/+QiKC64V3LAdb9KjpscH6B5o3RsWikt2NPyh/Ns
	iYzVx9ICBb+lKPRdkq8+bO+tUnsIf3AUK0CRSStfy9V3Pd+y3nr0RUuBum62ApAnxP7SmqlB1gdIn
	RNpltU7+jzBfw4vkHUX+E0+nG+GTa16ryskLrEPLe1Lz787E4nQQePkcM1FfUrbwhpZ7kqbXO/lBj
	+41KHF8InM9hpKvAuKgHlIiOnIlNVh/r0pvXsVUpjKunMJrU7vvk8f+a7a0RWLsBUsZZ5LzE/GEtG
	Rw9lHZTFr+rvuU5H5JNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwMA-0002FC-C5; Mon, 30 Dec 2019 14:49:18 +0000
Received: from fd.dlink.ru ([178.170.168.18])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwFc-0003ys-Rj; Mon, 30 Dec 2019 14:42:37 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 61AAE1B21813; Mon, 30 Dec 2019 17:31:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 61AAE1B21813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716299; bh=GSv5uxS8JB5ZFL1df4FA5xdldqWieg3v4SkX8gUq2MY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GmdgPLypb3SV0iTI0fTBl5C5KPZy9g8Fo+WJRuNUIrilumWA0Ajkw/p1QT/Vlr4Lw
 p8BGiv6bFOeStHPIQlHTfSEeTRMN728HSw8rIqE9Bb+01W4yJbC7CArszuDDwFiElk
 rA4R+drt1I1vxSvz6qCHp/1L6GB3iyPT5DS1P78k=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id 286831B20805;
 Mon, 30 Dec 2019 17:31:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 286831B20805
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id 71F111B229CB;
 Mon, 30 Dec 2019 17:31:05 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:05 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 02/19] net: dsa: add GRO support infrastructure
Date: Mon, 30 Dec 2019 17:30:10 +0300
Message-Id: <20191230143028.27313-3-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_064233_289751_8E4D050E 
X-CRM114-Status: GOOD (  13.27  )
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

Add .gro_receive() (with shortcut) and .gro_complete() callbacks to
tagger ops and basic ETH_P_XDSA packet_offload with wrappers around
them, so DSA-tagged frames can now be processed within GRO layer if
the particular tagger implements this (will be added in subsequent
patches).

Note: no need to take RCU read locks in dsa_gro_receive() and
dsa_gro_complete() as dev->cpu_dp is not RCU-protected, at least
for now. The corresponding locks must be taken in the actual
tagger callbacks.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 include/net/dsa.h |  5 +++++
 net/dsa/dsa.c     | 43 +++++++++++++++++++++++++++++++++++++++++--
 net/dsa/dsa2.c    |  1 +
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 633d9894ab87..8a7f80709d51 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -79,6 +79,9 @@ struct dsa_device_ops {
 	 * as regular on the master net device.
 	 */
 	bool (*filter)(const struct sk_buff *skb, struct net_device *dev);
+	struct sk_buff *(*gro_receive)(struct list_head *head,
+				       struct sk_buff *skb);
+	int (*gro_complete)(struct sk_buff *skb, int nhoff);
 	unsigned int overhead;
 	const char *name;
 	enum dsa_tag_protocol proto;
@@ -170,6 +173,8 @@ struct dsa_port {
 	struct sk_buff *(*rcv)(struct sk_buff *skb, struct net_device *dev,
 			       struct packet_type *pt);
 	bool (*filter)(const struct sk_buff *skb, struct net_device *dev);
+	struct sk_buff *(*gro_receive)(struct list_head *head,
+				       struct sk_buff *skb);
 
 	enum {
 		DSA_PORT_TYPE_UNUSED = 0,
diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 17281fec710c..9a8d8ce7473c 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -243,6 +243,34 @@ static int dsa_switch_rcv(struct sk_buff *skb, struct net_device *dev,
 	return 0;
 }
 
+static struct sk_buff *dsa_gro_receive(struct list_head *head,
+				       struct sk_buff *skb)
+{
+	const struct dsa_port *cpu_dp = skb->dev->dsa_ptr;
+	struct sk_buff *pp = NULL;
+	int flush = 1;
+
+	if (unlikely(!cpu_dp) || !cpu_dp->gro_receive)
+		goto flush;
+
+	pp = cpu_dp->gro_receive(head, skb);
+	flush = 0;
+
+flush:
+	skb_gro_flush_final(skb, pp, flush);
+	return pp;
+}
+
+static int dsa_gro_complete(struct sk_buff *skb, int nhoff)
+{
+	const struct dsa_port *cpu_dp = skb->dev->dsa_ptr;
+
+	if (likely(cpu_dp) && cpu_dp->tag_ops->gro_complete)
+		return cpu_dp->tag_ops->gro_complete(skb, nhoff);
+
+	return -ENOENT;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static bool dsa_is_port_initialized(struct dsa_switch *ds, int p)
 {
@@ -298,8 +326,17 @@ EXPORT_SYMBOL_GPL(dsa_switch_resume);
 #endif
 
 static struct packet_type dsa_pack_type __read_mostly = {
-	.type	= cpu_to_be16(ETH_P_XDSA),
-	.func	= dsa_switch_rcv,
+	.type		= htons(ETH_P_XDSA),
+	.func		= dsa_switch_rcv,
+};
+
+static struct packet_offload dsa_pack_offload __read_mostly = {
+	.type		= htons(ETH_P_XDSA),
+	.priority	= 10,
+	.callbacks	= {
+		.gro_receive	= dsa_gro_receive,
+		.gro_complete	= dsa_gro_complete,
+	},
 };
 
 static struct workqueue_struct *dsa_owq;
@@ -430,6 +467,7 @@ static int __init dsa_init_module(void)
 		goto register_notifier_fail;
 
 	dev_add_pack(&dsa_pack_type);
+	dev_add_offload(&dsa_pack_offload);
 
 	dsa_tag_driver_register(&DSA_TAG_DRIVER_NAME(none_ops),
 				THIS_MODULE);
@@ -448,6 +486,7 @@ static void __exit dsa_cleanup_module(void)
 	dsa_tag_driver_unregister(&DSA_TAG_DRIVER_NAME(none_ops));
 
 	dsa_slave_unregister_notifier();
+	dev_remove_offload(&dsa_pack_offload);
 	dev_remove_pack(&dsa_pack_type);
 	destroy_workqueue(dsa_owq);
 }
diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index c66abbed4daf..5f66e0280e8e 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -631,6 +631,7 @@ static int dsa_port_parse_cpu(struct dsa_port *dp, struct net_device *master)
 	}
 
 	dp->type = DSA_PORT_TYPE_CPU;
+	dp->gro_receive = tag_ops->gro_receive;
 	dp->filter = tag_ops->filter;
 	dp->rcv = tag_ops->rcv;
 	dp->tag_ops = tag_ops;
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
