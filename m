Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4861C43217
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 19:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c8D9/RVdDuV2pZ+DNXsZtuBB7adAeFFAlhmnbxTXvqk=; b=G54tpBZ6i9fhnkJ2UjBe0CyzHf
	yNzG4Y9yWHapjqcL+zBp27JJ5TUgoQ4AILvvYDEoC3/td6JfgF9LM39G78ctpI4JsO2+IHHbq/J+/
	9RDAMtVl+pKiVel/ueBQE8FkJCC2HnoHlCI+d5IKlwefC2mx5FGSoz8ijrMLPCSfjKiCJvErLh950
	zAOlNtPHdE1qQABDOBEt26EP0i1ozz8gaKJ3CPU1b0iPTGabuoH7n6AS9uxq96lFRhxsyGLAR6Rjh
	BnvhKfEwWZFN0R/kFG/M80GQThb2r9GN3MZCsNs5wCG7orMf9LWaMsDIO1m4OQOEmZtnV0B22CsA9
	lFp7fSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osUXI-007wAa-Ba; Tue, 08 Nov 2022 19:45:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTa6-007Zoc-Ak
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 18:44:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id o4so22447709wrq.6
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 10:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=c8D9/RVdDuV2pZ+DNXsZtuBB7adAeFFAlhmnbxTXvqk=;
        b=iDzrfTO37pnnR9yFxcVEXrrx3BRg8hTzeGl4FJPU8DrxThdnB1m3KAyRjmlBGlPAE1
         Vg+PPP/BBYQmb0F06+dmDnjqRgUR8w5BZfHgxWOsLbxJFkCRLSVjKn4St8c/syMKc896
         jGOZlwWSVg1ld+da7GDNWmKl6YlVedoR2a/h8wHKfVqVKnMkL4YfA6TNrTz6QdDsKYi8
         N/oPFLTQEbjRAXtRjHBr2YYIwAY1U5INPJ0LHMo695essxg4dDZ6YwsV71RZ8jRPfoT3
         P3glPEzs1TzxnWYGYsiVKZPL4JxCQhrEaVZKIBwIDwvdKvPYMURdEyQ+EUN1wE3aC4D4
         ZYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8D9/RVdDuV2pZ+DNXsZtuBB7adAeFFAlhmnbxTXvqk=;
        b=z4qEDlrdY4Wq3w/eixLtv/XdCSdoQ2UQiZviYbvVRVCWN1j6HYo1rGrS8/vVOzrVXp
         6WuHY9cZtfizSASFqOby3J2yk4ByhNmhmHTSHv5/NHHQwdZp5JlF3adxZ9N70PckKq8L
         lrxDVD19nO/xcxyxvisB/V0GY9QB5CryVFAc7DJ5lCM97EE+7wCxToiUI1dkgnzEUrsb
         GKCEdqdjZnn1DY7Ft/d77G9E6oFCPXrzHmIDaHtz3ergmABViWnzrh7EyTK0P4fygFHo
         dgvBI9VIrB/X41spL5o5z+ItkGMbuN8ZgyAx5mIjA0bBAgyVAzbngOsTQnsLUjTLhZru
         lIOg==
X-Gm-Message-State: ACrzQf2tDsLi688xOEe+mDSbtf9Q1JbAUFYCCvkYRh5dyYGTlAN2CfK3
	NeAN988VQfMctRBRQdDCCu8Y9Q==
X-Google-Smtp-Source: AMsMyM4Pw/a88iDUdk91jriygXBbx7vziA1KcjbvhTwJTXjUkMQH6uF7UqE6JwKcAvueEVc7v1EWuw==
X-Received: by 2002:adf:df82:0:b0:236:563b:6f5d with SMTP id z2-20020adfdf82000000b00236563b6f5dmr769877wrl.532.1667933052138;
        Tue, 08 Nov 2022 10:44:12 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a05600c3b0600b003cf6c2f9513sm13564009wms.2.2022.11.08.10.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:44:11 -0800 (PST)
Subject: [PATCH v4 0/9] Add MediaTek MT6357 PMIC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAFejamMC/33NTQrCMBAF4KtI1kbSiTHVlfcQF/mZ2kCblKQNlNK7O7gUdDW8B++bjRXMAQu7HT
 aWsYYSUqRwPh6Y6018IQ+eMgMB0Aih+DhfpNK8LNOU8syVkqK1LaCUHaORNQW5zSa6nmZxGQYq+1Dm
 lNfPkwp0Hj+9ClzwrtHWgAcvzPVuzToEm/Hk0siepFX5X5AkaBTWaycbZeFL2Pf9DS0ZTUj2AAAA
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 08 Nov 2022 19:43:35 +0100
Message-Id: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
To: Fabien Parent <fabien.parent@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5627; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=KMqIoFMw2ZsnI4pz2WvDUoOJVAdC7AJXJ4JZ68KdWV4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjaqN6igOZ3wPkALb9neByKV7+WaSiq7dQaGyZmrOz
 uMI+cTKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY2qjegAKCRArRkmdfjHURWWXD/
 0SjwYliYD6yObuoeJtg0IJfpDmts8BUvvTNZwhie1u73bGZ+++aqfHjmB5UkQiOq/m8TYBXWc75PJ1
 KnZTV97qxdUDHrTqQSWV1rqsiLEc3gCUw/5vq8UI5S1tKHafrSoLZJRwT4nQBHe/+gdZlDIhy9coHh
 bSmYYS48rStiXayUrH9sCwTT5w8vhlokrOp9C4F/ZHc8ml+bTLTJG5jUstA3Ji851lxN1HHg/LgAzD
 la4e42RFpkZ0BMvUPrfWo8iEFC7Y1jO0GwmRmNBaaCt/G9Wg6Dx6geaDG0MpWwbnE49sy7j9E1sMci
 VmQVPWlzVvmDn0LrUiUNmn+ruoZfON8tE3BYKwjkoYMW6XToEbp1gehV8H4Y0/DRW4Ks4hXLdjrMnW
 RzKOaWin6APvF0RkFz96LX2KJJPZzmOE3uEuRfhRKl+U9VAKxXKUSLSYCS4GJrpzRXTimN7qRPtaf7
 aeKkTNPsHMcokHfJ+7ZbEdz0g+un7jngXPCU53bXs+QXHREc+pGNP6u4dlexOTcv7rcIfD1ARUKNo+
 FasIgRhDtGsYEo0zl5NEyiWNnpjoVqCUKJovCcd87/zQPi3/zrPgu/tMdMTI2l+38p8YydymE3xg/v
 d3J4M9igDBzDA5WLdNi071vG+AOuUP9lQW1LVTHBvZKGt5Qb6Gc5wjh/Yxmw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_104418_395574_7C7EE65F 
X-CRM114-Status: GOOD (  20.77  )
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
This patch series adds MFD, PMIC keys, and regulator support for MT6357.
MT6357 is a MediaTek PMIC very similar to MT6358.

Currently, MTK bindings related to the PMICs are not converted yet (still .txt):

soc/mediatek/pwrap.txt (all PMIC parent)
      |
      V
mfd/mt6397.txt (support lot of mt63XX PMIC)
      +---------------+----------------+---...
      V               V                V
regulator/...      rtc/...          codec/...

1) Convert pwrap to yaml is ok.

2) For the PMIC bindings, there are two option:
- Convert mt6397.txt to mediatek,mt6397.yaml and continue to support multiple
  PMIC with only one file. IMO, the file will be hard to read because
  the supported features aren't the same for each PMIC.

- Make a binding file for each PMIC ref:
    - mfd/mediatek,mt6357.yaml
    - mfd/mediatek,mt6358.yaml
    - ...

3) All PMIC daughter bindings (regulator, rtc, codec, led, ...) aren't fully
converted yet. Refering to the two PMIC convertion options above:
- To be clean, all daughter bindings should be converted. This is hard because
  a good understanding of each device is requiered to write efficient bindings.
- Only daughter bindings supported by the added PMIC should be converted, that
  allows to do the task conversion step by step.

In the V4 of this serie, I chose the second option.

Regards,
Alex

Changes in v4:
- "dt-bindings: mfd: mt6397: add binding for MT6357" has been applied
  by Lee Jones
- All fixed regulator are now refering to fixed-regulator.yaml
- vfe28 and vcamio18 regulators have been added
- pwrap binding has been converted and mt8365 support has been added
- Change node names for mt8173 and mt6358 SoC to be consistent with
  pwrap documentation.
- mt6357 PMIC binding has been created
- mt6397 RTC binding has been converted and mt6357 support has been added
- Link to v3: https://lore.kernel.org/r/20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com

Changes in v3:
- To be consistent with regulator/driver.h and helper.c, shift
  variables have been removed and the mask values have been directly shifted.
- Remove index tables and rework volt tables to use set/get helper functions.
- Add comment to structure and function.
- Fix Fabien Parent mail address.
- Link to v2: https://lore.kernel.org/r/20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com

Changes in v2:
- Rebase
- Fix typo
- Remove dependencies with https://lore.kernel.org/all/20220415153629.1817202-1-fparent@baylibre.com/
  which is no longer relevant.

Previous versions:
v1 - https://lore.kernel.org/all/20220531124959.202787-1-fparent@baylibre.com/

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen Zhong <chen.zhong@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Fabien Parent <fabien.parent@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sean Wang <sean.wang@mediatek.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: Fabien Parent <fparent@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

---
Alexandre Mergnat (5):
      dt-bindings: rtc: mediatek: convert MT6397 rtc documentation
      dt-bindings: mfd: mediatek: Add bindings for MT6357 PMIC
      dt-bindings: soc: mediatek: convert pwrap documentation
      arm64: dts: mt6358: change node names
      arm64: dts: mt8173: change node name

Fabien Parent (4):
      dt-bindings: input: mtk-pmic-keys: add binding for MT6357 PMIC
      dt-bindings: regulator: Add binding schema for mt6357 regulators
      regulator: add mt6357 regulator
      Input: mtk-pmic-keys: add MT6357 support

 .../bindings/input/mediatek,pmic-keys.yaml         |   1 +
 .../devicetree/bindings/leds/leds-mt6323.txt       |   2 +-
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 102 +++++
 Documentation/devicetree/bindings/mfd/mt6397.txt   |   4 +-
 .../regulator/mediatek,mt6357-regulator.yaml       | 292 +++++++++++++
 .../bindings/rtc/mediatek,mt6397-rtc.yaml          |  40 ++
 .../devicetree/bindings/rtc/rtc-mt6397.txt         |  31 --
 .../bindings/soc/mediatek/mediatek,pwrap.yaml      | 158 +++++++
 .../devicetree/bindings/soc/mediatek/pwrap.txt     |  75 ----
 arch/arm64/boot/dts/mediatek/mt6358.dtsi           |   6 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |   2 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   2 +-
 drivers/input/keyboard/mtk-pmic-keys.c             |  17 +
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6357-regulator.c               | 453 +++++++++++++++++++++
 include/linux/regulator/mt6357-regulator.h         |  51 +++
 17 files changed, 1132 insertions(+), 114 deletions(-)
---
base-commit: e7f535c0775b896befb4f6765c02bc065fd26156
change-id: 20221005-mt6357-support-55308b82e33f

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

