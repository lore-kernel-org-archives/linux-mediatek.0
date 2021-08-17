Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E50C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:27:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FE260C3E
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55FE260C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xd3DNAXWMTIQTG8FZ334xQLfy1qzIHCtjYHQGoxkjMg=; b=uln740IIFcWqoF
	I/0g3SIoYESdcGF59G8BpCc03vdtLiQHZctYA/3YaSNG+MgmurFDY20j3OSyWxWN1M/QyKq9jQejF
	OJjrcH3L/mEn2044wOZNPUc4SW8jZ0conRifpUA9Fi7FLAqJlL+V28M4HJChbyLFIcSn3uTPfMDBj
	B34fbPGGyOWeGOoetbScH9gTkUItghxbhTKTabPc0Q8Vu7XkY2qD3ba4EOUKQu9Rxub5lcvqNt3Is
	yNYJS8bQor53qjxAg4ZsZzuqzzjaJHdLzj1qCdnqxCBn8/3U2TliAiVx/bnLXmCxtm4EidRskrmCu
	fGO6iNEqb/u7hZMhVUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFtUm-001JaC-Ho; Tue, 17 Aug 2021 07:26:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFtUh-001JYX-T3; Tue, 17 Aug 2021 07:26:47 +0000
X-UUID: ed1a58bf8b2e407c8317f11483762c52-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=i6ubYmjSGH2cdYpIt3QptOxPfIZ5IxCXE+arcBUG8q8=; 
 b=YppddCKS+vXjTTPl8invcWeVfb9XUmWB8TUvmrOwgyCzCyYkyMIpN8tTxxhCaCB5bi0+0/EwMY38WMIIOupz8tTkZNG1Bqw50KuUZjzjrNV8ZV+WJCELTf/J9+LHBIOOWrytwqFreO9MIVi/dwZme8OcfP3UQLspkEtXhx/KwcE=;
X-UUID: ed1a58bf8b2e407c8317f11483762c52-20210817
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1955160997; Tue, 17 Aug 2021 00:26:40 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 00:26:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 15:26:31 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 15:26:30 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: [PATCH net-next v4] ipv6: add IFLA_INET6_RA_MTU to expose mtu value
 in the RA message
Date: Tue, 17 Aug 2021 15:26:09 +0800
Message-ID: <20210817072609.2110-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_002643_989485_104FDD8E 
X-CRM114-Status: GOOD (  27.48  )
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
different, the user can obtain the correct ipv6 ra_mtu value
and compare the value of ra_mtu and ipv4 mtu, then the device
can use the lower MTU value for both IPv4 and IPv6.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 include/net/if_inet6.h             |  2 ++
 include/uapi/linux/if_link.h       |  1 +
 net/ipv6/addrconf.c                |  8 ++++++++
 net/ipv6/ndisc.c                   | 17 +++++++++++------
 tools/include/uapi/linux/if_link.h |  1 +
 5 files changed, 23 insertions(+), 6 deletions(-)

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
diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
index 5310003523ce..957ec9873e70 100644
--- a/include/uapi/linux/if_link.h
+++ b/include/uapi/linux/if_link.h
@@ -417,6 +417,7 @@ enum {
 	IFLA_INET6_ICMP6STATS,	/* statistics (icmpv6)		*/
 	IFLA_INET6_TOKEN,	/* device token			*/
 	IFLA_INET6_ADDR_GEN_MODE, /* implicit address generator mode */
+	IFLA_INET6_RA_MTU,	/* mtu carried in the RA message */
 	__IFLA_INET6_MAX
 };
 
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 8381288a0d6e..3eb957777b31 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -394,6 +394,7 @@ static struct inet6_dev *ipv6_add_dev(struct net_device *dev)
 		ndev->cnf.addr_gen_mode = IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
 
 	ndev->cnf.mtu6 = dev->mtu;
+	ndev->ra_mtu = U32_MIN;
 	ndev->nd_parms = neigh_parms_alloc(dev, &nd_tbl);
 	if (!ndev->nd_parms) {
 		kfree(ndev);
@@ -5543,6 +5544,7 @@ static inline size_t inet6_ifla6_size(void)
 	     + nla_total_size(ICMP6_MIB_MAX * 8) /* IFLA_INET6_ICMP6STATS */
 	     + nla_total_size(sizeof(struct in6_addr)) /* IFLA_INET6_TOKEN */
 	     + nla_total_size(1) /* IFLA_INET6_ADDR_GEN_MODE */
+	     + nla_total_size(4) /* IFLA_INET6_RA_MTU */
 	     + 0;
 }
 
@@ -5651,6 +5653,9 @@ static int inet6_fill_ifla6_attrs(struct sk_buff *skb, struct inet6_dev *idev,
 	if (nla_put_u8(skb, IFLA_INET6_ADDR_GEN_MODE, idev->cnf.addr_gen_mode))
 		goto nla_put_failure;
 
+	if (nla_put_u32(skb, IFLA_INET6_RA_MTU, idev->ra_mtu))
+		goto nla_put_failure;
+
 	return 0;
 
 nla_put_failure:
@@ -5767,6 +5772,9 @@ static int inet6_set_iftoken(struct inet6_dev *idev, struct in6_addr *token,
 static const struct nla_policy inet6_af_policy[IFLA_INET6_MAX + 1] = {
 	[IFLA_INET6_ADDR_GEN_MODE]	= { .type = NLA_U8 },
 	[IFLA_INET6_TOKEN]		= { .len = sizeof(struct in6_addr) },
+	[IFLA_INET6_RA_MTU]		= { .type = NLA_REJECT,
+					    .reject_message =
+						"IFLA_INET6_RA_MTU can't be set" },
 };
 
 static int check_addr_gen_mode(int mode)
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index c467c6419893..23e690769857 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1391,12 +1391,6 @@ static void ndisc_router_discovery(struct sk_buff *skb)
 		}
 	}
 
-	/*
-	 *	Send a notify if RA changed managed/otherconf flags or timer settings
-	 */
-	if (send_ifinfo_notify)
-		inet6_ifinfo_notify(RTM_NEWLINK, in6_dev);
-
 skip_linkparms:
 
 	/*
@@ -1496,6 +1490,11 @@ static void ndisc_router_discovery(struct sk_buff *skb)
 		memcpy(&n, ((u8 *)(ndopts.nd_opts_mtu+1))+2, sizeof(mtu));
 		mtu = ntohl(n);
 
+		if (in6_dev->ra_mtu != mtu) {
+			in6_dev->ra_mtu = mtu;
+			send_ifinfo_notify = true;
+		}
+
 		if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu) {
 			ND_PRINTK(2, warn, "RA: invalid mtu: %d\n", mtu);
 		} else if (in6_dev->cnf.mtu6 != mtu) {
@@ -1519,6 +1518,12 @@ static void ndisc_router_discovery(struct sk_buff *skb)
 		ND_PRINTK(2, warn, "RA: invalid RA options\n");
 	}
 out:
+	/* Send a notify if RA changed managed/otherconf flags or timer
+	 * settings or ra_mtu value
+	 */
+	if (send_ifinfo_notify)
+		inet6_ifinfo_notify(RTM_NEWLINK, in6_dev);
+
 	fib6_info_release(rt);
 	if (neigh)
 		neigh_release(neigh);
diff --git a/tools/include/uapi/linux/if_link.h b/tools/include/uapi/linux/if_link.h
index eb15f319aa57..b3610fdd1fee 100644
--- a/tools/include/uapi/linux/if_link.h
+++ b/tools/include/uapi/linux/if_link.h
@@ -230,6 +230,7 @@ enum {
 	IFLA_INET6_ICMP6STATS,	/* statistics (icmpv6)		*/
 	IFLA_INET6_TOKEN,	/* device token			*/
 	IFLA_INET6_ADDR_GEN_MODE, /* implicit address generator mode */
+	IFLA_INET6_RA_MTU,	/* mtu carried in the RA message */
 	__IFLA_INET6_MAX
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
