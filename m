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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C181C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:38:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F292072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="or+dHJRF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCo9FRKJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F292072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQC1soUkG2PLpHvBFXjZn5QdU5Fb8ZRF3bQ+nzIkjao=; b=or+dHJRFi/2lmH4Eud5lpoGcFX
	SfCIlZe2UFiCPAdojqvLAz5XIu5nqQ9Q/sHh/l/RutaB2X5xjTe9DjguFqCMsPM63Xv89eWpStt5Y
	tjvuQPQpZ1vVf+TR0UospnVwQwplMGkCzY5ZKagh64Gg8dZGfRgrg1Wf9zHtt7IZUj9TJkbFu52Lz
	VlgUpkWRNhI9NSTR1guy82dP1or+4ZDqO/Iko0UGEczDNgEprCK/msdlJz+s4xM5Tfmx6a5hCVdMV
	52x2rRnRwyZLByrWq9ZqNJeEmJ+SoWIV1y/8up86mGrGlLvJlhszxCV3zraSjCeKkp62YI8hXgEZ8
	L5zxVHGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aeL-0000NI-Mc; Mon, 17 Aug 2020 08:37:49 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aPI-0000eU-6n; Mon, 17 Aug 2020 08:22:29 +0000
Received: by mail-pg1-x544.google.com with SMTP id g33so7762726pgb.4;
 Mon, 17 Aug 2020 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HqFQaMaVlN4v+XRE6EAAx4lkt2C6k9NLYs6BovvOyBc=;
 b=XCo9FRKJqzxD9YIFVBEkvWvIE6d8IhdAaiDCtzQO7t4uXgFaRRScmAvp0jzrkTU4HN
 c8T4cfAHELvaWoAq4xMW2JM0VEedndfRcDWLW92Tk7hKPiOJWScPnhSp11JUzjxwj5Wc
 tiJdQ8nOdN/Z7aW1egi2EdY1Omzr3UvEyyneLR1hEUAsPju2N1nHj6d3e15q3oaZiyvP
 bXMiI5e4811zae96GuOOUkWztczj4bgmH/joFr4ApZ0qxChUW0b1UqRRBKaSgxhomiJG
 p2k9h60UtRATSv4JkakeSpHpSRDExkbbgmjWcH6nbiz2/9WZIAfKL5178CUcItTg9tbK
 Bu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HqFQaMaVlN4v+XRE6EAAx4lkt2C6k9NLYs6BovvOyBc=;
 b=of8fGLSTQjmWvrzk0Or0syHXp6u7EbTNjRcHcUrqHKfN8rgXBnv6CsXTPzeThMjD4E
 wfuUsEHu7uAwdiQWBMgj87cHGR7G++Lfdw0Gkyc831FWBOlYnZ5qdYS4QUU99Y21Lvbq
 oH6pA+yqDLaUBV5Nmejc80nv7/Ili4R1nmZLaYOydOLH/fjEi5vGJIqtE3iiRVCeMgyp
 f+sDhB5l+WRDNIw9zhCjgxYJkbsUrg5qLMypM+3diVe8gSCXPm2PVRV75oTaduaq+X/B
 FLObBRdlQvYlVE6dnQ9UyttE8i+5dEmeVREK+w8RK4EaMb/wiCMhDuZHwkqGgWQ2s273
 Pwtg==
X-Gm-Message-State: AOAM531Xj77awWxxH2sFDAPbQBNiYzRm3oDM3klEthq8YdsXNfVNekzT
 UOLIRUs6JB6OMeDOGrEmnnQ=
X-Google-Smtp-Source: ABdhPJyPMSt/qjmwIlaM5eY0uLHA/f/qnk1WbIgQl1cjJGvqnctrPF7J892OqBSbDL22FjnEZivrnw==
X-Received: by 2002:a62:8cd4:: with SMTP id m203mr10376894pfd.74.1597652532712; 
 Mon, 17 Aug 2020 01:22:12 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:22:12 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 27/35] dma: tegra20: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:18 +0530
Message-Id: <20200817081726.20213-28-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042216_795020_E916F9DD 
X-CRM114-Status: GOOD (  12.89  )
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
 drivers/dma/tegra20-apb-dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 55fc7400f717..71827d9b0aa1 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -644,9 +644,9 @@ static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
 	}
 }
 
-static void tegra_dma_tasklet(unsigned long data)
+static void tegra_dma_tasklet(struct tasklet_struct *t)
 {
-	struct tegra_dma_channel *tdc = (struct tegra_dma_channel *)data;
+	struct tegra_dma_channel *tdc = from_tasklet(tdc, t, tasklet);
 	struct dmaengine_desc_callback cb;
 	struct tegra_dma_desc *dma_desc;
 	unsigned int cb_count;
@@ -1523,8 +1523,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		tdc->id = i;
 		tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
 
-		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
-			     (unsigned long)tdc);
+		tasklet_setup(&tdc->tasklet, tegra_dma_tasklet);
 		spin_lock_init(&tdc->lock);
 		init_waitqueue_head(&tdc->wq);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
