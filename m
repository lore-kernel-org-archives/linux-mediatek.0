Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F2DC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qSSoTx14sBp+/R1ydiiF1swCqSgaAAS/RFqYam0nfSU=; b=S60OihoAJkxIYN5XKQ2dBRJdOC
	mTb7t9mBpfjTyVqqkFnVCjMvG55pdkfIqfxuN7b5qj8jAlqyMCciDdHRBVqK/zvO2VpsaIIanp/Na
	P1Snq+bkkCp58e7qWonAulXcUPSUyCq06iaDaM6lYDr/WwCLZTmmIIT3/L2KZKAc4RioGyqHdPkC5
	E1daCKZejQk9rmFbw4cg3tViVX08xAA9ZOpAmui5yVvSzUAEbfilBst0OlI07nJfPGRJYvOQVAjq+
	0JyojkQhxLgxWlWg9kurGK/KcmchgQZU+Hh3p12t706TzfwRHZB1nCR4XIqRAAu28fwyXi5Y9U1it
	IbjXnX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgtc-002m8M-7f; Mon, 28 Nov 2022 16:22:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgtB-002lte-C0
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 16:21:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id p16so8892410wmc.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 08:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=qSSoTx14sBp+/R1ydiiF1swCqSgaAAS/RFqYam0nfSU=;
        b=ZRTwWarpwcayUpxJzRgrtg4c2XeVGb8nNkmkJpweInvESpP+xnjVD5+zc6XPcNdJuk
         bLgAxlNyOF62cELMAOEXshJGz+umN6jXAi6oAT8mn/aOmpf6/NWXGT6QPL232LuZa8hN
         F4LgeVs8+o62iVrSblFGUjzpEI8cIJN2Q+YCWrIZG/RkXVoZR/JmczlZw8csUdTor4kM
         EARazyWEzsNL95/hDGJwU9esHcg7DWnWWKdH+RZNDpIzRWvmZk19NNGadZQBdFXuQ9S2
         gtKxALKXbg/izfheP+Sf+99Idmvqe/ZaiSCOP57u5AslA36kaG7miO8cD6XIDuw0agqu
         KIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSSoTx14sBp+/R1ydiiF1swCqSgaAAS/RFqYam0nfSU=;
        b=I4kegIQeudCZ+0tuOPe9nOX7qeGKGZ2japEPoU9tJTLC0J61rwkVwa8miBKSZzOKwP
         H+D0KCI4+/sPBb6Y94MJJEBgseJNfLj3ZR3H/t1U6pWdlNcxveYmYsl0i0KdlqNI2CU8
         DaAq2CDJ68CIgSCz8/ebevMv2nURVkHK/x+rfVwQzabJaYc4LYfAObjOq64v473Ad32j
         tCKdU0yTTBCxV87cBI/kV8Kaq4vU6wdCKgRNqTmHYIWeFs4A10+CDUH356iUY5d/+HnK
         PAc9Crp+H2QNKXnWFVfe+f6GGuGjsoJuxpJt6OJYRtxui+mYqVddkN0zfNiJztqFS6e7
         i+fw==
X-Gm-Message-State: ANoB5pnL9JzTEm3X+LWSLt1tAGsSHj/d85JIpzIoSg0orjhdOujq3iCb
	fvGAZ50x4eRi/zEsVqmlnmncnA==
X-Google-Smtp-Source: AA0mqf7fGwMzUE1Ciq26LwjSbLIj1HTemOv/bJvoR+I2TGq+pQY37aZ4UVpsafa/xFsvjuhDAYgJBQ==
X-Received: by 2002:a05:600c:4fd0:b0:3cf:70a0:f689 with SMTP id o16-20020a05600c4fd000b003cf70a0f689mr42860114wmq.161.1669652503650;
        Mon, 28 Nov 2022 08:21:43 -0800 (PST)
Received: from [127.0.0.1] (2a02-8440-6340-f657-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f657:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id s10-20020a1cf20a000000b003cfe1376f68sm15311450wmc.9.2022.11.28.08.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:21:43 -0800 (PST)
Subject: [PATCH v5 0/3] Add MT8195 HDMI phy support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAB/fhGMC/23MTQrDIBAF4KsE17WosYl21XuUUvxLlSYGNBVCyN07dFOQrIb3eN9sKLsUXEbXZk
 PJlZDDHCFcTg0yXsWXw8FCRowwRiSV2NspPKfljWChVXZYJxWNh038jCOUPuRlTuvvY6Fw7n9cKCaY
 C84F7YwURNy0WsegkzubeUIP4IVVhAERnEprBj4QaQ9IW5EWiBKkHVjXEcr6A8IrwoFoaxh1tCW9kx XZ9/0LLLTAOysBAAA=
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 28 Nov 2022 17:17:35 +0100
Message-Id: <20220919-v5-0-f346444bc459@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: mac.shen@mediatek.com, Guillaume Ranquet <granquet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com,
 kernel test robot <lkp@intel.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_082149_447961_834F8F08 
X-CRM114-Status: GOOD (  12.74  )
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

Add support for HDMI phy on MT8195.

This is based on top of next-20221128

To: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
To: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: CK Hu <ck.hu@mediatek.com>
To: Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mac.shen@mediatek.com
CC: stuart.lee@mediatek.com
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
Changes in v5:
- Fix compilation errors on 32 bits platform with no support for __udivdi3.
    Compile tested on mips with gcc-12
- Link to v4: https://lore.kernel.org/r/20220919-v4-0-bdc21e1307e9@baylibre.com

Changes in v4:
- Dedicated series for HDMI phy support (without the drm/ related
  changes)
- Removed useless variable initializations in phy driver
- Link to v3: https://lore.kernel.org/r/20220919-v3-0-a803f2660127@baylibre.com

Changes in v3:
- phy: Grouped register and bit definition together to add clarity
- dt-bindings: Addressed comments
- Link to v2: https://lore.kernel.org/r/20220919-v2-0-8419dcf4f09d@baylibre.com

Changes in v2:
- Removed syscon requirement from the hdmi node
- Use as much as possible bit FIELD_PREP/FIELD_GET macros across all the
  patches
- Make cec optional dynamically instead of hardcoded with a flag
- Renamed hdmi variants to v1 (legacy) and v2 (mt8195) while waiting for
  a better name
- Rework hdmi v2 code to use a connector (same as v1)
- Remove "magic" 0x43 addr special handling in hdmi ddc code
- Link to v1: https://lore.kernel.org/r/20220919-v1-0-4844816c9808@baylibre.com

---
Guillaume Ranquet (3):
      dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
      phy: phy-mtk-hdmi: Add generic phy configure callback
      phy: mediatek: add support for phy-mtk-hdmi-mt8195

 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml |   1 +
 drivers/phy/mediatek/Makefile                      |   1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c         | 527 +++++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h         | 111 +++++
 drivers/phy/mediatek/phy-mtk-hdmi.c                |  15 +
 drivers/phy/mediatek/phy-mtk-hdmi.h                |   2 +
 6 files changed, 657 insertions(+)
---
base-commit: 15f2f20ccbf2d04cb14e3e7635aa0447208c71e7
change-id: 20220919-hdmi_mtk

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>

