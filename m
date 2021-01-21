Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1494C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:44:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9763B206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9763B206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cDVXssKcVGrz5Ux5CJ3jqS7skXAh6mJGKWwlJy9xgj4=; b=IDuWSiR+7jZhtulLX5ko5X6+A
	sDCQ7+96ZIND4SQHv60bXjQO4nnec5F516TXcQ2z0qqad/1TWp7efXcyZV7muLOuRO8HItbkXAGYJ
	Ffm7erPQakPlO7gEqyNk/d10XOOtUrvi5z3VP/iTT7pQIWUS/C1Eh6xKylJexMPuTr0Ko0iiYi69P
	cAFmJuJUfZKPfscPQQ1kPPAfMokMDW+MxBcuxT0CjTMtoHoAUnS1+kJKRekVXtY3vWPHH7wx9xEmD
	UgDp+0MVxLsTdBqtDfaWPQd6UnwatgCqY2Ab5JnyO2fjJBDsznG26Y1Ueph+xbxD9NxUbyQDKgcAL
	XutjQttOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2RpU-0008WD-Ry; Thu, 21 Jan 2021 04:44:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2RpQ-0008TP-4p; Thu, 21 Jan 2021 04:44:18 +0000
Received: by mail-pj1-x1030.google.com with SMTP id kx7so807894pjb.2;
 Wed, 20 Jan 2021 20:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQh2IwNxftbR34HfI9l3nT7vPGQ8lmvW4dX0b9EAc7Y=;
 b=BupZcrXhhNK8Ef6ojLlQM42EwDg3c1oTSVd8H+/oHXiemqGl5WEzw5ar1WiOZx+iC1
 jvVMgDVDYdxjTtfxYu78QrlC0iD6CqYMsHQO14d3u/k/FzKXX6SQP2XOINno1iXJgCld
 4rZ5ayp0ch64tHhDbqoBufiU0rftkrB4lzOgJvHfBiRYnwclH042wfAC1IOVo8or3EvO
 JrX4jA2FS/PZ0Oi6MEceS+MYxaga4gy2lmJSbASRPTx+WtxyunTISoxeVi7oSbv5GNe+
 oHPTQXwPGwEWVuhWPI9AHbUS2BYxMiz7KP0iypNrPDePZi/GniAt/ru7X3bHn5ZdOkwi
 5zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQh2IwNxftbR34HfI9l3nT7vPGQ8lmvW4dX0b9EAc7Y=;
 b=o1enQQq65cItHgEEVkdMEanZ8E0PF1x8I48tstnPQq0aVrjha0s0rGu+Pqj3iUO0Me
 Ja00CpvryxSIUP6PlGtIsA2sje2Zhz+uxRhZITJNTRpbklGFccmu9HghL4/G0PQDNafk
 ulYNGntIfuuc9MkcNHHM47uggLn2e1cbJ/Yo5TsIdKWWxsXl0X/CZj60FzyLwha5mFyQ
 J1YlDWobcQbbY1I5U7rLENLq0pXnGA17Qeiz+LqpjLIV5yJWHndWlZc4oJRcXBFKvlDR
 jv9gRWYqComsQ9zYqYMViLMh85wh0k/qf2u1YYvlJ9FUaos++onRh1eyTOloAc3sosFl
 Wycw==
X-Gm-Message-State: AOAM532AGKP0MTEPT067L7y4r2cn/5v28WW2tGrou0o5tZ6c0EXQnmVb
 oGst9EK7VSJSko6Ues9wAWg=
X-Google-Smtp-Source: ABdhPJxihhD7rtz9KUgJnDNb27lJMLl+Qqb3jgEHtXH3KDbu2VD5PkvZTpN9Xi673Iz88wL6BF/1ZA==
X-Received: by 2002:a17:902:a501:b029:dc:3e1d:4ddb with SMTP id
 s1-20020a170902a501b02900dc3e1d4ddbmr13240061plq.60.1611204254054; 
 Wed, 20 Jan 2021 20:44:14 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
 by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 20:44:13 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v4 15/19] crypto: qce: convert tasklets to use new
 tasklet_setup() API
Date: Thu, 21 Jan 2021 10:11:22 +0530
Message-Id: <20210121044126.152274-16-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121044126.152274-1-allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_234416_227977_D0297B71 
X-CRM114-Status: GOOD (  11.95  )
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
