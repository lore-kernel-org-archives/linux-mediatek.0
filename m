Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBD9C83F0A
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFqlxkQ/SD97qpkHJtoGI6W/z2FZNN0aT+KCWb460Og=; b=R+aOKH8CZvBIEjwBJyDEDW3k7X
	MqWhDSDKGXj/WIHE9bnPWlXLpK3QuqDpcoNvTrQAQ2Dz6gYnSpo37uPnomxzP338wPEzEXhYFd+f4
	Us+Nz6C2fkrM3QO8q8RvvsiemSvqYtlB/vLxfBF/GklkTDMHxKYcewNfKI0lmRn/EGoJ76JIiWCSd
	uwNb/aQxKakInfOp+Kd/GbxOY80WMaJ7A7VN/7Z9HjI0e4BpVryN/YnGj16SOoVfz2Pu8hvscVhMg
	fIP9B2utKTTVBo0z9+CHKzuPL+g0PDR4vETE7AUE0AFblHEtJgzHPOy27x8Zsj19+na99NT1boWj7
	kbO7XVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCOo-000000069fI-2zwA;
	Tue, 08 Jul 2025 17:46:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByJ-0000000666t-3PKz
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:12 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso8292385a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Jul 2025 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995150; x=1752599950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFqlxkQ/SD97qpkHJtoGI6W/z2FZNN0aT+KCWb460Og=;
        b=kyzk5c7+Mh0GGPNC+ouknCS40jvZHaj/F8EZftBWk0UwxoPJ80Y77RmYPq5K8V0WvC
         odNhRPHWzcj+JnjwYkTzs4LNnSrxqL0GtrCV+Z1j8xJOgE7A4XKl/PH3r8P8EHxMWfZ7
         UvAmu+wj8jx8+u9W/R6e2bIvPTbHphVfr9p2MadajtNo4Nsh24/0Bz6tjzVAT0/4TFUx
         06JkRAeOTnmM/J8TYQwOG8W5kziLu+PvBm4yS5219tvazmh3qC9mf4b7al0Bb7D0b1Jr
         JP+BxUA03xziY3/ohcudaSeyvp4lvdTGgFXuUxQwfc46mT+PGGd3HmK8nK5hHeHmO3bd
         z/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995150; x=1752599950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFqlxkQ/SD97qpkHJtoGI6W/z2FZNN0aT+KCWb460Og=;
        b=CxOjVxU92Sa4pV1H57cLvDBLxvw+LypobCP3EVGMf9lwODS9ALONz4W81YtRpvUqBZ
         useE87ioQR5lf6JL9T2arvmExsm267wr+gvqVYNNLPfEbskw5iXI8TxkYJWw/RYGxvVG
         ZikieMnisqlZ+hzF28h+OtSx72J8lfSkQQPdvw3MtyGUcrMzFffH/kyEqcpvJc7BIC4J
         n1IF6voynpzpfVw1IP8ZicAZ6uKzJE+mCWu+QlW1Q1LPTlrq5uG+KxM3JC4ENkIxanel
         2S/6OGpyWfhsGvPLlkk12/y/3vAEB6ZTBuNKX9Ct9XwlX0DwH/Z6zodJPgRE4rGRC03S
         CDXg==
X-Forwarded-Encrypted: i=1; AJvYcCXdjaHvcFQ2snAg2Pl5k9I7DWKRmF6zM8zKC/bbv7RfVfe8BrlB+iMeb/IqXi0q2XsFDS8sY68b1sEjRHiF4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3FkO+ndmysxUj+arMMOYpPaA7qCrNSxhUyxguY3SoettSbdp1
	l+1Ym+QXI7IOw2IFWSxSQqjtgUednBFsEQ5KXu7QBpJqWRGX0QeKDZZ0hZPYMQqD0wo=
X-Gm-Gg: ASbGncvGpQnmGUxXsUVGJ1kgObIg0gmh+gob6eXtf1QYb3TwWyKECnwdWjKcT2VlTGR
	pWoEJjipFdA7tR3RhQhnbaxAjOPwD965uejunDQaXTHsklrKPm8mVKzNJdKz1h3nd83KnaA1t+r
	uVmNQjOl3QifaQ/w5xKTC37kVzPdwnnfZVMB2PpahzakBgacQm6VB3KqdZp1vWz93V7BFILYZcK
	iwdJywMnikt5vzontep0Td6mkkDguOep6tBDXeKmVs/jsTDNajnqtlwC6RUgbjNX4svLIsT/nQi
	jMg8rVWev1pKofBEndfc4KYV/+44DIgblpHZRjBFbC1Exwo4Ll/u6JIHctzJ7boOwDdJDkcLV1c
	ugGqzvNV5Re8szAdLJezoAulfZrfA
X-Google-Smtp-Source: AGHT+IFZmtC3hiekQDGureBWTwbubovtQOb0Tr/eF8NbDaK8y0PJsPcnu0JRq4l9Y8UVzbZpMV9iig==
X-Received: by 2002:a05:6402:2106:b0:606:df70:7aa2 with SMTP id 4fb4d7f45d1cf-60fd6e50540mr14395037a12.31.1751995150125;
        Tue, 08 Jul 2025 10:19:10 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60fcb1fb06bsm7448054a12.64.2025.07.08.10.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 5/8] pwm: mediatek: Implement .get_state() callback
Date: Tue,  8 Jul 2025 19:18:35 +0200
Message-ID: <84ca6573e8ef5607042ed56fca65ad766a0e6570.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3445; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=I1fNVW0MQmUn1ozq1+QPQ2MYW4IIPUu8ikCSK9SKAbE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVL2enJCg2AIeQ7i8MM86G6Semnf/UncLKYA0 AbOgu5IAbqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S9gAKCRCPgPtYfRL+ TuHVCACm+IDvCvHbhyfKb9oC8HSgRWQpdeUqpMbO8kQjlpAa83J1/SmexLOXYNzzc0E+fZMY+vW 4XUWKG0+FCl6nvLqNv9gm2cnhbKoX1r0/SgJLBq+DbnRcmbMpDEfxiurv9yqfyEilGy0rbVcsCH QCwbiOr0MY09UX+KSqKY11BznjXmvJFwuY11F35vHllEZAH5t6l1oB+L8XGyFj2CuGWQPZG+vz1 xzolSx6G2mnpRaxel8a1S57RWuknEKCayUbHFIvXvgPnuZB+PL3zmgCEuQbTwW3ioOXyimxbLma HAKRx7BKmg+oLHx+9NE14dCXwavGKlhXYDp5QTcltaLx0Rjt
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101911_846078_32A1F67F 
X-CRM114-Status: GOOD (  16.96  )
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

The registers can be read out just fine on an MT8365. In the assumption
that this works on all supported devices, a .get_state() callback can be
implemented. This enables consumers to make use of pwm_get_state_hw() and
improves the usefulness of /sys/kernel/debug/pwm.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 70 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 376d059c47bf..76b293f2b6c4 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -31,6 +31,7 @@
 #define PWMDWIDTH_PERIOD		GENMASK(12, 0)
 #define PWM45DWIDTH_FIXUP	0x30
 #define PWMTHRES		0x30
+#define PWMTHRES_DUTY			GENMASK(12, 0)
 #define PWM45THRES_FIXUP	0x34
 #define PWM_CK_26M_SEL_V3	0x74
 #define PWM_CK_26M_SEL		0x210
@@ -108,6 +109,13 @@ static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
 	       num * chip->soc->chanreg_width + offset);
 }
 
+static inline u32 pwm_mediatek_readl(struct pwm_mediatek_chip *chip,
+				     unsigned int num, unsigned int offset)
+{
+	return readl(chip->regs + chip->soc->chanreg_base +
+		     num * chip->soc->chanreg_width + offset);
+}
+
 static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 			       int duty_ns, int period_ns)
 {
@@ -224,8 +232,70 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return err;
 }
 
+static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				  struct pwm_state *state)
+{
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	int ret;
+	u32 enable;
+	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
+
+	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
+		/*
+		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
+		 * from the other PWMs on MT7623.
+		 */
+		reg_width = PWM45DWIDTH_FIXUP;
+		reg_thres = PWM45THRES_FIXUP;
+	}
+
+	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
+	if (ret < 0)
+		return ret;
+
+	enable = readl(pc->regs);
+	if (enable & BIT(pwm->hwpwm)) {
+		u32 clkdiv, cnt_period, cnt_duty;
+		unsigned long clk_rate;
+
+		clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
+		if (!clk_rate) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		state->enabled = true;
+		state->polarity = PWM_POLARITY_NORMAL;
+
+		clkdiv = FIELD_GET(PWMCON_CLKDIV,
+				   pwm_mediatek_readl(pc, pwm->hwpwm, PWMCON));
+		cnt_period = FIELD_GET(PWMDWIDTH_PERIOD,
+				       pwm_mediatek_readl(pc, pwm->hwpwm, reg_width));
+		cnt_duty = FIELD_GET(PWMTHRES_DUTY,
+				     pwm_mediatek_readl(pc, pwm->hwpwm, reg_thres));
+
+		/*
+		 * cnt_period is a 13 bit value, NSEC_PER_SEC is 30 bits wide
+		 * and clkdiv is less than 8, so the multiplication doesn't
+		 * overflow an u64.
+		 */
+		state->period =
+			DIV_ROUND_UP_ULL((u64)cnt_period * NSEC_PER_SEC << clkdiv, clk_rate);
+		state->duty_cycle =
+			DIV_ROUND_UP_ULL((u64)cnt_duty * NSEC_PER_SEC << clkdiv, clk_rate);
+	} else {
+		state->enabled = false;
+	}
+
+out:
+	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
+
+	return ret;
+}
+
 static const struct pwm_ops pwm_mediatek_ops = {
 	.apply = pwm_mediatek_apply,
+	.get_state = pwm_mediatek_get_state,
 };
 
 static int pwm_mediatek_init_used_clks(struct pwm_mediatek_chip *pc)
-- 
2.49.0


