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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B493C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:27:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B8122063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fl/0iDTu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYFh+2d+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B8122063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KqyZbot7nnFQnWMMjwHOl1rOReSu+tXG6B+jolp/oo=; b=Fl/0iDTuStoYv84sk80gra0G5F
	WoieVuQFn4GcF36hwbR9iGaWU2eZ0pFPYBe7u+X4BIji1OidaAcGmz1UW2uTy0IRdgvlcxQU+YQwT
	Y27qlr2/YAFcPpLiybJ05VS3RpVHGyMHTButL2lCzKZErWwpAw8xzyvQTCCoeltDIhJx2YIrHE8d3
	k1zxm/vHgQe1T2ky2D7ytcH5b7uzH5g9J2Da+XyDN0ucQzGpDfcjHnNit9P/Fr5LNkt82DDD9XvAb
	3rkwA1j6Mf/OyvjF8fSj5aZmR/XQgreFXeNxP/mXPT2LC6oMvdIOxrtywOHFX6iGoBvqOXaC1YRW5
	UIYapynA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aU7-000346-8V; Mon, 17 Aug 2020 08:27:15 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aMQ-0007hc-Ov; Mon, 17 Aug 2020 08:19:35 +0000
Received: by mail-pg1-x541.google.com with SMTP id g33so7759417pgb.4;
 Mon, 17 Aug 2020 01:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jWR4tpYKdIgwTfTifXGcZkODpDZhHIDKqvJr9MK44Qo=;
 b=OYFh+2d+PvKPM1X1rs+IA+8SX7qx1z1ncQwibPS2FwYo+kTpxsmxlZE9XxbUtNm+tv
 AtBfUUth4VbOKdd2rod3vSx5BrzO6OfIsUX4eNFbo63ls/Un+mZgFuOI9zrd5PSmi0mW
 H16w2TyJV7ro8jO/jGh4t4forYJtnlH6hrEdr4/bfLh3c7tlqcu7pV8ykwMCV1ujbk1I
 /vRGMPVCJk6q71CRLDZ896xcZRAOaVw4MLpDpGh/5Rfo8xdzG+956Z1u+uG0lqEebRuf
 G+wjGGZFdWy/VHbmmvR2INPNPdeEJO0RrFN0fVosHIqm+ZdcpzHMVsoAyb+OwlMi1/EG
 vONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jWR4tpYKdIgwTfTifXGcZkODpDZhHIDKqvJr9MK44Qo=;
 b=TNaE1xL9z9sIJv1dv08x0QGpBR6GB5IomIQcUnodgpvpgxoMlFFa3uYzZ9ddJcTzON
 vSMc1rB5U+gPzW16oPBt5NeCpla7ChhjKp8uWOB1yggOXkrh91ef1HulOAjtwFxLDUiV
 j3Ce5o+0P8rXvscn4h5nxJXLp9a3pz4GizwwRHccNNLcLDxPgjCO0Pxkytq+B2CqKL/p
 a6QwGlOpkUwpZbwo6B/xvyPRNL6pFtJZEvUTXSO9ns4XaWLpcLWd2xlae8Oe/K1KvYep
 vANPIr8Z1ZdQH6XhOUdREvgUB4Dw+pq/WZvM81TT2OqvXHZFKvnBcY1QRLIXzk4FoZhd
 Vqhg==
X-Gm-Message-State: AOAM533yUXiAV8i93X8jiVfXOeRMuzTns22wMpofXj4D6eugEE/uWJmd
 xXprJAd65dtpOzZ+F9UOvNo=
X-Google-Smtp-Source: ABdhPJzQZQ8jCbyqROLlM27Ni7dlU0vjA+PPip0ZkkUZjaj/KtF/PrsiQ7sLHmgguZb6B+CXPAkl7w==
X-Received: by 2002:a63:fa09:: with SMTP id y9mr9461516pgh.0.1597652356434;
 Mon, 17 Aug 2020 01:19:16 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:19:15 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 09/35] dma: ioat: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:47:00 +0530
Message-Id: <20200817081726.20213-10-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041918_975521_BDA9753F 
X-CRM114-Status: GOOD (  15.06  )
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
 drivers/dma/ioat/dma.c  | 6 +++---
 drivers/dma/ioat/dma.h  | 2 +-
 drivers/dma/ioat/init.c | 4 +---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index a814b200299b..bfcf67febfe6 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -165,7 +165,7 @@ void ioat_stop(struct ioatdma_chan *ioat_chan)
 	tasklet_kill(&ioat_chan->cleanup_task);
 
 	/* final cleanup now that everything is quiesced and can't re-arm */
-	ioat_cleanup_event((unsigned long)&ioat_chan->dma_chan);
+	ioat_cleanup_event(&ioat_chan->cleanup_task);
 }
 
 static void __ioat_issue_pending(struct ioatdma_chan *ioat_chan)
@@ -690,9 +690,9 @@ static void ioat_cleanup(struct ioatdma_chan *ioat_chan)
 	spin_unlock_bh(&ioat_chan->cleanup_lock);
 }
 
-void ioat_cleanup_event(unsigned long data)
+void ioat_cleanup_event(struct tasklet_struct *t)
 {
-	struct ioatdma_chan *ioat_chan = to_ioat_chan((void *)data);
+	struct ioatdma_chan *ioat_chan = from_tasklet(ioat_chan, t, cleanup_task);
 
 	ioat_cleanup(ioat_chan);
 	if (!test_bit(IOAT_RUN, &ioat_chan->state))
diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
index f7f31fdf14cf..140cfe3782fb 100644
--- a/drivers/dma/ioat/dma.h
+++ b/drivers/dma/ioat/dma.h
@@ -393,7 +393,7 @@ int ioat_reset_hw(struct ioatdma_chan *ioat_chan);
 enum dma_status
 ioat_tx_status(struct dma_chan *c, dma_cookie_t cookie,
 		struct dma_tx_state *txstate);
-void ioat_cleanup_event(unsigned long data);
+void ioat_cleanup_event(struct tasklet_struct *t);
 void ioat_timer_event(struct timer_list *t);
 int ioat_check_space_lock(struct ioatdma_chan *ioat_chan, int num_descs);
 void ioat_issue_pending(struct dma_chan *chan);
diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index 8a53f5c96b16..191b59279007 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -767,8 +767,6 @@ ioat_init_channel(struct ioatdma_device *ioat_dma,
 		  struct ioatdma_chan *ioat_chan, int idx)
 {
 	struct dma_device *dma = &ioat_dma->dma_dev;
-	struct dma_chan *c = &ioat_chan->dma_chan;
-	unsigned long data = (unsigned long) c;
 
 	ioat_chan->ioat_dma = ioat_dma;
 	ioat_chan->reg_base = ioat_dma->reg_base + (0x80 * (idx + 1));
@@ -778,7 +776,7 @@ ioat_init_channel(struct ioatdma_device *ioat_dma,
 	list_add_tail(&ioat_chan->dma_chan.device_node, &dma->channels);
 	ioat_dma->idx[idx] = ioat_chan;
 	timer_setup(&ioat_chan->timer, ioat_timer_event, 0);
-	tasklet_init(&ioat_chan->cleanup_task, ioat_cleanup_event, data);
+	tasklet_setup(&ioat_chan->cleanup_task, ioat_cleanup_event);
 }
 
 #define IOAT_NUM_SRC_TEST 6 /* must be <= 8 */
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
