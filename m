Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083D1C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 05:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F282061075
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 05:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F282061075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pku.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a6ogQxuSD/wlcM7heJK19BmawHqn6RT3QLIfBUthOQE=; b=hVkJyLgPxj4XIt
	X/e51NEdTUtIwn+xzyirEQ8As74xAfODPtgiju1J+3EbF3zfxzpPgUG0C9B7i0yq1ieh9Li/v4tqT
	mIBzNiPEOyyf5CwyerRkV7mbGwJi1eNtZa24iF9Vd6C/Hof+F/ByDx8XEx8Lf18R4r/XL7QP2uiEq
	H3nz58szx8xvBF4pe3Ec5dolzto6xmh9uM5UyfkhGE/FQJOj3CTesnRTwe348ldLVcvr62sAKFQbo
	H2oPGjB4pK1Q48zq6TwBYX8HqDqxs68orBEdG0+mwL7WUqMmj4tMV2wfXFmh+/cIgU6W6ddZNXsOT
	tbCiIisnNuZrUVtvX3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mllib-00CDHl-Va; Sat, 13 Nov 2021 05:36:49 +0000
Received: from mx18.pku.edu.cn ([162.105.129.181] helo=pku.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlliY-00CDHP-Q2; Sat, 13 Nov 2021 05:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id:MIME-Version:Content-Transfer-Encoding; bh=096tswenyr
 QQBYIjDZKBv67C4CFDUeDfon8rxV1QVpU=; b=nSSKdP9mZJ8HaCFJAhLO6du6V8
 1r0cSqyrnMBoc4swmIZiRy9OogpThq1Pbz3/bYs6DybMEl1u8kdmuX1SMFdKNYg5
 U7y3C9alW+V2PyrI5RN4K+t5xpHkyjAd6n4QHzAE3npODSkgXyRfbkobqUqOisN8
 oh39PSd6ZBIQfjn1E=
Received: from junqi-virtual-machine (unknown [10.2.70.49])
 by front01 (Coremail) with SMTP id 5oFpogBXX4_xTI9hNJcCAw--.34738S2;
 Sat, 13 Nov 2021 13:28:17 +0800 (CST)
From: Liu Junqi <liujunqi@pku.edu.cn>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Liu Junqi <liujunqi@pku.edu.cn>
Subject: [PATCH] Staging: mt7621-dma: reindent to avoid '(' at the end of line
Date: Sat, 13 Nov 2021 13:28:15 +0800
Message-Id: <20211113052815.358793-1-liujunqi@pku.edu.cn>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CM-TRANSID: 5oFpogBXX4_xTI9hNJcCAw--.34738S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF45Xw1rXrWxZrWUAryxZrb_yoWDAFc_Cr
 4qgr97WFyDArn5tr1xtFWxJ3sayFWkXFn5Ww17KFZ5Ar1DAFW3ZF1DCFy2yryv9ay8ZFZr
 ur4jvry0kr1fujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb4xFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_
 JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
 w28IcVCjz48v1sIEY20_Kr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUU
 UU=
X-CM-SenderInfo: arzqiiirtqlmo6sn3hxhgxhubq/1tbiAwECD1Py7tTfDgARsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_213647_222091_89E39D67 
X-CRM114-Status: UNSURE (   8.12  )
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

Fixed a coding style issue.

Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
---
 drivers/staging/mt7621-dma/hsdma-mt7621.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
index 1424d01d434b..282fc807d0de 100644
--- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
+++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
@@ -455,9 +455,9 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
 	spin_unlock_bh(&chan->vchan.lock);
 }
 
-static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
-		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
-		size_t len, unsigned long flags)
+static struct dma_async_tx_descriptor
+*mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
+			   size_t len, unsigned long flags)
 {
 	struct mtk_hsdma_chan *chan = to_mtk_hsdma_chan(c);
 	struct mtk_hsdma_desc *desc;
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
