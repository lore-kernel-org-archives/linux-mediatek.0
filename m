Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F84AC2D0D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:44:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A72207E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MfNVyJl0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="a4b0eZmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A72207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4/3AkiBWumnEbwZcmpLj/linooB0ziUrrCHDkdBvg4=; b=MfNVyJl0crA8WN
	5LF59f4/77Z635ub/cKnKICz3muXGh3/mA/JaVak9ApniZeHzUmTEHu1fSKbCYply1qWZLALwjIaR
	kJPztwczOI9vSTwkeTPl9O0CzVrSaJ72Hku4IWDtNPvX8gA1XFoNYXOSUQRFFv8YWnXXklxUqZ5FZ
	13ctJRoMd0JJ9dqrDlDILVg0UxXAeMCnkSVdkK7vLuyXLI8xCf/YaxmzLoJDhlKWizebwRaNT08cD
	yUGYy0cHoa9falNpOvZvkT7Js0/6lN3zr7airQzt3/O9xg/6/PNuUQ4Z6iNAT8RKAATkM3hMpfM94
	mL/joKAHpoMg4AVrOqQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwHT-0005Mw-1z; Mon, 30 Dec 2019 14:44:27 +0000
Received: from mail.dlink.ru ([178.170.168.18] helo=fd.dlink.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwFY-0003w2-Ko; Mon, 30 Dec 2019 14:42:31 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id C199F1B2199E; Mon, 30 Dec 2019 17:32:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru C199F1B2199E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716377; bh=oIQhxpQSU+of0GS4enDiLZVDRRd/vUUBvg7EXVnvZnE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=a4b0eZmu5mab4I8iqprKXq5h0rJ/gLc/GnAzwQywCZXr1Xn2xW+y2N1lDhn0RyRDP
 Xli11vUEXMFk9GPxGejxvvXsM+K/iuylazAuLfropKpvK3FPlydE8tLg8iHrhD1c67
 WDv80KecztONQM+ifd7jndk2n/kae8EOmwaKiQus=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id AD2C11B20206;
 Mon, 30 Dec 2019 17:31:43 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru AD2C11B20206
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id BE9641B229CB;
 Mon, 30 Dec 2019 17:31:41 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:41 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 20/20] net: core: add (unlikely) DSA support in
 napi_gro_frags()
Date: Mon, 30 Dec 2019 17:30:28 +0300
Message-Id: <20191230143028.27313-21-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
References: <20191230143028.27313-1-alobakin@dlink.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_064229_041870_751F8D93 
X-CRM114-Status: GOOD (  10.99  )
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

Make napi_gro_frags() available for DSA-enabled device drivers by adding
the same condition for them as the one in eth_type_trans().

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 net/core/dev.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index f1b8afcfbc0f..923b930a4506 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -142,6 +142,7 @@
 #include <linux/net_namespace.h>
 #include <linux/indirect_call_wrapper.h>
 #include <net/devlink.h>
+#include <net/dsa.h>
 
 #include "net-sysfs.h"
 
@@ -5951,6 +5952,7 @@ static gro_result_t napi_frags_finish(struct napi_struct *napi,
  */
 static struct sk_buff *napi_frags_skb(struct napi_struct *napi)
 {
+	struct net_device *dev = napi->dev;
 	struct sk_buff *skb = napi->skb;
 	const struct ethhdr *eth;
 	unsigned int hlen = sizeof(*eth);
@@ -5964,7 +5966,7 @@ static struct sk_buff *napi_frags_skb(struct napi_struct *napi)
 		eth = skb_gro_header_slow(skb, hlen, 0);
 		if (unlikely(!eth)) {
 			net_warn_ratelimited("%s: dropping impossible skb from %s\n",
-					     __func__, napi->dev->name);
+					     __func__, dev->name);
 			napi_reuse_skb(napi, skb);
 			return NULL;
 		}
@@ -5978,10 +5980,13 @@ static struct sk_buff *napi_frags_skb(struct napi_struct *napi)
 
 	/*
 	 * This works because the only protocols we care about don't require
-	 * special handling.
+	 * special handling... except for DSA.
 	 * We'll fix it up properly in napi_frags_finish()
 	 */
-	skb->protocol = eth->h_proto;
+	if (unlikely(netdev_uses_dsa(dev)) && dsa_can_decode(skb, dev))
+		skb->protocol = htons(ETH_P_XDSA);
+	else
+		skb->protocol = eth->h_proto;
 
 	return skb;
 }
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
