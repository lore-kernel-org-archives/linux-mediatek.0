Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856C0C83F03
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jul 2025 17:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EJ8+3kzijg+yQZlgXvqdx2kavqq2yHDf6k+bFmty+p8=; b=WstkCc2Nlk9r7a/NOZ5YoQvOBR
	9LW7XN4y/NZkH8EJpRz2fFL6Hgu2HazWAvYJnqJTi3P6DaidXMr0rY9CrAZGiN/PmIYNbQyOzMB+5
	Q9qQFBcTYP9BNBG3PL+Ee1glPqQjcL8QWJ4IkWzHoyEBqMxj4i0ALEaNl/ghulwjtuZfrRaziblKr
	Ofzt9MGhSokWRR58alUBgk+g2VSENTylakv4feHQ7f0PrXH+Catko8grhAJKM7gqSIOWs8OYBauIs
	HpA83jyCu22pYvueKNwWivNQkKOiGjNGfl5RtvlKXL4U5IafAU8deP2XabH58oonne1T4v0Rse2Dr
	SHTI3jJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkCP-0000000F5YA-3tuH;
	Fri, 04 Jul 2025 17:27:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkCL-0000000F5Wz-3vY4
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Jul 2025 17:27:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so8774685e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Jul 2025 10:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751650060; x=1752254860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ8+3kzijg+yQZlgXvqdx2kavqq2yHDf6k+bFmty+p8=;
        b=E+d+XBXQeRNIbX9XVVMRtbnbutsV0/FLW2WPUS/0JMB33QJR1OzJe/p0vSmb0ux4+E
         pFaVJyw8qCC/P8sOzkLCH+zhHqGX6dFfHoqrRCsEyGW5mWPoQDm7BLhwYgPzxwCIVvbx
         jVDqwaCbsffKvRFLMuq2ZVB1bpzdRhkFfmpJ0tDEpymR5nYTpq7aFhGvVqbnVp0gZREZ
         kBmABS9CbPim/FXm45EFOAH7aSljW8hJCyd9xktyb7mNXY+QQLEYx40+sfFGCFMC5pB8
         AJ0VLCKccV/JaiCt7zrgJPLkJniZdLw9PTMbuLIZevkgYXG9oUPvvWedolDpA3SZvWK4
         s0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751650060; x=1752254860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ8+3kzijg+yQZlgXvqdx2kavqq2yHDf6k+bFmty+p8=;
        b=qQymiCDZYb1+Xm/mqGHUea31rRsUyoZQ6mEUdAOWE8aEsj0TSQqIuj8t5yS5FDLSjY
         m7+spQ0yJchZ2ZzvwPLfrRgq50TTSIlG58e9pgUiMCJ8nBrSY5sp1oIw0OI31JEmBJ0r
         65fk0ZxtqF0KCXbnuNFRB9+yB1Qs5ImMy//sztl1Mhcu+B7skY51iuho62VoNjA5ubEu
         BECKH0tipakt6c0c6ktEUrJH3BSJ0VJyBel6MKHiMyaxMALaZfJpGaDS1gaQ6lt7QDhg
         K2fMR7Of2OsTCixaLMP0i1HGsHBZkIgVz9TTOG72ePtx0n2a7OIQ/TOip0ey5PadQXzO
         jRxg==
X-Forwarded-Encrypted: i=1; AJvYcCWYAEmu3KpUHpHI/BUxWdYD8ruJDsZblrMaxnM6r6FteCCeGYWYd+6SLW9k6sO3P7WULRA6tVmwxYA0vGey0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFZcaXBlcWa7NKDJg2ELuBIAVOEgwtp7YQ8HK6Qv6ZrCdSJMY6
	JvKI/IAHG+L3FI4lwk3FeazUxq0vqjZUMnFN6sBB8sTWZjWG9ZD9p7bHzgorsloUa9I=
X-Gm-Gg: ASbGncvLUv2gVK0Ry7rKXylM95ynOjEzCUEPrcBiE3YL14zcNWougBqil0OJooxA4VC
	IB7gIow+iAGOQy9cuRjjWkEB2fdA84IFWsub4A3TipbixxE+PZcZ3ZT05m3zCqwZzT+xVUNUgQ5
	v6u7dYUB0rDfeuU6JUBt1/qineetOz0lnSOHxf9ciumM6Z6Eh8YKmi5tJKVamsVS7Nt03Bi7fFn
	vydCFDEyTCWyI4xt2Q7VpmKnP759jxFDU4Amjuff0w0ERU9vwvTFF4Sc3uTlWE+2JAluxk0t627
	FnxirTHW3Z0iMfSMz8Y9kOQyHQ5mDbGLT8gQIzaxZlEX/6WBiyCJ9eWPJ3nBowIoEHADotRNrNt
	pZClGChnT8QkbT2O9fgSKdwmY8dDPFgnHgL1UvwE=
X-Google-Smtp-Source: AGHT+IGv5u997dndbYtn5LpnOeCgXKKeiNmL+umfIlNuz+5mm9d73N+p5qkNg3C/k7JLAiqbd72qUA==
X-Received: by 2002:a05:600c:8b6f:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-454b30b4d40mr39282915e9.14.1751650059765;
        Fri, 04 Jul 2025 10:27:39 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454b188d8e6sm31455575e9.36.2025.07.04.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:27:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
Date: Fri,  4 Jul 2025 19:27:27 +0200
Message-ID: <20250704172728.626815-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1841; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=5T8lLq8LRw7v7jY52F738fYrCCvGVLO6R+VQ2/Gu59s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoaA8A/CID8YoVzALS6o+3ioPferch7DY1qIofp Ikg+oeQkkWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGgPAAAKCRCPgPtYfRL+ Tu4JB/9jcS5cvb4dOI+tfyL8GO5FMte/UYZykJQsMUX7mAS214vqglz9KOtmyfbXkf5ZK2otSml ZterLv8gcmhJLJYofdE1y8S1shMqNIRin7NZ6eaaN0C+ptF9sF31aiWXPRnEoFsKYdueGyZ9ov9 Is9qaX7rZA4/Gjgtw4k9aaUamznd5q5xpJu26xUog599gwS+WLuPU3l5A9xaP7TjTs21pTuf0u5 FswUA9k93WAL8h96F3jnP/n08LX3anvstsmbBG32/n8Pqwm1SxMR2oV8cPPqXVHozul4z+RkpEs pzFPczoCywlbdJmrRuCT6XY7KYD9g56e7O0TaYAXdkq3ayHZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_102742_200121_D822A7B9 
X-CRM114-Status: GOOD (  13.67  )
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

After enabling the clocks each error path must disable the clocks again.
One of them failed to do so. Unify the error paths to use goto to make it
harder for future changes to add a similar bug.

Fixes: 7ca59947b5fc ("pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 7eaab5831499..33d3554b9197 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -130,8 +130,10 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		return ret;
 
 	clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
-	if (!clk_rate)
-		return -EINVAL;
+	if (!clk_rate) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* Make sure we use the bus clock and not the 26MHz clock */
 	if (pc->soc->has_ck_26m_sel)
@@ -150,9 +152,9 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	if (clkdiv > PWM_CLK_DIV_MAX) {
-		pwm_mediatek_clk_disable(chip, pwm);
 		dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
@@ -169,9 +171,10 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
 
+out:
 	pwm_mediatek_clk_disable(chip, pwm);
 
-	return 0;
+	return ret;
 }
 
 static int pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0

