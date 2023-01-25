Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8FBC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 14:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PdB/SfQ0SWBNWh08eH3SW1QsUqwi/lP4LXtXf+kq5IA=; b=laKvr2dNZXi9+n4OgJAyNLTJX2
	OOoDVrOa7T7BIrdYlZbQXHnbQ65ZR5hyf1C/Vu5sTdcEmXUmEL1ZGbMRoUT8T/9220vQHZ46mJowe
	rCRRVIeMzs6R2D6qEBtxV2WXzYmybQNDDTCoIQZVTg2X80PSeZyvAvuVaydVjZe6N5V1mmYr8ocK1
	uyvWe+baPnVPOykrU2OqNqiQFfJqyYWGMvHFNPV4qfzyLMQxdR/AdJR1pQMnWWVKFyz7QzBVH1p1S
	+bw2fAeugYq5GADTtTClUGf15iWgGLZWhoH93O4oqvv8fXGE6B5vNZjcJ4TtjG0gWzoe0QQyY6qko
	lJekmKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgsZ-007ZrT-2Y; Wed, 25 Jan 2023 14:35:59 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrm-007ZNm-HC
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 14:35:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id bk15so48086821ejb.9
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 06:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PdB/SfQ0SWBNWh08eH3SW1QsUqwi/lP4LXtXf+kq5IA=;
        b=Dd+et0jm0/0xlucO8IFpitLrtrMSv/ALQqB/ABHM6GgO6GnUzbRaEoTk9f90z5SHOH
         9895maVzDl98Arm+NjPKIpdjElFiPZ9Jeo3LnXvbd4H05ZCFdnrJZi99XjV9DuJIyOuk
         hXLfIXmUZKYnIFIDh41CJkrMdT4MIPZV0C/TCRbZvgVNOnT6O1KVuJs617S0kWw2mpSQ
         uZdVaCSLaejaA7nV+bDUgxTpJXKRrsO9QkaYrxMBLf3VRY+v1eKc6Mv7GoRJIYGKTsQM
         cWQ4yjrV9wrx0iL3inejwa5YjLJHK4dEDve3GY1NPGCTVeDN74focNhN5QW8lINjPCTf
         02Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdB/SfQ0SWBNWh08eH3SW1QsUqwi/lP4LXtXf+kq5IA=;
        b=pjpzuPXNiJbqQU8gPN4XMGKasXnGCVPuVI9YhBs60ftL/rvaHcYw7KSmH565IzWqXn
         7fEKboH62BVTEAadtSxpenDKfC7ZH5EWgAbsc5A6ud5Y0lLAKSsBlziVRepyrtjJFU/Z
         pORsHZB4Z3YCxKLknTjzxB0AcKB5+b4gYE7+48NP/IqjEO6X/+PAJhGH1RDsZWTv+wpQ
         nMORi24P3oJ3S8a0Q5J7nY7XrT5hTJJ/ryVJPyi0h5kmECx1u0zBgVWnXWZiqABiUL+1
         WvR7OIq5eRpEo+NAyEHodm7Xi/VFwCf/D83Ij/Qk9JzNYFaKIyGu+3BDYke9JX22Y6X1
         37Bw==
X-Gm-Message-State: AFqh2kpfvjbl0C2LgJAWGVMTUYMvMDHX0g0YfPQ6ksa2VDX/N/OmyA50
	7ExNQDoS98NJhPZ6rMA8wgEPvBPvT0Hac/kq
X-Google-Smtp-Source: AMrXdXvIoSQXuacQCMREvujIPcbrM3wN6HpuxYCIHNdefXOQtvM5NR0Td/Q1ffeOepulflZ21gnbaA==
X-Received: by 2002:a17:906:6b13:b0:872:cc12:f712 with SMTP id q19-20020a1709066b1300b00872cc12f712mr30129839ejr.43.1674657305792;
        Wed, 25 Jan 2023 06:35:05 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:05 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v9 0/9] Add minimal MT8365 and MT8365-EVK support
Date: Wed, 25 Jan 2023 15:34:54 +0100
Message-Id: <20230125143503.1015424-1-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063510_599084_051D0E70 
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

v9:
  - Fix a regression in v8 that broke the USB port
  - Remove superfluous include in mt8365.dtsi
  - Fix some naming issues pointed out by dtbs_check

v8:
  - Add binding descriptions for mediatek,mt8365-systimer and
    mediatek,mt8365-uart
  - Specify ranges with parameters for u3phy

Tested-by: Kevin Hilman <khilman@baylibre.com>

v7:
  - Update GIC information in mt8365.dtsi (thanks to Marc Zyngier for
    pointing out the problem)
  - Adjust the timer to match the updated GIC information

v6:
  - Add systimer in mt8365.dtsi
  - Add I/D caches and L2 cache details in mt8365.dtsi
  - Move bl31_secmon_reserved from mt8365.dtsi to mt8365-evk.dts
  - Fix inconsistent indentation in mt8365-pinctrl example
  - Further mt8365.dtsi cleanups
  - Submit to additional maintainers spotted by get_maintainer.pl

v5:
  - Reorder top-level entries in mediatek,mt8365-pinctrl.yaml to match
    example-schema
  - Use consistent quotes

v4:
  - Remove pins-are-numbered references that have been holding things up
    now that the patches removing it from dt-bindings have landed in linux-next

v3:
  - Remove a number of components that are not yet supported (they will
    come back alongside the corresponding drivers)
  - Address issues found by dt_binding_check (mostly fixing pinctrl
    bindings)
  - Address issues pointed out in comments
  - Reorder patches

v2:
  - Add missing dt-bindings documentation
  - Small cleanups addressing issues in v1 pointed out by Krzysztof Kozlowski


Bernhard Rosenkränzer (6):
  dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
  dt-bindings: irq: mtk, sysirq: add support for mt8365
  dt-bindings: mfd: syscon: Add mt8365-syscfg
  dt-bindings: pinctrl: add bindings for Mediatek MT8365 SoC
  dt-bindings: timer: mediatek,mtk-timer: add MT8365
  dt-bindings: serial: mediatek,uart: add MT8365

Fabien Parent (3):
  dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
  dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
  arm64: dts: mediatek: Initial mt8365-evk support

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../interrupt-controller/mediatek,sysirq.txt  |   1 +
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 197 +++++++++
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 .../bindings/timer/mediatek,mtk-timer.txt     |   1 +
 .../bindings/usb/mediatek,mtk-xhci.yaml       |   1 +
 .../bindings/usb/mediatek,mtu3.yaml           |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts   | 168 ++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 377 ++++++++++++++++++
 11 files changed, 753 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

-- 
2.39.1


