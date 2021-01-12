Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6100C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:49:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CD522E02
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52CD522E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cDVXssKcVGrz5Ux5CJ3jqS7skXAh6mJGKWwlJy9xgj4=; b=EdLqnu9fqP4pjYmnYf4hpXP+D
	t93WcIjkFc0tGzHX9kJyHKXMOMFQH0N0QTACpEXuANCrIKuCOwYOZ9f8Jbu8eAyAsXKVaClzH9yPC
	u/86rJxPdWa+GKFuUlDb2d2h+bHUI9TE2d+UWNLzw7H6hpOp4PcxXKnTbOnL3cMaOz+P3IaypBX1q
	O5qwsAGp/Wjtzx+Lfl5rRUlrbM5BILv3re6fIMz+Y1atw/bQVLLkZjkSf25xuXvzqhlPUoFqPIfNd
	mS306SpuQz4PNiHjeo3Z5V2gw8uyi8fFQXT+SNInG+lro6kKcXAKI+RKYQJfZ25bMm0+4w32B7tr+
	Epj1+2Bdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8oQ-00046c-T9; Tue, 12 Jan 2021 01:49:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8oP-00044u-5g; Tue, 12 Jan 2021 01:49:34 +0000
Received: by mail-pl1-x629.google.com with SMTP id b8so542493plx.0;
 Mon, 11 Jan 2021 17:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQh2IwNxftbR34HfI9l3nT7vPGQ8lmvW4dX0b9EAc7Y=;
 b=vLF+0YKIHD+wGmKY0SoKMw0rAk9JDQg+HeCpWTOTEn6g1z7DwBlA2q6bHAc5CVXUKZ
 UcFLvngbyhZMclhG8HpkJo8jzPS1dPlFleIhsrlkKFBw/7XEEX4c6UkJoIxbFh71fYdn
 ikp6SJdofZ8MqY7WJQ4to3GVn6DEpl9Z7U7N5uQjzX2IMnbwUZBMBOVv95kMQ7Yd6u+P
 3rjEm8QD0Fx1dPrjo6r20e3wZcDOf3k/0M1M128fGhhHm5fPzSDWow+cLM48vC65S/Jb
 mB9Y7pC+UPbldzDUSc5RKiZSxafKuXD3o3j80jmf6tLzR6tUeU58PSo01Km7fymI6UG1
 N2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQh2IwNxftbR34HfI9l3nT7vPGQ8lmvW4dX0b9EAc7Y=;
 b=m5TIiSBzyhhUnO/9o2/3ZHx36JeTRQROY7bTK3FaBmNMv3uMR9Jx5eR7Y7wfcCtyKR
 24MtA3ZoQy3h0HaE5hC5TBK5tRT4TMiPWTq+gSf5SpGMwZpqImkK0/XFCUN8s/7sTiVX
 2/QxKnHhxufJTcBx+Ap5uZGJvNQ/L+iAnFgojYPIHQpJRzkuzqUAVCO0VXbyyR2ZDRft
 VgrcWhUx/E/5Ku2ieeFXMT6x5xvYYXq7hEs2aaHhT6WfkZAmDv8Qc1x27qIFvReh+EbZ
 pLMpgGNbiikyppeb1zQ5RXNwDvq+pgaydn6phHM6JHTEU8QLOgucfdfQUWiJ1Lbe+w1e
 Bu9g==
X-Gm-Message-State: AOAM532ZjTzzbkRRKEyiZ3e/2YOdjnvwlkzpn4dzmYldslP5Gwtk5DFe
 XHc7UyQW8vwAbtKtumOFKQ4=
X-Google-Smtp-Source: ABdhPJyVBiLzaMU6e2OS0Djecxz6eUuTJelAmDYbc4kyrummQIG5Z07jUvLZwAFcWoD+PGSMTS79zA==
X-Received: by 2002:a17:90b:346:: with SMTP id
 fh6mr1785782pjb.225.1610416171302; 
 Mon, 11 Jan 2021 17:49:31 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:49:30 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 15/19] crypto: qce: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:46 +0530
Message-Id: <20210112014650.10887-16-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204933_253922_BD3FD253 
X-CRM114-Status: GOOD (  12.06  )
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
