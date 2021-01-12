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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D787C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:49:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B48422E02
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B48422E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UQisMRn3vGrrvcxh7hNt4vDBD92AfVR2d84yIhCQduE=; b=qW7CfwsMwFmCeNmy/E+WXYuXl
	qLIkc3INFulIDZafVjjMxFsH1CFKAIIoEVP9oeYLuCtFT2ZViCFLsmUfp3UOppefrGJYg+WswNW+f
	r/1I+QroMz1Ob7WnHqOOrzOjFFXZzHrjzbzbtX0j2qt/3aTX+gUMEj+5/iRdON729VQkmGF6qtHnG
	TvRdK7oZ6Y/XSgvZzsJXuQlFHnKpSoql0o0bIqEBPE9SzEQv47Il4pNfTV/37xBXyi6mzAxV3iJEa
	94/jq3IqOYdKQcLFfjWeFPdmUOrBshsZfp3EYc8cKH5XIgU+5QGd9WyC4dITxL8qAJireDN7u5FiN
	gXMpfncKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8oa-0004DF-Re; Tue, 12 Jan 2021 01:49:44 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8oX-0004AC-AP; Tue, 12 Jan 2021 01:49:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id my11so55168pjb.1;
 Mon, 11 Jan 2021 17:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YEPwpL8tIwFQ2pgUdTDSsmDRSKgoB9OQrqIbywK9g6k=;
 b=t/dea+HTFASqa+DkMZsvezWreLQct3An1am5aT7oeS9MCB7pE7WxwdqcAYpKjDnazl
 oozG5KS4nrETiFufl2+NAtyt8fONx5AyH2LnMK+GFXeTsO8GcEPBUOjPXAsPj1oveh8M
 UsxM2lHLkLGuTsSvHX+AXx7wvXVPnMH5fT6/RiO0ozm5VEqwZqvz7Co5GwHvh0x7kAiD
 6RB2x7VuY3tetfpgrZ4L2kdF98h3Vo+i51d8SyDIMXRilqkgaU+xkyCn723kBgE2uxne
 YjtfOmBfd40b1aeiijI/tth2gf0ls+AkjiI/q7c3nyWh72C3BWawI85v6HEc0Rt5p62H
 /Jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YEPwpL8tIwFQ2pgUdTDSsmDRSKgoB9OQrqIbywK9g6k=;
 b=p0Em0p+iYG71lznEXm3EXmpMrskyMxOqwcQZqLnDZ4MHgCpTcMenLJ0hEYWEUvbqeL
 yiqdjNBb9TDNu03j8tK/bHDYrYJpmuK4GzWJNwFc62Z1uGAtZzEeo5JUoyGexAS8Y6Ae
 AXoZY7Bkp2LRKcclE1QTDVmJrp0z/VpyCUnCUvWf133zz/SrUkG4mBJgmtxKRzVYbdN7
 6CEnGHV/yeESNm2Yl0HnP/dnFmHJtzESCPW3h2eQj4KqCVJG3EjFWvO0+yfxvJEWW6JC
 J0Wow0UMExHzeyOKrqMgGIIgqIZbwQ29YzY9RO1c5PbpqRHZhuOuG8fyvTnTUveRk79u
 5TYw==
X-Gm-Message-State: AOAM530K62JNcJdfJWQz8cpb5lMM00r05oBWz/91jKceUOvloH0fN8rO
 jTXO58BPAVKYKMRyEiG23Zw=
X-Google-Smtp-Source: ABdhPJxZnxaAWP/2FGAGT++lMvv0ZGP+Z9EPfAeWUgayCc+yEPQmbSAcWNVVlzBYfOxK+hgjl8fMQQ==
X-Received: by 2002:a17:90a:6388:: with SMTP id
 f8mr1861750pjj.192.1610416179413; 
 Mon, 11 Jan 2021 17:49:39 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:49:38 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 16/19] crypto: rockchip: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:47 +0530
Message-Id: <20210112014650.10887-17-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204941_569707_D98B2908 
X-CRM114-Status: GOOD (  13.39  )
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
