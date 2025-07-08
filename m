Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDC5C83F0D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 17:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scqIja4yXt3y0BO/CrmZ2a1K+cZsnX2h0lseDNvoEkQ=; b=b3XU7x7RnIejr7kyAa6nZV0jfw
	5Y0in7dUYvEHRnCmk/DanG2XZpubqEP7OL2qwahOqyb9VjQgaIjryhetwZjNTHPja+epmYX+DdxgX
	x8LfF7lhugkm6BnPr6gqBy563HKSZebRJf62vPqtHUOKFVR02NK2bhygpGFSKcNB7GewDncBuh7Ia
	mzEhaV+RvoXZMcNINagBWMXuOp+5zYdj1lGyCBD+AwlsJtRCtwDXCczDvVABF7A7/D3WMoDuRO0FW
	0Z8oqUWl9PVlvOf+xn0/c0/xLwbgozM15WUBf27TY/X+kOwnpvOddC2ltl3vRJsp+VTWtD/no2/Y2
	GwiIsimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCD2-000000067uP-2hg8;
	Tue, 08 Jul 2025 17:34:24 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByF-00000006657-3QMg
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:08 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so818660866b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Jul 2025 10:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995146; x=1752599946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scqIja4yXt3y0BO/CrmZ2a1K+cZsnX2h0lseDNvoEkQ=;
        b=M6psstaXTi65YafPuYqJ3/bNeOpqLJYvclP2KbAAWTBTdNujZvHnjAxLtcm3U7MGXB
         yHKtiOwJ/yQ5crpYTrxKr1qQhVL8kd6g5k4mU+JEFI8obun/qYY0z/+8OPCYadEH1KeK
         5H3tCFP8P19eOg65OWwPnEgtvhagPd3R+foTuogily22UM75hGMu8bcYsc+pD35HMIgy
         Gw59BndluowH8DtX++ackltX7/n2uhydBMt/3v3mLf7AQilBodTTflMhvudcgp8FsU9M
         YtSqBx+gsvnxmIjUligVAZDSNoopZgoDHTnvWQqsvp80HTYPcWf6Ea90g16rCVV/xEuq
         iuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995146; x=1752599946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scqIja4yXt3y0BO/CrmZ2a1K+cZsnX2h0lseDNvoEkQ=;
        b=VoMplcFh3EIndfQACXqLbvvSIMi0UZSH3/xzm3YHctK46P6Ez72igAxrkSFgx1e+0p
         NLkm6UDkhruVP3qcTO1ILRN9F+xwYsPKXOmL8JLDxP92ee6GgKRwKCr+pxBot06GS+Bo
         yy6v+EeJ2tPHRmcHvc9vDDOqsIygu9btJf+t5+ZfPFDTcyorsyJRU3+yahxF5JyDcExM
         hURa1Y6jz+80YVSA8idLgz68G1jQ8VvHe4WHTspWvd6zZFzNqJjogByyRYvRtFjdacm1
         fZkrRqpRrh46JH4w9UJUqsY676m1NURuAbZg4yJxOydEo9Gg8qDWsOioyKzm2brPmYJb
         JmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVg3yOOeT6FkLSwW3aMYhM7UPzb7WjAgEPAMXNOF8bxj1/TIv6IW07Z4h8c2EIlakRPiqow/NqRHdq+U/qzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOfWkLlayvlEdqIZ0w2+BDDQH6uS5fimGpsY98szXcPGwufCTg
	QnYxmrWB79zrAG00eMKeAB3ZccAZ77l817ikAH/gY4AF+uJP73v97SeLQODH3UG+DoA=
X-Gm-Gg: ASbGnct7PxWltaHqYR2VkdONPSraXYw4lXVCTq/OM5EghBmQxw+A7PNvIiw8fHsRSy6
	YjQuhCLXlw1cQAGmDNpvyicbFHtDY5BCsl9hVtiEAu7A7wmHa7wCNleC0GPm9wPh8t8kWbvXtAo
	p/UFaaHg/xNG6BdCr/gsv1DQ3qdV1+I12xM1ahc7Se/OhKTMREgaRLo+DxZF2NeSP5gCeK2jH95
	I/2HT/8wIZ/vxWpSrM2CJopSSkmLTa1bJzaHQp4vMoiJfSUCukInjBMmmTjSa9LCSKDNIlH+TiF
	tv5Xomk25n/OBHRTXG3fRXOr2zqlkvdFiBTBNRdL9WcRQLwP+rTAXrxB1AwgrORx2aJSFQFfOpw
	ANq/mPMjbpQiiMjrhBRBBMZ/Rt/lo
X-Google-Smtp-Source: AGHT+IE5OIeIZ5QR1ZssvGG6cwfSQTYFY8oEnTXJsjzZL/KNsWCagxV2uvWNHzT/jpCoBE+QF2QW+w==
X-Received: by 2002:a17:907:724d:b0:ae3:60fb:1b3b with SMTP id a640c23a62f3a-ae3fe82f933mr596168966b.58.1751995146037;
        Tue, 08 Jul 2025 10:19:06 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6b5e7d5sm925568566b.151.2025.07.08.10.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/8] pwm: mediatek: Introduce and use a few more register defines
Date: Tue,  8 Jul 2025 19:18:32 +0200
Message-ID: <1f1078375a1c7ef97d7b4fa3d1c59a16465ce535.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=T2A0/9nlYAI6voHfpJH7Rb1hXChRfttt5tHMxIzKo0Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVLu4yyc4ZEXE2Flt1EFiMsFvTCqvJ8gMPVO1 FCTHsNA6muJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S7gAKCRCPgPtYfRL+ TpkoCACy5J6jHwSO9DH+RD0l/OD8lEXDGK8YCOAIDTeaMsT7FeKoFSG2MyJlXwnLli3dQW3ZvyL VoOXPJCCJ0aJkzeVN7Ewln2X0lgZFKeLGV/nFbrTnMZd5YCZWTp5p0JzeTgkhNdYigCmoMpU++s 3LLDBYXcIjaQy2whOrRWaOrkBQncTwlk7HQUI+ml+UWU2maQd4h7JoPFqK2D/no6yZA0MvQ7eXk 65Ui3cG2q2xXZZLaS41bGK5mQon9EZm/zdbSNIEURuA1mgX3hAgX7WQNpmL9eIc2UD03ve2gSOX Ji5bTPbbhK+/e+Bc0eCXs8EFSs/bMvnaHGcOfe6CSKNDcPTi
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101907_854909_E6E9F709 
X-CRM114-Status: GOOD (  12.62  )
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

Instead of using a magic constant for bound checking, derive the numbers
from appropriate register defines.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index a816f136f39d..4e2a27b02c80 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -7,6 +7,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -21,19 +22,19 @@
 
 /* PWM registers and bits definitions */
 #define PWMCON			0x00
+#define PWMCON_CLKDIV			GENMASK(2, 0)
 #define PWMHDUR			0x04
 #define PWMLDUR			0x08
 #define PWMGDUR			0x0c
 #define PWMWAVENUM		0x28
 #define PWMDWIDTH		0x2c
+#define PWMDWIDTH_PERIOD		GENMASK(12, 0)
 #define PWM45DWIDTH_FIXUP	0x30
 #define PWMTHRES		0x30
 #define PWM45THRES_FIXUP	0x34
 #define PWM_CK_26M_SEL_V3	0x74
 #define PWM_CK_26M_SEL		0x210
 
-#define PWM_CLK_DIV_MAX		7
-
 struct pwm_mediatek_of_data {
 	unsigned int num_pwms;
 	bool pwm45_fixup;
@@ -139,14 +140,14 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	do_div(resolution, clk_rate);
 
 	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
-	while (cnt_period > 8191) {
+	while (cnt_period > FIELD_MAX(PWMDWIDTH_PERIOD)) {
 		resolution *= 2;
 		clkdiv++;
 		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
 						   resolution);
 	}
 
-	if (clkdiv > PWM_CLK_DIV_MAX) {
+	if (clkdiv > FIELD_MAX(PWMCON_CLKDIV)) {
 		dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
 		ret = -EINVAL;
 		goto out;
-- 
2.49.0


