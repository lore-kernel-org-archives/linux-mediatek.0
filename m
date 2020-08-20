Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A247BC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 05:58:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F88F2076E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 05:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gBmW665U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aWiQEkD9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F88F2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JmW8gJ3MT0XouOeThc1c2hQGS8O/SJavNuPlqniDBGE=; b=gBmW665Uenx5In1Q5d6ju7q5D
	5Esv2FOn9FoWfFXDSK4ecmyjMVPYrENHtTdQTDNOZX0q67JfAjUYn9Gtip7xy8V2GKF/AeR9MRxyX
	a4wgMA8c6Yt9ckz1KIPHBor3usXntkZQ0JxnmeaLiczRLVyrw86TWu51MuIBMUrKdQOon1glrU9wY
	GRyEjnB95ghIuq2otrJkSXEn6+rRPbqZVsPfavEb/LjAgOnM3k8tyz+SCgJYXHQRXDqmgdKIgQCky
	2zUV22ZG71gcv9bN4cgRCqJr+mJbK3Rqu9Qq4a69nL233D4x8RJDbWDbx5dzjoN9nhJYazDKoZgwA
	z0jljHzJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8day-00016z-WA; Thu, 20 Aug 2020 05:58:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8dZf-0000U3-Ng; Thu, 20 Aug 2020 05:57:43 +0000
X-UUID: d2cb588ae91b46368a61754e12954c1b-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4S7+BDNc9UfPA46FfZlQ7kGKKyGhLtCvW8X6XUp2V4I=; 
 b=aWiQEkD9LlIDOoUeBZt+/nvAssPceFJ+YBoK/ZcKkKDii6uYGWggrMYI4QY9VlBtvHV00gUcAjBlIy6W4cSMJrULWgAW4+2zzjSsYzUf9SVR3XGiL8fuwZvQb9iMuosCgZ6ShvyBNQGiYMN7iFhj5S5E3LzRn4zLmoac+8eUxws=;
X-UUID: d2cb588ae91b46368a61754e12954c1b-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1097011756; Wed, 19 Aug 2020 21:57:15 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 22:47:20 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 13:47:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 13:47:15 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 08/11] usb: phy-ulpi-viewport: convert to
 readl_poll_timeout_atomic()
Date: Thu, 20 Aug 2020 13:45:46 +0800
Message-ID: <1597902349-8998-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5FF79E2C40089937E4F3079EE26A366EF54C3E81ED7A0B64866E9EA5FAAD95BF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_015720_024400_233FA776 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/phy/phy-ulpi-viewport.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/phy/phy-ulpi-viewport.c b/drivers/usb/phy/phy-ulpi-viewport.c
index 7a14e0e..0f61e32 100644
--- a/drivers/usb/phy/phy-ulpi-viewport.c
+++ b/drivers/usb/phy/phy-ulpi-viewport.c
@@ -7,6 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/usb.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/ulpi.h>
 
@@ -20,16 +21,9 @@
 
 static int ulpi_viewport_wait(void __iomem *view, u32 mask)
 {
-	unsigned long usec = 2000;
+	u32 val;
 
-	while (usec--) {
-		if (!(readl(view) & mask))
-			return 0;
-
-		udelay(1);
-	}
-
-	return -ETIMEDOUT;
+	return readl_poll_timeout_atomic(view, val, !(val & mask), 1, 2000);
 }
 
 static int ulpi_viewport_read(struct usb_phy *otg, u32 reg)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
