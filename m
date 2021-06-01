Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08BEC4708F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 09:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 548B860C3D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 09:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 548B860C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=62s0ny6Z7L8ffd35gmT5/LJgh+CTlgdTk5gaTJFsjPA=; b=HzDiDFB1yCl4ij
	RqnxkSFFng4K2U9LPJVJkyy8/5g5kru89CujWBzVcLPY5MxIb0TKtVz00+9w0ern0N+7ky7uQPu4m
	bIkoUzoe5hQ2DRoGBP4EtxdmorI7Gz6bWXcWt+m5ESlv/500FgXKE0EShF+kDn/qnQRNRS2epg4ee
	LnChN5lz1XpBW6Ttb5ggNfB5uLzXgYIQ1hGQzTjpfa5U8D5VvlskkT0YCOphUKHH2JvXaeFUJupoR
	DB+VHhbzcHIeO5cG+10CXjAQrjlPsvQeUR+yh05xFXtb0SLzMOMdoMqsjr3nM5h/T3FzZx9iVVnOe
	L3XlZrEpOJbN6NyhrFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0r2-00Fgvu-3R; Tue, 01 Jun 2021 09:38:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0qm-00Fgrc-8f; Tue, 01 Jun 2021 09:38:19 +0000
X-UUID: 65e96487e3b44e61856a7d49a477f192-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NYWkxxorOjw4KB57TORj/ifv6NK2anoC7NeRloIsTuI=; 
 b=Y/IaNN+Glvb9S0TJsB6Th+FUEhHt+Al/m4Q/b/aRcjVnQGq0fW/PgbEDyJU5bHtFip2SVpSJtUqTDfzv7Hdz9wLBDOjRQgkXDY0E1EfvaDA3AhnOHoH8541VnmCeakiyRhXkfgclVKJa8MTmEQ4HdnMB/NeNP0clCwc6H+qNpVA=;
X-UUID: 65e96487e3b44e61856a7d49a477f192-20210601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1242164932; Tue, 01 Jun 2021 02:38:11 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 02:30:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 17:30:02 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Jun 2021 17:30:01 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, <rocco.yue@gmail.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: [PATCH] ipv6: create ra_mtu proc file to only record mtu in RA
Date: Tue, 1 Jun 2021 17:16:19 +0800
Message-ID: <20210601091619.19372-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_023817_746453_2B28094F 
X-CRM114-Status: GOOD (  21.50  )
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

kernel provides a "/proc/sys/net/ipv6/conf/<iface>/mtu" file,
which can temporarily record the mtu value of the last received
RA message when ra mtu is lower than the interface mtu, but this
proc has following limitations:
(1) when the interface mtu (/sys/class/net/<iface>/mtu) is
updeated, mtu6 (/proc/sys/net/ipv6/conf/<iface>/mtu) will be
updated to the value of interface mtu;
(2) mtu6 (/proc/sys/net/ipv6/conf/<iface>/mtu) only affect
ipv6 connection, and not affect ipv4.

Therefore, when the mtu option is carried in the RA message,
there will be a problem that the user sometimes cannot obtain
ra mtu value by reading mtu6.

Waiting for RA to arrive, setting the interface mtu after
reading mtu6 can avoid above problem. But device can't do this,
on the one hand, the device should first ensure that the ipv4
function is normal, and on the other hand, the time point of
receiving the RA message from the network is not certain.

For this patch set, if RA message carries the mtu option,
"proc/sys/net/ipv6/conf/<iface>/ra_mtu" will be updated to the
mtu value carried in the last RA message received, and ra_mtu
is an independent proc file, which is not affected by the update
of interface mtu value.

In this way, If the MTU values that the device receives from the
network in the PCO IPv4 and the RA IPv6 procedures are different,
the user space process can read ra_mtu to get the mtu value carried
in the RA message without worrying about the issue of ipv4 being
stuck due to the late arrival of RA message. After comparing the
value of ra_mtu and ipv4 mtu, then the device can use the lower
MTU value for both IPv4 and IPv6.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 include/linux/ipv6.h      |  1 +
 include/uapi/linux/ipv6.h |  1 +
 net/ipv6/addrconf.c       | 10 ++++++++++
 net/ipv6/ndisc.c          |  5 +++++
 4 files changed, 17 insertions(+)

diff --git a/include/linux/ipv6.h b/include/linux/ipv6.h
index 70b2ad3b9884..1679b7ce6780 100644
--- a/include/linux/ipv6.h
+++ b/include/linux/ipv6.h
@@ -13,6 +13,7 @@ struct ipv6_devconf {
 	__s32		forwarding;
 	__s32		hop_limit;
 	__s32		mtu6;
+	__s32		ra_mtu;
 	__s32		accept_ra;
 	__s32		accept_redirects;
 	__s32		autoconf;
diff --git a/include/uapi/linux/ipv6.h b/include/uapi/linux/ipv6.h
index 70603775fe91..1214befaea9f 100644
--- a/include/uapi/linux/ipv6.h
+++ b/include/uapi/linux/ipv6.h
@@ -140,6 +140,7 @@ enum {
 	DEVCONF_FORWARDING = 0,
 	DEVCONF_HOPLIMIT,
 	DEVCONF_MTU6,
+	DEVCONF_RA_MTU,
 	DEVCONF_ACCEPT_RA,
 	DEVCONF_ACCEPT_REDIRECTS,
 	DEVCONF_AUTOCONF,
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index b0ef65eb9bd2..d2cd30bd25b3 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -187,6 +187,7 @@ static struct ipv6_devconf ipv6_devconf __read_mostly = {
 	.forwarding		= 0,
 	.hop_limit		= IPV6_DEFAULT_HOPLIMIT,
 	.mtu6			= IPV6_MIN_MTU,
+	.ra_mtu			= 0,
 	.accept_ra		= 1,
 	.accept_redirects	= 1,
 	.autoconf		= 1,
@@ -243,6 +244,7 @@ static struct ipv6_devconf ipv6_devconf_dflt __read_mostly = {
 	.forwarding		= 0,
 	.hop_limit		= IPV6_DEFAULT_HOPLIMIT,
 	.mtu6			= IPV6_MIN_MTU,
+	.ra_mtu			= 0,
 	.accept_ra		= 1,
 	.accept_redirects	= 1,
 	.autoconf		= 1,
@@ -5460,6 +5462,7 @@ static inline void ipv6_store_devconf(struct ipv6_devconf *cnf,
 	array[DEVCONF_FORWARDING] = cnf->forwarding;
 	array[DEVCONF_HOPLIMIT] = cnf->hop_limit;
 	array[DEVCONF_MTU6] = cnf->mtu6;
+	array[DEVCONF_RA_MTU] = cnf->ra_mtu;
 	array[DEVCONF_ACCEPT_RA] = cnf->accept_ra;
 	array[DEVCONF_ACCEPT_REDIRECTS] = cnf->accept_redirects;
 	array[DEVCONF_AUTOCONF] = cnf->autoconf;
@@ -6565,6 +6568,13 @@ static const struct ctl_table addrconf_sysctl[] = {
 		.mode		= 0644,
 		.proc_handler	= addrconf_sysctl_mtu,
 	},
+	{
+		.procname	= "ra_mtu",
+		.data		= &ipv6_devconf.ra_mtu,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+	},
 	{
 		.procname	= "accept_ra",
 		.data		= &ipv6_devconf.accept_ra,
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index c467c6419893..1da626267662 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -1496,6 +1496,11 @@ static void ndisc_router_discovery(struct sk_buff *skb)
 		memcpy(&n, ((u8 *)(ndopts.nd_opts_mtu+1))+2, sizeof(mtu));
 		mtu = ntohl(n);
 
+		if (in6_dev->cnf.ra_mtu != mtu) {
+			in6_dev->cnf.ra_mtu = mtu;
+			ND_PRINTK(2, info, "update ra_mtu to %d\n", in6_dev->cnf.ra_mtu);
+		}
+
 		if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu) {
 			ND_PRINTK(2, warn, "RA: invalid mtu: %d\n", mtu);
 		} else if (in6_dev->cnf.mtu6 != mtu) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
