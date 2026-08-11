Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DD7C5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 12:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iDHJIqp5FLLywri4WBqUbQEMXacNkK0ILuDy9FjFATE=; b=WfzucOJwocbgh0M8X7Cy70zoz5
	6ersxStx+2BJWqBtMGxtTAu921YRqTD7IwkSk79cph52RI82fduuOHDCcXTHCqHsEKfiCxkqUUWlf
	NH6dZPFM0/ViKFt95OUMZ+lEl9qGQqenUYzddX3XImHsJOkbTAA1EVEiXYbK8pZa1DNRH8xxorfKv
	puAjoOfX3nfM+HIOV0iCIpLEhtvqcKI9wfcgAKKJDty+gWa0oW4bAVYMz5XYP/ynmMtreBFZ52gtw
	/6HKlusd1qgTVws7am5BTmXp/B5yW+0sJOpF7zRbZOwtkBZqBMcu0NKFC+PgAgh43rF1J5Cw4Ch8i
	tdJGeh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlT9-0000000E00d-1xR1;
	Tue, 11 Aug 2026 12:20:35 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlT6-0000000DzzY-3gvV
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 12:20:34 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-848643382fcso746169b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 05:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450831; x=1787055631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDHJIqp5FLLywri4WBqUbQEMXacNkK0ILuDy9FjFATE=;
        b=ItDfdUo4KQhqE/sIQ2S5Qd4KMahVHfLw6hej6gv+7m4b92zmAiCb6dUJfTOM9PrpOS
         CkA9ISpozm+/3AH008xr6QIqS8BodtS6WUlKGgS5V9e85OHRdQ1jLqhcFN9crYiIdvul
         TLmIKeQrDnHdSNlcfJ6GBepBosMngXNIvZp24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450831; x=1787055631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDHJIqp5FLLywri4WBqUbQEMXacNkK0ILuDy9FjFATE=;
        b=dkb8s4ji/6Z6YnFETuydwSyUGhQvrsK1vqdwjP1x07OOEQmlCOij0FrW+tCBdb2nqN
         oAl4hx3vXc/b8EPhvtZTY1d3WGfCHjn+0KcIZ2UtcLTZW2vgaW928znTh9HXlsDkw5hS
         WY9uNoKzF4QfCtcKY9FAUJNggbBGlEozIT4LE6zGHgs/abBupNBD+1NXeCDONrM7XFKZ
         2TQOmVH0zWUPTdC2+WIGlB/MicO140KFnMn3onkWVoC3Ej4tmDwsNu4GPqmN3mVsTgKx
         XSPcO9cJ67fj7AODU9+hi41UA3pvVf1TXiuCgMJK2ujQz/hZG5FpTArpH398heZsvnGM
         NKng==
X-Forwarded-Encrypted: i=1; AHgh+RpYMjMfnYrcbsHtUjcxLgrzUv2Xjkp49wSeQzaP78Lcd9HjQ4VizFIT/nCdeSGvc7WuePp/aVzevuUWllh7JA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNYGJFAVD3sZsLXR5b1twheTrYFvV2fttnp+ejQ9f71yE4rznn
	KeOFoFFbc7sL/Bvq6BoglS3IdDM1lANvFb2SkjT61AY/X9MAczL6ZrkFJiQps5GzKA==
X-Gm-Gg: AR+sD12S6zo2qUT5TYn+0VqvmkySUWc4NtBey530Pe17FSaZXxHuwgO/5pNmhtr6VYW
	JHqlvFd86U/Z57DucOmaXDsz5lnEqqmj53/0J1v5pjM/y8NrTJQ5PzVl73PT2E07fyWWM1BePFx
	53NiscrFsXOy5MoImf77DobVAqTIQdjf/4nKt7r7HSy/Y6a0wSgNw+u9tXgHMV+zNxMIjVQc5Ue
	WYGUBv3PRgy6b20CCRyXOjmluOIoXwisiATF3EZJOISnJtHHwgSNsk9qTSkhNJh6KgY5P5iuFdb
	RVGDA5c8FYlKxmsDWLHjj4BMEJOcYp9j+gr4N4u0Jv6tNK1K0ZFjfvokelks5/5sG7Ap7G0FhUP
	3wngSwCoIx8ZKj6m9pCcTiuO0I+YDZThGkfYQDC1qzVxfp7xulCDcUcGUe4cjNzoNHi3oARN8r1
	0kJ4l6yrz/JIMepSnqKkzYVbP/wnCGc/IMVmBWbmI3Gv3xSAZXS58qyTb+a+MpiClic/M8zpDDx
	sD0SE+Pux55nODOTfo4nBPC6ntO6IJ5dTjGliqBAzX79w==
X-Received: by 2002:a05:6a00:9286:b0:848:63c9:ee39 with SMTP id d2e1a72fcca58-84fa8842387mr2815346b3a.12.1786450831335;
        Tue, 11 Aug 2026 05:20:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue, 11 Aug 2026 20:20:00 +0800
Message-ID: <20260811122011.3539250-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052032_915360_2B6E4229 
X-CRM114-Status: GOOD (  25.90  )
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

This is v4 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v3:
- Added __private modified to regulator_bulk_data.wait_us field and
  switched to ACCESS_PRIVATE accessor for the field (Andy)
- Moved wait outside regulator lock scope (Sashiko)
- Moved "remaining" value assignment closer to conditional (Andy)
- Fixed variable unit name in regulator_enable_and_wait() prototype
  (Andy, Sashiko)
- Added commit message section showing average delay needed for I2C
  prober (patch 6) (Andy)
- Link to v3:
  https://lore.kernel.org/all/20260721075226.2347933-1-wenst@chromium.org/

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
different maintainers. Or if it's not too late, Mark could take patch
1 for v7.3-rc1 and the rest can go in later.

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
 drivers/hid/i2c-hid/i2c-hid-of.c              |  9 ++-
 drivers/i2c/i2c-core-of-prober.c              | 25 ++++++--
 drivers/input/mouse/elan_i2c_core.c           | 23 ++++---
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +-
 drivers/regulator/core.c                      | 64 ++++++++++++++-----
 include/linux/regulator/consumer.h            | 21 ++++--
 include/linux/regulator/driver.h              |  2 +
 10 files changed, 105 insertions(+), 54 deletions(-)

-- 
2.55.0.679.g6767b8d81c-goog


