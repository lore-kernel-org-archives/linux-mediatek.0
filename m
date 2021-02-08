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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6B8C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:44:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE8B64E7E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE8B64E7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yusFzoICyuk5eGr49Kgwpm8trZ0Nsna4xEDGxLiVCW4=; b=UaWZP+HILvFwPr6R9ajENnRcs
	vxeoKMpTai4ZMpunDoRJdUDkz4Gc5YNNRs3mFnUnmAS8yb8fW9YQrNfEEyzNzkomRz49k1k8SWHwP
	cbnQpwy36qGPNyT47kqdj20zwZgxU5DC7Cg8Sh9a4KT0k5vI1TLDYfYxaLW+pXwitjJBKhpXvKMJa
	klBpqWb+GwdmIK6JmvdEfX9xZ8aaU6kLoiJzv133kBbiPbGb4FPSDq3wlcNxYLg+YJIpkP7RQioyZ
	QPaAsxz/+Z4rsV5gvKdyXfx24F4RCz/D19lIpyVM71P+H62c32gwZlMHirxyFysTeXaSrraU6mFhA
	ps3gMHhiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l935h-0006i3-JE; Mon, 08 Feb 2021 09:44:21 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l935f-0006gO-9e; Mon, 08 Feb 2021 09:44:20 +0000
Received: by mail-pg1-x52d.google.com with SMTP id b21so9839715pgk.7;
 Mon, 08 Feb 2021 01:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IcYiMBsXjgXqsCUOACpj4n3qnT1OSjGqlWhB/zIbApI=;
 b=jwHt9cB/hvAN5MrrCMC6fwqHPDhreR+WCLYhSewq9xsRxuWLQdqyULHg6vKpD3Vchl
 D5a7wrmqyzXu1WzpgPr5kf2HpiXw+sRh1834qtJTvdD0aJUFMiB3LYfDU6WTEe0jZlv5
 hkg98ppXMxwpU3+mOXsiYl/Va7T8XJ4k0qD6kkRoDwQKGTw81pOekPUXL/FXYJpCra2q
 W+wBtdbtbcGZTJ30GrAq4gbRmISOIibABFn6dpVmSMpkTn8PUzVc49xIk0gXT158Edm7
 HNIjNUB88Rj/1Vfv2EkzSsX1TomqMeX1pMWw5y0tHEeRL4uk7M1RMzyMdDEr+47DEbLt
 hupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IcYiMBsXjgXqsCUOACpj4n3qnT1OSjGqlWhB/zIbApI=;
 b=aMeC8IIfPGzNeKrTxU3+CLpYnwQ9WYPhkZaVZyPDMbK7gd7koI60b1c1uuOqA/nnJa
 W2wcArM/tlCyNV9KkZO2UhkRloeuZF0ke326Xi7cojIx/uadEiIMZOVNxAW9L4YhN7hU
 3fE2c//xnlVboCi0hmPtC0RyfTSNEWTrk3qHqNCwY3UDXOo0Txe0pBUZm7xFQz6NH5UF
 QoMCSzIM1MxrM5akK1s8tDZb4sDNl7atFhouGrNlZ+wHJtc79x9uP34CMCo3x7ZuD//J
 AAt8AHXZanfhAGOMDK2h2QFWVvpghYZo4mahqPYYrs56Yr3h1U3uQiMB0oM+dSn0itPd
 tUAA==
X-Gm-Message-State: AOAM531aLaXqIMEM2WxkspuFKYVWa8cKgj3ihadOtTWPisikkExNFHLC
 oJgLxBrhotndfXqBCw4cptU=
X-Google-Smtp-Source: ABdhPJxWIwHgr97+9Rx/z21GfgcB8MUOXefY1oiTlDyrjJ+4tQlyWpRXgMoWOM78yFdDOnVyZkv1tg==
X-Received: by 2002:a63:f60e:: with SMTP id m14mr16244534pgh.413.1612777457335; 
 Mon, 08 Feb 2021 01:44:17 -0800 (PST)
Received: from localhost.localdomain ([49.207.205.214])
 by smtp.gmail.com with ESMTPSA id k69sm12208958pfd.4.2021.02.08.01.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:44:16 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v5 08/19] crypto: hifn_795x: convert tasklets to use new
 tasklet_setup() API
Date: Mon,  8 Feb 2021 15:12:27 +0530
Message-Id: <20210208094238.571015-9-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044419_394281_56A5FE3C 
X-CRM114-Status: GOOD (  12.95  )
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
