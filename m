Return-Path: <SRS0=A55m=MK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD91C636C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Jul 2021 06:14:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C3461166
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Jul 2021 06:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C3461166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Uobu8aSBZskrQ0qPXOP0JeqDQf9PQId/oR2f/5CBCA=; b=Mhc+e4WRJufXKH
	c48qCODjJMgUaZrd//HzN1HHjHl9RtsJ/XBXxf6IBf2qXU9nfnrF1+BFq/eLna6XH/1IpebqdrUrU
	3HGBPS8Ig1KI/QQjvxWjvchYufheHxTpf8aVL/aTdBk4iRBhT/TpBIn/kfoBBCdVVkgIFpQr6wO9y
	Hy63KK65kdGmLqPPY0TQRpgRKPQLS6A6N+LOso3tDjKFBklioBE6j+bIub9uSB7LVVEmdxsHtKSUw
	ckt2fPtnDsBeQ+aCb+SAaEgQyKK64gjoph/A6PBH6A4YNPoa4i1CjXFQmfhUYdVy2QVnACIxiuudf
	/fQ9eGSl7h+DBiI1hA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m504X-007NcA-Gd; Sun, 18 Jul 2021 06:14:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m504T-007NaE-H8; Sun, 18 Jul 2021 06:14:40 +0000
X-UUID: 28510cc3df6f4127ba23d4a1196770c2-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CoK7U6J6YefYnH9ZaBC94cXA27CsPRIQGW2aoV0GT0M=; 
 b=fPOySwxbjQVOHdg7SzksOSX2bsYw0mCyTXiVKrtY2wS5aPQWgLfPmHBVKDTh1I/A30YZzSaChQSHSf5kLE2ZfxZMjIy1OgPj+lJq897u0asei90KH5+jsYNAFYnORn7yLKQ5eHoCSvPMYdiwij8qv41DJNY6ntkaA6q9LjxgdWw=;
X-UUID: 28510cc3df6f4127ba23d4a1196770c2-20210717
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 9851828; Sat, 17 Jul 2021 23:14:31 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 23:14:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 18 Jul 2021 14:14:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 18 Jul 2021 14:14:22 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <frank-w@public-files.de>, <steven.liu@mediatek.com>, Landen Chao
 <landen.chao@mediatek.com>
Subject: [PATCH net, v2,
 RESEND] net: Update MAINTAINERS for MediaTek switch driver
Date: Sun, 18 Jul 2021 14:14:20 +0800
Message-ID: <49e67daeadace13a9fa3f4553f1ec14c6a93bdc8.1622445132.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_231439_022485_6D66FF66 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210718061420.rr9juRpRizpVKeJhMePdC2YOHSUb7zWUDfVqBs7WoeM@z>

Update maintainers for MediaTek switch driver with Deng Qingfang who
contributes many useful patches (interrupt, VLAN, GPIO, and etc.) to
enhance MediaTek switch driver and will help maintenance.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
v1 -> v2: Remove Change-Id.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..3315627ebb6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11588,6 +11588,7 @@ F:	drivers/char/hw_random/mtk-rng.c
 MEDIATEK SWITCH DRIVER
 M:	Sean Wang <sean.wang@mediatek.com>
 M:	Landen Chao <landen.chao@mediatek.com>
+M:	DENG Qingfang <dqfext@gmail.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/dsa/mt7530.*
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
