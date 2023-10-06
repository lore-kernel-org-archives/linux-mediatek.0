Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AC2E81DFF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLHdfqqmxuwlIGJBiB8XcSmFMMCFwMYGv/NG27m7YvI=; b=vYG3UUGjugZMAShXoJMjmfx+YH
	AMJUETeYapoPd3252hPMpDD0fvcq7tW3bIX/0+Dh4oE26H+X9vE/3balwzHyB1v/yPglbCmQcfmyV
	dmJdPIwQo2oOYAnFk+63EXYPnvCDJdDo9CtL3ZfiOA5SfudWkVyiDv2DNr5/XjWbcVIiyQgoGTJVN
	a6Xuc9zKokFgTMXYHbnHBUqiLINuPYkLEfpdkTM1sk20XYbYp82yIUc9qgWZKZGlr0t4lseG2+Bnt
	PYpoEIXSMFrnPfG1VOjN3JhiqicBoh2/QloK1PY08V/Sq3rTeoQDMi7Dzf7a2kC2QMqQ3YcBi1/EV
	pVyOxWuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAV-005vU4-1b;
	Fri, 06 Oct 2023 13:47:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAF-005vHT-06
	for linux-mediatek@bombadil.infradead.org;
	Fri, 06 Oct 2023 13:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yLHdfqqmxuwlIGJBiB8XcSmFMMCFwMYGv/NG27m7YvI=; b=SwfZkrpo7kZFvC8ld1G2Vu6Jt/
	iwGKal1375z97ZFgm8/+5SqaejbTvMeI+rS+X2LY3YRQ162/qoGXEwM/O39QVt2fMZ/K/8dWn5IKd
	9h5gSqqZ1VHKzuW2cR+4iPaKLfUa5zHjAD2XH1SruMXPphNoF96jZNSTPrOWeUaVckx6qeMwW2KXG
	Z/iPQZzirod2UrGhf63wYPdVVRX55lMFT7a5etWR2iC90jeBptUgy760qfL6Fy3Ij2Oz5BgfrnucA
	DB3irT4VbHQnkwaA0lpGNv167A2SMLKKMtESrGLTiZYPFAiXiDfq87IKxjoobDDIc1jpnu30oE+0N
	D8i8Tfhw==;
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolA9-00CfVQ-35
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 13:46:45 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50336768615so2828803e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599991; x=1697204791; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLHdfqqmxuwlIGJBiB8XcSmFMMCFwMYGv/NG27m7YvI=;
        b=AfdUEqkx3ihrtHXIjHwV8mH1mnJdMnPnsklCVbKpqxneyRjNpZVO4qpb0uwUQwteb2
         tfFaMPZBxgodF3ehKogu15T5TEJChYGGbmCUsLx5RGnT9I+A2BEOCb6kIpsu220oqulA
         T7MXh7evfmf4OutKX5LFvFZT4Pf3fY/bg1fxamDLsHMxcPEfjhNARBOOFBw8UiBfRLUL
         rawKULC3oT2OAoNqroJT55jvyV7ALUC4KO9IwiO+UKOQtgjB8gpwG8dApXt5Uqf/o+iV
         YhZEi0ErZmWkXC7dJz9nRknhe5z0TJe5RGFtprfuyP8BU+LewRNyFRNkxxDyjwsLwN1D
         VICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599991; x=1697204791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLHdfqqmxuwlIGJBiB8XcSmFMMCFwMYGv/NG27m7YvI=;
        b=YyNqjNPhaL6KWFElrBesehrXplW2a4KMLHasvtc/KBaYWTMsndF2yosFUm4EhFXxza
         FRZz5fZgl6n7vEwWop0OTiCnxtezb9Iqu8wDC8tFZUJKPFojdyodi3gFgMS8C0Rcros2
         e9DneOsRbK9z0SNgIKiyFSP2aJr23BwnBm0vI9dYXSiTMbKmey1gnwzyute8E5/srh2q
         FW4nf0dbVGeaUTqWBDoUaoudN6zwegnS/A9QkpwxdxGZWE0M0G/Kd4f5JRldAYY6Ty95
         7empK733ISsEh34vsfu6Vgm6FovLF4oUHMfk6FWyNvgmLWbxNxp9bpy+FacknEzb1Ozt
         1GOA==
X-Gm-Message-State: AOJu0YxdpMHfJgNjGv+IkD0aCxQe6S7s4rPfF0egg5uwwXK6cnfRaGqx
	R3UcRRIaDI1feZdC/GJOoAkH9w==
X-Google-Smtp-Source: AGHT+IHH6cMZMIc0p+3s1aNepbYLEIdwjOGFxWA8k3GZHEzIsKgLBMyNC5q7KJmT2KWbBpAGygbDMw==
X-Received: by 2002:ac2:5e21:0:b0:502:ff3b:766f with SMTP id o1-20020ac25e21000000b00502ff3b766fmr6194209lfg.6.1696599991178;
        Fri, 06 Oct 2023 06:46:31 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:27 +0200
Subject: [PATCH 4/8] ASoC: mt8173-rt5650-rt5514: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-4-07fe79f337f5@linaro.org>
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
X-CRM114-CacheID: sfid-20231006_144643_763284_B930D4D6 
X-CRM114-Status: UNSURE (   9.68  )
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
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index e502cd1670ba..0204b461e291 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
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


