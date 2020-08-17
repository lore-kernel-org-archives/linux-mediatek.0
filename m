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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A04AC433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:49:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D722177B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UOTy54Nn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtvONkuD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16D722177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIwRBmTYfHwvP8UQdm5unZnpsR071DH79OseBWNL+0Q=; b=UOTy54NnRT+Mhyda3Wa3S3vwgk
	Pge5C4uNZ1dcJTCT/2N4DKOorfCjkSC+0qKJNoY52WSReIPRVFFnsiH3ySEQg7O6W2EPzNeDa1K54
	1etdo1YpxPUOdpeE6KFncfHCoOfe54eyi1yrBh1aGATVbMDTVrRgFUHly7qhRrVarDlz6m6DB8IOV
	rXHP4IYoodvkQQt/cKUt+huStNSa1EpM9hy6gkML/4foy7/Nl40xlaG+FUU7UocGAB+I7Aw9RNC+P
	IG70eMojUBF3JxCNeJVYknfnTi8ArsxYNFDXT3/8Vpvk/iPhOoJvkxzkQ7qN/X8dDF2v4vzgdIe4q
	QWa8/kgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7chD-0001cq-Nb; Mon, 17 Aug 2020 10:48:55 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7ch3-0001Yx-2H; Mon, 17 Aug 2020 10:48:45 +0000
Received: by mail-pg1-x541.google.com with SMTP id o13so7949293pgf.0;
 Mon, 17 Aug 2020 03:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wr09/zFN7INgSL/hkVohJfKLUB87eURQe5zN5T5ukzo=;
 b=OtvONkuDX/JtzqrfZY+TxOmI8lyI6PDeI7k0FZY4qhEoncR0+soBHQhZtFjF+usPRr
 1ze3nfbc20Yp138T4zZo9DT0pewwaoxDysUNteVuUtIDF2hujacA6Q3psOT5Z5fIRUvA
 7AA2UQAqLT8wzZRDIUyIs926/HYiA6IESW69ySeDrPIHSLiNuP3N2VZDxNBeWESNDs2v
 A44H2aMiCroqhnMQ+PFB3M9db6eSphx7/EQYSPUcryYwFurEIX+Asq8+61bSQFLg12Ap
 ca15SA0pY/9Q3rQ5DeTExsJxb0163NuzzVEQ1fZFn92QDJmHQzAZwVP3Ilban7ZtCZV7
 f9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wr09/zFN7INgSL/hkVohJfKLUB87eURQe5zN5T5ukzo=;
 b=GEDXosoKLlDEpgWzxBlsPcgmY1yFcZK252tSIGzvDUXuvH2kYPcAgmru1Y3c088XjL
 O/IzgR4RE+dbgCfWZLe/X2WodljAjyD1stw6Fd0Yq7VLMYLTl0BTYYgQSTiUO8b2mDHh
 IIz9kkjAFw8fyzBHsspJ87sYeBIXB5X+NmvhH9CQxYjLqYBAekdNUZHDMRzhrSy9Ljhc
 DgyF77srLvQz8HFTGLNG9zib2GiLi7Bz0MstB/DrbFEcHvYhJrphDbQynBl50e36fEbz
 BKfqevdcewXYfinTpS4pxhseNFzxHojZ/DOOBtssxF/qcmm57LZ0vP60FJu+nfYHGQMR
 x7Kg==
X-Gm-Message-State: AOAM533su/kImPNCsr9tqyw3hCgUwzDjSnKZe1zjjCOy+/40cj05FE1J
 6W30/5zpgB5uXEc53YRlvGU=
X-Google-Smtp-Source: ABdhPJypfnuZ3OolRwpPhckjGq08CPfzsBhlNMD0yOvzvwP6FwnpGP6tL5N7eubwyT2d0PQIaARwGQ==
X-Received: by 2002:a62:26c2:: with SMTP id
 m185mr11042846pfm.115.1597661322750; 
 Mon, 17 Aug 2020 03:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:577:c217:67e6:a40c:a3bf:1945])
 by smtp.gmail.com with ESMTPSA id k12sm16976528pjp.38.2020.08.17.03.48.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Aug 2020 03:48:42 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v4 1/9] mfd: mt6360: Rearrange include file
Date: Mon, 17 Aug 2020 18:47:49 +0800
Message-Id: <1597661277-27862-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_064845_158231_5630345D 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Rearrange include file without sorting by alphabet.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index e9cacc2..c7a955f 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -5,15 +5,14 @@
  * Author: Gene Chen <gene_chen@richtek.com>
  */
 
+#include <linux/crc8.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/core.h>
 #include <linux/module.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#include <linux/version.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
 
 #include <linux/mfd/mt6360.h>
 
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
