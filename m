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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1176BC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:31:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C082123356
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C082123356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q2u0m/ByZBlwGZbS55aiAoDw/ZbqAew+knuzjeExeT4=; b=TKzRoWZ5BdTyDfFpcoS1CG8no
	mknU2YWMo5WpW1sm8pZ82QPNcSPXWswb/SbQB7yM/3SLUv2Csweoh8t3PbutKzsKDkjhz5Voc2xiT
	QUdVVZGgFhbLAMk7t6K6sRP5aQxnLsj6SQn+14RRWM+D7W4CCxFAiQ6BZMWdNTqp2ND/3MkNwZ6D5
	HMfRHN0VO3FbvlIwJamvXEV9wbWUKxi2i2LgjV9hP1CdT4BesCbp0Ui2UBRnu7oDP3na6pbNLgWxI
	uUrqXa54eW7jI90rwhFHVmN1mzwAvm1pT5sJqpxYLaowrgfiZL6vJjuIhQ6++x0zbkxd/9QPeoI7A
	JvSTy463Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxURr-0004YH-0R; Thu, 07 Jan 2021 12:31:27 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxURo-0004WL-Bq; Thu, 07 Jan 2021 12:31:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id z12so1345215pjn.1;
 Thu, 07 Jan 2021 04:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u19NxDApfMXx+Y8pGP/iF30yq+dZf2FG4hiZfFrFBcE=;
 b=V1vfZ4x5Wfxkd5zVPqFj8CmcX2UJQPnL4eVh0PHLtBP/O+bnLI8npKqfe0WWNSSjtp
 jVxjrpT9ITx0wMYv5LWSNWZS3ShZSAfyxkkqN24COtQArayItJ6AlxcqJCy+ovUEPBUm
 UuCmlzpkQ9XvyBl5Xmaf5dx1rxyduiiXh76svNgHpxKfPWF2l+KPWbirwAsIO6vB+NC9
 K7mzRzbHYU4rIdO8dK7KhWZE5raGjBY0ImjknQ0UlJsw1JelcWm+BkAaVDsd9YEK7A/d
 R9xWE7pg8dyRY6eSOAX9g3uHebqMlbowmSLLwePMyuXP/C8SOj69hIypk8SXS7IW/M1k
 g/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u19NxDApfMXx+Y8pGP/iF30yq+dZf2FG4hiZfFrFBcE=;
 b=dMNpykf56kzns6ILDpn3DA7RaKWdFBbPkXJpyU599T5YHlXla1ifxCO1eqIHxwvhoN
 6CSvXCBKzymN8QODbtyEZAr010PGinCyGOik1Wrn4oiPeBX0EU9yLKg2Rw1hLWf7jpdP
 fxmjj8J6yj1S0rGA16LBmKOgyvGqw8OjFtBEYryPv3MTixv3lZhbtmEwhk8Vl8xFoCLX
 lvI2BP2R3pMSOicvy6qLKq+sWHgk5e9kmU8g6WdQbdy9dkPLS6BcIdn+UYLnwDoNNwAd
 bDrPlb8pQPGXBcl3t97rA2ygMBM1RVBTvQPJOA6/E21PRCJwRP4cdao8K/ze8hFerYXW
 7nWg==
X-Gm-Message-State: AOAM533C+hol7kJmvUHZB4VqYXZpnCnDGWrGdLAyeQ7yC8ZgxyQuJ1qu
 JkQLl2nRTFvB6BeXxM1epHo=
X-Google-Smtp-Source: ABdhPJxoWvVixLhb4AqWe/Ovm28z3v0vAZuqSGnKpO54YLN6o9l6jNS4i24bVdxlg+M1aNnBhG8Cfg==
X-Received: by 2002:a17:90a:aa85:: with SMTP id
 l5mr8154475pjq.230.1610022682199; 
 Thu, 07 Jan 2021 04:31:22 -0800 (PST)
Received: from localhost.localdomain ([49.207.216.201])
 by smtp.gmail.com with ESMTPSA id h12sm6356014pgk.70.2021.01.07.04.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:31:21 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v2 13/19] crypto: picoxcell: convert tasklets to use new
 tasklet_setup() API
Date: Thu,  7 Jan 2021 17:59:38 +0530
Message-Id: <20210107122944.16363-10-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107122944.16363-1-allen.lkml@gmail.com>
References: <20210107122944.16363-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_073124_439796_4421B56F 
X-CRM114-Status: GOOD (  11.91  )
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
