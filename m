Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6A8C83F17
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jul 2025 17:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVUxNp3pKPg0niLZHyJSf/h8YmI8EwmCwtNqXZm01O4=; b=Zlswk5OzsaHf4CZ0JPNGM1OEyl
	KR4adpDWFoDlMKrXzBiy6TdwaCZtRBrR6/Afil/yGAn58Ylk5RQsDqvh2Rq9/hddJ80QFlHsTxEHc
	m32uFbQ2/c6QZSTRBDOv5vofAb75THKcx+ujnkG1tcCGgmj8bnwyI4v6B0eLu+AY9qK/aTvZ3JhRH
	fPIVA17fGW8w5fk+kmviieNZ4eMqiAIlQMguYm9R2B29icPIZBwJUXCoLn4gE4BWYC9ij7Dl1u/1S
	Oa80gtn9574i2WrswvEYyAmVaMK7mLPzfnxnv1X143xOlKPQdPpB2laIl1444pkylsQOMbgL8f4TQ
	YoEOrZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRLb-0000000F4LU-28mK;
	Mon, 28 Jul 2025 17:09:11 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQHB-0000000EuZi-0njF
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Jul 2025 16:00:35 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ae360b6249fso805742766b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Jul 2025 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753718432; x=1754323232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVUxNp3pKPg0niLZHyJSf/h8YmI8EwmCwtNqXZm01O4=;
        b=l3Wcqx0j9EOziORrygFsXWi3WREFolrZ6kInjNSl2lP6/8ruc4VhFyowbB2i3FULKT
         0gBek6A6czlyDTeVfNP8rt8KtptOSiqQ6KUt/wZX8odoNUy+8Rl1Z/7PRj7x/6o54I7I
         ylj42YHAWsjaZHfuK+j/ZEv20uQQhLfBVeP5XKc3aQDKEPv2O1B+s0/KgPF0Dyc3hh9p
         N0SixcLG12ItiEe7ITZ604KvoxX6uozmwefbtiPt4FCahodVtCRkzbCyeFyX7dmD6fie
         tdGSrs74+m2HE5/KBtBcAayqABjjIRFMdmecBxS4ia2RXaFurfIjhjp0uzrU/yQUpV2O
         CTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718432; x=1754323232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVUxNp3pKPg0niLZHyJSf/h8YmI8EwmCwtNqXZm01O4=;
        b=m0OHYSv5QhGOhu6m4XhWeECuqpAX87puMV+VnM2axVlEyKhnEMfEwmXKF7KOfc9TDE
         PWixc9+ytU4Alu8zmjunyiLUmBw3fjEopOBBsoyjT0/9KhqW/hS2a3UmkJ6wfOEWvZa2
         HDvoY7j1TnMB/2Dq3SFOB2/+nEQ2QyK2PWdNKlbET+ixt8qwzJw2xl6dwn7jYc7nS0+h
         Kvd6KxOZUqUERMrJnSEmMCSNLcDT5wS1/ftCXlBwzYSOBxMWQrfQ7XcJTKKDoSuhGdb3
         VlqjvhmV6au2KF7lslC5xRe7ZowtrBrqt5lHHyJn0aA093X9T+WikdiNNPo9hdlpPtOQ
         NIzA==
X-Forwarded-Encrypted: i=1; AJvYcCUhaeMbi/NKvpVsKJFndLZ4bTnIxdrntPOg+Z3au4bW+B7kvTnKsvqOzn4JdU18kIT+gPQep3Fgwd/DfG6oTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmtjJkbWwcwFpC12cdVCxa9oSgjG+kVs6Zlmvv0OxyBlqEsmJG
	f4nGnuwLvCfsOZu8YmXqMz6ETbAYY2W6kL+RpkBpUv+z9KZ+f8g3celeoHsRHWf2D0Q=
X-Gm-Gg: ASbGncu13WEIe8/jScRoH4gaW3Z9YmazDcslmxAGIHqrBy3HqH9gx1w8FBO2cC+HqVo
	d+in5w+to7aubkEikpPpi+63eUsrrMxwHaW7mqfgCb+VM7f+BE8iVWk0cqx4IdI5j86VzJwLj2n
	NtG1QlkNmL9NR2OBiAoYVpithO15V5RD+tgZhcmECqrB0OWSgU8aX/AOtRB3BTNpw2StZQXtS79
	zJ1fY4gUhnm2T6a8i42v7J9zY1p4XR33M00VKQzMQyMD6L/9KyodbinbxfCAyDNftObEhKk5yGv
	RCFbkT3yQ4PHrEDg/+i3UXfNMl5yRoh583zvm//Dm70tfalqKSYXWtIiVW+TUDKId12CQ/pYX1Y
	if7yz0vxvMivdxAL6MJIHSr+0KuyHXv+vEZmOpZbE9afT18VFhQyV9x9ONlZ/Jszt
X-Google-Smtp-Source: AGHT+IEGF1ItvOY6GGrUkAR7Qd0sme7zsV46UvWdWtAr4CkLeiv0GjNYRtz1B5xQhic43rbFMeLbCg==
X-Received: by 2002:a17:907:72ce:b0:ae0:de30:8569 with SMTP id a640c23a62f3a-af61c4bd9damr1504131966b.1.1753718431532;
        Mon, 28 Jul 2025 09:00:31 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af635ad6132sm435214766b.120.2025.07.28.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 09:00:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/2] pwm: mediatek: Handle hardware enable and clock enable separately
Date: Mon, 28 Jul 2025 18:00:17 +0200
Message-ID: <55c94fe2917ece152ee1e998f4675642a7716f13.1753717973.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
References: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=fZtYDGMtNy+jMvHxxhEnc/USL2rISQ+e6krsDxkJqDg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoh56Uj6Oi+9KhddNiomFo+ycjNuYPpvKgaT5At kGuj3HWo4GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIeelAAKCRCPgPtYfRL+ TvClB/4l4gylRaW/aRQaWgzol9iAARH0zJHVFndca9/Pq5xTDTgQRsiu30b6utvGzzraxqc9DeN xloMWp217+IcFSI041/BTbDGDCI46DrsnI3z9ZQ+ElfEPuIjNP0DHwdXWbl/keQiR5XHbXfFI7/ 8gQYBtRon4QMg1f9tAi6Ys7vxusFF1+fLkiGvGFaj4f61DrDrIei0/PG8hEZF43WKjDIM6xnI87 qXgydKJ3fFqyjKTxkh/uEWxnOvvmNkHlYwBA2gPKn1ogNzpHOQKppZWOQWOnZ1QFAsHw/Panrwy vv+1fWTy4sce+smXVZrJrXmdC05lfxp8VGxm8mCQseP/Ee5V
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_090033_238046_8E1AAB48 
X-CRM114-Status: GOOD (  15.33  )
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

Stop handling the clocks in pwm_mediatek_enable() and
pwm_mediatek_disable(). This is a preparing change for the next commit
that requires that clocks and the enable bit are handled separately.

Also move these two functions a bit further up in the source file to
make them usable in pwm_mediatek_config(), which is needed in the next
commit, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 60 ++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 6777c511622a..b6560e52c803 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -121,6 +121,26 @@ static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
 	writel(value, chip->regs + chip->soc->reg_offset[num] + offset);
 }
 
+static void pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	u32 value;
+
+	value = readl(pc->regs);
+	value |= BIT(pwm->hwpwm);
+	writel(value, pc->regs);
+}
+
+static void pwm_mediatek_disable(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
+	u32 value;
+
+	value = readl(pc->regs);
+	value &= ~BIT(pwm->hwpwm);
+	writel(value, pc->regs);
+}
+
 static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 			       int duty_ns, int period_ns)
 {
@@ -183,35 +203,6 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	return ret;
 }
 
-static int pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 value;
-	int ret;
-
-	ret = pwm_mediatek_clk_enable(chip, pwm);
-	if (ret < 0)
-		return ret;
-
-	value = readl(pc->regs);
-	value |= BIT(pwm->hwpwm);
-	writel(value, pc->regs);
-
-	return 0;
-}
-
-static void pwm_mediatek_disable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 value;
-
-	value = readl(pc->regs);
-	value &= ~BIT(pwm->hwpwm);
-	writel(value, pc->regs);
-
-	pwm_mediatek_clk_disable(chip, pwm);
-}
-
 static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			      const struct pwm_state *state)
 {
@@ -221,8 +212,10 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -EINVAL;
 
 	if (!state->enabled) {
-		if (pwm->state.enabled)
+		if (pwm->state.enabled) {
 			pwm_mediatek_disable(chip, pwm);
+			pwm_mediatek_clk_disable(chip, pwm);
+		}
 
 		return 0;
 	}
@@ -231,8 +224,11 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (err)
 		return err;
 
-	if (!pwm->state.enabled)
-		err = pwm_mediatek_enable(chip, pwm);
+	if (!pwm->state.enabled) {
+		err = pwm_mediatek_clk_enable(chip, pwm);
+		if (!err)
+			pwm_mediatek_enable(chip, pwm);
+	}
 
 	return err;
 }
-- 
2.50.0


