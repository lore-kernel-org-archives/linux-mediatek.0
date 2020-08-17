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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F8AC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:40:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 403F12072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ToBMesSL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f59rLF9L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 403F12072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9Oxa/sD3ekpvcxUg/m1jEmHxfjNT6MSXFNypeA8be4=; b=ToBMesSL8qnnKclVU+6Vg6W8qb
	oXfiUICjKssCITVy4xZzroKmbrJiwWzSZe/sYM17A+Wxju2MsvhxtxTcHO/03HCXtauCLGfGdvWfd
	toK2zvIiTAxxhOnEBGr35tfhbRzn2diyqOZovE70Bm9RY9pMpnpr2flG6/Rdy44qWfnBzVlTyNkHM
	6GLyVdxESpmvzGPX3ahPxALopyEOjLJTQVjFTAREnFkPTe+lIIE1HcoGDgTB9ydMhFLPIpQ/3eVC+
	WAz9BNaIxgaRa8SXD1NCvv9kPuXGr+KnIkWstFax8/OdsKpwEEz+hY+BUp+l6eG53HnQTCYPZi8V7
	3bYEQI4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7agh-0001aQ-EV; Mon, 17 Aug 2020 08:40:15 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aQ4-0000yw-LO; Mon, 17 Aug 2020 08:23:12 +0000
Received: by mail-pl1-x643.google.com with SMTP id r4so7137869pls.2;
 Mon, 17 Aug 2020 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7u/2cva1X+qYdcICcawfSm0XBYmeJIpXUg7S7BH2D4c=;
 b=f59rLF9LjolBojqbq/4JZGmfTXfEB+L96JJR9sacgtiSRQCZmed2VTEnSkjAUt3iLB
 w/CU1vEzDqLYh6XIg2WSNADktWvdNBKn2HeP4voucqqQo6X5tBUAG1GWk0uHcS9Sk944
 eppkXL7ASmU5QX23DnDbEarDozMgPpH5h5Pvonb551x/R0/i4389N8qyjrdQo1t5X9b/
 02CdnExPI4JZqLrGE5kfU9ufVBAByyKy5qyOu15io4OADxiiqJzyEza0y6eh4US5yfco
 QebJgojxUVzKtCua81hbXP/fyxvhvIGuJgcJgiUDqtLgzR2onZ7kvjwSlqeB2Gv2zetV
 s/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7u/2cva1X+qYdcICcawfSm0XBYmeJIpXUg7S7BH2D4c=;
 b=rAjftuYFyl91+x/S93nDynjha7vtFgpKzW4HK/YIdA3N5iS6zPgpIQ9EgZUtBNFsfg
 jxX5bewuVA/YQ6lZjqa5bzSPn+WgzckXH1wO/GoQ+9HmjAfY3YsXdfHnq+iqB4OiqhIx
 fQCQdfEt/1DOzYf3n9bf18JU8Xn32c8lfm5IQo/agtQMAJqVO278+tf2UAGhxcHI0TKZ
 pSR/KHuZeByBHc7ZIHPJrXeDzD5Fj8uN3w97ftJmyKdeKuNN9OyTfRvW0UZPAKndZf54
 hJY3IbYhm7iCPTy0yLXNcIkzbRLeAOJnrpCqM6FCqBhRp09tNCRJCUuan6x6RYd5ZGyO
 DOfQ==
X-Gm-Message-State: AOAM5333FDH/f91ciIcVMr+wB0KrkIYvZfeHPJCogWyFbj4BoVuA+nse
 gbrw6/veOJgniU0sfJCjbzU=
X-Google-Smtp-Source: ABdhPJwV6kPES4OsAR2RefOiq3Oe3pIFKfQA1x69JuKv8ue6o8uHXJFpGG1kbvkdTWOg1UoHvjLCpQ==
X-Received: by 2002:a17:902:7c94:: with SMTP id
 y20mr3269952pll.309.1597652580480; 
 Mon, 17 Aug 2020 01:23:00 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:23:00 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 32/35] dma: xilinx: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:23 +0530
Message-Id: <20200817081726.20213-33-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042305_011815_508BD5D0 
X-CRM114-Status: GOOD (  15.01  )
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
 drivers/dma/xilinx/xilinx_dma.c | 7 +++----
 drivers/dma/xilinx/zynqmp_dma.c | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 5429497d3560..48aa78785f4d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1046,9 +1046,9 @@ static void xilinx_dma_chan_desc_cleanup(struct xilinx_dma_chan *chan)
  * xilinx_dma_do_tasklet - Schedule completion tasklet
  * @data: Pointer to the Xilinx DMA channel structure
  */
-static void xilinx_dma_do_tasklet(unsigned long data)
+static void xilinx_dma_do_tasklet(struct tasklet_struct *t)
 {
-	struct xilinx_dma_chan *chan = (struct xilinx_dma_chan *)data;
+	struct xilinx_dma_chan *chan = from_tasklet(chan, t, tasklet);
 
 	xilinx_dma_chan_desc_cleanup(chan);
 }
@@ -2866,8 +2866,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 	}
 
 	/* Initialize the tasklet */
-	tasklet_init(&chan->tasklet, xilinx_dma_do_tasklet,
-			(unsigned long)chan);
+	tasklet_setup(&chan->tasklet, xilinx_dma_do_tasklet);
 
 	/*
 	 * Initialize the DMA channel and add it to the DMA engine channels
diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index ff253696d183..15b0f961fdf8 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -744,9 +744,9 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
  * zynqmp_dma_do_tasklet - Schedule completion tasklet
  * @data: Pointer to the ZynqMP DMA channel structure
  */
-static void zynqmp_dma_do_tasklet(unsigned long data)
+static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
 {
-	struct zynqmp_dma_chan *chan = (struct zynqmp_dma_chan *)data;
+	struct zynqmp_dma_chan *chan = from_tasklet(chan, t, tasklet);
 	u32 count;
 	unsigned long irqflags;
 
@@ -908,7 +908,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
 	zdev->chan = chan;
-	tasklet_init(&chan->tasklet, zynqmp_dma_do_tasklet, (ulong)chan);
+	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
 	INIT_LIST_HEAD(&chan->active_list);
 	INIT_LIST_HEAD(&chan->pending_list);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
