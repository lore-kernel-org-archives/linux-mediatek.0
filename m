Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2BCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 06:42:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D67AE63215
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 06:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D67AE63215
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXlJAjPjmoNZehtVxLYY+VNxTBAW+VUIlJjylmQDyGs=; b=pJZpwUGpztwwo4
	a1eUruhSDXDmcvcc0+gJSPoewphcfafKGlitiTVpzk6PjQB1gyRvc4vgteQ8XHWUnjsRp8RFVobOW
	jUVfx9P6gUp0m1oNbl3aVivS1dOkQzz7hOVPK+vyU5TBfl/szpaOeYt/gIceUkJX/mHpeDs4iorzA
	lLx+de0AaCqMT1stKGl6VA1RMW+SnAaj951cgv7kyEJBfkQlxy/8wlhS5XGnZVNxRAf6M+e6T4FDP
	YBcZwNcfIctvaJAhoM+9ns5ci55y/i5LCMUxBf8LkW022Dh2xyTEXk2SVcAjIP3rdEIP86OQw08QV
	0z3iTltKJwp5Mfmjd0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnEeR-003Vi3-0Y; Wed, 17 Nov 2021 06:42:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnEdy-003VYK-27; Wed, 17 Nov 2021 06:42:08 +0000
X-UUID: 9a4d453062bf47fe82b39273e037b032-20211116
X-UUID: 9a4d453062bf47fe82b39273e037b032-20211116
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1234863257; Tue, 16 Nov 2021 23:42:02 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 22:42:01 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Nov 2021 14:41:59 +0800
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
Subject: [PATCH 1/3] mialbox: move cmdq suspend,
 resume and remove after cmdq_mbox_flush
Date: Wed, 17 Nov 2021 14:41:56 +0800
Message-ID: <20211117064158.27451-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_224206_136807_4BF12331 
X-CRM114-Status: GOOD (  16.36  )
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

Move the function order to make sure cmdq_mbox_flush is declared
before cmdq_suspend calling it.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 84 +++++++++++++++---------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index c591dab9d5a4..03f9ed4c5131 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -296,48 +296,6 @@ static irqreturn_t cmdq_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static int cmdq_suspend(struct device *dev)
-{
-	struct cmdq *cmdq = dev_get_drvdata(dev);
-	struct cmdq_thread *thread;
-	int i;
-	bool task_running = false;
-
-	cmdq->suspended = true;
-
-	for (i = 0; i < cmdq->thread_nr; i++) {
-		thread = &cmdq->thread[i];
-		if (!list_empty(&thread->task_busy_list)) {
-			task_running = true;
-			break;
-		}
-	}
-
-	if (task_running)
-		dev_warn(dev, "exist running task(s) in suspend\n");
-
-	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
-
-	return 0;
-}
-
-static int cmdq_resume(struct device *dev)
-{
-	struct cmdq *cmdq = dev_get_drvdata(dev);
-
-	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
-	cmdq->suspended = false;
-	return 0;
-}
-
-static int cmdq_remove(struct platform_device *pdev)
-{
-	struct cmdq *cmdq = platform_get_drvdata(pdev);
-
-	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
-	return 0;
-}
-
 static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 {
 	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data;
@@ -521,6 +479,48 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 	return &mbox->chans[ind];
 }
 
+static int cmdq_suspend(struct device *dev)
+{
+	struct cmdq *cmdq = dev_get_drvdata(dev);
+	struct cmdq_thread *thread;
+	int i;
+	bool task_running = false;
+
+	cmdq->suspended = true;
+
+	for (i = 0; i < cmdq->thread_nr; i++) {
+		thread = &cmdq->thread[i];
+		if (!list_empty(&thread->task_busy_list)) {
+			task_running = true;
+			break;
+		}
+	}
+
+	if (task_running)
+		dev_warn(dev, "exist running task(s) in suspend\n");
+
+	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
+
+	return 0;
+}
+
+static int cmdq_resume(struct device *dev)
+{
+	struct cmdq *cmdq = dev_get_drvdata(dev);
+
+	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
+	cmdq->suspended = false;
+	return 0;
+}
+
+static int cmdq_remove(struct platform_device *pdev)
+{
+	struct cmdq *cmdq = platform_get_drvdata(pdev);
+
+	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
+	return 0;
+}
+
 static int cmdq_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
