Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2492EC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:46:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E768D20663
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tR//jxhA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="TgfnbWI9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E768D20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjxM5yKzAzipHpW4aXyopb3fjQXnb/nrehU3wZkBLak=; b=tR//jxhA/Eu4/o
	cyvN7H5zpmozCsxlJDsGJYVddDw4DPskm0iNwmm52928zpW31TgX9jD+RZKKgnCtRC9QBoiVw+9u3
	bs87NXXF5lcSL6vC1XYg2hElk4Vz8iSUlxmF7DwL3VhRe+LGZw/cqfHRchkrxuWL/Q+a0hCAKUUhP
	Ya5QgJgCT8q95lWlhV3g8YrClV0uUrhNFFXPOEwA83dngzOMPP6dJbZM4HTFEcjnbsGAVcK+b+ITR
	+ydKY+PK84guwxokaBLcTEv/ccU2kQC90p5NGkgltFaNLryVcwHMuwFm17BViw6Er7czmxrt1KEn/
	duzlKhHpOEbF1V4fzTsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwJQ-0007zE-0S; Mon, 30 Dec 2019 14:46:28 +0000
Received: from mail.dlink.ru ([178.170.168.18] helo=fd.dlink.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwFb-0003xY-2A; Mon, 30 Dec 2019 14:42:32 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 12FCC1B205E4; Mon, 30 Dec 2019 17:31:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 12FCC1B205E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716308; bh=18voDyGBMtcwId3z4bi4wS1wyOebnKJGhqqk04an6a0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TgfnbWI9TBc3yVVN1K2QdM7eEbyAyE00CNl4wigySu3iFcTjAtP01FSXGw5+R0Cn7
 fwRFXsTjaNiqN6JS+c/zW1l6fC5qvX+S2LJHDvKfn5eKcwTuRczYazS+ki0EwQYXIv
 L5UPgTwDGkc1/OsNzAt1hGc6Zn063tb+VbM8Ubo8=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id D7C7E1B205DF;
 Mon, 30 Dec 2019 17:31:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru D7C7E1B205DF
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id 1E48A1B229D1;
 Mon, 30 Dec 2019 17:31:07 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:07 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 03/19] net: dsa: tag_ar9331: add .flow_dissect()
 callback
Date: Mon, 30 Dec 2019 17:30:11 +0300
Message-Id: <20191230143028.27313-4-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_064231_280780_E37306E3 
X-CRM114-Status: UNSURE (   9.19  )
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

...to make RPS work correctly if user would like to configure it.
Misc: fix identation of ar9331_netdev_ops structure.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 net/dsa/tag_ar9331.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/net/dsa/tag_ar9331.c b/net/dsa/tag_ar9331.c
index 466ffa92a474..399ca21ec03b 100644
--- a/net/dsa/tag_ar9331.c
+++ b/net/dsa/tag_ar9331.c
@@ -83,12 +83,20 @@ static struct sk_buff *ar9331_tag_rcv(struct sk_buff *skb,
 	return skb;
 }
 
+static void ar9331_tag_flow_dissect(const struct sk_buff *skb, __be16 *proto,
+				    int *offset)
+{
+	*offset = AR9331_HDR_LEN;
+	*proto = *(__be16 *)skb->data;
+}
+
 static const struct dsa_device_ops ar9331_netdev_ops = {
-	.name	= "ar9331",
-	.proto	= DSA_TAG_PROTO_AR9331,
-	.xmit	= ar9331_tag_xmit,
-	.rcv	= ar9331_tag_rcv,
-	.overhead = AR9331_HDR_LEN,
+	.name		= "ar9331",
+	.proto		= DSA_TAG_PROTO_AR9331,
+	.xmit		= ar9331_tag_xmit,
+	.rcv		= ar9331_tag_rcv,
+	.flow_dissect	= ar9331_tag_flow_dissect,
+	.overhead	= AR9331_HDR_LEN,
 };
 
 MODULE_LICENSE("GPL v2");
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
