Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA64C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IMH0wVoJhc1Ycztouvr0JOiX6tFg+IdkseqQF/l41XU=; b=T7UQE/Y648Sqg1tX1izu2uOmNl
	Esxv7xeUMe74+oVyX7sABJI+3oYzej8ipkJEPXr5G7cgD1rjLF4TdeRXD+VGBQQQs/dt+B377O8Ym
	MkTACb7PeWzxG0uZmoTS6YWBUs4bdj6Q8/Z1li7+jF6OrZ7hiApB5YEBhW33bu0uBDoABoMLWEAxn
	KhC59JyOOT0Kwa7W2aeQmB0CaowD2SV9h8cmvq16VfEODI7MJc5Y7ACTPTvddXVQJDYpiZX+6x8Hr
	mdYmXu3DyL6ecPP5guXlhGeCWktnRy+OEeJhqyCT5Z/cLmuZF0ID2iokLNnEO7I2vhFsIZRQNz50M
	+HvvF4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8gD-00BgzK-9T; Mon, 22 Aug 2022 14:45:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8g6-00Bgfn-UX
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 14:45:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id u14so13495347wrq.9
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=IMH0wVoJhc1Ycztouvr0JOiX6tFg+IdkseqQF/l41XU=;
        b=a8LgB6dxvrnNo6HSr4dF5TcaSB3xK2TzxBTQ26T+saIpMMsbc+pnRQmDiKvyCs6fnQ
         e7JYnQJqHdwpHEHIrIhIt9lJgT3lfL6D+bSfTbgooakUDnTJZ+o7wlT6EuAMY7D09Rpm
         70AKRn3UycXyqhN5AHvG/scg9YgbcAsV05Bk0vsx6aVHlQBNanO54Ml1rKIF1RxN5o3t
         h2PbBGmyJAkhITziNuUL8vZFxUShDqZbNG1ENDTaKz3ByPQp5tMv1uyZPhk1TFx5cVaM
         w/MwQPDP5lgtsyHJ+pAiUzI/k2HNoVMFPn9aEA5ymjILZaK7px0bjajdhz6bU8p0oJdG
         R2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=IMH0wVoJhc1Ycztouvr0JOiX6tFg+IdkseqQF/l41XU=;
        b=z9e2Rr62HHV0NiL9lJaRfiMmZ28UFzeXcm3rzdmqfLymN3z7GNvdcwPHxucAfP/2nA
         Qq/cz9GZvNxhrOGpr4F80kKClAfMZXMfrQQG1NhEN+SaUpfa7+IXfYt1nGPemthj7Q8w
         fx/yfdUxOcFq2bsxcfi01F+EJnsXqwW/3MuMTHaMK/8i4HAjFdJNnaTUHZ+ZWZ3uqsCT
         sa60B4QyqOBqbqpCM7wTWuL28lm3oQ/jN83n/OUYXn70vOzv5fXvfNHzRWsCSwIBAimC
         6B6qZE7CgS2OVDeveQjz2Z0TCiaCVV6VQvsiULApplcDxh97NqUOJqAEnQnoM3046hfh
         mb/w==
X-Gm-Message-State: ACgBeo17/Z4Qne5aoYsa+TQq6fIooeR772R+5ME9otrShxgSZCkxNOXN
	Q4kT36CxSTG6x1TLY5uaEUfbGw==
X-Google-Smtp-Source: AA6agR4erdnjvw/jkmfls/AyT/KCqbqXNSZqdyKxtQx5jliqXa0V0rwxhFEY6l7D749SDWll+tEa4w==
X-Received: by 2002:a05:6000:104f:b0:225:29be:a39c with SMTP id c15-20020a056000104f00b0022529bea39cmr10779384wrx.641.1661179520706;
        Mon, 22 Aug 2022 07:45:20 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id z24-20020a1cf418000000b003a5dadcf1a8sm14670935wma.19.2022.08.22.07.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 07:45:20 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 0/4] soc: mediatek: MT8365 power support
Date: Mon, 22 Aug 2022 16:42:59 +0200
Message-Id: <20220822144303.3438467-1-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_074523_248634_C22D1A92 
X-CRM114-Status: GOOD (  10.49  )
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

this series contains patches related to the support of mt8365 power
domains. Thanks for your feedback so far.

Best,
Markus

Changes in v3:
- Mainly redesigned WAY_EN patch to be easier to understand
- Rebased onto v6.0-rc1
- Several other stuff that is described in the individual patches

Changes in v2:
- Updated error handling path for scpsys_power_on()
- Minor updates described in each patch

Previous versions:
v1 - https://lore.kernel.org/linux-mediatek/20220530204214.913251-1-fparent@baylibre.com/
v2 - https://lore.kernel.org/linux-mediatek/20220725081853.1636444-1-msp@baylibre.com/

Alexandre Bailon (2):
  soc: mediatek: Add support of WAY_EN operations
  soc: mediatek: add support of MTK_SCPD_STRICT_BUSP cap

Fabien Parent (2):
  dt-bindings: power: Add MT8365 power domains
  soc: mediatek: pm-domains: Add support for MT8365

 .../power/mediatek,power-controller.yaml      |   2 +
 drivers/soc/mediatek/mt8365-pm-domains.h      | 147 +++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         | 194 ++++++++++++++----
 drivers/soc/mediatek/mtk-pm-domains.h         |  29 ++-
 .../dt-bindings/power/mediatek,mt8365-power.h |  19 ++
 5 files changed, 346 insertions(+), 45 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8365-pm-domains.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h

-- 
2.37.2


