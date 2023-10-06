Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068A4E81DFD
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iyIWSI35ioF9P5y4BP7rlGwfh5ltYmHyWesLeZ41VQA=; b=fpGzGghhuvPXjW
	kooijPgQxfSbmAXNpnJBMlf+Jrte/1Zl+mtvCFnRaXYI2sMJiLMl2d9jGQIv5SJLiXGpBTAB0vpjF
	VI5QEeQO0wa49/dBCS7R1Yb34S57nUHs9BUFTL6udFOriS1hkQ9A/8c1kd5HP27++s8TGLb+3C95h
	V5yD7++j1kxFDAHy/DsXqbD3WzJEhE7O5bDeOTS9Fl8rXWGAFJv3HzD/mY1wMFilUeEyxUruW7CT3
	71G5QNPzljPoIrJoebhktVMVskatBhm1YdpHvDJPxdkGiewtCDLF7PwBO1D3qqDj22xds6muxbscQ
	yXm+SXSSmEgoc0n5LRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolAB-005vEr-0X;
	Fri, 06 Oct 2023 13:46:43 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qol9x-005v3h-1t
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 13:46:37 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c27d653856so39272721fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 06:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599987; x=1697204787; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iyIWSI35ioF9P5y4BP7rlGwfh5ltYmHyWesLeZ41VQA=;
        b=es58k5ePf/xKp9N06utIZpi1msYBrNTJKaQ3hqJ8tLwV95EUzbt3KVDHRsFgfOT2nr
         V3Bp8AKR4S93NSNgx0DqaJYD50qNVfy6iKeVu/jL7/RVMbpWAxB4iE7DDa8qdEmUm3c9
         R+OUQb9fmTrjJMD8s9MgCFcIFHnhCmCWp4l5SAKNyAPOZKe6JWoJnbcjhJB3QmSq5D01
         TAwiOp0zbOPHdXLlYrB+hg/1F7puy6jLF9nVdnjk1zGtht9mPbpFN0kM1Z0EZ9xKoYRL
         Q37z3XsNhOvogBv1DH23ImUA3exzEqxTAmg+hmiXApoye7LAknaFX6k/l/rwn+LRdUsz
         RCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599987; x=1697204787;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyIWSI35ioF9P5y4BP7rlGwfh5ltYmHyWesLeZ41VQA=;
        b=FTkqWXOgNmQFmusveRjGkXGc8Wu1zgRJy05y+lIX6jJuGC3W/9PJxQkrVVRetnVJus
         oNNldDtlZ9x7MKPnO0OItKbC80e0aAh7cmQZSrnNLIi68iBBtO1mCb5HdyCqaLar8KQ9
         owVZxN+GqwfGEM91HQb/ACZWxaOpnRYt8dVtZWgF4vkwcRp5ZYBpG9fyDx+c3jEdzqwu
         7w4TdNYr55jSr62nGi8O83keDX2i8UwDI7q56yUvhheZC/CbA7YJEzQzdUvawFYHZiR3
         1ATgXb7ecmnJnUmDy5NlzzQYZQNR68ido3Ma/yxXQD+lklf7KvouUJPe12YG6ZyS0GJo
         oO+A==
X-Gm-Message-State: AOJu0YwYDGlZuzMZ9rPF3pnteRzPlyK2zc+nob2yNyyr50p9Dn60Q0oC
	/CndsoXwIjoGtgFoVnegC1YmvA==
X-Google-Smtp-Source: AGHT+IHGZbYm5OyG87d6TAKeG9ICFcG1L5jBwIGzi+m4DbZK7DRyNC9xmJcbHkphJg8oT5Yn4KFEDw==
X-Received: by 2002:a05:6512:313c:b0:500:96dd:f95a with SMTP id p28-20020a056512313c00b0050096ddf95amr4307682lfd.24.1696599987078;
        Fri, 06 Oct 2023 06:46:27 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/8] Convert Mediatek ASoC codecs to use GPIO descriptors
Date: Fri, 06 Oct 2023 15:46:23 +0200
Message-Id: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK8PIGUC/x3MTQqEMAxA4atI1gZS/xZzlcFFbVMNopVEhgHx7
 haX3+K9C4xV2OBTXaD8E5O8F7i6grD4fWaUWAwNNa0jGjCyBZXjzGroLQfcOIo/eUVyoU2pI+r
 jBKU/lJP83/d3vO8Hdr86wWsAAAA=
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
X-CRM114-CacheID: sfid-20231006_064629_700565_A5A80F9C 
X-CRM114-Status: UNSURE (   9.28  )
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

Convert over the Mediatek codecs to use GPIO descriptors.

One few-liner affects gpiolib-of.h, I don't think there
will be conflicts so I suggest that all of this can be
merged through ASoC after review.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (8):
      gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
      ASoC: mediatek: mt2701-cs42448: Convert to GPIO descriptors
      ASoC: mt8173-max98090: Drop unused include
      ASoC: mt8173-rt5650-rt5514: Drop unused includes
      ASoC: mt8173-rt5650-rt5676: Drop unused includes
      ASoC: mt8173-rt5650: Drop unused includes
      ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused include
      ASoC: mt8192-afe-gpio: Drop unused include

 drivers/gpio/gpiolib-of.c                          |  4 ++
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         | 54 +++++++++-------------
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |  1 -
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |  2 -
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |  2 -
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |  2 -
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c        |  1 -
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  1 -
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c        |  1 -
 9 files changed, 26 insertions(+), 42 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20231006-descriptors-asoc-mediatek-01c3ff4005db

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


