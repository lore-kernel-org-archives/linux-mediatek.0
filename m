Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CE8C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:49:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25AF520722
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eSV9DGRk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="sGO8qxyG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25AF520722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOFhD3ncRjqbCpGERTalAxElMeJRq2FSd/vnGMp6AyE=; b=eSV9DGRkZqlk1+
	m0v/1jJwqHZuohBrHFALLe9V81x1CiosAEBBTxqQh5Wx57+6MVkMg3lhzyIlXmHMkKnl5CshsRm/l
	AxYRJHS7mUaPrnn+oEG7GXNhMR0aavuox2Y0th1eM2BOBpvGeWvKXRDYQiHT6ZvpmRT5RkvcQ3rV3
	o11cJvuffh5ICjmZUDIcQADDzgk7L9CSPGI7WFuhlXaI2DVrZupiIuBTLhvlso+dYjG2A5KeJ9D1e
	FpkxXF9UV8MYfELiWCZXKXZbSMNxumFJ3HJfqLOQC1Fklh5Xi55mUHkW6/rQkGbFUQ335px2nr7sf
	VF+gtQtgiQaLrONQslyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwMB-0002H7-J6; Mon, 30 Dec 2019 14:49:19 +0000
Received: from mail.dlink.ru ([178.170.168.18] helo=fd.dlink.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwFe-0003xV-9G; Mon, 30 Dec 2019 14:42:38 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 31CC51B218DB; Mon, 30 Dec 2019 17:32:48 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 31CC51B218DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716369; bh=NXl5VU/NmF4XHV2zVViXhu4aInL/BB6UJlu0+qQYx4Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=sGO8qxyGYybn/Po1WmhPp1sGjgBeQTnyzxajt/66jqkR93107HgRiCDRncWOJ2xlH
 9i+loa1yrvFE4FNXlgrOJD7tI2hsgb57/2uZejcAO8VOYrNMBKPtvdAX+exBfg3fPl
 Nrkzx5bxiaEhjgRf7SsEiDsGwaLCnrtK0tkXmJmE=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id 1C4DF1B217AA;
 Mon, 30 Dec 2019 17:31:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 1C4DF1B217AA
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id DF39D1B229D0;
 Mon, 30 Dec 2019 17:31:16 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:16 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 08/19] net: dsa: tag_gswip: add .flow_dissect()
 callback
Date: Mon, 30 Dec 2019 17:30:16 +0300
Message-Id: <20191230143028.27313-9-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_064235_362451_671B0EA2 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

In case user would like to configure RPS on such systems.
Misc: fix identation of gswip_netdev_ops structure.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 net/dsa/tag_gswip.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/net/dsa/tag_gswip.c b/net/dsa/tag_gswip.c
index de920f6aac5b..d37289540ef3 100644
--- a/net/dsa/tag_gswip.c
+++ b/net/dsa/tag_gswip.c
@@ -97,12 +97,20 @@ static struct sk_buff *gswip_tag_rcv(struct sk_buff *skb,
 	return skb;
 }
 
+static void gswip_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
+				   int *offset)
+{
+	*offset = GSWIP_RX_HEADER_LEN;
+	*proto = *(__be16 *)(skb->data + 6);
+}
+
 static const struct dsa_device_ops gswip_netdev_ops = {
-	.name = "gswip",
-	.proto	= DSA_TAG_PROTO_GSWIP,
-	.xmit = gswip_tag_xmit,
-	.rcv = gswip_tag_rcv,
-	.overhead = GSWIP_RX_HEADER_LEN,
+	.name		= "gswip",
+	.proto		= DSA_TAG_PROTO_GSWIP,
+	.xmit		= gswip_tag_xmit,
+	.rcv		= gswip_tag_rcv,
+	.flow_dissect	= gswip_tag_flow_dissect,
+	.overhead	= GSWIP_RX_HEADER_LEN,
 };
 
 MODULE_LICENSE("GPL");
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
