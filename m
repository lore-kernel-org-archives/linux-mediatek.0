Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AACC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 11:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7102E6102A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 11:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7102E6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zOGr/UdyrKiP1nyntoCECQLJObS+LGf0/aNt0qG9Ccs=; b=fD0bVkspjz0wkg
	jW+18j8JkKkW2tK/1/dVLEJ4G1vlEih00apR8eYJwNsPk1Z2Jd9MgD0kVVeeduRLpc1YcxqENfTlK
	gIDKZVcOwmfpGqrYMnwIV2w2yucXz5U8rzBhKmd4BFer34hrGPmHFSM8ThcY2uYpq3hdiyOXYB079
	6ufD07/17YM7K63gjiBz6SMSlbXruqwp2rEDXd7gU0lrpuC4EVbEUL4TryFFXD9h25hULvVSisb5K
	NZ/7NtCbGkEBQicA60Y6O1kneVqS73O0dZ4o5c+2V7mskJ28SMa0o1LBjH9Vq5h4rdTNJ7JDDY/pl
	SylseOEtT9/bzxwfAt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw1Oc-00AVCK-OG; Wed, 23 Jun 2021 11:50:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw1ON-00AV7G-Ju; Wed, 23 Jun 2021 11:50:07 +0000
X-UUID: 005634f8e4004fac93e361a7bb6fe0db-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Bn391tXlqz4E6bjwOoWmfMYm89M8NtlzjLdQ6d/IzNU=; 
 b=Mdt/mFHjyoAiKNxvWbZZsskpOwe0QgXtQUcvynaPmP42oAi68uwTuNgDJmEDWL8ecRhFTeChckKbY0CRZv3tOjl1TIfNFzCJ6znfEUic0fZz007c3Xxypp4dSYyw9BLavwGaqyYg1ABjPTalJccclb/bwGIgdbNJusREgcK8jNU=;
X-UUID: 005634f8e4004fac93e361a7bb6fe0db-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1340185345; Wed, 23 Jun 2021 04:49:58 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 04:49:56 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 19:49:43 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 19:49:41 +0800
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
Subject: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
Date: Wed, 23 Jun 2021 19:34:49 +0800
Message-ID: <20210623113452.5671-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_045005_118856_A4D7DB5D 
X-CRM114-Status: GOOD (  10.71  )
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

This patch add the definition of ARPHRD_PUREIP which can for
example be used by mobile ccmni device as device type.
ARPHRD_PUREIP means that this device doesn't need kernel to
generate ipv6 link-local address in any addr_gen_mode.

Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
---
 include/uapi/linux/if_arp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/if_arp.h b/include/uapi/linux/if_arp.h
index c3cc5a9e5eaf..4463c9e9e8b4 100644
--- a/include/uapi/linux/if_arp.h
+++ b/include/uapi/linux/if_arp.h
@@ -61,6 +61,7 @@
 #define ARPHRD_DDCMP    517		/* Digital's DDCMP protocol     */
 #define ARPHRD_RAWHDLC	518		/* Raw HDLC			*/
 #define ARPHRD_RAWIP    519		/* Raw IP                       */
+#define ARPHRD_PUREIP	520		/* Pure IP			*/
 
 #define ARPHRD_TUNNEL	768		/* IPIP tunnel			*/
 #define ARPHRD_TUNNEL6	769		/* IP6IP6 tunnel       		*/
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
