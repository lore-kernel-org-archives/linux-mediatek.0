Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEECC00A8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rTcKZO6NcS9zLgdR8p3dSmC3zXIR6VRO4KTY9FbrWgE=; b=5A8AW00ORF1TVAXkSs7DFTi2jL
	j7laZljuJ9bw2BfOc8+u+3j+D7NF7el/Vg/wXnRW7evV8zcq9rDve17xO08gwUPC0YGaY89/6ZJM9
	r7GYNooaIQhVkZ5ZKh8qNQ9zn+8bw3vsY0lbVXpM4VoWz55dhkFjUHNyxPMQy2dyWI35EdKD8HiwQ
	EDlxW1Cv+sSqozglzrEXKCM1MVSSumxyPFdrKJn5CFfJGWHU1SN92mKO/EFfdRsL+bYLsIegQ9mp+
	BOI5W+TuD7mnCTI2pIjIrLAHAro5DmjZU3/cg7lJ7jT0XIuHi/hcDKtEztuLIKk20/X5+hkY4jYTM
	tYOgaYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurdu-006w9I-0n;
	Mon, 23 Oct 2023 09:54:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurdr-006w7w-0M
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:54:36 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32daeed7771so2082320f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054873; x=1698659673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTcKZO6NcS9zLgdR8p3dSmC3zXIR6VRO4KTY9FbrWgE=;
        b=Ucrwpi39rqi4KqVGM34dsLg8l6oWjOTYzj2b9Dkdfd95uX08wwSUVz0VHdNPKp2qv8
         CIY9XgZ8Hww0awYWw8lBcbrpNrOYOuHiNXTyiSieAXnR6pfPs4TIUgz4GBo/1SRTjK5C
         4k0deArZgcPAFaEcEKIQVVoiVdHXYPExpPdFmNxZcz3jxg7n+YZauIYcF24Ds8UY5yNs
         LIli3tWFmG70KduEmDRJEzatjjV6tWgWPLUJmCDu1bgV9FVMOJvWI1kgBR2Yry+IjJq4
         urK5Qv46lh4sDn3PFNcSfhQogf/O91ImJ+JSQK6QFXJqsAOFl3/7qX9hfB4xoYc8v6Gb
         LFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054873; x=1698659673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTcKZO6NcS9zLgdR8p3dSmC3zXIR6VRO4KTY9FbrWgE=;
        b=JKjHLAdcNdfhAcccfgC70L7XNTdadHxwYglUYILr1MTSSG3R621lhrKFRrsQH8ssIr
         QwgLQshS7UifMdvqySsqQYGg0oraZX1/NVv3md9L0QlskvUnuvtgcMbr8+PUIWj2+mYm
         vKWnlYB+kcE2y4bkhuZbL3XXAxmZrfpZMyVOYpMvVK6CeRpxWj9a9gJSGBhyduE2cG/9
         DRajR9YkUFlQb/jNgkxqDAQkQNbvN+w8SPZT11dYuElFN7hxh3hT24vSR9C2PGcwoaxN
         HPywYP79JOMWnOufsTSYs64bgqk+kXM2JBneZOgx9xeRIPu6Np4f8rMWxcOOKXyEv/xr
         wt7A==
X-Gm-Message-State: AOJu0YzaiFY2Fr9LYDaXxbK107kWu+rqRTHwc5NHwAQowiblqTUY3xmX
	G4/PlYVi8mXYZmEDlnlytYLvGg==
X-Google-Smtp-Source: AGHT+IH4YMgo74ZZgvJQJgKdwM3SfC8BbUD6h8XrLpB46b2XDtd+ZKDWDharijaoUjIIgua9r87kug==
X-Received: by 2002:a5d:4ccf:0:b0:32d:8cd1:52e4 with SMTP id c15-20020a5d4ccf000000b0032d8cd152e4mr6670616wrt.6.1698054873279;
        Mon, 23 Oct 2023 02:54:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 00/17] ASoC: fix widget name comparisons (consider DAI name prefix)
Date: Mon, 23 Oct 2023 11:54:11 +0200
Message-Id: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025435_160746_0921CB63 
X-CRM114-Status: UNSURE (   8.27  )
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

Hi,

Some codec drivers compare widget names with strcmp, ignoring
the component name prefix.  If prefix is used, the comparisons start failing.

Except Qualcomm lpass-rx-macro, none of the patches were tested
on hardware.

Best regards,
Krzysztof

Krzysztof Kozlowski (17):
  ASoC: codecs: 88pm860x: Handle component name prefix
  ASoC: codecs: adau1373: Handle component name prefix
  ASoC: codecs: adav80x: Handle component name prefix
  ASoC: codecs: lpass-rx-macro: Handle component name prefix
  ASoC: codecs: max9867: Handle component name prefix
  ASoC: codecs: rt5682s: Handle component name prefix
  ASoC: codecs: rtq9128: Handle component name prefix
  ASoC: codecs: wcd9335: Handle component name prefix
  ASoC: codecs: wm8962: Handle component name prefix
  ASoC: codecs: wm8994: Handle component name prefix
  ASoC: codecs: wm8995: Handle component name prefix
  ASoC: mediatek: mt8183: Handle component name prefix
  ASoC: mediatek: mt8186: Handle component name prefix
  ASoC: mediatek: mt8188: Handle component name prefix
  ASoC: mediatek: mt8192: Handle component name prefix
  ASoC: samsung: speyside: Handle component name prefix
  ASoC: tegra: machine: Handle component name prefix

 sound/soc/codecs/88pm860x-codec.c              |  4 ++--
 sound/soc/codecs/adau1373.c                    |  2 +-
 sound/soc/codecs/adav80x.c                     |  2 +-
 sound/soc/codecs/lpass-rx-macro.c              |  6 +++---
 sound/soc/codecs/max9867.c                     |  8 ++++----
 sound/soc/codecs/rt5682s.c                     |  4 ++--
 sound/soc/codecs/rtq9128.c                     |  6 +++---
 sound/soc/codecs/wcd9335.c                     | 18 +++++++++---------
 sound/soc/codecs/wm8962.c                      |  4 ++--
 sound/soc/codecs/wm8994.c                      |  2 +-
 sound/soc/codecs/wm8995.c                      |  2 +-
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c     |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c    |  2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c |  2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c     |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-src.c     |  4 ++--
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c    |  4 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c    |  4 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c     |  4 ++--
 sound/soc/samsung/speyside.c                   |  4 ++--
 sound/soc/tegra/tegra_asoc_machine.c           | 12 ++++++++----
 21 files changed, 53 insertions(+), 49 deletions(-)

-- 
2.34.1


