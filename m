Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE46C83F17
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jul 2025 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEkkBMb35T0v1dnQ8fcl1xdudts5aOTCZdXsRa2DHbs=; b=xlhqgLNV62pqZQyd6KWlhXdEtc
	COgonHjks5ED7i4DsqE33UVWkCI3ulm7Rq9+f5AFepX0PtKYYhFs92yDoGu0sSKKxqs7MjT8dffKB
	53lJYSXEYg+/Ni/8ImA5wG1zDc/SU2RAU7OBcklSf3KjKqJUvBHWQd+smYufwAvtt0E9lXThI0KcK
	+HX6EDt79/G2uv5w/SzYI8BielWGAiCiRgQ7Xk0kTPR4wEDWDrpdCYJfw6JbxdMYIJW5wuSjJVcjJ
	ezUASIi0Mfuyqf+fLOZ1a4Mzp4MIp6ckHpFkvOc4f3J+/u4mYbCkIm4loR2i2ktbeuCatcwiuwcST
	pp2xI7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRO1-0000000F4eh-2Dsz;
	Mon, 28 Jul 2025 17:11:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQHC-0000000EuaH-3Khv
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Jul 2025 16:00:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so962840966b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Jul 2025 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753718433; x=1754323233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEkkBMb35T0v1dnQ8fcl1xdudts5aOTCZdXsRa2DHbs=;
        b=YDl7S2gtCZr2GgTLFTEWjpmgO7TCs+FUgQwRiW2eUSs2SnO66NthG0xqilvOqcIMIO
         OIEcIJFwZzGoRHV4WG6io80vi1Pd26Tvd1p9RWaSlXKMt2vcqHyjwR1W/FeWju7uHJr8
         BThCl5Vj5B8OyJEyg7dbkDc3mESlK43pZw+E+f/uSUMd5FNIDmUoJvtzTKh6Ty4fJE3A
         LqRYPMl5M7gw4NbhRRu3giVZdq/40sUZs2IWJOPy4pV+r/O4KewBvif81/6/ZNAkRjUJ
         Qrg/l+Pi079javm1vAm0UuTMBhTCAzVy/y+LiFpH4ys5/TYRlomjE1hS9Q4gQljRV/Fa
         fn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718433; x=1754323233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEkkBMb35T0v1dnQ8fcl1xdudts5aOTCZdXsRa2DHbs=;
        b=wvpjtTwI2AJ0v2+ujwZGFy4pI05gjR95GZx06BeE+JDpyARhm32F9EsaA7v06sAg85
         DA5GZ4h81t/oqzcAymvpPyqJr4UXRE1I10XbhCTmrKPH3yfves0yDJbvOlaV/mWwk9hF
         FxBd+25OvXH7U+a4ECKDJbVtQvyyWxj4ECAmtM1c06BdV1tQDtrhDxohxWSYIaB2Y/8D
         5yc0qb3Ew/b2HVMcRek5h+ssB+e8J4BgEKh01hj8b7XltGnEVYjyCIMbwJJiUYFwy2ZD
         AFpsi2FfrK0WEmv4ExrDvjbbsOgDfNnv6J+Yj3WM++fUXiEAmUDgA0iwF8e/E3YVGQvg
         tuYA==
X-Forwarded-Encrypted: i=1; AJvYcCVPdb6YkDMs7FfsCRYvLz6pGj5IRS8eXHxbP1lCSIxqlUVgNHFE4vIIDXYSFJah1noD0BZjMJUhCgkFuPjVYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6m7u0eJfAO1EIquC+tfFMsHDsKpaLHxZ3o4MOqh+DMKQtXvDn
	dKfcWW97msjrNTNhZZgJrMLuA6XqgOpWAzHsqS8VDkoF0obvwL0DQU/Kcf6wsC86AjY=
X-Gm-Gg: ASbGncttbiRZ76osDe1lI/9MYnXachuPcrOZv+73Hc4u2EkpATriV8gU/RhIESDSSLA
	nVLqr/qYrumkEMSFrIbVOFaZQFlwaYQFtxuEtvnuZmGm+jMg7pQCy57UUvl/qVMKmaj10KWf+4r
	a1524xX8wvpZfkIh2WfqP/EqvLzG7mixsQnmowVyY/EONzM/BsG9Dw6Ou4FMNw7zjumpocPOYP3
	t6dcB6GHHT1wROoJjPjhsnZ9mlpv5pzMBbENRCHODAC/zv6g2A3MLXLpwiVeW2IWzzfRaVo5cdo
	Hu/Mx7FBlhlM+Vy5uFoOe/bi9yduHn2FS/XuYN53QzLGOhG4DMmpr2g2pvchVcTlisG0jT2Ktyi
	a4DmsXQQLcl0B2kwA9rP+ZBYv5pO0siVgQrl9rUkj8DakdZfz6BYq1jSX32zJkb99deo575Toc/
	E=
X-Google-Smtp-Source: AGHT+IGjaAaodAuMnxX/es03owJK/l/UBs6JxVTwTZFVer5/mcNukBpbQFEgvLPCs5Jmb9MaExk57w==
X-Received: by 2002:a17:906:9fd2:b0:ae0:cf01:a9ad with SMTP id a640c23a62f3a-af61e533cecmr1307265166b.40.1753718433142;
        Mon, 28 Jul 2025 09:00:33 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af635af9555sm430343766b.133.2025.07.28.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 09:00:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/2] pwm: mediatek: Fix duty and period setting
Date: Mon, 28 Jul 2025 18:00:18 +0200
Message-ID: <6d1fa87a76f8020bfe3171529b8e19baffceab10.1753717973.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
References: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=r70JoWPBMkSGg8Q7MTFwRHQvEblM9zt7/MoS5rUeNI0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoh56X9/dgc+Yosa6Tl4O9n7Tg+UrDenhDziD6r +ETX6Z6qEeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIeelwAKCRCPgPtYfRL+ ThqWB/0eM5OcaIMptlstLjjW23eDAAgVQ34z+Uk94Qqqs6ur0aQDlkd7C8D0G4xqX4GpiTGvIZA pjociRDE8NF9wIqVlQRViI6OuIqWdj9hkbXoJIEirhAJ1GshDOnBuMnJ4XOJpVKnA0EHWkefV3V TFPsa0XBR4FPukmctm7mNvqwG+uhpCjGO2qonmjbjiyh5sr1/3y5cE4gODHfNX7gECeGq45s3G/ 9uQa9A1CO+CL50BuE8wmZJ4E3KCmZKketFUGwRAkLopDfqUZnN5zzBsE3xU6ZhVN1fr/HYjXG/i sCpRmbFQ9zmYIgeMGbkpH5ZJExiKiGibWgVdsJAltccRH3+l
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_090034_834075_9B40CA66 
X-CRM114-Status: GOOD (  14.05  )
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

The period generated by the hardware is

	(PWMDWIDTH + 1) << CLKDIV) / freq

according to my tests with a signal analyser and also the documentation.

The current algorithm doesn't consider the `+ 1` part and so configures
slightly too high periods. The same issue exists for the duty cycle
setting. So subtract 1 from both the register values for period and
duty cycle. If period is 0, bail out, if duty_cycle is 0, just disable
the PWM which results in a constant low output.

Fixes: caf065f8fd58 ("pwm: Add MediaTek PWM support")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index b6560e52c803..e4b595fc5a5e 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -170,7 +170,10 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	do_div(resolution, clk_rate);
 
 	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
-	while (cnt_period > 8191) {
+	if (!cnt_period)
+		return -EINVAL;
+
+	while (cnt_period > 8192) {
 		resolution *= 2;
 		clkdiv++;
 		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
@@ -193,9 +196,16 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
+
 	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
+	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period - 1);
+
+	if (cnt_duty) {
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty - 1);
+		pwm_mediatek_enable(chip, pwm);
+	} else {
+		pwm_mediatek_disable(chip, pwm);
+	}
 
 out:
 	pwm_mediatek_clk_disable(chip, pwm);
@@ -224,11 +234,8 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (err)
 		return err;
 
-	if (!pwm->state.enabled) {
+	if (!pwm->state.enabled)
 		err = pwm_mediatek_clk_enable(chip, pwm);
-		if (!err)
-			pwm_mediatek_enable(chip, pwm);
-	}
 
 	return err;
 }
-- 
2.50.0


