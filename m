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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AD2C433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:42:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F61A206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F61A206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nx+tJQp/fztnvMIOfE+FWw5m34MR/M+ExeYqEcjlO8I=; b=INo8wypsqtB/SR81hZ72oBqJp
	YeowSZySJy/xXcNkunCb34VXjG2cxnrPQh3lNOOuYNghN+rKsSJqdNPQ/FYL5laIv3k4jk/xOy4iU
	KacHBrhQjgSl5db0Eir6fmfBLl5bZgGrNOQVa/5cRmE/5MtclfEpA8AhAM0nhxK7B6yCRFhVbnrmy
	amrDmHczhde5za3KhEVGFz/Sul4d1OCqJf41jlqyteg0R2uEn1I2spDw9eVEkYUoSWQMQfnqPD4pw
	oqJfljKh7QPNJXMjrCLNrPzu5kMDJXeasiUQfLHAIvwuOeHRnRsHbwUrG4Nv5qspZKsO82l5uXcQ0
	bIGb7+Z9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Rne-0007Y8-2i; Thu, 21 Jan 2021 04:42:26 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Rnc-0007Wc-2V; Thu, 21 Jan 2021 04:42:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id b8so561969plh.12;
 Wed, 20 Jan 2021 20:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pt3Ra9o7wlpdpNYx3JDjTYF1o1dX6A0SMQwis6c4Pyw=;
 b=kdJKzr3/KOueUuqVKKq3BnshDzwd/M3QDO561oVCTojc/9EIA1jKGn1vXT6EHymB8b
 A8KEKLAEvfazNcpPYdlj/8uYF2qugJdamq+YWmDyIdTPHIZ+6dVV26Lc5t6suwcB9dY0
 RWGkFRKrKA5e/IAnNQIIZRh7MUBUkA/T7SJvNpoWvEO3aHNRhHElD3b5BkB6+yU+zony
 kfnVQihyKH3xYr25Pt7fooWFeyHilx9KSt21RSlEkJ+HW8Ss7JBZhsiNQjlOCT8R+v+m
 1nKJaP/w03tl7TOanwIxWQjrVud2NXEPN0wrikeR5LvZAw0ieDhlDBWByWnipQ/0Vlun
 hiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pt3Ra9o7wlpdpNYx3JDjTYF1o1dX6A0SMQwis6c4Pyw=;
 b=kW35ZD2P2RCFfPwwEVhg6jhxeQ/k9VOxeEtzNPGFAJVjhrowOA9XWB0UzPL86ArF1s
 qCJiZ8w6e00ojT5dDoBziB7du+4fa2xhNyne7XI+ggWCDMXN6zRwmI0LDpVGZzkZ4f24
 fAiuoJv9VTFd+6bAKN004UHOhG4o71LEy58p3SRdwJ+C8EbSrBk5xWnHmPR07XuenOLH
 QsBUmhQSWPbsf6mscbiT2VgCFUSJtd8cWS7QT3/gokKBzzelRQHZwJp9GSJ2A4WAJ1Ea
 /pyqOj6Okn22tuJl7zt9Tr9MbuwYym6j2SesEEU/aIzP8jh6GwPXjNP/JqPGNbaCyjEr
 juhA==
X-Gm-Message-State: AOAM531J5zMmKqr7O74XY5xmv9pY4MN2K+HKkV3C5ZwSkoIMm+eCcc5Y
 oatwt56szSiVxOe52ZatDe4=
X-Google-Smtp-Source: ABdhPJzdyVPYF5JUS+hIw72+TAWRW1DhenevRKGUa/SuUS3MpBtGL77FofUqOu7EUYe85JNKgNbU6Q==
X-Received: by 2002:a17:902:d481:b029:df:cfe4:362a with SMTP id
 c1-20020a170902d481b02900dfcfe4362amr1518763plg.37.1611204142162; 
 Wed, 20 Jan 2021 20:42:22 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
 by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 20:42:21 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v4 03/19] crypto: axis: convert tasklets to use new
 tasklet_setup() API
Date: Thu, 21 Jan 2021 10:11:10 +0530
Message-Id: <20210121044126.152274-4-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121044126.152274-1-allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_234224_121967_64D370E0 
X-CRM114-Status: GOOD (  11.80  )
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
 drivers/crypto/axis/artpec6_crypto.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/axis/artpec6_crypto.c b/drivers/crypto/axis/artpec6_crypto.c
index 9ad188cffd0d..52e0c7fdbfa8 100644
--- a/drivers/crypto/axis/artpec6_crypto.c
+++ b/drivers/crypto/axis/artpec6_crypto.c
@@ -2075,9 +2075,9 @@ static void artpec6_crypto_timeout(struct timer_list *t)
 	tasklet_schedule(&ac->task);
 }
 
-static void artpec6_crypto_task(unsigned long data)
+static void artpec6_crypto_task(struct tasklet_struct *t)
 {
-	struct artpec6_crypto *ac = (struct artpec6_crypto *)data;
+	struct artpec6_crypto *ac = from_tasklet(ac, t, task);
 	struct artpec6_crypto_req_common *req;
 	struct artpec6_crypto_req_common *n;
 	struct list_head complete_done;
@@ -2900,8 +2900,7 @@ static int artpec6_crypto_probe(struct platform_device *pdev)
 	artpec6_crypto_init_debugfs();
 #endif
 
-	tasklet_init(&ac->task, artpec6_crypto_task,
-		     (unsigned long)ac);
+	tasklet_setup(&ac->task, artpec6_crypto_task);
 
 	ac->pad_buffer = devm_kzalloc(&pdev->dev, 2 * ARTPEC_CACHE_LINE_MAX,
 				      GFP_KERNEL);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
