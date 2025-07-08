Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D5EC83F0A
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 17:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YCcBWqb/14OVf5aTxzQNZow44RZO+5hy/WyrTI6Mqw=; b=fRRseDTzTRZ6fa3aC9Gf2Z6mU1
	IWpG7ssCCvJtHuCgK2HYe0PnmfwxcS01moszMGNs1HDtZeGhcPuVoAGvNNufu5+aC9WNOvhQh4CNx
	W6kCttkwmkaikg4cFU/vY1asQ+lJg8UcSmoZOt0PYvqC7rGkgCn0j4xFbCSumRHcYrj/oPA9Y+eZv
	nOMD6hU3gMzS/BOTqBWPKjNvZa3vyqlfdrMIVqo927x9+z6zusxuiDnQ5NV0CDUq/dKUQ9c3kkY6k
	RUzQQL6j39Vh2gN5GE5ZIMODIz46bliAOXhgX1X/5DAUwr/kZ99btgKZXYjVkbDXrDd5sJ290GHCu
	hrR4ZDpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCD2-000000067uF-10AH;
	Tue, 08 Jul 2025 17:34:24 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByD-0000000664V-0gqg
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:06 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so737231566b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Jul 2025 10:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995143; x=1752599943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YCcBWqb/14OVf5aTxzQNZow44RZO+5hy/WyrTI6Mqw=;
        b=NPFp5ekNLMz6pAavnK8Q88wsk/x5QgMRPpkPZMtvUOmjHqp6Y3pDs/caGxeCsRcEkI
         QrL3MW9K2fncHoxpmVr4Q1MKq2YLASAZyoDalyifJ33Czg6bJ3uf8unIBvQFdHZ4Id51
         Yc9PdOJtjWP3q4Fte1M6egMbIPNL+11eFykJJynNQelWjfTnNxVuZUaFl5t5tkaA6w9F
         TbHRy/Vljm4+GqE1we4dF9zKhqeBwAxZRwshdrWV1tg8y9iTaSkFYhQQkgvxSQ1upPfG
         tdPTkS/RlhWb8f5ifI3qyWYbX1nEjkgqj/qFg4aK7+I8kdU3lJx966riiyqOzkoRSNjg
         Nukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995143; x=1752599943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YCcBWqb/14OVf5aTxzQNZow44RZO+5hy/WyrTI6Mqw=;
        b=ueseZAA0M+wGXwbQHptQOlKMBkjhxroBt1HT+fZWpGgG9wkzvH6xm2K9SU/pC42RFO
         c9jDR1KvZf2O1GZCOUDdog35IEl/5drk66/vdfd61ZpmiNYJ8v4SxUYyV+2FaUjCCdPZ
         JLHj5NOMgp97XfHJ6UoJKrrr0VLw9bE1OZZopNM+GQmwvE2OyAoShAdwfugoxn98xscA
         sE4nNkaI3wTxzi5xoHRWkz17FPh1wZ5oZY4+bsPpRtt73eMQ9X/pe+PWuWTw9cuCswHO
         DMPd75/jIDmOCq1hZaseH1XWjTHHnhL/TJIaO+SfK3mcKU2I86AWTsGOx1VoOLAx+VXP
         z2OA==
X-Forwarded-Encrypted: i=1; AJvYcCXEVrclKZL3ldYOzKK1t/eVulzAqULyISBlOpQYBcZY7FOI1dSP75JTB/wna6UlrMtDPlM7QSxbnY8wa3zPFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOZ6d93haVL1AhVt83DcaJUDpkB/q32zPnghxW22OpwpZmrboe
	ihL28FgRvEf1GbZ/vNXDogjYLsnf1/w96VM3Lsrv+H+u8AYItggOUZbkHOPtGB04bBw=
X-Gm-Gg: ASbGncvWXPi7Yh+IbAP7Sbrc+Qths7x6Ok21wVlHYKe4grt31nXa3kEpcndOHZXV/65
	DSew2A4MQpEnkdgu69znKc+BjPchvoVoQXfDhgCcABmYTIKFgpGP/H5yut/B/mdod9IypjR+wsi
	RdCY6cnr+caXXxy4nmn7QzX+EFlWVuPTPSm3GeiNGmcNPv6yHdsjvRDUHuwO5Cmz0g7m1XGrcqw
	MLEiH4hMnSqT3lcxBkpNJLnsusJVjySWtlzXavEN7PATpnOn/EGa+NtIvWkJnft2gMSdXQ8qxv7
	drIY8jwOuU8qnyWuxoE2J6nMt5+Z/bN3nHUKlMpJqbtDD2mvRyZipR8AEsrsukJw3jehlo4Cz3t
	G4AAjLEg7JQZ/blxlpvZ6AP3v+8bp
X-Google-Smtp-Source: AGHT+IF8kfHJKejLeK1j6H1zcywDZ8Xdr2xWppCGautnggpU9vBR2EhDTLoKC/i+i65Bb+rH5MsXng==
X-Received: by 2002:a17:907:2d8c:b0:ad8:ae51:d16 with SMTP id a640c23a62f3a-ae3fe82cdeamr1461476766b.55.1751995143150;
        Tue, 08 Jul 2025 10:19:03 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6949fa6sm938612466b.68.2025.07.08.10.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/8] pwm: mediatek: Simplify representation of channel offsets
Date: Tue,  8 Jul 2025 19:18:31 +0200
Message-ID: <94aa8b7d52040f3a8dcefa7bfc634b3b747a26fa.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5739; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=z5L3CHH25GbwGRFMLktIjhgOzZBzKjmxrP0Cl1JGUM8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVLq2AvNIQgz0PLl1pxrGIZfz+DVJY8qDCHHM wDr+RYhjhiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S6gAKCRCPgPtYfRL+ Tu6rB/9p4O1XZjIbDPc+vjcQU19EDxQe/BSCihxRRBdMxsMWowCwgoaYwPNSUSn5iBl4xCOW5rO bQ/hp5Q0Ef5zbg93tsqLEuTnR9T+jOX73GWuhB9XlUVuOBDRDJPwXCJyXw/oBACjJXSqIYeOpmJ wfwQmkghSSiQGiAC6/vEJQroAxsibBG0tkVeVvthZ47oyvGEZWyR7bjlyUzh/PWUxegEGmup0CH E/pd1HmG8gt7WYRyc1GUjZRHT7kxw4eS1BS7f24FYHbJr+AGOj/EMTJFLCh9mttnyUG3LvsBYtJ 6yJOAQvuZdIz8i5zTHj52ExXITzCPHJd3sJs5jpp2lxLqnZ2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101905_206584_7BE05F35 
X-CRM114-Status: GOOD (  14.93  )
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
index 6777c511622a..a816f136f39d 100644
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
 
 static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -300,86 +289,99 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
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
2.49.0


