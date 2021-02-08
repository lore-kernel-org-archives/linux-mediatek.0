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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBB4C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:45:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99AF364E7E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99AF364E7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UQisMRn3vGrrvcxh7hNt4vDBD92AfVR2d84yIhCQduE=; b=pUFntS2Fs5wK2YZnqJFgoL62l
	KaXRCDU6adTGV2jjkxlNwseV9oAGqJoVDlj4UIH9wEwW6Poz375I4SNszfRbk1Eu6AHQxP6mu+3Ae
	9JceBw7j4G6EJd5SB1fRj+Hc195DdS9YDUnq1SidWQCCGwb4FbgPbFF4EFV0RWGxAo8mZvzrWajZT
	nrCQrKN40Fo/bpmuJB3U+mHMjl81AaBRH3IYJiHaIR8hqg6y6U+AmSEc1VtF+oph+U/ATCVVWLZrf
	PVukpvgtmeT7pzdT6xZxtAbMBa6LwqpRGEwLC1iA+YXrYPX2PEue1vmvcHJXJ5J3Agnca21mUe5Qf
	J2qiVtsSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l936v-0007GT-EN; Mon, 08 Feb 2021 09:45:37 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l936s-0007Eq-Si; Mon, 08 Feb 2021 09:45:35 +0000
Received: by mail-pj1-x1033.google.com with SMTP id my11so9139497pjb.1;
 Mon, 08 Feb 2021 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YEPwpL8tIwFQ2pgUdTDSsmDRSKgoB9OQrqIbywK9g6k=;
 b=YJvUNAJ5yWFhEd1FkVQ6qf8rEdQqScIkeeQBVSNUj5gip2ZMX3Nmh8TkHYZvVL2eD8
 gM907Th6gGlpZMg1RHLSQk4Scfgu30CDgZZ0yrLoHlgO4bLoRzBovvZdQ+7igAtbXnJZ
 87Wnr1TTAKaxdSTeZ29gOyMEvNdOBa6nUKVajbeU+8A3cMrjugRHUWev5DQX1n9PHP5+
 F7be1ctOV3F05l8Idlmv5rFtb3SyhyqhqtCELmSVOwyaWpGLM4idq3vX4gcQznfil2FP
 zKeXVV9oGhAD3Rd4jK302fvRGzBacP5ZR8JNrX/0xrxZfP6Hte/ldS5nwYo3urGe2r7r
 hcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YEPwpL8tIwFQ2pgUdTDSsmDRSKgoB9OQrqIbywK9g6k=;
 b=VBM2U+/lrQ3jInwha6AuEuxoSdyK9GPX8XY305zoKQHSuLatdCPjd0bHjvVdkMliVh
 2ehTr/Ia17wBpy0SepjbopgbrZ087JGQZBNe8qIt1eXkgPZob7Nb/1oGJY0rS3WvZLMp
 xBX6Hagi8uN5eJHIvARPMojVJ7a0blXixLQ9smvhEWrhAxpLKoS0j1hOwi7D8fimH4G0
 sKb59nwYBOk6tF/8UHsf1Tu2KdPbmxyNijFYfd9IvjAQ+ZeTpcdrYSgKs7ltVmJHso83
 4+b4jZrF6Lz4rGPzadEG5xgI3f2aMH3Nm+kIzZvx+Yn7BPSXsLnFJWh960jaZGpY1sZA
 QOaA==
X-Gm-Message-State: AOAM5317DO8NMjeAAEwtePAX6aJrujHNd+rdtBNwUKhmmn6+PCb3fMOU
 pNMHXPxaSM9VuOBajcSGiag=
X-Google-Smtp-Source: ABdhPJz7y1k4HMKwSV/qwtnFW2t8QcmgRok8+6x1gYzOq1twN+xAwp84b0pcXY3xoQs9EvkDcT8ZDw==
X-Received: by 2002:a17:902:fe09:b029:e1:6964:98dc with SMTP id
 g9-20020a170902fe09b02900e1696498dcmr16012094plj.24.1612777532604; 
 Mon, 08 Feb 2021 01:45:32 -0800 (PST)
Received: from localhost.localdomain ([49.207.205.214])
 by smtp.gmail.com with ESMTPSA id k69sm12208958pfd.4.2021.02.08.01.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:45:32 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v5 16/19] crypto: rockchip: convert tasklets to use new
 tasklet_setup() API
Date: Mon,  8 Feb 2021 15:12:35 +0530
Message-Id: <20210208094238.571015-17-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044534_941113_42BF5B29 
X-CRM114-Status: GOOD (  13.56  )
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
 drivers/crypto/rockchip/rk3288_crypto.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index 35d73061d156..85f314c79734 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -201,9 +201,9 @@ static int rk_crypto_enqueue(struct rk_crypto_info *dev,
 	return ret;
 }
 
-static void rk_crypto_queue_task_cb(unsigned long data)
+static void rk_crypto_queue_task_cb(struct tasklet_struct *t)
 {
-	struct rk_crypto_info *dev = (struct rk_crypto_info *)data;
+	struct rk_crypto_info *dev = from_tasklet(dev, t, queue_task);
 	struct crypto_async_request *async_req, *backlog;
 	unsigned long flags;
 	int err = 0;
@@ -231,9 +231,9 @@ static void rk_crypto_queue_task_cb(unsigned long data)
 		dev->complete(dev->async_req, err);
 }
 
-static void rk_crypto_done_task_cb(unsigned long data)
+static void rk_crypto_done_task_cb(struct tasklet_struct *t)
 {
-	struct rk_crypto_info *dev = (struct rk_crypto_info *)data;
+	struct rk_crypto_info *dev = from_tasklet(dev, t, done_task);
 
 	if (dev->err) {
 		dev->complete(dev->async_req, dev->err);
@@ -389,10 +389,8 @@ static int rk_crypto_probe(struct platform_device *pdev)
 	crypto_info->dev = &pdev->dev;
 	platform_set_drvdata(pdev, crypto_info);
 
-	tasklet_init(&crypto_info->queue_task,
-		     rk_crypto_queue_task_cb, (unsigned long)crypto_info);
-	tasklet_init(&crypto_info->done_task,
-		     rk_crypto_done_task_cb, (unsigned long)crypto_info);
+	tasklet_setup(&crypto_info->queue_task, rk_crypto_queue_task_cb);
+	tasklet_setup(&crypto_info->done_task, rk_crypto_done_task_cb);
 	crypto_init_queue(&crypto_info->queue, 50);
 
 	crypto_info->enable_clk = rk_crypto_enable_clk;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
