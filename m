Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9633C4321E
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 10:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v58xfKciZZdZsASYb0pZtLbhtof+4jUHPUdnZRas/UY=; b=PiEpDXNbtQcM+b
	CJVR6OblL4/9kZgLfAwwpKxxZHKcLA4vN8n6wP9S94YL7kaOVvCrpYIFCuW60gobieBlK6kZohoKD
	+iTAX3f4ZiePkQEXWWX5G+p2A4xN2WenaE8MUpes8Le+wM8qabNKmhpr7quMXKyuNpu8T7O/+tnlp
	XWv9PYzEoGvbhTcxs9ovAQL8ajApBjyw4Y2TmA2T1zwx0vMmM6NqfI4x/HedLQ+W+K7HW70FvTCOl
	oQvJJ4+FfQAp9BaEEB+pmH0ZL5MQ6RFScr7F2i9TjCZaBoZ9XyMBG+LwyXKRwP0UNI9FigvBBk+El
	sARoylC1CWFDPMqIxDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvz7M-00ACMc-LC; Tue, 31 May 2022 10:28:52 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvz79-00ACJQ-Tl; Tue, 31 May 2022 10:28:41 +0000
Received: by mail-pf1-x429.google.com with SMTP id b135so12779395pfb.12;
        Tue, 31 May 2022 03:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dCuNxdxEl/Pa+Q1Tl/1IqS2eBImhteY7BuJjNZre0UY=;
        b=ddBzTN95GMoX0CaJGTtPS6vTL0AnoQbyHYWBeR5En094CARo9fP8XnCry6FucMTfcH
         GOolfIuQmh1frd8tJhFDh44zTULDnjJvqxDsfGIWu74Srb6P4U1KmdmV/5ihRfpYqUc/
         odZOIXUoPvRMV5ANkLBAHNy6H2WCibXzxKw37DzP0cDB612M8k/3imY3QNvwzomUJ7Jj
         JOduDIkBKttMvu2H0WJa9uPrEa/VYygguEpkira+Ns0u9Vgwshary5JKxOhZZ93DHBD1
         gShUBo9SXg6m9jF/9yr/BsKaWFG2g72lyrq9fHnfTBbbH2PA1KSyQxCU6MIe0hTJyxNx
         1PLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dCuNxdxEl/Pa+Q1Tl/1IqS2eBImhteY7BuJjNZre0UY=;
        b=wyEPOe4ZDZ20bLJ6Bx2XydTec3q0r9CvRjQ7ByOykWXrxPo9lsMEmzwDzrzT08bGmp
         xSF2lbse9/RaY2SLY1895ZrjFdZCBAqbU+fLAXmy82XQ31gudlUk6IlSJQMbwHajFCun
         tQC4edjjOYtEQykk9vuQz3xCuJVutODtDtKHY1OZe/BgEkaSsOTuqwPat+1phU3ZCrpn
         AO9lQFuez+w2JAJlNbg4vFaHTl0DhbjLjfhZ0iccqjzdbvx3EFmaI/lgHWlgvOrRWxti
         lzzhCRRyVokRbt7TkCkBZ8OogT7Oj4oS5vj9CcUI35xyO1zEdlthNsRFWBm8cliY2BW9
         K5HA==
X-Gm-Message-State: AOAM5305VnfR2vQ9z8a8cYRbI0H5Hy7bF0uTq1+zMLLjWfnUYuFn8yqb
	m0pTyFPj2TQ7pP6yyVT0XWw=
X-Google-Smtp-Source: ABdhPJwcOU7hN03w15oFG5H5N77JgYCYAlHLih2xVDtKhz7lppX5afVES+QpkZNat/9CXlws186kOw==
X-Received: by 2002:a05:6a00:1595:b0:518:a5b2:28d7 with SMTP id u21-20020a056a00159500b00518a5b228d7mr41960281pfk.80.1653992916963;
        Tue, 31 May 2022 03:28:36 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id c1-20020a63d501000000b003c14af50631sm10216519pgg.73.2022.05.31.03.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:28:36 -0700 (PDT)
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
Subject: [PATCH 00/14] Add Mediatek MT6370 PMIC support
Date: Tue, 31 May 2022 18:27:55 +0800
Message-Id: <20220531102809.11976-1-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_032840_002312_6DBFD7D3 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

This patch series add Mediatek MT6370 PMIC support. The MT6370 is a
highly-integrated smart power management IC, which includes a single cell
Li-Ion/Li-Polymer switching battery charger, a USB
Type-C & Power Delivery (PD) controller, dual Flash LED current sources,
a RGB LED driver, a backlight WLED driver, a display bias driver and a
general LDO for portable devices.

Alice Chen (3):
  leds: mt6370: Add Mediatek MT6370 Indicator support
  leds: flashlight: mt6370: Add Mediatek MT6370 flashlight support
  dt-bindings: leds: Add Mediatek MT6370 flashlight binding
    documentation

ChiYuan Huang (7):
  mfd: mt6370: Add Mediatek MT6370 support
  usb: typec: tcpci_mt6370: Add Mediatek MT6370 tcpci driver
  regulator: mt6370: Add mt6370 DisplayBias and VibLDO support
  dt-bindings: usb: Add Mediatek MT6370 TCPC binding documentation
  dt-bindings: leds: mt6370: Add Mediatek mt6370 indicator documentation
  dt-bindings: backlight: Add Mediatek MT6370 backlight binding
    documentation
  dt-bindings: mfd: Add Mediatek MT6370 binding documentation

ChiaEn Wu (4):
  iio: adc: mt6370: Add Mediatek MT6370 support
  power: supply: mt6370: Add Mediatek MT6370 charger driver
  video: backlight: mt6370: Add Mediatek MT6370 support
  dt-bindings: power: supply: Add Mediatek MT6370 Charger binding
    documentation

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
