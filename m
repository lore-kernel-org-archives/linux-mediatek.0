Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B168BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 01:48:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E78F61265
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 01:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E78F61265
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nGiRpEQaSSyuot9ov/z3f+z8rqaCs5lOZ+en36P4+4o=; b=1/ryhhcB0QlGFg
	pF68NxuiOPZwhOfj+Kjf4AWjh3zBT6XYi4xz/Uwr0Qs9MjwRziGvDy30HJKsWIkh0msrYaxhN0vzE
	ClDfeihoUYLTYBtw0wIsFt/ciElSFoM7nyKwo49pK6qSRd4vVw0v7dB7OqKbyqs8TCxncZ62n85VQ
	YPHy539IT8PqLdbK9dQt3tYR+EdcfmpBTKGapDsLlJKkjypE4y4Qt6RWR2iZi2toYJDX3n+ojMlk3
	za70Jja5l+WGpPyyH2j31b7hBcQUe56DyH+l08JOKUr+b2r1+UUBdvrJPW5zbOh+ZV6SDENCGE9G3
	k2Lnr23+2pfaTMVlDEww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmnZv-0000Y5-6E; Tue, 16 Nov 2021 01:48:07 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmnZr-0000WO-NF
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 01:48:06 +0000
Received: from localhost.localdomain (unknown [124.16.141.244])
 by APP-01 (Coremail) with SMTP id qwCowAAXHQnDDZNhY8amBw--.13846S2;
 Tue, 16 Nov 2021 09:47:48 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: rick.chang@mediatek.com, bin.liu@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk-jpeg: Remove unnecessary print function dev_err()
Date: Tue, 16 Nov 2021 01:47:26 +0000
Message-Id: <20211116014726.1452-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAXHQnDDZNhY8amBw--.13846S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWrWF45tw4ktFWrArWrZrb_yoWfurbEg3
 409FyxWr48GwnYvr1Iy3W3ZryxtrZ8CF4rJ3Z3KFWagFy5C3WUJry7AFs8uF4xZ3WIvFyU
 ArW3urW7CrnxCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbcxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVWkMxAI
 w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
 4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
 rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
 CI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zc_3UUUUU==
X-Originating-IP: [124.16.141.244]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQcHA102atLl6AABsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_174804_202047_F4E2217D 
X-CRM114-Status: UNSURE (   8.69  )
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

The print function dev_err() is redundant because
platform_get_irq() already prints an error.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index af994b9913a6..f332beb06d51 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1361,10 +1361,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	}
 
 	jpeg_irq = platform_get_irq(pdev, 0);
-	if (jpeg_irq < 0) {
-		dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n", jpeg_irq);
+	if (jpeg_irq < 0)
 		return jpeg_irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, jpeg_irq,
 			       jpeg->variant->irq_handler, 0, pdev->name, jpeg);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
