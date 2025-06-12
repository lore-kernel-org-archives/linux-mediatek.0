Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E9AC61CE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SPFuYxHVFr0kVDYRfxXF8FfjITbYZAv5cDjlCNLKod8=; b=DFJrWATcTxxdnk7YrObByohVX4
	PvBMVRfdqt+mUFFYHcSlYUtwihrjZoCRk3iE1WP/AH+cY7194UGGcikHYZ9GezlQCcrQVZLUfhmjM
	mma9zT8XXkGzWm4nY6T8zS/3Dr+Sxm3vYDbM2nUaUs6e0cFEe5fzmauJrXuFwVgxw5U+ZrhEECxeA
	msrKDF12Aoc/Dl60KloJqu+VMubSZZUf6MlWt0iXbfDCZWg6rn5enjw2OkqXjiVlTDUBhTrLOr1ba
	GPOCr2GBtg7wqK5TYzBHhGC1HaU8MgVm1FXl4wLN9qaufuHhqUJKPgELsiWrKpRsF/5zFsGmR+CbE
	6mZ0UHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPd6Z-0000000CaIF-1qnf;
	Thu, 12 Jun 2025 08:16:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgV-0000000CVNK-0MHS
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-235f9e87f78so6908585ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jun 2025 00:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714554; x=1750319354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPFuYxHVFr0kVDYRfxXF8FfjITbYZAv5cDjlCNLKod8=;
        b=dIJaWxZbR9D1FrRN4WuH52SA9uJFsK/GHvC/NGB4pOsCyRuKzor8q3gSn47pG5zkR3
         PaR/pZWRYUTVYX7PevPBGlPoKm6AmPHEX1P6fbJE7s6/WHPjckib6YoV1aQxnnAE+zmR
         DXCyOtiL1Y3YGFxMhqgavjnDXflDRnZjSeSx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714554; x=1750319354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPFuYxHVFr0kVDYRfxXF8FfjITbYZAv5cDjlCNLKod8=;
        b=Tb6y5LxqueXGi0spYi6DC6c+2x6bo/7A44nw3HNJZR6rfjOEErvtxWeWyEHoGfc4qM
         yhHmCVsT79WZ41N+wYUxbSAROQjfTHznPk1gP9mb4YABbl/Vd9nXnUW7H0xP/nSf6gaD
         C5k6lVbMrgPjiHLdvBKbFEQxRcWTEmygwXYyhMZc6FSk6QClJ8fjdbTX3FhTE857QksC
         JRMK4H1mEt7Z7q3PhpO06epZxfoATHRkjJOY+l1yxBS+O38CD+rHO2fccWWl7ibFzPE0
         ZUqfSe1nJe7qvSDWvSsd9xhgXLTBMhOMSg1ac7O7h93WxZMyqACCeToln7GsANrbDa5k
         eSVA==
X-Forwarded-Encrypted: i=1; AJvYcCU51C3s8ls8ifx/I6UauFuxk9jBGbzl9/VkOotZVNfYc1iq1zKDZLIE+Fe+TFXBjqopYxcKBQagqA0qEfMRbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywov/IoUueYF3FATl3CsZhPGYxf6Z5/RxGvwLVIaog5hfk3fOqn
	IELPr8qgYR9G7tb4uykU1rq4tbVcLIJLcIowIIc7UjplMNPMO2hdJZSCyb4S4Kaipg==
X-Gm-Gg: ASbGncvIhi8oMGy4UMCZFEpbacyQSIvi+Ju6NGm77H4IKS0hLs67cTUN8ixzUc8GjTd
	1tqTOCBIz7eR3w3LAVfA/KRpdfUne80tzfgcjSDyPucgymbKYRYBc+yYgXkSNxMGWdPL3Ph5ePi
	dZAV4aDJyKMjmvdpcG0Nvq70pHQAeDSdXH6N/9nK5oSMO3In6qVl++DNc54erY2XTyiOY3nAMMt
	C+BAf3tIglOdHNGxvaGDo+UL7xP6yiWHSQveK57zFjx7cAwjzqkKLIZClPwhSWtTpNerM9VYyx7
	zPexFC5km88fVHjJynTDXPfZ5aaEnuvS+OKnFvG44Lxu7cO8YqaP/JNixkB1NcpKP5Ku9fFIqXn
	ZgdU=
X-Google-Smtp-Source: AGHT+IEL+zvm6Pa+DO1Fnyj+R5YFcjNFtCXH/bW/rjNfe9qMH6I9WeUJgnkT/5fLkDBtWeqN43Q0Rg==
X-Received: by 2002:a17:903:1b4d:b0:234:8eeb:d809 with SMTP id d9443c01a7336-2364ca62bc0mr42902035ad.43.1749714553790;
        Thu, 12 Jun 2025 00:49:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] ASoC: mediatek: use reserved memory or enable buffer pre-allocation
Date: Thu, 12 Jun 2025 15:48:51 +0800
Message-ID: <20250612074901.4023253-1-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004915_141480_B60E87B5 
X-CRM114-Status: GOOD (  23.35  )
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

Hi everyone,

This is v3 of what was just a single patch "ASoC: mediatek: re-enable
buffer pre-allocation on some platforms". Links to previous versions:

  - v2: https://lore.kernel.org/all/20250424102509.1083185-1-wenst@chromium.org/
  - v1: https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.org/

v3 is simply a rebase onto next-20250612 to resolve conflicts against
Mark's tree. I believe the main conflict is from my other series
"mt8183-afe-pcm: Shorten source code" that Mark had merged earlier.
Also, Angelo picked up the DT changes, so they are no longer included.


Original cover letter:

Angelo requested that these platforms use reserved memory regions if
possible, and fall back to pre-allocated buffers only if that fails,
to align with other MediaTek SoCs / platforms that already use reserved
memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
SoCs.

There are three parts to the series:

- Part one (patches 1 through 5) update the DT bindings to allow having
  a memory region. The text binding for the MT8173 was converted to YAML
  and also aligned with current usage by addition of a power domain.

  Note that the MT8183 text binding was _not_ converted. It is
  drastically different from what was landed in the device trees. Some
  time is needed to work out the differences. I might try to recombine
  the audio clocks (which are actually part of the same hardware block)
  as well.

- Part two (patches 6 through 9) update the audio frontend drivers for
  the various platforms covered in this series.

  - Patch 6 is the evolution of version 1, now defaulting to reserved
    memory if possible.

  - Patch 7 adds support for >32 bit DMA addresses to the MT8183 driver.
    This was missing, and prevents the memory regions, which are
    allocated from the top end of main memory by default, from working.

  - Patch 8 and 9 are just some minor cleanups to reduce the number of
    "&pdev->dev" style dereferences. They are placed after the other
    changes to make it easier for the fixes to be backported.

- Part three (patches 10 through 13) add a reserved memory region for
  the audio frontend on the various platforms. (This part is queued up
  and therefore not included in v3.)

  For the MT8173, the change covers the whole platform. In practice
  there are only ChromeOS devices.

  For the other platforms, only the ChromeOS devices are covered. These
  are what I have available for testing.


Please have a look. I assume the DT binding and driver changes will go
through the ASoC tree, while the device tree changes will go through the
MediaTek tree.


Thanks
ChenYu


Chen-Yu Tsai (9):
  ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
  ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
  ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory
    region
  ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory
    region
  ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory
    region
  ASoC: mediatek: use reserved memory or enable buffer pre-allocation
  ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
  ASoC: mediatek: mt8173-afe-pcm: use local `dev` pointer in driver
    callbacks
  ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver
    callbacks

 .../sound/mediatek,mt8173-afe-pcm.yaml        | 98 +++++++++++++++++++
 .../bindings/sound/mt8186-afe-pcm.yaml        |  5 +
 .../bindings/sound/mt8192-afe-pcm.yaml        |  5 +
 .../devicetree/bindings/sound/mtk-afe-pcm.txt | 45 ---------
 .../mediatek/common/mtk-afe-platform-driver.c |  4 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |  1 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    | 66 +++++++------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    | 56 +++++++----
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |  7 ++
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  7 ++
 10 files changed, 200 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt

-- 
2.50.0.rc1.591.g9c95f17f64-goog


