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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B99BC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:44:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E22EB64E8B
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E22EB64E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x/rPnw1R0eH1nc+MYZy1FdsgONCWnnmGkwB5ZjLryX4=; b=RC8THJEsDUw1tmkzCFpGpGa9L
	DHchv8YBQZATkGScVLG/fqOJBs/BRf2DP1twxgIdDhZI9yf19Ox6cgB+/VOkCAi6IdNuiyX/utzN2
	5S0kswqWNGpB8ZxSR+GF8AyLT0yINyLoD78U554nFljrTol/k/b/zAIFb7fYSWvuh80N/NVPr9W9g
	NxhmLTuykZ4v3AoMl5qP3WK2ovw2OT2P1HqxeRa4M6dRhXy2YWjW4fIxIGF5ObWV4dhNe1Tz72GnB
	LSMTZ6ygV2s2ugnE+POt2TRnXdj2mL10DD+P6HGOi44EPdl8CimJ+vYO+OkxGHaZqT0o24oOQTt3u
	zVAwryA1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9360-0006rE-Kq; Mon, 08 Feb 2021 09:44:40 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l935y-0006pg-IH; Mon, 08 Feb 2021 09:44:39 +0000
Received: by mail-pj1-x102c.google.com with SMTP id t2so3294942pjq.2;
 Mon, 08 Feb 2021 01:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1e1njK4JCLyF4BWRntmeMNLMXKX/535/WykRDF+9nqU=;
 b=V60zBhDDKDyHGPs3l5Z/FEcXvggs0/y0/S3lqRHr2zmHjQS5aocVuc5EQTP7NYwf8V
 emSAIhOh+J3YhF5Np4egOml+nmRofHygmP+V1/878PhcRt6sDf+MGKFv+kALL+A6/ytn
 AAw8tX11q57/Qcc5rD/UjNXFftUhLrhxIHlKFfFY6fpBY+EgJNonzcLJNIMy2TAFzur/
 KMo+/+YrxTv5JnJTXkCsQ13IVQis3qIyDgbnC326kGTER+Z7L/6VQmgNJZuYlRIIbcHm
 de5gpfsEqkDDCfPWWb6z08c4m3OCF+tTAOnZmo3d6Xx4tkNTy5tqkE9KCksp/up7H0+i
 rD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1e1njK4JCLyF4BWRntmeMNLMXKX/535/WykRDF+9nqU=;
 b=SZ9JWnHI3hRXcaBQg8XW65q4iT+ipEk8PKdP/df5B7KEIJUvkOnwrCCsniMK+GBMVz
 otSMw9NI43XcAomsJFH3XfZ6FZLhNfikY3+LvobOTwaszVpICRh3JT4tiWK5ibS3GYYJ
 otejhELjwz6Wij48WiB5chB/29NoqPESUa4MUlvEyQL9Y8RkBO6Ez41ya1sUyfVaZBl1
 E3ieO8TP7CWPOAXCC7XBSn20PBv4Ip+hEjBmGp57dghLRulK9QdQ56mNGMbuAyIC9WC9
 AUnQkylHk1go4mo1KdPg8Hm2KKWSrwyzbq/UnCXuPiL0pJIhedaXflmVthtdpJUqUz3I
 d8Cw==
X-Gm-Message-State: AOAM530ripf6FhnmDL+T1afzPWXk9vYeIsnYehoGWAMC2nDlyngJsegn
 8YkMVsdWL8Omer5EE0i+Szk=
X-Google-Smtp-Source: ABdhPJw5BDa3V6c/6RuuDbGvAOFRLIuR73+gdTWbAW4RznovNSmaJg8Zh+xf+cWxn0BQqCcUaf+okA==
X-Received: by 2002:a17:902:d113:b029:e2:86e9:c1ee with SMTP id
 w19-20020a170902d113b02900e286e9c1eemr15482631plw.42.1612777476582; 
 Mon, 08 Feb 2021 01:44:36 -0800 (PST)
Received: from localhost.localdomain ([49.207.205.214])
 by smtp.gmail.com with ESMTPSA id k69sm12208958pfd.4.2021.02.08.01.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:44:36 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v5 10/19] crypto: ixp4xx: convert tasklets to use new
 tasklet_setup() API
Date: Mon,  8 Feb 2021 15:12:29 +0530
Message-Id: <20210208094238.571015-11-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044438_651448_DC16CE37 
X-CRM114-Status: GOOD (  14.42  )
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
 drivers/crypto/ixp4xx_crypto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/ixp4xx_crypto.c b/drivers/crypto/ixp4xx_crypto.c
index 8b0f17fc09fb..b783ab58d718 100644
--- a/drivers/crypto/ixp4xx_crypto.c
+++ b/drivers/crypto/ixp4xx_crypto.c
@@ -414,7 +414,7 @@ static void irqhandler(void *_unused)
 	tasklet_schedule(&crypto_done_tasklet);
 }
 
-static void crypto_done_action(unsigned long arg)
+static void crypto_done_action(struct tasklet_struct *unused)
 {
 	int i;
 
@@ -497,7 +497,7 @@ static int init_ixp_crypto(struct device *dev)
 		goto err;
 	}
 	qmgr_set_irq(RECV_QID, QUEUE_IRQ_SRC_NOT_EMPTY, irqhandler, NULL);
-	tasklet_init(&crypto_done_tasklet, crypto_done_action, 0);
+	tasklet_setup(&crypto_done_tasklet, crypto_done_action);
 
 	qmgr_enable_irq(RECV_QID);
 	return 0;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
