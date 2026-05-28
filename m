Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44520CD5BD5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2026 17:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RIzWyKMXWGotWIEyO41ggWsKGrt3q5HiBatwgBfE//8=; b=whtx5+mkZAS65hBlFKyi4ZVkxP
	+21PXkGoYJQkLpZWLU/xpUT7/VwhKJijZT/ji2QAJUOtqiaDaxt2OeJbuMo44T46iqvit1UT/rbG5
	VC2av6MQeL58bPXKB773taKZ39bvfxxf1qm6uBJGWvTAQiYMZE1botNzFDtcQ3NwZBDL8FiHGsjv5
	xrjgTMwjXRBTt4eJlA5LkaTIkqa8BNWpbPDYuS4oKoPEDIS08UnnTKt7Tyxy5TYOeaIDftyOqo2pe
	5srIpqzO3Y41IQ9q8zZSTN2mn1Eg2uo0m02ycb5s7OP65bw6//4VYAx9+CzEfCXuQ+bqYjDp1T0eu
	RNHyx11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeql-0000000688f-3LG4;
	Thu, 28 May 2026 17:48:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeqi-00000006877-3X9L
	for linux-mediatek@lists.infradead.org;
	Thu, 28 May 2026 17:48:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so74475005e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2026 10:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990531; x=1780595331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIzWyKMXWGotWIEyO41ggWsKGrt3q5HiBatwgBfE//8=;
        b=d0cjBfMo1W7aDk4PnByCMbqH2YTAa2AckFLkHwuFU8QjVcaspwd1f3ZvPIxuPCy9K+
         uGsibCFfPRihP/bNsqYRRcFvp4ZSvPX/WqAfjCZPQlLCuutS9727CHQ1ZL40/b/44PnE
         xZTE0t8rs9JTvQ4XQWwaMoiEiaMtCUPWmTjTZ1pGfmpHOAu+PRmrbc4Tra/otjnrWz6W
         qJw7IlgGLg0fT4G4KWQx8z9kZ7vU03Pf6QuWEkr+Bnjr/g9BDN7DOsI9QqJm1cqm/oZp
         xF1H87MGhzm/4N5bowxvooh/XvqxQoRNKzckg9It0BKTlXWtKT389CJNbWxxEGMbN2gJ
         ECQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990531; x=1780595331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIzWyKMXWGotWIEyO41ggWsKGrt3q5HiBatwgBfE//8=;
        b=TUYl9xU0lu/PcN+/0bcW2Z5Qqj6ALaGzvHw6PrSPydi3GfmL31ItxmfQbLC6tukjMo
         nS4RCgnn8Ei3lWsmG+Q8ZEVM8Ud9ajMvlhLS+rWrJGp41ErVELAzN+4oBJGw40aBhB1E
         bSpFGfLyfl4Tw0nDiRlxzpDrfoO8LF0q2YWEcgWVLl4IMF2WFmtIAvsc9JTLAeiEgZNM
         HkajR5ia3zP04CW5Z5z7rKPZflVah2aKaGCQyIv9SP5uhE8EQMUBM81d96HMM9o+qmo5
         8nVZQlK1JdjerDtXu3Ar/EcL52Mp5zMaR4yejWnzGQIzWSe4BYAnt4WJHZPgqA3Sch1F
         xzNA==
X-Forwarded-Encrypted: i=1; AFNElJ9g2B8YDr0k6qqQTwe19oaCuam+mQjoEZ1oPUWh5RGSFa6o+y+SlYnLC7RFtCD5rMhxdVaZsooL9Sima9FOCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+g5BNW9ahiPilLDbvHTvjc1nCxl1LLavhHLByVSgmhiPPZKqq
	bLR0FDodeH4xKcjOXkt4/cR9jp3D2qCfPNU8deto9zw+fDBji1kvuFAM
X-Gm-Gg: Acq92OETPW5BMl/hqIR1ejzSY0zqVYo5O39uYL80P4UoJv8k0v9iKzQcEy2DVsZYzO4
	TBNv8aOJc5MzsOQyslu4MXku2Vm0NispdIrHE7AJvaD7BEB1gV5Oepf2q962fQzAbR7lBDUjQVB
	95s0U6NU6cEUgLvtqGUaPZZWjGkXDKgXg/LL0C6Gi2/Irnm8/+QtoK4mOtedIkvbzQxzUROgKFH
	g6rA5bfRBp3fqWeZzpGIecgpSikVgTN9Lkd8/ANpHvCCwPtKZiChH/fBrRIoc6aOyMn6uGRAddc
	CiMBhJPPS9FHvJ5X2Bwwd3rwSyPLMLzIS0dvYGovC+FKBAv+p5DTYYUyr1C+MZWQ30pAre9rn6Q
	OA7A+nE/CAEUQv7pghZM9zOTiDsOYTfopV0JrBnLoUDwJ4DGuCYk/IEebY/tItHcTgs3vktsbYV
	wj/N44iVHYZSMJY5qSINQS1mPGP4Q8XEoZgCmwFfAg+Ph8YQDtSkexqsyTPB6Yu10DIL0PBGNtp
	4lr0JqIXWpjN2UyxQ==
X-Received: by 2002:a05:600c:1f8b:b0:490:6869:9601 with SMTP id 5b1f17b1804b1-490686997b7mr266156675e9.6.1779990530436;
        Thu, 28 May 2026 10:48:50 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/4] ASoC: Add support for Airoha AN7581
Date: Thu, 28 May 2026 19:48:28 +0200
Message-ID: <20260528174840.28644-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_104852_897870_6B4FBE9F 
X-CRM114-Status: GOOD (  15.33  )
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

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (4):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card.
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  48 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 529 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 453 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 156 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1467 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.53.0


