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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63D0C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:42:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91598206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91598206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Cj9qtdhYweGNz/GUy4eZKVS8LAMtcU0X8fFlI+B1S4=; b=tJ9NE864BukH15188qlZglgvI
	X1eACT5+0JBj0dZ+wepDyuD4jEcXZoLmxXb12WTSgHva178zH1Zj3OuRj5BKaZ/TkuHZfIsfuWVor
	0ZuFoAcmzRrmNtLwy2+v+R/ziJjWksDqTqc8EfLCz26Gat2UJSxWMkkgvbyMFLEQdU3xXoRrkWv0K
	nZdsiK4+NAI1l2IYfTZudigkzFYnO6jeGCuI0MsXPV/DRINVno0zakDpgcWqc6cR9Y4bC5Qtx3PDJ
	jICTD9UAFht4jCwK9AGa1eewFiqyMNwa5VoQ5ipXiu5J1/It1l1GJYNNNeF2/DU82upxrcP68G8W8
	Q/ZfL86GQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2RnV-0007U4-OH; Thu, 21 Jan 2021 04:42:17 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2RnS-0007SA-Fw; Thu, 21 Jan 2021 04:42:15 +0000
Received: by mail-pf1-x436.google.com with SMTP id t29so755577pfg.11;
 Wed, 20 Jan 2021 20:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ChEdTs09dQ0RBgzbeZxLNBVFnUFhvXMwpM6L2ZZDSyQ=;
 b=KvShdbpgZQGFjlp8uI4TxtE3bEvUl7eJ9+58vQiV7UUWClefgys6P5UWJOeFfOO4s6
 iXE9k4/KpixLotFwX6CMkUhXEekcidnYyf7r0yEqgWdEJHRU96y3mZdOrc0NMjmPMppz
 0BVjikc/C20sfVpR1yIWdtVMubc91biFMOw6SUaCKHmHl6pxVHilYmWo3iu39cl4Jszh
 WvG29NwzTRxDrp46j5d6awW+vmidYwLfcBMb4x+ifBHDMliBM/x6ckV9kKf1dXWEJfVx
 W/to4otL5oaeptkREa8FNq1jzqCCeEQ4pqcwWBHj4xL1jdTe+f8rapVyb19i9oupEpzC
 n7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ChEdTs09dQ0RBgzbeZxLNBVFnUFhvXMwpM6L2ZZDSyQ=;
 b=EmhC6mWVac3UmJX+zGfYQwIqsxgJY9TrTANbK0sHgta65DG9NIURZd72ROviQUNcmB
 eyglMo563PWQ/Ubud7GioY1KeyL8kViU15gfgZaltlCjuLFJFGylJugu8ghg4flUrNXG
 uJlPIQSfMta3hl5uxFFBwd/iDguTkUzgeOzyMZ7ZC3TYr6x293m5Xsdqhexh1aWW6QTU
 obfZx5cL+6+b9ncP6jy/Ps2GEyB/0NF0HFpqidDa/ayCFAx1kxnYqFT3pCHOTIQmv4Cy
 k5cNrAY2VpydKEa5WTSPqzW5HIX/OlbW+0MCuem+70Ztky2rMPYpURxevnqhmhiabBe/
 8nUA==
X-Gm-Message-State: AOAM530tYwbm1+h4IRt/82sPljy9/4YBhCW6eDo0oIbKHX8BHvuGvfMg
 GEZLF6Yp8UeHeRPeMC2rEsA=
X-Google-Smtp-Source: ABdhPJyU28grIyTHLl0ka3Qi5jVmnSsmWrSzIblQ0aYXzCs/hgUfCfjr+KJ3CsYlTQa6ciboZK20ng==
X-Received: by 2002:a62:6341:0:b029:1ba:d55d:1d0a with SMTP id
 x62-20020a6263410000b02901bad55d1d0amr6199934pfb.79.1611204132571; 
 Wed, 20 Jan 2021 20:42:12 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
 by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 20:42:11 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v4 02/19] crypto: atmel: convert tasklets to use new
 tasklet_setup() API
Date: Thu, 21 Jan 2021 10:11:09 +0530
Message-Id: <20210121044126.152274-3-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121044126.152274-1-allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_234214_707258_6D86EB70 
X-CRM114-Status: GOOD (  12.99  )
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
 drivers/crypto/atmel-aes.c  | 14 ++++++--------
 drivers/crypto/atmel-sha.c  | 14 ++++++--------
 drivers/crypto/atmel-tdes.c | 14 ++++++--------
 3 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index b1d286004295..804e6a5a39d4 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -2300,16 +2300,16 @@ static void atmel_aes_dma_cleanup(struct atmel_aes_dev *dd)
 	dma_release_channel(dd->src.chan);
 }
 
-static void atmel_aes_queue_task(unsigned long data)
+static void atmel_aes_queue_task(struct tasklet_struct *t)
 {
-	struct atmel_aes_dev *dd = (struct atmel_aes_dev *)data;
+	struct atmel_aes_dev *dd = from_tasklet(dd, t, queue_task);
 
 	atmel_aes_handle_queue(dd, NULL);
 }
 
-static void atmel_aes_done_task(unsigned long data)
+static void atmel_aes_done_task(struct tasklet_struct *t)
 {
-	struct atmel_aes_dev *dd = (struct atmel_aes_dev *)data;
+	struct atmel_aes_dev *dd = from_tasklet(dd, t, done_task);
 
 	dd->is_async = true;
 	(void)dd->resume(dd);
@@ -2499,10 +2499,8 @@ static int atmel_aes_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&aes_dd->list);
 	spin_lock_init(&aes_dd->lock);
 
-	tasklet_init(&aes_dd->done_task, atmel_aes_done_task,
-					(unsigned long)aes_dd);
-	tasklet_init(&aes_dd->queue_task, atmel_aes_queue_task,
-					(unsigned long)aes_dd);
+	tasklet_setup(&aes_dd->done_task, atmel_aes_done_task);
+	tasklet_setup(&aes_dd->queue_task, atmel_aes_queue_task);
 
 	crypto_init_queue(&aes_dd->queue, ATMEL_AES_QUEUE_LENGTH);
 
diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 352d80cb5ae9..8ec8a32606e8 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -1314,9 +1314,9 @@ static struct ahash_alg sha_384_512_algs[] = {
 },
 };
 
-static void atmel_sha_queue_task(unsigned long data)
+static void atmel_sha_queue_task(struct tasklet_struct *t)
 {
-	struct atmel_sha_dev *dd = (struct atmel_sha_dev *)data;
+	struct atmel_sha_dev *dd = from_tasklet(dd, t, queue_task);
 
 	atmel_sha_handle_queue(dd, NULL);
 }
@@ -1353,9 +1353,9 @@ static int atmel_sha_done(struct atmel_sha_dev *dd)
 	return err;
 }
 
-static void atmel_sha_done_task(unsigned long data)
+static void atmel_sha_done_task(struct tasklet_struct *t)
 {
-	struct atmel_sha_dev *dd = (struct atmel_sha_dev *)data;
+	struct atmel_sha_dev *dd = from_tasklet(dd, t, done_task);
 
 	dd->is_async = true;
 	(void)dd->resume(dd);
@@ -2570,10 +2570,8 @@ static int atmel_sha_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&sha_dd->list);
 	spin_lock_init(&sha_dd->lock);
 
-	tasklet_init(&sha_dd->done_task, atmel_sha_done_task,
-					(unsigned long)sha_dd);
-	tasklet_init(&sha_dd->queue_task, atmel_sha_queue_task,
-					(unsigned long)sha_dd);
+	tasklet_setup(&sha_dd->done_task, atmel_sha_done_task);
+	tasklet_setup(&sha_dd->queue_task, atmel_sha_queue_task);
 
 	crypto_init_queue(&sha_dd->queue, ATMEL_SHA_QUEUE_LENGTH);
 
diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 4d63cb13a54f..b7a734f666ae 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -1049,16 +1049,16 @@ static struct skcipher_alg tdes_algs[] = {
 },
 };
 
-static void atmel_tdes_queue_task(unsigned long data)
+static void atmel_tdes_queue_task(struct tasklet_struct *t)
 {
-	struct atmel_tdes_dev *dd = (struct atmel_tdes_dev *)data;
+	struct atmel_tdes_dev *dd = from_tasklet(dd, t, queue_task);
 
 	atmel_tdes_handle_queue(dd, NULL);
 }
 
-static void atmel_tdes_done_task(unsigned long data)
+static void atmel_tdes_done_task(struct tasklet_struct *t)
 {
-	struct atmel_tdes_dev *dd = (struct atmel_tdes_dev *) data;
+	struct atmel_tdes_dev *dd = from_tasklet(dd, t, done_task);
 	int err;
 
 	if (!(dd->flags & TDES_FLAGS_DMA))
@@ -1177,10 +1177,8 @@ static int atmel_tdes_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&tdes_dd->list);
 	spin_lock_init(&tdes_dd->lock);
 
-	tasklet_init(&tdes_dd->done_task, atmel_tdes_done_task,
-					(unsigned long)tdes_dd);
-	tasklet_init(&tdes_dd->queue_task, atmel_tdes_queue_task,
-					(unsigned long)tdes_dd);
+	tasklet_setup(&tdes_dd->done_task, atmel_tdes_done_task);
+	tasklet_setup(&tdes_dd->queue_task, atmel_tdes_queue_task);
 
 	crypto_init_queue(&tdes_dd->queue, ATMEL_TDES_QUEUE_LENGTH);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
