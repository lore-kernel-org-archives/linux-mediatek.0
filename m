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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB2EC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:21:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B600520658
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QJKRRQwW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpZtowom"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B600520658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0FNDEtTMqGV+g3PiBBrLketMJj2aZERZkRzsxqTeR8=; b=QJKRRQwWyJQ6hs8xTmPySfXKZl
	6ew1Kx6TsAiWzaIGzLHxANsfvGxTzx3KyO/3/GJ3j5Zd8MxjYaJNE7xOYgdGo9X+gf3r6takk+Wkc
	9T0KpeT9LoYZUnhbc4D4l8PpRo+2zdevW+eIc3IDQ/BhXti/rvN0E6Penw2Gcsu2HHUa4NDX3/Eel
	QWcsRk3SMr5qPVuvTYGWKy/bF2+nNreIV5g6raxqTfQIG50Q82FbkNbrvUylK50+VJycvhbkMkP/B
	KFwwj8Rv/d/wlJJ1f/jOtFsp1GNVNWn4GwFKs6tzhO2yb/fkyJOZA3CRNNgmQYklNMN5hyqWUFviM
	DEhN105g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aOb-0000KG-Io; Mon, 17 Aug 2020 08:21:33 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aLI-00079r-W0; Mon, 17 Aug 2020 08:18:11 +0000
Received: by mail-pj1-x1044.google.com with SMTP id c6so7451446pje.1;
 Mon, 17 Aug 2020 01:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RCQBB24TVyQgJJKqQrd+pMSwLixAZ8RHZ/Oe1XSH5Ms=;
 b=CpZtowomUtwba5d+9jG3umtKblXH0Nv9enQMbrOs6GYgS65k2pOGxHWdIWP2HSmvN2
 UTdqM9Ncf5dEJKdISwV6uubgdu8uI7cYuG1eQXJn6kbbH8gKtCrdZO07OHnFp4RHnQRr
 XzQcPkzksCDZYle4I0axA1CnUQMWX652Fy2AFVu32HNSRSw9hOi+fIAKuLBBrELgJXHZ
 sykti7yWoxKWEDjSPKRiIB3Z6Kse+8MQWiVxR3a2xzpZjSQnMxbI5Jvjg/JdCl31Cd7a
 0oU4NiFpQWsjEi6zpSFOYz0olNYeMB+kX3knAyb76mWd2VjY1RAHjESHDDQczHrA6pfR
 2C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RCQBB24TVyQgJJKqQrd+pMSwLixAZ8RHZ/Oe1XSH5Ms=;
 b=MIOTO3gOtSPI91uiOWugoVtiNYkDl2yC5OxkYA3vbV7SLnbRs0zu7gkYhbZmuFkygz
 dFO+moui+lUQD1PpyDcMpPgLPDlB2Wf0JfX5Tlst+gHv/S5w716Hh8UyQx4k+B6BB2Xh
 atTsNISGf6v5uSlCjeARhyoWDEQ2tPBnTMOpXZIeeQVs3P0sbzsirhFkXMK2bMPfxzkI
 fICjDCeOHvoHcBAnB+IEpBgAIBb7Jb/XNWnfaDc/B5y08g3KLZD5/9aJw/nB/cHoTC2M
 v9W0Hj4BD5cm/ppVZcFioxtvDkCFpUR7CWRZO/hEG0vTSthFaIO62gRS3gl5TESvwkFO
 +omw==
X-Gm-Message-State: AOAM533fEaTE4EAp95wj33vl8Kud/85dCBVoUg76UhFQOqLsOPsXjYrd
 5VO+fGWByWUQN+giUAKSbY4=
X-Google-Smtp-Source: ABdhPJwxa56ov/nlIFhSPEveChi/D5g+3jgKhjy/JdPQQGEGTnn9XaevZeRC4yuK/+UJ9g0YArNzag==
X-Received: by 2002:a17:90a:ea82:: with SMTP id
 h2mr7951833pjz.75.1597652286870; 
 Mon, 17 Aug 2020 01:18:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:18:06 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 02/35] dma: at_hdmac: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:46:53 +0530
Message-Id: <20200817081726.20213-3-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041809_345129_D3EB38FC 
X-CRM114-Status: GOOD (  12.83  )
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
 drivers/dma/at_hdmac.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 45bbcd6146fd..4162c9a177e0 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -598,9 +598,9 @@ static void atc_handle_cyclic(struct at_dma_chan *atchan)
 
 /*--  IRQ & Tasklet  ---------------------------------------------------*/
 
-static void atc_tasklet(unsigned long data)
+static void atc_tasklet(struct tasklet_struct *t)
 {
-	struct at_dma_chan *atchan = (struct at_dma_chan *)data;
+	struct at_dma_chan *atchan = from_tasklet(atchan, t, tasklet);
 
 	if (test_and_clear_bit(ATC_IS_ERROR, &atchan->status))
 		return atc_handle_error(atchan);
@@ -1885,8 +1885,7 @@ static int __init at_dma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&atchan->queue);
 		INIT_LIST_HEAD(&atchan->free_list);
 
-		tasklet_init(&atchan->tasklet, atc_tasklet,
-				(unsigned long)atchan);
+		tasklet_setup(&atchan->tasklet, atc_tasklet);
 		atc_enable_chan_irq(atdma, i);
 	}
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
