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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB409C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:34:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7781E20758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hStOTNy8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMJgXHft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7781E20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKyrVxY5N0b8vYSFOwoV9rAgVZ8XuodWgKyR6Hm/m60=; b=hStOTNy8Y7ASjYm+WvJQBTcyv6
	bDccYLHdtyUe3A2y89+PQeMX7NghdHH3WiCpMCaMjNEXS8oitAWdcgNYGBoPEwcnU1Ke+0RZsExSU
	2cIKFED3Z8dlN0WesAOYw8oO5X5okCRyr/8Rw4fcC+kVqC5XXH9MWSDukHHJbvnwdQ1W3wVVs6tv5
	vbdnh1siExNYO55vpc+poaepTma/gbzrhi8Asey2IQRbzhH8feqTymuFX5EmzQKTzr+iJjLXOYD81
	2y0zKFFWuF/M82Mt6w9CCQ7p9/AW/sPVAvDEMK695KsV43FFz+pXlMfDPZILi5a8G0Vf3KFF6ux/B
	bDKJkF0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ab2-000778-KE; Mon, 17 Aug 2020 08:34:24 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aOF-00007V-3u; Mon, 17 Aug 2020 08:21:13 +0000
Received: by mail-pg1-x541.google.com with SMTP id i10so2223577pgk.1;
 Mon, 17 Aug 2020 01:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2u/40339c50ypFs7M618Prb7hCf6hscGSknPACX7w9w=;
 b=iMJgXHftMkSl4iNyizZ354moFN14rzQi5QK+tsbFIeiCkQVJgOcb4cFOkDwqwHn8p6
 RW9U+l9OAhcSuILZYFOEuHFOfiufeK7Muf76t7X5rfoJNJNRY9aI7JyxEmfsE4MKJzI3
 oKpRg2L9JOBnMg7DKsTu7pgeUWYEUQsofw1NXS6KesdoB2kjZfjXKQdqb9de6VUvzjj4
 fSUgAq/rbcI1IEyjk9wHzfEFF8akM/JLknmS5KMWJOYvYsn5zf/xIPvEZgLADDg6rXAo
 6QgNrVRH6d+Qs05Jy11I6QzJS2SlA5B/7I4XrIw3CArYIMUWUYvQ4ZPSbabLMjncdi+6
 6EVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2u/40339c50ypFs7M618Prb7hCf6hscGSknPACX7w9w=;
 b=hoq0S7qc95JI+JzmDKR1NJClmBELH9ywPF+4N2X5Vm47Es7osuhjAUOl2NySTvbWuZ
 DM+jIrSjWhvTi/4LvSk26uhw4MX5pCo7lEg2JzQfBl3d6riqIrppFza9rAViXvsZpBnS
 mOLo4ubUBC03HiklzCTybhTZNA+vSHfo8BxPsJyJw5II7CqeR97GgGtLBr978qA8w7F6
 6XyFpfncXHarpGJ7gT7IpYFRd+3fhpYTwh7g7w7OjrAuPhVsSd46UfE5/tbbwvfqGkP2
 KwQKozK8sCw3oSGRlarSV8X/Q/jIOMszJ4pzzTIiURg93/mMIH8buyQTOmiGf6PNgXod
 gZVQ==
X-Gm-Message-State: AOAM530wgZjdxzsobXmMmwUl/T9p+UK1O+P8tCJjsN4g/22TOgVVoJr/
 1QIAtnHSig/tYcbek0i+nSk=
X-Google-Smtp-Source: ABdhPJwsXsOO//FysPu6rGzdVl2xfR2M5Qe2SU66dgM2Vu9dNZn8EtINnA+NMrA0VuD5J6Ua73aLqQ==
X-Received: by 2002:a05:6a00:91:: with SMTP id
 c17mr10267047pfj.151.1597652466999; 
 Mon, 17 Aug 2020 01:21:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:21:06 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 20/35] dma: pl330: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:47:11 +0530
Message-Id: <20200817081726.20213-21-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042111_478901_A74FFFEB 
X-CRM114-Status: GOOD (  13.89  )
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
 drivers/dma/pl330.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 2c508ee672b9..5599d350ec79 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -1580,9 +1580,9 @@ static void dma_pl330_rqcb(struct dma_pl330_desc *desc, enum pl330_op_err err)
 	tasklet_schedule(&pch->task);
 }
 
-static void pl330_dotask(unsigned long data)
+static void pl330_dotask(struct tasklet_struct *t)
 {
-	struct pl330_dmac *pl330 = (struct pl330_dmac *) data;
+	struct pl330_dmac *pl330 = from_tasklet(pl330, t, tasks);
 	unsigned long flags;
 	int i;
 
@@ -1986,7 +1986,7 @@ static int pl330_add(struct pl330_dmac *pl330)
 		return ret;
 	}
 
-	tasklet_init(&pl330->tasks, pl330_dotask, (unsigned long) pl330);
+	tasklet_setup(&pl330->tasks, pl330_dotask);
 
 	pl330->state = INIT;
 
@@ -2069,9 +2069,9 @@ static inline void fill_queue(struct dma_pl330_chan *pch)
 	}
 }
 
-static void pl330_tasklet(unsigned long data)
+static void pl330_tasklet(struct tasklet_struct *t)
 {
-	struct dma_pl330_chan *pch = (struct dma_pl330_chan *)data;
+	struct dma_pl330_chan *pch = from_tasklet(pch, t, task);
 	struct dma_pl330_desc *desc, *_dt;
 	unsigned long flags;
 	bool power_down = false;
@@ -2179,7 +2179,7 @@ static int pl330_alloc_chan_resources(struct dma_chan *chan)
 		return -ENOMEM;
 	}
 
-	tasklet_init(&pch->task, pl330_tasklet, (unsigned long) pch);
+	tasklet_setup(&pch->task, pl330_tasklet);
 
 	spin_unlock_irqrestore(&pl330->lock, flags);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
