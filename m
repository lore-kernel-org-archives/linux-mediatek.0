Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674C8C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jan 2022 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5XdfZLSYnCjxPpKPiLNa+33fhLENdSZTvbRohFkx6ZQ=; b=FB3mFKnysWfja4
	8luaQDFOdcMliUy4+zi+KKc4XcgRtSM5vVQ/8AETJfQh55U1e7Jx3pYejtz2AuDh5RK1N31wK9t5/
	S0w+D5Wn4CFdXY6wRsIB5Widj1c+s7Dm6syuIemYGpPwGJxmuUT25/0dAxeMCRbHRCyjDZU2q9hIu
	KlheDD4ndtox1RN+RbUT6K0ybQO7Hh5/2fsy0HlqkNtPNqA9OPS5Mit3o2zW9ZH5HoGgJWlywMlXE
	Y9iBXniEm4q/I4YV3iGMte8HjxegdCZ1zxLbRu1czXGy5ZWDlQVjsJ8qVVUmCXJjOWjVCrkuhh3lo
	QtPKHip9VBDZylWHp3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8gI9-00Aww2-0Z; Sat, 15 Jan 2022 10:28:13 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8gI6-00AwvM-SZ
 for linux-mediatek@lists.infradead.org; Sat, 15 Jan 2022 10:28:12 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 1A745101C2F; Sat, 15 Jan 2022 10:28:08 +0000 (UTC)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] media: mtk-cir: simplify code
Date: Sat, 15 Jan 2022 10:28:08 +0000
Message-Id: <20220115102808.251064-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_022811_086364_0E17042F 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

Re-write without unnecessary shifts.

Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 255f8a116b59..9d83233195e6 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -203,10 +203,10 @@ static inline void mtk_irq_enable(struct mtk_ir *ir, u32 mask)
 
 static irqreturn_t mtk_ir_irq(int irqno, void *dev_id)
 {
+	struct ir_raw_event rawir = {};
 	struct mtk_ir *ir = dev_id;
-	u8  wid = 0;
 	u32 i, j, val;
-	struct ir_raw_event rawir = {};
+	u8 wid;
 
 	/*
 	 * Each pulse and space is encoded as a single byte, each byte
@@ -228,7 +228,8 @@ static irqreturn_t mtk_ir_irq(int irqno, void *dev_id)
 		dev_dbg(ir->dev, "@reg%d=0x%08x\n", i, val);
 
 		for (j = 0 ; j < 4 ; j++) {
-			wid = (val & (MTK_WIDTH_MASK << j * 8)) >> j * 8;
+			wid = val & MTK_WIDTH_MASK;
+			val <<= 8;
 			rawir.pulse = !rawir.pulse;
 			rawir.duration = wid * (MTK_IR_SAMPLE + 1);
 			ir_raw_event_store_with_filter(ir->rc, &rawir);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
