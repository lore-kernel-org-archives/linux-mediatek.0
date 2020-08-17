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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE82C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:37:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D04CD2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gSNTZlUK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0K2xoe6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D04CD2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HM2NgYt+mqjvg0u0kqmD0hNUe0Qu16rELRH2xQWYLi4=; b=gSNTZlUKQrMEhHI4NaF0dpUIze
	7NlAKcx1tGtCS0PMyx0YlIXeFZ5tMJLmJx2sTG3sxZXSaA1QG9irKAkessm659JFcWffR0nNw5YiP
	zzU8nfhvGdgQCIwUhRhjwNjy7rOTnw0z4DDlnMLlv2sIc4Llkzx23mJnH7v+PSRyRURVFlutM7+IZ
	oFZQS566aaJ1a/SrXE+gAiwdHyHS52AYAgqI71tciZw7toSeUt0Eqp4+ysWPC9PvcGOkI3N/ZBk3W
	hEGxv/3RyBq9+rU3/OH+7xHPPKIHg1MePq/OB8B+VxKKGzY+rIGw8Z/V2hATCR7iSz4siFLbSsy9H
	n9oT0lIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ae7-0000Dq-1S; Mon, 17 Aug 2020 08:37:35 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aP8-0000a2-8U; Mon, 17 Aug 2020 08:22:09 +0000
Received: by mail-pj1-x1042.google.com with SMTP id mw10so7342987pjb.2;
 Mon, 17 Aug 2020 01:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ScSchtGkwbuHnxQx7iSsqRyAzIGJLK/PgYB9DNEv3wQ=;
 b=i0K2xoe6D97BPwpwRK9Bh8AmH4RkiEpDe127j8GQnyPUIu90NxEYUKf2ZHVd5KtzTL
 NF3Y2fB1vWs/vlujrnGz5RsfEq0VAA0E6HuZJBVgo4f+4aW5ElwqdkdPxwRLhVQ0ZGnV
 0m+tA+pHZOvQLIHsUpEFQQPETdoeGVun3IWoKQDFb5d9T+HEpOGZqwPSXibEdWt9WIfb
 8sY2pHRmZqtyU2+vBXTmpjtHjkaep4il3F0TSQJrSsrQmxt56VjhWI0bUIj02LHAv8LG
 l4MvZEBNifnlR6R76r/NT0SEoXYAfFf68rs+ZPOkXWlMhXG3sd6ixpORdSvaiGqIB99e
 V7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ScSchtGkwbuHnxQx7iSsqRyAzIGJLK/PgYB9DNEv3wQ=;
 b=jGp1MAFxIJHEdj4LQGJfJLxR4a2Cv6AYW1A2ktv/7/jH47apL3nyImwflnUJWWCvoD
 aO1v/+OsMsLWq0omILv7zY6ZeNxeiKNa6EXecp/3JfdBtjJX7y/nIBRY+g/nmr7a/Spe
 48P9DWZqtVOpPTePWf6RuozZPbSUDfhfp1W9sfmssQjTFROBWp10d51xhq67COBvGi+V
 ZGQ5dZ4WQaBEWukdAk/YCVAP7K5sgVyKlZmK2V5UEFmwcGzCja3OWArXzfbyuAEFrMWi
 x1Iq49bIfCxCvsVJF9wcTy0iDEN6d3JXBxwuxQZLDI1gZJU/8HL+PLCM6nG3W1+nh/Lm
 mHcA==
X-Gm-Message-State: AOAM5318uASRdpNROge2BVLVGvIng0NB/rUaeR1koCmIkaMgml6/weim
 QnPi8k/85k+oy/ruAyANzBA=
X-Google-Smtp-Source: ABdhPJyd9hITb+tghZ3TwtqGp09qIUQSVnYpI+TEsezUWXwAhph40aYGEYGOpiAwvWfVEY1OHJX9zA==
X-Received: by 2002:a17:90b:1493:: with SMTP id
 js19mr10563329pjb.223.1597652523277; 
 Mon, 17 Aug 2020 01:22:03 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:22:02 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 26/35] dma: sun6i: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:47:17 +0530
Message-Id: <20200817081726.20213-27-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042207_415758_424B241F 
X-CRM114-Status: GOOD (  14.44  )
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
 drivers/dma/sun6i-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 06cd7f867f7c..f5f9c86c50bc 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -467,9 +467,9 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	return 0;
 }
 
-static void sun6i_dma_tasklet(unsigned long data)
+static void sun6i_dma_tasklet(struct tasklet_struct *t)
 {
-	struct sun6i_dma_dev *sdev = (struct sun6i_dma_dev *)data;
+	struct sun6i_dma_dev *sdev = from_tasklet(sdev, t, task);
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	unsigned int pchan_alloc = 0;
@@ -1343,7 +1343,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	if (!sdc->vchans)
 		return -ENOMEM;
 
-	tasklet_init(&sdc->task, sun6i_dma_tasklet, (unsigned long)sdc);
+	tasklet_setup(&sdc->task, sun6i_dma_tasklet);
 
 	for (i = 0; i < sdc->num_pchans; i++) {
 		struct sun6i_pchan *pchan = &sdc->pchans[i];
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
