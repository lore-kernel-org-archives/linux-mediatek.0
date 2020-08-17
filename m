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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0ADAC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:34:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C2C2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 09:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I6+h6dYH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+PqmoMs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1C2C2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGN5gYohaDrm+OxAUSTWZmxwJE4DYWb88P3ctmplIWs=; b=I6+h6dYHgTZhe11OVVNZRSjB5m
	DoOE1gVZ6xvnypGHuK7oo8TVx6ePjT2McU20fZclv4MsQxXg1G3oqGDs/MwIoZdR6L1by2TEBNaNY
	wABGGXJY6k8WYf01dOGVMXUOqKuSDiuSfogbLWLkX7HRz5OwuBvKXrFeM4qMUNKD/zBojLf49ilwb
	lr2F1CoAXS30lmCNUfKhg6Jp+VongtcC6UkPlTFYV4uxS6KoWzbXs0j4j7qWNVEkcc5b1cvJe8DBe
	KvjOMZwobsZTLLpQNeDuWSkMtQ8Z+18Gam1BvO6B3Z2quqsQarO2NcYy6KyBTVgvnodeaQ1bbWw/7
	9C3H3n1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7bWz-0004ON-OZ; Mon, 17 Aug 2020 09:34:17 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aLS-0007D9-JI; Mon, 17 Aug 2020 08:18:21 +0000
Received: by mail-pl1-x644.google.com with SMTP id u10so7125984plr.7;
 Mon, 17 Aug 2020 01:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VuEUvmYOOxy0cBG1vy1x0k+OUnxToU/d3epXaoj+zgU=;
 b=N+PqmoMsa7OSrh+YQoRWbjcFhyvAZVpnAGN18Dq9JnExrNg1QK1YiDTfCKZWX0tzAU
 w0Zv/q4BWvCVtYiBfxDO5AN18qkpPyECLdQM2sHFbyPzeAGVGdx1mGpOCt0IaXqUd3Mg
 /aiQZlslyJOYdh8VUcL0yXF3dJ7Q1LMsB8zAbDOEGpUcfKrPorsxdu5Qz/XnPbEPdy4B
 THV+bJCufjjEx4mVBDuLeJQWYBIiHX5Dxiq0N7Fit+YRUFklquEoieue7mHVIO5+HU9y
 bxOXL9nx9QPjhA9TOMwq1tLPi38SgRYtHGENItORu5NwrcVAl59CHDzoy4jqUksgAt+i
 rsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VuEUvmYOOxy0cBG1vy1x0k+OUnxToU/d3epXaoj+zgU=;
 b=kcllbyN5/afaVynbSGxOkvoeWXsZew8XMqgBXPSc9Ge5fL+0gBrJYwCsLe8h6ifqqR
 D8tu2FQQYQ26bHZP0PRDQdbhMjK7tEF2Fy7FBqptGjjW0/q0KMYf/p/s8RxjCZn+0BYY
 B5EA70MLOPgNPelAkJ+2dOPbyjxvZE3364emkt4wCULWSdQmyJl26GKM1Hdb7ohQNrrn
 K/TwIEbi00AmWzQxwEWOysZWVrLL2XUxou4K3qDIXFS2efcPrTrahc4LjXnA7KUx8IoM
 mZn0eJDgalJCXv619vSzHaoF+vD7U43k+RqVwuaZvRUXpDkSxVEcL4iPnTyJ3IPCirMP
 Qeng==
X-Gm-Message-State: AOAM532EkwGSuTrRWjIwpmPGCWFDRDW3tYCv7jBw/BqsWFbrY5AffFZZ
 Z4vKqREC34u2771/+Y9ZjQ4=
X-Google-Smtp-Source: ABdhPJxdwkKw4yzWqHKwHEGaahSJ53uh/FCPjaY9jium8wPVcefU6BXuAp+4B0DoFuGrH/xG8g/t3g==
X-Received: by 2002:a17:90a:46c2:: with SMTP id
 x2mr11593387pjg.184.1597652296086; 
 Mon, 17 Aug 2020 01:18:16 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:18:15 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 03/35] dma: at_xdmac: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:46:54 +0530
Message-Id: <20200817081726.20213-4-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041818_912448_D73C57CF 
X-CRM114-Status: GOOD (  13.27  )
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
 drivers/dma/at_xdmac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index fd92f048c491..18fc0f3f817f 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -1615,7 +1615,7 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
 
 static void at_xdmac_tasklet(unsigned long data)
 {
-	struct at_xdmac_chan	*atchan = (struct at_xdmac_chan *)data;
+	struct at_xdmac_chan	*atchan = from_tasklet(atchan, t, tasklet);
 	struct at_xdmac_desc	*desc;
 	u32			error_mask;
 
@@ -2063,8 +2063,7 @@ static int at_xdmac_probe(struct platform_device *pdev)
 		spin_lock_init(&atchan->lock);
 		INIT_LIST_HEAD(&atchan->xfers_list);
 		INIT_LIST_HEAD(&atchan->free_descs_list);
-		tasklet_init(&atchan->tasklet, at_xdmac_tasklet,
-			     (unsigned long)atchan);
+		tasklet_setup(&atchan->tasklet, at_xdmac_tasklet);
 
 		/* Clear pending interrupts. */
 		while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
