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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EC8C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:32:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6590423356
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6590423356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ME7Yq/zxXxsNyBhjFZcp5qBCa29Hn1uMQdP0Uh6c08c=; b=KfItfue2CBKaDTBezDyS2FTcE
	m3Q2yVkN8ZQV1mn1vgCYgDpSggDBZsyba0d6Xd5JgPK02uZrYQHejDCAWEsn3zCQpClMstfnj2day
	ozmGE6LuftzwpiJSQhwsI4ztsIvutqdAkRt+9SPbdYakb1hv/cotqqJS9wA2vJSbxJzH7SEj4KGvB
	NHOvoNoiilHiQJmGsaJbQtbhUokaFzq5YLUU7SWZwJyyRFta1qFjgTeveM+As474L9eVbWLPMk2gv
	+2zCr6MsqPCTnMUwuf6XHsRGd14qWwh+iCu4XG3/+ZZ+BXUEkqB8MUHFbtkLAg2tDoNLp9lxJd6cG
	EGUsL1+BQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUSl-000537-Q2; Thu, 07 Jan 2021 12:32:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUSh-0004zI-OA; Thu, 07 Jan 2021 12:32:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id q4so3406645plr.7;
 Thu, 07 Jan 2021 04:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nmGD8HgPe/79+tkqFpZtuKTtNUxMt+0Wii+rdB2TPJ0=;
 b=S4LNIh9R6yyfuQUC+97w6+ddLUmLZts28spXG4s3H2FtN63hu9uKU4xyqyNAaURVtl
 MrEoseabVLnbPwm4szc+NBo3o6mQ6oNDvq79kNnzMzf+eSGD3U53lSioAf2cU0sTVx6d
 f3DTuXE5WYhBTPbycCxa6p3Em5hFNd/hzmb8ZOvDpGBmqzWZNyCnHDqqjt72U4HtEQ2h
 9lkZqR+IabZBTkSqHXDQqAaLkI0A/EPMfO0SUQutv1gLXBlPX5KENzoKX5gxKHYGxuvY
 Rs0TWa9WbyQmSdqmJsJ5qlA9aTFN+w2bppat+Roha+o29T2fcaL0dmRWmf/sBmG9IbnS
 TGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nmGD8HgPe/79+tkqFpZtuKTtNUxMt+0Wii+rdB2TPJ0=;
 b=m8rxYt8+PggVaRh8oqUT3xjbyoCoaKKXHANjBNvOF4TyNDbvmJ8gp0NVDmC9AMaCHp
 fB1S+nHJ/7cM1lw5nTbqUgM68sWXEN36C+gl3p+hOj/yRf0oEkbLs6GgTrPWliGWxJ4P
 eSXzm/F4B6Z5P8laP9BNEdi8x2o5DoH6zj6aaqIgVdEUu5/XyfMxFvkSjdyKVrBQIC2b
 ORyd+KSRSguwD4T/HDchmdgEnPL+7sAnCqEK/L42+gLkL1h/pUhKkBw6uxJ9335lGrKA
 wrBjDBjcM68eQOTxgxdlDO/4v5JDAt26KA0BhEtBFTbmzirJJt94dSUa5yqUIv07DZNq
 Bbbw==
X-Gm-Message-State: AOAM531MTp3sfcOHILAxo0eamdJiqVKjDbPYJKK7SfPcsLd+L23mfpxd
 EkBRWZbGOHPoo461cQid5z8=
X-Google-Smtp-Source: ABdhPJwUHfulHl4CVzwuW48JZr7yc4B+TDj4yp3uEqLNhqwdi5LQG75OesrunlT96l85jZk7PELY/A==
X-Received: by 2002:a17:90b:815:: with SMTP id
 bk21mr8954482pjb.21.1610022737613; 
 Thu, 07 Jan 2021 04:32:17 -0800 (PST)
Received: from localhost.localdomain ([49.207.216.201])
 by smtp.gmail.com with ESMTPSA id h12sm6356014pgk.70.2021.01.07.04.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:32:16 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v2 19/19] crypto: octeontx: convert tasklets to use new
 tasklet_setup() API
Date: Thu,  7 Jan 2021 17:59:44 +0530
Message-Id: <20210107122944.16363-16-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107122944.16363-1-allen.lkml@gmail.com>
References: <20210107122944.16363-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_073219_832867_CA723558 
X-CRM114-Status: GOOD (  13.25  )
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
