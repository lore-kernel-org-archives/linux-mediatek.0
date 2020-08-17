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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F886C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:43:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2801F2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z0kmLwqA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="shhgpJ08"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2801F2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npW6T8g+VuwK3h1rxadKASLSMKVNwFZHSpcIOVzjP9I=; b=z0kmLwqAd+cHl0KsWKgq1V45cy
	068hXGSj3kSbulO7wpkCsiTmxcoxjbDbtMUtL3rEz8YW7pAgvrG/I8dGxZda7qAv4erRfsqBw2Jx9
	YwuKzumshSe/GICxA+7uUhIvepSFAi0Lip5fqyBHaFSKEPpLZXnVNWDOB6hyfWguUx1rcHwsTU8Gt
	Tke++3v3JwrojuHogqN8anCpx3NjXlEefS+FNiZ3+ZEJl6bhbwwugEXoRydN3FWfhw4aYpoq/mftB
	5AgdmhiZNqntM+xHfHKGSY5PV/mEkRRj0YKYQ+HXuRRUqCVlj3bbBdvwaHqhF0wAkvITFTTDei0tI
	TdY45vGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ajR-0002zH-Cv; Mon, 17 Aug 2020 08:43:05 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aQa-0001Ge-Sd; Mon, 17 Aug 2020 08:23:52 +0000
Received: by mail-pl1-x641.google.com with SMTP id t11so7140770plr.5;
 Mon, 17 Aug 2020 01:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8m7i7NFD9jtK5LLWJqp7H8mCeAZp9HPWo5wwi/RHp1g=;
 b=shhgpJ08JxORr1lpKJUfn3rchd09xpy5GGqJOy+g9NZHI2yF93ITXi9gFGnHqql9PN
 IIqTRGM+YqPsbWPrgC9E5xcKRbIjXdKqoLaeQRRLy+BgZ0VlNpUtYLYotj9zO/XVLva2
 +Tllzxp32+qQBUXckBM4g+opSCRbBgFt5ss7ET0g7omdzkYjanAgDryppqe6/vD/LI6c
 6wkO4DAHsGqPFCf/eJ8A+MkhjsJ3eYHTsE7LczIFRuKKANtSFih6SHGz/cqeYpOIT9Jl
 HxCJg00kHcNEYxKHr7oEq3LU6Jw+8qU4B+UYcCRUEaTTnfKB2ZJEdkXfVIujaTMUF+yw
 YWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8m7i7NFD9jtK5LLWJqp7H8mCeAZp9HPWo5wwi/RHp1g=;
 b=b7DftEKIfZyk18msUW2MoGKWHXR9T75DZYsn2CyfhIcrQHOkIvJVsao/mf4glzUCZd
 dyR5CkNMwh3FLzwiLQzlmqgk/vBgEERwHQqfvkCXiJHP+6oYLbInZGWnr67KVGAev43j
 jTkcDo6YYFg0uYB87YZWC1J1lXsPxwG17qHnVf5Pvo9n6Q6EI8m28kcv4qCtOVNX3fUk
 lYgWqrchKPZ772/NKOf0VX5YFXj0EIYhsY5seaqnisFWq42AGZ2k4+XiP/F60LvM+B26
 ZWI1vD1I1W/g+Bospu6mKU2dEjDS/SiGpi5mHrLVYFiYFJUjEo+o4W+h/b4pfVMCxApA
 xv9g==
X-Gm-Message-State: AOAM530qlcxPw+RSbDkwGstqwODUQhbxvd5XBwR4AEuk1Q5VshDodHwe
 mgUcvT5D2xs5wKRr8p+PdCs=
X-Google-Smtp-Source: ABdhPJwa4r12zdeyzw2uMxlu/O5WMxHHX7aUf3vUQzREnZb/8WCIoQnzmvYJMcX5iK2KOq5isJHTnA==
X-Received: by 2002:a17:902:5991:: with SMTP id
 p17mr10568056pli.78.1597652612472; 
 Mon, 17 Aug 2020 01:23:32 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:23:32 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 35/35] dma: k3-udma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:26 +0530
Message-Id: <20200817081726.20213-36-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042337_283152_840A05F6 
X-CRM114-Status: GOOD (  13.09  )
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
 drivers/dma/ti/k3-udma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c14e6cb105cd..59cd8770334c 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2914,9 +2914,9 @@ static void udma_desc_pre_callback(struct virt_dma_chan *vc,
  * This tasklet handles the completion of a DMA descriptor by
  * calling its callback and freeing it.
  */
-static void udma_vchan_complete(unsigned long arg)
+static void udma_vchan_complete(struct tasklet_struct *t)
 {
-	struct virt_dma_chan *vc = (struct virt_dma_chan *)arg;
+	struct virt_dma_chan *vc = from_tasklet(vc, t, task);
 	struct virt_dma_desc *vd, *_vd;
 	struct dmaengine_desc_callback cb;
 	LIST_HEAD(head);
@@ -3649,8 +3649,7 @@ static int udma_probe(struct platform_device *pdev)
 
 		vchan_init(&uc->vc, &ud->ddev);
 		/* Use custom vchan completion handling */
-		tasklet_init(&uc->vc.task, udma_vchan_complete,
-			     (unsigned long)&uc->vc);
+		tasklet_setup(&uc->vc.task, udma_vchan_complete);
 		init_completion(&uc->teardown_completed);
 		INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
 	}
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
