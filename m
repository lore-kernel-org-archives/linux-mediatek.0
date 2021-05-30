Return-Path: <SRS0=DdzG=KZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F66C47091
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 May 2021 12:02:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 746B9610A0
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 May 2021 12:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 746B9610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tsp+Ryn6x/qG5T/5LtokJW+RV6Fg3IMMWiwBeKeDcaA=; b=KENl4qlpo1HNXo
	1xKvmAQ1tI+CgCLHxgbzbaszee9Zn1h1Wiw3xp2+84igbzhX9LdHvJqiScjCgXsFUvg19aZ5Ga055
	nWkuDgqy9pprSAlVWJ5fwNTIVNVsPNnzKG8KTyo7sdAu68/dD4grQ0HcU3Zq0VA+xNuqoAzretaOi
	J8dd5XhykqX6D9aZNak0Sn1kHl9NnIonAIX2Viu90etwketvy7RpWSikRKEMBeDzPwLQSRC0GJDsF
	aS6hPgCig8t6eiyChhcBLx/+l1+4ajYnONqQKqgYnkDJJX1B0oFGIlI1aUrbmWYsW+/xXWaqLwZyd
	JnNIPRLtZR+2ndipBuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnK9C-009a2i-2c; Sun, 30 May 2021 12:02:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnK8w-009a1x-0R; Sun, 30 May 2021 12:02:13 +0000
X-UUID: ef4693da066847a386fe800ecbd0c653-20210530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=obFRuOg5yaSId31zpKREh9LsUXqILahqTpKCCSKj59Y=; 
 b=aTTRpdgcxUIccpexDIQiZVb1ooMrQdk5UN0sDr2T1/cMEV5YvWmLtVZ6Y2ZGuk8/E+cyXFlnd2TS0hdcH7DWR3ecx5/cguAwyJV2BekyeWPRfupw4nQ4geatw6fvPhP4LzlKiOjoe8M3gjr8ay/VAgqbsCdi8F/RbhAhGJT5/Pg=;
X-UUID: ef4693da066847a386fe800ecbd0c653-20210530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1763778474; Sun, 30 May 2021 05:02:04 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 30 May 2021 04:52:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 30 May 2021 19:51:49 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 30 May 2021 19:51:48 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, <Rocco.Yue@gmail.com>, Rocco Yue
 <rocco.yue@mediatek.com>
Subject: [PATCH] ipv6: align code with context
Date: Sun, 30 May 2021 19:38:11 +0800
Message-ID: <20210530113811.8817-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_050211_491075_1E4B79CF 
X-CRM114-Status: GOOD (  10.58  )
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

The Tab key is used three times, causing the code block to
be out of alignment with the context.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 net/ipv6/addrconf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index b0ef65eb9bd2..048570900fdf 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -6903,10 +6903,10 @@ static const struct ctl_table addrconf_sysctl[] = {
 		.proc_handler   = proc_dointvec,
 	},
 	{
-		.procname		= "addr_gen_mode",
-		.data			= &ipv6_devconf.addr_gen_mode,
-		.maxlen			= sizeof(int),
-		.mode			= 0644,
+		.procname	= "addr_gen_mode",
+		.data		= &ipv6_devconf.addr_gen_mode,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
 		.proc_handler	= addrconf_sysctl_addr_gen_mode,
 	},
 	{
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
