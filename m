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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163C5C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:33:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8CAB2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DhJkIYZ8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6tTDOge"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8CAB2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXLObtsFsvyVMb2VH0kDgtcQvNfe4NPlggkiQ55GxLs=; b=DhJkIYZ81q7eoQFC3b/WQsXdYx
	jR8addJA/cvbrIvTcOs3XD/wv1LzCd5WhjCIg86W1we2FOT2QOyr68a4WHRawOcftt93uohSjrWgo
	XQYtkaoxqE5uXBai9pN/O4ONlNC2T4QsSgiSaIN8AvboMp5Eav1ITtHoXbYCFtIktTvhQZEBPw26x
	m2snwOf8hQsArCaeMkpMAPLVoBEXOkENGBdiqThlRxDuIE6ownJkws5nhkRT1PQOHlbOWKsbBNvNX
	4NS6yxbED/pMGv5mUVa3KWmeJ64Z3vBQdIMLWUFV3Tcnrag82oUt8OJ85BSKflBmVTU6WWct0py6S
	+WAZKvVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aaS-0006hf-K3; Mon, 17 Aug 2020 08:33:48 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aNn-0008Ko-9D; Mon, 17 Aug 2020 08:20:44 +0000
Received: by mail-pf1-x442.google.com with SMTP id m71so7873741pfd.1;
 Mon, 17 Aug 2020 01:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EzH+Sxo0+kwwV/JFv4Jtew4uUPj7pfAWvGnBJqZX2kA=;
 b=N6tTDOge5tw8M9NkByFSkZhki08OpnX3cup9whr2OMRwTNmIRwnuxH500ufS6O6oYS
 9FwpkqCZmeIIAgtaJ1Po0e7eVnFwKT04tK34TuAMkx9yH6h1dvT117uPFsIWWPThMxiP
 HKnxvP/bZCTY5ufO77byooN31q+rQ+5XdnI7EQ13QfikscWEvjP1FEsd4KmH1Mm2gIZA
 Bft6yyJObH0zEcNyrbgq8c5WQKWK6LBXQeDLKi5gSODm5B1wfSlDPsvT0o84CfMWqFYL
 v27valKSh6+yD8503cTOqT4+5Gk24FNFTz6tNnXObVLwcejLDdkz9xxUMbDiCIG0p+O6
 Fr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EzH+Sxo0+kwwV/JFv4Jtew4uUPj7pfAWvGnBJqZX2kA=;
 b=uh7qhVMzqIPMIM+Syj8s/w/QLGaZzZ8iAueG51TEDMe0FpNf9GYGq1pymu4eo0iMYd
 d9ICw0/vm4QKL3CyRKZJYMQFc0xCmhSQ+UvRbfalqDUrFMPvk7hbkIedDgawOBCH0e2s
 N92ftlcUjEhKLQdHxhwCpAi5c3WLfJk5/auHnw9PZUICljpSjbZJHtfmYPd8pODYDZMI
 OD9mOnmXoSIm/rAaU9riW82E6QciiJyCYiN6FJy6Kx2xGbsEAowAO22LfMDBE5JSrctN
 3cW6tLPCUA0V4LBEEiZEz4hXa8/oTzdLamtv3kkBsR1/6N5pgeH3avET++0yfF61jbqo
 /ewA==
X-Gm-Message-State: AOAM533lpiNH79+YwrpPxNv/vbQf0H0k3x3pPqhQKoKFRHSOqYkEzpx6
 RJ+b/D2q9+RrbmlAv0uZ2g8=
X-Google-Smtp-Source: ABdhPJyEDiiZcn2swD/FpmaQCjF3kpL10RdAb85gFToheYdre6qGu2gKaqG6UhP4EQqqRrv6fRYNDA==
X-Received: by 2002:aa7:9f8a:: with SMTP id z10mr10836424pfr.176.1597652439296; 
 Mon, 17 Aug 2020 01:20:39 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:20:38 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 17/35] dma: mxs-dma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:08 +0530
Message-Id: <20200817081726.20213-18-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042043_386934_881E7D14 
X-CRM114-Status: GOOD (  13.11  )
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
 drivers/dma/mxs-dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 3039bba0e4d5..6f296a137543 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -320,9 +320,9 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	return dma_cookie_assign(tx);
 }
 
-static void mxs_dma_tasklet(unsigned long data)
+static void mxs_dma_tasklet(struct tasklet_struct *t)
 {
-	struct mxs_dma_chan *mxs_chan = (struct mxs_dma_chan *) data;
+	struct mxs_dma_chan *mxs_chan = from_tasklet(mxs_chan, t, tasklet);
 
 	dmaengine_desc_get_callback_invoke(&mxs_chan->desc, NULL);
 }
@@ -812,8 +812,7 @@ static int __init mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_init(&mxs_chan->tasklet, mxs_dma_tasklet,
-			     (unsigned long) mxs_chan);
+		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
