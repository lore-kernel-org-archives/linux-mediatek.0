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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926A1C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:31:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34EAD2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:31:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lhuz3I27";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgwVbNVc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34EAD2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gi0InASOLA1Ib4GL0kxjfn/cvT6hNJs3X5KfVkMuF4=; b=lhuz3I27dFLmXTxCmY9WDrS+W1
	T6iwuWELp8KygsrU/2Xez+AffQ1k9Jh2vReZ8y9q3tywU0uSZ+5qQkaXPfDp3r/sK8oaH5XuXhoh1
	R58hva84uNLidTTLRIUVgn456t0sIioiTn+c0YiKblCKMYACGEcy+pmXll8WrTpFe9Uz9mcX/jKoS
	EvC9UWWm1AWbMiNd3L2A3yysJH6wmd+2Qe9zal7/uTdLKmclB8TFPlCf6PSspsIg2CKrpiY/IS7GG
	ptp1uRNwNiZdSnL7rajHXtOITKzvW4HzxkZtXwYq7kbj3zETWlHvDIJ8GXexX81vKDzT/UzcQQmgy
	i8Vu/JZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aYD-0005XD-Sv; Mon, 17 Aug 2020 08:31:29 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aN3-00081Y-65; Mon, 17 Aug 2020 08:20:07 +0000
Received: by mail-pf1-x441.google.com with SMTP id k18so7853278pfp.7;
 Mon, 17 Aug 2020 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LXAHZjWOCXqZNRFnEVorFd32pcE4Uer+STR5X7m1T40=;
 b=IgwVbNVcSBmDm38yYmUrvEmMnA/dM433v1XDeqYJgH3tqNNAT/iGYm+ZViMaYaBo90
 pApwy+Tu2y78SX96Tga4eXY8SM5KE8XPOZftkkdfMgUpjwInxrimrBUvqiYyWmmU29Ta
 dxlTZJ3UuRUIRAdpX6GXydlmBzIIeRbVuE6v1MHEuTUEFUe3LmOUfI+ZusiLGIk2ivl7
 8lrFn4miWWTHAfZpxTm5A4RTgtC5I3iZAxZVgSjFwPm/hIueFW/+tscAApV1Khs0Lc9F
 CgT9TQWa0eimAOI3NSDZD3viKz+1dycrei3FqN9ipQryGDVM+I5TEliaMkGRLmiPKljz
 o+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LXAHZjWOCXqZNRFnEVorFd32pcE4Uer+STR5X7m1T40=;
 b=YBZfgcI3JxDrMLpl/K9amk0P4jNjAnvprwnWj5bo6jh1pL9E6igg1waqIYI02nAuXq
 k0ouuOQDz9BRDj3oHMrMWkTWhwIBR6zefSlOwaqY1i+9Jyvjml7GcPD5RSoTX65gp1wa
 9lgr2nhIBi4HTt8QbJGCvvxFOHp1uxrbMv2Jx6BbRGlABT/Vxi3M4VG586Y2Xb3YdKxm
 xOxEpkmKlWBNOUoi+irQVuouq8s6AQNSvmTP4bpaPObypq/8wdralt52HuHOTx/DhiO4
 VC6Zu4UyabnUYC5qJDXynrWu61VhEbu0iLzVyfyjuAHb/7tahSBO19TjhN5kw1Ti1CSG
 JWFA==
X-Gm-Message-State: AOAM532jIUgIgLd59DDZ9yzAbkFhSrkAofglQnuh695o3g2xPcOsDWyV
 Jq1l1Evc7H9n9jo3G6IitZaOgMUE+xrmKA==
X-Google-Smtp-Source: ABdhPJzuT/8j9+SjbGA9NES+f4fyeu03MlTNL30utMUb/RKtQQp9CVCHKYWxptOH5Pi8FhszEQdMZw==
X-Received: by 2002:aa7:9813:: with SMTP id e19mr10555426pfl.285.1597652394480; 
 Mon, 17 Aug 2020 01:19:54 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:19:54 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 13/35] dma: mediatek: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:04 +0530
Message-Id: <20200817081726.20213-14-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041957_665245_0E6CE10A 
X-CRM114-Status: GOOD (  13.74  )
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
 drivers/dma/mediatek/mtk-cqdma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 6bf838e63be1..41ef9f15d3d5 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -356,9 +356,9 @@ static struct mtk_cqdma_vdesc
 	return ret;
 }
 
-static void mtk_cqdma_tasklet_cb(unsigned long data)
+static void mtk_cqdma_tasklet_cb(struct tasklet_struct *t)
 {
-	struct mtk_cqdma_pchan *pc = (struct mtk_cqdma_pchan *)data;
+	struct mtk_cqdma_pchan *pc = from_tasklet(pc, t, tasklet);
 	struct mtk_cqdma_vdesc *cvd = NULL;
 	unsigned long flags;
 
@@ -878,8 +878,7 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 
 	/* initialize tasklet for each PC */
 	for (i = 0; i < cqdma->dma_channels; ++i)
-		tasklet_init(&cqdma->pc[i]->tasklet, mtk_cqdma_tasklet_cb,
-			     (unsigned long)cqdma->pc[i]);
+		tasklet_setup(&cqdma->pc[i]->tasklet, mtk_cqdma_tasklet_cb);
 
 	dev_info(&pdev->dev, "MediaTek CQDMA driver registered\n");
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
