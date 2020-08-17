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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B13C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:18:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D717320738
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jHnKuwoc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9KzzLHT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D717320738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oRxFjh8cNetgZufMI/RgyT/Phaxe6+J5MTe8xVKHzA=; b=jHnKuwocp7xX9KWU1PKmlkftUF
	Q59Y1mNVAs3Kv7FPYwocSIGQq6jbURYWKzeEnIywOQvwN/gDm/4QtxCE9AGh/PbT8NnvMZIqH/Dec
	Orp6VoZd4rvRGkA38U8Q3l69vyKBC84ct8/pRfxOAkMOVBtPSXaffB16o0R+WsbVW2iHgx1IWB3U/
	Z2uNFbFJ+DPnVWyxhye9F7uyKqEZfW6TYczavDdUJE0wHjcjmIrmeXJX5avXCxnyumNuA7LAdts5M
	7DPehypp2leAbplibw5z58DHNgzL+INY8KeU+SWfqsZE0PFecWPOiSUGI7qoxQJjui4mYL2g4BJwG
	RljUuaoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aLQ-0007Ct-St; Mon, 17 Aug 2020 08:18:17 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aL8-00075Z-HE; Mon, 17 Aug 2020 08:17:59 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 2so7437537pjx.5;
 Mon, 17 Aug 2020 01:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PpOwkkESLwiuZVXjbiIFtl9hpeTezLFpf6exIb06VVg=;
 b=S9KzzLHTf4acEr4iIrHquzS1n+27I5KgmfY2Vx1u17p1+AxZhqIxQadXzBxZLnvNln
 cdQTO9F9bVR2qRTcZt+wkh9LVW6ePlwnXaNBchj5mrQeeNQaW/cXQCpNqYi3pPruPMeB
 euSI1bn/bnAnVHWiQrzolM2XtL/krrZaPNWUYlGuQezIoZtZNAJ4283es1PPqvBqE/KD
 28LtExPpYWRQrTwpX0B9mHTn8dJSAj7OO6qptzXwqtJeDYlCQMj/PIYGkY0+fNJ5yIGB
 oFYU43VVwYGCrYPAwPEBqA+m8HMoRJ2rACChE/4BIiDiBJ8FnfOx6J7Nh61U7Pnwpowt
 oC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PpOwkkESLwiuZVXjbiIFtl9hpeTezLFpf6exIb06VVg=;
 b=TPaGYALRNf2JxJLPSAsjBzoxJEcWnSUJGr1vmYXhWTjqAdnninRu8WK/qpzSo+fCNA
 QgfqahODBh4QhoJMk/1Etc6//s5vebMjQopZ93AfmkQYPOPYAJsAWCDMpbPunIfnOTIO
 qIDiqEYQTzkcWtmA5tK0LXJldLnySj4r0dQLqCIZc6GjJgm4vNGkZUUWQEwsboMWQSnH
 AYjm1RSTzSgNYj7fAU8+r47s24mntjaeOk4BJx0L7lZImNE3ydZ4F1xF/9cheWTZ1sDm
 DzkRTobYY059cqB9waN0zcapZ17bn2WYtMq84nEELySXkk6OyUHqCAundKC+ipzrurzg
 25+Q==
X-Gm-Message-State: AOAM533jquoDfcrOR3ryCWvMdEYeC0WdmTpYz4iBmaGmONrPkqnUjn06
 TDkfI68PP2k5kI0VLWNno5M=
X-Google-Smtp-Source: ABdhPJzxyMicWdDqFa9Ms4TwNVlxegk5ZkYrtD4PG9ewuPRixw1owkp8YNo4HUfMixNJVCialhYcJQ==
X-Received: by 2002:a17:90b:2092:: with SMTP id
 hb18mr12048549pjb.118.1597652276966; 
 Mon, 17 Aug 2020 01:17:56 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:17:56 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 01/35] dma: altera-msgdma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:46:52 +0530
Message-Id: <20200817081726.20213-2-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041758_617137_429BA4E2 
X-CRM114-Status: GOOD (  13.01  )
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
 drivers/dma/altera-msgdma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
index 321ac3a7aa41..4d6751bf6f11 100644
--- a/drivers/dma/altera-msgdma.c
+++ b/drivers/dma/altera-msgdma.c
@@ -680,9 +680,9 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
  * msgdma_tasklet - Schedule completion tasklet
  * @data: Pointer to the Altera sSGDMA channel structure
  */
-static void msgdma_tasklet(unsigned long data)
+static void msgdma_tasklet(struct tasklet_struct *t)
 {
-	struct msgdma_device *mdev = (struct msgdma_device *)data;
+	struct msgdma_device *mdev = from_tasklet(mdev, t, irq_tasklet);
 	u32 count;
 	u32 __maybe_unused size;
 	u32 __maybe_unused status;
@@ -830,7 +830,7 @@ static int msgdma_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	tasklet_init(&mdev->irq_tasklet, msgdma_tasklet, (unsigned long)mdev);
+	tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);
 
 	dma_cookie_init(&mdev->dmachan);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
