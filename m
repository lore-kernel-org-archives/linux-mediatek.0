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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62862C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:44:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1420A64E8B
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1420A64E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+I4Y6tGgzAItwUK8UuF9xVKMkhTJBYIyI5oFF9FTDzo=; b=W6x7BKfSnvwgeK+W7NHF/MJtR
	XQNj9oLQeULJAlkP3VyVDdmfMI01T4pXB+3VZNmMTzPCMp3kU/g8ixQdQnmRMznYYOAGLFUg5yuUA
	33HX9Vvci8nAGj7/PxvWnOGxQhRD5dqs9I0FQhNRoDn5OrzZg57B11MtAuBTPYQ2L8vNVYkCJgd+i
	uuh5Eq54WAoOW1gxAPcBo5qgmYmujzmVz7wH6CZzwxoY4E/Q02f/XlamY3kUzxvMhEMxn+EfX4UgW
	6drHrRfxTa36YK5ieoahex2d3X3ruQ2W4P/7GwERgCe+jnUwcvgdRYLFvc0BLKEVCYSY1P6xAl080
	6sAJqnSGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l935Y-0006d4-3C; Mon, 08 Feb 2021 09:44:12 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l935W-0006bQ-By; Mon, 08 Feb 2021 09:44:11 +0000
Received: by mail-pf1-x435.google.com with SMTP id w18so9349960pfu.9;
 Mon, 08 Feb 2021 01:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uwo40ct7uzVjK8NcMtTbNQmNhWXoxMbACC3WJlaa3jg=;
 b=hYUdepfiK5ExCgf33lhKa/Ie8YhrA3fzDZ3v7JbaxBj7TW1gtUB7q59WA4KBczsw5s
 zWr+udFoEw4JO5ZmkGu5kDxXlDeeblKMFPptEwDSOlxqxDc0I+76HXazsmyocK/gfVxn
 RjwV0XKBu/52n7jowcnfGHMjKFJ/102Xb3J/pcGdtzkkvM06h/Gkr+Ix+y61iICOfDrX
 QrFhIlc5wYvtOdUUaekCk5VUwv66NvszSCWaQamP6VqiGh/bnx6RmPHRaKv46PYf+3jE
 eDs+2tl0cyu7fz1KYlaRr6o2DasnXulEUSQ/YDzQKmrzvCsaYilpc6HuS+iwlNCoAggq
 +lcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uwo40ct7uzVjK8NcMtTbNQmNhWXoxMbACC3WJlaa3jg=;
 b=r8CZ+QuYmL95KvyxPfeM5PGDk8JqIbBnrsXpZeyQk4YY7PcyCo0OG5rpLgC7bgr4Od
 JuXI9YUJLfeg5pRfbajjGOtWnkqnYdogL1PF0p3mpEUMe1eJn/ec+u9MSo9opGOrzA8h
 Tc1nQuSMgf6ngRp79131OiyMxwMM5b9j4BINyJA371F10Nx6HoDmUhPjIpnvJLPFsQmk
 03XKnWAfYyMPvMLxtqL+Nn8pR5xoATi3XYYThV/oLG+2C9o4Pryr96N773rdr9qaSsIr
 vyCzWzp9RHloofOGuwrkf/CknE2V9CAn9/mI/TX6CTggI1gp/TCoZCy8ZSX2WlZw3SV+
 9aPQ==
X-Gm-Message-State: AOAM5303spbpLavP/rTEam/O1xdULYpieWqynKnk+c5Q0h0pSYSL4dEC
 Ko8/fXQY5ATiaeFx7i2CUZg=
X-Google-Smtp-Source: ABdhPJwZD0PBJzGUETDpysEySGYtg8JzOtAdSRbHnUPKK9CQwFhy/afhqChRNVSFgmLJd5kep9RAyg==
X-Received: by 2002:a65:5a83:: with SMTP id c3mr16086086pgt.381.1612777448231; 
 Mon, 08 Feb 2021 01:44:08 -0800 (PST)
Received: from localhost.localdomain ([49.207.205.214])
 by smtp.gmail.com with ESMTPSA id k69sm12208958pfd.4.2021.02.08.01.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:44:07 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v5 07/19] crypto: ccree: convert tasklets to use new
 tasklet_setup() API
Date: Mon,  8 Feb 2021 15:12:26 +0530
Message-Id: <20210208094238.571015-8-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044410_491140_E44F302C 
X-CRM114-Status: GOOD (  14.44  )
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
 drivers/crypto/ccree/cc_fips.c        |  8 ++++----
 drivers/crypto/ccree/cc_request_mgr.c | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/ccree/cc_fips.c b/drivers/crypto/ccree/cc_fips.c
index 702aefc21447..c1d03d99e3c3 100644
--- a/drivers/crypto/ccree/cc_fips.c
+++ b/drivers/crypto/ccree/cc_fips.c
@@ -8,7 +8,7 @@
 #include "cc_driver.h"
 #include "cc_fips.h"
 
-static void fips_dsr(unsigned long devarg);
+static void fips_dsr(struct tasklet_struct *tsk);
 
 struct cc_fips_handle {
 	struct tasklet_struct tasklet;
@@ -109,9 +109,9 @@ void cc_tee_handle_fips_error(struct cc_drvdata *p_drvdata)
 }
 
 /* Deferred service handler, run as interrupt-fired tasklet */
-static void fips_dsr(unsigned long devarg)
+static void fips_dsr(struct tasklet_struct *tsk)
 {
-	struct cc_drvdata *drvdata = (struct cc_drvdata *)devarg;
+	struct cc_drvdata *drvdata = from_tasklet(drvdata, tsk, tasklet);
 	u32 irq, val;
 
 	irq = (drvdata->irq & (CC_GPR0_IRQ_MASK));
@@ -143,7 +143,7 @@ int cc_fips_init(struct cc_drvdata *p_drvdata)
 	p_drvdata->fips_handle = fips_h;
 
 	dev_dbg(dev, "Initializing fips tasklet\n");
-	tasklet_init(&fips_h->tasklet, fips_dsr, (unsigned long)p_drvdata);
+	tasklet_setup(&fips_h->tasklet, fips_dsr);
 	fips_h->drvdata = p_drvdata;
 	fips_h->nb.notifier_call = cc_ree_fips_failure;
 	atomic_notifier_chain_register(&fips_fail_notif_chain, &fips_h->nb);
diff --git a/drivers/crypto/ccree/cc_request_mgr.c b/drivers/crypto/ccree/cc_request_mgr.c
index 33fb27745d52..ec0f3bf00d33 100644
--- a/drivers/crypto/ccree/cc_request_mgr.c
+++ b/drivers/crypto/ccree/cc_request_mgr.c
@@ -70,7 +70,7 @@ static const u32 cc_cpp_int_masks[CC_CPP_NUM_ALGS][CC_CPP_NUM_SLOTS] = {
 	  BIT(CC_HOST_IRR_REE_OP_ABORTED_SM_7_INT_BIT_SHIFT) }
 };
 
-static void comp_handler(unsigned long devarg);
+static void comp_handler(struct tasklet_struct *t);
 #ifdef COMP_IN_WQ
 static void comp_work_handler(struct work_struct *work);
 #endif
@@ -140,8 +140,7 @@ int cc_req_mgr_init(struct cc_drvdata *drvdata)
 	INIT_DELAYED_WORK(&req_mgr_h->compwork, comp_work_handler);
 #else
 	dev_dbg(dev, "Initializing completion tasklet\n");
-	tasklet_init(&req_mgr_h->comptask, comp_handler,
-		     (unsigned long)drvdata);
+	tasklet_setup(&req_mgr_h->comptask, comp_handler);
 #endif
 	req_mgr_h->hw_queue_size = cc_ioread(drvdata,
 					     CC_REG(DSCRPTR_QUEUE_SRAM_SIZE));
@@ -611,11 +610,12 @@ static inline u32 cc_axi_comp_count(struct cc_drvdata *drvdata)
 }
 
 /* Deferred service handler, run as interrupt-fired tasklet */
-static void comp_handler(unsigned long devarg)
+static void comp_handler(struct tasklet_struct *t)
 {
-	struct cc_drvdata *drvdata = (struct cc_drvdata *)devarg;
 	struct cc_req_mgr_handle *request_mgr_handle =
-						drvdata->request_mgr_handle;
+				from_tasklet(request_mgr_handle, t, comptask);
+	struct cc_drvdata *drvdata = container_of((void *)request_mgr_handle,
+				     typeof(*drvdata), request_mgr_handle);
 	struct device *dev = drvdata_to_dev(drvdata);
 	u32 irq;
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
