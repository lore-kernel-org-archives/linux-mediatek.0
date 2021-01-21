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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66009C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:43:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06028206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06028206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a1ikyffmIxAmYHW9jTJhkJ4tnx9WBK8cxJi17hHH+WQ=; b=c6hzAsIDLtT2+655VdKvp6Cxf
	s3HtE8gqLZRUZqrWMHVdMKHPaFGCer5EYvM9E8uJd/mbqFA6YwCjt5icbHkgivow68KjRc8BKcJ7e
	O+lvEIoLk0zZb6a0PXxo+cHL1i5P2heSyUkgaomXeuM5SLANzdGz3JgLTbQEUBZysbijbpz+wCV14
	5Z8ErUSGD/8iyzR+ZwPmsLxe+vWtMnnhxc9GZwoaT39WEBjtjpdFluS/oBEDm+KmCP5qa7W3f/ssu
	NkWQFUw3/x8dcCKkGL1ssVNNzYIOf+GBBwrKTMlmc/D6zXeiGLsdnaeEOxLalr4Dwq3fU2BPUQzfR
	aizG35afQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Roq-0008Ch-DN; Thu, 21 Jan 2021 04:43:40 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Roo-0008B5-HQ; Thu, 21 Jan 2021 04:43:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id f63so754050pfa.13;
 Wed, 20 Jan 2021 20:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gZKtlD6nuAorTKG2PqNJjMaym8CBQGfY80Jr0aK5tbM=;
 b=WCE5Tr7meTK5ZLL4PcSZDSudzsc8vmkuG2k7xatRtApKVOMRijxopylZ6GoJEwV/K+
 b4TwcRkiZ80U4weZGZSKFvdCWRTcC7VDMgzdNUqYAxFeogELRM1YnUqumFk0V/E+Myxq
 +yL+voX64dYVEzELn8maV0XBsgj6qiR6ri1YsnWZ8mjvqFvdm9l5/8ZFIwta2I2jIhIO
 Zm5l/JcWqSkjTeRs0+0TsSRLKc1cqn3zN3MxOewsKT1DpJEUhOZ4jCyURXVkkvtMrJj6
 twUjiCuhBcMbVdsMzPqFt+oXo1maJm13gEPoLtn5lOXPHtwObpvzZBieKjog5nv/MFn+
 2mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gZKtlD6nuAorTKG2PqNJjMaym8CBQGfY80Jr0aK5tbM=;
 b=mSSHz+y3P1wegqp7KlR5uHB1ZdWjV3tVxMNoFkqg4MDURL2V68ieZxvwpMLpDmpK+e
 ip7sk9bHdPJsGQ9AMAGA6MBYtnCVRPcr6dSNUkzuzJwAuHH89RniDeC71GPBM9DUqdLz
 +f0Fe7zOA6BJogk84uZ+5pG/rs+pp7HLI+2/xXjOKkIVVN6Age1LAkyAu6zP3lQ9Qxpm
 CZ/Rr5Jb5z8GwQaRVz60ZRlSVJqoAYiTU3AdchSyZECP8ooK0Ik63bSHaQLs1w7/CGDf
 KqHS/mX6EJvY/xlVXgS988mcYjEWSs3zukrBxmhsr6nxXfTg2vuOUa6ktVPMc7jRz5v1
 zBxQ==
X-Gm-Message-State: AOAM530JFqxSkXxHU8+68jTwoJzxBtOOG9ZFF7XTVtDtiQitNEyK/8eV
 1QZiJjS676W1R8GBDyckxZU=
X-Google-Smtp-Source: ABdhPJy/wJvam2KFK5a+Fdu1Ly2SEYwHjlW/SIFLjBMDW1WY6SjYaRLw33jugUlEZBjnv8RF/XZosQ==
X-Received: by 2002:a05:6a00:1342:b029:1ba:5263:63c3 with SMTP id
 k2-20020a056a001342b02901ba526363c3mr8224465pfu.2.1611204216858; 
 Wed, 20 Jan 2021 20:43:36 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
 by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 20:43:36 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v4 11/19] crypto: mediatek: convert tasklets to use new
 tasklet_setup() API
Date: Thu, 21 Jan 2021 10:11:18 +0530
Message-Id: <20210121044126.152274-12-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121044126.152274-1-allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_234338_603863_9D703E09 
X-CRM114-Status: GOOD (  12.95  )
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
 drivers/crypto/mediatek/mtk-aes.c | 14 ++++++--------
 drivers/crypto/mediatek/mtk-sha.c | 14 ++++++--------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-aes.c b/drivers/crypto/mediatek/mtk-aes.c
index 7323066724c3..fa49bb5b043b 100644
--- a/drivers/crypto/mediatek/mtk-aes.c
+++ b/drivers/crypto/mediatek/mtk-aes.c
@@ -1080,16 +1080,16 @@ static struct aead_alg aes_gcm_alg = {
 	},
 };
 
-static void mtk_aes_queue_task(unsigned long data)
+static void mtk_aes_queue_task(struct tasklet_struct *t)
 {
-	struct mtk_aes_rec *aes = (struct mtk_aes_rec *)data;
+	struct mtk_aes_rec *aes = from_tasklet(aes, t, queue_task);
 
 	mtk_aes_handle_queue(aes->cryp, aes->id, NULL);
 }
 
-static void mtk_aes_done_task(unsigned long data)
+static void mtk_aes_done_task(struct tasklet_struct *t)
 {
-	struct mtk_aes_rec *aes = (struct mtk_aes_rec *)data;
+	struct mtk_aes_rec *aes = from_tasklet(aes, t, done_task);
 	struct mtk_cryp *cryp = aes->cryp;
 
 	mtk_aes_unmap(cryp, aes);
@@ -1142,10 +1142,8 @@ static int mtk_aes_record_init(struct mtk_cryp *cryp)
 		spin_lock_init(&aes[i]->lock);
 		crypto_init_queue(&aes[i]->queue, AES_QUEUE_SIZE);
 
-		tasklet_init(&aes[i]->queue_task, mtk_aes_queue_task,
-			     (unsigned long)aes[i]);
-		tasklet_init(&aes[i]->done_task, mtk_aes_done_task,
-			     (unsigned long)aes[i]);
+		tasklet_setup(&aes[i]->queue_task, mtk_aes_queue_task);
+		tasklet_setup(&aes[i]->done_task, mtk_aes_done_task);
 	}
 
 	/* Link to ring0 and ring1 respectively */
diff --git a/drivers/crypto/mediatek/mtk-sha.c b/drivers/crypto/mediatek/mtk-sha.c
index f55aacdafbef..c241762aa23b 100644
--- a/drivers/crypto/mediatek/mtk-sha.c
+++ b/drivers/crypto/mediatek/mtk-sha.c
@@ -1164,16 +1164,16 @@ static struct ahash_alg algs_sha384_sha512[] = {
 },
 };
 
-static void mtk_sha_queue_task(unsigned long data)
+static void mtk_sha_queue_task(struct tasklet_struct *t)
 {
-	struct mtk_sha_rec *sha = (struct mtk_sha_rec *)data;
+	struct mtk_sha_rec *sha = from_tasklet(sha, t, queue_task);
 
 	mtk_sha_handle_queue(sha->cryp, sha->id - MTK_RING2, NULL);
 }
 
-static void mtk_sha_done_task(unsigned long data)
+static void mtk_sha_done_task(struct tasklet_struct *t)
 {
-	struct mtk_sha_rec *sha = (struct mtk_sha_rec *)data;
+	struct mtk_sha_rec *sha = from_tasklet(sha, t, done_task);
 	struct mtk_cryp *cryp = sha->cryp;
 
 	mtk_sha_unmap(cryp, sha);
@@ -1219,10 +1219,8 @@ static int mtk_sha_record_init(struct mtk_cryp *cryp)
 		spin_lock_init(&sha[i]->lock);
 		crypto_init_queue(&sha[i]->queue, SHA_QUEUE_SIZE);
 
-		tasklet_init(&sha[i]->queue_task, mtk_sha_queue_task,
-			     (unsigned long)sha[i]);
-		tasklet_init(&sha[i]->done_task, mtk_sha_done_task,
-			     (unsigned long)sha[i]);
+		tasklet_setup(&sha[i]->queue_task, mtk_sha_queue_task);
+		tasklet_setup(&sha[i]->done_task, mtk_sha_done_task);
 	}
 
 	/* Link to ring2 and ring3 respectively */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
