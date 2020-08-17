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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617FAC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:26:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E4C21744
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NKlA2BIs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVYLm00p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E4C21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOLFRxtpkAfe3G5EuQo58Sir7E058ptWNz30BpOrHsY=; b=NKlA2BIsm8XjY5YvCFbQgciYNz
	xkjebBeML3cQOfDx5/nrCbDYBkn9RJEy98H19v5PxI8iAGqb6gy+ZZBmpTIZOqzmcWy9nG3FQnkcn
	VeUdyHHAgeJlw0Q73cCMsbkJz1HrQ9VG4iilg/lSIumApcpqK08FoXIz9yqC74ZR+xRUkZlEHtu2Q
	DsgWVEyuFxkyHNNDHbReKFvvxwte7qkIQq2eKnJX54LBkqHcm/AjZddtBKTebBED0kLU4T6eWKhEF
	4hBZEO87MKdlyb1cJgTAmEP0pboS6kjFii7Oa6R1f+EsX1m4Q5S0XggACiVa2gGIFwcM5aq01Ui5k
	aA6THdcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aTF-0002ZH-RW; Mon, 17 Aug 2020 08:26:21 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aM4-0007Wa-3x; Mon, 17 Aug 2020 08:19:00 +0000
Received: by mail-pj1-x1041.google.com with SMTP id f9so7331157pju.4;
 Mon, 17 Aug 2020 01:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=31As0TImtle4pJMBIPFKRSxatdRKcSvERFzrO8LgibE=;
 b=kVYLm00pzoz/kYADfRgu3biXEv4rb/ftLTz6v+Mm2Ug1uaoBSCJnXIC+O5/vlEqHEG
 SoN3MeizX3SsTGtWi6lLT9/XOUnxZn/8BU5hyYewUWLtJfBx1RGXKoxz0pPr7dx+pghg
 M69hQ46jFRp9eVSk7AR9qrZQAp0f37Kc+9Kk24UnbEqn+oajrWQG3MApns/YsJSZV7qC
 siz5ss3nuBGRrY6Mk/RvwVMbxpPKrWRPH5w8tLvplV3bADjPVgOmly7i4G9W49hfdmb5
 /Y17AISDHxF/rZ0dkCDnZKnr/Mbd4cPQ5DApM8nSF4Yo0pFYNuJi3oYRNJIU6q03IpKG
 IKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=31As0TImtle4pJMBIPFKRSxatdRKcSvERFzrO8LgibE=;
 b=ZPVqMJ/GBbSpBG9duT19GLgD9NozFj88MP+Z74lFjCL2iaIOpqavO0lrrCDpw61nb6
 hc9YH4na1UKAEJbX3CkFIDN5xXlsPV+ZBC43ZYPPm89/3w6LTeN1+NqRP2i4IjzcaD3m
 hlILIluw2c7Zwtmscznuj1HJEmZ51N6x+iNNXDgs9Vqj3iFH65r+rYG2vtTDD0IiUWIS
 I3Irqgblw6lIExaPVuadWm3eUVQOTNre8TD03lRNwlmN0S98n2NNMHg0RSDwnuOeTzBq
 z5QWF9Y1eR2okGOZAq0HWI72i0zCfI0/VGIesYUW0dRUWiarckjEbtVA+AYz5qAB/f39
 bNnw==
X-Gm-Message-State: AOAM531JRutQvwVZpexkQOWHFUQmHqIgPDXoQlpTQPhbARKhdyYCKpaV
 uTgVY9b9GsmP76OOJbuN5SA=
X-Google-Smtp-Source: ABdhPJwP0zc4e3EnKYz6OndviVPG8NIAeh1Tmemt35ITvR7gj8KaKxs7FZF0RqsD/VedpkC323b1fw==
X-Received: by 2002:a17:902:e905:: with SMTP id
 k5mr9889863pld.342.1597652333981; 
 Mon, 17 Aug 2020 01:18:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:18:53 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 07/35] dma: fsl: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:46:58 +0530
Message-Id: <20200817081726.20213-8-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041856_303673_F1EB42BA 
X-CRM114-Status: GOOD (  14.27  )
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
 drivers/dma/fsl_raid.c | 6 +++---
 drivers/dma/fsldma.c   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 493dc6c59d1d..26764bf2fc6d 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -154,9 +154,9 @@ static void fsl_re_cleanup_descs(struct fsl_re_chan *re_chan)
 	fsl_re_issue_pending(&re_chan->chan);
 }
 
-static void fsl_re_dequeue(unsigned long data)
+static void fsl_re_dequeue(struct tasklet_struct *t)
 {
-	struct fsl_re_chan *re_chan;
+	struct fsl_re_chan *re_chan from_tasklet(re_chan, t, irqtask);
 	struct fsl_re_desc *desc, *_desc;
 	struct fsl_re_hw_desc *hwdesc;
 	unsigned long flags;
@@ -671,7 +671,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	snprintf(chan->name, sizeof(chan->name), "re_jr%02d", q);
 
 	chandev = &chan_ofdev->dev;
-	tasklet_init(&chan->irqtask, fsl_re_dequeue, (unsigned long)chandev);
+	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
 
 	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
 	if (ret) {
diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index ad72b3f42ffa..3ce9cf3d62f5 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -976,9 +976,9 @@ static irqreturn_t fsldma_chan_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void dma_do_tasklet(unsigned long data)
+static void dma_do_tasklet(struct tasklet_struct *t)
 {
-	struct fsldma_chan *chan = (struct fsldma_chan *)data;
+	struct fsldma_chan *chan = from_tasklet(chan, t, tasklet);
 
 	chan_dbg(chan, "tasklet entry\n");
 
@@ -1151,7 +1151,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	}
 
 	fdev->chan[chan->id] = chan;
-	tasklet_init(&chan->tasklet, dma_do_tasklet, (unsigned long)chan);
+	tasklet_setup(&chan->tasklet, dma_do_tasklet);
 	snprintf(chan->name, sizeof(chan->name), "chan%d", chan->id);
 
 	/* Initialize the channel */
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
