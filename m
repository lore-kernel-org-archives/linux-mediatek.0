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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D54FC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:44:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E25C64E7E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E25C64E7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rtuEWPXv5b9jBB6lLlT1/xLF7eW1IPeSOy+71NEhiUU=; b=A67QK06LtT90mMk87PHEUDu9L
	CryU13Pw+Llp5yl523kS4wVME0JDV1/c7XCRpK2gHVm6nuJ5TZ+M4DCpd/i7xjLdnkO0/soCOpVnd
	LTKPMby4n846lIFWm+ZS+X0/xQYISzw+YfM5MVX6NiVMKpscMIuSJRJ+0R4PSI7J8yaMOkikgo1f+
	tHGZap0BE5cQvL83jYQg+mw1cuKlPT8SEzwmICJ7KeU/nPBfZK4KmFhMkwpWIrX5sG5w7gpVGhDGH
	iXdwo4UtVEde+b9WloKo5k8AmzBEYGtj9hhTVSIOvlQT2ANAlHQPT2Uy4n5i4IMExJW4hF/B81vnI
	M4fg+/sIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l935U-0006bP-OE; Mon, 08 Feb 2021 09:44:08 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l935S-0006YF-HD; Mon, 08 Feb 2021 09:44:07 +0000
Received: by mail-pg1-x536.google.com with SMTP id o7so9869590pgl.1;
 Mon, 08 Feb 2021 01:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+bF0wgyuousrsBjw1bti5ZYiRgHZLvFxR0KyJROcYJo=;
 b=Qe13dpiJ2EyXyorjYGbTlkKsgJ0aG+PwD7TV41EurpvUsRkrNW+HEmoqZsalEm6UKP
 2WXix8TADk3fZ7z/SB+w0ezHpkRd66/dilOaYeSnvcNS6y3ljpD0edzhdzAHrGCue6Yk
 ASPaZVGlIHHZoyjgV+SZA6LdAEuM6qhwTBxWxBcAkX6I+zc6gIcloL1yDtLYcg+qOU9c
 XR0yAepvaexXnwLkDB08mf/WPYqG49Csw8DECwz7KbqIMLWmIjC5jpx2lQxy3dvveMGf
 t63iWQsclVHmdYYwCdwEAyEeilIDbMe3AJMOMTjaxbIg4SkEeUHYndvevq2noWTmR40K
 //3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+bF0wgyuousrsBjw1bti5ZYiRgHZLvFxR0KyJROcYJo=;
 b=lImSUT7fFbpu6CRSzi9EfH/iuK0OZDsJthflogB00CKL8P+xhgOyZ9thV7lAKLVchg
 KvIjw9W2TOaq2RG3gokskycFl5MaJOvugeqq0yyZyhYUCBYrjzgp2/fNG5sxr41YZRg8
 xEIOvjsBV1yrnAqFF8AMM2FV5SmiS1Mq02lcQcD2HXm+Gqkpw7YTaAB+EVVi3faYuuzQ
 W7s7aD7RS9zgM+oHxkTEvc4ipmqm7+0VyahzwPePqoG4dcePPYCctJ8Y8PUatbNlQGpj
 6E8e7dTQbXnLhSrrXuekzuyP3bGowCv6PCQF9A52qHS+J+w2kyPi2OdB55fjorqQDbyz
 1NWA==
X-Gm-Message-State: AOAM530vnex5xY24esP7TR3+WJiw9vzTOyNZ0wD8y66aonr4lPcswdcq
 ioiLQt4ApGGczrUrQzbG2Mo=
X-Google-Smtp-Source: ABdhPJwYc2Gl57srsI/bnzVqFZlHEiHb2o1QC5R/hBAo1wS1gRrf3ANOLt2kIVoGFq3d7+FIL9VA7Q==
X-Received: by 2002:a63:505d:: with SMTP id q29mr16119348pgl.89.1612777439189; 
 Mon, 08 Feb 2021 01:43:59 -0800 (PST)
Received: from localhost.localdomain ([49.207.205.214])
 by smtp.gmail.com with ESMTPSA id k69sm12208958pfd.4.2021.02.08.01.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:43:58 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v5 06/19] crypto: ccp: convert tasklets to use new
 tasklet_setup() API
Date: Mon,  8 Feb 2021 15:12:25 +0530
Message-Id: <20210208094238.571015-7-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044406_590824_C2965B0F 
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

Acked-by: John Allen <john.allen@amd.com>
Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/crypto/ccp/ccp-dev-v3.c    | 9 ++++-----
 drivers/crypto/ccp/ccp-dev-v5.c    | 9 ++++-----
 drivers/crypto/ccp/ccp-dmaengine.c | 7 +++----
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/crypto/ccp/ccp-dev-v3.c b/drivers/crypto/ccp/ccp-dev-v3.c
index 0d5576f6ad21..858566867fa3 100644
--- a/drivers/crypto/ccp/ccp-dev-v3.c
+++ b/drivers/crypto/ccp/ccp-dev-v3.c
@@ -321,9 +321,9 @@ static void ccp_enable_queue_interrupts(struct ccp_device *ccp)
 	iowrite32(ccp->qim, ccp->io_regs + IRQ_MASK_REG);
 }
 
-static void ccp_irq_bh(unsigned long data)
+static void ccp_irq_bh(struct tasklet_struct *t)
 {
-	struct ccp_device *ccp = (struct ccp_device *)data;
+	struct ccp_device *ccp = from_tasklet(ccp, t, irq_tasklet);
 	struct ccp_cmd_queue *cmd_q;
 	u32 q_int, status;
 	unsigned int i;
@@ -361,7 +361,7 @@ static irqreturn_t ccp_irq_handler(int irq, void *data)
 	if (ccp->use_tasklet)
 		tasklet_schedule(&ccp->irq_tasklet);
 	else
-		ccp_irq_bh((unsigned long)ccp);
+		ccp_irq_bh(&ccp->irq_tasklet);
 
 	return IRQ_HANDLED;
 }
@@ -457,8 +457,7 @@ static int ccp_init(struct ccp_device *ccp)
 
 	/* Initialize the ISR tasklet? */
 	if (ccp->use_tasklet)
-		tasklet_init(&ccp->irq_tasklet, ccp_irq_bh,
-			     (unsigned long)ccp);
+		tasklet_setup(&ccp->irq_tasklet, ccp_irq_bh);
 
 	dev_dbg(dev, "Starting threads...\n");
 	/* Create a kthread for each queue */
diff --git a/drivers/crypto/ccp/ccp-dev-v5.c b/drivers/crypto/ccp/ccp-dev-v5.c
index 7838f63bab32..e68b05a3169b 100644
--- a/drivers/crypto/ccp/ccp-dev-v5.c
+++ b/drivers/crypto/ccp/ccp-dev-v5.c
@@ -733,9 +733,9 @@ static void ccp5_enable_queue_interrupts(struct ccp_device *ccp)
 		iowrite32(SUPPORTED_INTERRUPTS, ccp->cmd_q[i].reg_int_enable);
 }
 
-static void ccp5_irq_bh(unsigned long data)
+static void ccp5_irq_bh(struct tasklet_struct *t)
 {
-	struct ccp_device *ccp = (struct ccp_device *)data;
+	struct ccp_device *ccp = from_tasklet(ccp, t, irq_tasklet);
 	u32 status;
 	unsigned int i;
 
@@ -772,7 +772,7 @@ static irqreturn_t ccp5_irq_handler(int irq, void *data)
 	if (ccp->use_tasklet)
 		tasklet_schedule(&ccp->irq_tasklet);
 	else
-		ccp5_irq_bh((unsigned long)ccp);
+		ccp5_irq_bh(&ccp->irq_tasklet);
 	return IRQ_HANDLED;
 }
 
@@ -894,8 +894,7 @@ static int ccp5_init(struct ccp_device *ccp)
 	}
 	/* Initialize the ISR tasklet */
 	if (ccp->use_tasklet)
-		tasklet_init(&ccp->irq_tasklet, ccp5_irq_bh,
-			     (unsigned long)ccp);
+		tasklet_setup(&ccp->irq_tasklet, ccp5_irq_bh);
 
 	dev_dbg(dev, "Loading LSB map...\n");
 	/* Copy the private LSB mask to the public registers */
diff --git a/drivers/crypto/ccp/ccp-dmaengine.c b/drivers/crypto/ccp/ccp-dmaengine.c
index 0770a83bf1a5..a85690866b05 100644
--- a/drivers/crypto/ccp/ccp-dmaengine.c
+++ b/drivers/crypto/ccp/ccp-dmaengine.c
@@ -121,9 +121,9 @@ static void ccp_cleanup_desc_resources(struct ccp_device *ccp,
 	}
 }
 
-static void ccp_do_cleanup(unsigned long data)
+static void ccp_do_cleanup(struct tasklet_struct *t)
 {
-	struct ccp_dma_chan *chan = (struct ccp_dma_chan *)data;
+	struct ccp_dma_chan *chan = from_tasklet(chan, t, cleanup_tasklet);
 	unsigned long flags;
 
 	dev_dbg(chan->ccp->dev, "%s - chan=%s\n", __func__,
@@ -712,8 +712,7 @@ int ccp_dmaengine_register(struct ccp_device *ccp)
 		INIT_LIST_HEAD(&chan->active);
 		INIT_LIST_HEAD(&chan->complete);
 
-		tasklet_init(&chan->cleanup_tasklet, ccp_do_cleanup,
-			     (unsigned long)chan);
+		tasklet_setup(&chan->cleanup_tasklet, ccp_do_cleanup);
 
 		dma_chan->device = dma_dev;
 		dma_cookie_init(dma_chan);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
