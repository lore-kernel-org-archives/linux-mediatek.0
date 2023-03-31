Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D53C77B6C
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fsdpYjF3syBHZgFNYzSRIs96odbvYEi5NYnPkaWji2s=; b=nkFUKxD1q7Zk5W
	0CHUg0k8Hhm+09SrqQM3kWPi4969qkYHTuLZSGPnUzRyoNEO3mbxxx0zAttQhuMJRnTw/wVPAypL3
	rNMpTKYRRsRdVPP2DtXIYN7Jq7nT445iNlt6YmiaO6BEiMy/Zqgs0muGo+xnenIbJFAPV6LRLqGu8
	9GETWDXL7U44YFGjFWebJlPVcvjiktAlDEvs+JKsvSVHBUi9nw3BIhVD2dKEwnOObL/tSGVcZMO3i
	csY9iE+PJuQfSLJqJ/4yjaQQZQoWnjw5vU3NWJRmdRv1ouE6E+vPdUWSXWFDsmD98NBs8Lz9l+c5G
	VH1JX9MkuSzkk7njQG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyq-008Mr0-0n;
	Fri, 31 Mar 2023 17:56:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyR-008MaJ-15
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:55:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id v6-20020a05600c470600b003f034269c96so4169833wmo.4
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285333;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fsdpYjF3syBHZgFNYzSRIs96odbvYEi5NYnPkaWji2s=;
        b=D7fMYdzDV7g7vU0VtE5FK+/I/b67QflgYkVGo3+z6uejVQqKRbhrzkGl6wBwAIaCFe
         mjoOxShki3XXGhnp1HrwTqOqZ4VqJ693r7oBiAmdCyICnSE010hxHLZEQi/32FLdrre+
         ZfFroHJa2PJ8/91y4Z96ESDqaDucBjOGLDhT7lhr9CNlbr5to9fOfanR/NOnSSXtr2AN
         XZN9REigG7TAw+usWXRan3gMo5Nv4+qeqc7zz7FLe7/UPKXQ1OsSZHdWmi+fLiBoKktp
         c201ih/2dP1lRwQC3ePlipZN52062wclF32GY1UOJzDGLU/VjNVqfC5ywUrdJzhfFg+E
         BWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285333;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsdpYjF3syBHZgFNYzSRIs96odbvYEi5NYnPkaWji2s=;
        b=UuyT8s26PTF7251MVjxCTJATHlThsojzL1NccGbXyJ5Ib7YFWAhDbcL25wQ29kHt2M
         v4aU+U+TwzJfSrx+pq4K64/RHCftBUFMuNZDW/GRs+qzWq1k+kBx4dfYRB/lLHe8/S9o
         S501EGpkV1kQTxp4y1fZ9NRW/X5o8BX7tQHRkdFaHAsdcpxGEhKp3+PtocMuotgWwaPl
         /8KAywgUUN/pYPBJWFtMZwwfCT4lXMW8OgcmRj2MQ2OHH2kA9xoaxS850p9LuVZkfvgQ
         Q08hy2DcRU8a8LX3baRinJemndmKCEGNn8PYW6D4gq9bHCjI12obpho1GnsLn23Qmb6J
         XTMw==
X-Gm-Message-State: AAQBX9dKJiMF5HsDGsi06UBtY6fxLLynueTPpSt0Pva5yfL2+cr8mROL
	7bYxcdG+6IuMBlw+wPqsDwsruQ==
X-Google-Smtp-Source: AKy350addcoFAOVXSbc4akoysm1SuwS/0dymFAe3JQRHQ2q6/IjRuVXoPj9fXXz5CNR8FEJY3RL4Dg==
X-Received: by 2002:a1c:4b04:0:b0:3ed:c84c:7efe with SMTP id y4-20020a1c4b04000000b003edc84c7efemr7957386wma.7.1680285333533;
        Fri, 31 Mar 2023 10:55:33 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
Date: Fri, 31 Mar 2023 19:54:44 +0200
Message-Id: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGQeJ2QC/4XOTQ6CMBAF4KuQrq0ZWqDgynsYF/0ZpRFb0kITQ
 ri71aUxspq8Sd43s5KIwWIkp2IlAZON1rscqkNBdC/dHak1ORMGjAMDTjE9qPIyGBrncfRhoqZ
 WQra8QyMUyT0lI1IVpNN9brp5GPKyt3HyYfncSWUel39kKilQaIAzAXVVmvqs5DJYFfCo/ZNcM
 5jYLsIy0qAW2qgStL79QPguwt+fAHBsAQG670+2bXsBCfE25UQBAAA=
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3143; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=g6QcyfmR6WQISod8SsOAV0fvqJ4GAS81PN4pXjBo1YI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6TMUNWgOq1M9kKUf8Hyk+HBOdRhDM9kCQ8bvha
 bettplqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcekwAKCRArRkmdfjHURVMjD/
 sEAJOXUkkF49/VjifC4cfaa2kBphhLpZPFyZy+n/avDNRgE0iHhywdwOmcPqZoob/ZC+ULKnr1iYUB
 jpeARQaaZzTHRbDD51JpBrsxftK5O/c8O227dK9uOysUNhW5W1ngRT/WYjPHcrsiAq0vBKnzKiz1R0
 KEynockGlTutS1AuGmD9ITjENf10wKwmw1jjX64D6wtrjqpYcDjvNlcXnTe9q46n6Uu0tr5m2MZnI8
 PpDHL6HvtelgbCbq0aFu51UtSUjS3Z+ULBlcVUgZGUk/G3l8JYd281XbtWtmOjd1jSwo+KcW9QbtAz
 AU0Ac7bJeZl2pk/rhm4HOEd+kZwtwxwKjdG6d2OIGi73PWTaX6q/QbZiTyIOSNjx0JDsY0GvQhgGwO
 NL0DJ1/RZAo2eJ/KCQ/JJssDycLH419+aY9YV+jI7mr3MUX8wnx3gOWzyfEYnKuilohS8BVB/WlUyE
 aLQ9QEz5YrMhCgCOJNmkFYI3qMO1phScvcQxFquHtQp01bP/Jhy69kKp1PyzO3+2qJ1Gd/MNhOCOey
 6Xbat62XXilnLPLqOpHdWFcs/Gi9a132g0wSLG3ylrVEQLUIst/WeJG6fr8X6zgusgsd9aA/kX/w8/
 ZiHx2EevzYolV+Hp0a2u1fyFnf0ZqIXSQAOOWwci5AB6/4szhTi3CECHgI6g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_105542_498449_56950028 
X-CRM114-Status: GOOD (  12.60  )
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

This commits are based on the Fabien Parent <fparent@baylibre.com> work.

The purpose of this series is to add the following HWs / IPs support for
the mt8365-evk board:
- Watchdog
- Power Management Integrated Circuit "PMIC" wrapper
  - MT6357 PMIC
- MultiMediaCard "MMC" & Secure Digital "SD" controller
- USB controller
- Ethernet MAC controller

Add CPU Freq & IDLE support for this board.

This series depends to anothers which add support for MT8365 EVK board
[1] and the MT8365 I2C support [2]. Both are currently applied.

The DTB check may failed/warn about pinctrl binding, but it should be
fixed thanks to this serie [3]

Regards,
Alex

[1]: https://lore.kernel.org/all/20230309213501.794764-1-bero@baylibre.com/
[2]: https://lore.kernel.org/all/20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com/
[3]: https://lore.kernel.org/all/20230327-cleanup-pinctrl-binding-v2-0-f21fbcc3016e@baylibre.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v4:
- Remove v3 applied patch from the serie:
  - arm64: dts: mediatek: add ethernet support for mt8365 SoC
  - arm64: dts: mediatek: add mmc support for mt8365 SoC
  - arm64: dts: mediatek: add mt6357 device-tree
  - arm64: dts: mediatek: add pwrap support to mt8365 SoC
  - arm64: dts: mediatek: Increase the size BL31 reserved memory
- Drop "arm64: dts: mediatek: fix systimer properties" which is done [1]
- Fix style, typo and re-order properties.
- Use interrupts-extended for the PMIC node.
- Link to v3: https://lore.kernel.org/r/20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com

Changes in v3:
- Remove v2 applied patch from the serie:
  - dt-bindings: mmc: mediatek,mtk-sd: add mt8365
- Add trailers and simply resend.
- Link to v2: https://lore.kernel.org/r/20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com

---
Alexandre Mergnat (9):
      dt-bindings: watchdog: mediatek,mtk-wdt: add mt8365
      dt-bindings: pinctrl: mediatek,mt8365-pinctrl: add drive strength property
      arm64: dts: mediatek: add watchdog support for mt8365 SoC
      arm64: dts: mediatek: add mt6357 PMIC support for  mt8365-evk
      arm64: dts: mediatek: add mmc support for mt8365-evk
      arm64: dts: mediatek: add usb controller support for mt8365-evk
      arm64: dts: mediatek: add ethernet support for mt8365-evk
      arm64: dts: mediatek: add OPP support for mt8365 SoC
      arm64: dts: mediatek: add cpufreq support for mt8365-evk

Amjad Ouled-Ameur (1):
      arm64: dts: mediatek: Add CPU Idle support

Fabien Parent (1):
      arm64: dts: mediatek: set vmc regulator as always on

 .../bindings/pinctrl/mediatek,mt8365-pinctrl.yaml  |   3 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 249 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 142 ++++++++++++
 4 files changed, 395 insertions(+)
---
base-commit: 4f2a499a344b36ebb325e610265452ea88541116
change-id: 20230203-evk-board-support-d5b7a839ed7b

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


