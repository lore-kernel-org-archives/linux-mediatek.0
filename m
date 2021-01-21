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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AA3C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:45:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D198D206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D198D206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ME7Yq/zxXxsNyBhjFZcp5qBCa29Hn1uMQdP0Uh6c08c=; b=Os5YvDi3XUitaalRVskDZOyxV
	FoGXYwUhn+c0NT9gpkhOFZkvnqqWGpQrJjSOriDPtdIdry+GRK+dkiJcQ0eff7JBi9m/VscrV31Tb
	+WCERzMg5z3BiPqrrxWrBiDb6qHJWEAa3lfndvwc1YU45iyFbi4bARzXVkRxlybZ2FzcnoBXtCqU5
	KtqOfwRu5JZuS5i/fgkcIFP74z3HoQMAYV6DH44k5EIYaqiUxssxWnBF2sn41PI+Fx3jMConouEN2
	zpHwnBl//tuilA2k/MzHVpIB/HuDprq+tmjfz3Bb865RFq3EMZKrpFlVUVxbI4E2p1P5N4jNqFGtv
	zW6uqa4+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Rq4-0000SG-5L; Thu, 21 Jan 2021 04:44:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Rq2-0000QW-2b; Thu, 21 Jan 2021 04:44:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d4so593952plh.5;
 Wed, 20 Jan 2021 20:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nmGD8HgPe/79+tkqFpZtuKTtNUxMt+0Wii+rdB2TPJ0=;
 b=eS/1ggdFWLmfnsVYZXAbwW1SmBRdM7h+i8u7eMxYshtdJMIwvsuLM6yn9GZBZ9S/K8
 KPB7IXVkvHseo+uWh3JXdsekkzlPnpD1fO5nonseXf9GOWYDGdR+HhSALKkTBW2yHqxA
 vhNiTnb6elTC+ROHAMTVxAmqh54NOFG8AXMg5XK2ZaPgk0Zkawh6ZbuAdmEfdFkEhZm2
 1UIpxFwDL7fAY+OlhacieGmRlqtZX1Sk/wWXzHNgZL3wH6FTjfH0lEmZHOzXOWK4oZol
 FrhZLsRXZ91FD1PC349AL88h5bApuFeMzE3PJ1YZJKXFQ8yXe/V3L7GGuSfN9S3XXoFM
 SpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nmGD8HgPe/79+tkqFpZtuKTtNUxMt+0Wii+rdB2TPJ0=;
 b=OPHueOWOxzjPTCcN6mYvlTDQRfAywpo8CX9uUf3NBqhOHcpV3jcSaA6d3ZhRJZ+dG9
 6okCshYzjdo7g5MpP6tNN76M7X12XKrhv3/m3Y8k1XrPjmImXcOPThcbd4QeTUS6S5fX
 6I3x5YDVHKQWw8DQtnsvR2YkSgbFTXeT7AHZDtS5JWpz4OBGZtHTHZmWJkTL1kyR31W7
 RDfmRI1Pho7dIMOZx1Zfo9kqVx2nrOnOECHqpdhAbJZV38TD9aaZNKDtEjFBvLPQ9ZW7
 Ayv0m7kzRvFt52tbOwqvyh8C8b2/aWN9QSW8F/L6GWsxi1qzQ2vctCclRyMiUMAGIQN0
 mEMg==
X-Gm-Message-State: AOAM533bBpKoek0LMP2LePDKpGpPMXxyktrWNb4OfMZd3SJbG7O9KB0+
 xit4jcmJ0JH/nOFKawanzLA=
X-Google-Smtp-Source: ABdhPJwK12yN+Nm/X1Li1WBmyUtsyI++TR5W0kfCfg/xipnswNtdqtNaye9X6xF+P0AT5ihT3NrvwA==
X-Received: by 2002:a17:902:8549:b029:de:8aaa:b012 with SMTP id
 d9-20020a1709028549b02900de8aaab012mr13199334plo.34.1611204292055; 
 Wed, 20 Jan 2021 20:44:52 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
 by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 20:44:51 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v4 19/19] crypto: octeontx: convert tasklets to use new
 tasklet_setup() API
Date: Thu, 21 Jan 2021 10:11:26 +0530
Message-Id: <20210121044126.152274-20-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121044126.152274-1-allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_234454_144572_DD12EECF 
X-CRM114-Status: GOOD (  13.38  )
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
 linux-crypto@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/crypto/marvell/octeontx/otx_cptvf_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_main.c b/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
index c076d0b3ad5f..831550123719 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_main.c
@@ -17,11 +17,12 @@
 #define DRV_NAME	"octeontx-cptvf"
 #define DRV_VERSION	"1.0"
 
-static void vq_work_handler(unsigned long data)
+static void vq_work_handler(struct tasklet_struct *t)
 {
-	struct otx_cptvf_wqe_info *cwqe_info =
-					(struct otx_cptvf_wqe_info *) data;
-
+	struct otx_cptvf_wqe *cwqe = from_tasklet(cwqe, t, twork);
+	struct otx_cptvf_wqe_info *cwqe_info = container_of(cwqe,
+							typeof(*cwqe_info),
+							vq_wqe[0]);
 	otx_cpt_post_process(&cwqe_info->vq_wqe[0]);
 }
 
@@ -41,8 +42,7 @@ static int init_worker_threads(struct otx_cptvf *cptvf)
 	}
 
 	for (i = 0; i < cptvf->num_queues; i++) {
-		tasklet_init(&cwqe_info->vq_wqe[i].twork, vq_work_handler,
-			     (u64)cwqe_info);
+		tasklet_setup(&cwqe_info->vq_wqe[i].twork, vq_work_handler);
 		cwqe_info->vq_wqe[i].cptvf = cptvf;
 	}
 	cptvf->wqe_info = cwqe_info;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
