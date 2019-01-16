From: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH 1/3] mailbox: Add ability for clients to abort data in channel
Date: Wed, 16 Jan 2019 13:04:33 +0800
Message-ID: <20190116050435.11624-2-ck.hu@mediatek.com>
References: <20190116050435.11624-1-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116050435.11624-1-ck.hu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, CK Hu <ck.hu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

This patch supplies a new framework API, mbox_abort_channel(), and
a new controller interface, abort_data().

For some client's application, it need to clean up the data in channel
but keep the channel so it could send data to channel later.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/mailbox/mailbox.c          | 23 +++++++++++++++++++++++
 include/linux/mailbox_client.h     |  1 +
 include/linux/mailbox_controller.h |  4 ++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index c6a7d4582dc6..281647162c76 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -428,6 +428,29 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 }
 EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
 
+/**
+ * mbox_abort_channel - The client abort all data in a mailbox
+ *			channel by this call.
+ * @chan: The mailbox channel to be aborted.
+ */
+void mbox_abort_channel(struct mbox_chan *chan)
+{
+	unsigned long flags;
+
+	if (!chan || !chan->cl)
+		return;
+
+	if (chan->mbox->ops->abort_data)
+		chan->mbox->ops->abort_data(chan);
+
+	/* The queued TX requests are simply aborted, no callbacks are made */
+	spin_lock_irqsave(&chan->lock, flags);
+	chan->cl = NULL;
+	chan->active_req = NULL;
+	spin_unlock_irqrestore(&chan->lock, flags);
+}
+EXPORT_SYMBOL_GPL(mbox_abort_channel);
+
 /**
  * mbox_free_channel - The client relinquishes control of a mailbox
  *			channel by this call.
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index faa7da3c9c8b..209d1d458029 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -47,6 +47,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg);
 int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
+void mbox_abort_channel(struct mbox_chan *chan); /* may sleep */
 void mbox_free_channel(struct mbox_chan *chan); /* may sleep */
 
 #endif /* __MAILBOX_CLIENT_H */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 4994a438444c..518aa4ca2fe4 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -27,6 +27,9 @@ struct mbox_chan;
  * @flush:	Called when a client requests transmissions to be blocking but
  *		the context doesn't allow sleeping. Typically the controller
  *		will implement a busy loop waiting for the data to flush out.
+ * @abort_data:	Called when a client relinquishes control of a chan.
+ *		This call may block too. The controller may do stuff
+ *		that need to sleep.
  * @startup:	Called when a client requests the chan. The controller
  *		could ask clients for additional parameters of communication
  *		to be provided via client's chan_data. This call may
@@ -50,6 +53,7 @@ struct mbox_chan;
 struct mbox_chan_ops {
 	int (*send_data)(struct mbox_chan *chan, void *data);
 	int (*flush)(struct mbox_chan *chan, unsigned long timeout);
+	void (*abort_data)(struct mbox_chan *chan);
 	int (*startup)(struct mbox_chan *chan);
 	void (*shutdown)(struct mbox_chan *chan);
 	bool (*last_tx_done)(struct mbox_chan *chan);
-- 
2.18.1
