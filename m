Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F0CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 07:27:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A247F64F30
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 07:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A247F64F30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bukxFloQh2gCYWqzG9JVezbGSGQuI2SbBPuZHLvpWe0=; b=o5VQ5J3L/qEJrlYfKwxmiRkgEp
	VNsaDgFuXe/7/nOA478jvyNmfBppYYzUnUxHlB/XCBtrqSVVMEO38kWp6AzuyKUD/YeCCvzfGNLTF
	unTAN5AM96prNw45Qq7sYdEpgYMnILMwWu05QblJyWFX2bwsDKW6uD86S5X4nr0Pt3BzbrDNDgIKA
	z1TLANVAVFcr4SRzRS6Eks50JjHB4Rxe1xihE2Iv39IiOIyV/zN6BeKxlzo7Te1tk/DJNaQBPfd7L
	l+QqSWCtiL2c+r4QcPxkpIvhAnz8Nx/JV7YnqYxQiGTi/xVfWKSv7j6qyu5XtdArYE4fNCdkTk2X7
	UyBcOUPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMQaW-002fdm-Ae; Wed, 17 Mar 2021 07:27:28 +0000
Received: from m12-18.163.com ([220.181.12.18])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMQaJ-002fbb-JC; Wed, 17 Mar 2021 07:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Qtn8+
 btActA3yRVKwroBj6KrwpUMXfwBi44efCfGx7E=; b=AW7OmkXfKVD5lCEZK0jEk
 aUYV5AVWOBO5yWCYFbVQfGID6u6Wezs9wtBXZJ1zTdhvPPMBUY2fDXOiWZ3uhSLu
 U/2HiuI1dtfj0LzLPqLsynt8rHctVK7F2LoMMxr4Cj+YEvvC/GSxTPkkMK/aDUy9
 uhgdbJDdoJ0IYnB+NjEBCc=
Received: from COOL-20200911ZP.ccdomain.com (unknown [218.94.48.178])
 by smtp14 (Coremail) with SMTP id EsCowABXXgLBrlFgqQUIZQ--.44099S2;
 Wed, 17 Mar 2021 15:25:01 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 tangchunyou@yulong.com
Subject: [PATCH] the print is redundant because platform_get_irq()
Date: Wed, 17 Mar 2021 15:24:43 +0800
Message-Id: <20210317072443.286-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EsCowABXXgLBrlFgqQUIZQ--.44099S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyfXw43XryDWryfCFy7trb_yoW3CFX_Ca
 1kZrnruFWFvr98Zr1ayr13Ary2vFs09r40qF98ta4Svr9xCryUXr9F9rnIvF4kWa97ZFyD
 X3s5WFyF9rnIkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0RBTUUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiZQ1YUV8ZNQWSjAAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_072715_989178_51D9F548 
X-CRM114-Status: GOOD (  10.19  )
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

From: tangchunyou <tangchunyou@yulong.com>

already prints an error.

Signed-off-by: tangchunyou <tangchunyou@yulong.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index cb29b64..332a4df 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -208,10 +208,8 @@ static int mtk_cec_probe(struct platform_device *pdev)
 	}
 
 	cec->irq = platform_get_irq(pdev, 0);
-	if (cec->irq < 0) {
-		dev_err(dev, "Failed to get cec irq: %d\n", cec->irq);
+	if (cec->irq < 0)
 		return cec->irq;
-	}
 
 	ret = devm_request_threaded_irq(dev, cec->irq, NULL,
 					mtk_cec_htplg_isr_thread,
-- 
1.9.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
