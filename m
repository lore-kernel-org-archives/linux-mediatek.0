Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEFEC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:27:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 259B823356
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 259B823356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dkwS2nkRhtDgd7va9wmmgEh5uZDQuVExfdwkNpLGewU=; b=M2MC/Fh851i56b2Rk5BqKka5l
	qlcFaWvseqfwpfev7fvP1RF4e5VS5IavQZlK6h9+ixY7Y8L+nma9cNOEkyngWYbaSzBJAbMeyY/ks
	XEvsbJzABrkk3U9GAJZ1XOdyNPsGJ4mVm5wsy3V5yxudFOuEBJQ05UVvm3fR4QtE/tdMCecjIHsX3
	4fCkLhsLZcsev9gULtM+TW1PEnnmFpLa/YFER29P5PYvQARL1jsY/Uo55Qaih5az0Bj8tuzKW2TMK
	1uYGjT4j9Qg1pULgLwwhR/OCrq2EQ+4GdVZJjT3+a6Vw8oVSmADRN6ovSi9H1/TEIBXAgAricnjps
	nqwp/xFzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUNt-0003bj-Kd; Thu, 07 Jan 2021 12:27:21 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUNq-0003az-R4; Thu, 07 Jan 2021 12:27:19 +0000
Received: by mail-pf1-x436.google.com with SMTP id m6so3761592pfm.6;
 Thu, 07 Jan 2021 04:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qu9jTq4Mhds1PLReGFI6BuQWWjoITkJw1sqRT7XAn7M=;
 b=QC08WxFbW+qIztVxBinWE5vs7IHHEhE3+M6tuDRvQi69LJbJ6fap5aP6NxviDUZ0Fv
 NOYboVzE5XO/yPpV1qHjKJMTd0JsECGmnj14cr6L3G39uy9Pjq5P19dNdg8wMtr8i3pt
 dUkrZB/iH0b2l84GCJyEKnaAJrykR6bRNhJEKV/3MOo1JRovquSz4KiMtuW5pzQT7iSg
 /EDg45nLnuGsvTelzscW1WfpG1eXUsifA/ZD0Hto17AEq4yMv3rQsg1JoSsLiTDLLv2o
 3JEncImGFvwY3tXhhD1XSHIdxY6+ltkiQ/C/B4njyP41JG5Fk6SINZ5gJTQl88Zi171p
 bwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qu9jTq4Mhds1PLReGFI6BuQWWjoITkJw1sqRT7XAn7M=;
 b=JJFZ2Ao2645RhQfWDUy11IrBUyaoCEx4MAFfcSs19c4VeqUfjkZ6lVYBEh3SiqFDLr
 n2lJw9QekwhNp7LDDVWfY/az0FYOccMTCb8ItB2j/lDgaFOhsJh+7PtsyxdL5uDyBPPG
 6RQ4dJooPRkKWkAfqsgK3jci92981Nof2TBX/EVr4cYEZQcveXAHIqR7+fTWthGpVH66
 upKUbkYNJj3Ayrends0DcTUzIe8sq3MVn/P3sPLMn78UpFh+V3haroi54gOLnW/qpaI5
 0/5cdKS7M4qXazggL2ncbbFQTMBxJ0sV4RPiW1xoXRDuBYL6lt5fOC/b2J8Hceot2ofG
 A6tg==
X-Gm-Message-State: AOAM533tDdqmzdAkEGZfeCmLZPiH83G/hgvmghZl6zCACjwtZ6giTOx/
 /ZyjI2xU/SwUjH4bjwu4x+s=
X-Google-Smtp-Source: ABdhPJzmtC0ZYYtJdJncyLo9jUcCmBc8rPOUk0rIqkXUz5Z6T+Z47y0DxRXaN43On1iH8mzHPPPjJg==
X-Received: by 2002:a63:2ccf:: with SMTP id s198mr1638747pgs.30.1610022436883; 
 Thu, 07 Jan 2021 04:27:16 -0800 (PST)
Received: from localhost.localdomain ([49.207.207.140])
 by smtp.gmail.com with ESMTPSA id x28sm5860403pff.182.2021.01.07.04.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:27:16 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v2 01/19] crypto: amcc: convert tasklets to use new
 tasklet_setup() API
Date: Thu,  7 Jan 2021 17:56:28 +0530
Message-Id: <20210107122646.16055-2-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107122646.16055-1-allen.lkml@gmail.com>
References: <20210107122646.16055-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_072718_938940_4D546796 
X-CRM114-Status: GOOD (  12.39  )
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
Cc: giovanni.cabiddu@intel.com, alexandre.belloni@bootlin.com,
 aymen.sghaier@nxp.com, heiko@sntech.de, qat-linux@intel.com,
 jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, horia.geanta@nxp.com,
 k.konieczny@samsung.com, schalla@marvell.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 thomas.lendacky@amd.com, arno@natisbad.org, vz@mleia.com, gilad@benyossef.com,
 gcherian@marvell.com, linux-mediatek@lists.infradead.org,
 lars.persson@axis.com, matthias.bgg@gmail.com,
 Allen Pais <apais@linux.microsoft.com>, john.allen@amd.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/crypto/amcc/crypto4xx_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/amcc/crypto4xx_core.c b/drivers/crypto/amcc/crypto4xx_core.c
index 8d1b918a0533..0e13430a5b9b 100644
--- a/drivers/crypto/amcc/crypto4xx_core.c
+++ b/drivers/crypto/amcc/crypto4xx_core.c
@@ -1072,9 +1072,9 @@ static void crypto4xx_unregister_alg(struct crypto4xx_device *sec_dev)
 	}
 }
 
-static void crypto4xx_bh_tasklet_cb(unsigned long data)
+static void crypto4xx_bh_tasklet_cb(struct tasklet_struct *t)
 {
-	struct device *dev = (struct device *)data;
+	struct device *dev = from_tasklet(dev, t, tasklet);
 	struct crypto4xx_core_device *core_dev = dev_get_drvdata(dev);
 	struct pd_uinfo *pd_uinfo;
 	struct ce_pd *pd;
@@ -1452,8 +1452,7 @@ static int crypto4xx_probe(struct platform_device *ofdev)
 		goto err_build_sdr;
 
 	/* Init tasklet for bottom half processing */
-	tasklet_init(&core_dev->tasklet, crypto4xx_bh_tasklet_cb,
-		     (unsigned long) dev);
+	tasklet_setup(&core_dev->tasklet, crypto4xx_bh_tasklet_cb);
 
 	core_dev->dev->ce_base = of_iomap(ofdev->dev.of_node, 0);
 	if (!core_dev->dev->ce_base) {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
