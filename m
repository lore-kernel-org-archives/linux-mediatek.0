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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE225C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:31:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5851F20758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d6karP/0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inUl3Adk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5851F20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8FPkiXZLGlZ2mspJcvCCEH4UgCkiQrc9KTFYdG3yrY=; b=d6karP/0csMrxFAVmRVfK+Q6iE
	M4ID4nCXoHvFoY1rk4tfDCFsOlpyoVEKexAyDlX0K1XHDMG54BNMLrGrW+lpO84GN+u3cdqAbow/U
	rkZMyyV9L5batIjU5N3OABeS2Z4pIhWKZR8ScYiY/eUPT3U8BxdQqeYhQJ8kg/4DHY/MYi7BnvN7m
	OpjOzwRzxnThefk3/DA2KxJIjKeC+6P9/FzeV0DqG0ZWMx/HOWbkZjhv6SqD3YJ2J0MTwSR4QzTBt
	qK1VUb51/4EGPTzsVBalfkTQcav2CZcRR3sM9SCnLeczNY9Ca+nLF7JkidE/hfeFc7oXuL7SN/6cl
	f6+DSGbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aYQ-0005dF-RJ; Mon, 17 Aug 2020 08:31:42 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aNB-00084l-St; Mon, 17 Aug 2020 08:20:12 +0000
Received: by mail-pf1-x443.google.com with SMTP id d22so7862890pfn.5;
 Mon, 17 Aug 2020 01:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Jvxuy1l/tmoRx6ToQ9/CnHSagxvVLNtLIuN2aBXKG9w=;
 b=inUl3AdkFX0a6b6fmByIUWU8g/ZSMLhnjh7NyMEcA3Bu6SPtvSONgdI8zsNQTCHqbz
 34awZ74cNxWmqvN4Y52URMl2mQeyPjNOOadpCzm8PGhUDavMOhJ7ETOj+hBQGQ4BneQl
 7mNFK5k0ae85WFZcEufTK6g9mAuO8PDMAnJgR8VsaF7ApTpDDlJsX3Y/+Vc8pe0OBSBi
 kGteehuwn5DYsN3eunz8qI3beF+ivdCN8BMk+M8JgZT562JxoDbfc9np/bM2LF24qXdv
 p3Lp6f3CUT7KIhVgYvOlxNIcw1VqGF9CIIHbF9bIPC6GlwQS7RDDoeUItSSFAI9tgz8C
 RAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Jvxuy1l/tmoRx6ToQ9/CnHSagxvVLNtLIuN2aBXKG9w=;
 b=Z/pN4sTIqPGWDnHUp+87/wPKPef4jpAC/LhntFNTJk45Re78OwZ9kTizYEDJHVlR2s
 a+1wARwAXeTt2SjS93gwNjCbpi6pYQI2L4zR/OghSVB5s7Ln0CFu+pc9VwSmfiR2jur6
 3pmkSEhv9gSD/t80ucoEdJD+MLLkpqy2wtMCDwf+5G4zE1tSLSOKn2xaaWZj/B/RM8rd
 XMHJErESrT60wfnjtqTVXQaZBD7kL4wRALUyBqEV+47AGFCryA1Qg2fcuWo/YrODUavW
 nr78tVPrgJWSSbZZAyY42PPsTDcVzEF31IidWePB+CKN/fDl2w/jxOFqnwkv5JPLXD0C
 k+wA==
X-Gm-Message-State: AOAM533grgxSxL9vNqdP8MEyA0s7vR2rIHKAu5RDTE+EQ2GV8Qj8wJV4
 BN44L5INtYS52l8yV8RvkbE=
X-Google-Smtp-Source: ABdhPJxUuhOcBt6I3wTvzg7ljG+imTIqho7hmggMvHrg6Cku+rR+cfGtQ1URO829eIH99aTCywLmyg==
X-Received: by 2002:a62:1614:: with SMTP id 20mr10662690pfw.258.1597652404010; 
 Mon, 17 Aug 2020 01:20:04 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:20:03 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 14/35] dma: mmp: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:47:05 +0530
Message-Id: <20200817081726.20213-15-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042010_460903_C686C4EC 
X-CRM114-Status: GOOD (  14.12  )
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
 drivers/dma/mmp_pdma.c | 6 +++---
 drivers/dma/mmp_tdma.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index f42f792db277..b84303be8edf 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -873,9 +873,9 @@ static void mmp_pdma_issue_pending(struct dma_chan *dchan)
  * Do call back
  * Start pending list
  */
-static void dma_do_tasklet(unsigned long data)
+static void dma_do_tasklet(struct tasklet_struct *t)
 {
-	struct mmp_pdma_chan *chan = (struct mmp_pdma_chan *)data;
+	struct mmp_pdma_chan *chan = from_tasklet(chan, t, tasklet);
 	struct mmp_pdma_desc_sw *desc, *_desc;
 	LIST_HEAD(chain_cleanup);
 	unsigned long flags;
@@ -993,7 +993,7 @@ static int mmp_pdma_chan_init(struct mmp_pdma_device *pdev, int idx, int irq)
 	spin_lock_init(&chan->desc_lock);
 	chan->dev = pdev->dev;
 	chan->chan.device = &pdev->device;
-	tasklet_init(&chan->tasklet, dma_do_tasklet, (unsigned long)chan);
+	tasklet_setup(&chan->tasklet, dma_do_tasklet);
 	INIT_LIST_HEAD(&chan->chain_pending);
 	INIT_LIST_HEAD(&chan->chain_running);
 
diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index 960c7c40aef7..a262e0eb4cc9 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -346,9 +346,9 @@ static irqreturn_t mmp_tdma_int_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
-static void dma_do_tasklet(unsigned long data)
+static void dma_do_tasklet(struct tasklet_struct *t)
 {
-	struct mmp_tdma_chan *tdmac = (struct mmp_tdma_chan *)data;
+	struct mmp_tdma_chan *tdmac = from_tasklet(tdmac, t, tasklet);
 
 	dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
 }
@@ -586,7 +586,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
 	tdmac->pool	   = pool;
 	tdmac->status = DMA_COMPLETE;
 	tdev->tdmac[tdmac->idx] = tdmac;
-	tasklet_init(&tdmac->tasklet, dma_do_tasklet, (unsigned long)tdmac);
+	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
 
 	/* add the channel to tdma_chan list */
 	list_add_tail(&tdmac->chan.device_node,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
