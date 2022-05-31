Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECE7C43219
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eHzm8JoJWU7oPMhC8pd8HBRxFpQnk/Q3/+I1PClnbN0=; b=hpUPchi++0bed2
	2F5aqoKb27btV9gVa5rLHO3OeIRhGaPpB9Blcq3rs2ve+PypvkYdmkrGFJAkfEG6RQ4nxlqaI1MrD
	KSceFMuFFPfJjQV2EqTq4IZO/5+M1MjmB+du472cbKdZg/mRgLp2ycPKWJ8DrRyPIk6YRRzuzJjwx
	u3qnJ/s07AWznU5KufbCCVt9NKE9UBnVVJ2/nopJxXE2weP0E+Q1XHNEpVSqvb+/c6s0o0L1SkIgF
	N93AymvXQUA9BSQp8/ZG/BN+lWQCFRKNkGntGjWD7y2M1fwtYLaTqqymub+mHkE436OjyEPywp4JK
	cNekIG2h1EF2mghI1YuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gp-00BA8J-Jc; Tue, 31 May 2022 13:50:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gf-00B9xz-GT
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:50:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id k16so14448589wrg.7
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ks9vTtzXL1NzJuLhvcv/lBf9sH/I8oroEcUXJQecJiY=;
        b=xtZHSA3K85YeP1R8TqJTezh1l7AboO67QnJbxmUxYsSKR3b9HMFsTp1QD4TVZvKYD1
         HykwJkz0IW4fwjPH1Z0l9xH3Oif1Qyz4EObPsiwZXnAXo/kCZCKI8eI5xsuJ7HgXtaXN
         igvkGmpchkyuuMO2tdAR159F7tqSL4KCQk76eOzZ0gnvace+L6L/D7RGtYizyiAxNH/H
         U1OOXHiLwvj0PnjQ9PmyWuR1utFiONwi7NGx9h2FLtpNKsKkOyd7zUg6Z7fPPuvzo2+J
         OzV184qkC3Q1grDw1sZEiE1et3kV/ow2A5Uy2HR/6AQuE2OaglwYGrTIwCVgkLMJpI+J
         hYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ks9vTtzXL1NzJuLhvcv/lBf9sH/I8oroEcUXJQecJiY=;
        b=4wKQEVB6jdCorYcknoaUMtJcZZhqcVT25BVLwNxzXkbwyIm5VcqCsfjKl4Rid10Avx
         4I8DRJJxtRr03yqzOHu/xGjYo34iN/pcbJM/UuXdPQXRy8j3DbMpXIPeB5rOsbLsba+q
         nxjAkWjh/sohdbByUrBfEEg8NoQdFi/6gGIO40rDkM7cqvMNW3tri/7J7PXne0xmaE9+
         UWKljP6/NVJYyhnEt3Ws72eCiryoV+duKmRXAIlAqV9ZHG+Vd856A6c3NdClETx3tLRN
         Q4M3jY8OTS6x8DpPWCGH5N2gZxcM0nSu02Lm+xfdN01n/XUMKvmSUo4EXMhjXsSE8L21
         RdLw==
X-Gm-Message-State: AOAM532D5muPp2co/m2RT1bGVNVna6mwvIc+MWaU5R7XYZ2UQmgaakwo
	P/KGfP1Fpgw6/f7rROBaqPZdPA==
X-Google-Smtp-Source: ABdhPJzh0ABvRvzeW4VNDfDT+jgXlefhQRDjukiBBkCf5v7KqylLxZRg6Qya21tyLqyBuT1Kzn3OQA==
X-Received: by 2002:a5d:6f1d:0:b0:20f:ff40:263f with SMTP id ay29-20020a5d6f1d000000b0020fff40263fmr25172992wrb.626.1654005037132;
        Tue, 31 May 2022 06:50:37 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:36 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	qii.wang@mediatek.com,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	srinivas.kandagatla@linaro.org,
	chunfeng.yun@mediatek.com,
	broonie@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 00/17] Add support for MT8365 EVK board
Date: Tue, 31 May 2022 15:50:09 +0200
Message-Id: <20220531135026.238475-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_065041_812206_AB387147 
X-CRM114-Status: GOOD (  10.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series adds support for the MT8365 EVK board.

This series has dependencies on the following series:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646256
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646091
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646083
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646081
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646076
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646068
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646020
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646052
https://lore.kernel.org/r/20220504091923.2219-2-rex-bc.chen@mediatek.com 
https://lore.kernel.org/r/20220512062622.31484-2-chunfeng.yun@mediatek.com 
https://lore.kernel.org/r/20220512062622.31484-1-chunfeng.yun@mediatek.com
https://lore.kernel.org/r/20220524115019.97246-1-angelogioacchino.delregno@collabora.com
https://lore.kernel.org/all/20220127015857.9868-1-biao.huang@mediatek.com/

Fabien Parent (17):
  dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
  dt-bindings: memory: add mt8365 SoC binding documentation
  dt-bindings: mmc: mtk-sd: add bindings for MT8365 SoC
  dt-bindings: arm: mediatek: Add binding for mt8365-evk board
  dt-bindings: dma: mediatek,uart-dma: add MT8365 bindings
  dt-bindings: iio: adc: mediatek: add MT8365 SoC bindings
  dt-bindings: nvmem: mediatek,efuse: add MT8365 bindings
  dt-bindings: watchdog: mtk-wdt: Add MT8365 SoC bindings
  dt-bindings: spi: mt65xx: add MT8365 SoC bindings
  dt-bindings: serial: mediatek: add MT8365 bindings
  dt-bindings: phy: mediatek,dsi-phy: Add MT8365 SoC bindings
  dt-bindings: phy: mediatek,tphy: add MT8365 SoC bindings
  dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
  dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
  arm64: dts: mediatek: add mt6357 device-tree
  arm64: dts: mediatek: add mt8365 device-tree
  arm64: dts: mediatek: add mt8365-evk board device-tree

 .../devicetree/bindings/arm/mediatek.yaml     |    4 +
 .../bindings/dma/mediatek,uart-dma.yaml       |    1 +
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   |    4 +
 .../iio/adc/mediatek,mt2701-auxadc.yaml       |    1 +
 .../mediatek,smi-common.yaml                  |    6 +
 .../memory-controllers/mediatek,smi-larb.yaml |    6 +
 .../devicetree/bindings/mmc/mtk-sd.yaml       |    3 +
 .../bindings/nvmem/mediatek,efuse.yaml        |    1 +
 .../bindings/phy/mediatek,dsi-phy.yaml        |    4 +
 .../bindings/phy/mediatek,tphy.yaml           |    1 +
 .../bindings/serial/mediatek,uart.yaml        |    1 +
 .../bindings/spi/mediatek,spi-mt65xx.yaml     |    1 +
 .../bindings/usb/mediatek,mtk-xhci.yaml       |    1 +
 .../bindings/usb/mediatek,mtu3.yaml           |    1 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt  |    1 +
 arch/arm64/boot/dts/mediatek/Makefile         |    1 +
 arch/arm64/boot/dts/mediatek/mt6357.dtsi      |  272 +++++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts   |  578 +++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 1047 +++++++++++++++++
 19 files changed, 1934 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6357.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
