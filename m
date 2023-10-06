Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10225E81E00
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbOUvzEjDlea4hheqP+YItFqmSWqoancs5Dg0PuH8cA=; b=RqfARPJ/kJSYA8LgH2MKo7vass
	Jwo/GRYgpmdvdB+2rws5iK+VVuhCeV8u01XcRSFpsaYduJS/FrEzCuNBpQ3j3BE3FhvC8YtEaRTRE
	Ml2EvWwvgNLb59/Mi+Yv9CelKYv2nCHJGn5DqzBdI+OP78pziBPbcIp1mSzcIjdKDL5vCG5RdR81R
	t4pqGYUqpkBrDE6EGDSYPBgaRUf8VxImYZBwflwN9UBAlGOunvGE6e9njwSwxeKejFxY/TsIO533v
	iLO+fOzcvu/czOISGLgsf/qAhLQsTgPbi0OcTHRyLzQwl2WumaO8l1/ZRasTLluJdcairOg+8S4iB
	PgVUZArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAC-005vFx-18;
	Fri, 06 Oct 2023 13:46:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolA6-005vBG-1U
	for linux-mediatek@bombadil.infradead.org;
	Fri, 06 Oct 2023 13:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rbOUvzEjDlea4hheqP+YItFqmSWqoancs5Dg0PuH8cA=; b=RjP4/7aFLcTNo7i5ExBxGh82Cw
	CFxjfpYVpRkoh/kHC3Abg/F37o9YyCB7njZv8/o08FQEYqg+mmn3nxeGtb8nWh7e17Q3Cl7Q6H/+q
	F+8yDYIvmQ9Jti48JqKKHwL1xOBNth9U5HkDGVW3axPUFGhhW5DRDsKeCmirsoqFj+Ywnm7fAgEZ6
	BR8fM51BcfI97004Rqc6IoER5XqUiQR3cqVyIKZRn/ru1cWuf0GDxDo4HrcgPSnBZTK9qc6U6EACX
	cwkSTfCtsKz4AepBtgZtF9Vg0Pj12W1yDUJXVl4xSA9nLAaeZMd0MqJFR3inKcY1/RCkLbtyrKeTg
	wVdkzgVg==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolA0-00CfUe-1T
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 13:46:36 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c27d653856so39273281fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599990; x=1697204790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbOUvzEjDlea4hheqP+YItFqmSWqoancs5Dg0PuH8cA=;
        b=PZ4+8ivF1T0NouBZGCOnyAZzwulk9GonMHlpDFhlUpU6LKnCIHCxEfWYVyn6tsesXo
         zHNtUHS1OdRSWS3OIiSVy/3C1QjW5bSF+f+azpLwRJ3ov98R9PdejeSWGn9niRr7vr3/
         mCm3Rv6hKkrMDDgNwAEQBrnIolosVJKMAcWyNOojBBzaw33nl0+0zl/kKHK210r+N+xX
         KOqRGr6hqvBy9leGPf/TosXv/r5pBrp4VCg5ORbgP1GI0Yd3vh78cmpH3wBEP9om+NEB
         y3zOr/RtJZC1yfCOZ4erTa0KNiUBmF21sR4MY+Cee3DP/fThZ2ztA5PQVgCLZaf0Hv/v
         nLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599990; x=1697204790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbOUvzEjDlea4hheqP+YItFqmSWqoancs5Dg0PuH8cA=;
        b=imHWx6AJ1Ktvhs2caKnle87FSctIHqhr2LrqXxlq6qLeiCclm+vsZHc5blfsxWaHsx
         HHlahqpUVQjVIq06bUBfMzXHClEO53cCkUG65PyuyIM84En3g4S4O/dfwZEsxyXpmW7W
         sn8JkZpV40RBGo2JOkhDZqLL6v2ufxISiymZxLxiwJ0M6ar53uHUJaEgMnkx09wFuPYT
         zA9Ct8PoYd9g+rKv3ECKgi288GLOE8C7Qxr4l7D6TRACyhqG/BUd7G1Z+HZvd7aclrxS
         C5oEiE29F5gdkAPphhhDG+JJPndJNNwwSfeDpqCAeoCBfxwmffEHL6ajVwNWNKvrkfQ8
         Hnzg==
X-Gm-Message-State: AOJu0YzamG5b4Z0yi1bZTREFaMPR40iqWav9S73z0VwYrcat8JnTSPJg
	7w9s/ER7vQxoJUT9rujN7Mhy2A==
X-Google-Smtp-Source: AGHT+IE03cY9cbfFat4D3ognOlfRjSknFV24Pw5RSzWKwx+wwbMMYFomv7Z/+zEYe9XkBY/RRQgYGA==
X-Received: by 2002:a05:6512:3e0d:b0:504:320a:b420 with SMTP id i13-20020a0565123e0d00b00504320ab420mr3957398lfv.17.1696599990012;
        Fri, 06 Oct 2023 06:46:30 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:26 +0200
Subject: [PATCH 3/8] ASoC: mt8173-max98090: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-3-07fe79f337f5@linaro.org>
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
X-CRM114-CacheID: sfid-20231006_144634_285184_A6EFCA9D 
X-CRM114-Status: GOOD (  10.53  )
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
is not using any symbols from it. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index bfb2094758ff..0200da192116 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include "../../codecs/max98090.h"
 
 static struct snd_soc_jack mt8173_max98090_jack;

-- 
2.34.1


