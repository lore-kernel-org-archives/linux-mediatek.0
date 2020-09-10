Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0467C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:30:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD5D20770
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tNg3vMwA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fJaEicyA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AD5D20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kjv7RIOVq7CdjZXar1jLKsxbjL0mZhCFejFDCzYxV74=; b=tNg3vMwA5CliQhhBS2LhZipV1
	OpisWgS0XPcRO9V1ForQxbrRJluq971AfumAZrVhrtanPkUGHIajxqEAoGGGnKRhEj9zeVEPqfEDT
	XrclQNAQm9gw2EwWl96V3rPpDhNLToySkLSh55ZMPrPrQjnQ+TKEUQnQA1JB7KVRZWujtKnNMJMhe
	nsoiIEPFzPDUrWzHPYiPknQbDei6Vcwy3yUgw7hrfiDtGdU4TZC0RKIokVmd9Gz7m4AQkGRcGE2/i
	/GnjXJOPiHgQKoqoDQFPIccFNX/pSuGUx6WQM9Uy4l+lvhbUbqeGQTh+JzOR3yFOKOT3LozlV3gxv
	IdGTV83DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHyY-00046V-Nh; Thu, 10 Sep 2020 08:30:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHyQ-00043N-TJ; Thu, 10 Sep 2020 08:30:31 +0000
X-UUID: 989fcf97c8254fe4b592dc1bba75ad73-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=o9gRtfphL7oKzKpDTA0u+KvZoZmDOCuBnG5TsFQzD7k=; 
 b=fJaEicyAfzJWAUEP5+Tf5K5AQJfdkkLKWGFNzPNuxI4tJKY4UIZCZ30fz8FcQ3neIzzSJfilQESniYEHmYVciucCvZrXB9v5ryY5GXR3dtFaoZgkuA+N346jPxDpZgAZ6ruuSlPNRa7p+ZZaqpVOenFQMqwhf+Ver4PKZ54HH9M=;
X-UUID: 989fcf97c8254fe4b592dc1bba75ad73-20200910
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1440461112; Thu, 10 Sep 2020 00:24:14 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 01:24:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 16:24:08 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 16:24:07 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v3 07/11] usb: isp1760-hcd: convert to
 readl_poll_timeout_atomic()
Date: Thu, 10 Sep 2020 16:21:48 +0800
Message-ID: <1599726112-4439-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AE382C1EA462680E25491CE36EF7D6C38BC8928087A10E97E194B6FC703E2C2E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_043031_077178_19C5397E 
X-CRM114-Status: GOOD (  14.45  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Daniel
 Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mathias Nyman <mathias.nyman@intel.com>,
 Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>, Chuhong Yuan <hslester96@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jason Yan <yanaijie@huawei.com>,
 linux-mediatek@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-arm-kernel@lists.infradead.org
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
