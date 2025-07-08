Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE348C8303C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 17:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vy4Q5haFsYAqjA0+y4VjNlU3TUnjPrupOzMl88Fq3mg=; b=4iCaetZl6xTjr5K1Bxec8gtejo
	p3fS70EqF2smXj5bQridtUjPKz3OGsBILcQ41r+/TlNOJFUZXku4KHajr41AWcyaAJwhLeags1jyM
	0W+xS7lnebq9BWYBpDVBWfhtQ2UI7Wueo85Mf/Rg/63onn+SjyLyQ+aw/RL3X6dksfQoLPDzq5+Iq
	z1iz5oF2tINLPDwm1udbRFPS5z0RiQqcZIkN3aodxZQHFw0pxsnfjDCGoeBry4Eb3UotN5p7C9brq
	tNUNKkNEYX1FF2iFZ9klE159WPyWFru1Uw0Rk+M8tRQwZGoa6uvySv4Q9AoFd4bbxh7R3502p4HDE
	9BvmnYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCTU-00000006AK8-21Vk;
	Tue, 08 Jul 2025 17:51:24 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByO-0000000669d-0HMe
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:17 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso992965966b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Jul 2025 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995154; x=1752599954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vy4Q5haFsYAqjA0+y4VjNlU3TUnjPrupOzMl88Fq3mg=;
        b=uXlwV5PoqQy9+BEAA8ohCuo4g7ApkQOsKQ1AnqJq7EOcB3+rYAKvpoanKwwoadTPgY
         0/CFHytCSH5AicJWgdMJAIpdv7vOe7SuedBzNck2fF++ucdztoZMo+twWmVTRslW8EXt
         C69iKOD9+2zHpywxYDkhheTGpnhmQ7jBqCpiaDn3NlPRxVY988D4isNMRdSZHYCZSKHd
         cyqxyMnRWgyZdVgN2Vg1zE56rsIbxpfUEUuXdqNbTsatgLig0B9kdlBy3Q6W9NvB+bvf
         CwJumKR0rfCOhNcFHAPhMdBDtaaZoiGr/+cPlt/hbQc+pPlJeIRGnBDjJWgb0WHQbu2F
         v6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995154; x=1752599954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vy4Q5haFsYAqjA0+y4VjNlU3TUnjPrupOzMl88Fq3mg=;
        b=YrgMa/YM1KYInxk3Qne2gK9cM6a4BVqoE4jnS4y5fsw7nb7d69Zxt8TTSnJTK07Kpd
         CBS8G4QZKvRgxrGA/lIfgo/v2Nmarwjyjq4xS4iICEXwUUaQht1Qv6vA3g3It1hCOBNT
         DE+CJNz89KdwyqTFZNwNZzNvJ0SDFeXQSWmGz5dc30MCz4GqG7E/QScCpkd7ccgl6VTQ
         AgSXNALjrR8OM7wuz/7QVYTWyYndthlbINGB0bIIIQwnBB4DqBj9XQQAVmKk/PgPiCBx
         Gl6ps2OASOl5XQ49vgJFjT0qaxYKlUsnAwORgvc7dgryV0J5LBvDLF7bf7NA/V6Z/g8/
         di/w==
X-Forwarded-Encrypted: i=1; AJvYcCXIxaM8LjWfkcVJFCMXia8c+STy0wbpl+ltuTGazKQ7a7KDkvIwiCjXxeIpGHA1JhtVx6+yzhQ9oZybNydymA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfUa40nfcT7IK4pHEv1pl/n0IwV5FV3T6/fs+D4z9QmzVxtKzC
	voPXqruW+d/EdhYe7podVKKZVlUwUROVURUF6/u9bflmpDzHInMST0r/FiLobRtdrU4=
X-Gm-Gg: ASbGncugUyZ/36UI2BEcUzKkV/HQR9kKAZsGOsIgvr14ixm+CKzhLML+ThOihRvYGSw
	JS6YBbPxpChWJST/UH83yYj5BMpu0Wxqq8rYruh2rw/X4hmvgpdwIxMBF2wgvJFtkvLiFBWosDx
	7twuLrGBa6IYNmTEW12yMN+FIeRZFoV8m1/c0K1SpYyfedGVsG/UlbOojA4SJkv8rrObEKgnTYF
	lJgIVpUip40LVNvRmEUQAQBpGQIvuDj/P50E6evU51cEFA7OgKzNYQoTvcbdRE40EeLxJPlUDCO
	bqARrCcVzvrgXGi3Hg6NYYSuQLo9rS0RxTxsoZB9QLl1wCRhHSa0eabv29gAHBSVxPL3j2zGCRZ
	M/uqlt4EAPm/1eKSt6rqL1M0v1Qt74/Qwf9uGXUM=
X-Google-Smtp-Source: AGHT+IGZXNtMTO7EOjafG1ARt6E30CW0hAiH+W0FNZW7yFLiedXmHnmVViRT+pX+e838RCwyysqZvw==
X-Received: by 2002:a17:907:9407:b0:ae0:c441:d54b with SMTP id a640c23a62f3a-ae3fe5964f3mr1545247766b.9.1751995154448;
        Tue, 08 Jul 2025 10:19:14 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60fcb0c790dsm7507963a12.37.2025.07.08.10.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:14 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 8/8] pwm: mediatek: Convert to waveform API
Date: Tue,  8 Jul 2025 19:18:38 +0200
Message-ID: <a638f074ef24c46035fa1563ab6b4350ebc89580.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11131; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=gInSbyerMY5QiR6IcP2Kx8q4XKMVjYKeQFViDJERSPA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVL+zi6STXwyZMQQHRlNRIa4pn43y9axH37Oq Ktbk4RBY4KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S/gAKCRCPgPtYfRL+ TswMB/4hOFFOJaOXkphUMe5VuixTXt+9AYNmqEhHcvf7aCX13rKL9kIigKXvUFkcJyvHSnsom27 Ygq/Rs/RA36WCoTIz/T3jNGBanIz6JHNFQaJ23tTTXb4WaogyB5kgqP1FllpUAr/TVup3qTjD0f PY+7w5NnJfG1aJClM4uUlwRZSu4hR/c+kVZYMkKGMX7pa9A7sxmfKD7OjCkKusnnjboErPJ/q1q mE1B+K7a9TClBrmE3sjxHk5tdLgRoOouaCtN7qiijtnNvTEwaczMtts1Lg2hBlsYxiXHKuq2qNa 9oGi31eByVFONn9lIIEoyWzGxbbDpWBBnbsK8EYUeBNDV14r
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101916_113216_9F8826D7 
X-CRM114-Status: GOOD (  25.94  )
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

Implement the new waveform callbacks which makes the usage of this
hardware more flexible and allows to use it via the pwm character
device.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 287 ++++++++++++++++++++++---------------
 1 file changed, 173 insertions(+), 114 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index c48d46124059..43bdd1fe3de0 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -135,29 +135,51 @@ static inline u32 pwm_mediatek_readl(struct pwm_mediatek_chip *chip,
 		     num * chip->soc->chanreg_width + offset);
 }
 
-static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			       u64 duty_ns, u64 period_ns)
+struct pwm_mediatek_waveform {
+	u32 con;
+	u32 width;
+	u32 thres;
+};
+
+static int pwm_mediatek_round_waveform_tohw(struct pwm_chip *chip, struct pwm_device *pwm,
+					    const struct pwm_waveform *wf, void *_wfhw)
 {
+	struct pwm_mediatek_waveform *wfhw = _wfhw;
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
 	u32 clkdiv;
-	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
 	u64 cnt_period, cnt_duty;
 	unsigned long clk_rate;
 	int ret;
 
-	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
-	if (ret < 0)
-		return ret;
+	if (wf->period_length_ns == 0) {
+		*wfhw = (typeof(*wfhw)){
+			.con = 0,
+		};
+
+		return 0;
+	}
+
+	if (!pc->clk_pwms[pwm->hwpwm].rate) {
+		struct clk *clk = pc->clk_pwms[pwm->hwpwm].clk;
+
+		ret = clk_prepare_enable(clk);
+		if (ret)
+			return ret;
+
+		pc->clk_pwms[pwm->hwpwm].rate = clk_get_rate(clk);
+
+		clk_disable_unprepare(clk);
+
+		if (pc->clk_pwms[pwm->hwpwm].rate == 0 ||
+		    pc->clk_pwms[pwm->hwpwm].rate > 1000000000)
+			return -EINVAL;
+	}
 
 	clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
 
-	/* Make sure we use the bus clock and not the 26MHz clock */
-	if (pc->soc->pwm_ck_26m_sel_reg)
-		writel(0, pc->regs + pc->soc->pwm_ck_26m_sel_reg);
-
-	cnt_period = mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC);
+	cnt_period = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
 	if (cnt_period == 0)
-		return -ERANGE;
+		cnt_period = 1;
 
 	if (cnt_period > FIELD_MAX(PWMDWIDTH_PERIOD)) {
 		if (cnt_period >= (FIELD_MAX(PWMDWIDTH_PERIOD) << FIELD_MAX(PWMCON_CLKDIV))) {
@@ -171,102 +193,76 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		clkdiv = 0;
 	}
 
-	cnt_duty = mul_u64_u64_div_u64(duty_ns, clk_rate, NSEC_PER_SEC) >> clkdiv;
+	cnt_duty = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC) >> clkdiv;
 	if (cnt_duty > cnt_period)
 		cnt_duty = cnt_period;
 
 	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld @%lu -> CLKDIV: %x, PERIOD: %llx, DUTY: %llx\n",
-		pwm->hwpwm, duty_ns, period_ns, clk_rate, clkdiv, cnt_period, cnt_duty);
+		pwm->hwpwm, wf->duty_length_ns, wf->period_length_ns, clk_rate,
+		clkdiv, cnt_period, cnt_duty);
 
-	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
-		/*
-		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
-		 * from the other PWMs on MT7623.
-		 */
-		reg_width = PWM45DWIDTH_FIXUP;
-		reg_thres = PWM45THRES_FIXUP;
-	}
-
-	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
-
-	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
-
-	return ret;
-}
-
-static int pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 value;
-	int ret;
-
-	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
-	if (ret < 0)
-		return ret;
-
-	value = readl(pc->regs);
-	value |= BIT(pwm->hwpwm);
-	writel(value, pc->regs);
+	*wfhw = (typeof(*wfhw)){
+		.con = BIT(15) | clkdiv,
+		.width = cnt_period,
+		.thres = cnt_duty,
+	};
 
 	return 0;
 }
 
-static void pwm_mediatek_disable(struct pwm_chip *chip, struct pwm_device *pwm)
+static int pwm_mediatek_round_waveform_fromhw(struct pwm_chip *chip, struct pwm_device *pwm,
+					      const void *_wfhw, struct pwm_waveform *wf)
 {
+	const struct pwm_mediatek_waveform *wfhw = _wfhw;
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 value;
+	int ret = 0;
 
-	value = readl(pc->regs);
-	value &= ~BIT(pwm->hwpwm);
-	writel(value, pc->regs);
+	if (wfhw->con & BIT(15)) {
+		u32 clkdiv, cnt_period, cnt_duty;
+		unsigned long clk_rate;
 
-	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
-}
-
-static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-			      const struct pwm_state *state)
-{
-	int err;
-
-	if (state->polarity != PWM_POLARITY_NORMAL)
-		return -EINVAL;
-
-	if (!state->enabled) {
-		if (pwm->state.enabled)
-			pwm_mediatek_disable(chip, pwm);
-
-		return 0;
-	}
-
-	err = pwm_mediatek_config(chip, pwm, state->duty_cycle, state->period);
-	if (err)
-		return err;
-
-	if (!pwm->state.enabled)
-		err = pwm_mediatek_enable(chip, pwm);
-
-	return err;
-}
-
-static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
-				  struct pwm_state *state)
-{
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	int ret;
-	u32 enable;
-	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
-
-	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
 		/*
-		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
-		 * from the other PWMs on MT7623.
+		 * When _wfhw was populated, the clock was on, so .rate is
+		 * already set appropriately.
 		 */
-		reg_width = PWM45DWIDTH_FIXUP;
-		reg_thres = PWM45THRES_FIXUP;
+		clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
+
+		clkdiv = FIELD_GET(PWMCON_CLKDIV, wfhw->con);
+		cnt_period = FIELD_GET(PWMDWIDTH_PERIOD, wfhw->width);
+		cnt_duty = FIELD_GET(PWMTHRES_DUTY, wfhw->thres);
+
+		/*
+		 * cnt_period is a 13 bit value, NSEC_PER_SEC is 30 bits wide
+		 * and clkdiv is less than 8, so the multiplication doesn't
+		 * overflow an u64.
+		 */
+		*wf = (typeof(*wf)){
+			.period_length_ns =
+				DIV_ROUND_UP_ULL((u64)cnt_period * NSEC_PER_SEC << clkdiv, clk_rate),
+			.duty_length_ns =
+				DIV_ROUND_UP_ULL((u64)cnt_duty * NSEC_PER_SEC << clkdiv, clk_rate),
+			.duty_offset_ns = 0,
+		};
+		dev_dbg(&chip->dev, "pwm#%u: CLKDIV: %x, PERIOD: %x, DUTY: %x @%lu -> %lld/%lld\n",
+			pwm->hwpwm, clkdiv, cnt_period, cnt_duty, clk_rate,
+			wf->duty_length_ns, wf->period_length_ns);
+	} else {
+		*wf = (typeof(*wf)){
+			.period_length_ns = 0,
+		};
 	}
 
+	return ret;
+}
+
+static int pwm_mediatek_read_waveform(struct pwm_chip *chip,
+				      struct pwm_device *pwm, void *_wfhw)
+{
+	struct pwm_mediatek_waveform *wfhw = _wfhw;
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	u32 enable;
+	int ret;
+
 	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
 	if (ret < 0)
 		return ret;
@@ -274,31 +270,30 @@ static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	enable = readl(pc->regs);
 	if (enable & BIT(pwm->hwpwm)) {
 		u32 clkdiv, cnt_period, cnt_duty;
-		unsigned long clk_rate;
+		u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
 
-		clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
+		if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
+			/*
+			 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
+			 * from the other PWMs on MT7623.
+			 */
+			reg_width = PWM45DWIDTH_FIXUP;
+			reg_thres = PWM45THRES_FIXUP;
+		}
 
-		state->enabled = true;
-		state->polarity = PWM_POLARITY_NORMAL;
+		clkdiv = FIELD_GET(PWMCON_CLKDIV, pwm_mediatek_readl(pc, pwm->hwpwm, PWMCON));
+		cnt_period = FIELD_GET(PWMDWIDTH_PERIOD, pwm_mediatek_readl(pc, pwm->hwpwm, reg_width));
+		cnt_duty = FIELD_GET(PWMTHRES_DUTY, pwm_mediatek_readl(pc, pwm->hwpwm, reg_thres));
 
-		clkdiv = FIELD_GET(PWMCON_CLKDIV,
-				   pwm_mediatek_readl(pc, pwm->hwpwm, PWMCON));
-		cnt_period = FIELD_GET(PWMDWIDTH_PERIOD,
-				       pwm_mediatek_readl(pc, pwm->hwpwm, reg_width));
-		cnt_duty = FIELD_GET(PWMTHRES_DUTY,
-				     pwm_mediatek_readl(pc, pwm->hwpwm, reg_thres));
-
-		/*
-		 * cnt_period is a 13 bit value, NSEC_PER_SEC is 30 bits wide
-		 * and clkdiv is less than 8, so the multiplication doesn't
-		 * overflow an u64.
-		 */
-		state->period =
-			DIV_ROUND_UP_ULL((u64)cnt_period * NSEC_PER_SEC << clkdiv, clk_rate);
-		state->duty_cycle =
-			DIV_ROUND_UP_ULL((u64)cnt_duty * NSEC_PER_SEC << clkdiv, clk_rate);
+		*wfhw = (typeof(*wfhw)){
+			.con = BIT(15) | clkdiv,
+			.width = cnt_period,
+			.thres = cnt_duty,
+		};
 	} else {
-		state->enabled = false;
+		*wfhw = (typeof(*wfhw)){
+			.con = 0,
+		};
 	}
 
 	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
@@ -306,9 +301,73 @@ static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
+static int pwm_mediatek_write_waveform(struct pwm_chip *chip,
+				       struct pwm_device *pwm, const void *_wfhw)
+{
+	const struct pwm_mediatek_waveform *wfhw = _wfhw;
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	u32 ctrl;
+	int ret;
+
+	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
+	if (ret < 0)
+		return ret;
+
+	ctrl = readl(pc->regs);
+
+	if (wfhw->con & BIT(15)) {
+		u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
+
+		if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
+			/*
+			 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
+			 * from the other PWMs on MT7623.
+			 */
+			reg_width = PWM45DWIDTH_FIXUP;
+			reg_thres = PWM45THRES_FIXUP;
+		}
+
+		if (!(ctrl & BIT(pwm->hwpwm))) {
+			ctrl |= BIT(pwm->hwpwm);
+			writel(ctrl, pc->regs);
+
+			/*
+			 * The clks are already on, just increasing the usage
+			 * counter doesn't fail.
+			 */
+			ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
+			if (unlikely(ret < 0))
+				goto out;
+		}
+
+		/* Make sure we use the bus clock and not the 26MHz clock */
+		if (pc->soc->pwm_ck_26m_sel_reg)
+			writel(0, pc->regs + pc->soc->pwm_ck_26m_sel_reg);
+
+		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, wfhw->con);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, wfhw->width);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, wfhw->thres);
+	} else {
+		if (ctrl & BIT(pwm->hwpwm)) {
+			ctrl &= ~BIT(pwm->hwpwm);
+			writel(ctrl, pc->regs);
+
+			pwm_mediatek_clk_disable(pc, pwm->hwpwm);
+		}
+	}
+
+out:
+	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
+
+	return ret;
+}
+
 static const struct pwm_ops pwm_mediatek_ops = {
-	.apply = pwm_mediatek_apply,
-	.get_state = pwm_mediatek_get_state,
+	.sizeof_wfhw = sizeof(struct pwm_mediatek_waveform),
+	.round_waveform_tohw = pwm_mediatek_round_waveform_tohw,
+	.round_waveform_fromhw = pwm_mediatek_round_waveform_fromhw,
+	.read_waveform = pwm_mediatek_read_waveform,
+	.write_waveform = pwm_mediatek_write_waveform,
 };
 
 static int pwm_mediatek_init_used_clks(struct pwm_mediatek_chip *pc)
-- 
2.49.0


