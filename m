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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052F4C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:29:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A66AD20658
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BT7bJKDK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XH24MgRj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A66AD20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqO2kAb5ltqe79cO5IzEPyqwpzVdbWE3zJqQUR+q5vk=; b=BT7bJKDKNr+KHfWtNIRKB4nYVx
	H1EKt1Bo/Rm7neC7yisPiTmigOwcOabSiiOOn9VvI+7ppNSKFger5Vex9clCrgI1PHGKqS+CD1UrH
	Q10d8tWeX8MkLF9ZLXQkSbP2orCb52tFttRg9qjeX8dcRhqgeqCYgmP81a9M5Foz61o7EYb9bMMru
	HCG/7orhyKzz0RcdMp+oE7urgBHPJVoZCVDjPrI8W3jKPgnYQbCTtKhA30eQFbViTPEis6D69D9ut
	hIQYBD6tUvV2tLeJMisvUNfDICOT5kb6FdyXEOiM4D2jMoiuhwk3ElbwKQiTbA32Fi8xQ99zEZs7z
	oKQgUmZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aW0-0004F9-0k; Mon, 17 Aug 2020 08:29:12 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aMa-0007mw-V7; Mon, 17 Aug 2020 08:19:47 +0000
Received: by mail-pj1-x1043.google.com with SMTP id t6so7341301pjr.0;
 Mon, 17 Aug 2020 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SduS7GYrzCMOuDhMx/Gh1w2hqriGD/sY89ZovbEjnFE=;
 b=XH24MgRjHRYGPePUOq3aw4H5z0Vr33lqZWU9Wlczqoofn0SYwK930nVcgDozCL8vcP
 ONUcHFit8FvUlnNJY5xZECDV8iv+6xLVTKQ51c+RuZNBgtHQXOY1YvG7uubgdAg0SP0+
 BlK2QMTQVwwlmyoXsxrDybqm5kQaTHAjfYUT2t2hvzw9+gGVNwXNfcAYWDayGD9olG3b
 OBoUq3H+ZOsSslRrqPcZ3iLi6s6rKmvSoeWvJZibcRh0V6l2wlYaBuJUsu34hYRO3ENW
 vQfu4wD4n4yQItLkaeBkT6PTj9aQ22IIwUHUmAkUYdIhhbuZBRV/D/32Uky9eonf9Wnp
 jCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SduS7GYrzCMOuDhMx/Gh1w2hqriGD/sY89ZovbEjnFE=;
 b=SdZtGCo5w85jvDBYMc1nmzPVAPXp+gGhkz5A4wNmAgl2BKixKdh4minV2BA64810Ct
 j0h0P3bascMTS8plNWwFmk488X1oBtYHKPQ5YIotiOVCrop0JIV6PDGpUWo7t3+8rI6B
 cHVZTxXTeXCxRb6D/p6zUC+NbyATcZQ4X23qckhx5H7pi2mmRsouQx/SOqTxdDe+tO8L
 Y0bgW1Kjj0lQ5VmBIntHqJeAHoL1Bu7PM7GYnvTvBO3NO8eviwbCPs8l0soeVnlfz+tA
 sqX84GZhG9ZX6158rLT2AdXnlpvxTQZ+iWYx79sYmc3hMneWuXP9CU3giBvUuYiklnkZ
 qo4Q==
X-Gm-Message-State: AOAM533/zS7uxXePeZYZ/3pU0rBGnCz9xznyIHraVD70p0ZHxFsVV+pE
 IMIC3DsMAfPK4CHruMq7RDA=
X-Google-Smtp-Source: ABdhPJzroCaU+Tt7oEAw88lrMX/tAJLQhR1tAgJzO5Lh4HdTX+ecDGKk5WTyNolUBaI2A4dXtvY8dg==
X-Received: by 2002:a17:902:ee82:: with SMTP id
 a2mr10184305pld.204.1597652366238; 
 Mon, 17 Aug 2020 01:19:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:19:25 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 10/35] dma: iop_adma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:01 +0530
Message-Id: <20200817081726.20213-11-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041929_142051_D3AFBBAB 
X-CRM114-Status: GOOD (  13.79  )
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
 drivers/dma/iop-adma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/iop-adma.c b/drivers/dma/iop-adma.c
index 3350bffb2e93..81f177894d1f 100644
--- a/drivers/dma/iop-adma.c
+++ b/drivers/dma/iop-adma.c
@@ -238,9 +238,10 @@ iop_adma_slot_cleanup(struct iop_adma_chan *iop_chan)
 	spin_unlock_bh(&iop_chan->lock);
 }
 
-static void iop_adma_tasklet(unsigned long data)
+static void iop_adma_tasklet(struct tasklet_struct *t)
 {
-	struct iop_adma_chan *iop_chan = (struct iop_adma_chan *) data;
+	struct iop_adma_chan *iop_chan = from_tasklet(iop_chan, t,
+						      irq_tasklet);
 
 	/* lockdep will flag depedency submissions as potentially
 	 * recursive locking, this is not the case as a dependency
@@ -1351,8 +1352,7 @@ static int iop_adma_probe(struct platform_device *pdev)
 		ret = -ENOMEM;
 		goto err_free_iop_chan;
 	}
-	tasklet_init(&iop_chan->irq_tasklet, iop_adma_tasklet, (unsigned long)
-		iop_chan);
+	tasklet_setup(&iop_chan->irq_tasklet, iop_adma_tasklet);
 
 	/* clear errors before enabling interrupts */
 	iop_adma_device_clear_err_status(iop_chan);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
