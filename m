Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ACBEDE998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hTKgkUpPxMjt6Wkjy0VL4B+YQKQwbZqLJmtteD1Fqgg=; b=i8AfKOFdOt99cm53OnGwIjgSV7
	RnH3v/llPazGoKWDpnI7uCRdvgezIn7ZXQ9MfXRXIEvvysute8N9Z3hm4aAOM7Ft6uvkz29AWXkqg
	vFnieb6Z1kHOTLavOdJcbWqZV7CvNUC6IL/cHK+KdA5sBpxWFTw50i8Gx3rsVM1E1j/xgoyR/Xg/m
	5PaXUjoMo90/lPRIN0Jun5FtC0WuOHLeUArjwnNdLSMofYnIUnPUmKnGEUF4eiFH9HbIdrd/1exDx
	gsAwBAWBJUsIkv5fQ5eLrh21zOK0UeaoEEn127VjJMtPYmmZ19YetNL1O094snp7dq58WxEHPjE9t
	EbGi7jtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHnd-00000008RG5-2JdN;
	Wed, 11 Sep 2024 07:30:01 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHlz-00000008Qhj-3SjP
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:28:22 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7db174f9050so52556a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039698; x=1726644498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hTKgkUpPxMjt6Wkjy0VL4B+YQKQwbZqLJmtteD1Fqgg=;
        b=XNTWIKjKgsPp7sjYIJBc5vW706Cjz7SXA4DKBZ929fI9nW3r6CL/KqfQHzHNj12QRO
         BWwhGXc3WmfAfnyEtanciaM+1s7XtvZZb22X0GE4tyPkxgDNfR3Y0s4hkRV0eYRjYmBr
         GLdMnO6q97ochvbfShX+VN3fesKJ5sSb4SeIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039698; x=1726644498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTKgkUpPxMjt6Wkjy0VL4B+YQKQwbZqLJmtteD1Fqgg=;
        b=n+K4/+FM8U8mak8mACxB8dY3XKsb/7WxZqkPWgyaQMtAH343WXc2+A/FwPhJokQm7C
         Go3hafA84OgSHpT4wQz3CrYKxuYteObKAOqCsJGdCnsUn1B92FAm739w+hSniymrhbWu
         Fl77aJD9Wt2ExpQiMs15jCiKxH0lq1pK4lQlqQJT3HZcoWMkekipMx/gnf+tg9wVRdQ9
         /JT8ZpWHIaz5guU076j+g8+F3J1nyYcE5puE+Nxdkcz/iDD1Zwo4M+arQ+nvZFR0/gUO
         8s5vYHOfMAX4vHeEWCXHXvK52Wa3b3BS43EcXfUR/gzZiGd5edv3A5skUQHWnOUl/zeu
         caHw==
X-Forwarded-Encrypted: i=1; AJvYcCU9n00q59iz4JT3plIfMMNRxQbXbg7Ap7qqwU71mTMontmCrprOU6il7jlfWoNI+l59v2FdtGqwtZrtXtHRuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy97Tdee/htVgrB7E44N16BmIZL8bp6TBjf5ZrOmOih0JX+/6RK
	P+KhxaiP5fel1TyEPRIiC5G0VSmg43UVA/BccpWeOW//tmgCtG1el9+ALzkquc+0N9yH6+LyoYo
	=
X-Google-Smtp-Source: AGHT+IEfFgxwFodCBOOV4Mey4FyzVGvUwL6y+0sWBJDlwOxvwP6rBYJkox3CrjRNGWdE04s4ZrrqPA==
X-Received: by 2002:a05:6a20:d521:b0:1cf:2aaf:60d9 with SMTP id adf61e73a8af0-1cf5e157915mr4469402637.33.1726039698517;
        Wed, 11 Sep 2024 00:28:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v7 00/10] platform/chrome: Introduce DT hardware prober
Date: Wed, 11 Sep 2024 15:27:38 +0800
Message-ID: <20240911072751.365361-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_002819_985066_54D9F73A 
X-CRM114-Status: GOOD (  35.25  )
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

Hi everyone,

This is v7 of my "of: Introduce hardware prober driver" [1] series.
v7 mainly refactors the code into a series of helpers. The scope of
supported components is also reduced to those with at most one regulator
supply and one GPIO pin. Also the helpers expect these to be named and
so the "bulk get" API changes have been dropped.

Also, a pull request to document the "fail-needs-probe" status has been
sent: https://github.com/devicetree-org/dt-schema/pull/141

v2 continued Doug's "of: device: Support 2nd sources of probeable but
undiscoverable devices" [2] series, but follows the scheme suggested by
Rob, marking all second source component device nodes as "fail-needs-probe",
and having a hardware prober driver enable the one of them.


Changes since v6:
- Link to v6:
  https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chromium.org/
- Dropped patch "gpiolib: Add gpio_property_name_length()"
  No longer needed
- Dropped patch "regulator: Move OF-specific regulator lookup code to of_regulator.c"
  Already merged
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix()"
  - Changed helper name to "for_each_child_of_node_with_prefix()"
- Patch 4 "regulator: Add of_regulator_get_optional() for pure DT regulator lookup"
  - Was "regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()"
  - Changed reference [1] to Link: tag
  - Rebased on top of commit 401d078eaf2e ("regulator: of: Refactor
    of_get_*regulator() to decrease indentation")
  - Exported of_regulator_get_optional()
  - Changed commit message to focus on "of_regulator_get_optional()"
  - Dropped change to of_regulator_bulk_get_all()
- Patch 5 "i2c: core: Remove extra space in Makefile"
  - Collected Andy's Reviewed-by
- Patch 6 "i2c: Introduce OF component probe function"
  - Correctly replaced for_each_child_of_node_scoped() with
    for_each_child_of_node_with_prefix()
  - Added namespace for exported symbols
  - Made the probe function a framework with hooks
  - Split out a new header file
  - Added MAINTAINERS entry
  - Reworded kernel-doc
  - Dropped usage of __free from i2c_of_probe_component() since error
    path cleanup is needed anyway
- Patch 7 "i2c: of-prober: Add simple helpers for regulator support"
  - Moved change of of_get_next_child_scoped() to
    of_get_next_child_with_prefix() to previous patch
  - Restructured into helpers for the I2C OF component prober
  - Reduced to only handle one regulator
  - Commit message updated
- Patch 8 "i2c: of-prober: Add GPIO support to simple helpers"
  - Restructured into helpers for the I2C OF component prober
  - Reduced to only handle one GPIO
  - Set GPIO to input on (failure) cleanup
  - Updated commit message
- Patch 9 "platform/chrome: Introduce device tree hardware prober"
  - Adapted to new I2C OF prober interface
  - Collected Acked-by tag

Changes since v5:
- Link to v5:
  https://lore.kernel.org/all/20240822092006.3134096-1-wenst@chromium.org/
- Patch 1 "of: dynamic: Add of_changeset_update_prop_string"
  - Collected Rob's reviewed-by
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix_scoped()"
  - New patch
- Patch 3 "regulator: Move OF-specific regulator lookup code to of_regulator.c"
  - Fix kerneldoc format of of_regulator_dev_lookup()
  - Fix stub compile error for !CONFIG_OF in drivers/regulator/internal.h
- Patch 4 "regulator: Split up _regulator_get()"
  - Fixed kerneldoc "Return" section format for _regulator_get_common()
  - Slightly reworded return value description
- Patch 5 "regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()"
  - Used "dev_of_node(dev)" instead of "dev->of_node"
  - Replaced "dev_printk" with "dev_printk()" in kerneldoc mentions
  - Fixed kerneldoc "Return" section format for of_regulator_get_optional()
  - Fix @np parameter name in of_regulator_dev_lookup() kerneldoc
- Patch 6 "gpiolib: Add gpio_property_name_length()"
  - Changed function name to "gpio_get_property_name_length()"
  - Changed argument name to "propname"
  - Clarified return value for "*-<GPIO suffix>" case
  - Reworked according to Andy's suggestion
  - Added stub function
- Patch 7 "i2c: core: Remove extra space in Makefile"
  - New patch
- Patch 8 "i2c: Introduce OF component probe function"
  - Fixed indent in Makefile
  - Split regulator and GPIO TODO items
  - Reversed final conditional in i2c_of_probe_enable_node()
- Patch 9 "i2c: of-prober: Add regulator support"
  - Split of_regulator_bulk_get_all() return value check and explain
    "ret == 0" case
  - Switched to of_get_next_child_with_prefix_scoped() where applicable
  - Used krealloc_array() instead of directly calculating size
  - copy whole regulator array in one memcpy() call
  - Drop "0" from struct zeroing initializer
  - Split out regulator helper from i2c_of_probe_enable_res() to keep
    code cleaner when combined with the next patch
  - Added options for customizing power sequencing delay
  - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
  - Add i2c_of_probe_free_regulator() helper
- Patch 10 "i2c: of-prober: Add GPIO support"
  - Renamed "con" to "propname" in i2c_of_probe_get_gpiod()
  - Copy string first and check return value of strscpy() for overflow in
    i2c_of_probe_get_gpiod()
  - Add parenthesis around "enable" and "reset" GPIO names in comments
  - Split resource count debug message into two separate lines
  - Split out GPIO helper from i2c_of_probe_enable_res() to keep code
    cleaner following the previous patch
  - Adopted options for customizing power sequencing delay following
    previous patch
- Patch 11 "platform/chrome: Introduce device tree hardware prober"
  - Adapt to new i2c_of_probe_component() parameters
- Patch 12 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	    trackpads as fail"
  - None

See v5 cover letter for previous change logs.

For the I2C component (touchscreens and trackpads) case from the
original series, the hardware prober driver finds the particular
class of device in the device tree, gets its parent I2C adapter,
and tries to initiate a simple I2C read for each device under that
I2C bus. When it finds one that responds, it considers that one
present, marks it as "okay", and returns, letting the driver core
actually probe the device.

This works fine in most cases since these components are connected
via a ribbon cable and always have the same resources. The prober
will also grab these resources and enable them.

The other case, selecting a display panel to use based on the SKU ID
from the firmware, hit a bit of an issue with fixing the OF graph.
It has been left out since v3.

Patch 1 adds of_changeset_update_prop_string(), as requested by Rob.

Patch 2 adds for_each_child_of_node_with_prefix(), as suggested by Andy.

Patches 3 through 4 reorganize the OF-specific regulator core code and
adds a new of_regulator_get_optional() function to look up regulator
supplies solely using device tree nodes.

Patch 5 cleans up some extra spaces in the i2c core Makefile

Patch 6 implements probing the I2C bus for presence of components as
a hookable helper function in the I2C core.

Patch 7 implements regulator supply support as a set of simple helpers
for the I2C component prober.

Patch 8 implements GPIO support for the I2C component prober simple
helpers.

Patch 9 adds a ChromeOS specific DT hardware prober. This initial
version targets the Hana Chromebooks, probing its I2C trackpads and
touchscreens.

Patch 10 modifies the Hana device tree and marks the touchscreens
and trackpads as "fail-needs-probe", ready for the driver to probe.


The patch and build time dependencies for this series is now quite
complicated:

  regulator cleanups in -next -> regulator patches here ----
							   |
							   v
  platform/chrome device tree hardware prober <--- i2c of-prober
 
The regulator patches in this series depend on other cleanup patches [1]
that are already in -next. Patches 6 through 8 introducting i2c of-prober
depend on the first 5 patches. Patch 11, The chrome prober, depends on
patch 6 for now.

I think it would be easier if the respective maintainers take the first
four patches for -rc1. Wolfram has agreed to take the remaining i2c and
chrome patches through the i2c tree once the other bits have landed,
Patch 12 can go in only after everything else is in. This should be
better than having an immutable branch on top of some commit in -next
for other trees to consume.

This might be the last revision I send out before ELCE / Plumbers, as
I'm traveling to Austria a few day earlier. If there are more concerns
about the design, maybe we could discuss it in person then if all
concerned parties are present.


Thanks
ChenYu


Chen-Yu Tsai (10):
  of: dynamic: Add of_changeset_update_prop_string
  of: base: Add for_each_child_of_node_with_prefix()
  regulator: Split up _regulator_get()
  regulator: Add of_regulator_get_optional() for pure DT regulator
    lookup
  i2c: core: Remove extra space in Makefile
  i2c: Introduce OF component probe function
  i2c: of-prober: Add simple helpers for regulator support
  i2c: of-prober: Add GPIO support to simple helpers
  platform/chrome: Introduce device tree hardware prober
  arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads
    as fail

 MAINTAINERS                                   |   8 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  13 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   4 +-
 drivers/i2c/Makefile                          |   7 +-
 drivers/i2c/i2c-core-of-prober.c              | 455 ++++++++++++++++++
 drivers/of/base.c                             |  35 ++
 drivers/of/dynamic.c                          |  44 ++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   | 125 +++++
 drivers/regulator/core.c                      |  58 ++-
 drivers/regulator/internal.h                  |   6 +
 drivers/regulator/of_regulator.c              |  51 +-
 include/linux/i2c-of-prober.h                 | 131 +++++
 include/linux/of.h                            |  13 +
 include/linux/regulator/consumer.h            |   4 +
 16 files changed, 942 insertions(+), 24 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c
 create mode 100644 include/linux/i2c-of-prober.h

-- 
2.46.0.598.g6f2099f65c-goog


