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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5B5C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:48:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958FB22D6D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958FB22D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yusFzoICyuk5eGr49Kgwpm8trZ0Nsna4xEDGxLiVCW4=; b=kIbOi+HM+BgcWAs0tpwNTlVpu
	R9+XJ6GngAoqcAi5ZGaY47gE5ZHvfCC4TlYwOhISdsH0t/FbHRm7I1s859mg8FStdkuJLuonHvfUd
	Z5usrGD/E91H1cShds83URfH7usdlus507mCFyoY50u/BzgS3GRaFJGn97elUWQpWAlEjjHhN+Wta
	7Pj3TFmtWPzlmsdaCBPSlX5KKzLqG7VB7LB65TufhF2L68A7IAzWDoktpFwtVOhflhs2Zkpx6NIYl
	17ntnRTzRrlcRBhRsZnyZKd2VchtCucoHKA32bezAdnS76I7AwkrbTjjF7PfML9xPKnO6O9g9zZnq
	3j7mPZlfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8nO-0003Wv-8B; Tue, 12 Jan 2021 01:48:30 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8nL-0003UK-Ac; Tue, 12 Jan 2021 01:48:28 +0000
Received: by mail-pf1-x432.google.com with SMTP id b3so81198pft.3;
 Mon, 11 Jan 2021 17:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IcYiMBsXjgXqsCUOACpj4n3qnT1OSjGqlWhB/zIbApI=;
 b=LEsRPUl3W7RrtlJCn/EYjcnFyXEEW56pYJRXcpibCLSs/FaVvKj+8jPsRbc8tCIufo
 u8JA5ti3/Ux5BF/nk87cbT3BFHaecGq9B5NV4obXhLeJihkhLhUqkXt+IFUo7Qu7O9CW
 BESrWTa2CrZgjderdqKn/y8VvF6He0j5l3t18fI3UPu6UBXKvDF1QCeSaw/3KrnpE8lV
 ELcX9dWNWAFhDewSF2lcwqTpB3daA4riRJjo8Kv73E1fYjTlSEDT32L8J44wYFM7wHxD
 gh4UICQ1hMRxgsiQtWev7pUTbRTnmj6Mq4wyAMw9VnnlU9ddDajMPiX6HPpdqygRC7sq
 AEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IcYiMBsXjgXqsCUOACpj4n3qnT1OSjGqlWhB/zIbApI=;
 b=aB3itEp4VEX1d0JUONRtcoMmXiU04hj6+cyyffpTkKGr/OTKPl/SSRuE0+YQ/a0HHm
 rK2eqO+yVOOidXujbylL0M5qOwwkVZ36vqh2pde1SHCxWFz6/R8mbLhp5FjYhSWoo7my
 rTWfeieVVF7rupr3YKi5ZCWKCM5rfzbnPn7jY4Bjf4yV52eIrpmhVYT51GtNET/UJM6t
 pw3ajPBBxiWIz9pNgCpiAZ5BpdPtfF0wxPo+zoTJ+zCidmzsU/36FDDrDMJFDyA2U/Xx
 A5kfqwFhKojel3UI/lytWKWesr/ed1k0ecrfQwLJxJptAOn+Ab6kr+KMQZf0H0CmvtYV
 9o8w==
X-Gm-Message-State: AOAM530e4B0863pKzN6D4QogCCZWBe0g9f9PO+96EhvKPpZ4SLs36TOM
 lDVaJN5I3i/mrqYSpF/CSGs=
X-Google-Smtp-Source: ABdhPJzPX2YB9rom/mxYQLm3CNTkXAMDDEj/gkt391FUgLSnHxbf0yLblaNKx6qTICB2kx04ErzFMg==
X-Received: by 2002:a62:17c3:0:b029:19d:ce3b:d582 with SMTP id
 186-20020a6217c30000b029019dce3bd582mr2207512pfx.18.1610416105136; 
 Mon, 11 Jan 2021 17:48:25 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:48:24 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 08/19] crypto: hifn_795x: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:39 +0530
Message-Id: <20210112014650.10887-9-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204827_418000_75E38CB9 
X-CRM114-Status: GOOD (  12.89  )
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
 drivers/crypto/hifn_795x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/hifn_795x.c b/drivers/crypto/hifn_795x.c
index 7e7a8f01ea6b..47f7bb43477e 100644
--- a/drivers/crypto/hifn_795x.c
+++ b/drivers/crypto/hifn_795x.c
@@ -2445,9 +2445,9 @@ static int hifn_register_alg(struct hifn_device *dev)
 	return err;
 }
 
-static void hifn_tasklet_callback(unsigned long data)
+static void hifn_tasklet_callback(struct tasklet_struct *t)
 {
-	struct hifn_device *dev = (struct hifn_device *)data;
+	struct hifn_device *dev = from_tasklet(dev, t, tasklet);
 
 	/*
 	 * This is ok to call this without lock being held,
@@ -2533,7 +2533,7 @@ static int hifn_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pci_set_drvdata(pdev, dev);
 
-	tasklet_init(&dev->tasklet, hifn_tasklet_callback, (unsigned long)dev);
+	tasklet_setup(&dev->tasklet, hifn_tasklet_callback);
 
 	crypto_init_queue(&dev->queue, 1);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
