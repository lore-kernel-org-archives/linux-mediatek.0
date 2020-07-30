Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7CBC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 04:01:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAFFE22B42
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 04:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eG0x+WAp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h1y6cW+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAFFE22B42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jADp7kSyf4bdbZg2/xWS4amIjPZydtpYkmyY8w0pFwY=; b=eG0x+WApE1g8nJWYrBefQLxuXI
	nKQtgqqGql1dAEep9TCtPsr4W8Rxmsm4FSS3M4oK2bve7ZAoyFNALckNZfJRhBwsrt/yI6Rx/65hv
	TX657ng1TPcYiu2fPs33Pdj7U0inWPHpt3E/sRVjCTjHMJxTJhQ2fT1+szdoA0iOtR9vNSyAsAetf
	PM4/6Rc3Q9xiOp0CZOlx1GEONeoxADHL8BJGDRSYlcwN+kP1wVKCtMQ9USpx5nyPkZMjIKFC1l3sm
	IPrrtLVDn95bqHloq56qu/tV6IujqnO1oQBON6TIGhIEqqoq67RJ8y6bj0XPGDEUSBO4kyhodgMt9
	rp3tOqng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0zks-0008Cn-Gk; Thu, 30 Jul 2020 04:01:18 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0zkq-0008C7-4V
 for linux-mediatek@lists.infradead.org; Thu, 30 Jul 2020 04:01:17 +0000
Received: by mail-pl1-x644.google.com with SMTP id m16so13068003pls.5
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2020 21:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xsPP2haPHn6gP2Ahy+74zO8OhQ1ajIMIhlDBCTv89iU=;
 b=h1y6cW+6Z9M3i8Gmgo+exdkCKFBjsJco4+EmU8SXWJjn4RYqJkUIfmBZkebgkvyLjC
 90xEmIQysAERID7Tr5dKM9CYAfnfTHChrpKQMsBES1fhl08rGMG3kVGuoHp/uvHIG6l3
 bMhhMk7DDLNn8o8VWm5+YoMHFVNIio0Q70Lf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xsPP2haPHn6gP2Ahy+74zO8OhQ1ajIMIhlDBCTv89iU=;
 b=mqUgadCumgflI+F9m7rCDiMmxSSTn1lI86NjNbCcccKIyC5HBeTzEFJ3cny9IFM1Go
 CDQFLzePPiVndKJrBdRkvQt6OjKz2VrjUgEbCbTMVN82qWHfVaeRxOf8AmeYKDZPZTMB
 gRIwGJppH3IOXJSWKFsOoAi1nDhoFZqlWiE3Z3lWPpevprKEk3rjTtO7sm2dYHilXah9
 5K/zXhf95fvCR0QF+Mhu709vg8/jfMrjGWlgYaZ85/0/17EdrugUUMf0wurGwuET1wBh
 3OUnnWjG6EaDgSqFk2WflRfLoMj//syfnJIbmPsyZBJNcZRTBuQe2cd/vqjiz0Musioz
 j7kw==
X-Gm-Message-State: AOAM530EGjO5UoJu8m1d48GOqAyVA/BZossApk91M9nlO61gIUbbJKqt
 AEnEXvEXbSHJ6ufvfx2dP6LzBg==
X-Google-Smtp-Source: ABdhPJxkoLXNECTfu4ISeOa4wxsYJN4hZQrVF0BybO4ggF5F738z+52YcT2dpRPFmHvt6Q2fHI6H5Q==
X-Received: by 2002:a17:90a:5d87:: with SMTP id
 t7mr1095548pji.213.1596081673509; 
 Wed, 29 Jul 2020 21:01:13 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id c9sm3635209pjr.35.2020.07.29.21.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 21:01:12 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] soc: mediatek: Check if power domains can be powered on at
 boot time
Date: Thu, 30 Jul 2020 12:01:08 +0800
Message-Id: <20200730120054.1.I5e6f8c262031d0451fe7241b744f4f3111c1ce71@changeid>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_000116_352806_4A26C6B9 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the error case, where a power domain cannot be powered on
successfully at boot time (in mtk_register_power_domains),
pm_genpd_init would still be called with is_off=false, and the
system would later try to disable the power domain again, triggering
warnings as disabled clocks are disabled again (and other potential
issues).

Fixes: c84e358718a66f7 ("soc: Mediatek: Add SCPSYS power domain driver")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

 drivers/soc/mediatek/mtk-scpsys.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index f669d3754627dad..0055a52a49733d5 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -524,6 +524,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	for (i = 0; i < num; i++) {
 		struct scp_domain *scpd = &scp->domains[i];
 		struct generic_pm_domain *genpd = &scpd->genpd;
+		bool on;
 
 		/*
 		 * Initially turn on all domains to make the domains usable
@@ -531,9 +532,9 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		 * software.  The unused domains will be switched off during
 		 * late_init time.
 		 */
-		genpd->power_on(genpd);
+		on = genpd->power_on(genpd) >= 0;
 
-		pm_genpd_init(genpd, NULL, false);
+		pm_genpd_init(genpd, NULL, !on);
 	}
 
 	/*
-- 
2.28.0.rc0.142.g3c755180ce-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
