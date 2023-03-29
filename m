Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69049C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uzdO+lxAfOJTORFrou5SxAjDVdCRcCpSAaKg+Ly9+Yo=; b=NtvFvFrHU0ouxk
	GUYCn6vOEXvfUEM5q6+2kAyb6t+1mqlBuNWAswR+GLvGnRKumyGdHkbbLVNFybmJuBNkLrdyK7SN3
	7bY1/tT861pqcVZiM4DGCGhxc/XEa3HgBO2A0tP0o6B4dLpCVoSqK0bO/Rhvl4wSrNXSoTR8hNn98
	gbwDJC+Lc+zxloQSwzqRhVYJDMnLorUOUmLzeXG+lKlbWW5iHueEtRR29uIANtkagBaoPwUnI1tQK
	uqGb1YHHfxjdblIMYSPPOu/+ou8B3kw+k90iSVD36dDTNt4BHoXeuR2McBn0UXadZpFyYM2r4Gjdm
	Ah/0XsBm0zobY3yhgIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phRaD-00HCcR-2G;
	Wed, 29 Mar 2023 08:55:05 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRa5-00HCUn-0z
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id y14so14859351wrq.4
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080093;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzdO+lxAfOJTORFrou5SxAjDVdCRcCpSAaKg+Ly9+Yo=;
        b=4sW4i7rA5XGJYWXbRj7E9hHI/H8WM4pXoWaXpU/eM7Y6mgfqcI722Nvfi0AtZr654k
         Pf2WGcgNZXvzbYJ2Jf3ecdD1GMyApi+9xQeRVG993cYY891D1SS+UCHvfaTQauRsEjtG
         a7/UgoT92z2OdSbT9YrU1bTuD3i5DOZzn9CwY0V3PjMe1nAsGQbvNbDYu5ePqQYCSVtd
         I/uM2mEn7ZvBLKTQdm0lXx9NOj6W8JpKz6jMqkjljdXmRhh84m28diVuwRoEYGb2igUe
         OZ8mrFZN0uHCTY5CQaLKZTHgbE2ejaRty8T7OBEe8fG1LKeYLjqXKsMV+slOMPMbkNau
         aiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080093;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzdO+lxAfOJTORFrou5SxAjDVdCRcCpSAaKg+Ly9+Yo=;
        b=Xxvsis7bZj42y1Dutzg335MWFdANJT9fmLVOZ2oNSgb1nNurIr46ioXobjFicqNT35
         Q/yDB6FihghFqYpndqHkHzMkdjUaXoPtzRHzG968cCTOMQwp3Gd2ATJhPh6Eo/LGNnmB
         ukQselSGTtb4r0+NBzLpdemta9cVd4qEObaBs9fokZ2gI1mTqU7EezhfjcvuzIUiaifE
         dt8NeFDa/C0BHCifCg4DZCxMWlec39eIQii1BdK1XyvEnaR2Y5hBORLRzr3z+66rSVdM
         KTMJAbI4+esQ0ZE1MaW5vpm/33FFB/Zf+4yXPuelTqY6GkcSI4+9y4UdD7H7r+34Uex+
         9wjg==
X-Gm-Message-State: AAQBX9daB+NxgJKBCQe7oDkBzv2pCHoIBC4XHEPjELIi/Xt7FEQFpYc4
	8zFAtxkzC1hpBBjvxagXrEptBw==
X-Google-Smtp-Source: AKy350YBJmqeUhUjQyfCAqVgv5XtFtzTflowmykdXvxURkGr/ltJSCccPuaqoPcUxGCCy4NGiuPXBQ==
X-Received: by 2002:a5d:5229:0:b0:2c7:1c08:121c with SMTP id i9-20020a5d5229000000b002c71c08121cmr15195510wra.61.1680080093551;
        Wed, 29 Mar 2023 01:54:53 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:54:53 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 00/17] Improve the MT8365 SoC and EVK board support
Date: Wed, 29 Mar 2023 10:54:21 +0200
Message-Id: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL38I2QC/4XNTQrCMBAF4KuUrI1MEtuoK+8hLvIz2mBNStIGS
 undHVy60NXwHrxvVlYwByzs3KwsYw0lpEhB7RrmehMfyIOnzCRIBRIUx/rkNpnseZnHMeWJ+9Z
 qc1Qn9Noy2llTkNtsoutpGedhoLIPZUp5+fypgs71F1kFBw4dKKmhPQjfXqxZhmAz7l16sRuBV
 f5FJCEdOu28FeDc/QvZtu0N/ksqGv8AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2566; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=g3X31va/VDwpY2eFLvZJUQe6Yd+D9Pt4ItUQKxlH3oA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zbKYL5HQCSxV8z4D6VVyX8VhpZc/3jth3XoWuF
 qJn1N86JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP82wAKCRArRkmdfjHURScIEA
 CvYNYx5SNpOC5jRj/ilI2B3OdPkasa3RaWWW303TI7JDD0gGDMXX+bHpcCYqVzFg7FlcnIcGBjRs7E
 Jr6x1jv3WkPl5+mUAELpby4F5zh7pegFOCfcrJ9HtcHX/cdLEiRJ2umjXGlu5VQVuv3ZmQEOcV3WJh
 tfPh92mwf0eLS8lfXw7tOkky3kpD387xb1JgnN9gsUCDBsjUIU7MRcJx7HHQcjiuUrrytSt5klBcwP
 9RZ71pZfTDDD7VRiM9VxlvU3th766j4bA+UqINLHM2IohbGpCr6NbhVrD7JdqJF5gJ9eOP4LshWjqE
 0+vNMsXOpmmcpugJkEQ7zuL247NHfgZU29xmUlpq7KtYjW2YXseIG7G+p5SpKY++45RS4GdgJMDIl7
 E0wUMxMkzJ5BgIea5tQTfSJ85Ooozh+mLb1d1svXE0aR55EV7xMvr/RdL/c89cCJe+F1btaWHk3rUk
 4Qdgrma2LVv/C+4vvTt6csqs2Zl6YN10PeMMsEpPTHlfZV+zcyQ40vAvYMBS+SPPoN5Tc9rk9rRglf
 Vrx1rY1XqtGk8xcwjoVxdp+k09y3RfKcUJuouOkpVUefkghZJrMM1r5dkDP8irJkJB04SiQB9CkCH7
 ESqzmMQ6PBazV6JhB2Ilp9LNDGhUWQvC6MYaVdy3ipJxNsnZzVPL/SultYNA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_015457_349799_73E140C9 
X-CRM114-Status: GOOD (  11.83  )
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v3:
- Add trailers and simply resend.
- Link to v2: https://lore.kernel.org/r/20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com

---
Alexandre Bailon (1):
      arm64: dts: mediatek: Increase the size BL31 reserved memory

Alexandre Mergnat (12):
      dt-bindings: watchdog: mediatek,mtk-wdt: add mt8365
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

 .../bindings/pinctrl/mediatek,mt8365-pinctrl.yaml  |   3 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt6357.dtsi           | 282 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 254 ++++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 196 +++++++++++++-
 5 files changed, 731 insertions(+), 5 deletions(-)
---
base-commit: 555b3a55823ec063129de4403899203febb58788
change-id: 20230203-evk-board-support-d5b7a839ed7b

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


