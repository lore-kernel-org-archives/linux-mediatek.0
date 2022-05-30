Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAC6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQRkwQqT7JNKkiK14HABYQ3U/r7YxWPlGrwOv+sBzDo=; b=IUnwNzsKE2o4uQ
	OZQ6+6LrzRGUQOvWgXhqSxNbjwktJ8WEsR8CgvUl8ZkLcazpKEjKtdTXPUC/tS7qV/A//dTDD4TvW
	fZdht6tfjx5OyHEepWVWuBFVs6NnBu+l1rBzs6H3wQ5o1ca0ZQs1tQJviGE1+KraKxC444XjuOPM9
	KrjjINMEddccpt0tHfSLKViApuIGE+tiP5doiqm3EmV4dJ30OHxrIqFoB1l4iecjV4BVlymAFt+H5
	MV5e+56/XLcZ3htLFO0RzNLiATy8a+XVcQ7wyNoM2+jvZ90BjKeCVAiPPNUSeShPStebvmnp7tEx/
	3hH4teLVVi5Y8HKubvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmM0-008HCd-BP; Mon, 30 May 2022 20:51:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmLe-008H4x-Hp
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:50:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id h5so8015123wrb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WRLXEWGUFXz1TBqCoD7auTBGRZvFHTpsQ7F1lieIRog=;
        b=PPZJ904G27hm3et8x7iWcXR+2/DOL4KKyJom79Uix9p/t9dOJ4Re3i8HZCL6awOhXC
         K2em4pXNPg1gqWJXfNVZHXxkyzc/xyeV5juF4Q3jHi6KMvJPhVkDFiHPPbuxUH1hwyW9
         R8OjDsxQY5UD8m5nQ0Naqlsjn15Sh+M0NZC2G2meVIo8k2WZmKA47nyjMK6vmd1KXqsG
         GLxa6GjNNCQNTz3K9bJmiEWt/20rVMKi+HoO9I2i4cr+twzpGxaI4CLnMmwBF7kchVpO
         qCYpPWCGQ7/neIl3xLAU3nh8SDkg3syGg3ERQVvJpcWXsWxrav9Kv73q92zEN3DuIPqQ
         Ee1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WRLXEWGUFXz1TBqCoD7auTBGRZvFHTpsQ7F1lieIRog=;
        b=rLk1lp8fyzTQ2bFoAWYNjBpuisdLf0aAhDEoUzQ8edHTntYfvnHb/x8rWS/W/WL/ZD
         RblLUucs+/KwQLwaC8xPi9GpsUwx5k1HqgVOhDiHVNJqnlhhQqKLwHSOSpUjH72Dilpb
         nByf4KT8j7vqup4EiiARCNU8m3lQ77SwUluazrtuApJwoY7JBQ7jHo9Jaek5Rc2ZmUPt
         lNAARRpG1RNkpsbKAdDg4czoklQXGLvByeuERGCvZBILp1tW9eR57zPOACVMMPE3hEAO
         0vqCOJNLLmN9Aqsn3dCRK80s3Si/nPXejyQvdP8UilNpimjjpnHDOwsEf27EeDS7cHVw
         cUyQ==
X-Gm-Message-State: AOAM532Fyk78zPlI5UBW0EDkt60xTfnDrQVCCCOtdlHJxprof6uALrZi
	k1TRRSdDRRvk58Avab0T5R2gZg==
X-Google-Smtp-Source: ABdhPJzTyqcEeVJTkuWOm1/qdu1c4GOnlwcH/o8Q8LSshlKxF8kh7vxZ6/omdda+4o/u0HAsAvegHQ==
X-Received: by 2002:adf:e691:0:b0:210:2d6a:8a82 with SMTP id r17-20020adfe691000000b002102d6a8a82mr8428567wrm.14.1653943844480;
        Mon, 30 May 2022 13:50:44 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c19c700b003942a244f2bsm384976wmq.4.2022.05.30.13.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:50:43 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] pwm: mediatek: add MT8365 support
Date: Mon, 30 May 2022 22:50:38 +0200
Message-Id: <20220530205038.917431-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530205038.917431-1-fparent@baylibre.com>
References: <20220530205038.917431-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_135046_691068_7D4FF3A2 
X-CRM114-Status: GOOD (  11.09  )
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

Add support for PWM on MT8365

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: no changes

 drivers/pwm/pwm-mediatek.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 568b13a48717..fd586bc51c5f 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -294,6 +294,12 @@ static const struct pwm_mediatek_of_data mt8183_pwm_data = {
 	.has_ck_26m_sel = true,
 };
 
+static const struct pwm_mediatek_of_data mt8365_pwm_data = {
+	.num_pwms = 3,
+	.pwm45_fixup = false,
+	.has_ck_26m_sel = true,
+};
+
 static const struct pwm_mediatek_of_data mt8516_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = false,
@@ -307,6 +313,7 @@ static const struct of_device_id pwm_mediatek_of_match[] = {
 	{ .compatible = "mediatek,mt7628-pwm", .data = &mt7628_pwm_data },
 	{ .compatible = "mediatek,mt7629-pwm", .data = &mt7629_pwm_data },
 	{ .compatible = "mediatek,mt8183-pwm", .data = &mt8183_pwm_data },
+	{ .compatible = "mediatek,mt8365-pwm", .data = &mt8365_pwm_data },
 	{ .compatible = "mediatek,mt8516-pwm", .data = &mt8516_pwm_data },
 	{ },
 };
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
