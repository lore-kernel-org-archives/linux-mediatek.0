From: Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH] mailbox: mediatek: Add check for possible failure of kzalloc
Date: Tue, 21 Aug 2018 18:22:44 +0800
Message-ID: <1534846964-13224-1-git-send-email-houlong.wei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Monica Wang <monica.wang@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>, ginny.chen@mediatek.com, enzhu.wang@mediatek.com, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-mediatek@lists.infradead.org

The patch 623a6143a845("mailbox: mediatek: Add Mediatek CMDQ driver")
introduce the following static checker warning:
  drivers/mailbox/mtk-cmdq-mailbox.c:366 cmdq_mbox_send_data()
  error: potential null dereference 'task'.  (kzalloc returns null)

Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Houlong Wei <houlong.wei@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index aec46d5..f7cc29c 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -363,6 +363,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	WARN_ON(cmdq->suspended);
 
 	task = kzalloc(sizeof(*task), GFP_ATOMIC);
+	if (!task)
+		return -ENOMEM;
+
 	task->cmdq = cmdq;
 	INIT_LIST_HEAD(&task->list_entry);
 	task->pa_base = pkt->pa_base;
-- 
1.7.9.5
