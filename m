Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EAEC43464
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:25:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F1C20708
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:25:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMc6+Oai";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N/R8B3Pl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81F1C20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PnEp0Q/r+KQRPht4LXPHcIPup4US23ngoP/7aPDb8cI=; b=SMc6+OaiBq6XC4Y+NHHsAknW5
	DL7Qobfo1Vnr5M8m+zSENKQlJ382i+hKx8LBZrVjXWyXZU0UFzhC6DSFKVZk+ums2eu6l5Xxy9kfS
	tz/XBDuo/jB51H26ro2o7iPHBxs0QnsCVMSfUJH8u7dippU0Tz7TZ4cPFVqB2sMaV2yQRcIeFUrgm
	6y2rFCsb5iytlkJCKgIMU/xr73FnOiWKvB0BizpJ7zIbW8Uu+N09N3C5dZ+PGA6gnX4U1FCEqZyyG
	muMfIvXqMGUBu46Vya5nUwkjWGe9+kzzZLoIaQW3dmFp+5KLl2B8QDw6FlKGQRDRj8sm/fHLh2x3K
	2BfYGNyag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKFGK-0005iu-BW; Mon, 21 Sep 2020 06:25:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKFFh-0005SM-HW; Mon, 21 Sep 2020 06:24:43 +0000
X-UUID: f7a38db68b6e4ab5963202690ae41d3b-20200920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oHk1JU2NeVe2tWWWIBxMvDXUuKUJJvTa4oJY401uQng=; 
 b=N/R8B3PlPkmYHq7XnaqxcQwXPAJ8TIcax5q6hoiAB2ve/sVn69TIxtqzjxu6BnJA6c1wopNVnhCW9jvq1kbqYISq5/jqM5YDYoryB0qy/xIeWBCpi9JBGqonxcd0GXvOlHq2L+Lzhjr/YscT1qKRSHF+x1LjOmps3a5J/qwRAwc=;
X-UUID: f7a38db68b6e4ab5963202690ae41d3b-20200920
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 462601505; Sun, 20 Sep 2020 22:24:38 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Sep 2020 23:17:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 14:17:13 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Sep 2020 14:17:10 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
Subject: [PATCH v4 10/11] usb: udc: net2280: convert to
 readl_poll_timeout_atomic()
Date: Mon, 21 Sep 2020 14:13:34 +0800
Message-ID: <1600668815-12135-10-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F315BAB8ED3B30B9B6DF2791A863E3E70DFCD786BE5E8679004EC738121DABED2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_022441_747714_5DF6BC80 
X-CRM114-Status: GOOD (  16.00  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mathias Nyman <mathias.nyman@intel.com>,
 Jann Horn <jannh@google.com>, Jason Yan <yanaijie@huawei.com>,
 Chuhong Yuan <hslester96@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, "Ben
 Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 linux-mediatek@lists.infradead.org, "Eric W.
 Biederman" <ebiederm@xmission.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, Lee Jones <lee.jones@linaro.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
v3~v4: no changes

v2: add Acked-by Alan
---
 drivers/usb/gadget/udc/net2280.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index 7530bd9..f1a21f4 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -52,6 +52,7 @@
 #include <linux/usb/gadget.h>
 #include <linux/prefetch.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 
 #include <asm/byteorder.h>
 #include <asm/irq.h>
@@ -360,18 +361,16 @@ static inline void enable_pciirqenb(struct net2280_ep *ep)
 static int handshake(u32 __iomem *ptr, u32 mask, u32 done, int usec)
 {
 	u32	result;
+	int	ret;
 
-	do {
-		result = readl(ptr);
-		if (result == ~(u32)0)		/* "device unplugged" */
-			return -ENODEV;
-		result &= mask;
-		if (result == done)
-			return 0;
-		udelay(1);
-		usec--;
-	} while (usec > 0);
-	return -ETIMEDOUT;
+	ret = readl_poll_timeout_atomic(ptr, result,
+					((result & mask) == done ||
+					 result == U32_MAX),
+					1, usec);
+	if (result == U32_MAX)		/* device unplugged */
+		return -ENODEV;
+
+	return ret;
 }
 
 static const struct usb_ep_ops net2280_ep_ops;
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
