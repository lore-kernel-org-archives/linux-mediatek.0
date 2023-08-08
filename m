Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4B0C04A6A
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tJ6rclTR0PEh2oroSnTnDtEG+/lNahgfPTnucDt2ik=; b=yNjoaEoqjJSzz5YNoH6ViPgGWB
	a9N1pPPBxxWvjefIz16/CvMG83Eoc7d/1LQD+xNc9PiFXXTS8e3gBB4G/LkFLupB/u21+rkXPSmQg
	7xYsLPsY0sjLGVBOJHS8IEEdTioOd5Q+TC+B0d7j/Wim+ECFkTRXum9HOcE2F2jSjYOzsG4NtPXIU
	RZKboXrgo4DgdQm89moLQ01hQ5jrnDNXwqkqjjK77ujvhaEWGvk56GSOcleeL9NxmJ5pYXQbC8j0a
	aewbQ7heaTcMQE3KZyZk07pzL2R+gHCsEH0iH9DwI9/KfcP5pNIDZr5Kb3Vsh64qKHuz9PiOuR4ML
	ttn61Krg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN35-002glj-1p;
	Tue, 08 Aug 2023 13:46:59 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2t-002gcb-0y
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:48 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso87734581fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502405; x=1692107205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tJ6rclTR0PEh2oroSnTnDtEG+/lNahgfPTnucDt2ik=;
        b=jZyJ0XTrTpmi6X1ST2QkG7n282rfe6gepdyagqQQyqvCBat0DGwAz+5+odnpR2eVJx
         rwr7dx+AK9/S67nw+fJUPokFzx0uxfVsctfLki3hqkdwL6AT/S9DDD/tjMimwPKTubwF
         NSk/7ysJwsL5EsHBRb8Lfj9i8/N48UCLU0wSGvdU2rO7Jn8IzCUI16I6Wk0zfTeiUB2o
         zg4I4MhBGlJiO/Ud2nHPMamPq3McB74dVZ0654cn1+jKVmbkmq5iU9mnnpdt5Be8P7fV
         mo/blrazziCYaGqvrdaWDSZLM9O3wZvaCAlXYFisJHFxYALn2xuXI5UC5qMiOduKZrPL
         UvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502405; x=1692107205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tJ6rclTR0PEh2oroSnTnDtEG+/lNahgfPTnucDt2ik=;
        b=GBt06nJC3tXGBY59ND9rKn6zvH/di+PcHDFaf+TqBplFE+yEW5RUsqumXs6tdcBHNW
         PGWIpumWOPv8OctplglVAxTl00OpvdtCLvFem/1fTfpz8KAjD9xWquFoyBGVj9kZ4MnP
         xlz3po39X9AnqjFVVdVMrgvXv6voz8XkwYQXhMu5pSsuC+DsWi5qC27akF8xTp1X4oO/
         Cl7QQtyp5tNwzejZBNAXVS3XEtfRoQT3QN7GMUGh5dd5rRm0vg8tgaTdyJRFUOL1OsGl
         AhFEBpuJyqxNPMD0f3Of1E7lj/r0Y4s1XAUjvdd4Bj0FjD3fOPA7CxPWF5fghGR+mBbf
         Rmow==
X-Gm-Message-State: AOJu0Yw5BXtB45NrW1bNkSBhzjhgFJ6e2D5R5hsLH2aNKYwnIJJDX6nV
	bHYXmtAAwEwW9uLv87fe+sahQQ==
X-Google-Smtp-Source: AGHT+IFYJ1tDnISQpqIa3O1xFstJdgHXSmoJBbKAjvv0Omwmg90Vc69nrF9vgwo5e9S+tacn/hSCZQ==
X-Received: by 2002:a2e:9b01:0:b0:2b6:c790:150a with SMTP id u1-20020a2e9b01000000b002b6c790150amr9582164lji.22.1691502405476;
        Tue, 08 Aug 2023 06:46:45 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 15:46:33 +0200
Subject: [PATCH 06/11] regulator: mt6311: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-6-939b5e84dd18@linaro.org>
References: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
In-Reply-To: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
To: Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_064647_345272_0148DF2E 
X-CRM114-Status: GOOD (  10.27  )
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

The mt6311 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/mt6311-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/mt6311-regulator.c b/drivers/regulator/mt6311-regulator.c
index b0771770cc26..63a51485f2cc 100644
--- a/drivers/regulator/mt6311-regulator.c
+++ b/drivers/regulator/mt6311-regulator.c
@@ -4,7 +4,6 @@
 // Author: Henry Chen <henryc.chen@mediatek.com>
 
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>

-- 
2.34.1


