Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA889C11F66
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 02:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AFC761002
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 02:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AFC761002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vvjUYR96453XBOoFoz6G9Ugcfkp2lkMmQbXfmMSMU5k=; b=QfZXdBdsKIrb1r
	j9ORQRv3ZN3eGbDtd8DvK35jCCrK//EpYQHU/7XnEC/YKbZFKnXDqvDg/qTxFFByJlx4XHY5mpK2A
	M4cuFhX9RK8NdYVGp6vLeR1l6fsAuzFfvE7ChJO+1xrsbhSjEnOChaw1d4EHGqwHPLk8W8mM6FHrB
	+9Zh7eqZDgk0r2wRnWblLGpuDIxKFPu25gnUR0A1W9kG5+XebKDrzJRGWFdqWXMXpQppeg0X1cfvD
	7awr6/gyvkpBGlTYFs58WHw+blJl0C/7u8WaplcCss63zCeWaLxufmgKEXHynF/G2HuWcLsCj/xbf
	f+pWS/bwUFkRoawMu8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lymHP-00Fsgn-4H; Thu, 01 Jul 2021 02:18:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lymHD-00FsfX-80; Thu, 01 Jul 2021 02:18:04 +0000
X-UUID: 58d03d6f6bf246ee8ad15d528ce192b3-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tAHVsbeVe+hr4XShmr2ub2HOwdboG03XA3/2tdZAuZk=; 
 b=bV2alDAfvdSnRVMN2wfYmvYhDiLEBwbS5IVsV9eoicDyXZnfifvidk29L02PtjA8WzzD6ugngWl84CskcmAddw9spXnzBroNBKQ0Aerv+3AtYmnADIetq47K+SmDTVRY40Or7AAb0NdwefORuemoFyV4bHAAkR4b5Ud0DE1FoOw=;
X-UUID: 58d03d6f6bf246ee8ad15d528ce192b3-20210630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 529689498; Wed, 30 Jun 2021 19:18:00 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 19:16:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 10:15:51 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 10:15:51 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, <Rocco.Yue@gmail.com>, <chao.song@mediatek.com>, 
 <kuohong.wang@mediatek.com>, <zhuoliang.zhang@mediatek.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
Date: Thu, 1 Jul 2021 09:59:40 +0800
Message-ID: <20210701015940.29726-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_191803_341003_2FACB7BC 
X-CRM114-Status: GOOD (  24.63  )
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

This patch provides an ipv6 proc file named
"disable_gen_linklocal_addr", its absolute path is as follows:
"/proc/sys/net/ipv6/conf/<iface>/disable_gen_linklocal_addr".

When the "disable_gen_linklocal_addr" value of a device is 1,
it means that this device does not need the Linux kernel to
automatically generate the ipv6 link-local address no matter
which IN6_ADDR_GEN_MODE is used.

The reasons why the kernel does not need to automatically
generate the ipv6 link-local address are as follows:

(1) In the 3GPP TS 29.061, here is a description as follows:
"in order to avoid any conflict between the link-local address
of the MS and that of the GGSN, the Interface-Identifier used
by the MS to build its link-local address shall be assigned by
the GGSN. The GGSN ensures the uniqueness of this Interface-
Identifier. The MT shall then enforce the use of this
Interface-Identifier by the TE"

In other words, in the cellular network, GGSN determines whether
to reply a solicited RA message by identifying the low 64 bits
of the source address of the received RS message. Therefore,
cellular network device's ipv6 link-local address should be set
as the format of fe80::(GGSN assigned IID).

For example: When using a new kernel and ARPHRD_RAWIP, kernel
will generate an EUI64 format ipv6 link-local address, and the
Linux kernel will uses this link-local address to send RS message.
The result is that the GGSN will not reply to the RS message with
a solicited RA message.

Although the combination of IN6_ADDR_GEN_MODE_NONE + ARPHRD_NONE
can avoid the above problem (1), when the addr_gen_mode is changed
to the IN6_ADDR_GEN_MODE_STABLE_PRIVACY, the above problem still
exist. The detail as follows:

(2) Among global mobile operators, some operators have already
request MT (Mobile Terminal) to support RFC7217, such as AT&T.
This means that the device not only needs the IID assigned by the
GGSN to build the ipv6 link-local address to trigger the RS message,
but also needs to use the stable privacy mode to build the ipv6
global address after receiving the RA.

Obviously using APRHRD_NONE and IN6_ADDR_GEN_MODE_STABLE_PRIVACY
mode cannot achieve this.

In summary, using the "disable_gen_linklocal_addr" proc file can
disable kernel auto generate ipv6 link-local address no matter
which addr_gen_mode is used.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 include/linux/ipv6.h      |  1 +
 include/uapi/linux/ipv6.h |  1 +
 net/ipv6/addrconf.c       | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/include/linux/ipv6.h b/include/linux/ipv6.h
index 70b2ad3b9884..60c5da76e207 100644
--- a/include/linux/ipv6.h
+++ b/include/linux/ipv6.h
@@ -76,6 +76,7 @@ struct ipv6_devconf {
 	__s32		disable_policy;
 	__s32           ndisc_tclass;
 	__s32		rpl_seg_enabled;
+	__s32		disable_gen_linklocal_addr;
 
 	struct ctl_table_header *sysctl_header;
 };
diff --git a/include/uapi/linux/ipv6.h b/include/uapi/linux/ipv6.h
index 70603775fe91..0449d908b8c2 100644
--- a/include/uapi/linux/ipv6.h
+++ b/include/uapi/linux/ipv6.h
@@ -190,6 +190,7 @@ enum {
 	DEVCONF_NDISC_TCLASS,
 	DEVCONF_RPL_SEG_ENABLED,
 	DEVCONF_RA_DEFRTR_METRIC,
+	DEVCONF_DISABLE_GEN_LINKLOCAL_ADDR,
 	DEVCONF_MAX
 };
 
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 701eb82acd1c..0035f935b25a 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -237,6 +237,7 @@ static struct ipv6_devconf ipv6_devconf __read_mostly = {
 	.addr_gen_mode		= IN6_ADDR_GEN_MODE_EUI64,
 	.disable_policy		= 0,
 	.rpl_seg_enabled	= 0,
+	.disable_gen_linklocal_addr = 0,
 };
 
 static struct ipv6_devconf ipv6_devconf_dflt __read_mostly = {
@@ -293,6 +294,7 @@ static struct ipv6_devconf ipv6_devconf_dflt __read_mostly = {
 	.addr_gen_mode		= IN6_ADDR_GEN_MODE_EUI64,
 	.disable_policy		= 0,
 	.rpl_seg_enabled	= 0,
+	.disable_gen_linklocal_addr = 0,
 };
 
 /* Check if link is ready: is it up and is a valid qdisc available */
@@ -3352,6 +3354,12 @@ static void addrconf_dev_config(struct net_device *dev)
 	if (IS_ERR(idev))
 		return;
 
+	if (idev->cnf.disable_gen_linklocal_addr) {
+		pr_info("%s: IPv6 link-local address being disabled\n",
+			idev->dev->name);
+		return;
+	}
+
 	/* this device type has no EUI support */
 	if (dev->type == ARPHRD_NONE &&
 	    idev->cnf.addr_gen_mode == IN6_ADDR_GEN_MODE_EUI64)
@@ -5526,6 +5534,7 @@ static inline void ipv6_store_devconf(struct ipv6_devconf *cnf,
 	array[DEVCONF_DISABLE_POLICY] = cnf->disable_policy;
 	array[DEVCONF_NDISC_TCLASS] = cnf->ndisc_tclass;
 	array[DEVCONF_RPL_SEG_ENABLED] = cnf->rpl_seg_enabled;
+	array[DEVCONF_DISABLE_GEN_LINKLOCAL_ADDR] = cnf->disable_gen_linklocal_addr;
 }
 
 static inline size_t inet6_ifla6_size(void)
@@ -6932,6 +6941,13 @@ static const struct ctl_table addrconf_sysctl[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec,
 	},
+	{
+		.procname	= "disable_gen_linklocal_addr",
+		.data		= &ipv6_devconf.disable_gen_linklocal_addr,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec,
+	},
 	{
 		/* sentinel */
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
