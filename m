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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D97C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:50:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B2622E02
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91B2622E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4jgdqrOaJqmaVDMJA0oyda160MEZGMSK0iYxrEatOLM=; b=OWTaQ7XxRnz3WK02V4x/SCIdS
	gYiHaLEEOESRgBzDqnm0blksHsXV75xEUSNp0SZjl6rWRhmoZ2gycnGDpH3lptp2H1sfH1FuCzmNY
	g0LJCI/Vy/i/D7G0mGodWEF0A6RbVo/kzsCAcWprhl3q93+4/qpl531JGOFWnm+G2Z9Pgb1JDQAdC
	QxGYdftex2EbzWuCr/5ah4UuX+7w6c72SuuAJ2tQG5oVlmEpHft4aO0rscX1yjEOh7ARWE9KTSN7R
	7ChJwndi1xUotbCEXpMo2P0yLmUsfkfdLFOCAN21xb9s4C4uI6cde0EFzLcgCt1gc8THG4NeKoKOS
	w32c7ooiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8ok-0004Id-50; Tue, 12 Jan 2021 01:49:54 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8og-0004G3-8f; Tue, 12 Jan 2021 01:49:51 +0000
Received: by mail-pg1-x52a.google.com with SMTP id n10so363017pgl.10;
 Mon, 11 Jan 2021 17:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hdFxs07OBJ0o+UoENy6opg4NHXCcbJpiwkpmIdQiwws=;
 b=FJdiFANvMr6hPlso1S2evd+zFtXBWgkIeiOXs8YUuvIMeBb0M9j3JNjt6b/T5byEgN
 ygaJTbhQVH19uvceTlN4Yofbl3VjYiq9X6MQ3AEf+J4YQy6YRWN8xxZYc/kZ0s8LiQZ6
 UgYAhKso1lUl1n205tYzvNbDUHnoqdKFgjoSvYWVJjHZCF4UQ//9l8TzmLL5Ege34lvo
 BKXjr9JcVHQ9Z2MTw9DvFfBA2xol34OpzBZ5LuWnSjR1NSLa/AxzNTQ3oKsh+WWvv/lS
 cop6/a44/SDw06dT6B0SThOFN6JuMgeX9DpNzSjO+dB+dSqvDn6K2mIQC6EvASp3H5d5
 c9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hdFxs07OBJ0o+UoENy6opg4NHXCcbJpiwkpmIdQiwws=;
 b=hUmDSeV8K9ZdtOX8EXDpvxka/XK7PHTx7aJWleVYYa90y1FKRXk9B+yyTFIBaWgbyH
 euvjD/mn8s+Zrf7KyWCxHh4f3iLYgkcf+4HsBgSHWfcE1QITrm5Zjk21f/NKf+gTPhIM
 /MmDIosoZJ7NL19Hz3i3ctODpqRGUhTmEIpL9r2TWsK7s06npOhsBGXv/DWYEvMBqo4p
 P9ZXsPd7R5XtW5NjTvzmBinpkBPRdaqKwj50U1ZQtT9cjXZ2aNRdaVSvHvsw12gAWKNH
 A+wGh7XM1V64LJ+QdPvsIZAVCgVEZuPBN75nOQ+7X0U7fdoYYDQof0Jf3Tn3iBDM6Z9f
 zcgQ==
X-Gm-Message-State: AOAM531yb9Xzfijdy+p4mbRQ15J1d/U5Ig8npnHFkOsoe5nt2yYLWWf9
 1pQxs//1IMZgQajGBhGVDeI=
X-Google-Smtp-Source: ABdhPJz2PBmKMYU/Dsu4VtrMyiTvF6rhR+M+Fm3V4NTKiKxfPTJd3CpJpe8t5OvauzLVcGA80CqhjQ==
X-Received: by 2002:aa7:9848:0:b029:19d:c24b:1179 with SMTP id
 n8-20020aa798480000b029019dc24b1179mr2450075pfq.29.1610416188197; 
 Mon, 11 Jan 2021 17:49:48 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:49:47 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 17/19] crypto: s5p: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:48 +0530
Message-Id: <20210112014650.10887-18-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204950_347999_F25F0AC6 
X-CRM114-Status: GOOD (  13.80  )
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

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/crypto/s5p-sss.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 682c8a450a57..128512a365e1 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -1445,9 +1445,9 @@ static int s5p_hash_handle_queue(struct s5p_aes_dev *dd,
  * s5p_hash_tasklet_cb() - hash tasklet
  * @data:	ptr to s5p_aes_dev
  */
-static void s5p_hash_tasklet_cb(unsigned long data)
+static void s5p_hash_tasklet_cb(struct tasklet_struct *t)
 {
-	struct s5p_aes_dev *dd = (struct s5p_aes_dev *)data;
+	struct s5p_aes_dev *dd = from_tasklet(dd, t, hash_tasklet);
 
 	if (!test_bit(HASH_FLAGS_BUSY, &dd->hash_flags)) {
 		s5p_hash_handle_queue(dd, NULL);
@@ -1975,9 +1975,9 @@ static void s5p_aes_crypt_start(struct s5p_aes_dev *dev, unsigned long mode)
 	s5p_aes_complete(req, err);
 }
 
-static void s5p_tasklet_cb(unsigned long data)
+static void s5p_tasklet_cb(struct tasklet_struct *t)
 {
-	struct s5p_aes_dev *dev = (struct s5p_aes_dev *)data;
+	struct s5p_aes_dev *dev = from_tasklet(dev, t, tasklet);
 	struct crypto_async_request *async_req, *backlog;
 	struct s5p_aes_reqctx *reqctx;
 	unsigned long flags;
@@ -2258,7 +2258,7 @@ static int s5p_aes_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pdata);
 	s5p_dev = pdata;
 
-	tasklet_init(&pdata->tasklet, s5p_tasklet_cb, (unsigned long)pdata);
+	tasklet_setup(&pdata->tasklet, s5p_tasklet_cb);
 	crypto_init_queue(&pdata->queue, CRYPTO_QUEUE_LEN);
 
 	for (i = 0; i < ARRAY_SIZE(algs); i++) {
@@ -2268,8 +2268,7 @@ static int s5p_aes_probe(struct platform_device *pdev)
 	}
 
 	if (pdata->use_hash) {
-		tasklet_init(&pdata->hash_tasklet, s5p_hash_tasklet_cb,
-			     (unsigned long)pdata);
+		tasklet_setup(&pdata->hash_tasklet, s5p_hash_tasklet_cb);
 		crypto_init_queue(&pdata->hash_queue, SSS_HASH_QUEUE_LENGTH);
 
 		for (hash_i = 0; hash_i < ARRAY_SIZE(algs_sha1_md5_sha256);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
