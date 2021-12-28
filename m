Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E860C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ROsP05p5b90CaEk0KFyByom8GzJ0QDpw1RcjUlxzlf4=; b=JNh4HOey3Rc1LS
	DdpsmJ8rgnHb8xEAHx37+cPm++AsapiohcTJl+wLUp4freHyHocxid3HognO4YQQY2Zsrk3S7soa0
	RpiaSitY51s9wy91RVN4zrHh4PtUgHRhmYqz5UHL3MhGW4jo07zwgvlL9blSiwsBdV68sDr7+4wDR
	8QRq984sfE2wTCZCSDmKJ8RH+E2+fNZCHc3gXteWmT68tdZ+ScSaikaoF2scNaqrc5IHoh6O/1WBn
	xtGKW7pMNOp1auenwFPCfZyXZ1TRmxqwJ7H3klMHRAbQYUb2YNbnFZ455q3Hvu+mcgiD3XxnMxSH6
	BF5hqWUHu94+/58D3x3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n28lO-000U87-Lc; Tue, 28 Dec 2021 09:27:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n28lL-000U6y-16; Tue, 28 Dec 2021 09:27:21 +0000
X-UUID: c0e7398cf3424480bf930a078cc45a39-20211228
X-UUID: c0e7398cf3424480bf930a078cc45a39-20211228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 644459453; Tue, 28 Dec 2021 02:27:12 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Dec 2021 01:27:11 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Dec 2021 17:27:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Dec 2021 17:27:09 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>
CC: <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <mark-pk.tsai@mediatek.com>, <yj.chiang@mediatek.com>
Subject: [PATCH] driver core: Simplify async probe test code by using
 ktime_ms_delta()
Date: Tue, 28 Dec 2021 17:27:07 +0800
Message-ID: <20211228092707.29987-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_012719_102205_6055FFAB 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

Simplify async probe test code by using ktime_ms_delta().

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/base/test/test_async_driver_probe.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/base/test/test_async_driver_probe.c b/drivers/base/test/test_async_driver_probe.c
index 3bb7beb127a9..4d1976ca5072 100644
--- a/drivers/base/test/test_async_driver_probe.c
+++ b/drivers/base/test/test_async_driver_probe.c
@@ -104,7 +104,7 @@ static int __init test_async_probe_init(void)
 	struct platform_device **pdev = NULL;
 	int async_id = 0, sync_id = 0;
 	unsigned long long duration;
-	ktime_t calltime, delta;
+	ktime_t calltime;
 	int err, nid, cpu;
 
 	pr_info("registering first set of asynchronous devices...\n");
@@ -133,8 +133,7 @@ static int __init test_async_probe_init(void)
 		goto err_unregister_async_devs;
 	}
 
-	delta = ktime_sub(ktime_get(), calltime);
-	duration = (unsigned long long) ktime_to_ms(delta);
+	duration = (unsigned long long)ktime_ms_delta(ktime_get(), calltime);
 	pr_info("registration took %lld msecs\n", duration);
 	if (duration > TEST_PROBE_THRESHOLD) {
 		pr_err("test failed: probe took too long\n");
@@ -161,8 +160,7 @@ static int __init test_async_probe_init(void)
 		async_id++;
 	}
 
-	delta = ktime_sub(ktime_get(), calltime);
-	duration = (unsigned long long) ktime_to_ms(delta);
+	duration = (unsigned long long)ktime_ms_delta(ktime_get(), calltime);
 	dev_info(&(*pdev)->dev,
 		 "registration took %lld msecs\n", duration);
 	if (duration > TEST_PROBE_THRESHOLD) {
@@ -197,8 +195,7 @@ static int __init test_async_probe_init(void)
 		goto err_unregister_sync_devs;
 	}
 
-	delta = ktime_sub(ktime_get(), calltime);
-	duration = (unsigned long long) ktime_to_ms(delta);
+	duration = (unsigned long long)ktime_ms_delta(ktime_get(), calltime);
 	pr_info("registration took %lld msecs\n", duration);
 	if (duration < TEST_PROBE_THRESHOLD) {
 		dev_err(&(*pdev)->dev,
@@ -223,8 +220,7 @@ static int __init test_async_probe_init(void)
 
 	sync_id++;
 
-	delta = ktime_sub(ktime_get(), calltime);
-	duration = (unsigned long long) ktime_to_ms(delta);
+	duration = (unsigned long long)ktime_ms_delta(ktime_get(), calltime);
 	dev_info(&(*pdev)->dev,
 		 "registration took %lld msecs\n", duration);
 	if (duration < TEST_PROBE_THRESHOLD) {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
