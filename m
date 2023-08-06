Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7100EB64DD
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Aug 2023 03:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=whpOHeAcCcjjqwU/OvON8VF060T2SRGxq+DJKQd8260=; b=afOpDNouwinWDARreQNI5munke
	ymFADNG1Ashrfk9dK0yyQsDJDZXvMDZVRuVNBhIiZ690tmAQUQizp9FO3KqCNIN3SZN6iUTA5fzAA
	wPfzvj/4n+vL7MVQZzF/TmRStjFCyeyPApB15guxAvpaW12ugGU37CxYx1TguLjBBjuFjReXLxCZ4
	GdD4Nqp5LZK0yFZrJYEiqwKFRupIv27tO+i4yDEQY+CI4w4M2YzsZJicpRKwtm2gYjqMk6ToT8DWM
	uUQa+Te1zWHk9c4bMpdTjkHQGCs2TFBWzXNQSvX+WiAOes6fdPGadoK45Nn16IdagZM2uFn6Qmpaz
	RbCVJQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSUOp-00EpFv-1d;
	Sun, 06 Aug 2023 03:25:47 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSUOk-00EpEs-0S;
	Sun, 06 Aug 2023 03:25:45 +0000
Received: from ubuntu.localdomain (unknown [218.12.19.97])
	by mail-app4 (Coremail) with SMTP id cS_KCgCnrBSYEs9kXASjCg--.63926S2;
	Sun, 06 Aug 2023 11:25:21 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] dmaengine: mediatek: Fix deadlock caused by synchronize_irq()
Date: Sun,  6 Aug 2023 11:25:11 +0800
Message-Id: <20230806032511.45263-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgCnrBSYEs9kXASjCg--.63926S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zryxuw4rJF4ktw1UtrWfGrg_yoW8GFy3pF
	WDJa45CFWqyr1Dua1UCr42qFWrC3WfGrW7Gr4fXw43Ca4rJryYvr1FyayavF4jqr9rKa97
	Kr4UtrWrCF4jyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUym14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwQSAWTNp-sHcgAhs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_202542_332421_1CD255C1 
X-CRM114-Status: UNSURE (   9.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The synchronize_irq(c->irq) will not return until the IRQ handler
mtk_uart_apdma_irq_handler() is completed. If the synchronize_irq()
holds a spin_lock and waits the IRQ handler to complete, but the
IRQ handler also needs the same spin_lock. The deadlock will happen.
The process is shown below:

          cpu0                        cpu1
mtk_uart_apdma_device_pause() | mtk_uart_apdma_irq_handler()
  spin_lock_irqsave()         |
                              |   spin_lock_irqsave()
  //hold the lock to wait     |
  synchronize_irq()           |

This patch reorders the synchronize_irq(c->irq) outside the spin_lock
in order to mitigate the bug.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index a1517ef1f4a..0acf6a92a4a 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -451,9 +451,8 @@ static int mtk_uart_apdma_device_pause(struct dma_chan *chan)
 	mtk_uart_apdma_write(c, VFF_EN, VFF_EN_CLR_B);
 	mtk_uart_apdma_write(c, VFF_INT_EN, VFF_INT_EN_CLR_B);
 
-	synchronize_irq(c->irq);
-
 	spin_unlock_irqrestore(&c->vc.lock, flags);
+	synchronize_irq(c->irq);
 
 	return 0;
 }
-- 
2.17.1


