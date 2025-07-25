Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50F4C87FCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQhxUI8Fh9eyfgKmKjb+PifIaeiBh4I0FbzAiPRYf8Q=; b=1PLOFbgvxTzBhGnaQpT/6QZ/TU
	MfS253ZRvj3/Zk60B/MA40rVI9mf2eezqFJN1g7lEqf89WtQbef6juBYSyjh5quUp853r55reTcIO
	k5q02xTBTJTqRWhMUoUnIvqF1tjL3xCNfnsqFiW232M423jVi0DhzHbbAUaoDK12pmq/ELbW8jdqc
	P8X9q3FAaTiYtNbaaQfU1/koEQCw9YAIWu6NyoBRMchsvUfcy5ovZNbQJoH702rEvXc8MqT0vTwq/
	Zgmaet00AkXW1MegvAUQalPuZyCL97nADzK/CdzXWdTmF28tq56IJ3LqA25AtLhtD60srg/dDlNAw
	UvGvTjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKhn-0000000A9N7-26ka;
	Fri, 25 Jul 2025 15:51:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKc9-0000000A8TV-432J
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so16483775e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Jul 2025 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458340; x=1754063140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQhxUI8Fh9eyfgKmKjb+PifIaeiBh4I0FbzAiPRYf8Q=;
        b=yjvU9lwK/hM30j0uP4AyobEc4jKoKn50WyG+uM22z9Q2qh96veSdCjyTZjbty0wiPN
         xdBDq7rhiFWTsNG3jdGQv5qkx5O00FgzJ2P6xoihusMUgQsQdwPtQKDUDhHWqZ5UtiO8
         rdWou+YgYGPyPBw6nXXnbbVRAv+4vwTQbmokmRFHKczj2Y++2YsPapXCVrCeGinhCQ0G
         wIvN7+0otOscR7rX8fjml/MZzyVMNaf6BClDqU0oVT+SvGzYY+lRLWSWZAHhc76x4GaY
         hsMQUNWi5ERSeIhrNjK5DJpCQ3/y5yKc23TZD5vP3JDa7mWfYs2+6cL6tZ/pJd0kE+oN
         PNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458340; x=1754063140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQhxUI8Fh9eyfgKmKjb+PifIaeiBh4I0FbzAiPRYf8Q=;
        b=of2k03eDEyQlAJIcEmVzzrzMLR4EyZL2lDjH1sxlrRAcq4EymcY6KkZ+gtRRxaiuT6
         kZWHMWFtRKTMouEV5hk0A/VsEaRozsvhZobwnyBNK7fjMzr0bSjR80XvX5HzW2uxNuj9
         7DJTF8aCTqNjrTYEEqv4EXUXVrKrH2dGK236KABJQyjOkL3k2Raq9TE+60MpDaXi/bTH
         /LY7WlxVW9PkuHqk3ZGJJ82DKFR0AhV8vKkUNxT83N1BCgjBbD4uS4p24LWdyC5bgiyj
         rFxkxs93Naq8KdUiDXQtvx6uNA+DuJXOQSyeFDl8QUsI3+08kdztaZqpU/lUg6A/n6ox
         JlUw==
X-Forwarded-Encrypted: i=1; AJvYcCUOGoeiNla6c63Hfq2f2lmRON/GCL39GnsPNaxnCjyi2LfpocxXPOnsU2jgdanc90hLVRxrQwR0lqF6qs3Ehw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqJFWd5YWJ1r7cH8FRe6PgxIBCfwYV0tuyYgc213BKARi7CXz1
	EyF6J39otZUSWOGWeMu0VQQu2s3VTi3KsgIQrOIl7oS/M6LGrGhQts+Ot4M1uKYjK8c=
X-Gm-Gg: ASbGncubb8cYhAHqmACVhbJcoEnpzsrTzaKtqdnZ0RXqGSv704hwPSDO6UQGc44iEuC
	apBYwjjvt9bc0kBqIVJWbXb1XiiSVaVIXmTqtfVpI4vkeSIRcmYTHpEVKrPL3wy6oKv1igDSnMf
	1w4D1QdKYxDqipC0RbuyA0UcdBRaD6TtubKPm9vGUQv54bFiZjFtAT+8pAEGTAsAeuSpeYPt7HO
	BVcw9YFBA7SIMwnKlCc30xVkXWe9YKPXDHCVRrAO/PMMNMWzM5MUTXXnOv0p2gjGs37C6FjGIZm
	/ZZg+7/BqKI7hOV3GrV/nV5FnI6Ven0Z6vzsRE60wRDmNBPNrPPNTA0fi2wizNT2qb/77aa2W4B
	JmS/i3gIelS/qPP2+9xhKyoc0nVJZZrrjvlQJHVcGnXgf1s8uN3sLNCWeVFIcOKQs
X-Google-Smtp-Source: AGHT+IFvvuRO9E62crjoHjYDpYCmIkj1p8pP+WebWJSSnZvU75d1+OogkqpnJ1UX0x5ss6EP/V5dvQ==
X-Received: by 2002:a05:600c:1d09:b0:453:84a:8cf1 with SMTP id 5b1f17b1804b1-4587667ade9mr19761815e9.33.1753458340292;
        Fri, 25 Jul 2025 08:45:40 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458705bcbfbsm60002095e9.16.2025.07.25.08.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/8] pwm: mediatek: Simplify representation of channel offsets
Date: Fri, 25 Jul 2025 17:45:05 +0200
Message-ID: <20250725154506.2610172-11-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5740; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Vh5B9HqPrBhGUtVTYSV0ca1sCZJ/iXlXUjDWoHeJRpM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aFx/HmfNW5zHZ9pAk6VHQWrh6vSIV//JANL AAboGD7UJ2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmhQAKCRCPgPtYfRL+ TjouB/4hXsGYa61YVjD2g79g+p3dsacSCeoFj/4eZRcSqNVCH05EIO93oufe+Ag3PrqdpYtNSks RsqIY7QO5AHG62qn1/nIrFVDC6THaoxHdoLnTl1/LoA5kMoE9yZJnESBrtxYW1UtrUKD9SleUob hyPy47Kwo2GNf/NsVL8KwgaPPNmPpejr5zbt2kQPObbjz3wr3DYmuzO5sdFjUWUScfTF+oc0U4I gDzQZ9An+dNzKAti3e6OovpIWCHjbKPIjSdVVx1rfZLj6O4lM6eL5zlQ3KuVA7WTaAXSVfnfBPa 2xaFIo/cQ33tE81cATA8le4expd1I4ARHFzPrv56NCGhnTh7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084542_004002_180DB027 
X-CRM114-Status: GOOD (  14.47  )
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

The general register layout contains some per-chip registers starting at
offset 0 and then at a higher address there are n nearly identical and
equidistant blocks for the registers of the n channels.

This allows to represent the offsets of per-channel registers as $base +
i * $width instead of listing all (or too many) offsets explicitly in an
array. So for a small additional effort in pwm_mediatek_writel() the
three arrays with the channel offsets can be dropped.

The size changes according to bloat-o-meter are:

	add/remove: 0/3 grow/shrink: 1/0 up/down: 12/-96 (-84)
	Function                                     old     new   delta
	pwm_mediatek_apply                           696     708     +12
	mtk_pwm_reg_offset_v3                         32       -     -32
	mtk_pwm_reg_offset_v2                         32       -     -32
	mtk_pwm_reg_offset_v1                         32       -     -32
	Total: Before=5347, After=5263, chg -1.57%

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 58 ++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 4460bbca2582..4dfe657957bf 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -38,7 +38,8 @@ struct pwm_mediatek_of_data {
 	unsigned int num_pwms;
 	bool pwm45_fixup;
 	u16 pwm_ck_26m_sel_reg;
-	const unsigned int *reg_offset;
+	unsigned int chanreg_base;
+	unsigned int chanreg_width;
 };
 
 /**
@@ -57,19 +58,6 @@ struct pwm_mediatek_chip {
 	const struct pwm_mediatek_of_data *soc;
 };
 
-static const unsigned int mtk_pwm_reg_offset_v1[] = {
-	0x0010, 0x0050, 0x0090, 0x00d0, 0x0110, 0x0150, 0x0190, 0x0220
-};
-
-static const unsigned int mtk_pwm_reg_offset_v2[] = {
-	0x0080, 0x00c0, 0x0100, 0x0140, 0x0180, 0x01c0, 0x0200, 0x0240
-};
-
-/* PWM IP Version 3.0.2 */
-static const unsigned int mtk_pwm_reg_offset_v3[] = {
-	0x0100, 0x0200, 0x0300, 0x0400, 0x0500, 0x0600, 0x0700, 0x0800
-};
-
 static inline struct pwm_mediatek_chip *
 to_pwm_mediatek_chip(struct pwm_chip *chip)
 {
@@ -118,7 +106,8 @@ static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
 				       unsigned int num, unsigned int offset,
 				       u32 value)
 {
-	writel(value, chip->regs + chip->soc->reg_offset[num] + offset);
+	writel(value, chip->regs + chip->soc->chanreg_base +
+	       num * chip->soc->chanreg_width + offset);
 }
 
 static void pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)
@@ -306,86 +295,99 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 static const struct pwm_mediatek_of_data mt2712_pwm_data = {
 	.num_pwms = 8,
 	.pwm45_fixup = false,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt6795_pwm_data = {
 	.num_pwms = 7,
 	.pwm45_fixup = false,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7622_pwm_data = {
 	.num_pwms = 6,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7623_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = true,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7628_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = true,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7629_pwm_data = {
 	.num_pwms = 1,
 	.pwm45_fixup = false,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7981_pwm_data = {
 	.num_pwms = 3,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v2,
+	.chanreg_base = 0x80,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7986_pwm_data = {
 	.num_pwms = 2,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt7988_pwm_data = {
 	.num_pwms = 8,
 	.pwm45_fixup = false,
-	.reg_offset = mtk_pwm_reg_offset_v2,
+	.chanreg_base = 0x80,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt8183_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt8365_pwm_data = {
 	.num_pwms = 3,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt8516_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL,
-	.reg_offset = mtk_pwm_reg_offset_v1,
+	.chanreg_base = 0x10,
+	.chanreg_width = 0x40,
 };
 
 static const struct pwm_mediatek_of_data mt6991_pwm_data = {
 	.num_pwms = 4,
 	.pwm45_fixup = false,
 	.pwm_ck_26m_sel_reg = PWM_CK_26M_SEL_V3,
-	.reg_offset = mtk_pwm_reg_offset_v3,
+	.chanreg_base = 0x100,
+	.chanreg_width = 0x100,
 };
 
 static const struct of_device_id pwm_mediatek_of_match[] = {
-- 
2.50.0


