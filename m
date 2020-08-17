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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69109C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:33:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2793A20758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:33:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xL655fst";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHXohDxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2793A20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7jw1jIXEeUPhZlAc6/KowGEHm83AXLvxdJWZtk27YU=; b=xL655fstDLqvXM6RfOKPmi+8tv
	JwGg9kiOy0FBlwFLEYdvSTcvzCgW90UFeFNz8D6fPBQNWkEyYyj8MmOUHskSq8NwYzZiztTszAKA7
	fZyql3Dq4Q1wgj3DLmbilIJbyGVCZHWcj+CS7Sgh4KDJQcEUocqHkhe2tDu26beCP0fA1KJCDQ34q
	bHjel6DgZ0Mn1/vIbGr0ghBnikwG8VPrWAHHjBlfkl8gdWFhgkcMM7l+kjU7vNRXHLtOOgjuoV2Qv
	frXHWTyURG+chKNocTK/5llsJZQE9EkqQ8VVkH2s95Mp4UWwQBar9BIaA+byz0JxtJ9KwQ07lkZ92
	K705Qdbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aa5-0006Um-Mq; Mon, 17 Aug 2020 08:33:25 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aNc-0008FR-F7; Mon, 17 Aug 2020 08:20:34 +0000
Received: by mail-pj1-x1041.google.com with SMTP id mw10so7341374pjb.2;
 Mon, 17 Aug 2020 01:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zY00DfBPk2FI3CMNWn52CBXvi0OzneRvuEaVydUrqYM=;
 b=JHXohDxeJ/Dh1zXnUGOIBhnD05rLIOt0WPhf5lY0Z1SOp2iutpPlMhSNVdP842Ujnn
 MDU3wcpMFCC3NAPRruONdOxR58Iu4lTi1Tt+xUudFOxXyNWG+U2tONhNCyIoxOOrbFKU
 2oIt00L630r9KMmiXtkYWvRJNRJfF62nHnvc6hmqFqtPMZCIjpjBxma0W4k9Me3G2iNm
 kelj92TPaz96JgekkO5nuv2nmqBA2LGFDNJFNou0XvCWKbUiJOfNfwsXBA6Y43f3ThAQ
 Ju7n8KKdnB/MnHns8wOt4ve7rjgpzVpfXJOmZr2gp1ui3RHfoohqHG48mxAtJKPC83tb
 CZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zY00DfBPk2FI3CMNWn52CBXvi0OzneRvuEaVydUrqYM=;
 b=iZ9ypL+ElrSz4RR+IdfCVqyxXSQYkTfTXjDInt+Y8uOTq90n9nuTcSEK+QN4YpDWdv
 MDKrqr+D8afUX/6htVvKhrycRXibZ0o+v6o7q6Q2HNV5swpFQVEMXntCiS7/sWsXV4Yu
 SSWuMxYJSzYk33tPxQ9BfgmdFE6+sMmRE9GVtO1i8xcI3lau9YEYvzvP5HzsVPH9kteB
 oEGTI7uFtKNn6nesHkgm3jocuWYynXb86aSFNTMXfQ8oCmPNW1EZ0Uj1xYt2Mg1jKmct
 KcgBiHX65a4k977Ea0RjxMHJnztmI14tQZRsdQ+4+QA1IS0qfa6++CYYgpxCCPw2w1vm
 rVPg==
X-Gm-Message-State: AOAM531iLO28RObVA871HIumscCm9ekgVqohQstYZa98/Em3/MQmCJo2
 xGUCKsECp6tw7HWvFvfv7+c=
X-Google-Smtp-Source: ABdhPJy9hNIs3sa3AQpSygkE4NBuQaTMYIQe8TcPYBT2GBobmrg/Uht24FGujnLWHAiWPhcMsHqZ2Q==
X-Received: by 2002:a17:90a:dc06:: with SMTP id
 i6mr11151231pjv.161.1597652429423; 
 Mon, 17 Aug 2020 01:20:29 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:20:28 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 16/35] dma: mv_xor: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:07 +0530
Message-Id: <20200817081726.20213-17-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042032_693529_74DABAD2 
X-CRM114-Status: GOOD (  14.47  )
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
 drivers/dma/mv_xor.c    | 7 +++----
 drivers/dma/mv_xor_v2.c | 8 ++++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 0ac8e7b34e12..00cd1335eeba 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -336,9 +336,9 @@ static void mv_chan_slot_cleanup(struct mv_xor_chan *mv_chan)
 		mv_chan->dmachan.completed_cookie = cookie;
 }
 
-static void mv_xor_tasklet(unsigned long data)
+static void mv_xor_tasklet(struct tasklet_struct *t)
 {
-	struct mv_xor_chan *chan = (struct mv_xor_chan *) data;
+	struct mv_xor_chan *chan = from_tasklet(chan, t, irq_tasklet);
 
 	spin_lock(&chan->lock);
 	mv_chan_slot_cleanup(chan);
@@ -1097,8 +1097,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
 
 	mv_chan->mmr_base = xordev->xor_base;
 	mv_chan->mmr_high_base = xordev->xor_high_base;
-	tasklet_init(&mv_chan->irq_tasklet, mv_xor_tasklet, (unsigned long)
-		     mv_chan);
+	tasklet_setup(&mv_chan->irq_tasklet, mv_xor_tasklet);
 
 	/* clear errors before enabling interrupts */
 	mv_chan_clear_err_status(mv_chan);
diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
index 9225f08dfee9..2753a6b916f6 100644
--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -553,9 +553,10 @@ int mv_xor_v2_get_pending_params(struct mv_xor_v2_device *xor_dev,
 /*
  * handle the descriptors after HW process
  */
-static void mv_xor_v2_tasklet(unsigned long data)
+static void mv_xor_v2_tasklet(struct tasklet_struct *t)
 {
-	struct mv_xor_v2_device *xor_dev = (struct mv_xor_v2_device *) data;
+	struct mv_xor_v2_device *xor_dev = from_tasklet(xor_dev, t,
+							irq_tasklet);
 	int pending_ptr, num_of_pending, i;
 	struct mv_xor_v2_sw_desc *next_pending_sw_desc = NULL;
 
@@ -780,8 +781,7 @@ static int mv_xor_v2_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_msi_irqs;
 
-	tasklet_init(&xor_dev->irq_tasklet, mv_xor_v2_tasklet,
-		     (unsigned long) xor_dev);
+	tasklet_setup(&xor_dev->irq_tasklet, mv_xor_v2_tasklet);
 
 	xor_dev->desc_size = mv_xor_v2_set_desc_size(xor_dev);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
