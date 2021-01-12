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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B056CC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:49:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6389022E01
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6389022E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x/rPnw1R0eH1nc+MYZy1FdsgONCWnnmGkwB5ZjLryX4=; b=0vAhKRVZJwl2FSEfl0/3Ef99Q
	y26mO+JtsVczx5sUdhZmyX8473kWd6VTdg95Epr+gvR1i+8OsOPXft7xrIl0GiIsZJkqHbJcZJ0gt
	JRDm0nT8byi7GbFl8g2otuabE3DgJROc1UtmiUJx9MpZY0g6uSjo1Ga5eVTdI2IdSvQJZ/p0/3rfT
	Lb/n/JSbDcsI9bGU32nyHPvFb6djyVXU3OCoWRzRYoV0HIltprb3VBPe6IyEKV0+LJhcYZJ+jF7D9
	v3pkENZ3w21r63VzUJCgnii+qVdDPRqdEhZTktHm6veX/fAGDSkxcoG/qsma5pbbcA+yJIPPEv/po
	e/eK3dnBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8np-0003kT-2f; Tue, 12 Jan 2021 01:48:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8nl-0003fK-0n; Tue, 12 Jan 2021 01:48:54 +0000
Received: by mail-pf1-x436.google.com with SMTP id m6so413956pfm.6;
 Mon, 11 Jan 2021 17:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1e1njK4JCLyF4BWRntmeMNLMXKX/535/WykRDF+9nqU=;
 b=PNTUCk6geY5InMoWegd4R/7ONBmdHbmTHWHsRBWkvZ3kJmCcHaJmJ5QQkV/yeBWyez
 WPGP2fHvqagetLt99OfbaVvv7Y79YL8mW2shYT7OQzNWTFGUu0mzMYKK/j9vPkPK1nG8
 bY22R8x9E2Nw91rpxpQmIQ/uLbrsO9rvPP4cxl+Jghr6At5EXNPywimw+UJYhyOR7ViH
 t8SdsYEpKbgUC7ZL09cjpNxJeYQXxfjfDppZ+jWdZGZAwqanuz1bCiA/msIYOrCbvEy6
 4PkDV3HDHmuB7J+PxTcreaYcavADyXQEo7Fhf03R/hRO/z3I9AGEnnCN2ye6+qQUweMd
 YmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1e1njK4JCLyF4BWRntmeMNLMXKX/535/WykRDF+9nqU=;
 b=EXbFnIKDW0vpD/q32fu0FrH5XCN6QgcgDZdNV9woZPJNGL1SEZJnDnlp9PjYMbmy+E
 5p2qSlLagV9ODg1s9VHzaoEb0aI6xYWoShyugUxVUYhznnQqy4d2HxW1CCFAYuvGsTQX
 xPvniAm2SIVeaKtrGOh1nOoqDabXZelo2hWkE8j8BW1S7A8QUdsPKWlhyNu7usDnSORA
 KwRNJOpzUBGoqdI6g/uL4ALWFKIEu8V+BBRAjD5Z6KSC5ge/XcjUtlXrcNHve0PYKpBS
 PCJ7verY3EQyO3ByHPrmVKH6NbnI7aXKd58NUwJhrNfiDAW9LHIphlDs56yrVb8E3nu1
 pnxg==
X-Gm-Message-State: AOAM531ZXpK3lMbD1YpPhsPn38clQN2+bmk00+ddE1uyBvDBjCjK2JJ5
 LZWHJwoC1Byn4Oh9uvDx9Ss=
X-Google-Smtp-Source: ABdhPJzT18hj26phenaIO8NQZKd+sXCJ37xFRYlpef8kLeq1OsoWxGXLH5LS5CCM+il2Kc/v6f9kjA==
X-Received: by 2002:aa7:8c13:0:b029:1a1:e39e:dc29 with SMTP id
 c19-20020aa78c130000b02901a1e39edc29mr2438520pfd.64.1610416124911; 
 Mon, 11 Jan 2021 17:48:44 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:48:44 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 10/19] crypto: ixp4xx: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:41 +0530
Message-Id: <20210112014650.10887-11-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204853_669987_BDC98DA2 
X-CRM114-Status: GOOD (  14.15  )
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
