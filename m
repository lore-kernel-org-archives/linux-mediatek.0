Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C33C43463
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:25:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D76A20719
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 06:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s89TXNVX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XAa6akjm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D76A20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VmnloXphLq8flVmntwa3K8Eke91TtzEKkkMjGvo2GG0=; b=s89TXNVXlaPpMCW41GfLtmWFO
	V0Bt+8GPJPIndqdSdACa9hHgzf0BE3+6FAN38u2fMuwcDo1VttljYH0zpHkYTCs1YEDo2ZQX3voj7
	jfQzdTOukv+3Wlt6oGmmf5wJsRJ362dlmj786Y/8hpbkCKxkTTciSA0OGNsoY29I+ELVceq4MVSw2
	9O6HFHl5UztS6JShgSwmvHUx36p5FTRJ07GELvLKBXYUZZaXhaMJBPcSOlSKGjL80MYTfzb+RScPI
	XXHim2RQg/KYY9TDkJuBX2l5B8TYHFgd7m2dWbqhxgzBwdIt4OO5AR4OToNAhyFVhE2qpzD8lNTQ1
	oPOaQ6XCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKFFx-0005Yu-4e; Mon, 21 Sep 2020 06:24:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKFFg-0005SM-5D; Mon, 21 Sep 2020 06:24:41 +0000
X-UUID: 5f517061fc164ba1836ef6d2650fb5d8-20200920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qI3X9MwE9sMRTnQRdhPZhEZddjHAueHKnEny+Zk541Y=; 
 b=XAa6akjm2f+Sn3BiZvfO/yaEagaIbFCoD2hNlK4uP7iR8uCoo02GxU6iwQVtFjUpfg/G6AB6YYtc1yAMVSk3iGMEIPA9km0uMyaet0q2RXwjI2gIQWBA/fmssqzalAkG4R3tqhtwEJ4MHkeZkU8xo4U1Id8F8OF2c53crhkx0/M=;
X-UUID: 5f517061fc164ba1836ef6d2650fb5d8-20200920
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 270014550; Sun, 20 Sep 2020 22:24:38 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Sep 2020 23:17:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 14:16:59 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Sep 2020 14:16:57 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
Subject: [PATCH v4 03/11] usb: pci-quirks: convert to
 readl_poll_timeout_atomic()
Date: Mon, 21 Sep 2020 14:13:27 +0800
Message-ID: <1600668815-12135-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1600668815-12135-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 421069FA6C9AA675FB54CB2DE9B79D16F9C9FB5D8FC8F7F833225D52AF36DAA72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_022440_380161_9178AFC6 
X-CRM114-Status: GOOD (  14.17  )
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
 Mathias Nyman <mathias.nyman@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v4: no changes
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
