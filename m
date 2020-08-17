Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AD2C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:38:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 615D82072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fR+qxAzR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tYWB4U4C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 615D82072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rovKvpdZFRsRrk7W49Tpj7SS1AEJv/lK8QWdCJ28AgE=; b=fR+qxAzRjj6dKY7wbpZ8Qdidrf
	YuhJOO/hLsT4dmdVb3Mk+jnXlcf4Lm9tRPG1hL6v4XG1eR4kLWm3H3BDx4lCkn88QLhvvrFLDPSQ7
	lv2BTeckekbqWPU9jXJ0NPvF8WjSTkJfLqd0rSRsd92LjHs88dsLuuTmHUIL8nxRjywB8xuzaSD2Q
	489du0LJSjwbaMUT5RxE8HKJeebaLyL/EJUgPCbJk5TmMuUweRBkq+GNkUF23fDsfANVqjNtdcIZO
	mhXNpG+RXpxShQGdsQHGab86PZWU22hDzadMNyzEUb+5uX5HNaBPQW+LtCmZ2iWo8QErTlV+e+71z
	RsU2QpmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aeg-0000ZJ-Uc; Mon, 17 Aug 2020 08:38:11 +0000
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aPQ-0000jr-WD; Mon, 17 Aug 2020 08:22:39 +0000
Received: by mail-pg1-f194.google.com with SMTP id x6so7750011pgx.12;
 Mon, 17 Aug 2020 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MNsn+KIrzPWCkkACLUaTpczD1K+bZF0NZOkHpu9iBlw=;
 b=tYWB4U4C3lwkJ7KzspGsY+JnaAbBB4RFJjtsDwVaVyquMo6llfLpsyP9HNjqx1vAIN
 tNns+ubKbtrgwB4oggj7I3Zr83JcvEl+SgLdMcnPMX23O9iX5y4bFVvsMkM84xtU8b7/
 +Eh/zZcvnTl7hVw4au6Uev5ggpg/tW4J7GN+Uv2rTa2t1u4AqO7pManPuCNVvB9LU3CW
 xn3yfjrJR27u4ykM7g7HngBfdPPCgD0Wdpw9gMFztIGBvAlNoqEESuj/91CBWAIgmrhD
 BUcxlVmTEeAchaVIIZw8ber5GPLfmV+DsiDN1Bc37D+zA8Gm56gHJ58cUvd+8mo5wY81
 yhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MNsn+KIrzPWCkkACLUaTpczD1K+bZF0NZOkHpu9iBlw=;
 b=UX7QhgmyKpS0c3UjpmMgDJ03+4vgqdKD83Rc1TOmYcw46dnPNxfgWq4gvPdcM0P5Uq
 YMO/Q6203uPrUoTAi505l3E+Ezl8ixMbBw/rYnHPBxMIKKgDY0zJEMHPekHVKsIrOVrM
 j5X05NI1ItdPCSDYc0r4qKBEy1qQt59aMMMnZcLUL+2jP2uPCf+3BKRiCtDL4pc0VA8G
 yeo+N7OH0uujU7XT25KPxyjH82+qJJsRHuk7fhElU39yOKe/tI6s2orguQRmnNv59KIG
 IQLJ7y7/cJuIQgjYl+NPjO61sSHPfa+2Bh6eVbB68J1/MKu+oT0oqvwEEnQ5ms+83tVy
 AcCQ==
X-Gm-Message-State: AOAM530AkQMb48Gfu0T5iDNi8nsxzzNFELQaa/FRPC7U9ilZoUwekq/Y
 mxzmZhLW9H1aU/9KBFw836U=
X-Google-Smtp-Source: ABdhPJwip8+ZBfBIF2rZWZD4jUDBwY6tGIUOnI8p5i+Ag2NB9ZORtoqizmkvtq5iIYQRR7kPC5mbcw==
X-Received: by 2002:a62:38cb:: with SMTP id
 f194mr10567474pfa.243.1597652541981; 
 Mon, 17 Aug 2020 01:22:21 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:22:21 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 28/35] dma: timb_dma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:19 +0530
Message-Id: <20200817081726.20213-29-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042225_190997_0162D4BC 
X-CRM114-Status: GOOD (  13.24  )
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
 drivers/dma/timb_dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
index 68e48bf54d78..3f524be69efb 100644
--- a/drivers/dma/timb_dma.c
+++ b/drivers/dma/timb_dma.c
@@ -563,9 +563,9 @@ static int td_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void td_tasklet(unsigned long data)
+static void td_tasklet(struct tasklet_struct *t)
 {
-	struct timb_dma *td = (struct timb_dma *)data;
+	struct timb_dma *td = from_tasklet(td, t, tasklet);
 	u32 isr;
 	u32 ipr;
 	u32 ier;
@@ -658,7 +658,7 @@ static int td_probe(struct platform_device *pdev)
 	iowrite32(0x0, td->membase + TIMBDMA_IER);
 	iowrite32(0xFFFFFFFF, td->membase + TIMBDMA_ISR);
 
-	tasklet_init(&td->tasklet, td_tasklet, (unsigned long)td);
+	tasklet_setup(&td->tasklet, td_tasklet);
 
 	err = request_irq(irq, td_irq, IRQF_SHARED, DRIVER_NAME, td);
 	if (err) {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
