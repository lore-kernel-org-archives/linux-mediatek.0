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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E097EC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:44:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9E164E7E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9E164E7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fOWvJIiVCmL5/ou1gu4rc43qqTNvvk5I9n821vt/wsU=; b=RIg6IxPBi1sTlcNLXb9GDhkMf
	yNS08rRpCmDA/IbG8so2wZiwdUOKAUoM1eQfjNbBFyBKafmYrLI2gR2+4rCFlU4P7A/OBu8kkggWx
	ik70ZWwmbi5SK9E6S1zQuXM9xBcCwj7wL8zCvadkRDY1AoDHB4V9Yra3BHqrluwRwIlhzuW12nQnV
	frtUu/mpRk1znxuVQ2nqrv1tMoUoF9rRbfD0ByX5h0VpK+wNsdhERJt9ojGt7Reqt4IGnV1VCa+mZ
	zhGT/LroQRI3/2LOwl73uNN4S4SVo9v261Bp6TJlCeAGA7fetOmcV8XTqsKBGvwIK673K/OSwDl2R
	mG4d8FUFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l935r-0006n3-Jy; Mon, 08 Feb 2021 09:44:31 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l935p-0006lf-5U; Mon, 08 Feb 2021 09:44:29 +0000
Received: by mail-pj1-x1030.google.com with SMTP id d2so8463463pjs.4;
 Mon, 08 Feb 2021 01:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HNZLvmQAqbtAqMEvJP1wVGbLyEu2FmrY5NiRBOEZCk0=;
 b=E9UVi4abvaxsbLhlHYyDlxF8WRm6Eu0gMRiLrkvvtuXqnPnqW6bL/KOZ5PtwqvI7L0
 rr/mjZFilH2Hx/ngpK5+H81e3vqpySwZoJTo+05vSEiLs6urR/Pk7xeEkQq3955cfLQy
 PDniBGHgBVTpAvBzFgL6HTS1Z1XXrDbvdPMxB1lKgQ6a6LDsJOiauZP9MYqaavtk3SfN
 n2agapT/l7OsKweIbp61n2EXJS4S7anhuLKppP7bPX4HAQ7oHxxBu04I7PZ85idFkDjW
 oNUFRt9BJ72Nx85EdziKeK/dIrL9M8B5gXEnis4KZQdrUUH5mSjubnWGQ5Ljme7a7Z/p
 JMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNZLvmQAqbtAqMEvJP1wVGbLyEu2FmrY5NiRBOEZCk0=;
 b=Szi6rRBY7XzjTEnN1zXAUsoa1nRxzB9bw09cZTI6N0DaSKHHsttI9KX6t/lKu6X7cu
 OxIudNx36w7PrA5GO511XXzx5Fuq7kCCExxvXuR3mNEb/UE9oiAmXvAtkTuMOeMOxeqa
 zWLIgQl5359SfnawQ/QcTodI+DwQLmjdSD7IzZbNqRzI+xIpPmIBnlG6kqphzZQelgt7
 P9u9SzlzVe7e7sUGsxfPjv2Y//tAs6LU0Ah606fZXEC+gX9TY+HBR9h707pNScMppeQP
 90xYgjnVta/dWUylA8Lnixycuw9Bo42pmFg7SoU3OIoIwnFdB8A7F9oMGgQv5rTLyaJi
 Tvgg==
X-Gm-Message-State: AOAM5308RE32SOAEGMGoIVM6OXyZMx7VxIF+iSylIxIEBXkg53PBbzAj
 TudxEWCT+fwWw7VEuVPeqJs=
X-Google-Smtp-Source: ABdhPJwlG5OBJ0kvO2nRWf/monva/qL5NPmob87P7q3hiCtrCSN8PWpMlZ3xPHLxm8XYV9X9uwnvWA==
X-Received: by 2002:a17:902:ed95:b029:e2:d080:7e0e with SMTP id
 e21-20020a170902ed95b02900e2d0807e0emr6794449plj.85.1612777467166; 
 Mon, 08 Feb 2021 01:44:27 -0800 (PST)
Received: from localhost.localdomain ([49.207.205.214])
 by smtp.gmail.com with ESMTPSA id k69sm12208958pfd.4.2021.02.08.01.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:44:26 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v5 09/19] crypto: img-hash: convert tasklets to use new
 tasklet_setup() API
Date: Mon,  8 Feb 2021 15:12:28 +0530
Message-Id: <20210208094238.571015-10-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044429_221385_C202C7A1 
X-CRM114-Status: GOOD (  13.29  )
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
 drivers/crypto/img-hash.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/img-hash.c b/drivers/crypto/img-hash.c
index e813115d5432..72b65cdff856 100644
--- a/drivers/crypto/img-hash.c
+++ b/drivers/crypto/img-hash.c
@@ -355,9 +355,9 @@ static int img_hash_dma_init(struct img_hash_dev *hdev)
 	return 0;
 }
 
-static void img_hash_dma_task(unsigned long d)
+static void img_hash_dma_task(struct tasklet_struct *t)
 {
-	struct img_hash_dev *hdev = (struct img_hash_dev *)d;
+	struct img_hash_dev *hdev = from_tasklet(hdev, t, dma_task);
 	struct img_hash_request_ctx *ctx = ahash_request_ctx(hdev->req);
 	u8 *addr;
 	size_t nbytes, bleft, wsend, len, tbc;
@@ -887,9 +887,9 @@ static int img_unregister_algs(struct img_hash_dev *hdev)
 	return 0;
 }
 
-static void img_hash_done_task(unsigned long data)
+static void img_hash_done_task(struct tasklet_struct *t)
 {
-	struct img_hash_dev *hdev = (struct img_hash_dev *)data;
+	struct img_hash_dev *hdev = from_tasklet(hdev, t, done_task);
 	int err = 0;
 
 	if (hdev->err == -EINVAL) {
@@ -954,8 +954,8 @@ static int img_hash_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&hdev->list);
 
-	tasklet_init(&hdev->done_task, img_hash_done_task, (unsigned long)hdev);
-	tasklet_init(&hdev->dma_task, img_hash_dma_task, (unsigned long)hdev);
+	tasklet_setup(&hdev->done_task, img_hash_done_task);
+	tasklet_setup(&hdev->dma_task, img_hash_dma_task);
 
 	crypto_init_queue(&hdev->queue, IMG_HASH_QUEUE_LENGTH);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
