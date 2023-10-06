Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A4EE81DFD
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 13:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xkMTG9p1NQ0LVgSR1UXz8ORgmEVrpeNo+lHyOzhxw4=; b=ZgJD2+BQTGHKJItVBkl2Qza3q/
	EAUEcpHztoddo2IX07xiclA/4gdTMkdDBAZD5B2GPp+2vjzt++v2TMbUt+Ne1sYMCPTxgIVyVxgVG
	ZTOmi4LUpFpdFYt4miTv4CHN9Yk2EJJJtvIigNZjdqoM3Uyma/0QoKMKSdnaTMXkapu5R4cZF3HQG
	bL5ywAx4nwTN033XQtGIWMYfSuO/2rNO1Zex5wTvw7UMfaiznb3xo+y0A7Et82jyCp0tkr7XQ2wLw
	/UqJB0HF8PXW5fkX07UELhYcal6tkWpf6QadXZFnE3TQAhis33enJ0xbE6PDG3AAo9Uvtad5lt+WV
	cc+ihVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAT-005vSP-1P;
	Fri, 06 Oct 2023 13:47:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAB-005vDk-2O
	for linux-mediatek@bombadil.infradead.org;
	Fri, 06 Oct 2023 13:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=4xkMTG9p1NQ0LVgSR1UXz8ORgmEVrpeNo+lHyOzhxw4=; b=Xo2b+XIpwqnquxzJ58Xzi+2/Zy
	gioCi2Rw//LbYleqX8k6++mCmJV+tvBrHFyZz6PFEBEFkOTBorZQUbWVQzSVcXYe9RChWAWAO7lK5
	Yrl9Qn3GK92/Vj3+KaRaOAthn8T6kUS1dsH74ta/eNUiuaWywLQ7pjZzNV7svINKV7UudTfsL7fj0
	Q27ragtKbLfQaJwGHdlFbcBHbXmTG3MRRcGt/AxlTj3lN5ugLqr+Aho4S6m36K/YbP2yaqou/ziYk
	Pf1z00nhOey+qnVe3X65wAWNKNi7gda04OXHUKCQZyN8PC+PM7MNg0eioW0W6doZ/8X41eeoZ7LhD
	PnLpppFw==;
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qolA6-00Fbrp-Q5
	for linux-mediatek@lists.infradead.org; Fri, 06 Oct 2023 13:46:41 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5046bf37daeso2812100e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599992; x=1697204792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xkMTG9p1NQ0LVgSR1UXz8ORgmEVrpeNo+lHyOzhxw4=;
        b=aASWIxcesTmDqEd4S7ETnOsC9zN9VC7ZWbx75AlglyhZ/LDERbvDqC5AZLptF2aVlz
         CK0IOSHMky0R7oN8AfqQhvr+lQn2GXQDVXcvMk67VlbbAns5B0Dy8eOuWgC8D6FbhOze
         IzxS0tzQ1msSXRyiHO+l2ONtgvSjL6KP3o3+Gqc3iKQbmr6JJ80vK/jCcURtZ2Ia8kQO
         2xpT+ZeYsgm0PCnnrdOlOfVLtUpH6WINPx690gQh7hbs3vyZOr+v9x7EKR4Ilw/hjPgX
         J/U/m7t9Gkww8xryeXL5lbuSxow9hjeZzrEz6Jc6xmMhoSAb4NX60e1TviGXuPE8fA3b
         uP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599992; x=1697204792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xkMTG9p1NQ0LVgSR1UXz8ORgmEVrpeNo+lHyOzhxw4=;
        b=qN3Arzuirbokw55GlIRVUwlPnLq7klj4qsmCpgWNs/dP6qPo2CNNOJ+dZxZm7yJhdn
         3fALPQylgxdL1JICbEXK69EaETrraXp+J099C9KlDlEnLf90KpcPD1RgWXPzgaMwNAkK
         VKM2PIP9ahN+jb5abccZorcsFMK+EinRjOhGlOUhaDLvaZd/6YLqC7jd4t21QX/VdCKK
         skNhiKcBxBH2/IctDIPgIErYuWgjxaO2uyZtLBWcuFm4/WUZfghrNruRXLu8ANMvwv0u
         ymZLbqkfDv7CuN3AtC7X36F69G9qyG0sZW6gKvsLUR/VqXvGkVviFQFBIVVxxaUzjZ68
         aXUQ==
X-Gm-Message-State: AOJu0Yy/BJp/piA3+ZClODpQyGVM2A7uhoX/a9rOkcCs/YH4A24krQ/y
	IjbPCqki0TMw4d8PPAoz6YkDuxeWhghxldIrNsQ=
X-Google-Smtp-Source: AGHT+IGJYZb0UTK80c9PKT/6qzBCUPzMqh8bJnRydOq6QDikSosdvO3Bu1DGtamtPk12vFlTYj1sEA==
X-Received: by 2002:a05:6512:2811:b0:503:257a:7f5d with SMTP id cf17-20020a056512281100b00503257a7f5dmr9257925lfb.31.1696599992059;
        Fri, 06 Oct 2023 06:46:32 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:28 +0200
Subject: [PATCH 5/8] ASoC: mt8173-rt5650-rt5676: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-5-07fe79f337f5@linaro.org>
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
X-CRM114-CacheID: sfid-20231006_144638_920866_82C65666 
X-CRM114-Status: UNSURE (   7.62  )
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
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index ffb094284bfb..351b586e01b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
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


