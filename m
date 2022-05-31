Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA88C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xEqqfQMlEN7Cop9BntYVYgTNAo30b/q18y8H/DThwtQ=; b=qoch882zG1fvl6
	vd+ndH/4RQS4oF17XuAlr+d8+lB3OkS3xZ0FgTW207AIXRPzXSzGOkjlfrC7B8l9vuMJeFT5BwupK
	N9jP3u4U5fYgk5N48xRlBExFkwzuzBbvVUrFZ0Siq8nDd22rd4oBAifqHEKdVdo/TIkfzQaS5n4j6
	iHI7jMzwM3lXk7lKHxLGLw3ahbGW4z1mIkO7tB9qy6l7X0NtCpgapWf7vETCkvPw+CIAs2ZAc8DK9
	m59BpKTGQPkDhVYQtfHoqrEm7ACJy0VrMUX8JltzZ20yQFv68cPZMxpjervIGD00NdoovclwdzlBp
	R4P1XuQqbP/ZDebKHkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvzuE-00AMoP-9H; Tue, 31 May 2022 11:19:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvzu2-00AMiU-BO; Tue, 31 May 2022 11:19:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id c2so12569261plh.2;
        Tue, 31 May 2022 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PAfP1TfQKp57sKoK4miFwW50pUBbnmoGxnEIvXcM/g4=;
        b=VxbJrcEqXZrBzeefY+0uD9QcWn0EWa3c8fagyKu8A7g1YljQHCkjN/wLxIY7lK0PTF
         hnXZLA5SvlwBMMejDWuakWyTh2MusBV6ReGoBEPolhpc8+AhraqAiYfufwIQ+VmSFHuZ
         X7j5qcSxfxPpvm3xeCcvB8KArI8FMvvXtzTKhxbPh8gairyuBP1mbBCW9+Yh74HVZINo
         WlS8In9e6fmwq4+8ZRiV21yFvg6E7863L35z1vnLs6iqOsa/Li6g5VYsOzIv8gchvOqf
         Zy5YErt5vCJBYwqAaZG6pMyfDnqK3J65GVweAY6/PZBszLlWKBkwofxJYqtBTkIVNASd
         xnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PAfP1TfQKp57sKoK4miFwW50pUBbnmoGxnEIvXcM/g4=;
        b=lGpW4YKU7oLQd75XMaYUGccF8S8BNmjyfdhcmtRZmf6WApE/NK2AuWLJa73PEWHBOT
         ZVSk4Jh/T/HI7PiYoOxWvspNSdmLawSxrboKMResA5sQaUTBcDoXiLY07n+wDsD4v+AL
         wyEXe7tA7JdodjJLenPRyvO/fyIdjelYLPdvzfg2GXXKDMHaZxFXgqbPsVkN/PSDxk0F
         sdK9qArHOZBRCkQT3XkDV98Nc1zT5qeDNAsOr9pQIKymTJ9kQhzIhgXl625ggmy0P3/j
         YOu8YgW9t4Le1fIBUKtcSNjP97gARQCj6rlihPJshPD4MBg2M1ECsnNUouKfDnpwCMUy
         2Lqg==
X-Gm-Message-State: AOAM530LIPHiviyCKOTIMkl3wq1kArCudrJqL4Ykf3JcoBL/7pWMF2Q1
	0sd9v2W3TZDRNPTmuCjPn6E=
X-Google-Smtp-Source: ABdhPJxhWTb/Mk+ejJKNKtSGdRVZoSfW873ok5RFT4PoJkUb/S/OY5WkMvOd9idL4wo2nH2gDZDMAw==
X-Received: by 2002:a17:90a:4209:b0:1df:b907:ed3d with SMTP id o9-20020a17090a420900b001dfb907ed3dmr28446184pjg.40.1653995949025;
        Tue, 31 May 2022 04:19:09 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 04:19:08 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de
Cc: cy_huang@richtek.com,
	alice_chen@richtek.com,
	chiaen_wu@richtek.com,
	peterwu.pub@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [RESEND 00/14] Add Mediatek MT6370 PMIC support
Date: Tue, 31 May 2022 19:18:46 +0800
Message-Id: <20220531111900.19422-1-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_041910_433234_FEF47AE8 
X-CRM114-Status: GOOD (  11.31  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Sorry, for the patch dependency, we resend this patch series and we're
sorry for any inconvenience that we may have caused. This patch series add
Mediatek MT6370 PMIC support. The MT6370 is a highly-integrated smart
power management IC, which includes a single cell Li-Ion/Li-Polymer
switching battery charger, a USB Type-C & Power Delivery (PD)
controller, dual Flash LED current sources, a RGB LED driver, a
backlight WLED driver, a display bias driver and a general LDO for
portable devices.

Alice Chen (3):
  dt-bindings: leds: Add Mediatek MT6370 flashlight binding
  leds: mt6370: Add Mediatek MT6370 Indicator support
  leds: flashlight: mt6370: Add Mediatek MT6370 flashlight support

ChiYuan Huang (7):
  dt-bindings: usb: Add Mediatek MT6370 TCPC binding
  dt-bindings: leds: mt6370: Add Mediatek mt6370 indicator
  dt-bindings: backlight: Add Mediatek MT6370 backlight binding
  dt-bindings: mfd: Add Mediatek MT6370 binding
  mfd: mt6370: Add Mediatek MT6370 support
  usb: typec: tcpci_mt6370: Add Mediatek MT6370 tcpci driver
  regulator: mt6370: Add mt6370 DisplayBias and VibLDO support

ChiaEn Wu (4):
  dt-bindings: power: supply: Add Mediatek MT6370 Charger binding
  iio: adc: mt6370: Add Mediatek MT6370 support
  power: supply: mt6370: Add Mediatek MT6370 charger driver
  video: backlight: mt6370: Add Mediatek MT6370 support

 .../backlight/mediatek,mt6370-backlight.yaml  |  110 ++
 .../leds/mediatek,mt6370-flashlight.yaml      |   48 +
 .../leds/mediatek,mt6370-indicator.yaml       |   57 +
 .../bindings/mfd/mediatek,mt6370.yaml         |  282 ++++
 .../power/supply/mediatek,mt6370-charger.yaml |   60 +
 .../bindings/usb/mediatek,mt6370-tcpc.yaml    |   35 +
 drivers/iio/adc/Kconfig                       |    9 +
 drivers/iio/adc/Makefile                      |    1 +
 drivers/iio/adc/mt6370-adc.c                  |  257 ++++
 drivers/leds/Kconfig                          |   11 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/flash/Kconfig                    |    9 +
 drivers/leds/flash/Makefile                   |    1 +
 drivers/leds/flash/leds-mt6370-flash.c        |  665 ++++++++++
 drivers/leds/leds-mt6370.c                    |  994 +++++++++++++++
 drivers/mfd/Kconfig                           |   13 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/mt6370.c                          |  273 ++++
 drivers/power/supply/Kconfig                  |   11 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/mt6370-charger.c         | 1132 +++++++++++++++++
 drivers/regulator/Kconfig                     |    8 +
 drivers/regulator/Makefile                    |    1 +
 drivers/regulator/mt6370-regulator.c          |  389 ++++++
 drivers/usb/typec/tcpm/Kconfig                |    8 +
 drivers/usb/typec/tcpm/Makefile               |    1 +
 drivers/usb/typec/tcpm/tcpci_mt6370.c         |  212 +++
 drivers/video/backlight/Kconfig               |    8 +
 drivers/video/backlight/Makefile              |    1 +
 drivers/video/backlight/mt6370-backlight.c    |  338 +++++
 .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |   18 +
 include/dt-bindings/mfd/mediatek,mt6370.h     |   83 ++
 32 files changed, 5038 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
 create mode 100644 drivers/iio/adc/mt6370-adc.c
 create mode 100644 drivers/leds/flash/leds-mt6370-flash.c
 create mode 100644 drivers/leds/leds-mt6370.c
 create mode 100644 drivers/mfd/mt6370.c
 create mode 100644 drivers/power/supply/mt6370-charger.c
 create mode 100644 drivers/regulator/mt6370-regulator.c
 create mode 100644 drivers/usb/typec/tcpm/tcpci_mt6370.c
 create mode 100644 drivers/video/backlight/mt6370-backlight.c
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
 create mode 100644 include/dt-bindings/mfd/mediatek,mt6370.h

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
