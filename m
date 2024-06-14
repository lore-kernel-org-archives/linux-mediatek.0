Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70689C27C7B
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 04:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cp3S0hz+UCEESDzdQhAQa+QViRBu+pLWKLmQYRPjW3w=; b=zqIy3ieR3AFNZ19+kRZ0xh+JDu
	d62BEHeHp0dVvufLFGS/chv6n/DlL+LkcHSCiZp/93yorofki2qrmyEXD7ipZY9kDCcPArXI+Y8G6
	ofykrLOzD9S9kqtQ8Uhtl6VeI0Ay3dX6eMok3RWHX8piQGYTPWYgQs7j0mafEU+kjeg6GBdEHE24U
	FbA/ssUW5Sj/UA6oDQ8lqmN93k5OL0tXvGoIBKv+Q3Lu+vfzrQspYcVBZTt0mb+qqPkVfNXB3r2tf
	Jaec73p0siFk2WG41XBaRpXK0bJBxJXI8rAk2H2d/vcPLQ2a/Nh/Zlvt7pErNCwCtrfTU+K3yB5ke
	SxGLBTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHy8o-00000001LXT-3kNh;
	Fri, 14 Jun 2024 04:02:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHy8m-00000001LW0-0u97;
	Fri, 14 Jun 2024 04:02:17 +0000
X-UUID: e0e4e32a2a0211efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cp3S0hz+UCEESDzdQhAQa+QViRBu+pLWKLmQYRPjW3w=;
	b=tiUulQyWu5uveW22hqmxKiSpxrId1yzHhV/qHfrW04kooHXLpOK6A1IQkf7ezoMV7LiWUPu+oa9c8QDFq9CJKQd0qfoj01gP6WIA+oLE8e6K9bkN9KWEF1c/sdzsCic55DZQ03ddpOT5WLOnBfebRaI+LbVb/i0ZYPRe41aEoOU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:5ad7a17c-68a9-400c-b610-ef5ec797c900,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:def01285-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e0e4e32a2a0211efaf04eb0598667787-20240613
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1854478214; Thu, 13 Jun 2024 21:02:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 12:01:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 12:01:34 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 1/2] mailbox: Add power_get/power_put API to mbox_chan_ops
Date: Fri, 14 Jun 2024 12:01:32 +0800
Message-ID: <20240614040133.24967-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.890200-8.000000
X-TMASE-MatchedRID: +MT4sN6PwkkpDniSMR+7FVz+axQLnAVBsuIso71Vk6Is/uUAk6xP7PlY
	oV6p/cSxYZon4ysgRFozZkzSKaTDyzWBtSWZ+bE6tw+xHnsmQjM2UosmN5oMuL/A+0D1to6PddB
	i3uMAVYvJpEwYgGDKGNWPKFYziUDIOVzKEd+ERcpIcJTn2HkqsTtSuYjPEOig2+mPn502VC/Irl
	nIALCsEkeSgWObrJ9MSHd+RjLgi2MYB2fOueQzjxRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7lnBE
	Jr8G5ea7U/yd1J/CA0ZGZ1zIaaRD2avzr9xB9L8aAZk0sEcY14=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.890200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BF68BF4C9A3210864A913116E970F109AD5F2EDC8CDFB3354B6315FD3C8B6D502000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_210216_297071_C1407671 
X-CRM114-Status: GOOD (  15.86  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To avoid pm_runtime APIs calling sleep in all the atomic context APIs
in mbox_chan_ops, we add power_get/power_put API to let the controllers
implement them with pm_runtime APIs outside the other atomic context APIs
in mbox_chan_ops.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mailbox.c          | 55 ++++++++++++++++++++++++++++++
 include/linux/mailbox_controller.h | 11 ++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index ebff3baf3045..bafcc7b0c0b8 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -58,6 +58,12 @@ static void msg_submit(struct mbox_chan *chan)
 	void *data;
 	int err = -EBUSY;
 
+	if (chan->mbox->ops->power_get) {
+		err = chan->mbox->ops->power_get(chan);
+		if (err < 0)
+			return;
+	}
+
 	spin_lock_irqsave(&chan->lock, flags);
 
 	if (!chan->msg_count || chan->active_req)
@@ -89,12 +95,16 @@ static void msg_submit(struct mbox_chan *chan)
 		hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
 		spin_unlock_irqrestore(&chan->mbox->poll_hrt_lock, flags);
 	}
+
+	if (chan->mbox->ops->power_put)
+		chan->mbox->ops->power_put(chan);
 }
 
 static void tx_tick(struct mbox_chan *chan, int r)
 {
 	unsigned long flags;
 	void *mssg;
+	int ret;
 
 	spin_lock_irqsave(&chan->lock, flags);
 	mssg = chan->active_req;
@@ -107,10 +117,19 @@ static void tx_tick(struct mbox_chan *chan, int r)
 	if (!mssg)
 		return;
 
+	if (chan->mbox->ops->power_get) {
+		ret = chan->mbox->ops->power_get(chan);
+		if (ret < 0)
+			return;
+	}
+
 	/* Notify the client */
 	if (chan->cl->tx_done)
 		chan->cl->tx_done(chan->cl, mssg, r);
 
+	if (chan->mbox->ops->power_put)
+		chan->mbox->ops->power_put(chan);
+
 	if (r != -ETIME && chan->cl->tx_block)
 		complete(&chan->tx_complete);
 }
@@ -223,9 +242,16 @@ EXPORT_SYMBOL_GPL(mbox_client_txdone);
  */
 bool mbox_client_peek_data(struct mbox_chan *chan)
 {
+	if (chan->mbox->ops->power_get)
+		if (chan->mbox->ops->power_get(chan) < 0)
+			return false;
+
 	if (chan->mbox->ops->peek_data)
 		return chan->mbox->ops->peek_data(chan);
 
+	if (chan->mbox->ops->power_put)
+		chan->mbox->ops->power_put(chan);
+
 	return false;
 }
 EXPORT_SYMBOL_GPL(mbox_client_peek_data);
@@ -310,10 +336,19 @@ int mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 	if (!chan->mbox->ops->flush)
 		return -ENOTSUPP;
 
+	if (chan->mbox->ops->power_get) {
+		ret = chan->mbox->ops->power_get(chan);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = chan->mbox->ops->flush(chan, timeout);
 	if (ret < 0)
 		tx_tick(chan, ret);
 
+	if (chan->mbox->ops->power_put)
+		chan->mbox->ops->power_put(chan);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mbox_flush);
@@ -341,6 +376,12 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 
+	if (chan->mbox->ops->power_get) {
+		ret = chan->mbox->ops->power_get(chan);
+		if (ret < 0)
+			return ERR_PTR(ret);
+	}
+
 	if (chan->mbox->ops->startup) {
 		ret = chan->mbox->ops->startup(chan);
 
@@ -441,7 +482,11 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 	if (ret)
 		chan = ERR_PTR(ret);
 
+	if (chan->mbox->ops->power_put)
+		chan->mbox->ops->power_put(chan);
+
 	mutex_unlock(&con_mutex);
+
 	return chan;
 }
 EXPORT_SYMBOL_GPL(mbox_request_channel);
@@ -485,13 +530,23 @@ EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
 void mbox_free_channel(struct mbox_chan *chan)
 {
 	unsigned long flags;
+	int ret;
 
 	if (!chan || !chan->cl)
 		return;
 
+	if (chan->mbox->ops->power_get) {
+		ret = chan->mbox->ops->power_get(chan);
+		if (ret < 0)
+			return;
+	}
+
 	if (chan->mbox->ops->shutdown)
 		chan->mbox->ops->shutdown(chan);
 
+	if (chan->mbox->ops->power_put)
+		chan->mbox->ops->power_put(chan);
+
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	spin_lock_irqsave(&chan->lock, flags);
 	chan->cl = NULL;
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 6fee33cb52f5..e8f26e7dabfd 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -42,6 +42,15 @@ struct mbox_chan;
  *		  Used only if txdone_poll:=true && txdone_irq:=false
  * @peek_data: Atomic check for any received data. Return true if controller
  *		  has some data to push to the client. False otherwise.
+ * @power_get:	Called when the controller need to get the reference to keep
+ *		the power on for the device of mailbox controller. It is
+ *		optional to implement this function with pm_runtime APIs or
+ *		more complicated operation.
+ *		Return 0 is success, otherwise are fail.
+ * @power_put:	Called when the controller need to put the reference to release
+ *		the power for the device of mailbox controller. It is optional
+ *		to implement this function with pm_runtime APIs or more
+ *		complicated operation.
  */
 struct mbox_chan_ops {
 	int (*send_data)(struct mbox_chan *chan, void *data);
@@ -50,6 +59,8 @@ struct mbox_chan_ops {
 	void (*shutdown)(struct mbox_chan *chan);
 	bool (*last_tx_done)(struct mbox_chan *chan);
 	bool (*peek_data)(struct mbox_chan *chan);
+	int (*power_get)(struct mbox_chan *chan);
+	void (*power_put)(struct mbox_chan *chan);
 };
 
 /**
-- 
2.18.0


