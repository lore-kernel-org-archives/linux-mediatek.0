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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65C6C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:06:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74546206C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z41ZvYub";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d5WDedM+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbD9Rvpw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74546206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTw+GehJxgcYHz0vAQvJbbSbNNomrENPWUX72mbQTXQ=; b=Z41ZvYubjzGMZlIOEoGxip72Fk
	DJkjToLWZhHKs16iafUyWTavq4RTkM389D1oaY8F2I/5TxV1B3dGrliGGZEFy1eQBSEnmH4mn6nqh
	MGs5cl9rkJatgLjPEJdEriFgeiF+JILN3fqK13BwV3hIqJBng2OtBzk3YCMRwhjcGW0/Ckszb9ueL
	XLbHlsU/RBf5xw2a98d3TE2aupsth8/CvSexTBTuXKXN1S4YK1yxx0kwYzTYVOvmSMdaXpGK5a8ud
	nUi4eFqXARjyuTpZnWhYhXwzgGUWmkX5zbEZ2Y8jej5YjWel5vQJL/KFiU7d9FyS6C5jYKo28XP31
	+e7xwd2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7b5p-0006eC-OD; Mon, 17 Aug 2020 09:06:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aeZ-0000Tq-2g; Mon, 17 Aug 2020 08:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VoLKiIOVUrOaN4l287TMDMySry9ropfMxje6XIuCNNc=; b=d5WDedM+GngT566AMPXaVlRn23
 7e/yBNxua96oMhr9EBCLjB4FqLr6CZnAEK1FzGMeaFt0VuG66tYKZXPgRIi72W03VIFBBHrf5eNcA
 0M3J4KPvPKVIWGloj22cp+DcvLzipqHslv+kKiiSypRi8JrBNeYxzIllprZlcjblGpOx0wKK2i+w7
 wlWU+bbxldXmFj+1sni6PYItl1iwCenkTp1+55JR7x6310hLaHTSS9tCTBtKl4RNnZtYGZcn1xszg
 jwjUmcgbjEF039Jcm2Px/qeZkip3aocFTjihNyiMNbavnvZl+PgAH3TjtHwdTcFxkKyRu1EPwFwr1
 aLFkdxJw==;
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aPa-0004lJ-4b; Mon, 17 Aug 2020 08:22:38 +0000
Received: by mail-pj1-x1042.google.com with SMTP id e4so7463066pjd.0;
 Mon, 17 Aug 2020 01:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VoLKiIOVUrOaN4l287TMDMySry9ropfMxje6XIuCNNc=;
 b=UbD9RvpwGYRa7E78/0SmXu8D+0uU3CLlGpUwz6Png9gNJGr8BMiroIF/PYP33AfP9J
 NS8l01XJqvYO/jMsso1BDEdLaGclwZ3gk+aL2Pm8a5HDdGHsioV3TMN4dOq/YOgV9yoJ
 V8kEU+s8RDsRF1oa+Sclql4CTvvpYcBjnRPDZfBf+rfgWn5Oe3QtfUuvmGGHPpiHVR8l
 OztVqA0QEdskNrxv8FNjsfSqr6P9ab5mjNbhW9jJNJSyrZ6KEteHRxI02A/jTTAxIg2g
 FAWtgOnrjNlx0Js75Qo/We+hTjdoZq52Vv0B5M/wrKoumVIKQeOoBwXc0hyVCfrCc1F7
 sWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VoLKiIOVUrOaN4l287TMDMySry9ropfMxje6XIuCNNc=;
 b=i7CaKrOtIEb6sDlDusnUBa8TUjSpofVbQyTZjNYmVbhjSAkt8k8T5IiaaGHqMJHnVi
 As+pnPXsT+T8H9RV/D2B8HNN5ra2/ywEdLmGEQOjm6PjYh9ZKA+zzPkNS+Od083D/+2Z
 aTo8VcxONUqe44XgnZA2FsXtSMymTI1TL1v4B11D3bJKUYXNMVZq9bzDDDNFnGex0D8S
 FxxELLL5suBCD8ZHRtz9UROxfY6qSbz/drPJasRkZOmbPDdlwk9Ct80HSMVBxN3s1GbQ
 BjJ6ntAU8X87ioPgicInDuAPWcSDcIIQsOhe8d0x+zKIxAbpiG4BVQPdz+IhvS0nspxF
 DGBw==
X-Gm-Message-State: AOAM530d53hnFuxZYReeq21ROipmv1jbhp5HBkSb62u241iLnnOlt/Zu
 2aoL84cHejtKR4S/oZ1lX3w=
X-Google-Smtp-Source: ABdhPJzY54Yr9p3SvkQUHcoT5x+SSSopPxxu/Za5BaDZ45wgGC+HtEgVNCmuV51vEiJI8I7eV/mlXg==
X-Received: by 2002:a17:90a:f2c7:: with SMTP id
 gt7mr11342682pjb.204.1597652551979; 
 Mon, 17 Aug 2020 01:22:31 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:22:31 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 29/35] dma: txx9dmac: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:20 +0530
Message-Id: <20200817081726.20213-30-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_092234_904291_0B4C39EF 
X-CRM114-Status: GOOD (  14.25  )
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
 drivers/dma/txx9dmac.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/txx9dmac.c b/drivers/dma/txx9dmac.c
index 628bdf4430c7..5b6b375a257e 100644
--- a/drivers/dma/txx9dmac.c
+++ b/drivers/dma/txx9dmac.c
@@ -601,13 +601,13 @@ static void txx9dmac_scan_descriptors(struct txx9dmac_chan *dc)
 	}
 }
 
-static void txx9dmac_chan_tasklet(unsigned long data)
+static void txx9dmac_chan_tasklet(struct tasklet_struct *t)
 {
 	int irq;
 	u32 csr;
 	struct txx9dmac_chan *dc;
 
-	dc = (struct txx9dmac_chan *)data;
+	dc = from_tasklet(dc, t, tasklet);
 	csr = channel_readl(dc, CSR);
 	dev_vdbg(chan2dev(&dc->chan), "tasklet: status=%x\n", csr);
 
@@ -638,13 +638,13 @@ static irqreturn_t txx9dmac_chan_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void txx9dmac_tasklet(unsigned long data)
+static void txx9dmac_tasklet(struct tasklet_struct *t)
 {
 	int irq;
 	u32 csr;
 	struct txx9dmac_chan *dc;
 
-	struct txx9dmac_dev *ddev = (struct txx9dmac_dev *)data;
+	struct txx9dmac_dev *ddev = from_tasklet(ddev, t, tasklet);
 	u32 mcr;
 	int i;
 
@@ -1113,8 +1113,7 @@ static int __init txx9dmac_chan_probe(struct platform_device *pdev)
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0)
 			return irq;
-		tasklet_init(&dc->tasklet, txx9dmac_chan_tasklet,
-				(unsigned long)dc);
+		tasklet_setup(&dc->tasklet, txx9dmac_chan_tasklet);
 		dc->irq = irq;
 		err = devm_request_irq(&pdev->dev, dc->irq,
 			txx9dmac_chan_interrupt, 0, dev_name(&pdev->dev), dc);
@@ -1200,8 +1199,7 @@ static int __init txx9dmac_probe(struct platform_device *pdev)
 
 	ddev->irq = platform_get_irq(pdev, 0);
 	if (ddev->irq >= 0) {
-		tasklet_init(&ddev->tasklet, txx9dmac_tasklet,
-				(unsigned long)ddev);
+		tasklet_setup(&ddev->tasklet, txx9dmac_tasklet);
 		err = devm_request_irq(&pdev->dev, ddev->irq,
 			txx9dmac_interrupt, 0, dev_name(&pdev->dev), ddev);
 		if (err)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
