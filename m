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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E37C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:26:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9B62063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jnR2wTaC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPj6GIc3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC9B62063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCYadgOZdz0LtZCPDqXolHb6ByvO133aoFOwOBtK7/s=; b=jnR2wTaCJQDPk4ScLHzNjhas12
	6HIeuaP8SKKn0zs0XeJsqcMC5Jv+pLx2qnsWqvh0SIXF5mnbSBM+DblgLmIupU003i5GkCq5s38ye
	Idsk+ylJi4QpieqS3PDhvZtOxQJwAKsmjebQtjwxgJKfkS1LAqvyo6LMzt4mxxgBVQqikVlCSVACJ
	0FG0M6sGePClTkR0QFrI+Wu6n1+N8Huu4SbSk6+OMRq2UZxd/O4Q+YQCWqnc5I17pJj4fbGxbi0xi
	k5FcJOYFcUskj8dKKpOevbr0adyfYNC8ZuC2/TVjTtTPYooN7gzTZJtC+85MRi1G/eGClb6mH9w4b
	52LWOzCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aT4-0002VB-0V; Mon, 17 Aug 2020 08:26:10 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aLv-0007R4-OP; Mon, 17 Aug 2020 08:18:49 +0000
Received: by mail-pg1-x541.google.com with SMTP id o13so7776235pgf.0;
 Mon, 17 Aug 2020 01:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KmEcBHcde06arqa/qnAKRl0EaY2afCtuj8GLj4ZTRM0=;
 b=ZPj6GIc3bq6Ex5uJOYWUiGSZFLN/814K7fHM5oA+Mq5dpIS8LCQPwVQNUGtj44Ywuf
 8JGtsTJ5CYKCtK8MFgtkNaoVPuAzeoHi+Tf3kpf+KX/PviAbimyTxiPKekd25Jr4pMVy
 UCEnQYTEvlOVJ0m/i6dJ8djGZdkbONwIig2dW9klIJEKOz/te71+Z0SNAVizpQ8BCtCA
 WFL7ORtS8TH2YerqRUJ9EvA9XeGa7yQV7z9UH/4tqceHCXwSO0uNAaMdNJMJH8OlIb5H
 U/inY8+aVvTB9Fx/gLIu/Qpk4P+/FpisLIjv90NGEiWRW3fmCAqamLg/CeJUW/Ku0hVg
 fRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KmEcBHcde06arqa/qnAKRl0EaY2afCtuj8GLj4ZTRM0=;
 b=Y9caYcCzzfiDtzEqwMKyzlBTYPhm1HzWzWacefWvqFmLLrFqMd5/i8wTYtiqeASj0A
 k1N77M4YtyvHKPJFs5uhOhmqBeeEwjSgjzuSNBpXgY0gpBdhI4mXb+pzPKDGRzjbAj4C
 Nj8C6vub9IZyUqdlODsezyVWSJ+7REiL3m55Sv0o7+OrviT1NKIIV+dBXWhoqD5XZo8R
 /VCUM22LL5VKTICXHk+zlDRo1WH/HH1HOINPv8UC1AFzhGVHd/0u4Ft4Pfe407eQX0W6
 7jw1wNugcwNU6bcAIp9/AK/GUc3wupnk4n2+Xc5yRm6sWctufsVVxqr5n2lQXPmbWU97
 P2EQ==
X-Gm-Message-State: AOAM530DHKbllExWyEp8FPJH1VclCtI/QV6Ca5FSZ9zUHb8jhOzO1Kr1
 p+yBw1KlTVsBx8e9J25PKLs=
X-Google-Smtp-Source: ABdhPJzTO4xmXekUKvlKfpAmGwBic+Bzzl9KrxVjZgG/u8ypYaxKauNmxFYJuyl0vzE9Xwqlt1/nCA==
X-Received: by 2002:a63:ed07:: with SMTP id d7mr8896251pgi.414.1597652324466; 
 Mon, 17 Aug 2020 01:18:44 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:18:44 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 06/35] dma: ep93xx: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:46:57 +0530
Message-Id: <20200817081726.20213-7-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041847_928195_5E96E509 
X-CRM114-Status: GOOD (  12.83  )
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
 drivers/dma/ep93xx_dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 87a246012629..01027779beb8 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -745,9 +745,9 @@ static void ep93xx_dma_advance_work(struct ep93xx_dma_chan *edmac)
 	spin_unlock_irqrestore(&edmac->lock, flags);
 }
 
-static void ep93xx_dma_tasklet(unsigned long data)
+static void ep93xx_dma_tasklet(struct tasklet_struct *t)
 {
-	struct ep93xx_dma_chan *edmac = (struct ep93xx_dma_chan *)data;
+	struct ep93xx_dma_chan *edmac = from_tasklet(edmac, t, tasklet);
 	struct ep93xx_dma_desc *desc, *d;
 	struct dmaengine_desc_callback cb;
 	LIST_HEAD(list);
@@ -1353,8 +1353,7 @@ static int __init ep93xx_dma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&edmac->active);
 		INIT_LIST_HEAD(&edmac->queue);
 		INIT_LIST_HEAD(&edmac->free_list);
-		tasklet_init(&edmac->tasklet, ep93xx_dma_tasklet,
-			     (unsigned long)edmac);
+		tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
 
 		list_add_tail(&edmac->chan.device_node,
 			      &dma_dev->channels);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
