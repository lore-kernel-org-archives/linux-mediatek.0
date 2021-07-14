Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4787C11F66
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 15:32:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4DC0613C5
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 15:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4DC0613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zPF+QRs2NUdN5xanaYIrdI78YzOZ+p++CxMcBUtDa3c=; b=JYtA2ed99qhsV9
	2q/IyUM4DGxY5hqGfX/+vEdC/erYzdy1KiVLkzle8XdfF7B5V3dXX68XUghsvP+iF2znzCCZfIrz4
	fML03AESTsV4ZDWEML8ySUmo/IUgZOBSRl92CWbZGm2U+DkYNYYmWv1pZcBOXWlFoSnq/Km/6PBgO
	sp8JImGnzpm9I6F+Cw1EFbCHe3kQ+UnaKwnesm/3ZmqBbE/MuQCJwBJtK1GwGDvaZIAej9XgSEq4x
	IqQhGDCVD9HgAbCEkTbfReQBFhY3RH9iE9FBI7Xo+4UsV24Mbc3nKwubt0z4yAgGilJ24ZTwRo4WN
	zb0urCFw53WRcnUKmGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3grW-00Dxjh-HX; Wed, 14 Jul 2021 15:31:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3gr3-00Dxdj-D0; Wed, 14 Jul 2021 15:31:24 +0000
X-UUID: 3c60dff34e7c492fa7e885460ebda83f-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6TUh6vLXrhYAbeLQ3zMAUrT/iOwQ5DCQkpgV4k4Q57g=; 
 b=B31v5K3SuvsCGYZaz3tV0H8RRZwYMfrkNajM+KbMkQ+02dikwGmBlqMajqPp4bku3TkaIAzEZjTYh/+qlhc74Lxik2SNtqt/DTXcAPNq77zS8l7drR0EM83paDcGTaLfTt9G+/pDeuFGlZwI1BZZCu5OewU1SWZ/tuWZJgACkwA=;
X-UUID: 3c60dff34e7c492fa7e885460ebda83f-20210714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 430831818; Wed, 14 Jul 2021 08:31:15 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 08:31:14 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 23:31:12 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 23:31:12 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, <rocco.yue@gmail.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: [PATCH] ipv6: remove unused local variable
Date: Wed, 14 Jul 2021 23:15:33 +0800
Message-ID: <20210714151533.6210-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_083122_899725_847984C4 
X-CRM114-Status: GOOD (  11.02  )
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
