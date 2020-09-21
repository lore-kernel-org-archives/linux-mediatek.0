Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7F4C43463
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:25:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3CA320719
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b7tqyEix";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZbFpSqUf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3CA320719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0O41DQLGC9NtXDkf3IqF9II9jq7IKYD8IiGKGM43Cpk=; b=b7tqyEixVlDf/Dqg96budu/GVC
	V+6L/uwDvDfhRuM19DVD/N6OHM5Ih5AZWuoBOUXLbVrR6pLXErlgb4Vj5roNXYtfZIg7BD1fOjG4j
	uh3h+dPQ0O9hVbcTbj4Pk0Guw6H7FekVPECqr34lIb5vTiw39FO8q+MDvdQdiqbjz63sRrjmLNFJV
	EFJGk+McRtG4x1t8p1r1Bm0WDI+88SR0rx490TGnhvmbV8mpSCMJJB2+FbYZw2WeXa0zoqDoClRV8
	mq1nWDs8LI0scN0y4gjEw1zFBZaBayIGCOtHdJSuiapH2AwznJBfX45LHp2R8ylYVIiV2nGc6nH60
	D1w4EatQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKFFy-0005ZR-Ki; Mon, 21 Sep 2020 06:24:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKFFg-0005Sd-HU; Mon, 21 Sep 2020 06:24:41 +0000
X-UUID: 1954b4a3ccf2426b83ebc44096fca46c-20200920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6ZOWN7ki1sN531xAD52X8GiFWf24OghgpbzynrNkwy8=; 
 b=ZbFpSqUfrpltQOQOasvH2BT0nEwirQWUMaZeCkE2hHbhRc1ak1xTCq1696ItuU2e4J4MzGINAlyb4/BU8j8kl9dPF8Jvnx4mD+CkvCR2nbE5g1TDCH+U9ffX1YpxKbCcZYiNvRP4j4cAKJD6U1rR6RhyrqY7KoV4LxlxBe7S9JI=;
X-UUID: 1954b4a3ccf2426b83ebc44096fca46c-20200920
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 885030643; Sun, 20 Sep 2020 22:24:38 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Sep 2020 23:16:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 14:16:56 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Sep 2020 14:16:54 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
Subject: [PATCH v4 01/11] usb: early: convert to readl_poll_timeout_atomic()
Date: Mon, 21 Sep 2020 14:13:25 +0800
Message-ID: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2F03555C4872A9C51584CA060F9A514A5CB38BC9E5EB911970C0BACFA9D73A672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_022440_723523_CAB67E01 
X-CRM114-Status: GOOD (  15.07  )
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
 Mathias
 Nyman <mathias.nyman@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Mathias Nyman <mathias.nyman@intel.com>, Jann Horn <jannh@google.com>,
 Jason Yan <yanaijie@huawei.com>, Chuhong Yuan <hslester96@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, "Ben
 Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 linux-mediatek@lists.infradead.org, "Eric W.
 Biederman" <ebiederm@xmission.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Jann Horn <jannh@google.com>
---
v4: add reviewed-by Jann

v2~v3: no changes
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
