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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3770C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:50:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B2422E02
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B2422E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ME7Yq/zxXxsNyBhjFZcp5qBCa29Hn1uMQdP0Uh6c08c=; b=Djvuj6ymOg7fYxwDExD7VyJEy
	Gl/JCKB7X2wLfz3OJMLZJRV7tIwXoD+RMSK5Um/ZAZsYdy599IEz4z2nDuWc4s7J85EiRubwWpBtB
	/yk3t8eAzhw1SRh6Z5iWkc88SV8CefoGGYZB2QQ+NNkpKQEJkJAX2rjumGaGwpARvF6r21L+a30DB
	fQE9QzoHcflyqZbRbHC25HrE9qhgol4mJvolPlZ0In7HmQHJ/J2gY52iXNyh0OZVNYsO6JFsBv+3S
	ExGSdUOjd9VqqEeYNRH9iuyCkhcjrAcIhYeDtYSKqJv6kV7QV3L8XuV2nEmGRxlVznL17cdkHu+Mo
	RZZv5oB6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8p1-0004TO-Gm; Tue, 12 Jan 2021 01:50:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8oz-0004Qw-Gy; Tue, 12 Jan 2021 01:50:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id x12so512012plr.10;
 Mon, 11 Jan 2021 17:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nmGD8HgPe/79+tkqFpZtuKTtNUxMt+0Wii+rdB2TPJ0=;
 b=PIC7XupoDMn9piWQ69Bl0kSfEVHNzrMRig+EIc5OLLCmFuFRswvromgbiophGM4QYT
 ZD80Bj/rA5IwXoG1Cl7PFkQrgG8ZvvcmRUFgRGaEAdl1BXrb2dqQgY0ctp70w1+jPmRW
 T3saZ3Dv0NpvtYnvNIiL1rBjBb5Hsf9Ql6XGjKUxArWP/Jfx/JeApHqYds2TBZ1yA9Y/
 rgZLAHIxgZDLeBV4ciOlD54q8dsDHuwxMT3U13i8N1WMOsTxZhI8Vjg4RzlUtZDe/tHp
 gb17/KPo4c3WJgDloV+1R6wCybnuniZnBEL8Usvu6/JR0PphWZ4dsgLcv7Gw7YJrLo4w
 0CqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nmGD8HgPe/79+tkqFpZtuKTtNUxMt+0Wii+rdB2TPJ0=;
 b=CGwD3yQx75Nz2gdNT12Ihx38SNQPAGg4xKuDnkLO/O5gAlsO/z1+LH5lHKBaza4Nvr
 8HRttVLnL661zvzLYOUuCrcAougg/19l6fn6jmH4TvP7FgVC5P98xeuNkNqQfXeNYDDH
 Adsq84qqU6BWSINoBnjEGfVFP+Y+AIy9WK6K7S/eesmCJuerjHlw59X9czCBtE/WhxzB
 om7AVHHenA12jvvpEC8J6KZq4fxKDjkOeXSszLCZtJrtkLB/3HXw7bRJbkZSu13gGd1i
 v67XBPt15+WkVjCzOVLRsEgJzscIYYKGrtxdrvqNn6FXmutwwqY5mg33R4vfWDaRXImh
 UOjQ==
X-Gm-Message-State: AOAM530j3gAx9YSqdscH0x/a8kogL8tHvmqDzRD0d2JvxNKLtgjPhK4J
 6+sV+0obFYDc4pNcaGStIOs=
X-Google-Smtp-Source: ABdhPJykt4ezhXe8itNyfcI61xbwIwZ6yNHylHi48PECxS7E18PCI0lpNxhryVnVn/naJ48zL6j5xg==
X-Received: by 2002:a17:90a:49c5:: with SMTP id
 l5mr1833591pjm.116.1610416207445; 
 Mon, 11 Jan 2021 17:50:07 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:50:06 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 19/19] crypto: octeontx: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:50 +0530
Message-Id: <20210112014650.10887-20-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_205009_620055_75AF5D3D 
X-CRM114-Status: GOOD (  13.49  )
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
