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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9546C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:06:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9436D2063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:06:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vFEafZcn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e55LutWi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmM7bRuM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9436D2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpnt+eXs9Vj3wBNE5MtOXVsEZoL3FkYA9awJvnLNT7g=; b=vFEafZcnqQtispTg6oV9fofJ8u
	F9hGFrdG+dNJ9/1qVZMVhYeqBauKfJg1Huol8L+4ThJ9EjIQcaqYamEMgxC09z0zaIySeUmy/PEn+
	IKgj2KJbbxIdXs7xyOKjwPYEcAuo7AhLCZEGL98Byv9UU1Qg2PUbVS2dK0JomnMvlErXu6Z3L61oz
	LOlGzwy77puG5PFGK+KMYd3ErHAb+5PcTfIhpOecPeyUdwiYDpWM6UlVcPvqaguWOPrru7MGWjOHD
	RfSE0B1D1Yy7RNiANj2gBCK8CkU63z1qgrsyyMf1Ugr2MvxVUBPk756NosSyKZ5gCbZeBsPt8PtDR
	f3/XvDnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7b5w-0006hi-SR; Mon, 17 Aug 2020 09:06:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aea-0000Tq-4N; Mon, 17 Aug 2020 08:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QME4/rDj4IUPM5kJpeHXTQIgsJQOMifnZCInRk/A1C4=; b=e55LutWiz78F5q5m0kUFg6/G9r
 K6mNUkHJlSlMQKFOsneLrWu2wLi27stGNRI30CQG5kPj+bV7X2BkVvnTXcXiRbIzJCUS9/BS1QgSe
 AxUvLEvJyV4bi2SrUc9sZ28brtbTvuk4AKQC97eXp+PW5qAFR4iCil1xBllsyfcCYZB1bk7+PE4eV
 DGsEfnM9zScIKgzWbZesV3GzYs+i2YmaVUThGCv8nN5nuE9V96FC5dQrzkc+IozSft6sJ1qQPUPCv
 5LmxKqQ5Ywzew03ydKoKvcz1CW2Ew+TkzDDBqlmQszEzyQlw4hjMduv1gCamW2lHJEk43b7eg0TI6
 ymntAqPA==;
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aOg-0004d2-6k; Mon, 17 Aug 2020 08:21:41 +0000
Received: by mail-pg1-x543.google.com with SMTP id 128so7760259pgd.5;
 Mon, 17 Aug 2020 01:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QME4/rDj4IUPM5kJpeHXTQIgsJQOMifnZCInRk/A1C4=;
 b=RmM7bRuMfULJD/wWAddFVHPn4qOcLkmjxMn/rAcczyzgMa1wKBhw5p2SIoYN0WDrgF
 NLO0KMAW82As872kQ7UVo1mfQclmRJC1kdrKiR8FAtxpqgjn6MqeGpoy02ZVJKrW+mU3
 X7B7rFIM6NIoov9H3IL9Jkp2iXe9vdqn5gyAavfv8/tJX7qAmPnKetRMWrB/gw81S1Y4
 UcAGdAEyO+Uoq2v7u1oEzXyYj7Zjusf9b3P7acUR+0+jKW594BbO4bhGriaAVgEjxG6F
 EhtL7ITOfC8RpzfLLj/5Mqg3VtkzaaCXo3ramFImsX/kuOkoMpti5lf+oaTUXcKsVACU
 pijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QME4/rDj4IUPM5kJpeHXTQIgsJQOMifnZCInRk/A1C4=;
 b=hdgH6Vb+oWsoNEJHqX7Oih9WiP50AiPL/hpdYB8W1huxVFFA+bd4hl0+POtJOq348b
 knI/raN6z8VqFx1s0A6PzUJi5MvyPHMZVh4vSDtvual9JhFvEDDPAF0NQ6i1l17qygLy
 TRleumP+sSClbzlWBnGHbL3kl49yXs26tfGbcDNoYwrfWNE492z7wxT5lGTImycSvC60
 tQdPV4Tmw+gWxh5XV/lyKmY4liNcSKBK+5EMmuziLhxVh7mkWDIIZ/b1oFVwqIq+Cm6M
 ZS9B23Wkx7EbvdyRXtO+dF0n5/MdqZ2rTZXj6YKIngsycObPylwMa1D7dsTHsGyCg7t/
 enOg==
X-Gm-Message-State: AOAM532mNGuMeH3HrqCcuYoMFpFq5DHJhmgNM5BIL1KwrLWdROiQ70DG
 Uawa6WnEFQwHJRl8s4ndXZ4=
X-Google-Smtp-Source: ABdhPJw1yMHZg4IX+ujfu1AKl4GGcYUn7OVJSQqidNZWKgU+pVKkUHwkDp/1muHPa+24Z7+wVKSoDg==
X-Received: by 2002:a63:dc11:: with SMTP id s17mr9103570pgg.254.1597652495077; 
 Mon, 17 Aug 2020 01:21:35 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:21:34 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 23/35] dma: sa11x0: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:14 +0530
Message-Id: <20200817081726.20213-24-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_092138_981268_7B0EDECB 
X-CRM114-Status: GOOD (  14.35  )
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
 drivers/dma/sa11x0-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index 0fa7f14a65a1..1e918e284fc0 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -323,9 +323,9 @@ static void sa11x0_dma_start_txd(struct sa11x0_dma_chan *c)
 	}
 }
 
-static void sa11x0_dma_tasklet(unsigned long arg)
+static void sa11x0_dma_tasklet(struct tasklet_struct *t)
 {
-	struct sa11x0_dma_dev *d = (struct sa11x0_dma_dev *)arg;
+	struct sa11x0_dma_dev *d = from_tasklet(d, t, task);
 	struct sa11x0_dma_phy *p;
 	struct sa11x0_dma_chan *c;
 	unsigned pch, pch_alloc = 0;
@@ -928,7 +928,7 @@ static int sa11x0_dma_probe(struct platform_device *pdev)
 		goto err_ioremap;
 	}
 
-	tasklet_init(&d->task, sa11x0_dma_tasklet, (unsigned long)d);
+	tasklet_setup(&d->task, sa11x0_dma_tasklet);
 
 	for (i = 0; i < NR_PHY_CHAN; i++) {
 		struct sa11x0_dma_phy *p = &d->phy[i];
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
