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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D60CC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:27:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C89B523356
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C89B523356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nx+tJQp/fztnvMIOfE+FWw5m34MR/M+ExeYqEcjlO8I=; b=NFbfFCBu+FD+Bnd5Qpvk4oBHr
	HgiVvNjuHZNrATOO+GgFypwsivwuN8kcIdc/7omo2ESwMwsY5Y+NyXe3qLjtAxQ0LA2DIX5JPP6sg
	CaP1qITIkwOPsthuOBIX/rfC6Wq5DcEz9gfA+Va5yd/ARs1Aft756d2HnyuTBuH6atuOhzIO4+ZfW
	4U9BtuyCdb6Hh//w7fFb2/cg0RT18f29Gy/7L8j8uaD3fHi+mF2jYsJ8UCLSlC30H1TaGj3UvHmmm
	9p16Uq50z3RmhgJgEQvpB+34xPE937J2m+L2lInUqfjnw2rZMX4hDkjpa3WEd5TxxnJkSKKu7X/v7
	dVowdljXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUOC-0003iC-D8; Thu, 07 Jan 2021 12:27:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUOA-0003h6-5p; Thu, 07 Jan 2021 12:27:39 +0000
Received: by mail-pf1-x429.google.com with SMTP id c13so1067763pfi.12;
 Thu, 07 Jan 2021 04:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pt3Ra9o7wlpdpNYx3JDjTYF1o1dX6A0SMQwis6c4Pyw=;
 b=LaJaOgUfS2mksDAvNuGS50zbrWlySONgVy1PzslszujiHDkOF+lvqfdh5d1kSYzWhu
 rVoVlpXMXQcDthXshz1ubbVcG7MrUqceN2dfemCxKLN3vXZX5EqLEpYkG3ZUlYMbHuMk
 9dTop92UA2q+KPmSduf/kIZea88rjWwp3SrJL6qyLoQKObqH9+e3OBJ1iz4ghvK8ceF9
 4po09vE/Y6xSYMFrm7gnjZfXAM/JWRn3WXuMXfxIQWAKPospD3EJDoejfDNifc+9M7Js
 AlKJ774etDCWZEenSrfCi/HcrxhYb79Uq0GMaaAYiiQeBB0ywMPZ+OPE+hSUjWzT3Fau
 Mi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pt3Ra9o7wlpdpNYx3JDjTYF1o1dX6A0SMQwis6c4Pyw=;
 b=swywp09VZb3Hsn2bwZOpYTfYJpiFQdzGDd2oaI8fuj3rRnYmVYHlQlzBF9Dxfuif30
 R8DYCyBZBEHTWvkugKJ0ih0tSWUHiWHIBO02b1BqoUwujLJY7xcttLBneRsLVqVoRCs1
 DTj0y+s6avsEFKZwpTdNBIMfpHsHTHVxbnzB68lu/407PmePGiFBx5fr3aZ6+mfGIypk
 T/dYHW0tLM7UTFE8X7j7dSGQWecybeCQ7vRgXaqDpbL5wohdlI9L3pzXoYIX0Z5IrP5c
 bfIolAMl6WSWv+x7YlM9W5gstHQLqHS2Wh7son6Jx1W009xJz9Xbtz0jvY9SIL3nkcN8
 MJrg==
X-Gm-Message-State: AOAM533wyZc433mG6WzNFAMfXP+EWrDc3BHM8C5V9hTenw7p+ZXTANJj
 F7Xgm6UzoDzm5a3RZLVJoKk=
X-Google-Smtp-Source: ABdhPJwkwRG30UkJgDKao5YgmvhJZh+Poyk8jdZdvUk5stX2bNOUPSkdSosxtH//b/GHsNL9xBR4/A==
X-Received: by 2002:a63:9811:: with SMTP id q17mr1651620pgd.238.1610022456221; 
 Thu, 07 Jan 2021 04:27:36 -0800 (PST)
Received: from localhost.localdomain ([49.207.207.140])
 by smtp.gmail.com with ESMTPSA id x28sm5860403pff.182.2021.01.07.04.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:27:35 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v2 03/19] crypto: axis: convert tasklets to use new
 tasklet_setup() API
Date: Thu,  7 Jan 2021 17:56:30 +0530
Message-Id: <20210107122646.16055-4-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107122646.16055-1-allen.lkml@gmail.com>
References: <20210107122646.16055-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_072738_234651_4E173FB2 
X-CRM114-Status: GOOD (  11.67  )
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
