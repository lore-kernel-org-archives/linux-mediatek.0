Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C922C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1UfUXCr53MVmAxCgEvl6p7BqmYW2167OMSThHKBq4o8=; b=RCuAeiiJtODHwquy6ay5a3HmVT
	nic1r+6w19QEiEz3RLefrd71qABhzI86rbxELUHTv7qFpuyYay9bS2wao4g/JiXbFV41CqpxRKH0w
	zW791NuAKyU3AVH6BWbuQ94oBxRiGnx5oney0n6jWVJOKlK2EFIbIuhnMWa6zpqnSQWEPGGF2QX01
	o5IMxck5NAjTRmdc2cSCr2Zvc+CV6vyZRuszi+ifGvhLJ/F8hyf/oqqrYdFFyEJBCn1WMMN5Hq3L1
	GzvUgLwwbSXK4eqCT84QykkVHQF3JxgvmGSdW10CQj2ceFcVpqQXyewhV/8TM85YypbK6Fu+n+Yjt
	An8JMaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ij-00000008hh5-0AkN;
	Tue, 21 Jul 2026 07:54:05 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ig-00000008hg2-30qR
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:04 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2caed617615so121813815ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 00:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620442; x=1785225242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UfUXCr53MVmAxCgEvl6p7BqmYW2167OMSThHKBq4o8=;
        b=EaXgd6l22vPpa7zpxRAWGGZqAWHQ0vh1jjNxk7xlCvIFGEURXa21u0A2Qm6oIvKzfh
         5wEkXG2IvKzmjZkagkT1ifFTmLgiZbR6lpaqZsP3AwF4CoJMVV94a6OL2564TDk/XKBl
         tlTUXpH8Efr/AHDxhw3jhCu6F4GVaXzIB91Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620442; x=1785225242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UfUXCr53MVmAxCgEvl6p7BqmYW2167OMSThHKBq4o8=;
        b=D2Df80ElAlSml7pNDaHxxRkzGvzf0SptTJFdAqqVIAdqkNdGugl9KUk+Resyz+xQLf
         aB9TldtIfgTfhtgwz2rkY4jhT/rbBw444v1IHsWtZDcUsm6c0/Tsb0MLh8N3vfXOChHG
         N8Rr0EXIPwe7KeW2nYqRHY1Lpd/nIvXWLAccbQlaqXdqr25qXp11DxamVAYnS2HiGZx4
         7MnInAvV6zhqXGP8u4FaTTE292qRaOqGrOsjVi5EIHoSHgRFKGWd+StcNp9rkVxVHv0a
         I06LDtYMMQTUaF/Y5xlNUjzlFuP2XPpW5JDAxVcKUtJEPuMcuksubjt1l6NHAw+ioN2j
         7FwQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4yl+JIhS/R08URlTBHxsMUk7gM9KWG86OFgDYVmw8VcxEuKH2/K3r5i4GtmDeiKVdFw1pYWNK4wzUQbRa7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGx2JfGB3kDmPsyrqvSRGKY9GSLuW67HIXtypKwQu9CB0CyLdc
	bV7D938TwpdgvdYp9ikyOBwWy1hZ3CFfaewRpkAOoidJdW3lTkMyzY+zp5Pu6R4ErQ==
X-Gm-Gg: AR+sD10oCoDQon0he24U6awaXauVH2oV9yjTM1ggsHDMPTWcKrbNWFgaSDNsLFPu0/x
	PDj3XNIwTI8sIXXeIgyfpDlHfq5NNa0tlxwO4jIqKYWrgzYrI8kaugnrylzJGyrFInUL5vtvYjv
	Vg/0v2U9sJC5tXhfrekICJIdZhsSC2J1/85m74yvFSN/5KKAZumx8iK9Hzi8dReb6itEILxrwRO
	3VpFQNGmeJsqeyj/pxGFuseifDjGDyFUghGhLD15MeY/gieYSMcdeZf3h3F51YBDFUQ1yaHrZLC
	dFWucMjnOwolbrCkig7HE5/eMa4knc0bffhHVQ8mmK1EzZPxnqz38TDNRE4aPPsPEm4LKxjl5Pb
	kPDVRDXDWl116rwaKPtcSg7+GMShx1PlZLb1q/4/u+y8OrZFEqOXI+2stBiQ3xjr0dSTp5DP1wS
	nz7wzcmDUGxd6AQynn8RsKBpUV/wxyguSUrHpESfwny1T4A+nLuuYdQZZeuOU=
X-Received: by 2002:a17:903:3c44:b0:2ca:ed41:d331 with SMTP id d9443c01a7336-2cf34a3f5c3mr188180995ad.45.1784620442019;
        Tue, 21 Jul 2026 00:54:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue, 21 Jul 2026 15:52:14 +0800
Message-ID: <20260721075226.2347933-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005402_793746_CF58D193 
X-CRM114-Status: GOOD (  24.66  )
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

This is v3 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v2:
- Added new regulator "enable and wait" functions that wait until at
  least the given amount of time has passed since the regulator was
  last enabled.
- Converted patches to use the new functions
- New header inclusion cleanup patch for elan_i2c driver

This series fixes the trackpad descriptions on some MediaTek-based
Chromebooks: either the trackpad's supply was set as always-on to
workaround missing delays in the driver, or the delay and supply
are missing from the trackpad's device node.

v1 was just the first patch [1]. It has since grown to cover multiple
drivers and devices.


Patch 1 adds new "enable and wait" functions for single and bulk
regulator enable.

Patch 2 cleans up header inclusion for elan_i2c driver.

Patch 3 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 4 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 5 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 adds the correct delay for probing trackpads for Hana devices
to the ChromeOS OF component prober.

Patch 8 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 9 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 3, 4, and 5 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers.

The DT changes must go in after all the driver changes land, especially
patch 3 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/


Chen-Yu Tsai (9):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - sort include statements
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  platform/chrome: of_hw_prober: Add delay for hana trackpads
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  8 +--
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |  2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |  9 ++--
 drivers/i2c/i2c-core-of-prober.c              | 25 ++++++---
 drivers/input/mouse/elan_i2c_core.c           | 23 ++++----
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +-
 drivers/regulator/core.c                      | 53 ++++++++++++++-----
 include/linux/regulator/consumer.h            | 21 +++++---
 include/linux/regulator/driver.h              |  2 +
 10 files changed, 96 insertions(+), 52 deletions(-)

-- 
2.55.0.229.g6434b31f56-goog


