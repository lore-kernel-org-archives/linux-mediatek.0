Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2231C2D0D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B692071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n5GIfZcb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="W+81RZh7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B692071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3PSQQY3KnjTBA7EsCXNPxuv6dYUjyraZ0t0mv2LeLk=; b=n5GIfZcb1qqmBx
	QESaD3u/Z90JuiNvlY6+Y9N0nlbcv4lcZvgQDHAbOqnK0g6SplpHRgn4Qia38OljAWLmvF0Qz9bnM
	mwqkRS+L825LN7VIWuGDC0kVB63PG568Ms9bUAyvEO3MNc6PbM0aUc+D8fBnX4kmDYtlLOatxhwYF
	tYm9EeuCYxh5S0iFK+fvbronv3lWxgauXB/wVjUw6YmXL34hTxyxNXHsg891Z1KoWo50KWPbbioZn
	M32C3gtNgHRlUmSTH78/0k/ajGdTB9RuHKZ5xSH2neQRUDbafi3wJ337mdf2qLy9QPyDSzm/m3/jp
	E3u/x+SqBErBmVCWCtTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwHc-0005TE-01; Mon, 30 Dec 2019 14:44:36 +0000
Received: from fd.dlink.ru ([178.170.168.18])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwFY-0003vx-Gh; Mon, 30 Dec 2019 14:42:31 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 03CEF1B218C1; Mon, 30 Dec 2019 17:32:44 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 03CEF1B218C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716365; bh=oevogiD6ZZjPjhds8OttybiSWL3W+YH+lNJv5xktFv4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=W+81RZh70xRv2YQ9Uh/40TpcbYlXCM7cscSdVj2AQL+6x/LphC0er7cU2TZNb6wzW
 8gtpweVg6mCswv3aiRHrQoVZdXzhGJDWT/M7REGe9bDjiITIsizcSal/sfUmPoi1cK
 FKyfrqTEEud4FrqpG4Qydzr8qitHV/q3Tofw3AWQ=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id 0E58B1B2176F;
 Mon, 30 Dec 2019 17:31:17 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 0E58B1B2176F
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id D02B21B229CB;
 Mon, 30 Dec 2019 17:31:14 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:14 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 07/19] net: dsa: tag_gswip: switch to bitfield
 helpers
Date: Mon, 30 Dec 2019 17:30:15 +0300
Message-Id: <20191230143028.27313-8-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_064228_911362_3C0940DB 
X-CRM114-Status: GOOD (  10.08  )
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

Make code look cleaner and more readable by using bitfield macros instead
of open-coding masks and shifts.
Misc: remove redundant variable in gswip_tag_xmit(), make dsa_port const.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 net/dsa/tag_gswip.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/net/dsa/tag_gswip.c b/net/dsa/tag_gswip.c
index 408d4af390a0..de920f6aac5b 100644
--- a/net/dsa/tag_gswip.c
+++ b/net/dsa/tag_gswip.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 - 2018 Hauke Mehrtens <hauke@hauke-m.de>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
@@ -45,26 +46,22 @@
 #define GSWIP_TX_CLASS_MASK		GENMASK(3, 0)
 
 /* Byte 3 */
+#define GSWIP_TX_PORT_MAP(port)		FIELD_PREP(GENMASK(6, 1), BIT(port))
 #define GSWIP_TX_DPID_EN		BIT(0)
-#define GSWIP_TX_PORT_MAP_SHIFT		1
-#define GSWIP_TX_PORT_MAP_MASK		GENMASK(6, 1)
 
-#define GSWIP_RX_HEADER_LEN	8
+#define GSWIP_RX_HEADER_LEN		8
 
 /* special tag in RX path header */
 /* Byte 7 */
-#define GSWIP_RX_SPPID_SHIFT		4
-#define GSWIP_RX_SPPID_MASK		GENMASK(6, 4)
+#define GSWIP_RX_SPPID(byte_7)		FIELD_GET(GENMASK(6, 4), byte_7)
 
 static struct sk_buff *gswip_tag_xmit(struct sk_buff *skb,
 				      struct net_device *dev)
 {
-	struct dsa_port *dp = dsa_slave_to_port(dev);
-	int err;
+	const struct dsa_port *dp = dsa_slave_to_port(dev);
 	u8 *gswip_tag;
 
-	err = skb_cow_head(skb, GSWIP_TX_HEADER_LEN);
-	if (err)
+	if (skb_cow_head(skb, GSWIP_TX_HEADER_LEN))
 		return NULL;
 
 	skb_push(skb, GSWIP_TX_HEADER_LEN);
@@ -73,8 +70,7 @@ static struct sk_buff *gswip_tag_xmit(struct sk_buff *skb,
 	gswip_tag[0] = GSWIP_TX_SLPID_CPU;
 	gswip_tag[1] = GSWIP_TX_DPID_ELAN;
 	gswip_tag[2] = GSWIP_TX_PORT_MAP_EN | GSWIP_TX_PORT_MAP_SEL;
-	gswip_tag[3] = BIT(dp->index + GSWIP_TX_PORT_MAP_SHIFT) & GSWIP_TX_PORT_MAP_MASK;
-	gswip_tag[3] |= GSWIP_TX_DPID_EN;
+	gswip_tag[3] = GSWIP_TX_PORT_MAP(dp->index) | GSWIP_TX_DPID_EN;
 
 	return skb;
 }
@@ -84,15 +80,13 @@ static struct sk_buff *gswip_tag_rcv(struct sk_buff *skb,
 				     struct packet_type *pt)
 {
 	int port;
-	u8 *gswip_tag;
 
 	if (unlikely(!pskb_may_pull(skb, GSWIP_RX_HEADER_LEN)))
 		return NULL;
 
-	gswip_tag = skb->data - ETH_HLEN;
-
 	/* Get source port information */
-	port = (gswip_tag[7] & GSWIP_RX_SPPID_MASK) >> GSWIP_RX_SPPID_SHIFT;
+	port = GSWIP_RX_SPPID(*(skb->data - ETH_HLEN + 7));
+
 	skb->dev = dsa_master_find_slave(dev, 0, port);
 	if (!skb->dev)
 		return NULL;
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
