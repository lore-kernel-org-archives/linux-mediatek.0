Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E07C83F09
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l00T4JU8N3V0V/Zns06bf0Sn4mSnEv1+Ohzm+7LxqsE=; b=Kwbr9R4rP6+Zv33Nox7MtoPydl
	zOmbXmOan2Wex4f7DrZONyUturZEfTQmJkKqyEh/96an8RqwUtSwrDS7QifZo42f/SsFe7YZV6f3M
	vjvidHtIgAPXXLgRAkJeEIfXhQiTPkKzT8bnH75klP0leOF+q18EYSBkf2Jd3qEKo5LHn4f5pkvro
	5kaCdUuoUICrF27jQTPTMRifE90pKN9fHiOmiXDW27OSKvnrKW9gC5Wsg0USRXNxbeQsQbj/o4Wuu
	m3qle3kV28//Ffk/pqzB4q+xb7NlOxNhLNEAs9HvedrqVPHBT9WgAGoRgT8r1BGdXaTEApVN5mHDD
	OC9v4ePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCOp-000000069fM-03mo;
	Tue, 08 Jul 2025 17:46:35 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByL-0000000667s-150h
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:14 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso7733323a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Jul 2025 10:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995152; x=1752599952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l00T4JU8N3V0V/Zns06bf0Sn4mSnEv1+Ohzm+7LxqsE=;
        b=JzDrPPHv9NdGtDiSbOZ3DWJol+Gr0WqiIwP7zrq/8e9XMDslNO+HHDXetGWjQnZyrA
         LpB3MHY0aA6Q6D7j/msj8bpmqTLKd1B28hYnj4caRWTNJRlNIk7nHhL6EvIVCeP8fBdZ
         M6Mc1549XcChkpA/18zaw6lK4/RH+rO3GCxOE4AUHgJ4I1X7md3+11LkBoCdv6JECCKR
         bf5bqRYdO6rLTUqDqsbfArimMCW/fouowvtwDC1aBgnQTmO7m9xjQDt/1qcvV4+hQnp6
         OuxN6MHQeOY9AbQ9lOi3VPPwW0WW8NhszcWQsdMefbefKkJ0Vm39Szs1n/juOZQekjra
         qveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995152; x=1752599952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l00T4JU8N3V0V/Zns06bf0Sn4mSnEv1+Ohzm+7LxqsE=;
        b=EUE7nUWXuJD/IxmPa+UunPEjtJb13kkKiFgpz5Ijtwq+judXv3St26Ur37ggnX+v89
         lvM1EMaCWHHCFHSpuNZCWGnG77n3fMZepcQieKwpKYmmlnbAqLZVSPOlhA05kVRe3jSl
         Gu4CvMknDNNMPx/mkumaW9wVXLcYPWr8rvhR3TYa5mlTlnDcmuWP2hSiNCwYqYP10zmE
         LQDhBEQmYos+oOBgskwP9w6WHTIok+yTgUhzRaK+mgfPp6SM/DnuZNKbnrtS04qaWDig
         LG4VJFY95Kta94Ocr7QW1uixbsIMmWTxvj7CbB2DF/By8d4qJ7kZ+NAoxgQKRH3oWaPm
         Kfxg==
X-Forwarded-Encrypted: i=1; AJvYcCWgggpzI8a3ntRw2aM0CKANoWuRD8kVheq9lqSgxGqrQ+5KNYvu2JdBK7jglDN2XRYB3ZOO+mVFqrdJG9cNjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHVtK9J7HCr2syXOPCeCh70lrnGSB8Vs6xmxBA5uDVp7fuB17f
	W5Dx8VXRAmL2/jzSmZ4nQ4UHI1ZGJ3qfYf3yPY7Lw7860F0Abl7TcCRTbHUHJmGIKB8=
X-Gm-Gg: ASbGncsAVn+p37lShbY4srsUfhEbVqaQ8TdCdxRBIl6FXAdlbQwq+OuhquDnXqB03Tf
	DMpsz5ZrbgCWlj3tVR6LrtU9PDZYbO5tUMpFFlpfniI6/4598KSBoQqNW8ilp8Jnm3lTEvw6UC3
	ObQQfKUz23UASKjL0khP3V1CJOrNE9jotBmk4fN+p3c8g0WPzeVaObg4TkPmB/fuFni5s2cP97G
	sqeNz5D5zq3ihoBgr9SN5mapCD/nJi5Zt5JJYqR82tXrOjv4/kQxI/Qgyznr2+qCprMGQbP3JhE
	jnb7Pa/YbSjcZ9/m+BLBGsHVyBLebFO80tlEUPLJeb8Oo79JRX/rcXsk2rxwTdKixczA1SMyC2o
	sQD9DkzsVUazGUHmOmWSHFFhpoZq8
X-Google-Smtp-Source: AGHT+IFybbXITkV6I2i/0lElcb/f3RstZZsqcNMEjWoEBbgfS02aF9Kgwsi8Vybn4c+ONYLHYNK5pA==
X-Received: by 2002:a17:907:970c:b0:ae3:b85f:6eef with SMTP id a640c23a62f3a-ae3fbe06a1amr1755353266b.42.1751995151535;
        Tue, 08 Jul 2025 10:19:11 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f692fbddsm933193866b.62.2025.07.08.10.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 6/8] pwm: mediatek: Fix various issues in the .apply() callback
Date: Tue,  8 Jul 2025 19:18:36 +0200
Message-ID: <b57a7fa7a034c7827d5e4925912dade85904fa2a.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4214; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=W6WdSbzvS48ftjBDwU3bYtfZRujpdgm2n2YZsdJArLE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVL4gTmW0jf3X2vVmhtDK1k/hOnHy5nUMNgCM EDxk8pzCuCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S+AAKCRCPgPtYfRL+ TloYCAC3doLO+7ul/buXbOS555EpffMkdfiF2+Q3mEnTIid7W1nt0SGj+mSrXtJRhFlrZeyFGWk m6US9pG+DA3aNVnvvmpfYxBUoRdNIPNhTqmh7dI/6m4ObR60UWWOhsLxDokZR3c1zUs/9JQOiu8 5DwnAeElXYHl19/ut9Mru+A2Wd18/pTYLyqwLaVD05X/cB5tHJm/Q/5YDMatIm2K3LMPqtyHMRD uUSq2B9tRldKC9H2zh8NfkkdT88iZZkI0uDZR+N5+/n6oeM9M0/pmd7lUsMS5BUsesRzEFPssQr aYYgmlrJW1wUE3HJiQJFK7gCvYl2hAMajwbKtic14AbIgsFC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101913_289497_8D911BEC 
X-CRM114-Status: GOOD (  19.46  )
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

duty_cycle and period were silently cast from u64 to int losing
relevant bits. Dividing by the result of a division (resolution) looses
precision. clkdiv was determined using a loop while it can be done
without one. Also too low period values were not catched.

Improve all these issues. Handling period and duty_cycle being u64 now
requires a bit more care to prevent overflows, so mul_u64_u64_div_u64()
is used.

The changes implemented in this change also align the chosen hardware
settings to match the usual PWM rules (i.e. round down instead round
nearest) and so .apply() also matches .get_state() silencing several
warnings with PWM_DEBUG=y. While this probably doesn't result in
problems, this aspect makes this change---though it might be considered
a fix---unsuitable for backporting.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 48 ++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 76b293f2b6c4..d7801e6df6ba 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -117,13 +117,13 @@ static inline u32 pwm_mediatek_readl(struct pwm_mediatek_chip *chip,
 }
 
 static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			       int duty_ns, int period_ns)
+			       u64 duty_ns, u64 period_ns)
 {
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 clkdiv = 0, cnt_period, cnt_duty, reg_width = PWMDWIDTH,
-	    reg_thres = PWMTHRES;
+	u32 clkdiv;
+	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
+	u64 cnt_period, cnt_duty;
 	unsigned long clk_rate;
-	u64 resolution;
 	int ret;
 
 	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
@@ -131,7 +131,11 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		return ret;
 
 	clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
-	if (!clk_rate) {
+	/*
+	 * With the clk running with not more than 1 GHz the calculations below
+	 * won't overflow
+	 */
+	if (!clk_rate || clk_rate > 1000000000) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -140,23 +144,28 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (pc->soc->pwm_ck_26m_sel_reg)
 		writel(0, pc->regs + pc->soc->pwm_ck_26m_sel_reg);
 
-	/* Using resolution in picosecond gets accuracy higher */
-	resolution = (u64)NSEC_PER_SEC * 1000;
-	do_div(resolution, clk_rate);
+	cnt_period = mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC);
+	if (cnt_period == 0)
+		return -ERANGE;
 
-	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
-	while (cnt_period > FIELD_MAX(PWMDWIDTH_PERIOD)) {
-		resolution *= 2;
-		clkdiv++;
-		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
-						   resolution);
+	if (cnt_period > FIELD_MAX(PWMDWIDTH_PERIOD)) {
+		if (cnt_period >= (FIELD_MAX(PWMDWIDTH_PERIOD) << FIELD_MAX(PWMCON_CLKDIV))) {
+			clkdiv = FIELD_MAX(PWMCON_CLKDIV);
+			cnt_period = FIELD_MAX(PWMDWIDTH_PERIOD);
+		} else {
+			clkdiv = ilog2(cnt_period) - ilog2(FIELD_MAX(PWMDWIDTH_PERIOD));
+			cnt_period >>= clkdiv;
+		}
+	} else {
+		clkdiv = 0;
 	}
 
-	if (clkdiv > FIELD_MAX(PWMCON_CLKDIV)) {
-		dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
-		ret = -EINVAL;
-		goto out;
-	}
+	cnt_duty = mul_u64_u64_div_u64(duty_ns, clk_rate, NSEC_PER_SEC) >> clkdiv;
+	if (cnt_duty > cnt_period)
+		cnt_duty = cnt_period;
+
+	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld @%lu -> CLKDIV: %x, PERIOD: %llx, DUTY: %llx\n",
+		pwm->hwpwm, duty_ns, period_ns, clk_rate, clkdiv, cnt_period, cnt_duty);
 
 	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
 		/*
@@ -167,7 +176,6 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		reg_thres = PWM45THRES_FIXUP;
 	}
 
-	cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
 	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
-- 
2.49.0


