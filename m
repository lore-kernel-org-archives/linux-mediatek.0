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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69334C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:45:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22DB164E7E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22DB164E7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q2u0m/ByZBlwGZbS55aiAoDw/ZbqAew+knuzjeExeT4=; b=VqLsbN2KLjbnZ92Szf7XBFcFT
	xCoIV5943BKdk6qbeed+kLLY5IfYfvEQGpMnstVbYQlkpGlDT7PAGRgsv18Os+q7558t06Kfsd1c8
	gbbSts6XnVXYS7h+a828E9UwTpdBu9ZzG1fbMzc8KRFs+Lti6gwxhG3lEnlbjlATmLgYndYTgPj0L
	Ll05Jswr3IeMn976P9zfUxxum7zZRnj/IALySWlU+56uMgdXaXKM5uRJxbGYvQLMvDDRhvMIszEzZ
	nHtx5uHnUPxWCJVhx89yPUZ9rz+uu4hvzgUifWvytkQs+LAVcTSvDUFVfXPU4YFoCxll6z9b8+pJ7
	IUS+K5wIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l936S-00074C-UD; Mon, 08 Feb 2021 09:45:08 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l936Q-00072V-PU; Mon, 08 Feb 2021 09:45:07 +0000
Received: by mail-pg1-x52f.google.com with SMTP id e7so904956pge.0;
 Mon, 08 Feb 2021 01:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u19NxDApfMXx+Y8pGP/iF30yq+dZf2FG4hiZfFrFBcE=;
 b=ApWKweDrKDpU0fMRsdEf4+d0CAZUN1Q9h5p/1AUF6cRmIcqnX/F5krvog7HtwIPzwi
 NwvS5QfVzkFbS+VWJ3/2gt3mb5+6U1ug8Np95HumVaXEKyXVwyrJsA0ZKmwv38ldzhKB
 kiHCliyObcPQY70peNC+v4hmFuc9nx+2ajKZAL8JMm5iqOvLr+rErtpqubV41Ft7DW3m
 OHOvcOXx0xHDKR0w5N7ack48m7+blXzymg4mV63CUx0oVuNKWroUkk/Rb6HVMScdC9mK
 Qa4PEY6i8RA7f9sCPdpI6OKoJy78KK3Z2hthvyU5bCrxyBi3UpcGOi/igw+wAGg/dUdN
 Xb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u19NxDApfMXx+Y8pGP/iF30yq+dZf2FG4hiZfFrFBcE=;
 b=lyIxut+Z11FrfuegcQ6pZ2f2v89Wy79EakdABX7jHPWU8oNEi8OlyYokEyMm13IjJJ
 cqeMehCnCEey/6mnONGPP6K46ccE6U+QWOci5WG4T1TYDHnL+KrVs8l89oEls0aniydQ
 OMMwEjDjuMoWqj+z+HOvIVsDsr1DyMS7UnEADEoQTb5h/3Dj2NFuePUAzaD43cVxl2JV
 2okGWAstbEaBLgPqJAoJwremoZWv5a2uSuTuzQyEMnDleTqWE4/Ofs8FewAtdkb3W1Ui
 q1kFHFPMXxa7NqM0NsHZUCmze1O4qMxNuQ/FxOhvzfAhdjXhvRAxATvSg8GDAU3RLOFw
 0diQ==
X-Gm-Message-State: AOAM530wni+xLm3b5Udge08Wr/B0sBn8Em15JJ6tWN/zP/lWfXduoA7L
 DMoJXu5FQjlpZfR2gNsp6XY=
X-Google-Smtp-Source: ABdhPJyZCCeRkcGMY1ZBPc5avbbzvh2aZ0DbxTjeVcri3Zq/yzhqHPofVINcOAchEvAi1Y3gv9u3Tw==
X-Received: by 2002:a63:1c13:: with SMTP id c19mr15713787pgc.359.1612777504785; 
 Mon, 08 Feb 2021 01:45:04 -0800 (PST)
Received: from localhost.localdomain ([49.207.205.214])
 by smtp.gmail.com with ESMTPSA id k69sm12208958pfd.4.2021.02.08.01.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:45:04 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v5 13/19] crypto: picoxcell: convert tasklets to use new
 tasklet_setup() API
Date: Mon,  8 Feb 2021 15:12:32 +0530
Message-Id: <20210208094238.571015-14-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044506_890522_7C828D3D 
X-CRM114-Status: GOOD (  12.22  )
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
