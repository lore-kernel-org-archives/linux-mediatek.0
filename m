Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3F1C433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 12:44:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF081206B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 12:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1pt+krPm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NU/6cjoG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF081206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8gf6ExEjXzfi9G78AR2egXvPO1GIwZTx+vyXVmjW3jc=; b=1pt+krPmOEHH+zBCBUilsjy7Y
	5TDSz6w4R/WbtxxK92SOUBzNGGbr6MXmYgtZe+dmHg1Ldq5BcIb1G1AeEDeXwISk8JZzk0dF/n5jp
	B/6eu/SN9pFEvayIc3475Sdz0OMD/XkbkGIZ5p7aIwGPa8a3BrqKMcVfV1lOMcg/LggWzCu51KweH
	zNuMtZkc4JEIE8OvsbAi2d8p0wM1fA64awQkZMgQohFWp8uIJmaqerlcUuwQBfTKbPfskGT0rKhGq
	NiCCwH8iJl7NXE/nuOWeTEgh3X4sAloL0ivTWVELgspPOnJoDtNIMv5tHwl6gTiQ3Q4lFYQw+8riS
	RtM/z+agw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8NRf-0002Kh-6G; Wed, 19 Aug 2020 12:43:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8NQk-0001rF-9g; Wed, 19 Aug 2020 12:43:08 +0000
X-UUID: a3b9075c10da46df90e10917d9d26a2f-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BwV3u0UCzhuW0Euj9HoyhyyD5L8KPMx+OzfJoFQQAdE=; 
 b=NU/6cjoGTlFPEHz8TeVyYJ1nQlhS+AqhE5Qt7/Rx1dvEQjmsJzmKoNqYQkuOBYGqPuuHKS5zQ6iANlUXnYa283NvZz/+VUuEahCJ2kp+kIN7sC49RMesc3aOJDRawUwbm5aZ3Zof/8HwxfNYhZRhzEHCGxU4hTUmZKfjZFcfgV4=;
X-UUID: a3b9075c10da46df90e10917d9d26a2f-20200819
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 554475109; Wed, 19 Aug 2020 04:42:58 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 05:42:59 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 20:42:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 20:42:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 08/10] usb: phy-ulpi-viewport: convert to
 readl_poll_timeout_atomic()
Date: Wed, 19 Aug 2020 20:41:03 +0800
Message-ID: <1597840865-26631-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 540DEF74C77FA8C5F52AD2B56CB2756BDC5DDF21B9D2E21F148585182723DFB92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_084302_613987_782430AE 
X-CRM114-Status: GOOD (  13.62  )
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
