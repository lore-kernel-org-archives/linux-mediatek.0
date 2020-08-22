Return-Path: <SRS0=DMob=CA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581F4C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 08:10:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A7DB21734
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 08:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qu2/eKP9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VXn4nZ4t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A7DB21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k1AlPEltdQ5m895/Z9uGFBwee7LiDM5P5yxHk6Y77y8=; b=qu2/eKP9gkxxP0Qsxcq4Ni0IF
	jT/177Z4SqqsJPqpaC14W/DfzyQ/rstEyFG6Tj4PhgtovLDRvfxaebwZxm6cuxcOwIxU8DyUxfCYu
	h8WTxSC7SAsIOW6jYkuVG7F5mjSj/phEPtxvgGHXT1e61KTVwZd5NXkZd068kTKVqly1gFh7rxc8Z
	KmtiI+w+1ITGb+uOyQwd03FtnJ5lNuGSO6D65dg/ExXWq4fyRTwoN+b/x2RThEf/tvPxKVIKJZkpz
	U5vMPWFLOHTrPJSAhRNHqKXTlNJYj7PM6KOtGlokDRNmNY/7JFERaNlagdFhr2jfl9CAr+kXZglBG
	mkw43ui/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9Ob2-0005PG-KW; Sat, 22 Aug 2020 08:09:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9Oas-0005Mi-3v; Sat, 22 Aug 2020 08:09:43 +0000
X-UUID: 5518b477a1b54184a7a0ff7adea293df-20200822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mVw3k7m+HfgDDtgies2lv1Zs9zfJ0QocsJ5+s8RXmlU=; 
 b=VXn4nZ4tEqj/7EiscAukcNLqZnzkOK/WqdzwxY6fXPVJvW31b+4XJ80L0EYEdf5ywNgH+IyOuGfJKk6T6JObtnckmRr2dz1eGtRt6MzdqUpqQ3ABEDXM65p57Z/m2E8Kh2/6CPFOoXH2x1XGTEp+qt1YQoY+kIflH7RftZyWn1I=;
X-UUID: 5518b477a1b54184a7a0ff7adea293df-20200822
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1921420884; Sat, 22 Aug 2020 00:09:18 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 01:09:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Aug 2020 16:09:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Aug 2020 16:09:11 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 06/11] usb: fotg210-hcd: convert to
 readl_poll_timeout_atomic()
Date: Sat, 22 Aug 2020 16:05:48 +0800
Message-ID: <1598083553-31896-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598083553-31896-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FFAB3A675C0FCD41B35C30EDB2E3EF20789DC91B551497B01A4FF75CD3CBAF322000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200822_040942_297873_0352C86C 
X-CRM114-Status: GOOD (  14.96  )
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
 drivers/usb/host/fotg210-hcd.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index 194df82..1d94fcf 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -32,6 +32,7 @@
 #include <linux/uaccess.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/clk.h>
 
 #include <asm/byteorder.h>
@@ -883,18 +884,15 @@ static int handshake(struct fotg210_hcd *fotg210, void __iomem *ptr,
 		u32 mask, u32 done, int usec)
 {
 	u32 result;
+	int ret;
 
-	do {
-		result = fotg210_readl(fotg210, ptr);
-		if (result == ~(u32)0)		/* card removed */
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
+					 result == U32_MAX), 1, usec);
+	if (result == U32_MAX)		/* card removed */
+		return -ENODEV;
+
+	return ret;
 }
 
 /* Force HC to halt state from unknown (EHCI spec section 2.3).
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
