Return-Path: <SRS0=n982=IM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4BFC433E6
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Mar 2021 23:34:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26EA664E77
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Mar 2021 23:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26EA664E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68HhIyyiRGoK7+O/GwdDXz6E3xg0yNmWSfmQ/gpfo0o=; b=QB0nj46jbsAc/dLnyWQh/W7REv
	VXUgIcWrprHVnbmuBXYMFc18HV58pLsqIlbXyF7CqOjgLiWPTppoUZwunGBKymkjP1wdqMJVour/u
	2VJ3UunMfS93gIu+WVfOhWWDCZJ9pDHlwpToBz4iLR2BNJS9yvMSWnrEUVBlRTpSQcDL1+3ORIKnz
	CPCVawdEIRKVCpwqTzHwMpPmAyBWlCHz/KZ5AZ62VnFQCVFgHkgsbgwx6DNYywcVYIMMNoDsJsBtm
	tiMuFzWxOU662LoQJoFw44vJ+l7qkBZkOkclgDW6JVPZE8GXQ9da91JprTu20QLw32ANuHwb2zS7a
	HVFgtkng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLaFO-00EdvU-2a; Sun, 14 Mar 2021 23:34:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLaEr-00EdsA-Nn; Sun, 14 Mar 2021 23:33:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF80964E7C;
 Sun, 14 Mar 2021 23:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615764814;
 bh=i8JUe2VjLZUuVjVLi3BHMdhFn1Aqxj0nLCJrxMeGiq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iPb1J5P5E4HfJeHHqzfPqdE1juViiKpEUpd4NCazAJvWyy9zRda+iEUj+NOhAm3IN
 mM3eXeORFg406wmSbWp4PNzaFF5tyFKiQrp0lastogEzPQhn2R91NS4zl69fqgw5g5
 BxtDPMAit3XYtVVYRNlLtR9AkvxbUcOXN0zvtRE3mZYQwEklR115jmM1ldxN99FqCU
 IRI+wSMwuFXN8+3a4jFo8UnLnabnI1Myp8v1yh854E+EQkEBIprJR6TiNI5fdni3rz
 SFEhIQ593THRhGdYMXWR6Xhk7x5LnPs/ohqvw+F8MLcL2eEGIqR1QHeBjyfTFI+lJV
 k7jaYs6U6OS4w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 1/3] mailbox: mtk-cmdq: Remove cmdq_cb_status
Date: Mon, 15 Mar 2021 07:33:21 +0800
Message-Id: <20210314233323.23377-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210314233323.23377-1-chunkuang.hu@kernel.org>
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_233338_367823_32D89B24 
X-CRM114-Status: GOOD (  10.39  )
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

cmdq_cb_status is an error status. Use the standard error number
instead of cmdq_cb_status to prevent status duplication.

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
 drivers/mailbox/mtk-cmdq-mailbox.c       | 10 +++++-----
 include/linux/mailbox/mtk-cmdq-mailbox.h |  7 +------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 5665b6ea8119..3d37c1cd40f1 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -180,7 +180,7 @@ static bool cmdq_thread_is_in_wfe(struct cmdq_thread *thread)
 	return readl(thread->base + CMDQ_THR_WAIT_TOKEN) & CMDQ_THR_IS_WAITING;
 }
 
-static void cmdq_task_exec_done(struct cmdq_task *task, enum cmdq_cb_status sta)
+static void cmdq_task_exec_done(struct cmdq_task *task, int sta)
 {
 	struct cmdq_task_cb *cb = &task->pkt->async_cb;
 	struct cmdq_cb_data data;
@@ -244,10 +244,10 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 			curr_task = task;
 
 		if (!curr_task || curr_pa == task_end_pa - CMDQ_INST_SIZE) {
-			cmdq_task_exec_done(task, CMDQ_CB_NORMAL);
+			cmdq_task_exec_done(task, 0);
 			kfree(task);
 		} else if (err) {
-			cmdq_task_exec_done(task, CMDQ_CB_ERROR);
+			cmdq_task_exec_done(task, -ENOEXEC);
 			cmdq_task_handle_error(curr_task);
 			kfree(task);
 		}
@@ -415,7 +415,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
-		cmdq_task_exec_done(task, CMDQ_CB_ERROR);
+		cmdq_task_exec_done(task, -ECONNABORTED);
 		kfree(task);
 	}
 
@@ -453,7 +453,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 				 list_entry) {
 		cb = &task->pkt->async_cb;
 		if (cb->cb) {
-			data.sta = CMDQ_CB_ERROR;
+			data.sta = -ECONNABORTED;
 			data.data = cb->data;
 			cb->cb(data);
 		}
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index d5a983d65f05..2f7d9a37d611 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -65,13 +65,8 @@ enum cmdq_code {
 	CMDQ_CODE_LOGIC = 0xa0,
 };
 
-enum cmdq_cb_status {
-	CMDQ_CB_NORMAL = 0,
-	CMDQ_CB_ERROR
-};
-
 struct cmdq_cb_data {
-	enum cmdq_cb_status	sta;
+	int			sta;
 	void			*data;
 };
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
