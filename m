Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA494C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 14:03:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5D760F35
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 14:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E5D760F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=02bjodaQuMSCbpbJKKd3BXIBJLEXvqAZS9t6AU8J23k=; b=dugZCCbdT5LuCk
	qb9XuHEyNa0bi3hE6XGLp+DXofcEW//xfReZHnFb3Re988gE7Ys7dV5aqmKtysBaZyuBpiHgK3/HL
	vX94qa5LN/SDgclSHC+mqEcMo7ZwPPMcSW1D8U59iQUscTjl9wHpvEgyxTnh9jh+iN0yiX1TuKsP8
	0+Uz/c/BLmLCgxDEfO1JUYgQaDmmDhfG5mSzfxdQk2PdqabuU5+G6UpJD7w5jBlzwSWkcogWmz74a
	dE8lgun43jVufxe7cTwmg0yTOKOWNytkHgTV9W+MuEqJdlKo8L29hSM72BnbS1idpzqCbpNKqNQSe
	+uACLWpBqOpGF01ql1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD5sS-000rLl-7W; Mon, 09 Aug 2021 14:03:40 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD5s8-000rDw-UI; Mon, 09 Aug 2021 14:03:24 +0000
X-UUID: 53fba3482cd747e28b434db7da2d031b-20210809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=l38sAvTdDMSG39WWWPttGlu/AgOMdCQ1C6KTUdY54qI=; 
 b=mlDoCvyHjpqpVKSuPq7J3jogSJm+azD12ff02QQ/X/ZlqHlRqeee6KJvk6h83gRQ30II6gMznV/HZn1KdEg7JkVzeRxcmcJW3qm7uie/cdV47vEWbNWsWQkREYnO/xY8+MrD7cV/hZg2Bym1IewOVasII+nF/odcWG3lkeeDUuc=;
X-UUID: 53fba3482cd747e28b434db7da2d031b-20210809
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1466168864; Mon, 09 Aug 2021 07:03:12 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 07:03:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 9 Aug 2021 22:03:09 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Aug 2021 22:03:02 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: [PATCH net-next v3] ipv6: add IFLA_INET6_RA_MTU to expose mtu value
 in the RA message
Date: Mon, 9 Aug 2021 22:01:09 +0800
Message-ID: <20210809140109.32595-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_070321_038562_557DCEF1 
X-CRM114-Status: GOOD (  28.65  )
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

The kernel provides a "/proc/sys/net/ipv6/conf/<iface>/mtu"
file, which can temporarily record the mtu value of the last
received RA message when the RA mtu value is lower than the
interface mtu, but this proc has following limitations:

(1) when the interface mtu (/sys/class/net/<iface>/mtu) is
updeated, mtu6 (/proc/sys/net/ipv6/conf/<iface>/mtu) will
be updated to the value of interface mtu;
(2) mtu6 (/proc/sys/net/ipv6/conf/<iface>/mtu) only affect
ipv6 connection, and not affect ipv4.

Therefore, when the mtu option is carried in the RA message,
there will be a problem that the user sometimes cannot obtain
RA mtu value correctly by reading mtu6.

After this patch set, if a RA message carries the mtu option,
you can send a netlink msg which nlmsg_type is RTM_GETLINK,
and then by parsing the attribute of IFLA_INET6_RA_MTU to
get the mtu value carried in the RA message received on the
inet6 device. In addition, you can also get a link notification
when ra_mtu is updated so it doesn't have to poll.

In this way, if the MTU values that the device receives from
the network in the PCO IPv4 and the RA IPv6 procedures are
different, the user space process can read ra_mtu to get
the mtu value carried in the RA message without worrying
about the issue of ipv4 being stuck due to the late arrival
of RA message. After comparing the value of ra_mtu and ipv4
mtu, then the device can use the lower MTU value for both
IPv4 and IPv6.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 include/net/if_inet6.h             |  2 +
 include/net/ndisc.h                |  1 +
 include/uapi/linux/if_link.h       |  1 +
 net/ipv6/addrconf.c                | 67 ++++++++++++++++++++++++++++++
 net/ipv6/ndisc.c                   |  6 +++
 tools/include/uapi/linux/if_link.h |  1 +
 6 files changed, 78 insertions(+)

diff --git a/include/net/if_inet6.h b/include/net/if_inet6.h
index 42235c178b06..653e7d0f65cb 100644
--- a/include/net/if_inet6.h
+++ b/include/net/if_inet6.h
@@ -210,6 +210,8 @@ struct inet6_dev {
 
 	unsigned long		tstamp; /* ipv6InterfaceTable update timestamp */
 	struct rcu_head		rcu;
+
+	unsigned int		ra_mtu;
 };
 
 static inline void ipv6_eth_mc_map(const struct in6_addr *addr, char *buf)
diff --git a/include/net/ndisc.h b/include/net/ndisc.h
index 38e4094960ce..c7b7f1b002fd 100644
--- a/include/net/ndisc.h
+++ b/include/net/ndisc.h
@@ -501,5 +501,6 @@ int ndisc_ifinfo_sysctl_strategy(struct ctl_table *ctl,
 #endif
 
 void inet6_ifinfo_notify(int event, struct inet6_dev *idev);
+void inet6_iframtu_notify(struct inet6_dev *idev);
 
 #endif
diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
index 5310003523ce..6dfdae1bb860 100644
--- a/include/uapi/linux/if_link.h
+++ b/include/uapi/linux/if_link.h
@@ -417,6 +417,7 @@ enum {
 	IFLA_INET6_ICMP6STATS,	/* statistics (icmpv6)		*/
 	IFLA_INET6_TOKEN,	/* device token			*/
 	IFLA_INET6_ADDR_GEN_MODE, /* implicit address generator mode */
+	IFLA_INET6_RA_MTU,	/* mtu carried in the RA message  */
 	__IFLA_INET6_MAX
 };
 
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 8381288a0d6e..3e3cdd49c295 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -5543,6 +5543,7 @@ static inline size_t inet6_ifla6_size(void)
 	     + nla_total_size(ICMP6_MIB_MAX * 8) /* IFLA_INET6_ICMP6STATS */
 	     + nla_total_size(sizeof(struct in6_addr)) /* IFLA_INET6_TOKEN */
 	     + nla_total_size(1) /* IFLA_INET6_ADDR_GEN_MODE */
+	     + nla_total_size(4) /* IFLA_INET6_RA_MTU */
 	     + 0;
 }
 
@@ -5651,6 +5652,9 @@ static int inet6_fill_ifla6_attrs(struct sk_buff *skb, struct inet6_dev *idev,
 	if (nla_put_u8(skb, IFLA_INET6_ADDR_GEN_MODE, idev->cnf.addr_gen_mode))
 		goto nla_put_failure;
 
+	if (nla_put_u32(skb, IFLA_INET6_RA_MTU, idev->ra_mtu))
+		goto nla_put_failure;
+
 	return 0;
 
 nla_put_failure:
@@ -5767,6 +5771,9 @@ static int inet6_set_iftoken(struct inet6_dev *idev, struct in6_addr *token,
 static const struct nla_policy inet6_af_policy[IFLA_INET6_MAX + 1] = {
 	[IFLA_INET6_ADDR_GEN_MODE]	= { .type = NLA_U8 },
 	[IFLA_INET6_TOKEN]		= { .len = sizeof(struct in6_addr) },
+	[IFLA_INET6_RA_MTU]		= { .type = NLA_REJECT,
+					    .reject_message =
+					    "IFLA_INET6_RA_MTU can not be set" },
 };
 
 static int check_addr_gen_mode(int mode)
@@ -6129,6 +6136,66 @@ static void ipv6_ifa_notify(int event, struct inet6_ifaddr *ifp)
 		__ipv6_ifa_notify(event, ifp);
 }
 
+static inline size_t inet6_iframtu_msgsize(void)
+{
+	return NLMSG_ALIGN(sizeof(struct ifinfomsg))
+	     + nla_total_size(IFNAMSIZ)	/* IFLA_IFNAME */
+	     + nla_total_size(4);	/* IFLA_INET6_RA_MTU */
+}
+
+static int inet6_fill_iframtu(struct sk_buff *skb, struct inet6_dev *idev)
+{
+	struct net_device *dev = idev->dev;
+	struct ifinfomsg *hdr;
+	struct nlmsghdr *nlh;
+
+	nlh = nlmsg_put(skb, 0, 0, RTM_NEWLINK, sizeof(*hdr), 0);
+	if (!nlh)
+		return -EMSGSIZE;
+
+	hdr = nlmsg_data(nlh);
+	hdr->ifi_family = AF_INET6;
+	hdr->__ifi_pad = 0;
+	hdr->ifi_index = dev->ifindex;
+	hdr->ifi_flags = dev_get_flags(dev);
+	hdr->ifi_change = 0;
+
+	if (nla_put_string(skb, IFLA_IFNAME, dev->name) ||
+	    nla_put_u32(skb, IFLA_INET6_RA_MTU, idev->ra_mtu))
+		goto nla_put_failure;
+
+	nlmsg_end(skb, nlh);
+	return 0;
+
+nla_put_failure:
+	nlmsg_cancel(skb, nlh);
+	return -EMSGSIZE;
+}
+
+void inet6_iframtu_notify(struct inet6_dev *idev)
+{
+	struct sk_buff *skb;
+	struct net *net = dev_net(idev->dev);
+	int err = -ENOBUFS;
+
+	skb = nlmsg_new(inet6_iframtu_msgsize(), GFP_ATOMIC);
+	if (!skb)
+		goto errout;
+
+	err = inet6_fill_iframtu(skb, idev);
+	if (err < 0) {
+		/* -EMSGSIZE implies BUG in inet6_iframtu_msgsize() */
+		WARN_ON(err == -EMSGSIZE);
+		kfree_skb(skb);
+		goto errout;
+	}
+	rtnl_notify(skb, net, 0, RTNLGRP_IPV6_IFINFO, NULL, GFP_ATOMIC);
+	return;
+errout:
+	if (err < 0)
+		rtnl_set_sk_err(net, RTNLGRP_IPV6_IFINFO, err);
+}
+
 #ifdef CONFIG_SYSCTL
 
 static int addrconf_sysctl_forward(struct ctl_table *ctl, int write,
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index c467c6419893..a04164cbd77f 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1496,6 +1496,12 @@ static void ndisc_router_discovery(struct sk_buff *skb)
 		memcpy(&n, ((u8 *)(ndopts.nd_opts_mtu+1))+2, sizeof(mtu));
 		mtu = ntohl(n);
 
+		if (in6_dev->ra_mtu != mtu) {
+			in6_dev->ra_mtu = mtu;
+			inet6_iframtu_notify(in6_dev);
+			ND_PRINTK(2, info, "update ra_mtu to %d\n", in6_dev->ra_mtu);
+		}
+
 		if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu) {
 			ND_PRINTK(2, warn, "RA: invalid mtu: %d\n", mtu);
 		} else if (in6_dev->cnf.mtu6 != mtu) {
diff --git a/tools/include/uapi/linux/if_link.h b/tools/include/uapi/linux/if_link.h
index eb15f319aa57..36a8ae4793f1 100644
--- a/tools/include/uapi/linux/if_link.h
+++ b/tools/include/uapi/linux/if_link.h
@@ -230,6 +230,7 @@ enum {
 	IFLA_INET6_ICMP6STATS,	/* statistics (icmpv6)		*/
 	IFLA_INET6_TOKEN,	/* device token			*/
 	IFLA_INET6_ADDR_GEN_MODE, /* implicit address generator mode */
+	IFLA_INET6_RA_MTU,	/* mtu carried in the RA message  */
 	__IFLA_INET6_MAX
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
