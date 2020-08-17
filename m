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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79535C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:34:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E7A020758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="So7GNExF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjvdAoYo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E7A020758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY7N0IXq2zCq7piT9ljkFe7vaQBx7M2xCXnYQwOwpN4=; b=So7GNExFN67iTKQBH/CAD/Vru7
	wGgOnzzeprrE3Tuhxvz1k5FuUqP9QzUzvFPiEnViN8t/LGjmpyqJcqZ/IlINAC+CaTE0/NIl45zMl
	KHwunV5CDyxKab9s/5LhnKp00R+0bHz2GrFJYPWLI+LTqAuxVCQwqxA5h0+9IxPhdiXIoUFx/mnBQ
	9kIzr2Cv1eYNbMVBunTeR8wEw4AXxTOComHDHKtNU5pMdvIAdg4xeCkEC70d0uoRJ6o+rVmt5RTlA
	k06ldUTRpqBJJmsM0/Z9OO715XgfeBoU4nl+gSZDYwmPGXYtVvYYRUYMskSJwucuwH+pL9f6qSsp6
	snJvgT3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ab3-000785-UT; Mon, 17 Aug 2020 08:34:26 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aON-0000C8-Hj; Mon, 17 Aug 2020 08:21:23 +0000
Received: by mail-pl1-x644.google.com with SMTP id g15so3232948plj.6;
 Mon, 17 Aug 2020 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y9TFyb5YPU9meSmmE+/B5Cy2MtU4Ivp78FeC1LNG7+4=;
 b=KjvdAoYou4ybaWcAads3ZK4SvLiE31HbsHKajely8IWfAQdMn/OSyMaY3js7C7Ht8H
 i/qCUkOyKDkjLNCAwIYxcnlQGSLxjCkEcE152V3EDZTRpOEbW08rDrNuuqzcUb5C2yI5
 krHyqEmaDLqw6LYtAhr4BmFpFxKLFqaIzoXd3kKOja4G0vAqHho4VIGCOha30JuEs/1l
 /ci2DECl5T9mgtDOhF1NpiC0yOq8h/NRmi4q8Ul+UFZH+AJqvt1m7I9ZZe5GTZ4iVICN
 HB9ZSWz9nm28pjeTzk/T8DJsGKGRLeR2RaLpdJ0p07D7vPszP148/HV+dFZkZt7u0G/Y
 EF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y9TFyb5YPU9meSmmE+/B5Cy2MtU4Ivp78FeC1LNG7+4=;
 b=nDHj4mJFoJXEwD/8GbpovEW1mfF7b3mmAlFUvoPpibw4aAvoNuygFTZKHphtZwFabU
 HvWwOlMMK7YgJw0P1eNs9VHyX4uQqELLstZ0zap2M5o8C+URYcuqRDyYK8LeJUzn7rQZ
 ZxWo0ItNTdAHijOydM040Fdvk7H8F4+EJCAizsCPn/2B7ZnKz88Sw9FNOa1IoQEZ1LYa
 0qZBD/RPOzc4iV9yYcBRaZcsvsBbNCe/mcSyiGdHewsa8eHJJwmjdttQPJp8Oo0yw7pd
 xFdcqab5qSVGmJqsTAzccPIQpB+SFSPh3/NWrw3PGDUDDzGZOBN0F6bp4oQ5Nx1vrjyz
 foBw==
X-Gm-Message-State: AOAM530O4Bbjcnlxrrg/iWZ5qNybFRbd/mv67czKzlRLp52e06bB07eb
 gRTKWZKcslWME/IZQe0BS/0=
X-Google-Smtp-Source: ABdhPJz3s3uZbr2e0/pl68cyu2TvshN2/ql+aVmWQNdSIKkRhrV2ij/yHaGbIZqOmjwusPAgdTGx9w==
X-Received: by 2002:a17:902:8648:: with SMTP id
 y8mr10178303plt.91.1597652476410; 
 Mon, 17 Aug 2020 01:21:16 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:21:15 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 21/35] dma: ppc4xx: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:12 +0530
Message-Id: <20200817081726.20213-22-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042119_976056_944D88C3 
X-CRM114-Status: GOOD (  13.00  )
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
 drivers/dma/ppc4xx/adma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 4db000d5f01c..71cdaaa8134c 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -1660,9 +1660,9 @@ static void __ppc440spe_adma_slot_cleanup(struct ppc440spe_adma_chan *chan)
 /**
  * ppc440spe_adma_tasklet - clean up watch-dog initiator
  */
-static void ppc440spe_adma_tasklet(unsigned long data)
+static void ppc440spe_adma_tasklet(struct tasklet_struct *t)
 {
-	struct ppc440spe_adma_chan *chan = (struct ppc440spe_adma_chan *) data;
+	struct ppc440spe_adma_chan *chan = from_tasklet(chan, t, irq_tasklet);
 
 	spin_lock_nested(&chan->lock, SINGLE_DEPTH_NESTING);
 	__ppc440spe_adma_slot_cleanup(chan);
@@ -4141,8 +4141,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	chan->common.device = &adev->common;
 	dma_cookie_init(&chan->common);
 	list_add_tail(&chan->common.device_node, &adev->common.channels);
-	tasklet_init(&chan->irq_tasklet, ppc440spe_adma_tasklet,
-		     (unsigned long)chan);
+	tasklet_setup(&chan->irq_tasklet, ppc440spe_adma_tasklet);
 
 	/* allocate and map helper pages for async validation or
 	 * async_mult/async_sum_product operations on DMA0/1.
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
