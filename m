Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DD3C43600
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:17:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A7461C4B
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A7461C4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wn32ca8mJOgvGp5ZMuGFQ/+xRs3DY5aUqKCVbmSRglU=; b=PrBcmsWgETJuYxBLe/a+ba2h3
	OHpCjK/HfRpMhqSiiL3YcC1hB6t7kw6zVMYwR2uUDOO5QVjKMY3uqfE7VoHzUAuOSBIt0TqGMxcTU
	PWBgEhhdNhW1bBPvxXHboZjyFN8Zq7Ej1If5fhskosPmdQnIzPQFCQQXz9odP1rZBW9uRuSUh/PLq
	HOSlLEOgzCQOKkxkp7is0h1pUU90J90kSTigTBFxxLelD1WYAalvRX98qmA8+5ynDkrdVyXlpmo7Y
	TyGA3G+8xh6Za2CQXueZH3HmyJVd4rOh5WZ08K7BKIzgwH0BuYY7E52sO7Srqcw8gMjZIN65TpiDq
	Mvo+6q/Sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqcF-0039NI-QA; Wed, 12 May 2021 15:17:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqbE-00396m-Aq
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 15:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=63QQCc6cTan1btl2te+SCsjBWU0FH3iC+vQeIXSq1iY=; b=ZY5kK1CtWiesXXjrgMJa/Jy9FC
 tcVtqud847e+cGckFpZzpa/R5p0Qodi/r1IY65U+0JqaMUeCOP7eJS84FiPZiTx+q8F8z7YLlnI/I
 UaWy09BI8KBd283j07Ci8rVuRdjSt32mB2WPP7hEh19iDz9766QDCQWzzEtG5TddjHbaOmL5tA/GU
 XJbhVovnCXDfoCCbIkL2SxnJ4sNzOtF2jiDCvfg5j2kpl92mSG8H93uzc9AjU0pOMIqeShaLrqybY
 xiSCaO7+DZ9CZargNfYu/bLd6/rnQFU0EqJrh1PyBnBaq6W7BcTxRt4No2GTVSkeJ43i1IF/Vuff6
 7a102k2Q==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqbB-00AVCS-Gp
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 15:16:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1594666wmy.5
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=63QQCc6cTan1btl2te+SCsjBWU0FH3iC+vQeIXSq1iY=;
 b=V9R2XWR/saz6XB8NRctn/cGN1pRjTqiEDub+PuWKysZpA8EcL4PA+58xSrmgeB0du5
 Bv41I/jd6D/4Tif0aS/r1KPKknFBgvQ0DOqezpAF7EHP+xLskYV9C6YxDMmIwPnt78Gu
 UjvQ2c6VGMv0oIwds2bqw31zezgXow/oq+REYMVZyGoQ5fjX64W2axB6QRE3elQt3Yrb
 BYaCJWef7OxPOs+WqHrzq2b4DEvybfNEIV3UcgcQfs2SoI9M8ryJD8mztruRKRx9nwy9
 Zcqr2jR4+eVBb0ikee0QNVVFIT4OQItpdd1eFKYHCz/Tuk4GVZ7xwHCztgO9nOscQeN5
 9UGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=63QQCc6cTan1btl2te+SCsjBWU0FH3iC+vQeIXSq1iY=;
 b=duLFsh1wAE/aXkYq8V7yfNXqMJeQSF1iSFYIOdY1mq3EPv873jXQYNFu/+wejK/lIT
 XCiGYrc3kPAwkm2wjqCbiF1uAI8K+xk+gCZXMjwQgj4WmIREgbZt3EeWpTdB4FS3well
 YVpLAS/JRVL1Z4UxTuh+7J3hAjYItL2fFG721mJBxXTV5BMJhSvT+M1T1PGAWn9DqmIk
 bKnbVSBqOrYRo+LYrepZiqYQyOhC9Bv0/yfx0xu6v/So/WR188lHFAoA0YD+alHgBWOE
 syoLrbCa/wjlnDmSSJyPgZuptwJduMJQl8fH5IkP0h3SXJykCes+70UOJGOdLWRo5E8/
 p4ZA==
X-Gm-Message-State: AOAM5312MtuaYXBQKuNzvnZXxfoO+ApePGAjZtes6u4Yb/spOlc8QSnM
 uQyXEwc0nIevgKKgcU20Yl1Rng==
X-Google-Smtp-Source: ABdhPJy33NvSem24eI2h1X+78s6h8Fyljd3qZ3KpToCeaJt1bQMLx99FHMfDjjXFE0vPCV8Wp+5oKA==
X-Received: by 2002:a05:600c:3592:: with SMTP id
 p18mr20474678wmq.44.1620832589473; 
 Wed, 12 May 2021 08:16:29 -0700 (PDT)
Received: from mkorpershoek-XPS-13-9370.home
 (lfbn-tou-1-1465-169.w90-89.abo.wanadoo.fr. [90.89.34.169])
 by smtp.gmail.com with ESMTPSA id c15sm30095011wrr.3.2021.05.12.08.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 08:16:29 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 3/3] mfd: mt6397: add PMIC keys for MT6358
Date: Wed, 12 May 2021 17:16:14 +0200
Message-Id: <20210512151614.36996-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512151614.36996-1-mkorpershoek@baylibre.com>
References: <20210512151614.36996-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_081633_566239_0C8B8254 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible strings and interrupts for pmic keys
which serves as child device of MFD.

MT6358 has two interrupts per key: one for press, another one for
release (_R)

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/mfd/mt6397-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 8738b5524783..5b79975dc13c 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -45,6 +45,13 @@ static const struct resource mt6397_rtc_resources[] = {
 	DEFINE_RES_IRQ(MT6397_IRQ_RTC),
 };
 
+static const struct resource mt6358_keys_resources[] = {
+	DEFINE_RES_IRQ_NAMED(MT6358_IRQ_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6358_IRQ_HOMEKEY, "homekey"),
+	DEFINE_RES_IRQ_NAMED(MT6358_IRQ_PWRKEY_R, "powerkey_r"),
+	DEFINE_RES_IRQ_NAMED(MT6358_IRQ_HOMEKEY_R, "homekey_r"),
+};
+
 static const struct resource mt6323_keys_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_PWRKEY, "powerkey"),
 	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_FCHRKEY, "homekey"),
@@ -96,6 +103,11 @@ static const struct mfd_cell mt6358_devs[] = {
 	}, {
 		.name = "mt6358-sound",
 		.of_compatible = "mediatek,mt6358-sound"
+	}, {
+		.name = "mt6358-keys",
+		.num_resources = ARRAY_SIZE(mt6358_keys_resources),
+		.resources = mt6358_keys_resources,
+		.of_compatible = "mediatek,mt6358-keys"
 	},
 };
 
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
