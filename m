Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2029C48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 06:31:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 685E661040
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 06:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 685E661040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FyqR83e7ULyYuTa29ay8KApShMD3a543Zp8Hi/p1wOw=; b=FvfKEq8lNrJjTq
	Z3yDFcnGvQO91CjKH9lpiKQsHo8Xxg4ybMlEdpH7/2C+9x21/pEUMgc/lHB3P0inQdCPFIKnJquie
	Ky2OoczZqa2OLyrbYgP34h6YbpHlN4UVgCM2cCQaS8k5GBhlw4JuZ0Tubi+ct//0qdGE4ZsXhTwqJ
	PYgZ2rFLVEnVabjT9Tb80L1AK3y4RXHaDABucRMv/isZ9FBPe7eLRElVZBYTCf0TfDObSaeJg/7qh
	vW9cEoc6L8AIzGuFZUmR9QRBFHDgLfA5AD3fTy0tilzsjV9iKgUU967gU2+NsFwAv0mwtOAsp/NmB
	b/+QgpquZCRpTwCq4wyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvDSd-002K1Q-32; Mon, 21 Jun 2021 06:31:07 +0000
Received: from m12-17.163.com ([220.181.12.17])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvDSQ-002JyD-Oe; Mon, 21 Jun 2021 06:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=u6hdI
 srs/V2lafii/maxw5n7uLgulGr69u1vMtVbjTg=; b=Bn9hr3KKSw9migEdJLagL
 DCoyTSpINFl5H6Y4cRzHxe4TQGXDepwx2emDbT8u1R9HR8WwdRV3m5eykp3IzRP1
 oJ1lFtv62NsJuuX1uHrXJTLB0UEwQb6SXfV9mh1b4kT0QRt0/A+FcKk0dBttFOW0
 FAIrWyAd07uLG0iGNlsqqg=
Received: from yangjunlin.ccdomain.com (unknown [218.17.89.92])
 by smtp13 (Coremail) with SMTP id EcCowACXbGQBMtBgMeQF8w--.52581S2;
 Mon, 21 Jun 2021 14:30:26 +0800 (CST)
From: angkery <angkery@163.com>
To: sean.wang@mediatek.com, vkoul@kernel.org, matthias.bgg@gmail.com,
 long.cheng@mediatek.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Junlin Yang <yangjunlin@yulong.com>
Subject: [PATCH v1] dmaengine: mediatek: Return the correct errno code
Date: Mon, 21 Jun 2021 14:20:48 +0800
Message-Id: <20210621062048.1935-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: EcCowACXbGQBMtBgMeQF8w--.52581S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1kXryxXFyxJr1kGFW5Awb_yoWfWrc_ua
 yvvrZ7WF1DAwnayr1rGr1UuryayFWkuF1fWF45Kr13ZrW5CrsrCrWq9r9avw43X3Z2vFn7
 GF1UZrn3uFsxCjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeveHDUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/xtbBFAK4I1aD-8Sw1QAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_233055_260639_91F77768 
X-CRM114-Status: GOOD (  11.90  )
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

From: Junlin Yang <yangjunlin@yulong.com>

When devm_kzalloc failed, should return ENOMEM rather than ENODEV.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
---
Changes in v1:
Add fixes tags.

 drivers/dma/mediatek/mtk-uart-apdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index 375e7e6..a4cb30f 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -529,7 +529,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	for (i = 0; i < mtkd->dma_requests; i++) {
 		c = devm_kzalloc(mtkd->ddev.dev, sizeof(*c), GFP_KERNEL);
 		if (!c) {
-			rc = -ENODEV;
+			rc = -ENOMEM;
 			goto err_no_dma;
 		}
 
-- 
1.9.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
