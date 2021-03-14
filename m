Return-Path: <SRS0=n982=IM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D05C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Mar 2021 23:34:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ED8564E77
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Mar 2021 23:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ED8564E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Io7Ib8mK7MYnKBbSygUGbMkGvnYZsmD0vNR7/tYBgM=; b=Alhc3xOHh1Kez0vy/iP57lUo3R
	2Pua6BiCfFuP9auv1igCWKYGDYeJONYHhozvZJFrK0R7DMhRMav//Chx1lp1RQe+wet5ilhDUhwsm
	8bqhXAZMGl29YpouWim+rFyz3pzi4kcUa5FmgseEVj+/iAWCBXN1iP5iiNhgwuEI3BQyjI3oSbTbh
	L2WWYx5Ke38ySX0GAd2uYIFbJ7B8km4+r+KKNFsquw8HYPCY9C9e+C8vWfI9iyJrOPVTffDHAxZIu
	nSAJuboyVIb97ZHMkHIwMN9DGDXoHv5/e0xt807dnjsUl5O1dMC3YirvqzShdpyQpsavxQhGaNKrB
	VtIc2R0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLaFL-00EdvG-TA; Sun, 14 Mar 2021 23:34:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLaEr-00EdsC-Vd; Sun, 14 Mar 2021 23:33:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0190364E86;
 Sun, 14 Mar 2021 23:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615764816;
 bh=Sb/aUOEVrGZsj+WwC31AWifEfTb5okFWSJJBDazvLWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p8X8+nqsqw3JfWwp699qB+lHkbMabIqGvdJeOa5nuVwh/jwA7jE6Ch/7ySN6gEjY5
 3gLG+M74VYgoeN4uUOuVaydTi5hbhy4rkIUzLoHO3N3nxqGMMLRKcUwP1PKEVsvfPI
 ZU+hvNi9npXXQ+eqxenxZsCNpZuNiJBVNq3kBl5SpV2G9ecEnZfpxovZ3815tu9UF5
 gis0mNTn47sgx6DK+wdKF1crbA99YXRd1/TO5zGFxMOGa4zOc6vpWejIu/XKMPc2+N
 8b/kIU4I11skDc6E6mALf1yuCghY7jnfrb7fQMbj4j+kK9AX9EtesoHbfUwNpZuvTd
 2ROg1Zm/OW74w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 2/3] mailbox: mtk-cmdq: Use mailbox rx_callback
Date: Mon, 15 Mar 2021 07:33:22 +0800
Message-Id: <20210314233323.23377-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210314233323.23377-1-chunkuang.hu@kernel.org>
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_233338_358969_A041E110 
X-CRM114-Status: GOOD (  10.07  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

rx_callback is a standard mailbox callback mechanism and could cover the
function of proprietary cmdq_task_cb, so use the standard one instead of
the proprietary one. But the client driver has already used cmdq_task_cb,
so keep cmdq_task_cb until all client driver use rx_callback instead of
cmdq_task_cb.

Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>
Cc: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 3d37c1cd40f1..ef59e2234f22 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -188,7 +188,10 @@ static void cmdq_task_exec_done(struct cmdq_task *task, int sta)
 	WARN_ON(cb->cb == (cmdq_async_flush_cb)NULL);
 	data.sta = sta;
 	data.data = cb->data;
-	cb->cb(data);
+	if (cb->cb)
+		cb->cb(data);
+
+	mbox_chan_received_data(task->thread->chan, &data);
 
 	list_del(&task->list_entry);
 }
@@ -451,12 +454,13 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
+		data.sta = -ECONNABORTED;
+		data.data = cb->data;
 		cb = &task->pkt->async_cb;
-		if (cb->cb) {
-			data.sta = -ECONNABORTED;
-			data.data = cb->data;
+		if (cb->cb)
 			cb->cb(data);
-		}
+
+		mbox_chan_received_data(task->thread->chan, &data);
 		list_del(&task->list_entry);
 		kfree(task);
 	}
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
