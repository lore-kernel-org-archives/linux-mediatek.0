Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4910FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 07:00:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0373A61159
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 07:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0373A61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KCdM8zNzjSKBqbub8eWkVPV9KPACjWPlU3DQbD6YA/k=; b=cZyjy0PoNBz0wb
	Fhyet/WohOg1fVMel4lcv1n2c7uEBMmE+e2hLmh0Jc1pQw7x3jZRSDuwAV9yiBPUJz5crAFA8jGeb
	wRCwqNcCkGkvXziSPiLKEnczkBoIQJJcRdqFAFGiIF9u2IHI3r180Slrf/ww3gL1lsPePgA2eq8+P
	hH2r25EGINQ9BGQ9crl77cyRJcBGOHCfogOvfu8pGbySdZKHaYe/pXlSa//m73vB+/Lww+M8p/xa8
	MiJsTT5kUuTW+h53wlnXe0dDA+mW17UikJ5B1KqI4obDTmZiK6cs2yIe9No3idTCk+u6rqKqUaEfg
	D98ATQ11vXyQ4gspMoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkL7H-000pNj-5I; Tue, 09 Nov 2021 07:00:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkL7E-000pN0-1C; Tue, 09 Nov 2021 07:00:21 +0000
X-UUID: 8c0cd68ce8a94c98bf057c8cb7561370-20211109
X-UUID: 8c0cd68ce8a94c98bf057c8cb7561370-20211109
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1148983340; Tue, 09 Nov 2021 00:00:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 23:00:12 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 15:00:10 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 9 Nov 2021 15:00:10 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Rocco.Yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, <yanjie.jiang@mediatek.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: [PATCH net-next] ipv6: don't generate link-local addr in random or
 privacy mode
Date: Tue, 9 Nov 2021 14:55:26 +0800
Message-ID: <20211109065526.16772-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_230020_109341_085C7CD6 
X-CRM114-Status: GOOD (  17.94  )
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

In the 3GPP TS 29.061, here is a description as follows:
"In order to avoid any conflict between the link-local address
of the MS and that of the GGSN, the Interface-Identifier used by
the MS to build its link-local address shall be assigned by the
GGSN. The GGSN ensures the uniqueness of this Interface-Identifier.
The MT shall then enforce the use of this Interface-Identifier by
the TE"

In other words, in the cellular network, GGSN determines whether
to reply a solicited RA message by identifying the bottom 64 bits
of the source address of the received RS message. Therefore,
cellular network device's ipv6 link-local address should be set
as the format of fe80::(GGSN assigned IID).

To meet the above spec requirement, this patch adds two new
addr_gen_mode:

1) IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA, this mode is suitable
for cellular networks that support RFC7217. In this mode, the
kernel doesn't generate a link-local address for the cellular
NIC, and generates an ipv6 stable privacy global address after
receiving the RA message.

2) IN6_ADDR_GEN_MODE_RANDOM_NO_LLA, in this mode, the kernel
doesn't generate a link-local address for the cellular NIC,
and will use the bottom 64 bits of the link-local address(same
as the IID assigned by GGSN) to form an ipv6 global address
after receiveing the RA message.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 include/uapi/linux/if_link.h       |  2 ++
 net/ipv6/addrconf.c                | 22 ++++++++++++++++------
 tools/include/uapi/linux/if_link.h |  2 ++
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
index eebd3894fe89..9c5695744c7d 100644
--- a/include/uapi/linux/if_link.h
+++ b/include/uapi/linux/if_link.h
@@ -428,6 +428,8 @@ enum in6_addr_gen_mode {
 	IN6_ADDR_GEN_MODE_NONE,
 	IN6_ADDR_GEN_MODE_STABLE_PRIVACY,
 	IN6_ADDR_GEN_MODE_RANDOM,
+	IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
+	IN6_ADDR_GEN_MODE_RANDOM_NO_LLA,
 };
 
 /* Bridge section */
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 3445f8017430..0045de10f4b5 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -392,7 +392,8 @@ static struct inet6_dev *ipv6_add_dev(struct net_device *dev)
 	timer_setup(&ndev->rs_timer, addrconf_rs_timer, 0);
 	memcpy(&ndev->cnf, dev_net(dev)->ipv6.devconf_dflt, sizeof(ndev->cnf));
 
-	if (ndev->cnf.stable_secret.initialized)
+	if (ndev->cnf.stable_secret.initialized &&
+	    ndev->cnf.addr_gen_mode != IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA)
 		ndev->cnf.addr_gen_mode = IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
 
 	ndev->cnf.mtu6 = dev->mtu;
@@ -2578,7 +2579,8 @@ static void manage_tempaddrs(struct inet6_dev *idev,
 static bool is_addr_mode_generate_stable(struct inet6_dev *idev)
 {
 	return idev->cnf.addr_gen_mode == IN6_ADDR_GEN_MODE_STABLE_PRIVACY ||
-	       idev->cnf.addr_gen_mode == IN6_ADDR_GEN_MODE_RANDOM;
+	       idev->cnf.addr_gen_mode == IN6_ADDR_GEN_MODE_RANDOM ||
+	       idev->cnf.addr_gen_mode == IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA;
 }
 
 int addrconf_prefix_rcv_add_addr(struct net *net, struct net_device *dev,
@@ -3331,6 +3333,8 @@ static void addrconf_addr_gen(struct inet6_dev *idev, bool prefix_route)
 					      0, 0, GFP_KERNEL);
 		break;
 	case IN6_ADDR_GEN_MODE_NONE:
+	case IN6_ADDR_GEN_MODE_RANDOM_NO_LLA:
+	case IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA:
 	default:
 		/* will not add any link local address */
 		break;
@@ -5798,7 +5802,9 @@ static int check_addr_gen_mode(int mode)
 	if (mode != IN6_ADDR_GEN_MODE_EUI64 &&
 	    mode != IN6_ADDR_GEN_MODE_NONE &&
 	    mode != IN6_ADDR_GEN_MODE_STABLE_PRIVACY &&
-	    mode != IN6_ADDR_GEN_MODE_RANDOM)
+	    mode != IN6_ADDR_GEN_MODE_RANDOM &&
+	    mode != IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA &&
+	    mode != IN6_ADDR_GEN_MODE_RANDOM_NO_LLA)
 		return -EINVAL;
 	return 1;
 }
@@ -6428,15 +6434,19 @@ static int addrconf_sysctl_stable_secret(struct ctl_table *ctl, int write,
 		for_each_netdev(net, dev) {
 			struct inet6_dev *idev = __in6_dev_get(dev);
 
-			if (idev) {
+			if (idev && idev->cnf.addr_gen_mode !=
+			    IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA) {
 				idev->cnf.addr_gen_mode =
 					IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
 			}
 		}
 	} else {
 		struct inet6_dev *idev = ctl->extra1;
-
-		idev->cnf.addr_gen_mode = IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
+		if (idev->cnf.addr_gen_mode !=
+		    IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA) {
+			idev->cnf.addr_gen_mode =
+				IN6_ADDR_GEN_MODE_STABLE_PRIVACY;
+		}
 	}
 
 out:
diff --git a/tools/include/uapi/linux/if_link.h b/tools/include/uapi/linux/if_link.h
index b3610fdd1fee..fb69137aea89 100644
--- a/tools/include/uapi/linux/if_link.h
+++ b/tools/include/uapi/linux/if_link.h
@@ -241,6 +241,8 @@ enum in6_addr_gen_mode {
 	IN6_ADDR_GEN_MODE_NONE,
 	IN6_ADDR_GEN_MODE_STABLE_PRIVACY,
 	IN6_ADDR_GEN_MODE_RANDOM,
+	IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
+	IN6_ADDR_GEN_MODE_RANDOM_NO_LLA,
 };
 
 /* Bridge section */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
