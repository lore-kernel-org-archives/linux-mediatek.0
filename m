Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B1EC52D73
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 10:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NP++nqGZtSUGI7J35b2VGOlDWErcjczjXqKgEtz1Owk=; b=R/5qxsyTP/n6JTk2wDF6+cNGT1
	J9lDCKCGKYP5la0Y61/IrbmMnMQhqNrE3wmwt2hOxRgVnpC+lpModdRPCXV69TvSSA1Ez9emG3KIi
	gmr1z9/Uq9BoTHfvhzzH7wYe+IWHGJhJP+OO8+Y4qglR7uXQpDhn7EqGxNywUlEwJ8BEYnRbYkaRD
	DdwGQHNhCsEhP5QJ+xBWj6untS2Q274w29gx9m2gQte+2BCKpuf1Bb1skIKZpU/TU9cHQJ+6L6PzI
	D3X0DHboQCy5L2tbsayZ63k6T8hGXYJP12KcqEad7G1U27aeus+VUHV0cPrl1x6CCYOAWRaEOSS7a
	93uhOZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzwV-00000007oAb-0gnS;
	Thu, 08 Aug 2024 10:00:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzvu-00000007nzf-0FWb
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Aug 2024 09:59:48 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7106cf5771bso667369b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Aug 2024 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111184; x=1723715984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NP++nqGZtSUGI7J35b2VGOlDWErcjczjXqKgEtz1Owk=;
        b=J9T2GUoHysoaGqIWvccF8Te+II5zWzmrJfg0eccTYS3T2IHb5dQydro9kZI6rB3jRk
         YwF4GfalcHuy7QxZ/XEkxugcGACTIhgNK6ssNRtDN+V1Ljlbx5575DkD40ICmyDSJIEL
         a4TvurhBraV5taqkKQfNav+JJiN/n26O5VQNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111184; x=1723715984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NP++nqGZtSUGI7J35b2VGOlDWErcjczjXqKgEtz1Owk=;
        b=GKsYjgh/9Exw2O/iS8H4Y0bCRpEgLGvMcJbg1LhebDszeD8nku2vRjY15SQ1bVrn5e
         99VIOHUgdCmrRodLvo7qRbTiPB3majXhnBJAiNMtncI9dnqiYIS7CQqh6lm9qHVBd/s3
         Ke7VzTgKmbvLrKO5bX1tL3WlAOHvEIDOfwGFA2NM/nOmPRfF7OIQxgclgLtLdeD5oVob
         u1Mr2SkE11J9x+KD7tMkr4g/AyVkf1OJS1HlJILaOYPcngULwrhz4pMlLgAWAIvGcSS8
         m46TIHdcOgOkqBQC4/9+3+7hNhcXgJyV/iMCQdZo2gLe/HZLZlLFpXDfDDh1LHl0iaD/
         Lkhw==
X-Forwarded-Encrypted: i=1; AJvYcCXuAuKY4HgJmdyTsHPMRdLNPAP5U8l5XPl27Z5oncakxSDP8IRQBpldhUhbBBNZ71FRdXZW3ZO6/hvijKD5Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrY95SWNnPnJxzlp+9HrezVpP3RYxVUrUiumq6Srd5YgR25iko
	k9fyq2C5Kovqxllc/yoMHqfLsEGL6R3Zz+xhzN+TMbWTmBSHOYPB9mlIjgKQ4R0FIs9C4yZq+fg
	=
X-Google-Smtp-Source: AGHT+IHL9rv4DJSde7oadJWdI89Iu3rNnn3lai1eI+TVJJMzKxFKeEkjOe+alrLCoEqFD84PVNfHgw==
X-Received: by 2002:a05:6a20:3945:b0:1c3:ba3d:3ec3 with SMTP id adf61e73a8af0-1c6fcf8133amr1257186637.36.1723111183924;
        Thu, 08 Aug 2024 02:59:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.02.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:59:43 -0700 (PDT)
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
Subject: [PATCH v4 0/6] platform/chrome: Introduce DT hardware prober
Date: Thu,  8 Aug 2024 17:59:23 +0800
Message-ID: <20240808095931.2649657-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_025946_201223_DD083A7E 
X-CRM114-Status: GOOD (  26.10  )
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

This is v4 of my "of: Introduce hardware prober driver" [1] series.
v4 mainly adds regulator and GPIO support. This part was separately
tested on a MT8186 Voltorb device with a slightly device tree and
an extra entry in the ChromeOS hardware prober.

v2 continued Doug's "of: device: Support 2nd sources of probeable but
undiscoverable devices" [2] series, but follows the scheme suggested by
Rob, marking all second source component device nodes as "fail-needs-probe",
and having a hardware prober driver enable the one of them.

This time I trimmed down the Cc list.

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

Patch 2 adds a function for retrieving regulator supplies solely
using device tree nodes.

Patch 3 implements probing the I2C bus for presence of components as
a helper function in the I2C core.

Patch 4 implements regulator supply and GPIO support for the I2C
component prober.

Patch 5 adds a ChromeOS specific DT hardware prober. This initial
version targets the Hana Chromebooks, probing its I2C trackpads and
touchscreens.

Patch 6 modifies the Hana device tree and marks the touchscreens
and trackpads as "fail-needs-probe", ready for the driver to probe.


Assuming this is acceptable to folks, because there are compile
time dependencies, I think it would be easier for the code bits
(patches 1 through 4) to go through either the OF tree or I2C
tree. Patches 5 and 6 can go through the soc tree via the mediatek
tree.


Thanks
ChenYu

Chen-Yu Tsai (6):
  of: dynamic: Add of_changeset_update_prop_string
  regulator: Add regulator_of_get_optional() for pure DT regulator
    lookup
  i2c: Introduce OF component probe function
  i2c: of-prober: Add GPIO and regulator support
  platform/chrome: Introduce device tree hardware prober
  arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads
    as fail

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  13 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   4 +-
 drivers/i2c/Makefile                          |   1 +
 drivers/i2c/i2c-core-of-prober.c              | 425 ++++++++++++++++++
 drivers/of/dynamic.c                          |  44 ++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   | 107 +++++
 drivers/regulator/core.c                      |  81 +++-
 drivers/regulator/devres.c                    |   2 +-
 drivers/regulator/internal.h                  |   2 +-
 include/linux/i2c.h                           |   4 +
 include/linux/of.h                            |   4 +
 include/linux/regulator/consumer.h            |   8 +
 14 files changed, 681 insertions(+), 26 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c

-- 
2.46.0.rc2.264.g509ed76dc8-goog


