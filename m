Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1CBC83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EXXln8ztUf98iIGf/7dfBRdET9nYoY4W5NiVmN7viz4=; b=KFXxmsBUE5s2AD/UMZK72i8QRD
	N4b4eBljsKfKAwkm/tYzexFN1qxj0fRs5CXAvZtb81wX/qLhaNH7PmK9R759Xjk7QqKBlwbfDS8tE
	fMq0bOiKcugo+MfKZGRYsrXezEa2mjDFW88i3uMq06+gbJI9Af2wdRIUu8FcdCZlnnQm1cX0xqeEI
	5ndExDw5q61qPewc1ZnEYrDgckkuExr263sINgFCM0Nl1/H++HMENHIBHQWA+tDbJl0xGEJgbA5cp
	BsjZmqXAvt7HACdJAcN6HZgaOcsIUjX0zb2Xgh0bYHzY8g8jnKZNgkZyd9xqUnCrAsH+vDHJGglki
	dVYEdoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwdV-0000000CmOf-2NWp;
	Thu, 10 Jul 2025 19:08:49 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuGq-0000000CTUp-18PE
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 16:37:17 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so254058766b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752165434; x=1752770234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXXln8ztUf98iIGf/7dfBRdET9nYoY4W5NiVmN7viz4=;
        b=sZWQrf9ZV69p5AVoYKZjpsSnLGGki4Qifa1S4+zRO8GqDOsP0ZtC2r39uBjP+No+6N
         pVfqIKtkas/P90U4gEeP9NHdTwv0z3znSpqemGrdiXDFh85w2Ny7XI8CMS7wHBejBlz+
         ia3SCMwpkL/JrG7KdyWXs7yK1f8g8U/PEUBuKDXisFcMqy8BSIT96o51QUCJEc0eMDiJ
         JLILfeYr7A+R5gjhbff+5W80xvwICWUAuEOdzCPBefjWjqlpSpcwyvmBUshdaoXrPF6v
         21CZEmGaoLz1Z3Hxrldd3hb0PO/6zyPboBxvO+tsiECIeI7Ty96nQTe5N7XnWrRt76Qa
         PoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752165434; x=1752770234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXXln8ztUf98iIGf/7dfBRdET9nYoY4W5NiVmN7viz4=;
        b=I3i1+zoBsZRpSVPuhbJVFT2aQmoDvDIiRZjdRtXNEqO9KZK9LtR9QFatRGu3VU08l8
         hVuKMlzvUex3Wf4+u15WBkGGR32CP1HNFxCRTYrQCx0u8SXWTmv7kkH289IjHXmMfBL9
         Z/GW/Fh2z1UoMDaWLMfsL9Cz1E1EDTWkm/xp4ytW/FIavJk8Api47guycQEA1YAz0Adh
         688GEAAySsLGrZdbmm4r2WEdR7iAKmpUCKwCRlGvkmgslQpCyhqDsH4VZQzkOB8Rjqob
         ajauQCnEt7La7wc4rtemgUcERMd0K6k5vVqD5rwjQNGDDB7RXxI3OXl26N8g5++pjfBh
         jOVw==
X-Forwarded-Encrypted: i=1; AJvYcCUhbKNoWhbaLVAvfSaErXdD99WEqjdMiWYa0N+OloLYkJzEP52zOQt6v5RxuEMmmKewfoc5NETpW53Yn7/dPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaEqHisIOm6bSntykQ9qZ4AD1dAmwqQyaJqDddsTc/o8Tl/MS0
	lie/lbumkn5ZI13Dh8x7qmiG7XJ/sDHwTIReXP8yyEIFfqEaudq1FHcl451WcPvuSyI=
X-Gm-Gg: ASbGnctugN1+9MOlZ4N8cjW+sC5SmUtq9PbJWyw++c43KjRHs0b2EyfpGMs8F1v+bV5
	m0xa+56JfbStuVb2Xn2s2N0woiJItCV3r3cMdwxH58VFQ4sPkfLotDJQqCiC0Llaj66bFMcjO8/
	kMuR4Pl3BlHltlCP0bNn9w7eu0mlTlv+nUZHaRYWWVhZAMOQqw8PHN2SUqt0mzDCCR3rdjiyYle
	PB74V/RZhXcI1Jpn/gVemux7srDgFOTDfEmI30epP/nbUmav9Sk0OOR/H+YMfou2l+CU4PMutvT
	h2xYkt64d+PoeOjSq0MR/ys0PjWyl39kkOTBMKL0S82t3ELikUj/NdJHiYptS6kll/lA+4w3bgs
	1AQKYb/CBmiROVZjqayagkgiZV+x7
X-Google-Smtp-Source: AGHT+IELCUQ3D7o2E5fa6UZqXD1pU9+ZigPXm/NvY6HpZba0l8NVyN/8SJFdzxrZo+ZkOm2dFqnVfg==
X-Received: by 2002:a17:907:84a:b0:ae3:c777:6e5e with SMTP id a640c23a62f3a-ae6e241e145mr464296066b.19.1752165434105;
        Thu, 10 Jul 2025 09:37:14 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae6e82646a5sm159267166b.90.2025.07.10.09.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:37:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] pwm: mediatek: Fix duty and period setting
Date: Thu, 10 Jul 2025 18:37:04 +0200
Message-ID: <20250710163705.2095418-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2748; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=jOMELxbdXu94+iU1SXke2q4/fB9rAtm8W7mQtcZVjSc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBob+wxnYMcBKyG/Wij6Oow0CKXmGRmtySGPvJB9 Ogiq55xVeyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG/sMQAKCRCPgPtYfRL+ TqNfCACtwiv10W+Q7wOKif88ZIoxirsO+zClSsoYXkMw4ui3aWkEWGIEHio7LkX3Xx4MXI7yhj6 U+VvShsnQpqAq1+QKAxxxFYZ3HqI6/KjTXMf+vN37DMZrQNP8Ulvr3eiPOtQ8Sx4a4TNJMC1Yc2 aamAnmOd8eCg166EpsBGABrOaSw6oWa0kjmv593gDCcF+uHn6fMd0j9S2MIrMCF1sELwKMp0g6k PVbr0pGUHUv6lTuJ7Ngdm/nHSOYMKlpBAYKrC4uYt37YKV2H5HDD//3WAl162g0CuPQes69OFGH ZeVRLJyWMgOXqjanoT58DURN2ijBnhHuV7fNKzl/sHYRu7Ba
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_093716_318180_FA797AEB 
X-CRM114-Status: GOOD (  17.41  )
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

	((PWMDWIDTH + 1) << CLKDIV) / freq)

according to my tests with a signal analyser and also the documentation.

The current algorithm doesn't consider the `+ 1` part and so configures
slightly too high periods. The same issue exists for the duty cycle
setting. So subtract 1 from both the register values for period and
duty cycle. If period is 0, bail out, if duty_cycle is 0, just don't set
bit 15 in the CON register.

Note that the handling for duty_cycle == 0 is only based on
experimentation; I don't have access to the documentation and so not
setting bit 15 is just a guess that seems to work in practise.

Fixes: caf065f8fd58 ("pwm: Add MediaTek PWM support")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given this problem is more than 8 years old, I won't bother Linus with
this patch before v6.16, but still add a Cc: for stable when committing.
Would be great to get some feedback from people who have access to the
documentation to confirm that the bit 15 handling is sane (or propose a
better alternative).

Best regards
Uwe

 drivers/pwm/pwm-mediatek.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 6777c511622a..80e322f02512 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -150,7 +150,10 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
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
@@ -173,9 +176,16 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
-	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
+
+	if (cnt_duty) {
+		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period - 1);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty - 1);
+	} else {
+		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, clkdiv);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period - 1);
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, 0);
+	}
 
 out:
 	pwm_mediatek_clk_disable(chip, pwm);

base-commit: a582469541a3f39bed452c50c5d2744620b6db02
-- 
2.49.0


