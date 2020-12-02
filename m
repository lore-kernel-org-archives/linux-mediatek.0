Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A1BC64E7C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 23:59:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6614621D93
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 23:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6614621D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t77U6iWEHKFy87ZQNLso69JbKOzjIPxc3iwL/pqLRpk=; b=peA5xpUAPRfDLNcxeuk+jCGvoj
	U4ySUI3r1s+IF8NpfYKr6sOB7EOWTyT+dWB7FrLE/HKcSe1I3ch7Y5tJZZ0ScOzsq5hj6VYyRW2Lr
	2PmkyTo6juyI0GDAZ1YqOwK5jE6B1ExCqkiPmjHnQXnWXwgL4LrmRBOr/b7XfKUnyaIiG9IFZGFWw
	yY74lPeB1IfOWtc1RbQjv2Oxv0oUM/ysL4WfGgFVDdwZhHtVr2seSxQFRFqsMbNv7tOb4Nq0ctn/3
	dVMhLuw/KA/9aIKVULysWPQEmfhfn5XXujppem0UMXxKlw/7NlJTQXjpoQDu9WdPRyWvOBNB+l9i1
	wt8zpltg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkc1v-0006ce-2n; Wed, 02 Dec 2020 23:59:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkc1q-0006c3-W9; Wed, 02 Dec 2020 23:59:23 +0000
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] soc: mediatek: cmdq: Remove cmdq_pkt_flush()
Date: Thu,  3 Dec 2020 07:58:55 +0800
Message-Id: <20201202235856.7652-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_185923_112702_5E05F35F 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

rx_callback is a standard mailbox callback mechanism and could
cover the function of proprietary cmdq_task_cb, so it is better
to use the standard one instead of the proprietary one. But
register rx_callback should before mbox_request_channel(),
so remove cmdq_pkt_flush() and let client driver implement
its own synchronous flush.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 32 --------------------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 12 ----------
 2 files changed, 44 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 505651b0d715..fd3bc39538a1 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -502,36 +502,4 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 }
 EXPORT_SYMBOL(cmdq_pkt_flush_async);
 
-struct cmdq_flush_completion {
-	struct completion cmplt;
-	bool err;
-};
-
-static void cmdq_pkt_flush_cb(struct cmdq_cb_data data)
-{
-	struct cmdq_flush_completion *cmplt;
-
-	cmplt = (struct cmdq_flush_completion *)data.data;
-	if (data.sta != CMDQ_CB_NORMAL)
-		cmplt->err = true;
-	else
-		cmplt->err = false;
-	complete(&cmplt->cmplt);
-}
-
-int cmdq_pkt_flush(struct cmdq_pkt *pkt)
-{
-	struct cmdq_flush_completion cmplt;
-	int err;
-
-	init_completion(&cmplt.cmplt);
-	err = cmdq_pkt_flush_async(pkt, cmdq_pkt_flush_cb, &cmplt);
-	if (err < 0)
-		return err;
-	wait_for_completion(&cmplt.cmplt);
-
-	return cmplt.err ? -EFAULT : 0;
-}
-EXPORT_SYMBOL(cmdq_pkt_flush);
-
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 960704d75994..2c6aa84c0e80 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -288,16 +288,4 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 			 void *data);
 
-/**
- * cmdq_pkt_flush() - trigger CMDQ to execute the CMDQ packet
- * @pkt:	the CMDQ packet
- *
- * Return: 0 for success; else the error code is returned
- *
- * Trigger CMDQ to execute the CMDQ packet. Note that this is a
- * synchronous flush function. When the function returned, the recorded
- * commands have been done.
- */
-int cmdq_pkt_flush(struct cmdq_pkt *pkt);
-
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
