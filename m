Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240E9E81DFD
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKUwyfTTneTxSGqUZGpPDlenguAqMHPKsbdYxdaEdtE=; b=ox6xeTpPI3Iut0XEk3/O1QsrH1
	nVuPOVpr+lZzPHOo0KWtjkj1KMhAi5E9Cf19uIIAIL7ZFLD/2US9Bn3F9QtrQ4p6ls8ZSBM8DI6UE
	oKR3oKs1Di4Z/xBwQMR4eSB20Cyz5F2+0Cttf8vnwxRoqGCwbOGzjH10tyaz8swlhYg6elrlYvE6I
	n4NKahPF190aA7ayvUUrs4R1IIDs6f69sapBYOnJsmzzKVrPBXuVOWa1KlV6gIf/CIpa9Y9PVYpCS
	3Yd/5Tzshuvy28scH7CBVNiJYf6AxlFantZqGBDpFfYBkI1Dz66K7GG6YPrgOIrDeIjlFbjyxYOh8
	YVrNcckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAQ-005vQ1-17;
	Fri, 06 Oct 2023 13:46:58 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolA3-005v7x-01
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 13:46:41 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50308217223so2667115e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599993; x=1697204793; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKUwyfTTneTxSGqUZGpPDlenguAqMHPKsbdYxdaEdtE=;
        b=jIbY/vm7JgUQ+A2XL92L7dNHmvbKJC5Ry/iaUtZau4glUD7RxG9F/B5UifmQ+yGsSz
         Cqg3irHy8AuK03QZmC7Sj27L+hI2CR6TTfpq0KLnT1f8+QapQn1iVRL5pEIwFWfxc6Av
         grRKzAxY/jnG0keni/3mk95L5pARk75zMiq2sDV0fDPASFMgf6jT6cN7XZyOWLDS6Ydg
         qxbbXzmJJ34F3Yb76f4jvd3x5Qrqs4Nkyh3EaWFxnICVOhrL2ZHFLbt650e1sCqKwC95
         202LMMIJXNp+tsOXHm5FXIS95wepFrhNkfGrW8C292Z3Vn+1U52KlDbHVKYjEFnPEHHc
         a+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599993; x=1697204793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKUwyfTTneTxSGqUZGpPDlenguAqMHPKsbdYxdaEdtE=;
        b=PLJ6APbkmctjxjW1DZgptvfCBI7WCLu5p1PomxY+dPGEdC/3riux4BSwxzvN5Ko+Sn
         NrA8m3lUoADJIH1h1CZv2sk2CpvXWJqqyTNavkQxilakqnpjqXxN/6Qt4qUlkvPmoM1m
         K4sPeIP8u3rbliM1SBVhVhsS+JT8T7Np0gjXgIU1cb6SWZYcY8+t/V+PHOadwgHi61KM
         aL9jiSw+idmRJHDrIIT2zKqNOFTviprHusjvME1o1NlM5oLYhxjR80coEjuELVTE1L5A
         NDtuwj/dJiq5LG9W88K2CKBCCe+nsyS0+Po/FN4bqDCms+LB29J1JbuXtRshFS+oTYN7
         UoRA==
X-Gm-Message-State: AOJu0Yxzjd0DbCNizqOOKTNkWGpowFAscACNuExEcgDo7fyyTd9yuDL5
	pi/5ZqtnSuv6i64fOR2cj42cSQ==
X-Google-Smtp-Source: AGHT+IGcwLvp1n+5FWSbw9bTwDxtSAgSpZp4HVrtvVLTsDkaltU0mqZDETpn1S5AIg0T9GnwoZL/uA==
X-Received: by 2002:a05:6512:280d:b0:501:bee7:487b with SMTP id cf13-20020a056512280d00b00501bee7487bmr8096933lfb.11.1696599992987;
        Fri, 06 Oct 2023 06:46:32 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:29 +0200
Subject: [PATCH 6/8] ASoC: mt8173-rt5650: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-6-07fe79f337f5@linaro.org>
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_064635_055291_04512966 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

This driver includes the legacy GPIO header <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from either of
them so drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 18cf84bb25c7..bcec1d9d790b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -7,8 +7,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
 #include "../../codecs/rt5645.h"

-- 
2.34.1


