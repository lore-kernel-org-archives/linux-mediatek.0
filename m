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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3489C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:24:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DAD620658
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:24:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2WnHplYC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6ylsGUa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DAD620658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5agJhhhjD98XAb9fOSnUZStxKpWchDktzuVTGhx99o=; b=2WnHplYChcmJMac4qDPpJCQSlJ
	BoitolFrqXtjg7Cm2/dVgVZba9Wf29XsxnVGeQhaSC+NGB43ZSBzMDVLZBjPlNa+dho46EK6ZByT1
	fk1qbry4Z7JAXQiPx4bErqtggz/sk0WA1rQoFJ/crdcwT2WXzp9j+T6mVWTCnKNb/8QC8Gh85vBKP
	2khX5nG954jECHG/TZ6vdkYdtDShEVsNta/3gz4F1TzuCkWUn8o7cv8lDYsoxuNN3ZNB6rjhwIdfC
	Cubh4QlqONFFhvTOrxFRCaAi+xubjGzs7TQwIGgOBr/XRM4Y2lenb5j/2ZLMu/JDEWkiCZF7Anema
	CdjyRI3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aRC-0001Yv-HD; Mon, 17 Aug 2020 08:24:15 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aLb-0007Hc-C8; Mon, 17 Aug 2020 08:18:29 +0000
Received: by mail-pl1-x642.google.com with SMTP id q19so7140845pll.0;
 Mon, 17 Aug 2020 01:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aYKSRTuJVIPdNCr61TO9wwSP37OM1E0JoVpfKCdbfwU=;
 b=I6ylsGUaMfCBojePfsAD++yD9Jyf7sQWTNHKgpA2bcqRyX9BAHEfxGWEM9QDDhOFO+
 1Aj/tmhFnG3KsGf6BolUWSjdZMlfyD2uX2lkAUA42sJHEQ0a9V7YMBisyFpNRtxCnbzp
 E6oGA/Z4/l5RNBrfBcvJB8Lc5UIEbrVPPtjo0Fw7DFonrQk5k1QAAiUXTN3N6DC07bC9
 0N3KKLv43BiFGLdhyP8Xcpkrx/H3MWkerEDcMpP9FrmM/hEu60Tv3negE3rEaX21brK1
 YafNNM8/AZprasmodUSRhhhcuX/BJraUe5FQ5kfZ90HsS2Cjda4MKIVjbS6boph9Y6ks
 /hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aYKSRTuJVIPdNCr61TO9wwSP37OM1E0JoVpfKCdbfwU=;
 b=k8ExAYssv31oEGnga2HGLfR0NfC8CmGQbthLFhd+fDqWsxZTHob1OMm1XLiW/tOhuX
 sPkV9lcDMg6zxtBdSEyGdXlFOAXwyp1vEX9jBFuZUtaZMNHjbeByZlsQirMMoD8uzj3d
 37XVqohXNOHdIoh28p5J7xfwkF3QFeWnUvHGVX1oqc8xtIZT4C5sYX500JKGLH8nSl+H
 c9l2h4pZZmCzA+C76wEtYUh2tRERuEdaEzpfeBnuXR0NXYw/7fFkL8UQPGVQlCJ6aR9c
 a4uU+/RJU54JTZMsB2dD3vxXMBVoyCipiEX1flpGdLlMRMtU4Vk2JKn74wVd5plNGqml
 Ju9g==
X-Gm-Message-State: AOAM532J9wtyelterogmi1Ns5RqTybqjUqK6YfcfQhmcRF1rVjzDHazI
 4U2voOt8Xb50X4eka4u2ok4=
X-Google-Smtp-Source: ABdhPJypVY66AJT3+h/SfRYb56ToGyJfJnM+NnJ6R5f1ym1n7hF8zV0Xux1hjYWDHRbRMpD1vPqebw==
X-Received: by 2002:a17:90b:784:: with SMTP id
 l4mr11034976pjz.96.1597652305207; 
 Mon, 17 Aug 2020 01:18:25 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:18:24 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 04/35] dma: coh901318: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:46:55 +0530
Message-Id: <20200817081726.20213-5-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041827_719289_AC9369D9 
X-CRM114-Status: GOOD (  13.39  )
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
 drivers/dma/coh901318.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
index 1092d4ce723e..95b9b2f5358e 100644
--- a/drivers/dma/coh901318.c
+++ b/drivers/dma/coh901318.c
@@ -1868,9 +1868,9 @@ static struct coh901318_desc *coh901318_queue_start(struct coh901318_chan *cohc)
  * This tasklet is called from the interrupt handler to
  * handle each descriptor (DMA job) that is sent to a channel.
  */
-static void dma_tasklet(unsigned long data)
+static void dma_tasklet(struct tasklet_struct *t)
 {
-	struct coh901318_chan *cohc = (struct coh901318_chan *) data;
+	struct coh901318_chan *cohc = from_tasklet(cohc, t, tasklet);
 	struct coh901318_desc *cohd_fin;
 	unsigned long flags;
 	struct dmaengine_desc_callback cb;
@@ -2615,8 +2615,7 @@ static void coh901318_base_init(struct dma_device *dma, const int *pick_chans,
 			INIT_LIST_HEAD(&cohc->active);
 			INIT_LIST_HEAD(&cohc->queue);
 
-			tasklet_init(&cohc->tasklet, dma_tasklet,
-				     (unsigned long) cohc);
+			tasklet_setup(&cohc->tasklet, dma_tasklet);
 
 			list_add_tail(&cohc->chan.device_node,
 				      &dma->channels);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
