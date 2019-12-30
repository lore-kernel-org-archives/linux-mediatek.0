Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B3EC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:37:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ADD620663
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ieq7y2W4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="PFAfL5sW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ADD620663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FKpP+A+eeJYC6iUPLrxuj4u8rP8Ln/6yKW3YtxZQ2M=; b=Ieq7y2W4Ah4wVC
	y4chd4858v2va0bxvgiIkP9bs6yeUJShttlgG673Q6dJSaeEi0sIIZDkXFkN7Ah0ukI9c4mnsvD2U
	nxrEWKTAgzDh8KKrEwYxfA5liM6LxrXr+ydvMYbnCv1QCu1pb/3EYrCHLs86+9sBuJgI+QBgUNDQ8
	SxVqtTB1GbsTkUvAfiQRlonqbYohbKwLGkd+EtVsp/fdBjp9U5+ViACrAaVESHi/FpAmboz73jGd4
	+tEuPEIlwSGOIyk8Dd8X+r1qfDG0FF2pIF1yTdLp4V7RdAa6sPdHiJTpFdqdaeGzqeylM50doFKjs
	0S+HbZCTo+MHBqDUG//g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwBB-0001NO-UG; Mon, 30 Dec 2019 14:37:57 +0000
Received: from fd.dlink.ru ([178.170.168.18])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwAk-0000xR-1X; Mon, 30 Dec 2019 14:37:31 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 1D35C1B20759; Mon, 30 Dec 2019 17:31:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 1D35C1B20759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716317; bh=MElnUAXdbAsEzuA8MGuhZyEpxZHkJL0ydPnsBAYspiA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PFAfL5sWrlbjw5bOBVaCSHG9T9Lz+DIXQnZ4J2oydzJ8/nGsMPjkU3wcslu2m0Mi5
 8NbvC/5iXl35VH4MvCP84/Zj9rgur1fdwyEakbJ95RGtdax+msw0N6Zl6VgEz5wyXb
 mXrmGNG7/aXIYQ19IgnLoyvkS1qQzubGY2OxKSCM=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id 0C2421B207EB;
 Mon, 30 Dec 2019 17:31:11 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 0C2421B207EB
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id C6D2A1B229CB;
 Mon, 30 Dec 2019 17:31:08 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:08 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 04/19] net: dsa: tag_ar9331: split out common tag
 accessors
Date: Mon, 30 Dec 2019 17:30:12 +0300
Message-Id: <20191230143028.27313-5-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_063730_442130_A7F6DA68 
X-CRM114-Status: GOOD (  11.75  )
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

They will be reused in upcoming GRO callbacks.
(Almost) no functional changes except less informative error string.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 net/dsa/tag_ar9331.c | 46 +++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/net/dsa/tag_ar9331.c b/net/dsa/tag_ar9331.c
index 399ca21ec03b..c22c1b515e02 100644
--- a/net/dsa/tag_ar9331.c
+++ b/net/dsa/tag_ar9331.c
@@ -24,6 +24,25 @@
 #define AR9331_HDR_RESERVED_MASK	GENMASK(5, 4)
 #define AR9331_HDR_PORT_NUM_MASK	GENMASK(3, 0)
 
+static inline bool ar9331_tag_sanity_check(const u8 *data)
+{
+	u16 hdr = le16_to_cpup((__le16 *)(data - ETH_HLEN));
+
+	return FIELD_GET(AR9331_HDR_VERSION_MASK, hdr) == AR9331_HDR_VERSION &&
+	       !(hdr & AR9331_HDR_FROM_CPU);
+}
+
+static inline int ar9331_tag_source_port(const u8 *data)
+{
+	/* hdr comes in LE byte order, so srcport field is in the first byte */
+	return FIELD_GET(AR9331_HDR_PORT_NUM_MASK, *(data - ETH_HLEN));
+}
+
+static inline __be16 ar9331_tag_encap_proto(const u8 *data)
+{
+	return *(__be16 *)data;
+}
+
 static struct sk_buff *ar9331_tag_xmit(struct sk_buff *skb,
 				       struct net_device *dev)
 {
@@ -50,36 +69,27 @@ static struct sk_buff *ar9331_tag_rcv(struct sk_buff *skb,
 				      struct net_device *ndev,
 				      struct packet_type *pt)
 {
-	u8 ver, port;
-	u16 hdr;
+	int port;
 
 	if (unlikely(!pskb_may_pull(skb, AR9331_HDR_LEN)))
 		return NULL;
 
-	hdr = le16_to_cpu(*(__le16 *)skb_mac_header(skb));
-
-	ver = FIELD_GET(AR9331_HDR_VERSION_MASK, hdr);
-	if (unlikely(ver != AR9331_HDR_VERSION)) {
-		netdev_warn_once(ndev, "%s:%i wrong header version 0x%2x\n",
-				 __func__, __LINE__, hdr);
-		return NULL;
-	}
-
-	if (unlikely(hdr & AR9331_HDR_FROM_CPU)) {
-		netdev_warn_once(ndev, "%s:%i packet should not be from cpu 0x%2x\n",
-				 __func__, __LINE__, hdr);
+	if (unlikely(!ar9331_tag_sanity_check(skb->data))) {
+		netdev_warn_once(ndev,
+				 "%s:%i wrong header version or source port\n",
+				 __func__, __LINE__);
 		return NULL;
 	}
 
-	skb_pull_rcsum(skb, AR9331_HDR_LEN);
-
 	/* Get source port information */
-	port = FIELD_GET(AR9331_HDR_PORT_NUM_MASK, hdr);
+	port = ar9331_tag_source_port(skb->data);
 
 	skb->dev = dsa_master_find_slave(ndev, 0, port);
 	if (!skb->dev)
 		return NULL;
 
+	skb_pull_rcsum(skb, AR9331_HDR_LEN);
+
 	return skb;
 }
 
@@ -87,7 +97,7 @@ static void ar9331_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
 				    int *offset)
 {
 	*offset = AR9331_HDR_LEN;
-	*proto = *(__be16 *)skb->data;
+	*proto = ar9331_tag_encap_proto(skb->data);
 }
 
 static const struct dsa_device_ops ar9331_netdev_ops = {
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
