Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37491C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 12:53:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09511206B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 12:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R7ipPL/+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KIsy7nfM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09511206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tfwLddEJxNg/P3F0NDYfFOvSBke5qeJHdD6s8LUQpTg=; b=R7ipPL/+N2ERxiP3MKcVUQtVj8
	e2x7Cx0uwh0Qv8RQ1HUf3YY4cKSHgJI92WzAUBZkDbmucFEyGY1kPVtcuqRCBdJg5ReIr2cC1qk/8
	oeN+JwQexIwSt+mM0YIheGXB4hewVCU2IYQHmmz6NCGtnHcW4qCEzLEFIjPvkxf9Fmj/bu3PscJRt
	QkrTOxtJC00RaPpefp0uc1uUy3oeyRq7GMqWkD0j0vN7I1V47XePKX7kqGrlIEnquZJCi+aeja8IN
	zp8IzTHnlw+Dw/1UH3WnEvR4C1T3ZqErub3/JssywRkULS2wqT67quGrERqInsjkmOOx9GzkUu/qW
	CtMTd0kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8NaN-0006aj-1n; Wed, 19 Aug 2020 12:52:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8NaI-0006Wk-7a; Wed, 19 Aug 2020 12:52:55 +0000
X-UUID: 2bc6541cdc734cb88c58fb1a11ab56df-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+3z+T7GeyoHeHwhU3UCJLeddq0B7PomhVS6LM+oEBwA=; 
 b=KIsy7nfMKkpkQgA/qcgtoxI4fmbl1kJLdsqYq9+YInT6PLqSXvxmOSQNgjUOZj39vB94nLDK10G1l89srJH8f64XSki9VUxfbiV5QxrTmedLU+7uBPca/ujyQMOizIUWulXLlCe0IQilOmCLX/j/LSBtB1/BzjudJLRPtvvpQ4k=;
X-UUID: 2bc6541cdc734cb88c58fb1a11ab56df-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1073075100; Wed, 19 Aug 2020 04:52:50 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 05:42:48 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 20:42:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 20:42:42 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 01/10] usb: early: convert to readl_poll_timeout_atomic()
Date: Wed, 19 Aug 2020 20:40:56 +0800
Message-ID: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 11A0FBB927ECEBA7F7FD5B2A90D46DA3FD7D363E0C47726682BD5434B97E97B02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_085254_550346_12A98033 
X-CRM114-Status: GOOD (  15.34  )
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
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/early/xhci-dbc.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index c050776..be4ecba 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -14,6 +14,7 @@
 #include <linux/pci_ids.h>
 #include <linux/memblock.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <asm/pci-direct.h>
 #include <asm/fixmap.h>
 #include <linux/bcd.h>
@@ -135,16 +136,9 @@ static int handshake(void __iomem *ptr, u32 mask, u32 done, int wait, int delay)
 {
 	u32 result;
 
-	do {
-		result = readl(ptr);
-		result &= mask;
-		if (result == done)
-			return 0;
-		udelay(delay);
-		wait -= delay;
-	} while (wait > 0);
-
-	return -ETIMEDOUT;
+	return readl_poll_timeout_atomic(ptr, result,
+					 ((result & mask) == done),
+					 delay, wait);
 }
 
 static void __init xdbc_bios_handoff(void)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
