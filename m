Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E68AC87FCE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 16:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Imtw8Gx4ry64i1JxbY02DQ6xhqBG4Z3YKMzGCpocp7k=; b=E4BHjB7KwJ0rPlWulkRRkxRxT7
	YAv1cwLac6xmVFjWKaDZ22YsxJJHj/XjUxShqxqziba9Psuew3xuYWaPdZqq3dmz7YtvgneVD5RjW
	Spb1kotg+YKRY2F6GRvGqnkMaPn0NETsY+T/h4l2CK+cH/Yri82zuaqZHR5Dmj0eMgC/TsQeIrGeB
	+YFgU5ADlNm5fyyhxSvGKpcMQg26jrregE4PkOltVT51A4WoZri4cPwvfpXJmmivvQBcdQwZ/V/fm
	HY4FUSIvmjQWitbXZsALVxmb3brcUzbnbQTdieZV5kq/HAxSIG9kU4Bw6zSU8TG7wV8LAr8MsqHHr
	M0MePiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKu2-0000000AAmu-1qCP;
	Fri, 25 Jul 2025 16:04:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcI-0000000A8YC-0J72
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so10714035e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 08:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458348; x=1754063148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Imtw8Gx4ry64i1JxbY02DQ6xhqBG4Z3YKMzGCpocp7k=;
        b=kMCGSy8g+CL2tHC6gz0kWeCqazNi3cXKZ06pWPf1ZY4uvEIenfHrNZTLX94lz57Lm/
         GvfZrsvi/62kpk6GGebktVPwjwdj9goMWGIwTHpnEZYWyp51oDjPrJL9WPqAhifOLZTl
         crgPHTVfbHsbi7RkNFxMahJlu+P9r2kaQNwv5N54VXeELyWsojK6tVcF8yf9AXKju2AJ
         fO/e6Ktvx09ZFNEKTG6Jw6mdcu9+dD+N7uFm3+8lkluh2vGCRWhQL/J3GIZZ06PSFV/K
         8X5WbPQH4pQTucDdpaejozqz7Sa2hR9XslKZJiAO5iLfTfTX+pxQI/5fo4mxzFu4JYpI
         VqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458348; x=1754063148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Imtw8Gx4ry64i1JxbY02DQ6xhqBG4Z3YKMzGCpocp7k=;
        b=OanNtcjgfFz2ZzBmIZZHe6L+bLX7efwMgXpwB16RUjJ1pB3tSrlbq4aSI/Q1LDevLI
         xiUCvHACBzK0KXjx4m+bVUxL6/khH0WE/pOMADFc+1gsCHw9jbay2DDrZ6WM5DzXZ8d4
         RVlu4vKipK3mVlQdF4+/vnXoRh95L2iMj+5KGUi/LqF5YtAcLlJ4ICSa6Bfw1N1qACFd
         U0tFoPREA4mU7qIdzDSf8ilnROaFQVNBITXsBqTeR1OY6oWEIPbPYD2NM+zoIPPqoxPw
         sMrBGgD/YPkVQYHmf6dSMfZF/Tsm4ILmwstpZJcEXRM6rRaoyMgczG4fF33gsTaxuJTN
         MfBA==
X-Forwarded-Encrypted: i=1; AJvYcCULIVBbyzD0hKI/EPHZsH8KLg0Tu4SQoGutF32rIOW/eI9KEORWN1c+fnqbvTPjQDnZv/6KzUNtwPLUtFadUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo16lVtenDjsAHLQQbO+NCYRDZMmhuwHFqMCuQGJFaByDJHwvb
	0P44AN2pnRhHv6pi30T/jPANccNrxVXun/kFxoVBAUPzcaEg511JJmmbiM8rRgKPzCI=
X-Gm-Gg: ASbGnctTFfSDjHJiuM/wSvDCddkrf1mtlawuORkN0FRGfM80dwyy7R4MeL7wdPBtURG
	EqRtDjuC4Qoj+a1ej+t1K1+C6VwCc2toDvO26WzRCVMqyrw/ihaO7uUeV9NZWPAGHL4pWY4opiT
	4NSvz6yjo/K7ePu/p99FiRh+UF5W/VKUIC8B9pio44ur0UmZPkLY/gzLbqkXM96ddZtw3pza/yo
	TH2WDrKHZuKWU0FbAxxCBI59CxygpgoXRfZA/yPCBIcFX/DD5bMc8Mjk5kqQ10Y/GUpMGiCofc9
	flbQBqw4n9OmkhPOsHSxyafG2uV0uuPabRWjBfy6Rjk66wwuhUGykRDPsFayltu8csx3JLs4jQ7
	fEmcQ8vW9pA1pZIcVPiLB379kMqsHe6i8Oj7XukvQVpUL51tm86DDp/vyPqSy5Eaq
X-Google-Smtp-Source: AGHT+IGU/MNEg3WQWls2DntpgirfB//jbj9l1ObldWRxzEwSfkXxYeLeZrDkB6W9KV/qLzu1Pm1RFA==
X-Received: by 2002:a05:600c:3585:b0:456:24aa:958e with SMTP id 5b1f17b1804b1-4587b16ef91mr660575e9.0.1753458348394;
        Fri, 25 Jul 2025 08:45:48 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4587ac58162sm1157495e9.18.2025.07.25.08.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 6/8] pwm: mediatek: Fix various issues in the .apply() callback
Date: Fri, 25 Jul 2025 17:45:10 +0200
Message-ID: <20250725154506.2610172-16-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4756; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=90XfpnWAvKrAD7iR4HpWYRpLi0zHbPGui3cdslYcXUo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aT3OoVnQuD9g/ceDdq/4tPDMudwzFZfPofd LeBmA30bhuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmkwAKCRCPgPtYfRL+ TvGdCACmyBIsMq9Y9fW2D5e/i9qHdd9zN3CsSE4ORC6OwTZh6yXFBCu78dTIEhc+6gVtbvvBesr TXizV3MZc08MY7Z3Ep4BXQ24fyl1sEhmqRA2toImZj08PJrfjFqFLaKymM2KWeHP2j5WAHRcLr7 8a9gONV35IRJTL652Kxbp4ZnY+N7MmJnDtlwpFUreKNptSJ5KvDnxW3HfxmP05rLrOOqV1nPcgh jqoLWHCu6wRIEsmJbmhR2z/KUmRZW3gzCCOrjtpCp7bCnissukSKRl1UgzsmDM7MP7WzZD8tZTO wRFs7LcI+2gksawcw5VgMMexo8y40gp4lzH180habHpxIEub
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084550_117005_5E993BB1 
X-CRM114-Status: GOOD (  19.50  )
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
 drivers/pwm/pwm-mediatek.c | 71 +++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 28 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 05263a17d55d..c0a97d18e673 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -137,13 +137,13 @@ static void pwm_mediatek_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 }
 
 static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			       int duty_ns, int period_ns)
+			       u64 duty_ns, u64 period_ns)
 {
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 clkdiv = 0, cnt_period, cnt_duty, reg_width = PWMDWIDTH,
-	    reg_thres = PWMTHRES;
+	u32 clkdiv, enable;
+	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
+	u64 cnt_period, cnt_duty;
 	unsigned long clk_rate;
-	u64 resolution;
 	int ret;
 
 	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
@@ -151,7 +151,11 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
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
@@ -160,27 +164,40 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (pc->soc->pwm_ck_26m_sel_reg)
 		writel(0, pc->regs + pc->soc->pwm_ck_26m_sel_reg);
 
-	/* Using resolution in picosecond gets accuracy higher */
-	resolution = (u64)NSEC_PER_SEC * 1000;
-	do_div(resolution, clk_rate);
-
-	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
-	if (!cnt_period)
-		return -EINVAL;
-
-	while (cnt_period - 1 > FIELD_MAX(PWMDWIDTH_PERIOD)) {
-		resolution *= 2;
-		clkdiv++;
-		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
-						   resolution);
-	}
-
-	if (clkdiv > FIELD_MAX(PWMCON_CLKDIV)) {
-		dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
-		ret = -EINVAL;
+	cnt_period = mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC);
+	if (cnt_period == 0) {
+		ret = -ERANGE;
 		goto out;
 	}
 
+	if (cnt_period > FIELD_MAX(PWMDWIDTH_PERIOD) + 1) {
+		if (cnt_period >= ((FIELD_MAX(PWMDWIDTH_PERIOD) + 1) << FIELD_MAX(PWMCON_CLKDIV))) {
+			clkdiv = FIELD_MAX(PWMCON_CLKDIV);
+			cnt_period = FIELD_MAX(PWMDWIDTH_PERIOD) + 1;
+		} else {
+			clkdiv = ilog2(cnt_period) - ilog2(FIELD_MAX(PWMDWIDTH_PERIOD));
+			cnt_period >>= clkdiv;
+		}
+	} else {
+		clkdiv = 0;
+	}
+
+	cnt_duty = mul_u64_u64_div_u64(duty_ns, clk_rate, NSEC_PER_SEC) >> clkdiv;
+	if (cnt_duty > cnt_period)
+		cnt_duty = cnt_period;
+
+	if (cnt_duty) {
+		cnt_duty -= 1;
+		enable = BIT(pwm->hwpwm);
+	} else {
+		enable = 0;
+	}
+
+	cnt_period -= 1;
+
+	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld @%lu -> CON: %x, PERIOD: %llx, DUTY: %llx\n",
+		pwm->hwpwm, duty_ns, period_ns, clk_rate, clkdiv, cnt_period, cnt_duty);
+
 	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
 		/*
 		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
@@ -190,13 +207,11 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		reg_thres = PWM45THRES_FIXUP;
 	}
 
-	cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
-
 	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period - 1);
+	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
 
-	if (cnt_duty) {
-		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty - 1);
+	if (enable) {
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
 		pwm_mediatek_enable(chip, pwm);
 	} else {
 		pwm_mediatek_disable(chip, pwm);
-- 
2.50.0


