Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529F1C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:32:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08687613ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08687613ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s8T5nG38haR9grZLfvokPSjqZ0uiYFz3JzRZlqZCAgk=; b=UQDP3elaxCGMoD
	eZP5iWgj+MsD5iyCiOCdbOjI3IOo5WfRwfCu9UN59Ib/sV02Ma9mg2tbxVC1QKn8QtAclCR1F4ZsN
	DQIC/sdmXvxEGnMchDpNNmZxOBWAKFAX4CnJ1aBfFVtv1P2PNfrWTu71KzX/ekGckYhtyCSOkWZCb
	0oujbjanaA5QEhy1+wUVeUBDPjZ3Daf0gLyhRBwJl0GcWOd+bo9IpfvJYghYDaFfbeq42l2fP49HX
	OSLJDXYdRo2U6M4xU4S1KETtQ+tKFR7zLxkUcttAzLag670xqq7CShg7F0Or9oImh8pM/xyBRpmRh
	62F+WK6SxE4zyaTrAUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4KCc-003vkS-LJ; Fri, 16 Jul 2021 09:32:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4KCa-003vjy-12; Fri, 16 Jul 2021 09:32:13 +0000
X-UUID: 112658ce4788426a8f44ffd6da14df88-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=lsiNKVZY0nRRDyAlkx5P4730dBnLWmhdrYBsJF04BS0=; 
 b=DquI/Gfu2wRpdH3Eubs4H5zTmnNy8UIQRI2/HoBsD02PmDOAPe8RtOhS1Hu/t+e2Udc+Or5ytAueX/CIYGOjp/gVzG6mLQZoSCzJeZFP/Z0kBHnOxRbcLflNNcLpUi8pJys+eTZACH6Px7E9Z+0hf0NrYEG6j816aPKaSiPKhAo=;
X-UUID: 112658ce4788426a8f44ffd6da14df88-20210716
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1385854097; Fri, 16 Jul 2021 02:32:03 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 02:23:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 17:23:26 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 17:23:26 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Alan Stern <stern@rowland.harvard.edu>, 
 Ikjoon Jang <ikjn@chromium.org>, Tony Lindgren <tony@atomide.com>, "Chunfeng
 Yun" <chunfeng.yun@mediatek.com>
Subject: [PATCH v2] PM: runtime: enable wake irq after runtime_suspend hook
 called
Date: Fri, 16 Jul 2021 17:23:01 +0800
Message-ID: <1626427381-30131-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 98801C3A6DA5502926890C972FFD7F58BDD0757917DD0C1D5AE2E3442D4A068A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_023212_124012_CAD95192 
X-CRM114-Status: GOOD (  14.91  )
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

When the dedicated wake-irq is level trigger, and it uses the
consumer's sleep status as the wakeup source, that means if the
consumer is not in sleep state, the wake-irq will be triggered
when enable it; For this case, need enable the wake-irq after
invoking the consumer's runtime_suspend() which make the consumer
enter sleep state.

e.g.
Assume the wake-irq is a low level trigger type, and the wakeup
signal comes from the sleep status of consumer.
The wakeup signal is low level at running time (0), and becomes
high level when the consumer enters sleep state (runtime_suspend
(1) is called), a wakeup event at (2) make the consumer exit sleep
state, then the wakeup signal also becomes low level.

                ------------------
               |           ^     ^|
----------------           |     | --------------
 |<---(0)--->|<--(1)--|   (3)   (2)    (4)

if enable the wake-irq before calling runtime_suspend during (0),
an interrupt will arise, it causes resume immediately;
it works if enable wake-irq ( e.g. at (3) or (4)) after calling
runtime_suspend.

In this example, can't fix it by using falling edge trigger without
this patch, the issue will happen as below steps:
1. use another wakeup source to wake up the suspended system;
2. the consumer's resume() will be called, and exits sleep state;
3. the consumer's wakeup signal will fall into low level, due to
   currently the wakeup irq is disabled, the wake-irq is pending;
4. the consumer tries to enter runtime suspend, but there is a
   pending wakeup irq, so will resume again, this will repeat
   endlessly.

This patch seems no side effect on edge trigger wake-irq that works
before.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add more commit message

  I use the falling edge trigger interrupt suggested by Ikjoon [1], it
works well at firstly when only use this related wakeup source, but
encounter issues if use other wakeup sources to wakeup platform as
described in commit message.
  Send out the patch again for further discussion.

[1]: https://patchwork.kernel.org/patch/12190407

---
 drivers/base/power/runtime.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 8a66eaf731e4..90a91b2b1364 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -639,12 +639,12 @@ static int rpm_suspend(struct device *dev, int rpmflags)
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
@@ -690,7 +690,6 @@ static int rpm_suspend(struct device *dev, int rpmflags)
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
