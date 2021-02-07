Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C36BC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 09:23:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E17D064E43
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 09:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E17D064E43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fKIBAIaEqqP48sWbnhoUV9JZ2FkrWw3sCd3gN0xmA3U=; b=xKn5DGw2J3nIaFeIEVgEYfDPwX
	tVugBW1Y+5mCPCBrpirgd5CfMfX128ztttC3xyCglhbSQ8kt1clUOPb2xKyi6B6AeyK9GNrL+z+Z5
	R/Mqv7qDolxyG3XDZpCRpXqTFdafVhAWoM4HRJh3ZVcFISPmtJ/GZWAWzUskmccXSd4f5ulZsg1zG
	Ms6VllooxG9dfcCWeQLO0kTv1EeBDg7jLuvTLTlDuGWUY896zkgxC3Fk7uNnqa1Dc94eu01IN04B3
	vQsm1UWw2KJWDHx4jvKtdWyKfUoDxn+ZsIDsX0akExJ5dDDAhleCeZQ2ZOWfw8/+dfC2NyoMlXBl1
	KgPwzhqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8gIF-0004Sl-Ka; Sun, 07 Feb 2021 09:23:47 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8gIA-0004Qp-Tu; Sun, 07 Feb 2021 09:23:44 +0000
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf_KRsR9gYrgHAA--.10006S2; 
 Sun, 07 Feb 2021 17:23:29 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] staging: fix ignoring return value warning
Date: Sun,  7 Feb 2021 17:23:28 +0800
Message-Id: <1612689808-30985-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxf_KRsR9gYrgHAA--.10006S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4kKw4DZw4DKw1DGFyfZwb_yoW8CF4fpa
 yxAa4Ykry2yF4Uu3yUAF1xZ3Z8ua4xK3y8Cayqyw1F9ryrJa4Svry5tFyUKr4rJr93KF4r
 tFW7ZF4UZay8WrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
 uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
 1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
 0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjwSdDUUUU
 U==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_042344_040126_536DF2CC 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devel@driverdev.osuosl.org, tangyouling@loongson.cn,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the below ignoring return value warning for device_reset.

drivers/staging/mt7621-dma/mtk-hsdma.c:685:2: warning: ignoring return value
of function declared with 'warn_unused_result' attribute [-Wunused-result]
        device_reset(&pdev->dev);
        ^~~~~~~~~~~~ ~~~~~~~~~~
drivers/staging/ralink-gdma/ralink-gdma.c:836:2: warning: ignoring return value
of function declared with 'warn_unused_result' attribute [-Wunused-result]
        device_reset(&pdev->dev);
        ^~~~~~~~~~~~ ~~~~~~~~~~

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 drivers/staging/mt7621-dma/mtk-hsdma.c    | 6 +++++-
 drivers/staging/ralink-gdma/ralink-gdma.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
index bc4bb43..d4ffa52 100644
--- a/drivers/staging/mt7621-dma/mtk-hsdma.c
+++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
@@ -682,7 +682,11 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_reset(&pdev->dev);
+	ret = device_reset(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to reset device\n");
+		return ret;
+	}
 
 	dd = &hsdma->ddev;
 	dma_cap_set(DMA_MEMCPY, dd->cap_mask);
diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
index 655df31..df99c47 100644
--- a/drivers/staging/ralink-gdma/ralink-gdma.c
+++ b/drivers/staging/ralink-gdma/ralink-gdma.c
@@ -833,7 +833,11 @@ static int gdma_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_reset(&pdev->dev);
+	ret = device_reset(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to reset device\n");
+		return ret;
+	}
 
 	dd = &dma_dev->ddev;
 	dma_cap_set(DMA_MEMCPY, dd->cap_mask);
-- 
2.1.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
