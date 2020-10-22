Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D224C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 10:08:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1732821D6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 10:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VKPuz00g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SJV3qyzS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1732821D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vRPOWSJwgoLbXFUAm+3DS8yD+ZDzdIDiUMarPxoti3o=; b=VKPuz00gtYJWYBvlYMG2U9sANk
	sAnWq1SrHotSSom/9y7BQgAi5QFYLXLbhaAZrK11rybJCgukuIYbElBXhkWU/N2KzF0zMvGQbf5VK
	VwXyJ2rqDoTnd75/lcW9B1xn1bv5EM/031sNfCEtJYTzP5yG3yct84zq9QoKk5KO1vVA1Gw7KPVkT
	eHooQ4nwzqmzZ4aUfzfgFPdShMsr40r3+xIgXp6+wtwHjf0jv2awM4fwOre5mfTgfVgjG8rBoHVi2
	K0VfgacAkZ5qjHd6sRAf/DVWRRKG5Qu5O0Xpc4nIx4EFWbYU0F2uK6+1ErSJqK0p9lvXRd+/Xd2tp
	emZfD7qQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVXWM-0001Lv-Mn; Thu, 22 Oct 2020 10:08:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVXWK-0001L1-86; Thu, 22 Oct 2020 10:08:33 +0000
X-UUID: 4227c502a085445e83b90642d5ce8f76-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cLAlegNOIrwzIY2JgBuXu/SNenTIIhJF/b/jv5R+48w=; 
 b=SJV3qyzS79qIEWY2s4RwAPrxHIidzYiCfVenbZOgEHSC/ELw4QXH+95X1EUV3dsYjD/jFb0yVL2KU+aMHkisbRd4TkIJw3l0Tmeirg7PuIu1VRvvwlbVy6U+wtOHOrwLOD80CHAbNQBwXlN676Y2lvGCv1mn4ifr0ROvhg04m6Q=;
X-UUID: 4227c502a085445e83b90642d5ce8f76-20201022
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhuoliang.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 247595175; Thu, 22 Oct 2020 02:08:26 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 03:08:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 18:08:23 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Oct 2020 18:08:22 +0800
From: Zhuoliang Zhang <zhuoliang.zhang@mediatek.com>
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2] net: xfrm: fix a race condition during allocing spi
Date: Thu, 22 Oct 2020 18:01:27 +0800
Message-ID: <20201022100126.19565-1-zhuoliang.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_060832_459142_CF81A1BB 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: zhuoliang zhang <zhuoliang.zhang@mediatek.com>, wsd_upstream@mediatek.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: zhuoliang zhang <zhuoliang.zhang@mediatek.com>

we found that the following race condition exists in
xfrm_alloc_userspi flow:

user thread                                    state_hash_work thread
----                                           ----
xfrm_alloc_userspi()
 __find_acq_core()
   /*alloc new xfrm_state:x*/
   xfrm_state_alloc()
   /*schedule state_hash_work thread*/
   xfrm_hash_grow_check()   	               xfrm_hash_resize()
 xfrm_alloc_spi                                  /*hold lock*/
      x->id.spi = htonl(spi)                     spin_lock_bh(&net->xfrm.xfrm_state_lock)
      /*waiting lock release*/                     xfrm_hash_transfer()
      spin_lock_bh(&net->xfrm.xfrm_state_lock)      /*add x into hlist:net->xfrm.state_byspi*/
	                                                hlist_add_head_rcu(&x->byspi)
                                                 spin_unlock_bh(&net->xfrm.xfrm_state_lock)

    /*add x into hlist:net->xfrm.state_byspi 2 times*/
    hlist_add_head_rcu(&x->byspi)

1. a new state x is alloced in xfrm_state_alloc() and added into the bydst hlist
in  __find_acq_core() on the LHS;
2. on the RHS, state_hash_work thread travels the old bydst and tranfers every xfrm_state
(include x) into the new bydst hlist and new byspi hlist;
3. user thread on the LHS gets the lock and adds x into the new byspi hlist again.

So the same xfrm_state (x) is added into the same list_hash
(net->xfrm.state_byspi) 2 times that makes the list_hash become
an inifite loop.

To fix the race, x->id.spi = htonl(spi) in the xfrm_alloc_spi() is moved
to the back of spin_lock_bh, sothat state_hash_work thread no longer add x
which id.spi is zero into the hash_list.

Fixes: f034b5d4efdf ("[XFRM]: Dynamic xfrm_state hash table sizing.")
Signed-off-by: zhuoliang zhang <zhuoliang.zhang@mediatek.com>
---
 net/xfrm/xfrm_state.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index bbd4643d7e82..a77da7aae6fe 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2004,6 +2004,7 @@ int xfrm_alloc_spi(struct xfrm_state *x, u32 low, u32 high)
 	int err = -ENOENT;
 	__be32 minspi = htonl(low);
 	__be32 maxspi = htonl(high);
+	__be32 newspi = 0;
 	u32 mark = x->mark.v & x->mark.m;
 
 	spin_lock_bh(&x->lock);
@@ -2022,21 +2023,22 @@ int xfrm_alloc_spi(struct xfrm_state *x, u32 low, u32 high)
 			xfrm_state_put(x0);
 			goto unlock;
 		}
-		x->id.spi = minspi;
+		newspi = minspi;
 	} else {
 		u32 spi = 0;
 		for (h = 0; h < high-low+1; h++) {
 			spi = low + prandom_u32()%(high-low+1);
 			x0 = xfrm_state_lookup(net, mark, &x->id.daddr, htonl(spi), x->id.proto, x->props.family);
 			if (x0 == NULL) {
-				x->id.spi = htonl(spi);
+				newspi = htonl(spi);
 				break;
 			}
 			xfrm_state_put(x0);
 		}
 	}
-	if (x->id.spi) {
+	if (newspi) {
 		spin_lock_bh(&net->xfrm.xfrm_state_lock);
+		x->id.spi = newspi;
 		h = xfrm_spi_hash(net, &x->id.daddr, x->id.spi, x->id.proto, x->props.family);
 		hlist_add_head_rcu(&x->byspi, net->xfrm.state_byspi + h);
 		spin_unlock_bh(&net->xfrm.xfrm_state_lock);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
