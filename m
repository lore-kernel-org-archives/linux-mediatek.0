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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9ACBC4332D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:49:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67B5522E03
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67B5522E03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q2u0m/ByZBlwGZbS55aiAoDw/ZbqAew+knuzjeExeT4=; b=FCwCDbi6tMuN1jHrrtSJ6MnbR
	k38lgouGkM+NsO07Z331IWcUlqPK+/tuqcMTzQjXMBPQIPOvcfIPQixELgtEwvGLnpPnLXjJzXV9P
	h1CDYQJrOGEEntPyCVBeTy8CHUoiv+1mCQo4//QS/xvHahg1Kdhj5gj87NvLLT+kAF5d+zfV/mAfP
	ScArZCF3RyxWCpsHKmi2rIau1GP3g9tyBFHtvvy4b3dyFB32wuMrYmfFdyo0J0oe5rtUbG+zvM0/0
	QqY90Rk2v/PaT1QEL95fF1W8yuEaJghEy4q0IFlxETy5xtA4jNzG8AYvD9qH3ICeSamBdpyMqUDaa
	f9n2OUHKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8o9-0003wn-4E; Tue, 12 Jan 2021 01:49:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8o6-0003u3-CH; Tue, 12 Jan 2021 01:49:15 +0000
Received: by mail-pj1-x1031.google.com with SMTP id b5so675288pjl.0;
 Mon, 11 Jan 2021 17:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u19NxDApfMXx+Y8pGP/iF30yq+dZf2FG4hiZfFrFBcE=;
 b=r7tiML4ldoBRZewsCdlsIV37ZV7wOsjcdFkiCWIJlW4dJGMEnuIDE00L4+ytt5m+hX
 C/awc06j554FRO8V8FZYFZXYddwTZ3EGIqObWoYWePASAo882MdkP7AdNmTEONiZFoib
 9rmfSsqtBxZZRKuoNt0YbNcdnYE9hoSUaHaU6Je0lQ+5q2XWrJZIBTrmokDu4kf33xgj
 jC0L9Pt5VoFOscfFs2gbhZGAdHSbdFn4/kU3qYPs9NZcK2U7JN6albjOgNUy0fzAJ08V
 55zd1mlgI/34wcWNoR/S7NhMGvNuDGnl9VQcvtv8yTm1FuiRPP4mA4jFaos8rBgVRfjM
 mHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u19NxDApfMXx+Y8pGP/iF30yq+dZf2FG4hiZfFrFBcE=;
 b=HEyI9SB20l+zykyuZ1EGYhL7cttbCx0GSRv9g72xg7GIT5/nW23Mla76m5/wiM0WA1
 8knFzCJuQ6e/iiRqruM31/tRFkYew4RMyvOGL0/6UrNImWFAaVzkYfDnN2vk2RX2OvlQ
 zg1XLcjfR1T0sA5OlRVTO+Uk5Br+eU4m9/PZNmKaJQItJaDedilzqGR0SRUv8hqz7Y3i
 11Wc7c26tjvvsO2Y3vQCVB9Fy47fE0G8onPdxKs9fA5MkPLrbc0gNIgiANhYWyCiTmLC
 7crSHYu303k6ktuuTH/+B7WYErWu72uLjfzI6b8o/E3gEAFByr2xnZoLGVabiE8yzTao
 FuVQ==
X-Gm-Message-State: AOAM530C7UKUq+uji/uu51EmjRKIhWjw12+arqwUu8CVU60+Az4jANS5
 SEtaTGKAEKumFLazX+3zSR0=
X-Google-Smtp-Source: ABdhPJwKgC3RH1nzB1/rKwmkmK9arutqt+9MvkjsAmm3hSY7v3qXi7pI9NIkUqME31+Bp+viPElEwQ==
X-Received: by 2002:a17:90a:734c:: with SMTP id
 j12mr1747988pjs.201.1610416152388; 
 Mon, 11 Jan 2021 17:49:12 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:49:11 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 13/19] crypto: picoxcell: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:44 +0530
Message-Id: <20210112014650.10887-14-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204914_482132_780584B0 
X-CRM114-Status: GOOD (  12.15  )
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
