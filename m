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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967DFC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:29:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 653C620658
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnoR+/Oz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgrPYIJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 653C620658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSLvxuq+hVo61uqE9fi4YE2AtTxcZ5NFeiu784UY6vE=; b=pnoR+/OzxqJlJZXuZ43Nnrc8P1
	yRQFOvJI4/sGv42PMZTQoBNv7smu6hVFu5J9OPRuDK20IieOt/z6vKgUo7aI0f0ee6OglrBsjjxno
	xYk2+ei58irvBvInEcyvCFYLGNJvJfKiKGJcFgp+ePexYZ/aLRG4gLbL/isUS6UibxZCx2UNX4UPA
	UatHKbz4EavZ8wp8KRgzMhcETc17Ro8D35mmYbkuoF7a40lQHW02f+EzZMA1o9YLHelQutXg1VSmv
	pv8FO8rhZNwcZZKNasFUIO/+S5snwziAnnjDGju1j3RQ6NYZFeefAxhvpoT+C2YWRz3DJB7qecD9/
	vs7LRgmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aW9-0004KI-2H; Mon, 17 Aug 2020 08:29:21 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aMk-0007rj-4h; Mon, 17 Aug 2020 08:19:55 +0000
Received: by mail-pf1-x444.google.com with SMTP id d188so7863993pfd.2;
 Mon, 17 Aug 2020 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Hn4KAQ3gCFoOl9r0ujaoL0SRctsTF3JFLZ2Rz0kI31Y=;
 b=UgrPYIJbdqsyAE/Fx6gmPFEQMc7zf7xRzMLMRZQ81mNRQ8r/wsHJ5XnwLrP0u+jzbb
 dl3/wP7rbEMaBGkc9Dqh7I1vj/vWVr3IK/R+KEaSPz4L/YA1WrTHfP/DZkyv+D2dF8YO
 fGRQUc6xscqzKG31PNgreYX86TUNQz1GEkpBWD/hgEIQ3mOEeU7i4VyvByRvd2vo5xyX
 ysyJpOD0qtT+rbSeT3efFP9ythU3610pUWwg6Rnq7OGQiNd5+PSg6HNKzwO4+bFpfjUN
 htIUzpe4CYMH51WkhSfmWhRu+7rfrE6sTreHEqQTr+ON8HSS40dT+eLoYpXYWUOI8X9f
 utiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Hn4KAQ3gCFoOl9r0ujaoL0SRctsTF3JFLZ2Rz0kI31Y=;
 b=G8FJ5vNJj7gOMBam3H4wl69oEeepxiJgvgUXQZAAH9e7b9maytJKmQFpvbfIJ71J0q
 eBd0n85K7x/ZpvYnMLLPCLcA4AMKL+BGv8iQKB9iSKtyS/qzuBQ9y32w1+Q8xnmwJyAJ
 B4N7IWm7b2g3SNxh1Vux0Q+4de4yGf4UUyS89j7bxGdbe961rs3xTEcT+STZrDlhJ+dX
 DENA6WbBnTETF2pOJAYF5D+brX8WU4TXeBZVdRcTD4wiLwiFx4HnbIuYGvqdgEiqJlFM
 wtOEtF5oPlC2nkIvOgXPWZS/vLv2FgFcd9fge1op++DVyJqmJV+NQ/nLVlFCIqkVkMdN
 cgwA==
X-Gm-Message-State: AOAM5338DKI2Zk/MXH6tcr9ap+8a+lfbYZMhTkxiGpwrO92QKm9fSfV2
 dU5rk540P+tGpdbEGuxRYQU=
X-Google-Smtp-Source: ABdhPJwKzgY7w0A1JlXR4OuCaZ4g4WLJQtisLZUR6BZuNQ4S9PcFCNNh4aK23T5dkHQTo4ssudR52Q==
X-Received: by 2002:a05:6a00:91:: with SMTP id
 c17mr10263590pfj.151.1597652375645; 
 Mon, 17 Aug 2020 01:19:35 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:19:34 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 11/35] dma: ipu: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:47:02 +0530
Message-Id: <20200817081726.20213-12-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041938_348201_B93C5D8D 
X-CRM114-Status: GOOD (  14.17  )
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
 drivers/dma/ipu/ipu_idmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ipu/ipu_idmac.c b/drivers/dma/ipu/ipu_idmac.c
index 0457b1f26540..38036db284cb 100644
--- a/drivers/dma/ipu/ipu_idmac.c
+++ b/drivers/dma/ipu/ipu_idmac.c
@@ -1299,9 +1299,9 @@ static irqreturn_t idmac_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void ipu_gc_tasklet(unsigned long arg)
+static void ipu_gc_tasklet(struct tasklet_struct *t)
 {
-	struct ipu *ipu = (struct ipu *)arg;
+	struct ipu *ipu = from_tasklet(ipu, t, tasklet);
 	int i;
 
 	for (i = 0; i < IPU_CHANNELS_NUM; i++) {
@@ -1740,7 +1740,7 @@ static int __init ipu_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_idmac_init;
 
-	tasklet_init(&ipu_data.tasklet, ipu_gc_tasklet, (unsigned long)&ipu_data);
+	tasklet_setup(&ipu_data.tasklet, ipu_gc_tasklet);
 
 	ipu_data.dev = &pdev->dev;
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
