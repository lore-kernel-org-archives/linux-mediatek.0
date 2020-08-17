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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A492AC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:37:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB3B2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pMeeLEmG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkHoMNTn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB3B2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfSbES4TbuZ9k6K/nCCKwTjG4nNzriVzEFZ5nDDuXoI=; b=pMeeLEmGTewBVS3WIbYu3VRj/4
	kqYxqa0sFvn8WP1QHXkOTcpwzTqJT3zIyJqKTwZ/9+cVVDXZdNsUV7NW+dmGxSxR3oypl/QdJifQ1
	2T6mqclSkgKco6dcYE4qm7J1MnGL0aw5JVfMstI1SJrxUxuVIGBOyP63X3+bvIXFAZZ7LxVQIfKG0
	HlH5d2fOU6HB0lBqBI3b2iI/wrU6xxaXv2OF0rkS1o/zN0WEt+lgIGIOaLGaoVI8QPf7KnF6iwbCm
	eHGqhgs8vfHpwAlY4suTVMk3JAhhSk20sxp/QUOPz1h4v1iifXSgS+KmhzWtG6kG1iMNPvoy6JQR2
	tzl3P0tQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7adX-0008NW-Bc; Mon, 17 Aug 2020 08:36:59 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aOo-0000PO-L3; Mon, 17 Aug 2020 08:21:57 +0000
Received: by mail-pl1-x641.google.com with SMTP id s14so1159391plp.4;
 Mon, 17 Aug 2020 01:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uH6lh/wm+k3oIhHiZx2SeVnKtHemKJugMwQhBtWwEsY=;
 b=pkHoMNTnBvBUY5wBnHq75aCKuxAgQAtFGnNZutY84jkzUGpyGZ6d/Lyt+P9feDGCmy
 oi5lOvVO7mwSRWBMI975qjlEqiWyRj9sLI9IKUYbo5xLFi2aEMIgvbIPHMNpl8I+S56X
 BDvNmlJ4DNOKPp2eTtWU1pi1nr9KPOFq5KQuJ4DW5r0Rz4og/KIwz3sgnQe5PVxdOedv
 BUTsFgaLQY4W7NY17bprObegQF47stPp4ILtIK9vzrJjv58M+JSJjtbLV01fLk+i/0Ff
 ZXGZ2N9nBxreCbE0WDGBaJrhwsSYKbjj/dkdz/u7S3PIm3OE4MnmO01ap+pIF614uhqQ
 GOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uH6lh/wm+k3oIhHiZx2SeVnKtHemKJugMwQhBtWwEsY=;
 b=RgA2Vs2Nq3PnHCaXWUk3w9y2avS6vnI1TbGpkgKl0JJBzLSAdTb8Fg1Z9rC1S9gYuc
 mXNJf5S0OFGarNeKrhvfI+krXHi1A0dbiJcIG4NUeVG65CqOf6K7IpK7lT/6QPm39nOI
 pBymA/QEQod7QEqb2amb+rPQ7m4c93xqrUmWYtZLZN+fmUQYp+FRcl70UgKzAvncJS2L
 GZrApggTyxmopuc0bO++nFlpQfxdxGCCizK9SuRyedUBojS44nj2zIK9PKhMSV94m+D2
 OH/CHAWWwR8/Jvlhe+XC/1ZomctIxvFPSpLLrz2yNVbsHIFlmlT5Dm2tpgzUzTE+Ce6g
 ERhA==
X-Gm-Message-State: AOAM5337bbtfjHDml3SBaxk5esD6GFc/YyHATCcm8JdLwSS4AnuUx8cJ
 3GAhgwWdCrEjn78ijmsjNAw=
X-Google-Smtp-Source: ABdhPJyAiC+gLop7N7yDKbnn4HN8Ga+G44y9G0wc3Fi3VEqVxz0aWSYAszxNuQ4brCXqCbddv6Jlvw==
X-Received: by 2002:a17:902:a412:: with SMTP id
 p18mr10268881plq.3.1597652504569; 
 Mon, 17 Aug 2020 01:21:44 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:21:44 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 24/35] dma: sirf-dma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:15 +0530
Message-Id: <20200817081726.20213-25-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042147_742754_4AA67295 
X-CRM114-Status: GOOD (  13.44  )
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
 drivers/dma/sirf-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sirf-dma.c b/drivers/dma/sirf-dma.c
index 30064689d67f..a5c2843384fd 100644
--- a/drivers/dma/sirf-dma.c
+++ b/drivers/dma/sirf-dma.c
@@ -393,9 +393,9 @@ static void sirfsoc_dma_process_completed(struct sirfsoc_dma *sdma)
 }
 
 /* DMA Tasklet */
-static void sirfsoc_dma_tasklet(unsigned long data)
+static void sirfsoc_dma_tasklet(struct tasklet_struct *t)
 {
-	struct sirfsoc_dma *sdma = (void *)data;
+	struct sirfsoc_dma *sdma = from_tasklet(sdma, t, tasklet);
 
 	sirfsoc_dma_process_completed(sdma);
 }
@@ -938,7 +938,7 @@ static int sirfsoc_dma_probe(struct platform_device *op)
 		list_add_tail(&schan->chan.device_node, &dma->channels);
 	}
 
-	tasklet_init(&sdma->tasklet, sirfsoc_dma_tasklet, (unsigned long)sdma);
+	tasklet_setup(&sdma->tasklet, sirfsoc_dma_tasklet);
 
 	/* Register DMA engine */
 	dev_set_drvdata(dev, sdma);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
