Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D03C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kdDSWpR2PwAaVc6xrPLUrP7cY8hR/WC31iRh9xFaQkU=; b=EOVAtBgTiRBk/0GctktVwo6U8O
	+BegtEH+97OhUmFFJob+mU9NIx9Hl+q1okjr1I+t5wjv0ylNmKvH9+E6OzkJmhBw2nWFhZhCOIj0Q
	MxpE8y8b8frzCbvuGMAIbE6zJFyk3Ihdtr2yqlx/LzG7FOmVnHpKgcOVGrCb+17QEnHmgdo/qzSn7
	cnaJDI7ZZlfoH1KATCCPQKssJhUae8CccMpYOK+y2kM32mfW6mDi6Z040D7Nwlit+JOtJW4hwi4cc
	wbt81gwB5aTyVrrCMGQ6WQyjconOI7zBY461FOtp9GVcX3dlGfYedOz4R9kiYHxhwmBIT8ue3Z/PQ
	M2nNEO6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPQt-00EnbQ-05;
	Mon, 31 Jul 2023 09:43:19 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPQq-00EnZ3-1O
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 09:43:17 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe28f92d8eso2275771e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 02:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796592; x=1691401392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kdDSWpR2PwAaVc6xrPLUrP7cY8hR/WC31iRh9xFaQkU=;
        b=JRaT/+kfL9uh8R15DPTFuDwkvjklHTznvty/KmRSZmAoyGr1+CR9ocuL4kvmw/UjGk
         DJBS0rdn4ScZW5MInEzcVFhbv9GKdTDpJaBzNw0+/WzGByly5NW1xh/6u8bLsw9mtejZ
         +rpLlG+09SagscOFEVnloXPJDybDA5EO57eet55qG0VZVuYHDpeI8C60dzhPYcWcUpSX
         uW2370rK4gNIz6U2gPWBqCl5MRXooZ9CoM7efLE+ynZNjnJlunqSxScERrES7yClxhNT
         37irKwNHH3pa2PC1EXEellvCP2cqF/V5/7TLqTXj/ZTgIkZtTQj025MlucYHe8QE+A1G
         KT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796592; x=1691401392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdDSWpR2PwAaVc6xrPLUrP7cY8hR/WC31iRh9xFaQkU=;
        b=Omb192ePYYd33vMTmnQHy+hTEV0HVJQr4xQc8d8dsVwER4MH1dw8mYYng6PE2oCpQy
         pYUirYzXO2iKPTTU/CZOiAe0ZcoI1NPflX9Bawxr6g3Bcxovqkv7c4dFpkzvJNaE94GA
         GMvLZeKsJhazc5tkm+KGpS/4wvdTcb5PQ1YBvWxRHtPB+G8qDt5MGfQv1Xwt2MGqK70m
         scQ+bkr7NwHiqyES4EoR4Dtg90i07IxaYB+oydZkPsjHAfUuvXI1ldnSNro8i4UW6E2f
         EtxMJQimfRa7HTMYZZ/LtwJKC/5zwsaO2haeAfuoG+/HnHnf9Ae4mN0Qc5MLSjPEPbCq
         rJow==
X-Gm-Message-State: ABy/qLa1Dg8uz6fezFjF52NKypMJS5yJSqf7qya/RAIekFRcg8pSTXbK
	Lhd8eLn36GDUPU6yZ08pO5Zlwg==
X-Google-Smtp-Source: APBJJlGki+SUDXYM8c3BbgK1LnBv0fjF2tGeoHiwrwf2124G5mJuEpJE4OQC/hLu1Gd0rntkBAJgrQ==
X-Received: by 2002:a05:6512:1c5:b0:4f8:766f:8dc3 with SMTP id f5-20020a05651201c500b004f8766f8dc3mr4904749lfp.32.1690796591857;
        Mon, 31 Jul 2023 02:43:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/12] ASoC: dt-bindings: Add sound-card-common.yaml
Date: Mon, 31 Jul 2023 11:42:51 +0200
Message-Id: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024316_471485_DE2AAC4F 
X-CRM114-Status: UNSURE (   8.92  )
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

Almost every board machine / sound cards has "audio-routing" and "model"
properties, so we can make things simpler by introducing one common
binding.  It is also expected that given property has only one definition.

If the patchset looks good, then the next steps will be:
1. Convert more vendor audio-routing properties to audio-routing,
2. Add dai-links children to common binding.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  ASoC: dt-bindings: amlogic,gx-sound-card: correct maxItems constraints
  ASoC: dt-bindings: Add common sound card properties
  ASoC: dt-bindings: mediatek,mt8188-mt6359: use common sound card
  ASoC: dt-bindings: samsung,aries-wm8994: use common sound card
  ASoC: dt-bindings: samsung,midas-audio: use common sound card
  ASoC: dt-bindings: samsung,odroid: use common sound card
  ASoC: dt-bindings: samsung,tm2: use common sound card
  ASoC: samsung: odroid: use of_property_present to check for property
  ASoC: samsung: aries_wm8994: parse audio-routing
  ASoC: samsung: midas_wm1811: parse audio-routing
  ASoC: samsung: odroid: parse audio-routing
  ASoC: samsung: tm2_wm5110: parse audio-routing

 .../sound/amlogic,axg-sound-card.yaml         | 15 +++--------
 .../bindings/sound/amlogic,gx-sound-card.yaml | 16 +++++------
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 17 +++---------
 .../bindings/sound/google,sc7180-trogdor.yaml | 17 +++---------
 .../sound/google,sc7280-herobrine.yaml        | 17 +++---------
 .../bindings/sound/imx-audio-card.yaml        | 18 +++----------
 .../sound/mediatek,mt8188-mt6359.yaml         | 17 +++++-------
 .../bindings/sound/samsung,aries-wm8994.yaml  | 16 +++++------
 .../bindings/sound/samsung,midas-audio.yaml   | 16 +++++------
 .../bindings/sound/samsung,odroid.yaml        | 14 +++++-----
 .../bindings/sound/samsung,tm2.yaml           | 16 +++++------
 .../bindings/sound/sound-card-common.yaml     | 27 +++++++++++++++++++
 sound/soc/samsung/aries_wm8994.c              | 10 ++++---
 sound/soc/samsung/midas_wm1811.c              | 10 ++++---
 sound/soc/samsung/odroid.c                    | 15 ++++++-----
 sound/soc/samsung/tm2_wm5110.c                | 10 ++++---
 16 files changed, 119 insertions(+), 132 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/sound-card-common.yaml

-- 
2.34.1


