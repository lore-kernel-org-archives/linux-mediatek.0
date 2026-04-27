Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F58BFF8850
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 06:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIIdNRJ9w0CAu5OepNld+STP1bHH56eIhQu2O8kdVlY=; b=XuMdNaibeT8zVoiA6K6DvctYpW
	ZO1iUr643uDtbwdWjate9vf+o7pCsue4WxOQHO0w79/wuQJ1pkn5lxLeTiFB1YPdwjZ089PSm06/Q
	U6Oz82FCNMXZvpqXJpCZFZuXgSGwKfXDv68rL/LTxgNROVi8/rF+BQL3h1NI49XHNeUoz4Jp91A+2
	CKHbOS1bbXfu+KY8gD0qrka3CI6589DB9xYrp7V0Bj3sYa8c5kcxNFPbvnqGl/CNHKFk7apgR2wbF
	BCFgrX7kWpxDu8IZS7gmkPf/bv6oDHRfzzhslm3t4DPwdIeXOvWwFBGGfteGpO6Za/iexsP4n6gSo
	kOn8thQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFHg-0000000GFTd-10z9;
	Mon, 27 Apr 2026 06:17:32 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFHe-0000000GFSh-1MU5
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 06:17:31 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so6027153b3a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Apr 2026 23:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777270649; x=1777875449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIIdNRJ9w0CAu5OepNld+STP1bHH56eIhQu2O8kdVlY=;
        b=RP561/yG/6CSPDRu0FJt46WplLRvwITHqYx3RABtmMh587bTBIQoKsJccRtDgj/1Jp
         q9sinLSwltTu0D3TIJlorNAEwmu/N10HMe0SdIapdHS0L9mKE/jC666DZmWNsIOHHLnH
         wXIRr74qbnzCnU/hA8FTTy8kpKJAloWnbCI7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777270649; x=1777875449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIIdNRJ9w0CAu5OepNld+STP1bHH56eIhQu2O8kdVlY=;
        b=Gm6v56EK1iR8sTJTILvsr8C0O4Ltshu8HZOG61ByS4M1IstQXokeSp+gM5No+x9Mtb
         kxv2/mDXAKQ5OfUU090Svb4e1joxlvwktx25orUKOPlwr+4Yu/vrQ8mLxHiCMb0K58Ex
         yR4gtfAM2LPzdPbSlBX96YC5tEG9ZQoSIoKBG3K7macEJBDohxtKTH1RKauMwy4TXD7J
         rI5j0Dkv2ozaF/2XFWb5mtk+ZNChlOOW2KHJEm7VV+sFq/1+EulgGm9MwZcGvJyT/J5J
         nwBopozoTwGUPK96RHg8MAXV09AYrVcv1WbMm+ImYgNFkwnLdsJweTgTbDsldpolaWBT
         6q/A==
X-Forwarded-Encrypted: i=1; AFNElJ/GYUSGwQdRfPuF5dXyRBXqsQEXTC1uDwXNibK/8jkm+zlkSstaySKiCwbiJgYBqaPfERFP9mWFD6/6jMXsxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjejmROwaKGfqMl81epxv6PG7ixBQQOz7w7go3BC9VHbfVhV1H
	mV8l05hBgA6Jaa0icZj8yBYHL3JWeEVYBGK6zOW6AG+dGu9hzaFM44pf2S2jOZ2vXQ==
X-Gm-Gg: AeBDiesxBH7+pIDXzDVpVGfstWbZBYkxbkmE0K72guMvRbkVf9IXP00VZ4cYIjYPCgW
	m28mdqj6vQB5V6NVV2NQCUIXkEYCaGLUp8pjhiPorQO6HeRFOASn25B5OdMm7Lj6yvUBQXb/jYt
	xv1ckQViYxFFBbdMMrl3vXeF3seGJzJZzwVW+C2eMlP3GBY2qhj2u4RH2FPSXwMk47ZKSxk9iZq
	/5boWtKfmFo35v4nAhQyHsLosYbkHlgObEkpF+WWqfOWfq2CqgypDK3NbkAZzF1EbYppyYnRDnG
	vt5Zj66sGwn1YMxLu0MCExJn3YZbick9plj0SUqqDGthQ0iJ9gD6mPkGGfh/Tc06rFfyB0G7hNP
	Q4x00/AzkGNye7FZprv0z54BB4ckA3pkSxdKFGmtmSwRtfTcRUlEBOeD0kCum3mx85crrtCNNML
	4DSJ9zPruIMdkcGl6rUwiTh1E+Mk+qyU2OjIDUZU7/1LUrDJme5ouUbH+tuUt8wpYizbCT7rzLD
	42/JDfl+pFp2WLuLp19bjjsCTeYNg==
X-Received: by 2002:a05:6a00:4b4d:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-82f8c93a983mr44134092b3a.48.1777270649269;
        Sun, 26 Apr 2026 23:17:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:8f3b:cb24:e20a:84bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea02ef7sm28824635b3a.25.2026.04.26.23.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:17:28 -0700 (PDT)
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
Subject: [PATCH] pinctrl: mediatek: common-v1: Directly modify registers to set GPIO direction
Date: Mon, 27 Apr 2026 14:17:17 +0800
Message-ID: <20260427061720.2393355-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_231730_503363_D37BFD3C 
X-CRM114-Status: GOOD (  13.59  )
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

Since the Mediatek hardware has separate clear/set registers, there is
no risk of clobbering other bits like with a read-modify-write pattern.
Switch to directly setting the GPIO direction register bits to avoid
the mutex.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Only compile tested. Accidentally fixed the wrong file when my target
actually used pinctrl-paris.c
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 3f518dce6d23..9c258e205e39 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -806,16 +806,24 @@ static const struct pinmux_ops mtk_pmx_ops = {
 	.gpio_request_enable	= mtk_pmx_gpio_request_enable,
 };
 
+static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
+
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
+}
+
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 	int ret;
 
 	ret = mtk_gpio_set(chip, offset, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, offset);
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
 }
 
 static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -895,7 +903,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get_direction		= mtk_gpio_get_direction,
-	.direction_input	= pinctrl_gpio_direction_input,
+	.direction_input	= mtk_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
 	.set			= mtk_gpio_set,
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


