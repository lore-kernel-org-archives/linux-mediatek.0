Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C52FC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 23:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wqPdBL+/GuMSQccpt6uaKdYbWfswQmujpY/bP5YPpNI=; b=MBVbrYqZJXl8YjOQ8Llw7FS4gY
	uWFzZOQM13wdMPZp+AoP7qaR9iWChSJzoZOxqtpS3xq9Ir6zSKDU7/8YtIYfJBbAY5qugYneORw59
	v7Akm0UIOcOEIndsbkO0sUep1h7Ok8c+pzxNfr+laBsCZt69oPodt4GDVejZ43CIuwyBEgA7NjZY8
	V8CiuRsHCFzyH0ZZw9aQUsV/dHT/JhAWY1N7pkMxyQt45PxkvgQLBCJkom29/fW7o8eVXv5zkVpYi
	MhAlemTlNk0nLrcuj+qXnz26YVudTKhw0Zq5IOH/W1GGI1v60rz83f41TxdY897sCCS/yFD6lBBce
	Sc8bd6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG6PC-001IKX-1Q;
	Wed, 20 Dec 2023 23:55:14 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG6P7-001IIk-2T
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Dec 2023 23:55:13 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7b7fb34265fso9415239f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Dec 2023 15:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116507; x=1703721307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wqPdBL+/GuMSQccpt6uaKdYbWfswQmujpY/bP5YPpNI=;
        b=DTZgMRRIVYL4HNlB1kky0FSmxMoI4oZlS1xqQK9MHnm6U/z3AxVtEVha3/Zu3xm67M
         9GAdocfujLJAOMzN2Ga6vgbsEDXqwzE3Yi668xDALEvv37BIpWrgC50yWyiCfTr2ZtSB
         jZgruPQpQYwz/Rx3OQ1KtvXzNwN5nCNmdoMLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116507; x=1703721307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqPdBL+/GuMSQccpt6uaKdYbWfswQmujpY/bP5YPpNI=;
        b=pcZCa72sYQ2lqP4ZZO9jb7AaHLr015hpBDK9sw9lp6J3SF2NeBaMwhkO8bZOnWfoHt
         2b3p/9cO2sVF3Dfqd8Al9aOQ690411Jn36z9OZMB1Ikuri92pxXI2jojcV48CME7ynux
         KvLY0KON6IkHxtLq2v3hVNAGcKzoytoh6yOq7Xn3JVljtsrGU9a0TKaisPKzVovmuj39
         Pqp1SaVGoBYA5Gxzykv51XHTMhQPNSaIinSBrmDgC6z3vg574qabUA9Jd0H6EbepC5AB
         N50BLtP8Osv7JWDGK5uMu2etYtqZNvdkaBjnAc2kZTpNC9NBWFMuCx22GDPrFhzBR5qO
         uW2A==
X-Gm-Message-State: AOJu0Yw6j+rtNmUImE22uv/eXLRBjpKfAwWYPHQePm7AFU+qkPWf/Qfa
	H2bShpWJK6HK7AqD/cJpklg8gA==
X-Google-Smtp-Source: AGHT+IGvcm8Gmt6btmyTyMqXZVRSOfPvmnIP9TnUstnyKtl6UnorIC2YtaIno3O39yYnkXIJfI/h3g==
X-Received: by 2002:a05:6602:4148:b0:7b7:b370:bd51 with SMTP id bv8-20020a056602414800b007b7b370bd51mr10520071iob.35.1703116507495;
        Wed, 20 Dec 2023 15:55:07 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:07 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Benson Leung <bleung@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	David Gow <davidgow@google.com>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lee Jones <lee@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Prashant Malani <pmalani@chromium.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Barnes <robbarnes@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Romain Perier <romain.perier@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Takashi Iwai <tiwai@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Wei Xu <xuwei5@hisilicon.com>,
	Wolfram Sang <wsa@kernel.org>,
	chrome-platform@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 00/22] Improve IRQ wake capability reporting and update the cros_ec driver to use it
Date: Wed, 20 Dec 2023 16:54:14 -0700
Message-ID: <20231220235459.2965548-1-markhas@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_155509_805498_4A976340 
X-CRM114-Status: GOOD (  17.26  )
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

Currently the cros_ec driver assumes that its associated interrupt is
wake capable. This is an incorrect assumption as some Chromebooks use a
separate wake pin, while others overload the interrupt for wake and IO.
This patch train updates the driver to query the underlying ACPI/DT data
to determine whether or not the IRQ should be enabled for wake.

Both the device tree and ACPI systems have methods for reporting IRQ
wake capability. In device tree based systems, a node can advertise
itself as a 'wakeup-source'. In ACPI based systems, GpioInt and
Interrupt resource descriptors can use the 'SharedAndWake' or
'ExclusiveAndWake' share types.

Some logic is added to the platform, ACPI, and DT subsystems to more
easily pipe wakeirq information up to the driver.

Changes in v2:
-Rebase on linux-next
-Add cover letter
-See each patch for patch specific changes

Mark Hasemeyer (22):
  gpiolib: acpi: Modify acpi_dev_irq_wake_get_by() to use resource
  i2c: acpi: Modify i2c_acpi_get_irq() to use resource
  Documentation: devicetree: Clarify wording for wakeup-source property
  ARM: dts: tegra: Enable cros-ec-spi as wake source
  ARM: dts: rockchip: rk3288: Enable cros-ec-spi as wake source
  ARM: dts: samsung: exynos5420: Enable cros-ec-spi as wake source
  ARM: dts: samsung: exynos5800: Enable cros-ec-spi as wake source
  arm64: dts: mediatek: mt8173: Enable cros-ec-spi as wake source
  arm64: dts: mediatek: mt8183: Enable cros-ec-spi as wake source
  arm64: dts: mediatek: mt8192: Enable cros-ec-spi as wake source
  arm64: dts: mediatek: mt8195: Enable cros-ec-spi as wake source
  arm64: dts: tegra: Enable cros-ec-spi as wake source
  arm64: dts: qcom: sc7180: Enable cros-ec-spi as wake source
  arm64: dts: qcom: sc7280: Enable cros-ec-spi as wake source
  arm64: dts: qcom: sdm845: Enable cros-ec-spi as wake source
  arm64: dts: rockchip: rk3399: Enable cros-ec-spi as wake source
  of: irq: add wake capable bit to of_irq_resource()
  of: irq: Add default implementation for of_irq_to_resource()
  of: irq: Remove extern from function declarations
  device property: Modify fwnode irq_get() to use resource
  platform: Modify platform_get_irq_optional() to use resource
  platform/chrome: cros_ec: Use PM subsystem to manage wakeirq

 .../bindings/power/wakeup-source.txt          | 18 +++--
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   |  1 +
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts |  1 +
 .../rockchip/rk3288-veyron-chromebook.dtsi    |  1 +
 .../boot/dts/samsung/exynos5420-peach-pit.dts |  1 +
 .../boot/dts/samsung/exynos5800-peach-pi.dts  |  1 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
 .../boot/dts/mediatek/mt8192-asurada.dtsi     |  1 +
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  1 +
 .../arm64/boot/dts/nvidia/tegra132-norrin.dts |  1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  1 +
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  1 +
 .../arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi  |  1 +
 drivers/acpi/property.c                       | 11 ++-
 drivers/base/platform.c                       | 74 +++++++++++++------
 drivers/base/property.c                       | 24 +++++-
 drivers/gpio/gpiolib-acpi.c                   | 25 ++++---
 drivers/i2c/i2c-core-acpi.c                   | 38 +++++-----
 drivers/i2c/i2c-core-base.c                   |  6 +-
 drivers/i2c/i2c-core.h                        |  4 +-
 drivers/of/irq.c                              | 32 +++++++-
 drivers/of/property.c                         |  8 +-
 drivers/platform/chrome/cros_ec.c             |  9 ---
 drivers/platform/chrome/cros_ec_lpc.c         | 52 ++++++++++++-
 drivers/platform/chrome/cros_ec_spi.c         | 41 ++++++++--
 drivers/platform/chrome/cros_ec_uart.c        | 34 +++++++--
 include/linux/acpi.h                          | 23 +++---
 include/linux/fwnode.h                        |  8 +-
 include/linux/of_irq.h                        | 41 +++++-----
 include/linux/platform_data/cros_ec_proto.h   |  2 -
 include/linux/platform_device.h               |  3 +
 include/linux/property.h                      |  2 +
 35 files changed, 328 insertions(+), 142 deletions(-)

-- 
2.43.0.472.g3155946c3a-goog


