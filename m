Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7FCC4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 04:41:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351922067C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 04:41:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c0X9v18h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="SeNYLc8f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351922067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vq6Kp4V8heiArRT2Nz0y4k+SVupvzK/lxFhXc+ufaD0=; b=c0X9v18hGWi5AFHWWwK6iMp2po
	PcDiX+MCuCubEXZwV5RUdLLBMcrAcX1wlDXiL9romCOBAaNw4zIG/+KnHYtC2B6kyNjDQUG+2OPl0
	qzC2UQmOThvX9i9b8wVpYF2KLL+V08cWf7Ryw1v6dka3SVO+Dakb9V6UcLXo5XWYSRIX4STfO2+pT
	J2hdskY53z4Sz5nkX5TkMK6JLJsdMEuM4zzWHePlxnSwvYeK0NJBF5vpzd8qZl0gUvITk8Q3EFEZp
	Fu8TDtHX8pO8VLiU6zfO+0ZmsCbnXLMdtiRl2ZqVUKNWRHKNjuZlSL3VHW51Mfo9TFoJK8JnW7gl/
	WpAm3v6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keWKo-0004mk-IU; Mon, 16 Nov 2020 04:41:46 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keWKl-0004lf-7u
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 04:41:44 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id m17so10016373qvg.5
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2020 20:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=L/Hyw/5+8FMUHf9mlyLFosllpkdODuY36N0muhsO6pA=;
 b=SeNYLc8fPYeyODSSnn1j21NFYkp7g/V5aMDLV0HHM1cBZmtQ2Bnf4sGVEASUx5KmE9
 Dqr9K5ty4NXeWgjVnd/HV44Z0Ctj2D4k8AenVb+e1dCuF3xDE2wfwkwxiwd2cP0CVtY6
 iLnimhDAo1SZhpP4DwwunMbJOWu1dXV1oG2lcgWjD1SqDxrZvu6Z7ORHlRuDF1QjbjLX
 pOztEbUe6UHvG9qTI4FOu8nzJYDCGQ0rAuWWXxXmvHNDupIgz0C8oihmhOU9gd3PV0Ie
 X5sbzqduT1JY5ct5zuLUzS1CNVNG2EW1wPvTudw2mbCWWy1fJB0FoMwTaK0W1OH9VqRL
 Tfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=L/Hyw/5+8FMUHf9mlyLFosllpkdODuY36N0muhsO6pA=;
 b=uLIfBc+FzQB2EJKpJj7xgXrESkdIoD65qE8yGxGh1IB8WYaOcDnZKCn8dye9quMon2
 D5/GtqBAq//sudd1j5wcdF+GaDPKunFV8bpR6nfgWaB0Ngio+ersJDjPFuj57/UqheLj
 G4XK0T5/9fi8Je3kR4VPvkl9kGpkbphE5i6BxRMj5btdQamzYm95F55ZH95h23Tq5VwL
 GhmWSztOwwtmD3x3dfxpuJ8xcZNVgQDArfbVCM5YmoxYy3IfwZSRXGV9QTJbqMZ8YbQe
 kBdS/yeCg+Nb6vt86Lhw1+h7uLPKZ2V8t27HF6ix9dwqLFQK0p3JHDCh9TldGJOnuwA7
 osAQ==
X-Gm-Message-State: AOAM530/Oa5JvM83SYVa3gdsTbOIGKBjdIlCcZ9RToQCTQGrEQbOa+wn
 KUhfto/bPNjuaKFqgujx5jwf3mmPLtRI
X-Google-Smtp-Source: ABdhPJwlUZKwFUkd14meTGvBaF1ql7+7WS1zjDUWfkhpwxcXNQ/Bo0bAPkU3d34JO5BbnMTBJc4/2w+bDFTx
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:a0d:: with SMTP id
 dw13mr13692010qvb.54.1605501699533; Sun, 15 Nov 2020 20:41:39 -0800 (PST)
Date: Mon, 16 Nov 2020 12:41:21 +0800
Message-Id: <20201116044121.2457272-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH] remoteproc/mediatek: fix sparse errors
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_234143_333553_3C85A42F 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: drinkcat@google.com, kernel test robot <lkp@intel.com>, groeck@google.com,
 pihsun@google.com, linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes the following sparse errors:

warning: incorrect type in argument 2 (different address spaces)
   expected void volatile [noderef] __iomem *addr
   got void *addr
warning: incorrect type in argument 1 (different address spaces)
   expected void *addr
   got void [noderef] __iomem *
warning: incorrect type in assignment (different address spaces)
   expected void [noderef] __iomem *cpu_addr
   got void *
warning: incorrect type in argument 3 (different address spaces)
   expected void *cpu_addr
   got void [noderef] __iomem *cpu_addr

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 577cbd5d421e..99d5a4de3e2f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -298,7 +298,7 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
-static void mt8192_power_on_sram(void *addr)
+static void mt8192_power_on_sram(void __iomem *addr)
 {
 	int i;
 
@@ -307,7 +307,7 @@ static void mt8192_power_on_sram(void *addr)
 	writel(0, addr);
 }
 
-static void mt8192_power_off_sram(void *addr)
+static void mt8192_power_off_sram(void __iomem *addr)
 {
 	int i;
 
@@ -556,8 +556,9 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 
 	/* Reserved SCP code size */
 	scp->dram_size = MAX_CODE_SIZE;
-	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
-					   &scp->dma_addr, GFP_KERNEL);
+	scp->cpu_addr = (void __iomem *)dma_alloc_coherent(
+					scp->dev, scp->dram_size,
+					&scp->dma_addr, GFP_KERNEL);
 	if (!scp->cpu_addr)
 		return -ENOMEM;
 
@@ -569,8 +570,8 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
 	if (scp->dram_size == 0)
 		return;
 
-	dma_free_coherent(scp->dev, scp->dram_size, scp->cpu_addr,
-			  scp->dma_addr);
+	dma_free_coherent(scp->dev, scp->dram_size,
+			  (void __force *)scp->cpu_addr, scp->dma_addr);
 	of_reserved_mem_device_release(scp->dev);
 }
 
-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
