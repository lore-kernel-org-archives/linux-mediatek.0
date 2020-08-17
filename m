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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6F4C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:43:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB412072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:43:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="skDvUebl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6/1sUEY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB412072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zzg1n3qBMucqSgt8yiaCXrFC7jgMkcjupiOu3h8hQ4=; b=skDvUeblVwKWrurXlkGOy8Pw2G
	bz3goFyOTlQn6kGL0qsBcFB16fwLmiDiAxkgHY95ApFIV15JjI4UoTudkJ4qsfAzbQztMoe1eAEFh
	yfiTUfevARMOaRanAlA4CYfzPkv8ykpcANsMrqNaEW321axXkIjq4FPfrWjDhtQAO9pPX1LNKnmzk
	0jXLnrlkn5+PVIBsvcCecvA7FvffmYTo6A/iRBuYhtvEfCT3by9ppNuoVRH8A3vca1GTWUKZzeD4z
	f1Uk1/FQKEbJceHUaCGY7uO5pau96Fwl8fHRVC8DFY448bEnfA3EwCgOxxP/D5fe7pc3+YG4xa7fE
	NDoM5jTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ajN-0002xR-EN; Mon, 17 Aug 2020 08:43:01 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aQQ-0001Ch-Jn; Mon, 17 Aug 2020 08:23:48 +0000
Received: by mail-pg1-x541.google.com with SMTP id o5so7772676pgb.2;
 Mon, 17 Aug 2020 01:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FY/yCtkR8zuQxnB1ct+rZA02HMp31w5fOwHETAQ8JTM=;
 b=V6/1sUEYrVGxUbYI5Mw0RPVY2l1DNf9AoBECR8rJv2FS5zpCQ4vRaGm3Fg3pj0EWMs
 ICd3A9AIogbTBN5xCLrvRE5XzkjMP/8069uNKQxhxmnjMaIZgycsLiFa7QsQpNyn7uoD
 JY/v3ZlyjbcMD7nOpsqwN7V9LxYfpo+e9jGCGGXB1yMrZPjCZFFH0A+wtxceSwYSPlYy
 gg5rNMQWHmTaRWDNmsmwqSFuWgvJzPFkDAVW0kFfXBKMw2Dbj0owdE6nJR6/N3abx/Tf
 fZiKxpIrNr0c1ECdQJgRN66qOVRjrqsxAOW5BbmpeuYHhLb1v99+tEvslnWKYePr7n/+
 Z9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FY/yCtkR8zuQxnB1ct+rZA02HMp31w5fOwHETAQ8JTM=;
 b=NCsgeOcjH8EBm+5o75zZ/UFHhVdKpBZ2vJJLYNu9pAjMIn32pWr+NikXmf0sIdO8HU
 srGabnMRDZFcAGIeaFNovZF3DkqsvPmHtnbmppLgrCtzAKCJIMGbeBGPlf/9xck9N3Km
 dZgSLgmtKxrmEd+0U8hr7y5/g5M3dstdWA/qxmXXEsPJx+DRNxoF+9WDS799ymQlp0r+
 Zgrn+hbVHLCnLM7klsY87eg5sPe3gsAEC7TejJNzq19aCDTlsjg0cSGau2aS9/71GMiI
 a+YqhJwjJPxQZSXBdRE7WPh5B9BB+/jMriYsAwuEeGvxD9Odt2rtq5PoZ2Cwo8ycXPhg
 tqxw==
X-Gm-Message-State: AOAM533bhxkC2unMWF0v2bNB+qyw3KFpCRN+Krf3XqDI3QunanL1BkLK
 8pd2JKOOPm9lQ+ATeDCEaSU=
X-Google-Smtp-Source: ABdhPJw+C+LHXjo2QNGKQK9LRY0Ze/kxlofPgLmIl9c1IL5T30PTyN87aaiVYIql2jWjMWTuoSRDQQ==
X-Received: by 2002:aa7:96e5:: with SMTP id i5mr7573327pfq.108.1597652603195; 
 Mon, 17 Aug 2020 01:23:23 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:23:22 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 34/35] dma: sf-pdma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:25 +0530
Message-Id: <20200817081726.20213-35-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042327_030297_937599F1 
X-CRM114-Status: GOOD (  13.18  )
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
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 6e530dca6d9e..a2d91074bc6f 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -281,9 +281,9 @@ static void sf_pdma_free_desc(struct virt_dma_desc *vdesc)
 	desc->in_use = false;
 }
 
-static void sf_pdma_donebh_tasklet(unsigned long arg)
+static void sf_pdma_donebh_tasklet(struct tasklet_struct *t)
 {
-	struct sf_pdma_chan *chan = (struct sf_pdma_chan *)arg;
+	struct sf_pdma_chan *chan = from_tasklet(chan, t, done_tasklet);
 	struct sf_pdma_desc *desc = chan->desc;
 	unsigned long flags;
 
@@ -298,9 +298,9 @@ static void sf_pdma_donebh_tasklet(unsigned long arg)
 	dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
 }
 
-static void sf_pdma_errbh_tasklet(unsigned long arg)
+static void sf_pdma_errbh_tasklet(struct tasklet_struct *t)
 {
-	struct sf_pdma_chan *chan = (struct sf_pdma_chan *)arg;
+	struct sf_pdma_chan *chan = from_tasklet(chan, t, err_tasklet);
 	struct sf_pdma_desc *desc = chan->desc;
 	unsigned long flags;
 
@@ -476,10 +476,8 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
 
 		writel(PDMA_CLEAR_CTRL, chan->regs.ctrl);
 
-		tasklet_init(&chan->done_tasklet,
-			     sf_pdma_donebh_tasklet, (unsigned long)chan);
-		tasklet_init(&chan->err_tasklet,
-			     sf_pdma_errbh_tasklet, (unsigned long)chan);
+		tasklet_setup(&chan->done_tasklet, sf_pdma_donebh_tasklet);
+		tasklet_setup(&chan->err_tasklet, sf_pdma_errbh_tasklet);
 	}
 }
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
