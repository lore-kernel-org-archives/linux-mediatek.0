Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99D1C43600
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:17:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34B526195C
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34B526195C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NU9TGCXa+nH4aXPknEheFX3wjqz16iTnGDu/ectWY5c=; b=G3FkP5olhf5Pw10E92wyvBZwI
	p07ROZcEDjkj1QaLggd39+1ckODBpsJmoRw2TNlWhT4Kkwqn5dtloINm9m6M+KZaYexuCNS2KnHqy
	KHeLw8BzeZhxb+ww4nCxH4WY6h0X+MbqwdS7CEUnE0Qjc6mQqseXmg8XwCERc/WYh96uuY1h7U93V
	8IUAi+6trRHE+ABnILrFbKjlu1hENYMVtDbqeaEkTqJRyXVdSrLs6cyLdFJJQwzK1+t5YyukWUWjc
	euU440/+WDjSiGgA+RB9HgDS6X2ap+77KYP3T0l0fRrBhKYwdWgwIijfSq8pWLRKBSYWaF/QH+g06
	alFWHILlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqbg-0039CC-8Z; Wed, 12 May 2021 15:17:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqbB-00395j-EB
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 15:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MfFeXs1ZnrbznR36F+Azd1TerVAYLHFbsoRX86sMJbQ=; b=CkkofOGI17JXJcdEEnNbNxBsfq
 P+iPksty4fofC/t0Ojqeat/Zt/BJQc4ZUZRxZPVcBTHpMbtLAPKHnR98g28pj8JXGHyivsD44a0GJ
 CNY9yevv1LBmc5NNmn900w/fshSGWg+NxyocSPF+dZ0PUlZxlT0AmjFiy6MhuWGsZXYpyDY5CVESw
 XsyjuS+qbfvUGNi5oY34ijMPQXoEgYukqZefH8ByWpo1b+qcEQIdl6yTgT+qMLfMCiaxugGyfI/nB
 UzS93bXuLn5i09kvVRw+rZ/UBG3gfLJ0dmh2szhJqJ2ApQ0UtLM2Ahx6NJVyeO3bt2OUub4vNyB29
 03n72dtg==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqb7-00AVAd-UH
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 15:16:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id x8so1720654wrq.9
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MfFeXs1ZnrbznR36F+Azd1TerVAYLHFbsoRX86sMJbQ=;
 b=JmGEKDtyLCxs8ih8SFYJQC1LLuoqLBv9WC0ywiw/HDuirOvpxjFwjKYt7c0GqBTZbU
 iyE/4ZGYd8U/Yrgo0HBMFgseBw4fOH2TWSkvIFmLP651zntea/3oHDKEDPTyi/XjbG22
 TiH9bZloPBt9frGjpE+MafNYSpeRLttE+nvlrcSq9If0NUnfcYMEWCrrV7I3EAM1vCzC
 wEcbCk1/xI9ziBJc89O78fk590MtnV4MVkhqelAQSwKAVEiNxdzkKmTCNIxqFh/9I7+b
 C+nc0tcqniTfHdRgUt1dOFg2nnyQd0dr149uv+INh/WBdPkWgzlQX5bhdXn5wQJ7HnQc
 WMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MfFeXs1ZnrbznR36F+Azd1TerVAYLHFbsoRX86sMJbQ=;
 b=sDd5M/j33LxDmw+fGpkBQZmm9MXdfFZRBqvJlm+9jYO7v1xSSV+94AND0DI5tq8swc
 61D2729EAmGIR6v6StcIiRPHyJHs3xczkUiUuF5Xva1kCPnV8kipbokCRN5YrHP1D804
 hE8teOKmVWmP0REfp/GS/zUnBeVimZJv7Z7tckryaDyGlbW9SftSYM5MJOZ7fs9zPCKF
 cGWOu3jMeYtfUEXuLR1de6ci0qG+TZrHeqoN0ATEhz+UOwr0MFLslfzd8we/UY14vEJB
 Gyo/9CUvFWkH0PXnCGaDpBE0WyBWEcB7gitTbqBWlpVqQCF4fITQry0s7SO9Tx2CmT59
 F52Q==
X-Gm-Message-State: AOAM532sD6bBPVI5WCeEDQBXwW/PI7VOeqf4bP6mqc+qkRJZX6avoT5V
 UdLPSdnCI96M5s4mI/8FD08hKw==
X-Google-Smtp-Source: ABdhPJy3ftP3rXXtEFvXj3wuD7w2m7S7OnMv+h0sS0P0toXNlX2FpVMw8NkgEyR8e0ycTyT3ed1U9g==
X-Received: by 2002:adf:fa46:: with SMTP id y6mr2986989wrr.83.1620832588280;
 Wed, 12 May 2021 08:16:28 -0700 (PDT)
Received: from mkorpershoek-XPS-13-9370.home
 (lfbn-tou-1-1465-169.w90-89.abo.wanadoo.fr. [90.89.34.169])
 by smtp.gmail.com with ESMTPSA id c15sm30095011wrr.3.2021.05.12.08.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 08:16:27 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 2/3] mfd: mt6397: keys: use named IRQs instead of index
Date: Wed, 12 May 2021 17:16:13 +0200
Message-Id: <20210512151614.36996-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512151614.36996-1-mkorpershoek@baylibre.com>
References: <20210512151614.36996-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_081629_993172_B3159D97 
X-CRM114-Status: GOOD (  11.20  )
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

Some pmics of the mt6397 family (such as MT6358), have two IRQs per
physical key: one for press event, another for release event.

The mtk-pmic-keys driver assumes that each key only has one
IRQ. The key index and the RES_IRQ resource index have a 1/1 mapping.

This won't work for MT6358, as we have multiple resources (2) for one key.

To prepare mtk-pmic-keys to support MT6358, retrieve IRQs by name
instead of by index.

Note: The keys_resources are not part of the device-tree bindings so
this won't break any DT schemas.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/mfd/mt6397-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 7518d74c3b4c..8738b5524783 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -46,13 +46,13 @@ static const struct resource mt6397_rtc_resources[] = {
 };
 
 static const struct resource mt6323_keys_resources[] = {
-	DEFINE_RES_IRQ(MT6323_IRQ_STATUS_PWRKEY),
-	DEFINE_RES_IRQ(MT6323_IRQ_STATUS_FCHRKEY),
+	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_FCHRKEY, "homekey"),
 };
 
 static const struct resource mt6397_keys_resources[] = {
-	DEFINE_RES_IRQ(MT6397_IRQ_PWRKEY),
-	DEFINE_RES_IRQ(MT6397_IRQ_HOMEKEY),
+	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_HOMEKEY, "homekey"),
 };
 
 static const struct resource mt6323_pwrc_resources[] = {
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
