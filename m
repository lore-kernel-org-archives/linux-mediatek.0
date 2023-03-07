Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F424C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FErDB2QxC4C66LNZnmnFx/Fx06JFE76GqYeP1O59zpg=; b=m7s4iHB/xWYRvd4+NmXCaKoU4N
	MRQOzKv4t9oCEJXT2onZesubIKL1CAImLKG4AsgwgImnKq4XcTDRDCwN1xYpAdL07E8ZPRyXNWoVt
	9yNgTBRpI0WygKpmHysUGFi6OlNuHbjvpobxM+TwlAlmSUGMiUGSNsJMMZgfQwrj8WoMRcSd/9eyf
	vYH1p27xmDDyhdlC879S/QTyyybH4AGhW/nVa72OfQ8qMxjeMvMrLR+kOPfhMXt4UapqcDkYCDRtt
	0oAL6rOAGyNbmNgRaQlWnjFc4S4CCpANLUMkbABusg0NdY/kTjjDFA52/r1EMKkRy4nWlLLZAqf97
	K4/4OGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXDm-000K9s-Ez; Tue, 07 Mar 2023 13:19:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCb-000Jds-Q5
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so10386350wms.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195078;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=FErDB2QxC4C66LNZnmnFx/Fx06JFE76GqYeP1O59zpg=;
        b=h6uY2EtG+p3XasaNd+XTZWHspO9GrnI0mr+YdSWTtBAQsy7Bi9uowE7fe6Eu1Yl7W5
         G0HO5Q+BcrI9RwZMfd7MAbL0NcyDiiOv9UyOIGBJACqF8TGEKxX0dMSiyaTEGcP63fHt
         /LrSrfJJN8Nvs2Hi5GECI04n6W7lAZ26b+s+d69+tETEUQMxWm0ZIJccVkiBS7RaaKbl
         hcxvQiml4lmLm/ezuYk0egV+6K9zwjl1Js4uC3mBjWbzN3ie21eqeHNr00uoasxErlU6
         cEq/o/7CiGUtJwb06b7T7uK8/GlcGiOAfQ75Wmbma7z3ssEooubCnqlJElTn46olzI/9
         5SDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195078;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FErDB2QxC4C66LNZnmnFx/Fx06JFE76GqYeP1O59zpg=;
        b=d6TRJ1l2+2F22DC0m/zd9Kyi4b88ropUuXiLZhXeE3bpCA8YiIeU+jhd614sCZaAQG
         Pl25zVry2x5lu80+t3ssHcGnMQqHFKgMHkEvjgdFktthBpgIfr7Dykh7+qR4XJrseIY/
         aU1kxN75JNHJKpNryxtbyQmeUXEPcMkyE1u7Lz9KVeSr5bMcHtMcg+qWMTqlwxwXQw/X
         diWXGa6aR4sygYo+ylMxamZ4MOpjK2Keo8WUtpC/GoPjOitQ7/Nq2TpKsxhmM0HWfhub
         FUt5d9D43Lv21Jezrh1NsgU5UXF7yMCpxmD6+oh9SsgpRJSjlznIvz4K8cJnllu4i58A
         wMNQ==
X-Gm-Message-State: AO0yUKX/+zfsBmV3qKvutAEIWKcrlGsPWF6rpcH4LSb3LuWyEet/7wSk
	EBvU0Xz5a2JQgTb0225Mj3P+CA==
X-Google-Smtp-Source: AK7set/34GFqZ9L0STo0QtIpXQReOc/TVcJJTZmh2RCOrTUaz0yGuAi24WmOAkXR8Y/FUFT8GPB/kw==
X-Received: by 2002:a05:600c:5127:b0:3ea:f01d:2346 with SMTP id o39-20020a05600c512700b003eaf01d2346mr13149157wms.15.1678195078544;
        Tue, 07 Mar 2023 05:17:58 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:17:58 -0800 (PST)
Subject: [PATCH v2 00/18] Improve the MT8365 SoC and EVK board support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAGk5B2QC/32NQQrCMBBFr1Jm7cg0sVZdeQ9xkWkGG6xJSdpAKbm7wQO4+rwP7/8dkkQnCW7NDl
 GySy74CurQwDAa/xJ0tjIoUpoUaZT8Rg4mWkzrPIe4oO24Nxd9FdszVI9NEuRo/DBW06/TVMvRpSXE
 7feT2xqPf5O5RUI6k1Y9dafWdnc22+Q4ynEIH3iWUr5Rhyz2ugAAAA==
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:29 +0100
Message-Id: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3486; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=oMGELdywGcxGCZZ0PJs/nWg37dQTxAqycoy+1r7+YVE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmE9DRcpT2wyNkQQPpULwZbCpXSpYtCGH2LAeIf
 xY9kChqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hAAKCRArRkmdfjHURdvFD/
 46HgFIJ7IITIG+sKG2QOTy+4nEriLteT470trZBOF8hAlef2KMndQjleEGBcuX5nB4J/Tlv03lE71l
 9FweYjq47R+Sj0dGSRDk9Jwti/bKhlAqTD6uIEnpecvW9LyptowNe3eE1CC1O0D5/2ZkQYJVfRsDNV
 jbteEYVIXFMxh2cqqzCzfr9AtOISWLaQhYPRaWU3XW84qkctFbWISwLMk9I9+v76jY90GP6k0w3ylv
 DEKeKi55bluIlvGGFDEe4+1X1Ln0ZIFMOZOEMSIT6XLmqbuAbAm21VkIMR2SOvnWD6FzUfDUb45ZWE
 47cija/C9BkWP3vRVUJOQurSUSjvvwNkJ4qAkgDgj7skZT6N3+R5UXj7tu9Z3KkI7Km8gQYqtlQeL2
 e51afjbXjA2WuNOMydosHRoNlSPrg8GxtDGtX3o5ojnC0JdIjLRlqO1zz2c9ILVL9NWuxJ8Zhwb6KK
 N1GYJp15e6e6MAflleqZM0Nlm+cVJ3VsoFlIr3rFSuJ/CC4BJ3duVgUvQvUT9hW2BPyaJ4qYEHQp4Y
 /Q+OsMDN/mm//axUUqFNDhPJBuY5ls6xbIj5l9NQJ+NsFNNY8mFpWGPblBdKU7bw5Jy2DOn1aG2ekn
 +NHfAUuh6Q9ltvTsFbhrynCkwtSyPZKp6oCFNFK6bQKmXKdCgRW8XRYoyTPw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051801_901293_CB28EC50 
X-CRM114-Status: GOOD (  12.54  )
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

This series depends to another one which add support for MT8365 SoC and
EVK board [1].

Regards,
Alex

[1]: https://lore.kernel.org/all/20230125143503.1015424-1-bero@baylibre.com/

To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
To: Wenbin Mei <wenbin.mei@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: Bernhard Rosenkränzer <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: Alexandre Bailon <abailon@baylibre.com>
Cc: Fabien Parent <fparent@baylibre.com>
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

---
Alexandre Bailon (1):
      arm64: dts: mediatek: Increase the size BL31 reserved memory

Alexandre Mergnat (13):
      dt-bindings: watchdog: mediatek,mtk-wdt: add mt8365
      dt-bindings: mmc: mediatek,mtk-sd: add mt8365
      dt-bindings: pinctrl: mediatek,mt8365-pinctrl: add drive strength property
      arm64: dts: mediatek: add watchdog support for mt8365 SoC
      arm64: dts: mediatek: add pwrap support to mt8365 SoC
      arm64: dts: mediatek: add mt6357 PMIC support for  mt8365-evk
      arm64: dts: mediatek: add mmc support for mt8365 SoC
      arm64: dts: mediatek: add mmc support for mt8365-evk
      arm64: dts: mediatek: add usb controller support for mt8365-evk
      arm64: dts: mediatek: add ethernet support for mt8365 SoC
      arm64: dts: mediatek: add ethernet support for mt8365-evk
      arm64: dts: mediatek: add OPP support for mt8365 SoC
      arm64: dts: mediatek: add cpufreq support for mt8365-evk

Amjad Ouled-Ameur (2):
      arm64: dts: mediatek: fix systimer properties
      arm64: dts: mediatek: Add CPU Idle support

Fabien Parent (2):
      arm64: dts: mediatek: add mt6357 device-tree
      arm64: dts: mediatek: set vmc regulator as always on

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml  |   1 +
 .../bindings/pinctrl/mediatek,mt8365-pinctrl.yaml  |   3 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt6357.dtsi           | 282 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 254 ++++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 196 +++++++++++++-
 6 files changed, 732 insertions(+), 5 deletions(-)
---
base-commit: 555b3a55823ec063129de4403899203febb58788
change-id: 20230203-evk-board-support-d5b7a839ed7b

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

