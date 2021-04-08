Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC84C43462
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 09:36:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04BB61151
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 09:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B04BB61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fJwIFaqil68jYdH3KQmiDZvWxtkwIqnkWQIl1geQAKU=; b=pm2/XlIQjnahyGWOhjHU277i/c
	MlPB5sxZ4U5tHCKQRYPKxcc5xS/PYWpyd5iGjO5rXvRpncYKKadLD56aF00dY88HgNeGMl42QLcR9
	+IcvXz7WlUrZMAGFv1FI16B+vv2G8Z891a42BfKOzd+OPZ7CqUMWOGEwZ6hUpGjBxerKynGGqTMPx
	AIY9f09KZ0MP6PO23bpzF92pHrxI4frptGOhS4ObEjDawNOhDNHk0Pn3YvqeWCv9LhSUEkv5GGPv1
	RHJRPIqgllVv3V2qnmlVGuul7HT6Q7TWqgOVkOVyATX6NiNhaSRPzu6EgIeoFyw81srdAa0cMOfDE
	9I7zfcYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUR51-007Vat-AR; Thu, 08 Apr 2021 09:36:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUR4U-007VPA-LS; Thu, 08 Apr 2021 09:35:37 +0000
X-UUID: 585746e15aa8405eae352076674e34b9-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hjJRwZm9IeP0DTMhFlSNpR5HZHV3aVL1/+x6YsPJybM=; 
 b=lJjTcAXjuA6CIMh3DsccUNQLMcUO+vBm7h1/FQ3MrlBqbqjHeAn5QU5xa7DgIvrD3MN0W/aUsN8bJi/zGqCSXylhO3Yfez6W6EPbs1aa5rN4K5ZwiGZNDd34nc4+xjf1y4gxkzTe2TVXN6Aake9J6uSMuObUXSrhARzOsgx5uYQ=;
X-UUID: 585746e15aa8405eae352076674e34b9-20210408
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 145607834; Thu, 08 Apr 2021 02:35:23 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 02:35:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 17:35:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 17:35:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Tianping Fang
 <tianping.fang@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, "Ikjoon
 Jang" <ikjn@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 1/6] PM: runtime: enable wake irq after runtime_suspend hook
 called
Date: Thu, 8 Apr 2021 17:35:09 +0800
Message-ID: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: E5C6DB1EBBB6601790860FBE2A607D826DC4ADE8017410E55972F9D1B0FDA48D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_103531_126193_EB34E641 
X-CRM114-Status: GOOD (  11.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When the dedicated wake irq is level trigger, enable it before
calling runtime_suspend, will trigger an interrupt.

e.g.
for a low level trigger type, it's low level at running time (0),
and becomes high level when enters suspend (runtime_suspend (1) is
called), a wakeup signal at (2) make it become low level, wake irq
will be triggered.

                ------------------
               |           ^     ^|
----------------           |     | --------------
 |<---(0)--->|<--(1)--|   (3)   (2)    (4)

if we enable the wake irq before calling runtime_suspend during (0),
an interrupt will arise, it causes resume immediately;
enable wake irq after calling runtime_suspend, e.g. at (3) or (4),
will works.

This patch seems no side effect on edge trigger wake irq.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/base/power/runtime.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index a46a7e30881b..796739a015a5 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -619,12 +619,12 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 	__update_runtime_status(dev, RPM_SUSPENDING);
 
 	callback = RPM_GET_CALLBACK(dev, runtime_suspend);
-
-	dev_pm_enable_wake_irq_check(dev, true);
 	retval = rpm_callback(callback, dev);
 	if (retval)
 		goto fail;
 
+	dev_pm_enable_wake_irq_check(dev, true);
+
  no_callback:
 	__update_runtime_status(dev, RPM_SUSPENDED);
 	pm_runtime_deactivate_timer(dev);
@@ -659,7 +659,6 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 	return retval;
 
  fail:
-	dev_pm_disable_wake_irq_check(dev);
 	__update_runtime_status(dev, RPM_ACTIVE);
 	dev->power.deferred_resume = false;
 	wake_up_all(&dev->power.wait_queue);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
