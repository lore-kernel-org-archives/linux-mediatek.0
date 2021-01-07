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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385C3C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:32:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAA2D23359
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAA2D23359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rJP5koJsJquP++hadgJwaQqhBtG6NV3PjK1j6Uji/80=; b=We5Ymj4thr8zir8Z1Y3L9N0pt
	TqVAhnzusKQAyACXadCGzoURW6wlbFk/VfoVDkOuTaxh0e9zgQq7H/Z8bec+ujC03RuQE1aafSlTt
	2BZFTySxgWzJAZfcnb5nOBheyGGDEW7XZnkCqZfmzXmBpUIcvR3Tg+QfgwnKoxWmu3aILS+XGCTOv
	3/HlXERE61JJ+VlOGaoO4hG2bKqIqMGoAnBw81VlQQK5Jh4MR9QNt6YY+IAshJLMccq32MUipM25U
	5uELcsOL3fhQPif8QQdKM0fOLr+NvT8Ue7LOFKx0ZV5UT7HSpy117HJqU+wp22wdmqzKpOuknloNV
	CoIoAwmrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUSI-0004mt-Gv; Thu, 07 Jan 2021 12:31:54 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUSF-0004kb-1A; Thu, 07 Jan 2021 12:31:52 +0000
Received: by mail-pf1-x42c.google.com with SMTP id c12so3757811pfo.10;
 Thu, 07 Jan 2021 04:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRk8t1M4XXjPEk7oyhWaY6rs5Sl9RScV/nWFL0Tu+/w=;
 b=kYC9dTtWAXY4xKQ/GQ4YLzK0W3XwA/v9tBfEw1XfRdYS2voXTYlj42FmwN8IFu5Bfv
 JMQMpaQ36VXpv66DlJg3QqoQ4lJ+w6o9RUwX+2gf4WQEnAXnLa9yv0AeaaGapgFX2Wzu
 42oR762tRp1x4BgfjO0MazixRgcE8XcydZMOucaAGjhtcrfEgRHl4cZBdtKpVxddNwhf
 180qtNIApokfroeh0cNuMVn2VZs98TX8E2dpqj2a/osygcmHAKUg+WWTqLpmffGLDfJG
 TBBo2IvbLVQVcBx23WQBH5JTqhtWgYwZBLt55qL3vLmVL+PDq7Su3mMWiJhIjVlfCTLN
 zLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JRk8t1M4XXjPEk7oyhWaY6rs5Sl9RScV/nWFL0Tu+/w=;
 b=nyZCyu3Jw0cODS60TSKLruhRBSEHQmAeOgX2gm3ZSVk75atLmJzcDzQUUrTK6zThRO
 mNSaC7EjDKnNBsWjjywvdd017H1CD8OuZsApjE/TnpVx8FUaxoZO/uM0U4jRAMiviCH3
 VvayDnttXTlmCmgpKcCDe7fIMCocvG54cGT2DgMuLi+pbUFMJLg4j4U4e2Y/2dPoRmbF
 H4N9+IbjfDD7GEXp6KXZlMKXxEIdflqQosmaZcEr26maEcD9iVEcbZLLxiXVxiGZ2qzw
 J9FIbJNSxgHSj3KGwuT2xze23D00Aps5X+WCI5x46IB4xmw37UZNrLzoGsafVIdCGDaV
 R0WA==
X-Gm-Message-State: AOAM5326nPbYlRcUpTQPcoKU0zATnoSY/t0OB2GIViI7P2V9G2tXL3oS
 qW6xgx8y6TiBuPFKyEDZBoA=
X-Google-Smtp-Source: ABdhPJyu3WtVMoxBM4D25J3ONFDYaaGBZCccHMGw5dFAMa5AazfuQ4DJ1h3Q7vYBYDehN21EQTwdfw==
X-Received: by 2002:a65:6152:: with SMTP id o18mr1641272pgv.392.1610022709048; 
 Thu, 07 Jan 2021 04:31:49 -0800 (PST)
Received: from localhost.localdomain ([49.207.216.201])
 by smtp.gmail.com with ESMTPSA id h12sm6356014pgk.70.2021.01.07.04.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:31:48 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v2 16/19] crypto: rockchip: convert tasklets to use new
 tasklet_setup() API
Date: Thu,  7 Jan 2021 17:59:41 +0530
Message-Id: <20210107122944.16363-13-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107122944.16363-1-allen.lkml@gmail.com>
References: <20210107122944.16363-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_073151_798909_839D6FD1 
X-CRM114-Status: GOOD (  13.15  )
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
index 35d73061d156..af6ad9f49009 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -201,9 +201,9 @@ static int rk_crypto_enqueue(struct rk_crypto_info *dev,
 	return ret;
 }
 
-static void rk_crypto_queue_task_cb(unsigned long data)
+static void rk_crypto_queue_task_cb(struct tasklet_struct *T)
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
