Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48577C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=; b=QPw/96euz7s/iAomQx/Uyhil47
	7k/kvS2kC8RB+Li6pckovYnmHyarPNh1W2tGzDxSxnTcBn3VOZ+vtOCeMRlDkck5uZOdNAueVQ+70
	qXObnpbrY9hnYhdVZzt8MZsZnyORFeAuwFmsgzgotBN4EmdG+pJ5RCkIPDO+00nxFD5x5wYAyy5PX
	mobbRB0fZy0ezouP9LA/KdzCTIpXV2RNvd9yqvgutqakNLVyxEzaxxCox3LIw5piX7bU8XZI0xrAt
	KCvuvbpcWqy562B8i/SlNnkZaSh/SWd3U2QqWDQWKT5vf9M1ZSbBsdQW/5+cS3FLe0b/KsCguJyDJ
	ANiWAj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7iN-000000099ux-0PW9;
	Tue, 21 Jul 2026 10:28:43 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7i8-000000099i6-18CY
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:30 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cf52d15d88so27279795ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629707; x=1785234507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=;
        b=b4u0rX0eCAsVt4WsbfYOl2H2towWPPUk0DyU7C1XzFf3eVGlV0atilBs0FacaqdHSz
         /ifUJPxdSoBCaJTXdhCdZODuCQkTJMBR6Uk6jVgIS0WXlQP4fLYkFE0bGnR4q0llMf/V
         PCMKAtklIBgRg/ePskqJrCWRtQIAUBiKoc3RXb2zqb9tI+514uQYyJ3spfL5gAFEdDq6
         4V5guzACqZ3z2APBMY+/UpZmqank5z8rA1wO4z+nWwuztNwP7qYUGtW49ueMaFXoOw63
         0yl0mOcaXAnqPqeUfkJB03MuTwkXdZ4U5uVpDRP4jNOyzlKjMCxEAVDTbbyoX3VbqnuE
         ZXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629707; x=1785234507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=;
        b=gVwFaa5qtlsk2/wT5OZ6TL4SnFZKblIwyRn1stNsxAjCVJCEgqD8sBLKvZPYJizJfz
         2JQUvwQTJj0tEiaF+/oxvMdDdVHOEL4vi95aLgx9t0qAhq5wt8elM9fRQGmHHWcrOGYT
         sGWwVOtg6kHnyhRvacgnUIBavXPxXmh87WlsW/LEBoXCZh/L5akI4myDeUSazV+oKLQo
         ZeHDDhW+R+HlCb15naTTA8MI0uWOl/KJZIV14LzrGD765Z6UwpsZbrt7chrshRhcm0yV
         h9/DQCjmKX+5rE+U5tOZVdxXd3SpLS7JSkv8QuyAPbPVf4XF3mFacmHNdMJV8HcjFA+c
         xO4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqpH+feBvXezMFWVDd6sfJOBJHvAihTYV2dVJlG15ZSO+w1jVUJ2rWG9Slp1QqouP0ja0nTVGgLroPg1rva/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYT91xrD39xYxazQWvJ7drIaKmHMnmZ0bwcnCTY1SlqXMm6Z+4
	9V6jpiL0iKpuQ7KObmNHmuR7hCKw9VwmzdfWn87NVWMq/ZQCVIjvL3dG
X-Gm-Gg: AR+sD11TpsWh2/ainLGpkzIe9280Rf+vhgGp4TR3f2GSuaJL6DP8ULvh3wZ6RPp9EyI
	zehPf4uiHUtYXBmDe6LYIWCUf910qI5P78jHe6zU6749GAyWNfsS9HUTXve64OUPDNG/9A0PUim
	o9Qs18AvQILLso+kSMsckBjm6ZROyGP6JBeBUlxoVWOVm+xlPPwjSJb+vxdrawS+Lp2rO49o9oq
	d1scfbGHS4wL4L5pKic8QSMgXITmv52PUQbJ6uhAR+ltSP+yFQRHXOYTwUSbGBvnqAo1GItBiKU
	jjPmP+tv7HKXL175jtv1dqEkH7G3SC5OAQ3/OSoHf5ZsOdFRvLXwBCtkFEaGghThMFFzQsZAgB7
	ESxTLuxV/cvK3+xP4Z0vXgSkLZ/it2O++2Hj55LPHNssm/fokh1jmwLeMsHkPiHjbDxdA74E4bi
	FJfbsUc5RDTJCKr0w8yzBLDYHjdKYqb/Fxluha
X-Received: by 2002:a17:903:1b0c:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2cf3496bdf7mr187813395ad.25.1784629707513;
        Tue, 21 Jul 2026 03:28:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 16/29] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:47 +0700
Message-ID: <20260721102600.523199-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032828_361798_7DEE8F11 
X-CRM114-Status: GOOD (  12.87  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/peb2466.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..5a1ed02abb84 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
@@ -1704,13 +1705,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1717,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0


