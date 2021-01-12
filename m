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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EC8C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:48:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3214122E01
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3214122E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=llbtdWILOnYkCjVbTAEqpf2yc/STTSSJWFp1AZ7P8qc=; b=0ano712sLOSLyD7CSA91LBVbS
	1JQj9bSva8jpjicitQw3cyZb6O6hCb7GH8pdBQbuBB22A+ps2xg/dxcNC6t/id7PlN0mybG7uxVlk
	v8aIUO7oAHE58InoFWf9M5dO8hQHCUhS1oG/zScq+Xvo2aIrLvgoI8EjbGCz9fgEKBAvv6xV2oBKx
	PsdeqUGthRr1cpt3z9vae1Rwi2+fSWOQbAtQH9OuHS2JAdF/9CIFBbcpEx33VnpHPG2X3RJCpsRBx
	f323q4AawRmhZRn1J9OIwF3dQ1+pFuWI9Eu6dU0NZY9eMAfzXjTQyO0VLbtjcwlqB+l5CDoI19Tqg
	rpzi1f1Dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8mv-0003HK-Rj; Tue, 12 Jan 2021 01:48:01 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8ms-0003FA-H4; Tue, 12 Jan 2021 01:47:59 +0000
Received: by mail-pj1-x102a.google.com with SMTP id cq1so444457pjb.4;
 Mon, 11 Jan 2021 17:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qp9LBDTmnPZcn3zbp0ts8Zh1JyTpVMJr9nqNyHr6PFs=;
 b=RSu8kgmud6C/CFnjaf+JN3itxTEQmYvZ33pymbzdN6j1JYCsd94paPaqMJZPl4yKMX
 s6oOGxaPwpxA1kuBfyV3s6LgyypIFMO0Ku2pFgDkoO84VOMKp3KVkSUcK0Wuo91dYI3E
 Fla8Dc4St8NFlhx8unKmNsJJzERwQmzxMQdJP6LbKRiwu8LFAGGvoplzmhu2RmXS+20w
 q6NmQgGeybduoBzx+A+FNvKi+Z/HLN/1mej6KPrvfNeQyFSoa5oVZuhTG6DjUcoJcanq
 KYiEnVCT21negngCXTUR52EljQ91rVTDr4MaxNwaqo7z3Vzh2GCYhsMUS2PZ9xWL+JgF
 dN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qp9LBDTmnPZcn3zbp0ts8Zh1JyTpVMJr9nqNyHr6PFs=;
 b=MR+sS8XaNCTYxYdUxiLBmj4K1GqVrSBnj247nCuHgDxgh8iCpWwRPIbM0l+pkwynA0
 xuVK1TDpFsVOMieZZ6tvcF5Yw7kLXW10hX5iRpsd1uzc5kux7wURc4LPgbIrHa4gEH4e
 CZKbONsOtPS99vUAzbUTxn+Oqg69cX/5D6RNiA1i+NYKJqJPDcyoh2+q1+7mAaVt7c+X
 fat5Y2I1dQL8jB/v+eHEA3qw30YF5Mx1tmUj2n5hyOKjopfOgWRUUfeNC4srzUFHkFpV
 ZEqjsflWNh0+GVZYyBMMqCRS8Wx/RoG8UqW2A1+Lp+h7IkkE4PxMm5aDXhn1n5xJqiaO
 kyDw==
X-Gm-Message-State: AOAM5323Yxrh5fvqgEhMkf3vq/qsK5PgnBcQpZ7jvDzU61XcK5jGsZxI
 YL9TPqbmM8jg2wlAtfkUC4s=
X-Google-Smtp-Source: ABdhPJziTAtWqbi8fSkflnsG4p1kzAZdCqxrYnIkoerOvehnkgI2k1oWA/UzJaXm7HS7B/v0CUjW7g==
X-Received: by 2002:a17:902:8c89:b029:dc:1e79:e74b with SMTP id
 t9-20020a1709028c89b02900dc1e79e74bmr2662422plo.58.1610416076491; 
 Mon, 11 Jan 2021 17:47:56 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:47:55 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 05/19] crypto: cavium: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:36 +0530
Message-Id: <20210112014650.10887-6-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204758_592080_82DC35DD 
X-CRM114-Status: GOOD (  15.40  )
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
 drivers/crypto/cavium/cpt/cptvf_main.c       |  9 ++++-----
 drivers/crypto/cavium/nitrox/nitrox_common.h |  2 +-
 drivers/crypto/cavium/nitrox/nitrox_isr.c    | 13 +++++--------
 drivers/crypto/cavium/nitrox/nitrox_reqmgr.c |  4 ++--
 4 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/cavium/cpt/cptvf_main.c b/drivers/crypto/cavium/cpt/cptvf_main.c
index f016448e43bb..6424bcc74139 100644
--- a/drivers/crypto/cavium/cpt/cptvf_main.c
+++ b/drivers/crypto/cavium/cpt/cptvf_main.c
@@ -21,10 +21,10 @@ struct cptvf_wqe_info {
 	struct cptvf_wqe vq_wqe[CPT_NUM_QS_PER_VF];
 };
 
-static void vq_work_handler(unsigned long data)
+static void vq_work_handler(struct tasklet_struct *t)
 {
-	struct cptvf_wqe_info *cwqe_info = (struct cptvf_wqe_info *)data;
-	struct cptvf_wqe *cwqe = &cwqe_info->vq_wqe[0];
+	struct cptvf_wqe *cwqe = from_tasklet(cwqe, t, twork);
+	struct cptvf_wqe_info *cwqe_info = container_of(cwqe, typeof(*cwqe_info), vq_wqe[0]);
 
 	vq_post_process(cwqe->cptvf, cwqe->qno);
 }
@@ -45,8 +45,7 @@ static int init_worker_threads(struct cpt_vf *cptvf)
 	}
 
 	for (i = 0; i < cptvf->nr_queues; i++) {
-		tasklet_init(&cwqe_info->vq_wqe[i].twork, vq_work_handler,
-			     (u64)cwqe_info);
+		tasklet_setup(&cwqe_info->vq_wqe[i].twork, vq_work_handler);
 		cwqe_info->vq_wqe[i].qno = i;
 		cwqe_info->vq_wqe[i].cptvf = cptvf;
 	}
diff --git a/drivers/crypto/cavium/nitrox/nitrox_common.h b/drivers/crypto/cavium/nitrox/nitrox_common.h
index e4be69d7e6e5..f73ae8735272 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_common.h
+++ b/drivers/crypto/cavium/nitrox/nitrox_common.h
@@ -19,7 +19,7 @@ void nitrox_put_device(struct nitrox_device *ndev);
 int nitrox_common_sw_init(struct nitrox_device *ndev);
 void nitrox_common_sw_cleanup(struct nitrox_device *ndev);
 
-void pkt_slc_resp_tasklet(unsigned long data);
+void pkt_slc_resp_tasklet(struct tasklet_struct *t);
 int nitrox_process_se_request(struct nitrox_device *ndev,
 			      struct se_crypto_request *req,
 			      completion_t cb,
diff --git a/drivers/crypto/cavium/nitrox/nitrox_isr.c b/drivers/crypto/cavium/nitrox/nitrox_isr.c
index 99b053094f5a..c6fb8b3263e1 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_isr.c
+++ b/drivers/crypto/cavium/nitrox/nitrox_isr.c
@@ -201,9 +201,9 @@ static void clear_bmi_err_intr(struct nitrox_device *ndev)
 	dev_err_ratelimited(DEV(ndev), "BMI_INT  0x%016llx\n", value);
 }
 
-static void nps_core_int_tasklet(unsigned long data)
+static void nps_core_int_tasklet(struct tasklet_struct *t)
 {
-	struct nitrox_q_vector *qvec = (void *)(uintptr_t)(data);
+	struct nitrox_q_vector *qvec = from_tasklet(qvec, t, resp_tasklet);
 	struct nitrox_device *ndev = qvec->ndev;
 
 	/* if pf mode do queue recovery */
@@ -343,8 +343,7 @@ int nitrox_register_interrupts(struct nitrox_device *ndev)
 		cpu = qvec->ring % num_online_cpus();
 		irq_set_affinity_hint(vec, get_cpu_mask(cpu));
 
-		tasklet_init(&qvec->resp_tasklet, pkt_slc_resp_tasklet,
-			     (unsigned long)qvec);
+		tasklet_setup(&qvec->resp_tasklet, pkt_slc_resp_tasklet);
 		qvec->valid = true;
 	}
 
@@ -364,8 +363,7 @@ int nitrox_register_interrupts(struct nitrox_device *ndev)
 	cpu = num_online_cpus();
 	irq_set_affinity_hint(vec, get_cpu_mask(cpu));
 
-	tasklet_init(&qvec->resp_tasklet, nps_core_int_tasklet,
-		     (unsigned long)qvec);
+	tasklet_setup(&qvec->resp_tasklet, nps_core_int_tasklet);
 	qvec->valid = true;
 
 	return 0;
@@ -442,8 +440,7 @@ int nitrox_sriov_register_interupts(struct nitrox_device *ndev)
 	cpu = num_online_cpus();
 	irq_set_affinity_hint(vec, get_cpu_mask(cpu));
 
-	tasklet_init(&qvec->resp_tasklet, nps_core_int_tasklet,
-		     (unsigned long)qvec);
+	tasklet_setup(&qvec->resp_tasklet, nps_core_int_tasklet);
 	qvec->valid = true;
 
 	return 0;
diff --git a/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c b/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c
index 53ef06792133..676f3d00bf61 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c
+++ b/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c
@@ -580,9 +580,9 @@ static void process_response_list(struct nitrox_cmdq *cmdq)
 /**
  * pkt_slc_resp_tasklet - post processing of SE responses
  */
-void pkt_slc_resp_tasklet(unsigned long data)
+void pkt_slc_resp_tasklet(struct tasklet_struct *t)
 {
-	struct nitrox_q_vector *qvec = (void *)(uintptr_t)(data);
+	struct nitrox_q_vector *qvec = from_tasklet(qvec, t, resp_tasklet);
 	struct nitrox_cmdq *cmdq = qvec->cmdq;
 	union nps_pkt_slc_cnts slc_cnts;
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
