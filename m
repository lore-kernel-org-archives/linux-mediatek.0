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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84CFC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:32:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9602072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CvKSYiA6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLX/Udd5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C9602072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbnGcUaYTAmTV9JcCGwKWHIPjksEii5pCry/UQyrjDU=; b=CvKSYiA6vePcci/QKeiqIAqlT8
	ZYwMaEjLB13KN5lq6d+6iQgIXyJApEPvKbJal67IF42mKAmSvnTwUPpvQKV7zQOV/+CcA9nMWAHZF
	iMvhD/7+ZCzYH1YCXXB6+f2pQ4m/GgqBGXh/l2BsouI+m41wbCKztgznatC68vkpys/qZVJiHonCl
	lVuJyOdgS9UVo0YiP1j0knRb7tIwCVyWeqv8LUck6NUabfmYc9HG6fFoi4bJB4hacmF67d9LjO1ai
	ch4qgnY1q4eHzVNIggb/cZzYZOAXEjNx4S+T8gw8yDacK8qb5CWpECYPtSe38s+HdphosoK7ubzT6
	0PmJmjeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aZB-000641-3V; Mon, 17 Aug 2020 08:32:29 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aNT-0008Ag-Gj; Mon, 17 Aug 2020 08:20:27 +0000
Received: by mail-pl1-x644.google.com with SMTP id g7so5996344plq.1;
 Mon, 17 Aug 2020 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ciey4QNzrHRDVKJ8tzpjEmlmjYecYc8dBp9iK+FHt5M=;
 b=GLX/Udd5tRebzj17DAsk32nKkuKq6qYgYAA8Ky5wQ5P4cQogSbBbaFIMyGh8Y86VZt
 wYUU5DgcowgC3uxy73fZRdoZ5KZmLb9uHoM94LbDz7oyNcaenDC5HJl0iStCi8eGMy3E
 wjthrsKSMZrbEyoXtZyUHaUFFixSuIJ+FpgUUDl31tUNcVYv/LsO4SbO/RWiDQPREHNb
 zp9rJGwc2w2GrxZ3qcn8QZyrIgYK+TIXdW+2qfHAjnqswD00sMvZQLa5jLG5Wt5sQz27
 7v1L8ZouQY+TtruCA3udb7q5lmoqhJjGatDH1tPOIr9cVOnfXykv8lNvKhiyMhUHl0E2
 8Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ciey4QNzrHRDVKJ8tzpjEmlmjYecYc8dBp9iK+FHt5M=;
 b=RRjuczHWrn/WN0n8DsheRgODDMYWLViADlp6BVEhmcmPeVcw4xMqjZ7Tpq1UmfWo33
 tswruPNLDSI+OCtDiWzwQb0VeQG/g7dty2f3560yGQZlWQ1p+Ijmiiu85YihmQuGwiJd
 ORg8TWzoyM9xPR2E62mY3NQXf1NRPjKe8fyN9Xvjon66BT8BtBfIGlSnIuQkd03m9RYr
 e7AIctFUqUgiuJMtxrPXGFtSTEU8nS8pnxk55bbAZyBh9144NNm9WkW6luRjetZn/U8q
 4HB9Gsc7dEO0pcwx77phqqTtvmg1ZvZ1TRE1+biyI4gjXes6DNR9LnhcZ3kbn5E9qE2k
 LMnQ==
X-Gm-Message-State: AOAM532S9KMLgEhqrfkP/kucieSfWNT3MH7px/FAH/VUJ/JnCNg7dRt7
 nV2ADq8A9wpFuVrB31H0Wxw=
X-Google-Smtp-Source: ABdhPJz0F2US9fqARZfMJyfWp/s0XGl+JzpTQcpPKUV44N0W4/T09Rn8XRozs4MxA4z0xakNHtFzDw==
X-Received: by 2002:a17:90b:2092:: with SMTP id
 hb18mr12054250pjb.118.1597652420174; 
 Mon, 17 Aug 2020 01:20:20 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:20:19 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 15/35] dma: mpc512x: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:06 +0530
Message-Id: <20200817081726.20213-16-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042023_678261_59F99878 
X-CRM114-Status: GOOD (  13.45  )
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
 drivers/dma/mpc512x_dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index dc2cae7bcf69..c1a69149c8bf 100644
--- a/drivers/dma/mpc512x_dma.c
+++ b/drivers/dma/mpc512x_dma.c
@@ -414,9 +414,9 @@ static void mpc_dma_process_completed(struct mpc_dma *mdma)
 }
 
 /* DMA Tasklet */
-static void mpc_dma_tasklet(unsigned long data)
+static void mpc_dma_tasklet(struct tasklet_struct *t)
 {
-	struct mpc_dma *mdma = (void *)data;
+	struct mpc_dma *mdma = from_tasklet(mdma, t, tasklet);
 	unsigned long flags;
 	uint es;
 
@@ -1009,7 +1009,7 @@ static int mpc_dma_probe(struct platform_device *op)
 		list_add_tail(&mchan->chan.device_node, &dma->channels);
 	}
 
-	tasklet_init(&mdma->tasklet, mpc_dma_tasklet, (unsigned long)mdma);
+	tasklet_setup(&mdma->tasklet, mpc_dma_tasklet);
 
 	/*
 	 * Configure DMA Engine:
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
