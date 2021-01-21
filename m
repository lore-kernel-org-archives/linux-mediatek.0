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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF56C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:44:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DA1206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4DA1206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q2u0m/ByZBlwGZbS55aiAoDw/ZbqAew+knuzjeExeT4=; b=2d0waONjqEDCxGf/gdq/GVDJ4
	nvGt+XMt6r9k7XFDjpQOI+dDte+fbNwYRl2InRvbyWRvv/W+fwhqAvoD7mR+vtd0nVzhvd6mnKD5W
	fOlPsAZ8Qrxk9lmOHSDPRCb6Bwgwm5bNzM4ZZhUOJaelXEEdv0ENc9tD/kfc0DeDWryl/mgCRZm9g
	9BozQjmKXooJDb08/bZjSr/glrvx82bOlPHhTrqjEgrGKQJ2l2uAnUkbVxBxexbar8hC8W9y2W34C
	suq/XufQmh50mbgEoDotAqtmJeV7VJxUoOqb/h43pkzGYrIDX3ZPhq8vV/jeNlvM1lelpqpR9Oc1p
	X2U910Few==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Rp9-0008Lo-4b; Thu, 21 Jan 2021 04:43:59 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Rp7-0008K2-BT; Thu, 21 Jan 2021 04:43:58 +0000
Received: by mail-pl1-x62b.google.com with SMTP id t6so609651plq.1;
 Wed, 20 Jan 2021 20:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u19NxDApfMXx+Y8pGP/iF30yq+dZf2FG4hiZfFrFBcE=;
 b=YcZEALK88C6Ie3UfV/NxIVW467onUG7DeIDhOp7jC+bX302hPlWbEVlnebgdCBbwFj
 LOfHF9OGgUlWjLj4wIBvH5lDknvO/fNQBpFbxTx5hQvmZSvg2FI4T7wq1SWUY8IjDElq
 tBHXoMkG1PrFIM2bBualHC6DrvMNzuLL9tHtzO17KvRwOgIGCG+A2n3xsYGLTrmsLLtL
 FHVZQ9zJrNd9rMoLlJb4wRfv3cynMP8nKgEOaTz0LCxKtAv4ZNEvaaowW6LA42qsA6j2
 OvGmfqDHs0jWX+Zrk2Zl+2+I0+uX3UV62B0QiQn2Ff0gKlNEE9LyANJMLdDJvz9Hb2A1
 WuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u19NxDApfMXx+Y8pGP/iF30yq+dZf2FG4hiZfFrFBcE=;
 b=F+ry9wV+w8f3A4Kq6EXpkdLRPAJf2hiB9AOLJmB8T+JYN0fzkcve7H+cWpQOt9YlSp
 a1/mkzJyMQEmZJigFW6YQbIFlDvEJdPUhuZoWkWdJjAv4gx04ChaRB9Ia8WfjAJ7mjSV
 jxLg5vZ6D3CnbfiWcsvLzssmvSRNHdOpReVzYlosE1cqKct416vVziWFhoGrMQ1K89ny
 RTYZ+ZcUvXfzpcVtyVEMtA2xMqGIcXowrg2S4dBD0kq6R3Q0mAFZ7D21PW0nuzcVAAwW
 qbD0CQiZQJb8ufxwPg4b1flSbKPyzy2mhn6+uF+OVqpY+WPt1GBq+DvUQR3wcZk6VEO0
 R2ew==
X-Gm-Message-State: AOAM532eeTuzFqIJ+BgLeZlDOtdiCmj0iw+ruJCTHa3dFqVVx8t7l2ok
 trWZOZ6VmnmOtrLiEXxS6tg=
X-Google-Smtp-Source: ABdhPJz55X807cU8264jB4dLtQ3vVAqYFPxZ8roblYo9YlKQHa5BhE7/TMsNFZx5ohRE85FkNMi7zA==
X-Received: by 2002:a17:90a:9ac:: with SMTP id 41mr9635853pjo.46.1611204235611; 
 Wed, 20 Jan 2021 20:43:55 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
 by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 20:43:55 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v4 13/19] crypto: picoxcell: convert tasklets to use new
 tasklet_setup() API
Date: Thu, 21 Jan 2021 10:11:20 +0530
Message-Id: <20210121044126.152274-14-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121044126.152274-1-allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_234357_402497_1638B43B 
X-CRM114-Status: GOOD (  12.04  )
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
 drivers/crypto/picoxcell_crypto.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/picoxcell_crypto.c b/drivers/crypto/picoxcell_crypto.c
index 84f9c16d984c..e64fa3e22521 100644
--- a/drivers/crypto/picoxcell_crypto.c
+++ b/drivers/crypto/picoxcell_crypto.c
@@ -1137,9 +1137,9 @@ static int spacc_req_submit(struct spacc_req *req)
 		return spacc_ablk_submit(req);
 }
 
-static void spacc_spacc_complete(unsigned long data)
+static void spacc_spacc_complete(struct tasklet_struct *t)
 {
-	struct spacc_engine *engine = (struct spacc_engine *)data;
+	struct spacc_engine *engine = from_tasklet(engine, t, complete);
 	struct spacc_req *req, *tmp;
 	unsigned long flags;
 	LIST_HEAD(completed);
@@ -1649,8 +1649,7 @@ static int spacc_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	tasklet_init(&engine->complete, spacc_spacc_complete,
-		     (unsigned long)engine);
+	tasklet_setup(&engine->complete, spacc_spacc_complete);
 
 	ret = devm_add_action(&pdev->dev, spacc_tasklet_kill,
 			      &engine->complete);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
