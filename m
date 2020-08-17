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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F68C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:40:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2014F2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t6WzVIrB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWiqS0Nj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2014F2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqVYnf3mHvHAwjfH46gMaMJTWUbfHgqmVHlp+cjl16g=; b=t6WzVIrBaSNYlkS/KVFYh564Z2
	02lkvpuLE+h8vAcxVnLVQ5Q0liTVWioXkmnTp7fUbjL4gT9WEWFgQ+GmDpEeGGwhSRlspA+vJ3wth
	J8vK1BoPLN1D4xqSU+0rAJ8/YLQCTgre2Zx13uguqqSmWbUqnieNXFnvP/8BQU4vPiZGJW0R01vcM
	N2N/lUdDVA3ocW3VwPwZbEWopBRfwKjkS1l3ozD47EXNu4GzWvJM+lX7soK/b0Xj26XuROudVXgZ6
	Ii79LqQKTsGwCSWztpeJGO8HBLGwCmO32qFE5TPtYJjI/XH2WR501/m91K+lSi9082MqAqtsdm3Lm
	XAT0tAhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7agb-0001Wd-6w; Mon, 17 Aug 2020 08:40:09 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aPt-0000wU-SS; Mon, 17 Aug 2020 08:23:07 +0000
Received: by mail-pf1-x441.google.com with SMTP id m71so7876166pfd.1;
 Mon, 17 Aug 2020 01:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=K7Q+JLR8+W/rWkKJtwswByUgPhPynE2pfcWEkcTUtiM=;
 b=RWiqS0NjR5pWuZhqmNoy+E4MnkeCIRO+ngM8BUOuKzwEHQm28K+TNu8Ql/pRFZ6o+a
 ig71ooeNimb8NNb5hxmNUoHadcZFXlatv8afTGeclF7DVGLEl80zM/xxnAVWDzsf+dFk
 Rs+OzW2zsNgWc8xXYp+nyR4jVXwg/5yC22ILxI3bR8cwHvUfWrpmq8TL2qs0YLF03qXk
 YgVJHokzq0jyIA0G8zVPl/GYmss8dGHDb6V6PyDjOE6w3wlutcco45Ds1cqfAwtbLiUc
 zdRxDLHzVTLNT3NpC2QUjzqte7NvzHvs1y6EcCXkzJbVcBfGlphRWACjnn+s6JAnsYjO
 l9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=K7Q+JLR8+W/rWkKJtwswByUgPhPynE2pfcWEkcTUtiM=;
 b=NA+6M/TQmu/5J1Rbq2idjHJEFVY6kAzk09pm4elEhyN6Ufmj0CtmQD7zy4Qi98Y1M7
 cUkUpfYqVMidbvHHkdlgIJXX+QUNHdIkGnoP6doKcham/BVhtM8bd9rjctC42p82ba7Y
 VAB2MG1mpNKFysu+Ly/+H/PkvTVZpUYAd1O/USJwn3j24DNEX8Wroh31OY8MDwYdFDwj
 deRe8yL8dEeqmd3pbluF9cd1lrxeitjUg646Lpi3WJ3Ek/uuumQBlnVBGPc2gwTmT/C7
 3fn+hyQReO3wVULT6Qe6TCrSH9CxXoN9os3Mgr//etAx4itdEf0CBQ+gL7C8ERK8ziFd
 aMFw==
X-Gm-Message-State: AOAM532eJH0oAKZVip+cyHgiApp90aVqZORJ2zYjEV7+tqtnBRTzzEIe
 pyt8EZFdiODur6VgamCnfh4=
X-Google-Smtp-Source: ABdhPJwJDGhQfZ+pLbcNjt9w+RQvcAMUzKo2R1igy7gIEXDlsJaWZHPSR5xpse+9lSMXYCtYc+wF6g==
X-Received: by 2002:a63:4c57:: with SMTP id m23mr8909063pgl.77.1597652570727; 
 Mon, 17 Aug 2020 01:22:50 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:22:50 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 31/35] dma: xgene: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:47:22 +0530
Message-Id: <20200817081726.20213-32-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042254_123290_0B77A867 
X-CRM114-Status: GOOD (  12.70  )
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
 drivers/dma/xgene-dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 4f733d37a22e..3589b4ef50b8 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -975,9 +975,9 @@ static enum dma_status xgene_dma_tx_status(struct dma_chan *dchan,
 	return dma_cookie_status(dchan, cookie, txstate);
 }
 
-static void xgene_dma_tasklet_cb(unsigned long data)
+static void xgene_dma_tasklet_cb(struct tasklet_struct *t)
 {
-	struct xgene_dma_chan *chan = (struct xgene_dma_chan *)data;
+	struct xgene_dma_chan *chan = from_tasklet(chan, t, tasklet);
 
 	/* Run all cleanup for descriptors which have been completed */
 	xgene_dma_cleanup_descriptors(chan);
@@ -1539,8 +1539,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
 	INIT_LIST_HEAD(&chan->ld_pending);
 	INIT_LIST_HEAD(&chan->ld_running);
 	INIT_LIST_HEAD(&chan->ld_completed);
-	tasklet_init(&chan->tasklet, xgene_dma_tasklet_cb,
-		     (unsigned long)chan);
+	tasklet_setup(&chan->tasklet, xgene_dma_tasklet_cb);
 
 	chan->pending = 0;
 	chan->desc_pool = NULL;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
