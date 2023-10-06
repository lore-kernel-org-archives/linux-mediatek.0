Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FD2E81DFE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 13:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Asgb8OAKdQDCRC4VclzbwAu62WhyUIsTAbJjeqQexwE=; b=evkKxXhqH3izrIGMc+WAMf9PGD
	+Y3gC4tZ1ty7vhTVyKwK6rutI9Sf6MCDjsDVPnbyAJ5KhZbkGGW5njrspGlEQ/RRQOEGCHjy+9Xsi
	mZ1oAO61SLnPdpJclzsHDrDOPEvgTkbPWBTXAo1GR8GgLjpiJHq+VMW9ukBUdn17nbQ2reAwpHwLW
	iKk9JqGpOkvfK/mvR6tqgzIwV8E5tz5Y+uDmXf3/k+WH18SA7lZ8zn48X+uVtIP8xqiBSmeN6CPHz
	6L4uTmECK2Vp8z8Nlzw7KtniHZXLLw2mqgse5ejGNOa+q3Ndqjdm1CM57vrfNbdT4WYjEMNTtiGWl
	gGQY5sXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAU-005vT7-1v;
	Fri, 06 Oct 2023 13:47:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAD-005vGO-1g
	for linux-mediatek@bombadil.infradead.org;
	Fri, 06 Oct 2023 13:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Asgb8OAKdQDCRC4VclzbwAu62WhyUIsTAbJjeqQexwE=; b=OJqhBBBbCFNTcMden53DA3BJFk
	39kDdrHM9OT8D4eb2Vuzd1hy65qw8kbeLgvicckCKIDPVlOl9hLR/M3FphKu8h9b4JC40bOArWLQh
	sO2lEgAhTmTqmx/wXe6pIN3GqY9urc3E8e1uJHVTRmg2RwBZZywRdBIoOjj8N/y4gox1JymVXfSvY
	1up5f8kdu1jcIENQTRoWxxF2FVidOUEMb4GL8wbU16HaWhcPkAJlu41EVKSdUV06j9sJzqr1eedhr
	TvXqGtjp1zBq7VBmjxwUdFif4xNYxIBw/l7JK+0qGnTHybe06mqbsDRIAt5G7zxxhvSyT7PSmHyhq
	+J+eoOIQ==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qolA7-00Fbrv-Gm
	for linux-mediatek@lists.infradead.org; Fri, 06 Oct 2023 13:46:44 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c3ca6ff5a7so2071971fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599994; x=1697204794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Asgb8OAKdQDCRC4VclzbwAu62WhyUIsTAbJjeqQexwE=;
        b=LChYIjmU9hY7iRhqqOWm/YjcYrM/pT8mhThCBawmzxZLLHQc6lpt0gr463n3+btmPN
         MsM2G2T1jR8W9jiL5kCgRwrQAVv/IfydI2N2UWjDM3aJjb9gpFDNjqUaEcOxhh7NvLt2
         qCOCwIwW3kC+WYMMZDGSIqKM0ovYMaMVOdrstivzZClEPdjrwqibCrHnibyi3w/L79Ki
         +dbWZcJRb1oHHFp/hUJSwPGWTSihIGLN/iP78Z6LccVVKzOEaRllcqApKrQdFDA5emqT
         SKfLDueajD7LmZOA5WFp2ElrFvvCpRh3Mu8SCNh1ULMJqz+qO7AOHV8SAaYKq2hUImat
         IPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599994; x=1697204794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Asgb8OAKdQDCRC4VclzbwAu62WhyUIsTAbJjeqQexwE=;
        b=Rk21czUbLH77WD1JHAnCgPR1zLKOTb5F8yai8BGFyGdoE4TKWYc3aKkfAeKKQZ7Ff/
         tHavajY9Z9a8y7T6i9kbYm+xFkls4rTUuCr1iDtgsH89c2fCbZ2tWxZrjNrFDjHGnW0r
         lZRg9F9pvv65rdmD6Qy45xuFJPGkAujccRszuRua5skJxasotN5CeTweYFK6NIgz7n4C
         4mKxTGP/0BDVBBBsKxEfOpAUcZJCIEf7qJBV7fPEjLcjtLreAqWGW33Mzw+506nwl8sg
         WfcVQsESiGUNWTt9o8HMOqBcW6Nm/1KiSb3z+2an6Ntnb8HmlKIFT2g8oCpqHypByVN2
         q2iQ==
X-Gm-Message-State: AOJu0YyCAqjsUgp8xZI14/jB77L/1F7XdDP9NAmkeRJtZJ7gKbRg9MnH
	QnrZ+gA/SeY9DUxpyhZAiqfyPg==
X-Google-Smtp-Source: AGHT+IGQ+oeljBRtveNq+5wlJ3DdWNUKKe6FvbxRXepDt1efr2ZvhVToivpHhLNanf/lPPVIIHZ25g==
X-Received: by 2002:ac2:5b02:0:b0:500:bb99:69a7 with SMTP id v2-20020ac25b02000000b00500bb9969a7mr6257290lfn.14.1696599994019;
        Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:30 +0200
Subject: [PATCH 7/8] ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused
 include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-7-07fe79f337f5@linaro.org>
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
X-CRM114-CacheID: sfid-20231006_144639_626051_FC989F36 
X-CRM114-Status: UNSURE (   9.48  )
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

This driver includes the legacy GPIO header <linux/gpio.h> but
is not using any symbols from it. AFE has a custom GPIO
implementation that is not using the kernel GPIO framework,
so it need not include it either.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c              | 1 -
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index f12e91cc4fcf..9e86e7079718 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -5,7 +5,6 @@
 // Copyright (c) 2022 MediaTek Inc.
 // Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
 
-#include <linux/gpio.h>
 #include <linux/pinctrl/consumer.h>
 
 #include "mt8186-afe-common.h"
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 9c11016f032c..87ec39a5e1f4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -7,7 +7,6 @@
 // Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
 //
 
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/module.h>

-- 
2.34.1


