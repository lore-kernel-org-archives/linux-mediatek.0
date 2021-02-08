Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8604AC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:45:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3090264E7E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3090264E7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cDVXssKcVGrz5Ux5CJ3jqS7skXAh6mJGKWwlJy9xgj4=; b=R5rEbfFiyP0hzL5LFbvYrNrDb
	SgGu6Soxi9V8I2yP3SmOruvvaRzt3zz6MbyI5wAcj01kIloV2+2tlI0uH7zfG+faZah+psSViXzDl
	9EHOe52/5wBWkS+0w8VwyT8//c7mJvjXaeXr2hB5fo/zoPqwIt6GE2nk6EFTwLgoeZfAJMdZ4Ax8e
	hc4s7G9JbV9UjM8ksa3UEg8NkzaXKr/x9c3Py62KascyxGUMD8GfbVem3PXn0vaSR1WGnQgxfZKhf
	a+GuT1aFqgjjFfkvvRTdEck/KMBgHYUyZ2JYosbcczCP2ClG9Z2io/IEh7ZSfSTV/EjlVIJtoK4V4
	tG2Uf/Iuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l936m-0007D4-WC; Mon, 08 Feb 2021 09:45:29 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l936k-0007BP-KN; Mon, 08 Feb 2021 09:45:27 +0000
Received: by mail-pg1-x532.google.com with SMTP id o21so8445598pgn.12;
 Mon, 08 Feb 2021 01:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQh2IwNxftbR34HfI9l3nT7vPGQ8lmvW4dX0b9EAc7Y=;
 b=A3hAC2WJnvj0JnPzIYg6XVR2RbTYemoPhFpYlGmhRML8kEWdc6O34ZSjTz6JSs/CVo
 mreIe41ptn9ay3o326XfjefAqEsYrOaNbaR2NzsPvdJH3a/qhAHw9+E9tjw90t/L3GXk
 UJYpHTznGEd19p88KJKmn2Nq8b9Rqrt+HTbp/QTv5iHOMp6MToUKoxR5zFxjlq1b5iQL
 57EpCMHT/b6gNZhLD24D6NXBGWf1SWxxG/7b0g2d4XFe/79M8L2sJmkj/CbpBJTtRafI
 j2Scl7RFlh2iqk4aPSrd20AK6G/SOw2NCgC/z7CSxGJK50RMYNb45FpsIf/viXb83a8f
 rgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQh2IwNxftbR34HfI9l3nT7vPGQ8lmvW4dX0b9EAc7Y=;
 b=NL5RQ/FaphK5Xd2DVXeN5RIoOfrMO418ixKKhCXeUUeIoOKylOhHsHtp/STRSEi647
 cr5EkNOtgTb+xjMRyUKqTkZAwlpghxMS03AqAoxSv0QdeNlQinAm1+bEkAIuY1CybGSg
 vKzAU5Fx1A9mxcf9JBMrEgPoX1CcK8Q6oBdtndIkDY8nWK+ZEnasOvJCdRLXf3GI+Zc9
 nEJkdnqkJIYONuLXFgdkgkRn7sRIn4sjDdcqpI6jK90uA1T0LDlaVtwTUu+kljxan7rk
 5lSBFaYOyFAmDlFpKDDIurPILt7aytwYWvikbiq5U4z3xx2Q524JibRyHddvL6h2kmXX
 yFvw==
X-Gm-Message-State: AOAM530D+ww7RSa7h0j4hzFr3cvSIEnyXuqlhhmR0nIHARCo33lHcWrj
 kT4BUoF20OMpKpfUpEtrcxw=
X-Google-Smtp-Source: ABdhPJxqi3F7IE1oU5qYBa2zhUL4KqdMrmwE0b9P2NUYPGldVaqxzRGqsRLaDpJn7dsvuKF/4lhOGw==
X-Received: by 2002:aa7:8c12:0:b029:1b6:e47f:7458 with SMTP id
 c18-20020aa78c120000b02901b6e47f7458mr17015052pfd.67.1612777523449; 
 Mon, 08 Feb 2021 01:45:23 -0800 (PST)
Received: from localhost.localdomain ([49.207.205.214])
 by smtp.gmail.com with ESMTPSA id k69sm12208958pfd.4.2021.02.08.01.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:45:22 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v5 15/19] crypto: qce: convert tasklets to use new
 tasklet_setup() API
Date: Mon,  8 Feb 2021 15:12:34 +0530
Message-Id: <20210208094238.571015-16-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044526_765908_51BBE984 
X-CRM114-Status: GOOD (  12.13  )
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
 drivers/crypto/qce/core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 80b75085c265..374281e9d6b9 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -116,9 +116,9 @@ static int qce_handle_queue(struct qce_device *qce,
 	return ret;
 }
 
-static void qce_tasklet_req_done(unsigned long data)
+static void qce_tasklet_req_done(struct tasklet_struct *t)
 {
-	struct qce_device *qce = (struct qce_device *)data;
+	struct qce_device *qce = from_tasklet(qce, t, done_tasklet);
 	struct crypto_async_request *req;
 	unsigned long flags;
 
@@ -235,8 +235,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 		goto err_clks;
 
 	spin_lock_init(&qce->lock);
-	tasklet_init(&qce->done_tasklet, qce_tasklet_req_done,
-		     (unsigned long)qce);
+	tasklet_setup(&qce->done_tasklet, qce_tasklet_req_done);
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
