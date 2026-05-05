Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77353CD342F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ca+XUMwON/y8z0Ya9sLBgz3BNFKT0t9cdvMxmASzxGQ=; b=A9z0E+FVYgQRSejSMMCLKyBi4T
	BdOY2Wi5y9cJt7vs+r59eYh9wJIWR+ZtZFVsAx5H703R/+9IdiU0wNb0VCffxBSNv6jd58sWSCu3S
	jKC04FeWGiwx3LIgTQw8ygzjHZGQ5rRUPJYRSOks9BM40t4CA3wF4K5S4rkPizNO69oUGtb9Lwx79
	A2hJC22Uqdvm3MlvHDYpS8OYxwMWoZRP64VMjl0FOsk3Q4F0aCJccjjH68BVYXJOPyRGL9PRPU8fB
	4+4DUIbZl599JR0/CH0yckCDlQHKss1JqAgNOz7wnWU0e/g002f181DnEPDPdHrKSlGx14rTQsGzg
	wt73OkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDCV-0000000FuyK-28ZX;
	Tue, 05 May 2026 10:40:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDCU-0000000FuxU-1ZdY
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ca+XUMwON/y8z0Ya9sLBgz3BNFKT0t9cdvMxmASzxGQ=; b=NGxANIaeKeoPFZMThlVfbw1phG
	ogRBMqqlWCWkf96WH0J1ElRm6qdYDKsZVqQQn/gIYJ2qddAsBhfncNIhf/Z07zvtrxvSo2thwtuvQ
	CGDIvMN1Ih6c1l+yYh3gNGOprNnLjSD6d8WCZLMwM/0lCwbgEUnwuevKICwg/r04lYk9cnHt/Ax/T
	z5HKeJrvCTbe9/dhbYc2+6eMouEWQdWKJ6GzkVSHovIRqRCmpikCSZJGO4qcqJ4LNfd8GfyfG618S
	fyYsqx78BYECUM+U/y0H+GjFV+DfS6RnjePU07ozoWQb226IKBVgz1QHn5WG3jax3/VsgmC/D3ZiP
	b4JB5bfg==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDCP-0000000DECs-2OSL
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:40:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ba21d32776so14716135ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777977619; x=1778582419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca+XUMwON/y8z0Ya9sLBgz3BNFKT0t9cdvMxmASzxGQ=;
        b=IsUMyHyFbX46oGFto2ijAIwdkPvWBl+uHLWLJsCrLWRuMWH+JlCRjws156x7TbIu5W
         d3N8vZYVhQHbzIEfh7MPcJMq3NvhFuQEZqmoJXz5VcXRnbWrP5zF8S7bX4WWt8g56bdl
         JH45ogzePsjMC+qLFvWAERFNiXP8NQCaSsznc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977619; x=1778582419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca+XUMwON/y8z0Ya9sLBgz3BNFKT0t9cdvMxmASzxGQ=;
        b=Ti/xqfVfJ0zKaWp3YDIWiF8vSfk2pLzVbIbxTwJMlMfuGY2kvwDAJ/dqvMtJl12bhx
         bhNn02h90paslWCZtfsVtOIoIyjyoH98CI1EZ/2S7utwnH8DAymGWSARRsorBeu2ooCy
         E5xczPDN6dsOJdix+gpfWHn9GU9YvJoOv6Wx5jQmV54yh/QsEn/F4T573mX07I0dd0f9
         LSTB7cHis4ogvhYlk0uIUt6mVR8FGWPXMvqxd5GuyhXY9TBDYwYR2D8G6SbpaY18F/2r
         Z2Tax+6M90XAylfN5jDQk8ePAEl0g3gvoh+YIk/nHOwoL7WzgDQuNKZEiH6c8q1c4lmm
         GDtg==
X-Forwarded-Encrypted: i=1; AFNElJ87alTmYJxtib5SD+MUsYUwJ4wjK84Kyaj9ZSWFsaiF7kWHyejyHGh2rDHL4KuLcyhI/wPzXqMWJ19hxwUiog==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWuM9o1GdHguVEUHeeEJ0TJkZ1DNly3OZh6lJRrA/FX02bY+rq
	8Ygs8SdOYOGX6g2pObZr8PeJblohz8xIHbVE0ojOk6IlsxVz4QtJUKHUfeGgVc55CA==
X-Gm-Gg: AeBDietaONLwOB6MKstzyhL8hCRExC921yXPLoAGjFAUtBiXh6WUuXZq0dH8ABTv4GG
	C862On+d4iIx48gy7b35dGJmtKNUK6RCDCCKmt1hsycPAFbhT6+StsRGZ2eP74Qr8py99fBktgD
	0LkXXassLK+esFNLzHih6BScwbKiBwlkTkz2BeW9GQSiALrGHLNdT3N9fPbtsRmaUEP9/fQTwVK
	LddvRqwbqcFtq8AQF6uRUCgosS3MpT36UdW8B+Y50qoxz5AJ8jRtPLAmgbENNIB2PWpLmTShRvX
	gHoqGdoCWxO9HCO/2FWFgbguzJJT0T9IpxMmKTBkGCVSflGJqTEAx56kbEH8YYvhgBZ4j2oFeVa
	OFR/Mnl/+K7oc98vzFDqHQsUe5eTPp+kR9ref9MOkvSjYhY3bhI6Cp0evY0nwqa8CvMEZbxot9D
	z5aalpJmAWYRWl5lXDe8tLrQoEM7wm0mzvZdHrhfjcGJQZQCyfvnUQx6cRJi1Mz+zXT0GlZVb1t
	TA0yYNhy7b0O+LSacc=
X-Received: by 2002:a17:902:d585:b0:2b4:5e65:5d0e with SMTP id d9443c01a7336-2ba535db45fmr22307405ad.10.1777977619585;
        Tue, 05 May 2026 03:40:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae1e293sm141015395ad.45.2026.05.05.03.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:40:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: mediatek: paris: bypass pinctrl GPIO layer in set GPIO direction
Date: Tue,  5 May 2026 18:39:57 +0800
Message-ID: <20260505104003.1811841-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_114021_733652_38D4E48A 
X-CRM114-Status: GOOD (  16.16  )
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

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

While this class of Mediatek hardware does not have separate clear/set
registers, the pinctrl context has a spinlock that is taken whenever
a register read-modify-write is done. Also, once the GPIO function is
selected / muxed in, further GPIO operations do not involve pinctrl
operations or state. The GPIO direction and level values do not require
toggling the pinmux or any other pin config options.

Switch to directly calling mtk_pinmux_gpio_set_direction() in the GPIO
set direction callbacks to avoid taking the pinctrl mutex. Drop the
.gpio_set_direction field in mtk_pmxops to signal we are no longer using
the pinctrl GPIO layer for setting the direction.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This was

    pinctrl: mediatek: paris: Directly modify registers to set GPIO direction

Changes since v1:
- Dropped .gpio_set_direction field in mtk_pmxops
- Call mtk_pinmux_gpio_set_direction() from
  mtk_gpio_direction_(output|input)()
- Updated commit subject and message
- Link to v1:
  https://lore.kernel.org/all/20260427021021.2049015-1-wenst@chromium.org/
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 6bf37d8085fa..23f04b24fd65 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -771,7 +771,6 @@ static const struct pinmux_ops mtk_pmxops = {
 	.get_function_name	= mtk_pmx_get_func_name,
 	.get_function_groups	= mtk_pmx_get_func_groups,
 	.set_mux		= mtk_pmx_set_mux,
-	.gpio_set_direction	= mtk_pinmux_gpio_set_direction,
 	.gpio_request_enable	= mtk_pinmux_gpio_request_enable,
 };
 
@@ -886,19 +885,22 @@ static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	return pinctrl_gpio_direction_input(chip, gpio);
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+
+	return mtk_pinmux_gpio_set_direction(hw->pctrl, NULL, gpio, true);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	int ret;
 
 	ret = mtk_gpio_set(chip, gpio, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, gpio);
+	return mtk_pinmux_gpio_set_direction(hw->pctrl, NULL, gpio, false);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-- 
2.54.0.545.g6539524ca2-goog


