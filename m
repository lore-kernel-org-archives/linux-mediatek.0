Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F81E81DFD
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbIwSXH6FjrGWEWkB8T6Lc3o+IPSoQUzJoJygEsVP2Q=; b=lQXwkV3J5cvUp1em0P2BX3BiBB
	uLFCllTRxD9lIP5Nz+2PeNCGUYSfcsr0A+WAQiHowjYv9vChCIEGrA5idf2Hx6KuiKUAwrHlgqSdd
	JB3D6/qdtAOvs0gj3fzt2IvnuBUfXWCHdcWRrK/Hh92ZufNNTOlhvcNgKa9yoaLDYqo0DXF82120x
	OdlIz3iHT45egBi2VSLEQWij6JcHZTchy9+OvLma8749lYBlj3Wz4h6AUit7Jl37aGqRGs20gjZ1i
	zxSXRiihce2KZJU/EpqNzlVc1aDHcLOOH90roM+/Lda9aFq0TmC6gW4UIICI2dxRzOsSY6PlWmW+h
	kTsS01Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAW-005vUz-2g;
	Fri, 06 Oct 2023 13:47:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAI-005vJs-0B
	for linux-mediatek@bombadil.infradead.org;
	Fri, 06 Oct 2023 13:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LbIwSXH6FjrGWEWkB8T6Lc3o+IPSoQUzJoJygEsVP2Q=; b=Re4eH/XZaCMBN0X/xOdvpbmnw+
	wqkJJV5AAuxnvPVa1HxsjWI2Hxyd73OQz4AGHthKgkk8LvRqos9l5Dj1FgDd+ej+0f9SQu0pIWIyP
	Z9G76dQMPDDKq7EMyh+RHaMnzmpYysumm1UFo7vP+TxbZ1UpdHfiNG+9qB3B/P68+UN8wpODzHx+f
	Byp96j2nsji4GaxFzSwkMq0G2w2txcW9yRMRpBeaqe4r3BdI+Tdlh5RMEPAzGOlczM+hHxSBRO728
	84IgePqIC6bcY96x+1tPNovMJTax+ti92UDcKg4EJSk9vkVlkfmxNJMfUlU212xMTFYFLFp78sICQ
	fsB/U5pw==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAC-00CfWN-2A
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 13:46:48 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50336768615so2828875e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599995; x=1697204795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbIwSXH6FjrGWEWkB8T6Lc3o+IPSoQUzJoJygEsVP2Q=;
        b=rlD8yuEod1C0zuenOVOvVYJVxNzP1shghwmVpjPfbbBUiKTe9pajmjB2UilxpKZiLz
         BEN4Igubl5aG9pmJxWMzjM13E972J+togjFbXhHTRO59lek2+mSAKOIT1XyoogbrpqDl
         /1MQ8d8EDNOQJJNWXCc+GQGE1wlCkNTPJs5i0BOJdvofVNujJuhNhS3l+PJm3wxqJqqx
         mKkl4VjY0QUfc4UGhWMJ0WpNs6/wQ2FqbF5REYEAbWZK3rrrgNHcJP719sHvpwIIPEyt
         7lTHliKw4j0FinQ3qGmcCemm3K7hZG9SeB9mki4f3OJguRZG8g2R4zQWSezwdMgD8u5O
         /UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599995; x=1697204795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbIwSXH6FjrGWEWkB8T6Lc3o+IPSoQUzJoJygEsVP2Q=;
        b=wXpc6u+zw3imnbh+i2FAaolBR8qysnj7gPmh9olXxJT2zuiX+ZsSCInMw/f+Va9wDB
         EhSKblzUtbbK2PwCrmTgYQaUTB9j5k22I9F8G6oyOnpX94V9kcN0m3mZY9VAEKhoY4dc
         T6NUTyRyYaofFT7jBr69eOlU8VDa6mjt+1ZcKovDCk2iTgohwRm2t2ttZIfACJaoWOtS
         34SUIyGOB9LvFt1iM/WXvSHh/t/LLRxKgWuJLCGG/SDzCWv2tWfgaA+iVwdL8Ll+corv
         jvCYZgwFgG2e/8Fqarn3xf7HGMUxvip43G3Qd7EZTKJgng0/IfzMYAKlU9Gnoju40mqe
         8R3w==
X-Gm-Message-State: AOJu0YxcVWQtnxmWVfNFMCoW5I/s8OxbUxE0TD34c5Bqp77GvVxxTZV3
	dNZ3cAY/LnTqEhdXIBnqDxp7Vg==
X-Google-Smtp-Source: AGHT+IFoek3UspuoDg2fClJUEjov1EeEFdmzeEDd5y8Kje8woAv95XAU2HD1vvAKiP/TapL6Jc3a7g==
X-Received: by 2002:a19:5e06:0:b0:504:4165:54c1 with SMTP id s6-20020a195e06000000b00504416554c1mr6124350lfb.7.1696599994954;
        Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:31 +0200
Subject: [PATCH 8/8] ASoC: mt8192-afe-gpio: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-8-07fe79f337f5@linaro.org>
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
X-CRM114-CacheID: sfid-20231006_144646_429159_5FF969D4 
X-CRM114-Status: GOOD (  10.51  )
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
implementation that is not using the kernel GPIO framework.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index 165663a78e36..de5e1deaa167 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -6,7 +6,6 @@
 // Author: Shane Chien <shane.chien@mediatek.com>
 //
 
-#include <linux/gpio.h>
 #include <linux/pinctrl/consumer.h>
 
 #include "mt8192-afe-common.h"

-- 
2.34.1


