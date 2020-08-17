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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D39C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:34:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1C0C2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="na/AtsF9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbGPv1Mo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1C0C2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maVDO0vRW810PWxAAE3oWwgK3jrVYkOB4uYHRlJwMJg=; b=na/AtsF9M1RbFjgmWfHf5O5sG+
	b+/EfB3SWsc4Qo50ScAtckG1Mx1+wBG4ZruCfhQOApUrB/rTHKvnwPydcX4LiFAc01OL7eyUf7Mww
	ij+8us62pqzkQnwmwYlTbet/a7sy8Q+Z79/j2ByeGVImTK9ilDpJk51CkFGIv+BvGcf0nvIKpYsZ5
	EdvGHWLRFQOuzGe9JAdfqgIqQKK0wOhxaC4nCCpngdHPWyRKd7oc3YHWIL+QJ0vuMdQiZH+zXz+0m
	6Vi+DwveGeV20xl+gxJwlb1uWyuFesL0og5o4l6HP0jnX/MYmQePPTyn2x27a995yDXS5R+CXHyGg
	Fd7M9OWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7bX1-0004PG-9T; Mon, 17 Aug 2020 09:34:19 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aLk-0007M6-RT; Mon, 17 Aug 2020 08:18:39 +0000
Received: by mail-pf1-x444.google.com with SMTP id r11so7842176pfl.11;
 Mon, 17 Aug 2020 01:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=McUFqZfFTy7mHwbw8y2LjePaGU9tqMqaDH3Woad5dgY=;
 b=rbGPv1MoAStGdHictLBw1dH4GZoFIaptVHT/PTQUYarAqwH8jr/NQJpRblNtu8Q41b
 h5kE3FK0Bcrx3/+Zd6IsTlw5aHjVtw05s4dLWtVo+8g1TVa3DmIZfm5h7PClL9HJLOWp
 OTSIDh9iY+xzhXKlp3+CuWBnd4nGJLinJzWoIBQ5xoTLALb0n+9o8qX9Ebbj4jGqV2jT
 q83tfI49OfnTPFbY8Ecv64HoBmGwkwk/Xnvsa93zdxDBXM9nLmfRw4Q+HXL/WxWR8Axb
 gfANCDAg2XVcS363QcNFYYj/Z8yd6ay5UQWiYipx8c6dkumwh89srhCfyJfBev9nFJBI
 c/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=McUFqZfFTy7mHwbw8y2LjePaGU9tqMqaDH3Woad5dgY=;
 b=px83CGYEBxmM5XZmt9h96rTH+Qf6QCGwc+bMHKKlG3x7p/WaoD6VqHN7xCVW+3wZZ6
 4Vx/RW4PfGREc01hVHqHgpFbsh+JYVig6JoJS9E5efdlHcRQ4Yg5+2uiNsD7EXBmO2x7
 H8RvjzrgnDWw+4sWLWOHE+1dSCEfkSp8RptJRBXOtPfg00eZxFl3M/0UIPJO447B6tdg
 hZw+Ot694r43R8ObZlqbENDyPhBPm+S3alhjog08yyvPtjZwOrT+5wdYtGQejxiz5r8G
 zQrGJZc/lg0P218lgj1/HpIj0FSBRb+1RJnn0fkPU9uUxHeSneG9f5LkRUZZygI/s+vn
 K+YA==
X-Gm-Message-State: AOAM531aOAulbSdfOGNonD+9nh/PijNgWCNCwkNNdWJ/nPb7+9cn3Dad
 +ANB8pEfu/GT23KIEjBQN18=
X-Google-Smtp-Source: ABdhPJz5jQMemPq+r7m/kRK32XCVq2NbmdAqGrkNdHPC5k9KVEpXSa2A/6RTZ0/LD+zMammtHEDMqA==
X-Received: by 2002:aa7:96e5:: with SMTP id i5mr7562519pfq.108.1597652314716; 
 Mon, 17 Aug 2020 01:18:34 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:18:34 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 05/35] dma: dw: convert tasklets to use new tasklet_setup() API
Date: Mon, 17 Aug 2020 13:46:56 +0530
Message-Id: <20200817081726.20213-6-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041837_451610_920C6083 
X-CRM114-Status: GOOD (  12.96  )
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
 drivers/dma/dw/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 4700f2e87a62..022ddc4d3af5 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -463,9 +463,9 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	dwc_descriptor_complete(dwc, bad_desc, true);
 }
 
-static void dw_dma_tasklet(unsigned long data)
+static void dw_dma_tasklet(struct tasklet_struct *t)
 {
-	struct dw_dma *dw = (struct dw_dma *)data;
+	struct dw_dma *dw = from_tasklet(dw, t, tasklet);
 	struct dw_dma_chan *dwc;
 	u32 status_xfer;
 	u32 status_err;
@@ -1138,7 +1138,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 		goto err_pdata;
 	}
 
-	tasklet_init(&dw->tasklet, dw_dma_tasklet, (unsigned long)dw);
+	tasklet_setup(&dw->tasklet, dw_dma_tasklet);
 
 	err = request_irq(chip->irq, dw_dma_interrupt, IRQF_SHARED,
 			  dw->name, dw);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
