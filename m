Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC090C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:36:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99BE420758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:36:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtLojf9A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqX/O6h8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99BE420758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtHCwpSE/Gn54+RtxcfHihEO4SgduGt0uYFEGTGg4FA=; b=rtLojf9AaOy1AZBzoXMm4laIIU
	SXlKqEa1fyLMlW55vkNnsx0RI47ncnZDD5tivJiFgNhGfH8FIafEFa9tp8rpvVnmMrvuj2Yr6ozNj
	KeLFcpnyyArRgqIqMNwktbc0tFNwkrDIp6XqtaXnfdEGaUc0OphXScMYbomiahPS148WvQKVNpuq+
	0y6RlWD7T8c3422EOqur2OpmNtwtKBB0orAZpG7/j9GRcdh1njDCVQmx00CNcHjvlGwVTJio7ggIk
	nBW32c5fCClP2LBlXrtoPZjHn+u4iFjywVdwkLNTcNLskaWk2nsMYG0C8vVO0Pf3fPcvNGCJLjBpb
	vAew4RRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7acl-00082E-5F; Mon, 17 Aug 2020 08:36:11 +0000
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aOX-0000Hq-7S; Mon, 17 Aug 2020 08:21:45 +0000
Received: by mail-pf1-f195.google.com with SMTP id m71so7874672pfd.1;
 Mon, 17 Aug 2020 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dvX6FlWRqibGpy5qHiY9CD/HZDa4GdoItaD6hrOhnJQ=;
 b=rqX/O6h8qAd/dpn+JctX6LgY5uudHkjGG9VkbS3cy03GAhbVo2lbpKtH9yM8eLV/RQ
 E11vvSqgQML8bl4nCCgMOlthyv5Mr/UGHYPY+DruP2yrfpAnN77AvSIZutoswYCQWzjv
 PR0QHfu1kIatmrl0v2HUdpUvZq2eEouj7FTMKrEK7b06anDW96TsSwQsbyASLjF9iz5T
 Az86MZWloCjWnB8VRhgNVFUmbvFs/XodWt9vkPZMuRx/BPwUf80emnpwsmAl/Mg4G/zN
 Uhob0gmb+pwKhovQtl+zK6hasDdGQ1+HFzr/J8BRhasUJlc/M02cHMvSH4Ev2rP9hdu/
 3CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dvX6FlWRqibGpy5qHiY9CD/HZDa4GdoItaD6hrOhnJQ=;
 b=fMQCq3FfeUbye4AJLv71VDi7j23Uq4eVRP22ZaHYSqqXae7d7EyuL9k0+kZfSBMv5H
 sxOipXWGxM37Xz4PX3IwXobtl+2kGmmIOWdsufSqGRpQ9p03CXZzLilMOgyGQ1cidfcI
 aMpvJSZpw/J3cAOcMQ7IAK764u/wzUiJgmm1SSnhEDtWr/lKWi5ZWGRp437ZN/qxkfQN
 0sjmjRhCIhmHHOXwbP/wFKNBqbbUrTo+0xjGSRGoxbnVMm4MhP91HAWSTYZT9RXeFKUM
 dUlgBckBUeOP7X30fZq1o0KZe5HtbvAxzFVy4wb/nLFtm7vPR7ncwhb4KecW0Mlzg1/N
 eFtw==
X-Gm-Message-State: AOAM53393/34I7uVHSXDz+fBNyFc1A1d/QN6WOcH6KYdsGN3bnggVa/l
 ZBgR5PUFw1kxAGlKrQTnEwg=
X-Google-Smtp-Source: ABdhPJyzYdcL9n1eXaLOXLnH3937UeGl4OMGwZ1XGWANR3WtM8FkSL68n8dAz52LrCPevc3ZARv1fA==
X-Received: by 2002:a63:ed07:: with SMTP id d7mr8900878pgi.414.1597652485719; 
 Mon, 17 Aug 2020 01:21:25 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:21:25 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 22/35] dma: qcom: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:47:13 +0530
Message-Id: <20200817081726.20213-23-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042129_480483_5A58417D 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: keescook@chromium.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Allen Pais <allen.lkml@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, bpf@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/bam_dma.c  | 6 +++---
 drivers/dma/qcom/hidma.c    | 6 +++---
 drivers/dma/qcom/hidma_ll.c | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 5a08dd0d3388..8ba7a8f089c8 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1075,9 +1075,9 @@ static void bam_start_dma(struct bam_chan *bchan)
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(unsigned long data)
+static void dma_tasklet(struct tasklet_struct *t)
 {
-	struct bam_device *bdev = (struct bam_device *)data;
+	struct bam_device *bdev = from_tasklet(bdev, t, task);
 	struct bam_chan *bchan;
 	unsigned long flags;
 	unsigned int i;
@@ -1293,7 +1293,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_init(&bdev->task, dma_tasklet, (unsigned long)bdev);
+	tasklet_setup(&bdev->task, dma_tasklet);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 0a6d3ea08c78..6c0f9eb8ecc6 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -224,9 +224,9 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
 	return 0;
 }
 
-static void hidma_issue_task(unsigned long arg)
+static void hidma_issue_task(struct tasklet_struct *t)
 {
-	struct hidma_dev *dmadev = (struct hidma_dev *)arg;
+	struct hidma_dev *dmadev = from_tasklet(dmadev, t, task);
 
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	hidma_ll_start(dmadev->lldev);
@@ -885,7 +885,7 @@ static int hidma_probe(struct platform_device *pdev)
 		goto uninit;
 
 	dmadev->irq = chirq;
-	tasklet_init(&dmadev->task, hidma_issue_task, (unsigned long)dmadev);
+	tasklet_setup(&dmadev->task, hidma_issue_task);
 	hidma_debug_init(dmadev);
 	hidma_sysfs_init(dmadev);
 	dev_info(&pdev->dev, "HI-DMA engine driver registration complete\n");
diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
index bb4471e84e48..53244e0e34a3 100644
--- a/drivers/dma/qcom/hidma_ll.c
+++ b/drivers/dma/qcom/hidma_ll.c
@@ -173,9 +173,9 @@ int hidma_ll_request(struct hidma_lldev *lldev, u32 sig, const char *dev_name,
 /*
  * Multiple TREs may be queued and waiting in the pending queue.
  */
-static void hidma_ll_tre_complete(unsigned long arg)
+static void hidma_ll_tre_complete(struct tasklet_struct *t)
 {
-	struct hidma_lldev *lldev = (struct hidma_lldev *)arg;
+	struct hidma_lldev *lldev = from_tasklet(lldev, t, task);
 	struct hidma_tre *tre;
 
 	while (kfifo_out(&lldev->handoff_fifo, &tre, 1)) {
@@ -792,7 +792,7 @@ struct hidma_lldev *hidma_ll_init(struct device *dev, u32 nr_tres,
 		return NULL;
 
 	spin_lock_init(&lldev->lock);
-	tasklet_init(&lldev->task, hidma_ll_tre_complete, (unsigned long)lldev);
+	tasklet_setup(&lldev->task, hidma_ll_tre_complete);
 	lldev->initialized = 1;
 	writel(ENABLE_IRQS, lldev->evca + HIDMA_EVCA_IRQ_EN_REG);
 	return lldev;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
