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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD65C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:31:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF1D23358
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AF1D23358
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cDVXssKcVGrz5Ux5CJ3jqS7skXAh6mJGKWwlJy9xgj4=; b=s7Pv++bnDATJtyHD9G5q/p7x8
	Nc6kKcjdeL7uOEeWQJU7LrCCBdYDg1J4HlUiFvB7iFOYQ/BYNnHmkg7JKAUe+2bv88z/7eNmQFRu1
	IeSMvHmwyMFwBptt8T9b1gC3PmORugvIAsguMN9xrYJPlp0nK9NBvjbW/udrDSmcGBDLiuV8hyqaY
	xCNjgrbQbR4ckFMvpE9gwglxQmPu2noz8Tsk8Ld2v8oqsowkT0VbFJ/mOW5qZLBzCS7Gnu4uDPpWd
	XDfbAouEdz9fo6buksoT2xSLJuWVKrJ1cS6ydpdQdo+go2q4DDFMVuPr9h40UAGjj08AAjRzwOFs+
	jfc53F52w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUS7-0004gn-Vt; Thu, 07 Jan 2021 12:31:44 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUS5-0004et-FC; Thu, 07 Jan 2021 12:31:42 +0000
Received: by mail-pg1-x52c.google.com with SMTP id v19so4707990pgj.12;
 Thu, 07 Jan 2021 04:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQh2IwNxftbR34HfI9l3nT7vPGQ8lmvW4dX0b9EAc7Y=;
 b=dGL5mWBcvHj+vnm8AjPqTntimPrEpTab2oHNsQsqlAP4yzhRCgol10ddlQIvkn9d82
 MLJ0MLh7mDWgvRyIEPRVqdGXqg7s9ab3x42Fsln6gs+5WzcEecWA6SVU8egl/Fb2FKtK
 sZgzq5Dvj7PqobU9umm8h3OyP0xgxLanlAv4AbOpuarLKRGZshQtqEJWHWPQKNeQF/o6
 w7D2oDO2FZrhKFjEgJP/vrw/Rtvr3F0Tpd0nty03wEGe9bmOK3jWo5pFcuiWAlMDsRco
 vmlzTBAnx4s/Krb3Di3bXmQ+yBl+I7KYs9ytlPK4k0aGmu3GCSerCTNwmgEFjr9h8Woz
 66Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQh2IwNxftbR34HfI9l3nT7vPGQ8lmvW4dX0b9EAc7Y=;
 b=IRJ3RV0uT6HgYXjEggecmEDR3+fLYu2Y5VmXA8hYOEbJbtUX9C2RgkJYqaSHirDozP
 D061nklSsN0xRC9zCclei3c9ckANtO6nShhfE/J+LpHKhXcROuLFTLtxD9dOedPl3X8G
 MQjupTIEbBAmuFepmahDO5NdxfDX9GRfdy6H98g6RPAuR+MbdMtQBA9GiktuQgZbQcs1
 1UVyes+LU8Ol54YaqH6it4M2wuzmalOI7GKHTDzx8NXm7Sr6PwXoPc1AVRk5maWtR7qp
 4sKmqYKRW5pZ+z0itrQgmyGP1JT6SMrG5QvLI2c6+0+jhQGhwXfeiiM6bRdjuKIs22Jx
 ruNQ==
X-Gm-Message-State: AOAM532NuD1roGvUnFuM91Zzo0W9azS66jHPPT5N2HmHC2DVZ3BrtiDb
 qso48epKsTXMf3OtDuJEsEA=
X-Google-Smtp-Source: ABdhPJz2CQX6v8/ZMQe6yTXb9e0CjOlBzYMMgjcHw7ulFh1JTqqcMFPoU5EF0ZbAkB/+YlsC8YdOFA==
X-Received: by 2002:a62:874a:0:b029:19e:6e03:cfc3 with SMTP id
 i71-20020a62874a0000b029019e6e03cfc3mr8250704pfe.67.1610022699768; 
 Thu, 07 Jan 2021 04:31:39 -0800 (PST)
Received: from localhost.localdomain ([49.207.216.201])
 by smtp.gmail.com with ESMTPSA id h12sm6356014pgk.70.2021.01.07.04.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:31:39 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v2 15/19] crypto: qce: convert tasklets to use new
 tasklet_setup() API
Date: Thu,  7 Jan 2021 17:59:40 +0530
Message-Id: <20210107122944.16363-12-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107122944.16363-1-allen.lkml@gmail.com>
References: <20210107122944.16363-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_073141_545937_2F14B03C 
X-CRM114-Status: GOOD (  11.82  )
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
