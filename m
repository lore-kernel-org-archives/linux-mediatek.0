Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E50BC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 11:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F30CA60FEE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 11:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F30CA60FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3W6IgYpGSy994Ss8fjnAn2SEEKE+QxUr0kSQKfTxsg=; b=K33ZHyyCUSJA27
	2ef3CDKWiuLpzAVo/xk/gwYy6m5Nwb0C6cThGB73lw+GuWwVubmFsF/7rhVkPrANjW0I9h69cqR01
	U9HYyHM2MhDk7S69d9qd8I59ELB02gIvRFq8OW12MNfEimnHm8pAjJcSehFymiuVj2OEYZ8gUIedr
	gCewRiefCYpZ03i6vZQamoQG3ctJKr1SfEVMkpJdIwBcCvmXTz7p0PC7NIaif5TtQIus6gW3Dn7jv
	xaUl8sqZXXyAMa+bcwl+1RVU57Haw7f1M81vywBhzOXr4zwbEM5laJxi0vJFPtfwg0FkQv4bDs1ML
	j8zpIp2nXSK+IQLatXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw1Op-00AVFS-Qr; Wed, 23 Jun 2021 11:50:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw1OR-00AV7G-P6; Wed, 23 Jun 2021 11:50:09 +0000
X-UUID: 7963d96d14c6434ba2c0ed263615d9ea-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JE1uB5v3ZgTVlD+OSELZLRnjZ353etV6eTdthVf1Flw=; 
 b=YxbvXYnBXxP5cBRr0qEwmQ3+2lb8IlqAsq8hq2lyuYe5TaVFgDMPcJAw1k0A6gnK7+IyWgKjBEZkQ9Lot8zZ60qFYFxvpFoyQRVcFRtYezqydR7wWg4CYjRHL88AiPVcAhS9qaDrm8QYeCuWeuWaOEali2pyk3yXi7ib3SPCi1A=;
X-UUID: 7963d96d14c6434ba2c0ed263615d9ea-20210623
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2068851923; Wed, 23 Jun 2021 04:50:03 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 04:50:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 19:49:47 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 19:49:46 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <bpf@vger.kernel.org>,
 <wsd_upstream@mediatek.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, <kuohong.wang@mediatek.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: [PATCH 2/4] net: ipv6: don't generate link local address on PUREIP
 device
Date: Wed, 23 Jun 2021 19:34:50 +0800
Message-ID: <20210623113452.5671-2-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623113452.5671-1-rocco.yue@mediatek.com>
References: <20210623113452.5671-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_045007_866203_A787E611 
X-CRM114-Status: GOOD (  12.94  )
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

PUREIP device such as ccmni does not need kernel to generate
ipv6 link-local address in any addr_gen_mode, generally, it
shall use the IPv6 Interface Identifier, as provided by the
GGSN, to create its IPv6 link-ocal Unicast Address.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 net/ipv6/addrconf.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 701eb82acd1c..1bfa7eca1314 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3339,7 +3339,8 @@ static void addrconf_dev_config(struct net_device *dev)
 	    (dev->type != ARPHRD_IPGRE) &&
 	    (dev->type != ARPHRD_TUNNEL) &&
 	    (dev->type != ARPHRD_NONE) &&
-	    (dev->type != ARPHRD_RAWIP)) {
+	    (dev->type != ARPHRD_RAWIP) &&
+	    (dev->type != ARPHRD_PUREIP)) {
 		/* Alas, we support only Ethernet autoconfiguration. */
 		idev = __in6_dev_get(dev);
 		if (!IS_ERR_OR_NULL(idev) && dev->flags & IFF_UP &&
@@ -3352,6 +3353,12 @@ static void addrconf_dev_config(struct net_device *dev)
 	if (IS_ERR(idev))
 		return;
 
+	/* this device type doesn't need to generate
+	 * link-local address in any addr_gen_mode
+	 */
+	if (dev->type == ARPHRD_PUREIP)
+		return;
+
 	/* this device type has no EUI support */
 	if (dev->type == ARPHRD_NONE &&
 	    idev->cnf.addr_gen_mode == IN6_ADDR_GEN_MODE_EUI64)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
