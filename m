Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1020DC64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 11:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+/90RUFFsyhxTIlGFCCXSL5k3Rb6p3EDGwQoGJDsxy0=; b=uCBpPcAopakZHz
	n8UMu7ucZFXhn1JM8ZNcgfGdQ+p9dqRkN1OFbQ1RCGnA8+y44Gv4bTDoWSBNvej3N5iptUCj6H6Sw
	Jz8+mCzmcerVxeR2wDkFkqRm/pn/jlTIYuYVpLjag/dD0p2t9gz+j/QhINyt72zGM0jqzKnxzzPU1
	uBRfxnTlpvsiy44YH/qVX4PyVbP6VmS9+ZZijcUuOA0If4ThLcET3sPES8OIobRxbF2NvNE6Ojnqm
	KTvbvXj24Pt3mC1bfqCJm1P5/YdUNys7TGTtsY8DBxQbInfqxzTRdR5kcx22QMJ+abiJya+l3Yx36
	rJ3UsKkXisDbpKHIrICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXAW-00ESyi-Kf; Mon, 13 Feb 2023 11:38:48 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXAQ-00ESsZ-8a
	for linux-mediatek@lists.infradead.org; Mon, 13 Feb 2023 11:38:44 +0000
Received: by mail-ej1-x641.google.com with SMTP id qb15so29024840ejc.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Feb 2023 03:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+/90RUFFsyhxTIlGFCCXSL5k3Rb6p3EDGwQoGJDsxy0=;
        b=AAsSe626xpvEag3aibZRY1D+gnpLWbu/ZJLqDdAtfuLJy09JbPa0xddFDrF/lPUYp4
         3Ad1KKUuqB907OPF0yodBzJWSGLJsfXuu5nuda6vLKFaqHIILotS0u0jZrhkB4m9qYWW
         g5CucycFXxWcZVEqxmj/0JdOFWmbxFlGavWcQ5rLpE7seNNT8V5DTP/g4cxiOwqS7vKn
         wv7ktizk2yPOYab5qrkhxgHXvx1momWjjOUrd2bnsH6sSE6Aci+PS+9eUHpHrnAES4pP
         s+jQLtdViE+8izHVfd231Bd1FhiPJ7edh65G+kEUYtdDpa1xMr5kx5516/4rWBOYn7e1
         sNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/90RUFFsyhxTIlGFCCXSL5k3Rb6p3EDGwQoGJDsxy0=;
        b=kJn/UERnIZPZsizz1682WeTkzt+c/KOh01wSIhXnAsyWTMKQ+CQwDk7/4ZUxqgfnY/
         XC125lWiu0ZW80vetKz8YmUNqdPfkw97Dr7s9N+gOoapF1i0h+bW5vMA+1hVUGF3q5nS
         eeVwSkWNaTyKrhP7aL2fSnrae0t6BeubMn0ZV80Eax3y0TfOJPWV4BY3xAojhWTCQY6L
         f0GzhJ8zMfaDDH8vUOlzDPkLX05qR0rMpvmd0fZSIGpQMHfHaOAKtelGVTNlEpthRpyj
         d8WpOSJjcmNf6OMFXx74/N1uju7E5SWmV6q1ziGZkeBUhA1VLU6tEPlFTZr6AQiEJash
         xVlQ==
X-Gm-Message-State: AO0yUKWaaDgwWJandqGrqbdaGhUghOgkAOQwxJf4o3tEJTxKxLL91GtQ
	OsTYh1paywtB7fGRl2CmVCBfrQ==
X-Google-Smtp-Source: AK7set+DHNqIFOpozfBDldGxHMxVi/rXTgwwL0gV7IG1EfsqnQE7FkA4BM7FFcwSalBd3dxTJFcGrw==
X-Received: by 2002:a17:906:4413:b0:878:673f:5492 with SMTP id x19-20020a170906441300b00878673f5492mr23699631ejo.40.1676288319630;
        Mon, 13 Feb 2023 03:38:39 -0800 (PST)
Received: from [127.0.0.1] (2a02-8440-d206-ae05-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:d206:ae05:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id s20-20020a170906061400b0088ba2de323csm6638792ejb.181.2023.02.13.03.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 03:38:39 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
Subject: [PATCH v7 0/3] Add MT8195 HDMI phy support
Date: Mon, 13 Feb 2023 12:33:31 +0100
Message-Id: <20220919-v7-0-b5b58c5ccc07@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAsg6mMC/23My2rDMBAF0F8JWldFGo1lKav+RwlFz1rUD5ASQ
 wj+9w7dFIRXw73cMy/WUi2psevlxWraSyvbSmF8u7AwufU78RIpMxAAwkrLp7iUr+X+w2jhXUv
 cV7eGiTbrY56pnEq7b/X593GXdD7/8S654GgQjdTBGmE+vHvOxdf0HraF3Yjv0BEgYlDaGDJmY
 eMJUR1RRJwRKoPWQsJ4QrAjSMTHADJJJcZkT8jQkYFIVqgR0QcczojuiCYCWaMMCBC87shxHL9
 fFxI9kQEAAA==
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 mac.shen@mediatek.com, stuart.lee@mediatek.com, 
 Guillaume Ranquet <granquet@baylibre.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_033842_551021_6C46B4FE 
X-CRM114-Status: GOOD (  11.75  )
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

This is based on top of next-20230213

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
Changes in v7:
- Removed lkp reported-by trailer
- Fixed checkpatch --strict warnings/checks (besides two lines at 102
  chars instead of 100)
- Used constants where applicable as suggested by Vinod in v6 review
- Link to v6: https://lore.kernel.org/r/20220919-v6-0-2f641c422cb6@baylibre.com

Changes in v6:
- Adapt clock bit ratio when TMDS is over 340M
- Used sized integers for register read/writes
- Removed useless comments
- Shortened function names
- Link to v5: https://lore.kernel.org/r/20220919-v5-0-f346444bc459@baylibre.com

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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c         | 509 +++++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h         | 113 +++++
 drivers/phy/mediatek/phy-mtk-hdmi.c                |  15 +
 drivers/phy/mediatek/phy-mtk-hdmi.h                |   3 +
 6 files changed, 642 insertions(+)
---
base-commit: 09e41676e35ab06e4bce8870ea3bf1f191c3cb90
change-id: 20220919-hdmi_mtk

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>


