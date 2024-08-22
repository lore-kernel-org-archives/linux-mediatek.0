Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925EFC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mXVJ4hYJVzO806R+DphXlW+DI8ouOS8A6yLy8bIlOVs=; b=NT1jl/ERCQBifoyezjZg6EjF/b
	FbGSESVyldi89XH8H9uvLWCJhDL+hdZUyTnldr7Mf13D3awhZvs0VJp9ST2UZ3S1PYAUnhKKxNBnu
	ft03/ELwvjwWeRMggIDK00assKKDS5D3ZUUeqYNy5Q3Kf8karhON6p//cU3OJn850LfleJG9OBpRj
	V6hj8kGrwUKm1SlI2K+ZrjKIQIKwn2gTm9/aykw+iFvhnsAXqzgieYrMER4t1EPd8udrMZ6xyjyLb
	74B25lI1JIHjlEI0LahPz4s7n8BZuxE2CqBp07t9VOzLQWKWBFvJqggvrBGmMkfsQK3Z3R0uXu28P
	HheET6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh40H-0000000CCQU-2KkW;
	Thu, 22 Aug 2024 09:21:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3zS-0000000CC5S-0QNs
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 09:20:24 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so411793b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318421; x=1724923221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXVJ4hYJVzO806R+DphXlW+DI8ouOS8A6yLy8bIlOVs=;
        b=HdBFI5L5uNho8Y9/yl4IMV6gGkTlwA/NcZfZgLJSEv9OMK7NVwwn6N+v+nJyh//r+k
         61rqRkUyaf9rzwlbpFHJDepN/qs/PyLHRiV9zG5n482fQ5byciYcylvkNwtATCkCk4og
         CP5dWojzLkwkJ0i/rA7xRD8gBa1KTRJ1sbZhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318421; x=1724923221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXVJ4hYJVzO806R+DphXlW+DI8ouOS8A6yLy8bIlOVs=;
        b=eDTheUkkCCUhoTOUAX7dlQsOhAU+dHTGHQIE/33ldneRcIxIdI2+vBJwHEOt9DAtiu
         dxoJlLaTY7DVWH9KAi4IiJ5nG7ZmhPm4Mh6HMj72jfp3SD3yv+5Qhc6+wKl1rLWgtoSB
         ZBMG/tAfxzMfCdECAs4W109X9+szS0SZp9x16r95p0TT7Z1nFFoO8/TIN/vnGmySOSUj
         HqY6guu7AHGNGpbRp5gaX2TnpryDEXn+P1+1p3gE1x6rEkuz0S3j0Sj8Z7SUIDdoDdy3
         MG3JwNuvTHlXAPqiwIySz6PAx8qsXhU2FBpoa/4Fzds1pC8ngjs7mVAwSug0k7z6VZcf
         BYsg==
X-Forwarded-Encrypted: i=1; AJvYcCVpjROaW00YCDynfn8IpLQz3XxHbT0Tn7M+9YqfPFjzeAloQv5lnV1tJ/nIx0rDM8mZoDgEcLo7zfCzmVFGuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqtNnDbIaPiurU65lyoA3MDFdX3R6oSM2ceDb2qArbe9+JkuOe
	tAVwzwaLa37NYuToDre8kJR/ftrXrLq4BlsfzqIEefsPdKJ9nrgfuBgbbMPJn5LSo+clCKHbV1A
	=
X-Google-Smtp-Source: AGHT+IHXMIEApsOt0aXtJsag/9KLz2oM6hiySBAzNrGHr2vTyo3uEK2rn3CZece1Sx+6ucTreM1PvA==
X-Received: by 2002:a05:6a21:10f:b0:1c0:f5fa:cbe6 with SMTP id adf61e73a8af0-1cada055bbbmr4933807637.22.1724318421036;
        Thu, 22 Aug 2024 02:20:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:20 -0700 (PDT)
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
Subject: [PATCH v5 00/10] platform/chrome: Introduce DT hardware prober
Date: Thu, 22 Aug 2024 17:19:53 +0800
Message-ID: <20240822092006.3134096-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022022_217237_21CA5447 
X-CRM114-Status: GOOD (  34.00  )
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

This is v5 of my "of: Introduce hardware prober driver" [1] series.
v5 mainly addresses comments from Andy.

v2 continued Doug's "of: device: Support 2nd sources of probeable but
undiscoverable devices" [2] series, but follows the scheme suggested by
Rob, marking all second source component device nodes as "fail-needs-probe",
and having a hardware prober driver enable the one of them.


Changes since v4:
- Link to v4: 
  https://lore.kernel.org/all/20240808095931.2649657-1-wenst@chromium.org/
- Patch 1 "of: dynamic: Add of_changeset_update_prop_string"
  - Use modern designated initializer for |prop|
- Patch 2 "regulator: Move OF-specific regulator lookup code to of_regulator.c"
  - New patch only moving code
- Patch 3 "regulator: Split up _regulator_get()"
  - New patch splitting existing code into smaller functions
- Patch 4 "regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()"
  - Was "regulator: Add regulator_of_get_optional() for pure DT" in v4
  - Add OF-specific _of_regulator_get() function
  - Rename regulator_of_get_optional() to of_regulator_get_optional() for
    consistency
  - Make of_regulator_get_optional() static, as it is only used internally
  - Convert of_regulator_bulk_get_all()
- Patch 5 "gpiolib: Add gpio_property_name_length()"
  - New patch, split out from patch 7/8
- Patch 6 "i2c: Introduce OF component probe function"
  - Split code into helper functions
  - Use scoped helpers and __free() to reduce error path
- Patch 7 "i2c: of-prober: Add regulator support"
  - Split out GPIO handling as patch 8
  - Rewrote using of_regulator_bulk_get_all()
  - Replaced "regulators" with "regulator supplies" in debug messages
- Patch 8 "i2c: of-prober: Add GPIO support"
  - New patch split out from patch 7
  - Moved GPIO property name check to common function in gpiolib.c in new
    patch
  - Moved i2c_of_probe_free_gpios() into for_each_child_of_node_scoped()
  - Rewrote in gpiod_*_array-esque fashion
- Patch 9 "platform/chrome: Introduce device tree hardware prober"
  - Fix Kconfig dependency
  - Update copyright year
  - Drop "linux/of.h" header
  - Include "linux/errno.h"
  - Move |int ret| declaration to top of block
  - Return -ENODEV on no match instead of 0
  - Unregister platform driver and device unconditionally after previous
    change
- Patch 10 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	    trackpads as fail"
  - Rebased

Changes since v3:
- Patch 1 "of: dynamic: Add of_changeset_update_prop_string"
  - Use new __of_prop_free() helper (helper was added by Rob in 2024/04)
  - Add new line before header declaration
- Patch 2 "regulator: Add regulator_of_get_optional() for pure DT"
  - New patch
- Patch 3 "i2c: Introduce OF component probe function"
  - Complete kernel-doc
  - Return different error if I2C controller is disabled
  - Expand comment to explain assumptions and constraints
  - Split for-loop finding target node and operations on target node
  - Add missing i2c_put_adapter()
  - Move prober code to separate file
- Patch 4 "i2c: of-prober: Add GPIO and regulator support"
  - New patch
- Patch 5 "platform/chrome: Introduce device tree hardware prober"
  - Include linux/init.h
  - Rewrite for loop in driver probe function as suggested by Andy
  - Make prober driver buildable as module
  - Ignore prober errors other than probe deferral
- Patch 6 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail"
  - Rebased

Patch "arm64: dts: mediatek: mt8173-elm-hana: Add G2touch G7500 touchscreen"
was merged separately and thus removed from this series.

Changes since v2:
- Added of_changeset_update_prop_string()
- Moved generic I2C code to the I2C core
- Moved remaining platform specific code to platform/chrome/
- Switched to of_node_is_available() to check if node is enabled.
- Switched to OF changeset API to update status property
- I2C probe helper function now accepts "struct device *dev" instead to
  reduce line length and dereferences
- Moved "ret = 0" to just before for_each_child_of_node(i2c_node, node)
- Depend on rather than select CONFIG_I2C
- Copied machine check to driver init function
- Explicitly mentioned "device tree" or OF in driver name, description
  and Kconfig symbol
- Dropped filename from inside the file
- Made loop variable size_t (instead of unsigned int as Andy asked)
- Switched to PLATFORM_DEVID_NONE instead of raw -1
- Switched to standard goto error path pattern in hw_prober_driver_init()
- Dropped device class from status property

Patches removed from v3 and saved for later:
- of: base: Add of_device_is_fail
- of: hw_prober: Support Chromebook SKU ID based component selection
- dt-bindings: arm: mediatek: Remove SKU specific compatibles for Google Krane
- arm64: dts: mediatek: mt8183-kukui: Merge Krane device trees

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

Patches 2 through 4 reorganize the OF-specific regulator core code and
reworks the existing of_regulator_bulk_get_all() function to look up
regulator supplies solely using device tree nodes.

Patch 5 adds a function to the GPIO library that checks whether a
given string (property name) matches the GPIO property pattern, and
if it does, returns the length of the GPIO name.

Patch 6 implements probing the I2C bus for presence of components as
a helper function in the I2C core.

Patch 7 implements regulator supply support for the I2C component
prober.

Patch 8 implements GPIO support for the I2C component prober.

Patch 9 adds a ChromeOS specific DT hardware prober. This initial
version targets the Hana Chromebooks, probing its I2C trackpads and
touchscreens.

Patch 10 modifies the Hana device tree and marks the touchscreens
and trackpads as "fail-needs-probe", ready for the driver to probe.


The patch and build time dependencies for this series is now quite
complicated:

  of_regulator.c cleanups [1] -> regulator patches here ----
							   |
							   v
  gpio patch in -next [2] -> gpiolib patch here  -----> i2c of-prober --
								       |
                      platform/chrome device tree hardware prober <----- 
 
The regulator patches in this series depend on other cleanup patches [1]
I sent earlier. The gpiolib patch depends on a commit in -next [2]
changing the GPIO suffixes array. Patches 6 through 8 introducting i2c
of-prober depend on the first 5 patches. Patch 9, The chrome prober,
depends on patches 6 through 8.

I think it might be easier if the respective maintainers take the first
five patches for -rc1, and patches 6 through 9 go through either the i2c
or chrome trees either very late in the merge window or right after it.
Patch 10 can go in only after everything else is in. This should be
better than having an immutable branch on top of some commit in -next
for three other trees to consume.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20240822072047.3097740-1-wenst@chromium.org/
[2] commit 4b91188dced8 ("gpiolib: Replace gpio_suffix_count with NULL-terminated array")

Chen-Yu Tsai (10):
  of: dynamic: Add of_changeset_update_prop_string
  regulator: Move OF-specific regulator lookup code to of_regulator.c
  regulator: Split up _regulator_get()
  regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()
  gpiolib: Add gpio_property_name_length()
  i2c: Introduce OF component probe function
  i2c: of-prober: Add regulator support
  i2c: of-prober: Add GPIO support
  platform/chrome: Introduce device tree hardware prober
  arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads
    as fail

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  13 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   4 +-
 drivers/gpio/gpiolib.c                        |  44 ++
 drivers/i2c/Makefile                          |   1 +
 drivers/i2c/i2c-core-of-prober.c              | 391 ++++++++++++++++++
 drivers/of/dynamic.c                          |  44 ++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   | 104 +++++
 drivers/regulator/core.c                      | 139 +++----
 drivers/regulator/internal.h                  |  15 +-
 drivers/regulator/of_regulator.c              | 142 ++++++-
 include/linux/gpio/consumer.h                 |   2 +
 include/linux/i2c.h                           |   4 +
 include/linux/of.h                            |   4 +
 15 files changed, 820 insertions(+), 99 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c

-- 
2.46.0.184.g6999bdac58-goog


