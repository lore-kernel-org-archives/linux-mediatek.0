Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39250C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pZCDGfTR3+4ZJoneBL3SjvXhkNpE7Ub6z4I5ZgWy6rg=; b=pGYq6LgRou3LWk
	WW3V7M7GC+BsDUI+hU/i90LGFos5N8czVZ14sswcrMYKv9s3PJxRPv1LOvz/FKeuNT0kutvIRtXlQ
	9uoeIw4bMNPbFLvvjbQIMWYbXfF2IcR298E1MJZ4+AalEsNc0VpuWmAnavXUR80CQZrZPp/fngREA
	2K+ok/pZ65moFa2D65fIcJAj5lk3WUz/Tsa5L/SP+xIjpTfGcnQkUfV5t/WfxFol3ZpJCHklxaOXG
	SZYnLebMCiGnFT/QBiwt0NByzBeWTdWz2i4XGEQtT0Fd7ucE9dBYO9rreRbmfICNddiHuQekrxR2i
	bDsgYow2ETT+ergQss/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8O7X-009U30-KG; Fri, 14 Jan 2022 15:04:03 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8O7T-009TyM-U4
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 15:04:01 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 7BC37101C2F; Fri, 14 Jan 2022 15:03:53 +0000 (UTC)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] media: mtk-cir: reduce message end to fix nec repeats
Date: Fri, 14 Jan 2022 15:03:52 +0000
Message-Id: <20220114150353.195192-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_070400_181197_631BEB0D 
X-CRM114-Status: GOOD (  12.06  )
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

The ir receiver generates an interrupt with the IR data, once a space of
at least ok_count is has been seen. Currently this is about 110ms; when
holding down a button on a nec remote, no such space is generated until
a button is released. This means nothing happens until you release the
button.

The sample rate is fixed at 46us, so the maximum space that can be
encoded is about 12ms. So, the set ok_count above that at 23ms.

Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 840e7aec5c21..746d43fdc17a 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -24,7 +24,8 @@
  * Register to setting ok count whose unit based on hardware sampling period
  * indicating IR receiving completion and then making IRQ fires
  */
-#define MTK_OK_COUNT(x)		  (((x) & GENMASK(23, 16)) << 16)
+#define MTK_OK_COUNT_MASK	  (GENMASK(22, 16))
+#define MTK_OK_COUNT(x)		  ((x) << 16)
 
 /* Bit to enable IR hardware function */
 #define MTK_IR_EN		  BIT(0)
@@ -268,7 +269,7 @@ static irqreturn_t mtk_ir_irq(int irqno, void *dev_id)
 static const struct mtk_ir_data mt7623_data = {
 	.regs = mt7623_regs,
 	.fields = mt7623_fields,
-	.ok_count = 0xf,
+	.ok_count = 3,
 	.hw_period = 0xff,
 	.div	= 4,
 };
@@ -276,7 +277,7 @@ static const struct mtk_ir_data mt7623_data = {
 static const struct mtk_ir_data mt7622_data = {
 	.regs = mt7622_regs,
 	.fields = mt7622_fields,
-	.ok_count = 0xf,
+	.ok_count = 3,
 	.hw_period = 0xffff,
 	.div	= 32,
 };
@@ -400,7 +401,7 @@ static int mtk_ir_probe(struct platform_device *pdev)
 	mtk_w32_mask(ir, MTK_DG_CNT(1), MTK_DG_CNT_MASK, MTK_IRTHD);
 
 	/* Enable IR and PWM */
-	val = mtk_r32(ir, MTK_CONFIG_HIGH_REG);
+	val = mtk_r32(ir, MTK_CONFIG_HIGH_REG) & ~MTK_OK_COUNT_MASK;
 	val |= MTK_OK_COUNT(ir->data->ok_count) |  MTK_PWM_EN | MTK_IR_EN;
 	mtk_w32(ir, val, MTK_CONFIG_HIGH_REG);
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
