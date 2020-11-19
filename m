Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70ADEC63697
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 14:08:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA3C246CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 14:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N1HNUT2E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECA3C246CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KvxUQeHzqJlPWPvobJ7+s8vPiFFu5UU6W+JoWGzcILc=; b=N1HNUT2E844MRZfPO0X6eIf8mG
	5GUNjcY5OAem5nLp7WBCGwPqK/nPl1pne4kDb/anj9UN8DEW03tbM2SwhmWYbiVFQyU+Dpzyy9Ylm
	MnC91hLXyMzGqpsSviZ8tUlUsHPhTW5OzqpwwSv2jRJ8UjCOWzdTO0lhn2GFO6LQv1o39BplshBsL
	DlGfV2WbwquEne+Q4Lkj2TV4UMkj9kLi0ZTR1JsP7nHMzGJkk46PSM0gkWBIddgYA3at4vUS4gzot
	PihbQCmKMUYAgIJ1wNHD6ti2dAdEHJa93ckbpA3WiB+zT0MTpn+E68sXVEx0fPojADAMj7p3TJ7hq
	q8dSS/yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfkbf-0000Aw-Rt; Thu, 19 Nov 2020 14:08:15 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfkbd-00008u-Ht
 for linux-mediatek@lists.infradead.org; Thu, 19 Nov 2020 14:08:14 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CcM2C5Hmbzkbn8;
 Thu, 19 Nov 2020 22:07:31 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Thu, 19 Nov 2020
 22:07:49 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH] serial: 8250-mtk: Fix reference leak in mtk8250_probe
Date: Thu, 19 Nov 2020 22:11:26 +0800
Message-ID: <20201119141126.168850-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_090813_864805_54A003B5 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The pm_runtime_enable will increase power disable depth.
Thus a pairing decrement is needed on the error handling
path to keep it balanced according to context.

Fixes: e32a83c70cf98 ("serial: 8250-mtk: modify mtk uart power and clock management")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index fa876e2c13e5..f7d3023f860f 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -572,15 +572,22 @@ static int mtk8250_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	err = mtk8250_runtime_resume(&pdev->dev);
 	if (err)
-		return err;
+		goto err_pm_disable;
 
 	data->line = serial8250_register_8250_port(&uart);
-	if (data->line < 0)
-		return data->line;
+	if (data->line < 0) {
+		err = data->line;
+		goto err_pm_disable;
+	}
 
 	data->rx_wakeup_irq = platform_get_irq_optional(pdev, 1);
 
 	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+
+	return err;
 }
 
 static int mtk8250_remove(struct platform_device *pdev)
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
