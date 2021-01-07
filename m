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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB29C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:31:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D9123356
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D9123356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a1ikyffmIxAmYHW9jTJhkJ4tnx9WBK8cxJi17hHH+WQ=; b=eZUQ2j/CD/4JmEabByDmaZreW
	UcqVgDxmstPRtYGujhas/kr+/HTE8Dm1zZtNLv2g4ZMylDL/UKKF9xloAEv6yDm71xinI/XDhm6To
	THJoZGrTm7Q5LNXbF2BKwKFDJZaqjfF9Y9a4qO6rqQFTQeu5m2USkyg1mXe2qRHYrYMnM4IAB8P2x
	+OrcnIB2Hj+Tk97T78bVYgrBRIePAulPSEmNfM3RFzq2FJ3Q2jtbPu29u11tyLteJhgOStyVBdZjW
	fXwdT7nRWGbIN603skZSPAnAwMVQgyFXGkoDa/6J+6Wd1f+xvA7ht4E9582sG9rTfeZvpJ5iITkUh
	YEB+c99XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxURY-0004PC-A6; Thu, 07 Jan 2021 12:31:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxURV-0004NX-IV; Thu, 07 Jan 2021 12:31:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id x12so3395549plr.10;
 Thu, 07 Jan 2021 04:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gZKtlD6nuAorTKG2PqNJjMaym8CBQGfY80Jr0aK5tbM=;
 b=ihmAn+zhB1dzY9ajMP9IqgYOfjz+RGnTRZG3ZHOZ7FR3EX0CffunXSTZFlwhb/jg74
 0einqhCTxWXZj162rkBnw8DvPuXXz3qvhmtmL792PQcZo5zNZmobateQCGnaHzE3jgfl
 0h186ObJTgRQwFLdyIBnVCChDjxYQ1bwKRDumLKF8R2sKu6Mq2Fkxla28spaFNoADkzA
 DUHOgK4ljuMEEEq7OUZH1Di001wUApJUP2A/LomsTXsIrtHP7ihBn/2Ey9uljy9W1vIv
 kPO5n28M+SeevCEJoq0/c4ZoAlq3JTnzBRPo7vdB83VGqKgWNFq8sLk9qCKQpFesCYvk
 mxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gZKtlD6nuAorTKG2PqNJjMaym8CBQGfY80Jr0aK5tbM=;
 b=UGSdh6lKNHNaOl+xw4VnbQgwNSy4+7jyKHZuDD3x9XK4Allhl3ACWX159tHMJrs4tj
 khixB6PLPSNAQ8DLbWjhyYv5ik+njR8aZMYFs0qvo/yXgnzkCkCgbxrAzeLVXXbdGwYr
 rCmzAzAmb47ZHYI6zHFARBVT48q8IhOAESdOQL8wUDF7y2ml6fo55dXqAgS+gpKi37It
 9af/ehxatnDrPuhmZa7Np9DEMGdc4uUmnW+O6Afv/UapmyTcJWwfADN7OzM/P7j0tb4i
 ah1IeE7y5ch2upBrRygV9njQU+7k+kGfHDgj1ybCEF8pU9yfqSEYBXDekTCIooSBLd5M
 glOA==
X-Gm-Message-State: AOAM533vJWdLa2Upa+L2QUWXQ7UBQ03sjg7voE1BW+XiYr3CLAab2RIn
 C5o9z4557aml1erVgy8OK5c=
X-Google-Smtp-Source: ABdhPJwNTDU7LUvvKiGzSLC1OK86iDlb1JeAhrXE/2gnq2C7Hehi2vNtCbMVLadxVc8HcEVvoIRCkw==
X-Received: by 2002:a17:902:44e:b029:da:b944:b798 with SMTP id
 72-20020a170902044eb02900dab944b798mr9099679ple.6.1610022663537; 
 Thu, 07 Jan 2021 04:31:03 -0800 (PST)
Received: from localhost.localdomain ([49.207.216.201])
 by smtp.gmail.com with ESMTPSA id h12sm6356014pgk.70.2021.01.07.04.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:31:02 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v2 11/19] crypto: mediatek: convert tasklets to use new
 tasklet_setup() API
Date: Thu,  7 Jan 2021 17:59:36 +0530
Message-Id: <20210107122944.16363-8-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107122944.16363-1-allen.lkml@gmail.com>
References: <20210107122944.16363-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_073105_787288_34278EFF 
X-CRM114-Status: GOOD (  12.81  )
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
