Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0800CC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 12:49:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFCF60F93
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 12:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEFCF60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3IOy5E0eauDqJjRI0f6ak4yANMaCc5hIRxT0S8IiL3c=; b=Tij5/bB+Hr9Ro+
	3CT/MaNl/rYRRT4saz6bXVk6utKtsn0ZQc1hNnIa5BOVwXwuCr5l8BNTvoIpky2rlmZQfhXbM3Rxt
	cLRgJkyHWOwPTl+HesnPGMWd7FRpKi5TAQrqIf2yF2ZiLAbmPJovzGC/piv34vRU8ya+RmW0b55Ix
	xevk6/PGHNMPi3o5vPL785h4mBXjRcZh+6olfZXdfMo57+XKSVpLzuV0TnYmpQWqrPhSOG/F17xZa
	mm4s02eAPPjfRoFHtHWtTyXy7NdOkK8x0qZa3WQUJlhL86jmIWkQnwGWOSrNG1ALMbHvIWqcP9TZf
	sXFpK+xOeQg024Sa0CNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAtrA-002kO7-OZ; Tue, 03 Aug 2021 12:49:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtOI-002acN-Ng; Tue, 03 Aug 2021 12:19:28 +0000
X-UUID: 5f0af844ae4d47f5a93fea6eaa21aa34-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Vda9KSNqfQuuwuPjSrl+R3ubgQBHg85IEBNXocsQ4ps=; 
 b=dTKIG7XfDXWdFFU9WYWPAu64w9XIeNmwAU9iZAhHmduq2WfCl+9HmUJfqSwirYlUgPMG8XSxsarhci26WLCnx/eRW/rMtrmSPuYu0Ll4BrxXex0OQ11WzhzYyTnUMqKD4QDOYg0pDDL3WwY+MqxBS3DS1uA4qhNc+qdxXlT6ZkA=;
X-UUID: 5f0af844ae4d47f5a93fea6eaa21aa34-20210803
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1561624406; Tue, 03 Aug 2021 05:19:23 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 05:19:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 20:19:20 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 20:19:19 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: [PATCH net-next] net: add extack arg for link ops
Date: Tue, 3 Aug 2021 20:02:50 +0800
Message-ID: <20210803120250.32642-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_051926_858474_DFD278D4 
X-CRM114-Status: GOOD (  14.66  )
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

Pass extack arg to validate_linkmsg and validate_link_af callbacks.
If a netlink attribute has a reject_message, use the extended ack
mechanism to carry the message back to user space.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 include/net/rtnetlink.h | 3 ++-
 net/core/rtnetlink.c    | 9 +++++----
 net/ipv4/devinet.c      | 5 +++--
 net/ipv6/addrconf.c     | 5 +++--
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/include/net/rtnetlink.h b/include/net/rtnetlink.h
index 384e800665f2..9f48733bfd21 100644
--- a/include/net/rtnetlink.h
+++ b/include/net/rtnetlink.h
@@ -153,7 +153,8 @@ struct rtnl_af_ops {
 						    u32 ext_filter_mask);
 
 	int			(*validate_link_af)(const struct net_device *dev,
-						    const struct nlattr *attr);
+						    const struct nlattr *attr,
+						    struct netlink_ext_ack *extack);
 	int			(*set_link_af)(struct net_device *dev,
 					       const struct nlattr *attr,
 					       struct netlink_ext_ack *extack);
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index f6af3e74fc44..8c78715338b0 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -2268,7 +2268,8 @@ static int rtnl_ensure_unique_netns(struct nlattr *tb[],
 	return -EINVAL;
 }
 
-static int validate_linkmsg(struct net_device *dev, struct nlattr *tb[])
+static int validate_linkmsg(struct net_device *dev, struct nlattr *tb[],
+			    struct netlink_ext_ack *extack)
 {
 	if (dev) {
 		if (tb[IFLA_ADDRESS] &&
@@ -2295,7 +2296,7 @@ static int validate_linkmsg(struct net_device *dev, struct nlattr *tb[])
 				return -EOPNOTSUPP;
 
 			if (af_ops->validate_link_af) {
-				err = af_ops->validate_link_af(dev, af);
+				err = af_ops->validate_link_af(dev, af, extack);
 				if (err < 0)
 					return err;
 			}
@@ -2603,7 +2604,7 @@ static int do_setlink(const struct sk_buff *skb,
 	const struct net_device_ops *ops = dev->netdev_ops;
 	int err;
 
-	err = validate_linkmsg(dev, tb);
+	err = validate_linkmsg(dev, tb, extack);
 	if (err < 0)
 		return err;
 
@@ -3301,7 +3302,7 @@ static int __rtnl_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
 			m_ops = master_dev->rtnl_link_ops;
 	}
 
-	err = validate_linkmsg(dev, tb);
+	err = validate_linkmsg(dev, tb, extack);
 	if (err < 0)
 		return err;
 
diff --git a/net/ipv4/devinet.c b/net/ipv4/devinet.c
index 73721a4448bd..26856064096a 100644
--- a/net/ipv4/devinet.c
+++ b/net/ipv4/devinet.c
@@ -1950,7 +1950,8 @@ static const struct nla_policy inet_af_policy[IFLA_INET_MAX+1] = {
 };
 
 static int inet_validate_link_af(const struct net_device *dev,
-				 const struct nlattr *nla)
+				 const struct nlattr *nla,
+				 struct netlink_ext_ack *extack)
 {
 	struct nlattr *a, *tb[IFLA_INET_MAX+1];
 	int err, rem;
@@ -1959,7 +1960,7 @@ static int inet_validate_link_af(const struct net_device *dev,
 		return -EAFNOSUPPORT;
 
 	err = nla_parse_nested_deprecated(tb, IFLA_INET_MAX, nla,
-					  inet_af_policy, NULL);
+					  inet_af_policy, extack);
 	if (err < 0)
 		return err;
 
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 3bf685fe64b9..59792779551e 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -5784,7 +5784,8 @@ static int check_stable_privacy(struct inet6_dev *idev, struct net *net,
 }
 
 static int inet6_validate_link_af(const struct net_device *dev,
-				  const struct nlattr *nla)
+				  const struct nlattr *nla,
+				  struct netlink_ext_ack *extack)
 {
 	struct nlattr *tb[IFLA_INET6_MAX + 1];
 	struct inet6_dev *idev = NULL;
@@ -5797,7 +5798,7 @@ static int inet6_validate_link_af(const struct net_device *dev,
 	}
 
 	err = nla_parse_nested_deprecated(tb, IFLA_INET6_MAX, nla,
-					  inet6_af_policy, NULL);
+					  inet6_af_policy, extack);
 	if (err)
 		return err;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
