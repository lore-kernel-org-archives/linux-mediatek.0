Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D19C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 17:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9tro2oCAbN+mbj/HKR3A46hDRnbE6tXzNt27JGPID68=; b=DtS3YY8SD/FafNKyHTZW6UOkr8
	YrbdrTi1XoUsnmXjLM5fIb3ZeVC/D69EbbN8HddadLaexVkOJ6rLKhZ2d8DydBiQ+X01ggOv6J5G5
	tyYrCiiDycYUXcJnmTThrRzMPHo1JJbbpWMlC6yefJDI+pFD7pDT84NwzNNRIkeE1gmIM7/6U6Dfe
	m66NUnpt4qbzgKDgwEbfjWw/opiPXaqpP+oJwKhQmtH57wIv5fhOZdmRwv6oMH8jI3Mcql3DOL2O3
	lbMQN5wJcuJ1ZYKk7xzHfvut3av9pdtJGwIiyCWikorYtUM7KD4vuLAIwj8AU30C3iErD0v9UXSP6
	3ozwve8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK7z-00D4an-TW; Mon, 19 Sep 2022 17:00:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK7Y-00D4I9-F2
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 16:59:51 +0000
Received: by mail-ed1-x52d.google.com with SMTP id x94so88179ede.11
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date;
        bh=9tro2oCAbN+mbj/HKR3A46hDRnbE6tXzNt27JGPID68=;
        b=3+jXsVMUL/Ek+ltKfy4Qawu/Pw7TG6cilfl66vkc4y+DYBPaYgtZv1p4BbwPzksphk
         JrvJcC2YSX1q79FG93ETJekmw3tJYHSmTkJzTSb9haW1ufGrB6/zpIKUw2WjPXDUqkty
         mytztxw4ljT+7oFObNfw355aMnszO8HFBpZ06YiwMdxjiDP9KYGIJo+btpD+n24uVcMk
         654kSXHO0di8SuPyIdU5b6g6AIBFMvuWA6WGjnZovZIIxTWOcDIRY2tP9+ZCvUX6Drj5
         kun5QOWjkofHQj2/Ac6bkvQF3GxuIg8j9PewpKjOsGLg2CFIL7eItD4m+dvfX5hVs93D
         uP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=9tro2oCAbN+mbj/HKR3A46hDRnbE6tXzNt27JGPID68=;
        b=lLhWLEuITfwcNhCzn4p4bL25RUY/h2j0ByKKZ6eST1XdaUrpiFiMohij9z5C27/eQI
         ROskS/Pre9DyWvH7ivtPv3TPFliy4qylMvMmsCbH+rsOIeNoegB9K7T5HRqXjIdukakF
         5RzGKwpHTOvJs64YzNLGtEqZt/IKpK3Nn2w5p8LxZL16vwoPoZQ7c13P5n2mELiy5S8p
         t+CCKCRC2GyTjJ75inJFclc/VuFtT4WAtc5NYtkhrmNxMDosYQ4jfaNLdbC1ZMLV74v+
         v95iHOvN/bfku1gZ+I/aH8H88ammaRJQqYOv9M34jdbkHNa4cqR81EdEmFqymzWk0mxl
         6jTg==
X-Gm-Message-State: ACrzQf2Uofos6CrOl59FmQfi1X7DluSLv8KD9B0tbLgFCFWKSDepOlh9
	JYKxGBUzoai/HxMTJvDvaYMXAg==
X-Google-Smtp-Source: AMsMyM6iRL5JBprCZvHk9dT8PMtpt98i7hlA72vdPks7s4qBaJDnnZvv+4dOv8WBquTaxJ2hX5EXvQ==
X-Received: by 2002:aa7:c448:0:b0:44f:c01:2fdb with SMTP id n8-20020aa7c448000000b0044f0c012fdbmr15838234edr.88.1663606782531;
        Mon, 19 Sep 2022 09:59:42 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:59:42 -0700 (PDT)
Subject: [PATCH v1 00/17] Add MT8195 HDMI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAB6fKGMC/w3KSwqAIBAA0KvIrBPUnV0m/Aw5pAZOtRHv3iwfvAmMg5BhVxMGfsR0d4HdFKQS+o
 mashiccc5463XJjY72XCAjBkYdR+ipyOlvrWv9dLIU6FIAAAA=
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:55:58 +0200
Message-Id: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, Guillaume Ranquet <granquet@baylibre.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_095948_576924_05D377B8 
X-CRM114-Status: GOOD (  12.69  )
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

Add support for HDMI Tx on MT8195.

This includes a split of the current "legacy" hdmi driver into a common
library of functions and a two dedicated compilation units with specific
code for mt8167 and another for the "new" mt8195 SoC.

Support for the new mt8195 hdmi phy and the dpi/drm_drv adjustements to
support hdmi.

Based on next-20220919

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

---
Guillaume Ranquet (15):
      dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
      dt-bindings: display: mediatek: add MT8195 hdmi bindings
      drm/mediatek: hdmi: use a syscon/regmap instead of iomem
      dt-bindings: mediatek: set the hdmi to be compatible with syscon
      drm/mediatek: extract common functions from the mtk hdmi driver
      drm/mediatek: hdmi: add cec flag
      drm/mediatek: hdmi: add connector flag
      drm/mediatek: hdmi: add frame_colorimetry flag
      drm/mediatek: hdmi: add mt8195 support
      drm/mediatek: hdmi: mt8195: add audio support
      phy: phy-mtk-hdmi: Add generic phy configure callback
      phy: mediatek: add support for phy-mtk-hdmi-mt8195
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT8195
      drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
      drm/mediatek: Add mt8195-dpi support to drm_drv

Pablo Sun (2):
      dt-bindings: clk: mediatek: Add MT8195 DPI clocks
      clk: mediatek: add VDOSYS1 clock

 .../bindings/display/mediatek/mediatek,dpi.yaml    |    1 +
 .../bindings/display/mediatek/mediatek,hdmi.yaml   |   91 +-
 .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml |   45 +
 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml |    1 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |    2 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c             |   11 +
 drivers/gpu/drm/mediatek/Makefile                  |    5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  143 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |    5 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    2 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  647 +-------
 drivers/gpu/drm/mediatek/mtk_hdmi.h                |   16 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |  477 ++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h         |  225 +++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c         | 1602 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h         |   31 +
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c     |  539 +++++++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h    |  329 ++++
 drivers/phy/mediatek/Makefile                      |    1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c         |  673 ++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h         |  204 +++
 drivers/phy/mediatek/phy-mtk-hdmi.c                |   15 +
 drivers/phy/mediatek/phy-mtk-hdmi.h                |    2 +
 include/dt-bindings/clock/mt8195-clk.h             |    4 +-
 24 files changed, 4429 insertions(+), 642 deletions(-)
---
base-commit: ec65813678c97a05766d29f1ec40bdf1b30bc3d6
change-id: 20220919-hdmi_mtk

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>

