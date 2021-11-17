Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95F9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 06:42:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 963D461BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 06:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 963D461BC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/37Znkryfi5cfKfzkmMp5GDpdpycoyfHUZlt4y2kTc=; b=CWlwQfaFXKA+uN
	HM57p4IhG8PxDd7PGWkN28Y/Ntv6NEvIgG1jpmcFOr2YTr7g26tXK1iRc5HLWY3wjoGjG7Rwcrtqb
	67nvLOwZdQNM+BjMJ0m/AMjwBmCN8yDufKvowNOuxchMac2oThWOFZO6UtcZexzsusf3altCDUfLj
	l7asvSCxhqju7ptw4aNXsRIfbDVdajbt9fhVRNhhN6e7/Oo78MW2aq2vWljgn8dEAVe+3xtXebsXm
	L8z4krKnKc1qcDsfv3J8C6l/8GcRQSpEDwh90WfxGpqB0AUQxDL/Zq7jVS/UvM9SW+Y+CjpCP+LLc
	7BO9k5JcxlL4GlupD1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnEeR-003ViP-Vc; Wed, 17 Nov 2021 06:42:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnEdx-003VY8-CK; Wed, 17 Nov 2021 06:42:08 +0000
X-UUID: c9e5ae6dcdc84fb589ee5d71b3762185-20211116
X-UUID: c9e5ae6dcdc84fb589ee5d71b3762185-20211116
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1130120643; Tue, 16 Nov 2021 23:42:02 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 22:42:01 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 17 Nov 2021 14:42:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Nov 2021 14:41:59 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <tzungbi@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>, jason-jh.lin
 <jason-jh.lin@mediatek.com>
Subject: [PATCH 2/3] mailbox: add cmdq_mbox_flush to clear all task before
 suspend
Date: Wed, 17 Nov 2021 14:41:57 +0800
Message-ID: <20211117064158.27451-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_224205_457298_6DC0775F 
X-CRM114-Status: GOOD (  13.14  )
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

CMDQ driver will occupy GCE clock to execute the task in GCE thread.

So call cmdq_mbox_flush to clear all task in GCE thread before
CMDQ suspend.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 03f9ed4c5131..28cadfc0091b 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -484,21 +484,18 @@ static int cmdq_suspend(struct device *dev)
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 	struct cmdq_thread *thread;
 	int i;
-	bool task_running = false;
 
 	cmdq->suspended = true;
 
 	for (i = 0; i < cmdq->thread_nr; i++) {
 		thread = &cmdq->thread[i];
 		if (!list_empty(&thread->task_busy_list)) {
-			task_running = true;
-			break;
+			/* try to clear all task in this thread */
+			cmdq_mbox_flush(thread->chan, 2000);
+			dev_warn(dev, "thread[%d] exist running task(s) in suspend\n", i);
 		}
 	}
 
-	if (task_running)
-		dev_warn(dev, "exist running task(s) in suspend\n");
-
 	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
 
 	return 0;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
