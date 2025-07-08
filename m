Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891E5C83F0A
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJy/L3KF70Zdiqqmji/VZQ4AG3AZxAjhDs+q1gVtfqM=; b=kvd5CoDVQ18lDPIURAORy3fUXS
	foo4QlbsGiHIkHVawjLTvZukZLEzddz8J6IxJofVX5MutqNKkbYYkUbFrv/YawOMtccqK7BHOJvSg
	PL+Mc6+W09UM56VwbTvTTGjspYqDm4PIlQumJs/2N0Kx2gRtuboOTEc7fs6hmXqEFqe+7mn/eN1d+
	1JGhNX6N/QvE2HMq0KKnoxsuXLYYkbb8uStngmT/cadSiH+ighkKjkQPqCTcy98eHFvUchIfLaW4N
	BV6E7Q/K/AaXNl87rnEiSJHPmODfEvkc607kDmK6+LNzfSJiQYDIoEcrMQgKyMzyXonWD+SCv/1ws
	NbUXoGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCK9-000000069Dl-1CVU;
	Tue, 08 Jul 2025 17:41:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByG-0000000665b-4383
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:10 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so6337475a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Jul 2025 10:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995147; x=1752599947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJy/L3KF70Zdiqqmji/VZQ4AG3AZxAjhDs+q1gVtfqM=;
        b=1Fgzvxu3zziZkBK4JU4gvgKluSTd5BZWP9pVO2/tGJ3xR9CnF1HXr4YeLPPe9nBtAW
         C17KOla4bKL4JKcvjn5djbAD86HGFlMnhoQYVf3FPyoK0vkmq+A61e/ocOU+R9wDYz0g
         743W5sXQwQDaKkMLXJOX+VX3j2ZBngmNqS8V34sAwc9CnmqMFxWSQCYC1kYxUHmhNJEO
         hpOBa/zJ1hudELAdNCLQ4Eu1CMRHytjzHh4wUcixBVbY+bhOi7GRnGmRpMYYE6r3AIL3
         d54JyyuEl6eEBL3B4m9c8Q/jab0ZvtiMoykOmZwFTkdj6wWCS5zz9e3lRSDV894WH2nP
         22WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995147; x=1752599947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJy/L3KF70Zdiqqmji/VZQ4AG3AZxAjhDs+q1gVtfqM=;
        b=LcWw87eKeLK6j7crvPqK1RxbQ+gE3GhnKXON7cHZRVRMRgz54AtqbEthTL1+Ncv7D4
         Zw53bQnQFLezHxDe8xrKrQwyZDMS4HBX7VXbHAUVJvH8aoiFBJXBZVkAh8wnLH+Vizdk
         Mgt/MKNuson1y7TuNS1HeF46x5uhbs8loH1jVD+FQbk4bjIXVug8eCP9ktWvbszaf7gI
         imQNGJh4mIw7h2Y0GRcngT98yxzFocDM8FBTnkDUXFOtBWQx1pUOHrRPv09qEZSF57v0
         tIJPZZIro65tVENaSKSdWt2skGMl6giHr2P9u2ZrPQceHZpEw1kLyia/q9ao8Cv75RfN
         GkTg==
X-Forwarded-Encrypted: i=1; AJvYcCWa+syd2UYE2HdY9bjuWkBfP8aX6H5qOr9U86fFivhNNtczNR8HDvFG+J1Y76QaKwwBKHJiUYT8tAzypqjZ6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqqeOT6mtI8UAen0u4D3qcNrec2jCE+jOFs7zbFNLp7ToH3JMK
	e4K49SBiUfVD81/DAGECP3eEAOIrUz53TWV752KE2lYX6+B2wCWqThten50x6dw30vc=
X-Gm-Gg: ASbGncvYQagv9GYbUqAw+mIGhKqqqZIUFANmYv0xpsCW9dLpdBz98gasmGHRJnosq1O
	89TmVgs7y4ipnB6VE5aWAp/eMM/4Gn7hpsMYJ8+eLNyH9NO4cAyb0oGL/XRuwvjZJwPBVm8geBZ
	UeoXz08g/nP5mLgfQb5NOiWaNzo8gH64V5cdEA4BAmyxDMq/6ZQeBZWBgbR6qloHx3d69JcrrEq
	QVG6/u1U95UlGEO1eLM9NXlEAxdL5k3YVyhXuo97S+gU+d7/wVA5h3XsY5UbpGs4Dj9PQJ28yDY
	6BTGC38BmOOTSF28mnn//pyVnN2keSl0ai1b8AzmPdFMV7Ho3ewkc74sDYYL6ZfB/AW8C82hpSQ
	DbrbqV7kqSnIyaWEh6oke83l/8km0
X-Google-Smtp-Source: AGHT+IHroZ3E2ueYcv/ykrcydfGYdpV+n9RhqQG8ovV8RP98ja814/uxg/sHrKNwX279I/CMgKWuSQ==
X-Received: by 2002:a05:6402:270e:b0:601:d77f:47d9 with SMTP id 4fb4d7f45d1cf-60fd64e4342mr13991766a12.5.1751995147361;
        Tue, 08 Jul 2025 10:19:07 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60fca667676sm7535174a12.7.2025.07.08.10.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/8] pwm: mediatek: Rework parameters for clk helper function
Date: Tue,  8 Jul 2025 19:18:33 +0200
Message-ID: <bca271889c7ccc2ad21528ddcaeadd3ec8c64a7e.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2960; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=x/kV2pUi1Vzzcz7I1TfeXDKd8gGc8t2w3EP6DIPGv6U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVLwGKq2tDc2GXhlZ576n8L2IgZ0AoIKBUxhT LRdiZsNW7KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S8AAKCRCPgPtYfRL+ TjucCACta+Vji7mCKuCdVypWv9+EdHf31FpXE1Q7z0Lsn/2cRsPnamnnC/5YX7X/vHmYt5vmbiV U+irmzTAb/DmrKZPtcyUBDaNIBURYwbhFD+aroOi1gScrMZ9LZcGmPV0F4u9q/NLlCptqNIhGrD MFm44+cBdVEmghdxBUQ4jM/OgIl7/inks2r8ftOX98kJX8ozTbrqs/5ep0UzQyJYi8Qcg9lh1UV 0L4NJ9l7UZYZDvR64+g6+tq9s9hbMAZY8b5DGy2UfGPpa0kol4UXG4+VIvIIoBODtgxWZoD5KIS RwUDEPJA4ZmGZuO3WJwt2402rF2hwCh/NTT0hVgLPKSqiF4x
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101909_016341_E8621F7F 
X-CRM114-Status: GOOD (  12.72  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert pwm_mediatek_clk_enable() and pwm_mediatek_clk_disable() to take
lower level parameters. This enables these functions to be used in the next
commit when there is no valid pwm_chip and pwm_device yet.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 4e2a27b02c80..8cc61a835cd5 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -65,10 +65,9 @@ to_pwm_mediatek_chip(struct pwm_chip *chip)
 	return pwmchip_get_drvdata(chip);
 }
 
-static int pwm_mediatek_clk_enable(struct pwm_chip *chip,
-				   struct pwm_device *pwm)
+static int pwm_mediatek_clk_enable(struct pwm_mediatek_chip *pc,
+				   unsigned int hwpwm)
 {
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
 	int ret;
 
 	ret = clk_prepare_enable(pc->clk_top);
@@ -79,7 +78,7 @@ static int pwm_mediatek_clk_enable(struct pwm_chip *chip,
 	if (ret < 0)
 		goto disable_clk_top;
 
-	ret = clk_prepare_enable(pc->clk_pwms[pwm->hwpwm]);
+	ret = clk_prepare_enable(pc->clk_pwms[hwpwm]);
 	if (ret < 0)
 		goto disable_clk_main;
 
@@ -93,12 +92,10 @@ static int pwm_mediatek_clk_enable(struct pwm_chip *chip,
 	return ret;
 }
 
-static void pwm_mediatek_clk_disable(struct pwm_chip *chip,
-				     struct pwm_device *pwm)
+static void pwm_mediatek_clk_disable(struct pwm_mediatek_chip *pc,
+				     unsigned int hwpwm)
 {
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-
-	clk_disable_unprepare(pc->clk_pwms[pwm->hwpwm]);
+	clk_disable_unprepare(pc->clk_pwms[hwpwm]);
 	clk_disable_unprepare(pc->clk_main);
 	clk_disable_unprepare(pc->clk_top);
 }
@@ -121,7 +118,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	u64 resolution;
 	int ret;
 
-	ret = pwm_mediatek_clk_enable(chip, pwm);
+	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
 	if (ret < 0)
 		return ret;
 
@@ -168,7 +165,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
 
 out:
-	pwm_mediatek_clk_disable(chip, pwm);
+	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 
 	return ret;
 }
@@ -179,7 +176,7 @@ static int pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	u32 value;
 	int ret;
 
-	ret = pwm_mediatek_clk_enable(chip, pwm);
+	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
 	if (ret < 0)
 		return ret;
 
@@ -199,7 +196,7 @@ static void pwm_mediatek_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	value &= ~BIT(pwm->hwpwm);
 	writel(value, pc->regs);
 
-	pwm_mediatek_clk_disable(chip, pwm);
+	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 }
 
 static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-- 
2.49.0


