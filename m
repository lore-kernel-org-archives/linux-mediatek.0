Return-Path: <SRS0=1jDH=DY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FCBC433E7
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2020 15:39:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465C52074A
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2020 15:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTczYaBE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eetgpeWy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 465C52074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JKAP1xDMzD+Da2xf/WjpNtNjaUju2GdVxZGYgnGfyfc=; b=dTczYaBEai+MaaxE5IqKwm1ie
	e2q9cFLBDIWM0vM0TQrk2IPzbiKK+it+huCTrGVAldPVtgMYyg3hR44Bn0ps/SFyhJCjBsJz9d4zB
	Qa53lfjhKbmTq1jBhZ0NaDrzEqscxt/9qp5f9GirkMCgUFrQtGG1UZtm57hGnYaCFBB7uQdLE0wxl
	2VIQWHtQ54QXqj3B9ygDEuZIR4ZwoM/colP7Z561VmZwP4HG3weOBFW1hZ6j95DMMDLlpj4QchqSv
	UEQr5NrpQaM0uW2LfmixGDt5eTAd7S3dp/5UGwZQPwhj8gSLv5vtVSO9AEI/q9M/J+T0xTfzfPIxN
	sm5vbRdVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kToIZ-0003Ko-2p; Sat, 17 Oct 2020 15:39:11 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kToIS-0003JB-CE
 for linux-mediatek@lists.infradead.org; Sat, 17 Oct 2020 15:39:06 +0000
Received: by mail-wr1-x441.google.com with SMTP id h7so6763677wre.4
 for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2020 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O8b3a8tEsPdmZGsHhmbkp77mMXjgy1OCPeTQ0OgsXhc=;
 b=eetgpeWy2duISOUDuLyFZjrkyYQTTQ4O/2P+CjAqB5m11MBRtpoRaAYVv15D9JlmyM
 a1Icr54M4EieBbiqaq0OIvB4Xk0nZC0ipg9IUPpxTKe+6mEY2xYS0zPWVSUYAEsjt6pf
 1ArkVnfn0TV4zhdy1QuKC2MHufrU83Gk/bqq+qQUs/eI5ZLQ5uTvP9GGBXuYy9nOahfu
 2ILaJWM6Z5l+lFIPMj4xpu46GomC3haPVwC72czZxJ4JvqcKXKYh47f/YHlcCLskXtCr
 AWbmMf5xk4jQweA7ccmj9VhgdxDJxcK1p/v0wdzZFwNLuCr321dvztWFBxc+5etmC4ti
 BYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O8b3a8tEsPdmZGsHhmbkp77mMXjgy1OCPeTQ0OgsXhc=;
 b=CnzZigRy8B+DnR5EWk+xDqcO7hNp2QgIcdRyLlLNb/9CECApdUKTiCUoKEVeiHi/wT
 3/9Dw07v+v1ahYcpDxKkR092s+vHVd3Z2LfikFLnMZjkaP2KwEf5lIu4l2hPA8vadaxR
 8LfxAOCTU8AhhvCF4Tz9GT+vyiALzYrGKm1STeu8I2m9oAUlTFqN78PTzLlwUnrDsw9f
 6BGZlqO2LDov/ySL6SowITHsSOtC1zMb4J2W7izLa2fNogQo2OU2+8b7jn91wANj3JEh
 HIS0stirZnMkdOPq+EfMSfxZGH8IwNifMb5RBh7sAP+1Pc/TVhJoNdkw9wuxSJu0ajdD
 huxQ==
X-Gm-Message-State: AOAM533IhMB764v2CfqLdV9u1Df8RGBFmUs3qcJUZ3qWWwKZdoNx+ZAV
 saQtWPXE0AQzWF5CsNhVkMLUCHkDHfoCPg==
X-Google-Smtp-Source: ABdhPJzFnhShrjHXlRQr6YUYUiE55WTFRHSvzdlJc5N5ji8mSvo00iysRozA20esxUivjnKunTuapw==
X-Received: by 2002:a05:6000:118c:: with SMTP id
 g12mr10942738wrx.246.1602949143310; 
 Sat, 17 Oct 2020 08:39:03 -0700 (PDT)
Received: from localhost.localdomain (159.171.185.81.rev.sfr.net.
 [81.185.171.159])
 by smtp.gmail.com with ESMTPSA id n66sm7654953wmb.35.2020.10.17.08.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2020 08:39:02 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clocksource: mediatek: add clk13m and bus clock support
Date: Sat, 17 Oct 2020 17:38:57 +0200
Message-Id: <20201017153857.2494845-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017153857.2494845-1-fparent@baylibre.com>
References: <20201017153857.2494845-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_113904_446186_88C7AEF8 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 tglx@linutronix.de, robh+dt@kernel.org, daniel.lezcano@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some MediaTek SoC like MT8516 need to enable additional clocks
for the GPT timer. Enable them if present.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/clocksource/timer-mediatek.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 9318edcd8963..42e2d2090484 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
+#include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
@@ -278,8 +279,19 @@ static int __init mtk_syst_init(struct device_node *node)
 
 static int __init mtk_gpt_init(struct device_node *node)
 {
+	struct clk *clk_13m, *clk_bus;
 	int ret;
 
+	/* Optional clock*/
+	clk_13m = of_clk_get_by_name(node, "clk13m");
+	if (!IS_ERR(clk_13m))
+		clk_prepare_enable(clk_13m);
+
+	/* Optional clock*/
+	clk_bus = of_clk_get_by_name(node, "bus");
+	if (!IS_ERR(clk_bus))
+		clk_prepare_enable(clk_bus);
+
 	to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
 	to.clkevt.set_state_periodic = mtk_gpt_clkevt_set_periodic;
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
