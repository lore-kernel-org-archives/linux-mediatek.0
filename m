Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3929AC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 04:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED79E61362
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 04:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED79E61362
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zPF+QRs2NUdN5xanaYIrdI78YzOZ+p++CxMcBUtDa3c=; b=W97DmXwSWXlsl6
	0H/dq506IxBKX7lF5XwxDgXwpM+QnN2ZSiWLSxFX/Yt/NMNm6Ht25sS2n4XOgxUlKMPnyzeSnyt0A
	xd5+iyw9oP5IoOM6iE8tFgLaURTtasb3r5CqCmhdgLwxVlFHdXo4j+oF9Ki/QDW1F1bhtocUvmCMK
	ko4vrnyUQL/665c5Qy8MOpIQtdyE0pWTt2DiI6jX++4bwHCYQS4S9NFwOKJVq520BbCBkJ1H3pn4H
	YZbjHWd138lZOk5p7TFUdmZ1nI/cxJxILKjQdVjQefClgJPKn79byma4DpKNC79MVRhVRTis3ccdi
	lPLmtMfthGB/GH2NeefQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3tGL-00H8DL-Db; Thu, 15 Jul 2021 04:46:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3tG7-00H8B5-G9; Thu, 15 Jul 2021 04:46:04 +0000
X-UUID: 593eb4c8b4974964a32ecd2ce823b5bf-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6TUh6vLXrhYAbeLQ3zMAUrT/iOwQ5DCQkpgV4k4Q57g=; 
 b=sqS/zbbHlF+fbwBavruHP6rl9vk2MdlW3ZCLJM3+AyVevLYnokMCv9hfx5yzqC2d3B4PW3ErW3Az6l+4QqcrSKFA5eIg+oxhGl9AWrRNUww1zuOhRzPhdy7r0oU8xfzPE72lLCuNoQYTEVC346e4btwaLTi3eAyFpDOTrdhPtr4=;
X-UUID: 593eb4c8b4974964a32ecd2ce823b5bf-20210714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 486645064; Wed, 14 Jul 2021 21:46:01 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 21:36:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 12:36:30 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 12:36:29 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, <rocco.yue@gmail.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: [PATCH v2] net: ipv6: remove unused local variable
Date: Thu, 15 Jul 2021 12:20:34 +0800
Message-ID: <20210715042034.6525-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_214603_590574_E831E387 
X-CRM114-Status: GOOD (  10.66  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The local variable "struct net *net" in the two functions of
inet6_rtm_getaddr() and inet6_dump_addr() are actually useless,
so remove them.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 net/ipv6/addrconf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 3bf685fe64b9..e2f625e39455 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -5211,8 +5211,7 @@ static int inet6_dump_addr(struct sk_buff *skb, struct netlink_callback *cb,
 		.netnsid = -1,
 		.type = type,
 	};
-	struct net *net = sock_net(skb->sk);
-	struct net *tgt_net = net;
+	struct net *tgt_net = sock_net(skb->sk);
 	int idx, s_idx, s_ip_idx;
 	int h, s_h;
 	struct net_device *dev;
@@ -5351,7 +5350,7 @@ static int inet6_rtm_valid_getaddr_req(struct sk_buff *skb,
 static int inet6_rtm_getaddr(struct sk_buff *in_skb, struct nlmsghdr *nlh,
 			     struct netlink_ext_ack *extack)
 {
-	struct net *net = sock_net(in_skb->sk);
+	struct net *tgt_net = sock_net(in_skb->sk);
 	struct inet6_fill_args fillargs = {
 		.portid = NETLINK_CB(in_skb).portid,
 		.seq = nlh->nlmsg_seq,
@@ -5359,7 +5358,6 @@ static int inet6_rtm_getaddr(struct sk_buff *in_skb, struct nlmsghdr *nlh,
 		.flags = 0,
 		.netnsid = -1,
 	};
-	struct net *tgt_net = net;
 	struct ifaddrmsg *ifm;
 	struct nlattr *tb[IFA_MAX+1];
 	struct in6_addr *addr = NULL, *peer;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
