From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] mailbox: add MODULE_LICENSE() for mtk-cmdq-mailbox.c
Date: Tue, 7 Aug 2018 09:42:15 -0700
Message-ID: <99f4666b-95fc-a1dd-04d3-3d1d803990fb@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
Cc: Jassi Brar <jassisinghbrar@gmail.com>, CK Hu <ck.hu@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix missing MODULE_LICENSE() in mtk-cmdq-mailbox.c:

WARNING: modpost: missing MODULE_LICENSE() in drivers/mailbox/mtk-cmdq-mailbox.o

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: <linux-mediatek@lists.infradead.org>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20180807.orig/drivers/mailbox/mtk-cmdq-mailbox.c
+++ linux-next-20180807/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -567,3 +567,5 @@ static void __exit cmdq_drv_exit(void)
 
 subsys_initcall(cmdq_drv_init);
 module_exit(cmdq_drv_exit);
+
+MODULE_LICENSE("GPL v2");
