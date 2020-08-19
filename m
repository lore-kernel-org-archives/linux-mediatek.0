Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F9DC433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 12:43:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 860E8206B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 12:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m4IUycEX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D2VdRfCZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 860E8206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Whv4qjawO6HHJReFy4GhQ4rseSphjEkKr5GOCHVlT5o=; b=m4IUycEXOxUcBQavlL1WdmaU9
	vrCNSAP6Owj2EWbj6z92d8EGnoIElN7QBRnibKmwnsaamgEH+6Vc4ZwBLhCAn2q66kEM3dor5XYa4
	0L9q2kQzoY5eqGZB/nogDu0fVEXUtGEcY7KSrzhSVkHxf2d8cjkDdjek2yn9QGUGIXYRCJbP6DrUM
	7Cl0yIKnGcT/6ffLYaps74l+PSPsz2bFCnBlNuEigGn2T9kHzK0+pwu58cKvMaWfeINRnuLMsg97Y
	k8yYTgTTG5i7RawxrtJbnbUAVWojhoHVbbnIGMNginPggSohFMevnXQLaMGVrcdXZksooA7+Fp+Xe
	eS5OMWOKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8NQs-0001vH-Lz; Wed, 19 Aug 2020 12:43:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8NQe-0001or-AR; Wed, 19 Aug 2020 12:42:57 +0000
X-UUID: 36b77b703ef74bd491df73341d88b969-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=b6owPCjpasIYidgAsRKMlqeM1EqM75qi1guA0uBBWPk=; 
 b=D2VdRfCZPov7x0Q60+MMI16NKwrzI8UNqhVXwxZ871VCbMCHcN46XKl1t4wqBIGwj66oseTIjXIEzb1lbENdf8WF9UHGIuVaqaL9fHqmcoMr5D6WwknValScNaO+VAhOAUmyk7peuW3QabOfYyJ9wmgXE02ynruNqsAinpA7ApA=;
X-UUID: 36b77b703ef74bd491df73341d88b969-20200819
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 513644048; Wed, 19 Aug 2020 04:42:51 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 05:42:49 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 20:42:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 20:42:44 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 03/10] usb: pci-quirks: convert to readl_poll_timeout_atomic()
Date: Wed, 19 Aug 2020 20:40:58 +0800
Message-ID: <1597840865-26631-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 06646778FB2686F5E984FAB9759175ECDE1BBAA36A064A42CB520E8BAA7E74D02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_084256_561111_9132B7C5 
X-CRM114-Status: GOOD (  14.13  )
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
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/pci-quirks.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index b8961c0..8920566 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>
+#include <linux/iopoll.h>
 
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
@@ -1012,15 +1013,9 @@ static int handshake(void __iomem *ptr, u32 mask, u32 done,
 {
 	u32	result;
 
-	do {
-		result = readl(ptr);
-		result &= mask;
-		if (result == done)
-			return 0;
-		udelay(delay_usec);
-		wait_usec -= delay_usec;
-	} while (wait_usec > 0);
-	return -ETIMEDOUT;
+	return readl_poll_timeout_atomic(ptr, result,
+					 ((result & mask) == done),
+					 delay_usec, wait_usec);
 }
 
 /*
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
