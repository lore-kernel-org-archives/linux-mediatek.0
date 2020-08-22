Return-Path: <SRS0=DMob=CA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61425C433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 08:20:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E41620825
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 08:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pl6YTLTk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ST5MhYR+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E41620825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kjv7RIOVq7CdjZXar1jLKsxbjL0mZhCFejFDCzYxV74=; b=pl6YTLTkUHgvmvR9lPmT86HLA
	n5xRByuZJzreOBmo1F+bDwrkrwWuQuoPep5b/4q+TNwt41jUXitU5Uj6/IrUN5r0aixztD4vrbW4P
	wu4WG1m5HFe0Mfb8Iijn/+MjOWDTgChWQmpN+Dl/z3mdmB2c81+AgWrmPpLlCJ7+x9iztS3GVFntF
	PALpNCw1kK2Zmqk2UdBKlb5zJ9GGobuaViMmEGWXxgN+uku7/KN2SvxtYWjV1jXfo9ToXeWtsdlek
	tXky/Nf6y2a2vRDlvu0OIfBrWIUvIYHG4/5Bo01QRWlwqz7QkPR2X3IdDrTdY/yuwF4ax2FzgKvTT
	XexfvPUWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9Ol1-0007ey-Td; Sat, 22 Aug 2020 08:20:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9OkE-0007HW-M6; Sat, 22 Aug 2020 08:19:23 +0000
X-UUID: 1f3c2729491d4c5fa1d7f35a1995210e-20200822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=o9gRtfphL7oKzKpDTA0u+KvZoZmDOCuBnG5TsFQzD7k=; 
 b=ST5MhYR+lE5qLUhrAI0Gf125jdUJH+ItqJKMhsURTrXMHH+SZcjqETAiUePJhGCdQ/6mtmCL9fIOvwNbEwlWQYm1HQVSV7xOwgBxAVO1z10sk1TiAAEJZe5AyhGl48dfJzauo9o1vRhmJO+463q1Puti+gDQu0Y+TEb2n+O5s5Y=;
X-UUID: 1f3c2729491d4c5fa1d7f35a1995210e-20200822
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1584390861; Sat, 22 Aug 2020 00:19:20 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 01:09:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 16:09:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Aug 2020 16:09:12 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 07/11] usb: isp1760-hcd: convert to
 readl_poll_timeout_atomic()
Date: Sat, 22 Aug 2020 16:05:49 +0800
Message-ID: <1598083553-31896-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AEC8FC299CA8140D60BC8439E194576E1CD2D22AE5ECB1FB371572798E2F29272000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200822_041922_903813_58ECD5D5 
X-CRM114-Status: GOOD (  14.42  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 drivers/usb/isp1760/isp1760-hcd.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index dd74ab7a..33ae656 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -22,6 +22,7 @@
 #include <linux/debugfs.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/mm.h>
 #include <linux/timer.h>
 #include <asm/unaligned.h>
@@ -380,18 +381,15 @@ static int handshake(struct usb_hcd *hcd, u32 reg,
 		      u32 mask, u32 done, int usec)
 {
 	u32 result;
+	int ret;
+
+	ret = readl_poll_timeout_atomic(hcd->regs + reg, result,
+					((result & mask) == done ||
+					 result == U32_MAX), 1, usec);
+	if (result == U32_MAX)
+		return -ENODEV;
 
-	do {
-		result = reg_read32(hcd->regs, reg);
-		if (result == ~0)
-			return -ENODEV;
-		result &= mask;
-		if (result == done)
-			return 0;
-		udelay(1);
-		usec--;
-	} while (usec > 0);
-	return -ETIMEDOUT;
+	return ret;
 }
 
 /* reset a non-running (STS_HALT == 1) controller */
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
