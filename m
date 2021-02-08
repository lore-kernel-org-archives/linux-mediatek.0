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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA30C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:45:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9774564E8B
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9774564E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MQRqxZiR+9jUkWavPiWaO+m7wFqR00wRwYuYQkD/+Js=; b=QfNZgBUguPOYq2/sy0rznupN1
	H5U4oEDuwd56C5j/2oOvIbN/NsQYghpnTtYDzY8RdCsWrRy/cM9l4pyaxIzJj7hdxjKOPcolCmlnM
	YdoVcJWU1GW4CIXcxuOrv3ofvWZ1OlZuNkEoVCR+KwQ1GMt5MAk41OPMgch/bBUTtLBPCDteLDEad
	EoyQwmcsRkkn47XNZaOOfuKXqlVEmENaw0oKSuoLtEb4pG27MpGY/Gb2C4jcG15QCKnYY/Nanbdzm
	GyTJ/AlZmZR5jHaSDZwzCNDkBAicGPOpyu6Dl0nLMnv3dKVAo/j2t+h+cXu7APbdeMEbYrdoOoAwb
	//bZI2gPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l936K-00070L-Bo; Mon, 08 Feb 2021 09:45:00 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l936H-0006yM-4Z; Mon, 08 Feb 2021 09:44:58 +0000
Received: by mail-pj1-x102a.google.com with SMTP id d2so8464053pjs.4;
 Mon, 08 Feb 2021 01:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+2LJpncxdzSbb/JP/0XuErEHxZj6Pmh4iBBisr0kOG4=;
 b=eoSVQ2muaJ+pVqkGqzBxIZzDgrgGsyDiXRCZmFV9L9n7+pkSgroRWyhD2jV+0AcVLG
 AOFKjQz+ap1lp+ggCTG9kFc8MQdOzIb9m6sgX39vmHE4PKikVhCQ0HDTZAYbQB0n64vt
 Wz3w343UiEsoVch4MDpixI6lJKewQfhF70VjnjNXia4F5WPcsURnhmyeKHgSB5YtB1Ru
 Y62qxIFWrBKnOxd3KzTOV3y21Xdy3+3GlwNt7uwen1+d/lzFuVPPePXor/9vdyjBhNgn
 Y0MK3QQp42rfQpaPyTDWliFzjGOx9iQuKGypiHL2CMfDlrpRmNGYQWGhD7o/4BHHBYoU
 LyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+2LJpncxdzSbb/JP/0XuErEHxZj6Pmh4iBBisr0kOG4=;
 b=qSpuBcl+nttn69rHB2773/w0gFRvo/S9jQA6Xxtm/0fwylXS9NyAuFtjwfRnEq7jAY
 X47PmbJOpuJjAXbn6lhEyQV4y+xO0drTy+bbiB/qhMlOoaQ5kLj6xY1FEOFIekduh/n9
 qAn0UkeHenSXvzrG3RKipB/REwldw3hu2beH06s++44/yp+UT1c0WizBRjt15ae1yY4O
 azu2jjuP0hpjKGfBK4h86I1JslMuva1kSAFelfLe7L3bCHOoReFvdf12QWle+JpSYGzC
 bH0t0UD+PynZOx8uSs5NxeeugKGJzSVZDSc5p90G8x2mOfJFZInFN3z/FyfCv09kEMbZ
 mDJw==
X-Gm-Message-State: AOAM532zzWqWMjHxsAC6y2ZtEhbPRRYV8A6pNPrCUFii+3K1L+qJ2fZl
 tqnjb4GcQQ6iCH2yqjxY0Kc=
X-Google-Smtp-Source: ABdhPJwpx+dpvv/Q7w/Knh/uslH+r/BOdF/3tWinThbnEoQ6gwUo3UPqohe7rKxVFh3iypYbua1d7Q==
X-Received: by 2002:a17:90a:28c6:: with SMTP id
 f64mr4703663pjd.50.1612777495161; 
 Mon, 08 Feb 2021 01:44:55 -0800 (PST)
Received: from localhost.localdomain ([49.207.205.214])
 by smtp.gmail.com with ESMTPSA id k69sm12208958pfd.4.2021.02.08.01.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:44:54 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v5 12/19] crypto: omap: convert tasklets to use new
 tasklet_setup() API
Date: Mon,  8 Feb 2021 15:12:31 +0530
Message-Id: <20210208094238.571015-13-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044457_203817_FBE42854 
X-CRM114-Status: GOOD (  13.92  )
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
 drivers/crypto/omap-aes.c  | 6 +++---
 drivers/crypto/omap-des.c  | 6 +++---
 drivers/crypto/omap-sham.c | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index a45bdcf3026d..7e4223716620 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -503,9 +503,9 @@ static void omap_aes_copy_ivout(struct omap_aes_dev *dd, u8 *ivbuf)
 		((u32 *)ivbuf)[i] = omap_aes_read(dd, AES_REG_IV(dd, i));
 }
 
-static void omap_aes_done_task(unsigned long data)
+static void omap_aes_done_task(struct tasklet_struct *t)
 {
-	struct omap_aes_dev *dd = (struct omap_aes_dev *)data;
+	struct omap_aes_dev *dd = from_tasklet(dd, t, done_task);
 
 	pr_debug("enter done_task\n");
 
@@ -1151,7 +1151,7 @@ static int omap_aes_probe(struct platform_device *pdev)
 		 (reg & dd->pdata->major_mask) >> dd->pdata->major_shift,
 		 (reg & dd->pdata->minor_mask) >> dd->pdata->minor_shift);
 
-	tasklet_init(&dd->done_task, omap_aes_done_task, (unsigned long)dd);
+	tasklet_setup(&dd->done_task, omap_aes_done_task);
 
 	err = omap_aes_dma_init(dd);
 	if (err == -EPROBE_DEFER) {
diff --git a/drivers/crypto/omap-des.c b/drivers/crypto/omap-des.c
index c9d38bcfd1c7..fddcfc3ba57b 100644
--- a/drivers/crypto/omap-des.c
+++ b/drivers/crypto/omap-des.c
@@ -594,9 +594,9 @@ static int omap_des_crypt_req(struct crypto_engine *engine,
 	return omap_des_crypt_dma_start(dd);
 }
 
-static void omap_des_done_task(unsigned long data)
+static void omap_des_done_task(struct tasklet_struct *t)
 {
-	struct omap_des_dev *dd = (struct omap_des_dev *)data;
+	struct omap_des_dev *dd = from_tasklet(dd, t, done_task);
 	int i;
 
 	pr_debug("enter done_task\n");
@@ -1011,7 +1011,7 @@ static int omap_des_probe(struct platform_device *pdev)
 		 (reg & dd->pdata->major_mask) >> dd->pdata->major_shift,
 		 (reg & dd->pdata->minor_mask) >> dd->pdata->minor_shift);
 
-	tasklet_init(&dd->done_task, omap_des_done_task, (unsigned long)dd);
+	tasklet_setup(&dd->done_task, omap_des_done_task);
 
 	err = omap_des_dma_init(dd);
 	if (err == -EPROBE_DEFER) {
diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index ae0d320d3c60..5dc7e23879a5 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -1725,9 +1725,9 @@ static struct ahash_alg algs_sha384_sha512[] = {
 },
 };
 
-static void omap_sham_done_task(unsigned long data)
+static void omap_sham_done_task(struct tasklet_struct *t)
 {
-	struct omap_sham_dev *dd = (struct omap_sham_dev *)data;
+	struct omap_sham_dev *dd = from_tasklet(dd, t, done_task);
 	int err = 0;
 
 	dev_dbg(dd->dev, "%s: flags=%lx\n", __func__, dd->flags);
@@ -2084,7 +2084,7 @@ static int omap_sham_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dd);
 
 	INIT_LIST_HEAD(&dd->list);
-	tasklet_init(&dd->done_task, omap_sham_done_task, (unsigned long)dd);
+	tasklet_setup(&dd->done_task, omap_sham_done_task);
 	crypto_init_queue(&dd->queue, OMAP_SHAM_QUEUE_LENGTH);
 
 	err = (dev->of_node) ? omap_sham_get_res_of(dd, dev, &res) :
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
