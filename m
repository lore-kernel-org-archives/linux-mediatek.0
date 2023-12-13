Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95A3C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 11:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oUJk9866S4PAQXmA6qnwohjo1oiLjXwOVCALe6AI8vQ=; b=DwA7ogOFB9QRDh+ZoF4KSpmpzz
	Tw9R1nRKvzwmMJOuzklswXXEBhkFoHY6v+fM6e+H9dTNfJHHmebfYiQGdauaQxmyspZHpa/qMQ9aa
	p7YAd5o1HO4mmIFLgKnhnu56eePEwpOHwElKS6Ei4nrRJkoQgeBrYJU7tOQdWVguhK9varAzQ75la
	v7rNdTWf7ewZS7jav24v9znaezV/10WVKRK/N422os7MJ/HK/alqjpucmj64yZM9DuYkTzP4+uuIn
	UgjSbVy15GWoTZcIqO1NRme6aTaM7guWtNpE6CoCN2rFP1oUxX+i8I9j9b1svgGVlWSoe3LOkWFhZ
	caxCfBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNax-00EV3r-2r;
	Wed, 13 Dec 2023 11:40:07 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNau-00EV2l-0U
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 11:40:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d336760e72so16233895ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 03:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702467603; x=1703072403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUJk9866S4PAQXmA6qnwohjo1oiLjXwOVCALe6AI8vQ=;
        b=s5qGL7jXYu5lBYPeFS+7dObrxLj7YS6kGsegG74YFFgNRqnq5UL+p/iTYuGMZcvqs/
         2eGp8vRf5/oYo88wBPXFg5Jc/bYho8rtmcKK3Sovnp2w2HAqfqRlypbGf6MiLWqoTRPe
         mUZ7z8YmS7/vDdqGcX38x6KNHFVHV+PMaPf4zS4kDKLiNrg34hHrov70jCpSYnsyfNhe
         rn068rBhgxm93iBoiXfkhne/D7RKBKH3s1JvxE88e16YFP71iJl04J2dwj0bz4+WrmjD
         WnoUOAb5pTvFNfYayLmQElpy3qYepC/NFaav2bgZry/m6nNYeZFzQTFhF0eaTP1aASjw
         iJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467603; x=1703072403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUJk9866S4PAQXmA6qnwohjo1oiLjXwOVCALe6AI8vQ=;
        b=rnJ4UuTvJpn5EwxPTMlldq0ZlWHTKIg0z2KmrX2pdGevCGXsVVQeMXIXl9rgk9BtxD
         C0CSqqUpTpIM8lIyR2HVeamz3qVsOtC/G+Qo30gFP5CHkHizeWRvGzjVtWwKu4XkHfXQ
         RNVo8aVAe6mo6jQn2qtpA4kIms6NuMT1Xc2hf4oOiZ+tjDxVe7dKgQY7BQidFxPteunt
         /sauipXxs+fIekOdfq9Y0vaTCZyAQBfoCaa6/Zn7f3xNjI+jLoe+Px66MXfTgCImgss8
         Z7BVNU6Jv9b6g52PK+WkNECKtvHeEujlFUESRV16qwT6Wy2fjWbAHM+/lUfSueLMcZP5
         1XhA==
X-Gm-Message-State: AOJu0YzdX6xwcztdc+Q3PW9E8rjzIdhu2WmPeLjAHPRSx21SFiR1v53B
	cns0zkTROCAi4zETMs06V7R/nA==
X-Google-Smtp-Source: AGHT+IGGbsgbPQAiXakBe9/BFo0noPhdiK3IMylMPnBNVKA3otJubCkUkx7dQEtus5lgzgTO7E4leA==
X-Received: by 2002:a17:902:c412:b0:1d0:5ac4:4959 with SMTP id k18-20020a170902c41200b001d05ac44959mr9916483plk.6.1702467603012;
        Wed, 13 Dec 2023 03:40:03 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902b20100b001bb9d6b1baasm10331066plr.198.2023.12.13.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:40:02 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [RESEND PATCH v9 0/4] add es8326 dt-bindings, commonize headset codec API, es8326 support and Enable dual amp for rt5682s
Date: Wed, 13 Dec 2023 19:39:51 +0800
Message-Id: <20231213113955.47668-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_034004_480382_DC27BBE8 
X-CRM114-Status: UNSURE (   6.86  )
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

Add dt-bindings for es8326 and codec es8326 support. 
Remove duplicate code, commonize headset codec init/exit API.
At the same time, Enable dual amp max98390 for rt5682s.

Changes in v9:
- PATCH 3/4: Add comment for MAX98390_TWO_AMP.
- Link to v8: https://lore.kernel.org/all/20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com/

Changes in v8:
- PATCH 3/4: Change the #define ES8326_CODEC_DAI macro definition and filter the es8326 widget
- Link to v7: https://lore.kernel.org/all/20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com/

Changes in v7:
- PATCH 3/4: Completion "}"
- Link to v6: https://lore.kernel.org/all/20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com/

Changes in v6:
- PATCH 2/4: add a patch, commonize headset codec init/exit API
- PATCH 3/4: Remove generalized code
- Link to v5: https://lore.kernel.org/all/20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com/

Changes in v5:
- PATCH 2/3: Change the names of some apis
- Link to v4: https://lore.kernel.org/all/20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 2/3: Change the names of some apis
- PATCH 3/3: Change commit description
- Link to v3: https://lore.kernel.org/all/20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 3/3: Change theme description
- Link to v2: https://lore.kernel.org/all/20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/3: Change ES8326 location in bindings
- PATCH 3/3: Change theme description
- Link to v1: https://lore.kernel.org/all/20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com/

Rui Zhou (4):
  ASoC: dt-bindings: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
  ASoC: mediatek: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 125 +++++++++---------
 3 files changed, 63 insertions(+), 64 deletions(-)

-- 
2.25.1


