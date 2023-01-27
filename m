Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804A2C54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6AO8Wz0u03xQDCdINgTFwoolBurWKDLddXY3VYk4B+s=; b=FNVyLD6k9EnlQdAbTwfRAZ0aG1
	2fkEDCDdCC7Jlvn7iiCj0NyGz/FxIATUePZsCKCbnOosRoeaDtRXLBW5PVbPDtsbkLgRW6a/xTNKZ
	x38HyLAKbOwcRyjwnpvHVohw9r0BPlQGHaAlLpGYglCDkMGwnqdbSwURsSePaQjq3iDtJf5U9l/uV
	JiY8Da7XdoxwwdL7dEh4T8TFPukO1Pr09c5FtOOi+PF+qG6XWfhbDoOU9eUBLwo77w7Ar4H8HD1ng
	qyTCaE2YpsTXBuiLR3tCutI3+kzJo8oLW2OxCgSFgTdXo2LjZEFbNoY5V61/GBwUbvq4j/5ToW8Q6
	3bgjyl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLR9S-00FZEL-0R; Fri, 27 Jan 2023 16:00:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLR90-00FYyr-Bq
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 16:00:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id t18so5402329wro.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 08:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=6AO8Wz0u03xQDCdINgTFwoolBurWKDLddXY3VYk4B+s=;
        b=cfGKXGy6jB1Gr9nmWaUv+Q92QA2JF0D1vQTXYRo/qtQPv/n8CxDqky+m4f/LapHdaC
         V1H6DhAQlIXeBzAm3PE2aw//nLeTCUJLwvd9Zb/nqxpqUB2VLaDc4gWFSZGN1CaX9vXn
         Kjst7ZgC+IkK5tNM0K65qh9PPz0D//eYBHe1P7cJ9mAornRjtTprXTsVkKljVFY98SBy
         rXTbgO+7qMA6ll8zBqboocigNzUuLU2y9FyA57Kd5/mnCKwsktyt/xCsIFnEdVg/DEvI
         qzV2VhX9403CCxSVF7uSjnKS8Z6tyoB6B6vzJSjW67tlH/CBiRUgJstJRlu7rEY+N0+J
         SD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AO8Wz0u03xQDCdINgTFwoolBurWKDLddXY3VYk4B+s=;
        b=08dnx9jeo1Y6gSXnAFvtS728RiPahbPmfAmjD3nsFY+sudUcH+rzI73AMjyhQE2N9w
         p41+TYA58luFWisc0hgF8dMSEdJwPhVi17DIY/7RGO5weKFIRubQnDMQjAsjbhiA5FXH
         J266Qr6cVmtyK0KKV0zRFz63qOZFYug5O/USmOxFB37qt2sBZBug7egYgqImngMNgYOl
         u+L9sdQ4EpInLVfkJIPEPjeu0y8+UDs1JnsikobesJ4/frzYhSLZNsnPWZ0M7qqToe5x
         +Dtzo/0VTDOABWm4bj1sb7HTQVw0titbHyHzfG6SeflIWPL9eeVyF2AyK/cmk4e8KzHd
         TuCw==
X-Gm-Message-State: AO0yUKVOjxswetTX1Zdh4fF4ULV02YH7Y8CyoiRIE2e+LuY5VwZSGjx9
	OEMzJB2a0EqD811mkS/oPwbZFExsYqAqx5HX
X-Google-Smtp-Source: AK7set85MlINC1wX4kubGlvrGJsyxc6hLXlmKS/ArhQuSin31sebkVDcYK0X3xLR5HCG9POJz7mtaw==
X-Received: by 2002:a5d:6dd2:0:b0:2bf:b0e6:f463 with SMTP id d18-20020a5d6dd2000000b002bfb0e6f463mr11858738wrz.13.1674835199706;
        Fri, 27 Jan 2023 07:59:59 -0800 (PST)
Received: from [127.0.0.1] ([2a01:cb19:85c2:1100:7fe1:513:212f:568e])
        by smtp.gmail.com with ESMTPSA id b11-20020adfe30b000000b002bfcc940014sm3171942wrj.82.2023.01.27.07.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:59:59 -0800 (PST)
Subject: [PATCH v5 0/3] Add MT8195 HDMI phy support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIANvz02MC/23MTQrDIBAF4KsE17WosYl21XuUUvxLlSYGNBVCyN07dFOQrIb3eN9sKLsUXEbXZk
 PJlZDDHCFcTg0yXsWXw8FCRowwRiSV2NspPKfljWChVXZYJxWNh038jCOUPuRlTuvvY6Fw7n9cKCaY
 C84F7YwURNy0WsegkzubeUIP4IVVhAERnEprBj4QaQ9IW5EWiBKkHVjXEcr6A8IrwoFoaxh1tCW9kx XZ9/0LLLTAOysBAAA=
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 27 Jan 2023 16:55:07 +0100
Message-Id: <20220919-v5-0-cfb0e5ad29b2@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Jitao shi <jitao.shi@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 CK Hu <ck.hu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mac.shen@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-phy@lists.infradead.org,
 Guillaume Ranquet <granquet@baylibre.com>, devicetree@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, stuart.lee@mediatek.com
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_080002_430414_48059F76 
X-CRM114-Status: GOOD (  13.52  )
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

This is split from the previous v3 to contain only the phy related
changes to the HDMI support for mt8195 as suggested by Vinod.

This is based on top of next-20221121

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
- Adapt clock bit ratio when TMDS is over 340M
- Used sized integers for register read/writes
- Removed useless comments
- Shortened function names
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c         | 523 +++++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h         | 111 +++++
 drivers/phy/mediatek/phy-mtk-hdmi.c                |  15 +
 drivers/phy/mediatek/phy-mtk-hdmi.h                |   3 +
 6 files changed, 654 insertions(+)
---
base-commit: e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49
change-id: 20220919-hdmi_mtk

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>

