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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AD8C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:31:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA79C20758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:31:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I0QUCxL5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv4j3ZnQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA79C20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMaFPOWzP9bbAPUVRW+FPtL4NhUwuArBK7nndzGkPTw=; b=I0QUCxL5cMHfWvvkbygqbvPqhQ
	qzWY+6Hu4Eo6O4Y73g23u8qd25SzKmssE77+3ZkRzbxnbZNTTfBQMIX+IiGFESZa6kM42aVn0FKOK
	Ol8kWtfafilfT35bmur/Z2URt5W58wqR8fYJLR7poAWCzYDjbdSdMXLaYp4fTQEQCCGz/UYHv3x6F
	hJn6aoxP4rsLCcd8ZXK0J0+SGB8r25wSbdURTBljv40Vwfoq8NU0q9JStIwZtY/u0yfOxNDvc0qaw
	rxYjT7XySmBVCqXIEMvpuPfbgd3/UiFPEY7qL5gH2za8lPTprbL2hSV5aMOc+pMVV8wnbcdgNOzNQ
	TYYpZKHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aYJ-0005aJ-Vo; Mon, 17 Aug 2020 08:31:36 +0000
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aMv-0007wX-RF; Mon, 17 Aug 2020 08:20:03 +0000
Received: by mail-pf1-f193.google.com with SMTP id x25so7871308pff.4;
 Mon, 17 Aug 2020 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C5F0nnOTh5Z2C3fK8ewqMRIq3Z/HzN1bhDJR1BeVHS8=;
 b=Zv4j3ZnQEwlXKTmQMcr9yGw2Wg9syVGPoOFVEo88aRFfTusau3D/jPmgBPE/UoEk7W
 6hVOMVLjy3IjuqSmajCe4ICoCGHzdbeVf7neS0HcR2YvB15zP0WtFq0EwGdBnKlAumKK
 pm4gyCCSGQB/BieYkhoO84f8+D2FscxxVCgUc6aTVRfHCkccWQAFyh99LK4NhB4I+ZQy
 5lM9ffV8CDoqkPhd7hdzLsDaMzhLwQU/QxUNq87pEqaXMMxpEEWlxDhCCQluK5XBiIpg
 8oLWvIoJkd8CK2/7WfDRfvxHktayMAXa1HOW8Vg+seOGKtokTogysyzUUm3IyE76OF9f
 RuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C5F0nnOTh5Z2C3fK8ewqMRIq3Z/HzN1bhDJR1BeVHS8=;
 b=dhMuoJgtqrKTdMUKXolxzlulzSQ/041KpnZuGBAFmyB5Is+coBBwsSLaajdMsAf22M
 TqJD0/F1SiTGZ0nc6tbnI4JJlYfozA9N57E6d5idq+XsphrU4zlEr2PtkuHHsJ+zJrhK
 zd9nbZA+zOHkI2QRyqxG1m50+qKwaO7UW++JSqvIzyg0PS8asEa0TschUsmKJ2vrfixW
 JaFSxwtwSMXyr14P4z2oAbnjOUJ2nkutJMSg/K2o8WKN9ph3w8evr/ekUPjh2HQcRFG2
 e2xl3P5Sh8rZ6dRVSa06k3v28XyArd60Wzxgxdvo3U5+Z+tkC0G9WyQrxF7yYxW2RAzz
 v7UQ==
X-Gm-Message-State: AOAM532sOg/nTnUqkoOF1hwrq2AxptwJDP0sOBcXRONRbjUwCmBYj0Yv
 CB4sAn8IHrCnLLrvw0LnIyI=
X-Google-Smtp-Source: ABdhPJwNz0WCRvYD0EzUq3bpg+5UrV7v8gJCanPc+Hu+vgv/oJ4AIpPuVHmHeKtfyGccvGps8amOKg==
X-Received: by 2002:a63:fc4b:: with SMTP id r11mr9016761pgk.342.1597652385686; 
 Mon, 17 Aug 2020 01:19:45 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:19:45 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 12/35] dma: k3dma: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:47:03 +0530
Message-Id: <20200817081726.20213-13-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041949_951806_653E8573 
X-CRM114-Status: GOOD (  13.05  )
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
 drivers/dma/k3dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index c5c1aa0dcaed..f609a84c493c 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -297,9 +297,9 @@ static int k3_dma_start_txd(struct k3_dma_chan *c)
 	return -EAGAIN;
 }
 
-static void k3_dma_tasklet(unsigned long arg)
+static void k3_dma_tasklet(struct tasklet_struct *t)
 {
-	struct k3_dma_dev *d = (struct k3_dma_dev *)arg;
+	struct k3_dma_dev *d = from_tasklet(d, t, task);
 	struct k3_dma_phy *p;
 	struct k3_dma_chan *c, *cn;
 	unsigned pch, pch_alloc = 0;
@@ -962,7 +962,7 @@ static int k3_dma_probe(struct platform_device *op)
 
 	spin_lock_init(&d->lock);
 	INIT_LIST_HEAD(&d->chan_pending);
-	tasklet_init(&d->task, k3_dma_tasklet, (unsigned long)d);
+	tasklet_setup(&d->task, k3_dma_tasklet);
 	platform_set_drvdata(op, d);
 	dev_info(&op->dev, "initialized\n");
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
