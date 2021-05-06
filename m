Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC058C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 09:42:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DDBD6112F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 09:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DDBD6112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8BAnHigiVq7upSE2ubiexqIGrctDhNCN/uU55myJg78=; b=C9p02K1gCAdRZZ2R8fm205KrC
	kVWV8vWDuoh+GkiGUpIV1XIhU+d8koCHX4g4ACcWuOT8syPsDRW9lwa7L+BCh23WBw/v2PWV2j9Mu
	KhQIXCdjOEx19wwCCboJT/HAmybRls/ATg8lHt7IfcATVliEEVHRGzmkkUKV73tP4E3RjVnR46xGE
	hX+z4iWuJL9P716PdzW8odS+Yy4IYQEL2DGRQIzsFE8XGgEkPrzJnIgcYrbOELmhMMTSPgW4BCN2V
	0hsJyO/NGW5EWiSmxLeugcqs6KiAC8rdE8VxktCGW46vITilpEr+iw6spsTRdNJYRB7FQ42mYz2ov
	nhqTFO61Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leaWU-003qUH-0t; Thu, 06 May 2021 09:42:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leaVg-003qLx-KZ
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 09:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2Fx6koaa90dYpE3ZRxt64nTsgkrkT9Jbk1TcCB5fNN0=; b=YXbpubwQNnXjyDmODksLfPDYeU
 VXqI9Yk8oDX2n+Ep98L7tGT/aAsT+whCAWiPMtZQNPdg5GBFGfgU6FxxNkvESbWPykRWCvRTwUxew
 D/vRcUa+TDNRO1n6cKx2j9D1pPyZGvkzuLjzYFau7TZzgbULhPun6unC7zvrxk8Ti67T+EdRWPIV4
 9ZpTZWHcyD8JGJWdogcUWwh8/zcHZXdyAtWq3TvU+7XKPSLqigsR+X+Mfvv8QtJ7P2zgym/3yeevc
 +ASnKtGgdyKCUD3M3tF5xGufTL12YL8KkSH/HmR7u/cHF7kht2Cbj0FGeLRGbZfaYBWn9tWtlnMSn
 XSWMTvRA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leaVe-005uzw-69
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 09:41:31 +0000
Received: by mail-wr1-x430.google.com with SMTP id d4so4871632wru.7
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Fx6koaa90dYpE3ZRxt64nTsgkrkT9Jbk1TcCB5fNN0=;
 b=wC3Ic9YCYaHpZrOqunPpyYOqVY53CB3utNaWddVKzbePn1psarS5wOSL9rDqiGA5PZ
 tLwVV2cgdSVbz1Q596AT0odEQdLgAGLBiFiLDApR7AJtpmkFBWzBCNsPpnxBNdvBGSPf
 evOvz+zv1cD+YqHRYbJc31pvemA99u2nCNualt2jG3fjN/fZtnAim/DbSoiRJMyPXYoO
 9afg+s5W5miOwxKAyXiQ5tS3HyRprBGvW+nBAAnMUIcQ4ZldLIHKK0OLMHHNc0zji+WA
 cYOSa8pVOjGrAeqE0Dzkc1Y5dRefprQyt9dhvCnMSkwSPUPUY/HjWdAUYDnP+pT3hP+p
 vsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Fx6koaa90dYpE3ZRxt64nTsgkrkT9Jbk1TcCB5fNN0=;
 b=m5ThZZTRH9nSne1GjN2YtalNZDIzlzFdLbqDjDQNYUV7mvIB/T1wMNIEyK99c2QrxA
 7POMxwpO6ixXeJhc9Q54yBqHs2mJENyB4CXB9iqsmT0WDRUt8AvYuYWVmusNMibxbjH3
 r/qfaxVGDJ/1n8K5wKg1lqU57EMa4TcYClye2FamM04/VK4sST1ZKBiDoFYbm6wHuojA
 c4iDIWYssOJ9tkWZA7ISfFta49J6sJxOURSC8FUPpDdTGosrT37Qw5CmPICxRl6jERa/
 8NWbS41W1ZAxADIZuIn9jUwbWkayArJbs7dOwbbN2OO9HnPbTBH8u58tHIjwZKI0H5yO
 feJw==
X-Gm-Message-State: AOAM530ScBC8q1jdRWD3YahUcZczpxDVErgR+aPLXc53RFy5POaaFuC0
 F0/FcbPak4oVpCNbgdNcKtfqrQ==
X-Google-Smtp-Source: ABdhPJwuueqdh6i+rN0lH8eSnaptLU3QU7FT191ZcG1FDtrzmHFTBRmmGWCFldj3ivZo5PFhl3nMzw==
X-Received: by 2002:a05:6000:1cc:: with SMTP id
 t12mr4007908wrx.156.1620294088524; 
 Thu, 06 May 2021 02:41:28 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:2492:c5b6:6c3f:6de4])
 by smtp.gmail.com with ESMTPSA id y14sm3360421wrs.64.2021.05.06.02.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 02:41:28 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH 3/3] mfd: mt6397: add PMIC keys for MT6358
Date: Thu,  6 May 2021 11:41:15 +0200
Message-Id: <20210506094116.638527-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210506094116.638527-1-mkorpershoek@baylibre.com>
References: <20210506094116.638527-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_024130_243872_9D7B9445 
X-CRM114-Status: GOOD (  10.67  )
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
index 5818e0c328c9..f882c76b4f88 100644
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
