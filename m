Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB9CC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 10:18:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 588302072C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 10:18:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pULAflQi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 588302072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YZjL8Bntq6U0BpPyeXrAsk7FgbHmnIwU68HDXKz63qc=; b=pULAflQi66xbuiwBrnhV5O7VVn
	uMefGxbhlZigcuC6NLY8Tjwa5wcfx25IOewWymZayAjB3lVymXxKzsg21xiSusAtfTAbDQZXLJskK
	f+KnPRrfbgCmbrn4wEMBzreXfIqaGyxNw46QyhVfxbuaT1CEEbLkjQO4KL6Dgdch3U2I5uthi3ftY
	QlY7v5qu1ypM5v3Cqvq8AzBf6roLc5ZIhfLqAJsJYSQHV8YVAgEE6q5aJf569IIUdJkaQn/O1GW+0
	TurtAayyXYsuMEcaYq8LfphJWc1T19oJjjE7SkLK9Xsc4xIJcFbD79CSa6UqsO6u5azEej02/XPO5
	LdXPogGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh8v5-0003Th-I2; Mon, 23 Nov 2020 10:18:03 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh8v2-0003S2-RW
 for linux-mediatek@lists.infradead.org; Mon, 23 Nov 2020 10:18:02 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cfjl03nmCz15Ptp;
 Mon, 23 Nov 2020 18:17:32 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Mon, 23 Nov 2020
 18:17:46 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <krzk@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH] memory: mtk-smi: Fix PM usage counter unbalance in mtk_smi ops
Date: Mon, 23 Nov 2020 18:21:18 +0800
Message-ID: <20201123102118.3866195-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_051801_163960_A6568C72 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

pm_runtime_get_sync will increment pm usage counter
even it failed. Forgetting to putting operation will
result in reference leak here. We fix it by replacing
it with pm_runtime_resume_and_get to keep usage counter
balanced.

Fixes: 4f0a1a1ae3519 ("memory: mtk-smi: Invoke pm runtime_callback to enable clocks")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/memory/mtk-smi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index ac350f8d1e20..82d09b88240e 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -130,7 +130,7 @@ static void mtk_smi_clk_disable(const struct mtk_smi *smi)
 
 int mtk_smi_larb_get(struct device *larbdev)
 {
-	int ret = pm_runtime_get_sync(larbdev);
+	int ret = pm_runtime_resume_and_get(larbdev);
 
 	return (ret < 0) ? ret : 0;
 }
@@ -374,7 +374,7 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
 	int ret;
 
 	/* Power on smi-common. */
-	ret = pm_runtime_get_sync(larb->smi_common_dev);
+	ret = pm_runtime_resume_and_get(larb->smi_common_dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to pm get for smi-common(%d).\n", ret);
 		return ret;
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
