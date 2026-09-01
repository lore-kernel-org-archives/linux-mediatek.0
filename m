Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD967C61DD3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 07:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KfyZyO9Nh/74YiXm8QLieiH5kTcxaWjtqwY5nnPQU9w=; b=R3E+QKrDTHuE17A5Ks3ZeH7/MN
	C+LXSWoh5RSPo5As0DD76QN9ogsi2ieu61yZmpekpg2SwoJKlj56PJ5lIO0DSQQmikqkPL2tNWT9u
	BAyz2WgzqPmVSB2RYvbVOTs3J3/DKAI8eRenjyexQinGu+4pqvWsjYWiGuYBWyhpJFBSv10vbFEgl
	nN+6clkxUZ2u2BH+2CuzE2RonD+XbwjLcVLq3MTYPOmJ1vg+fCWMC+X/oBIR2mA0+yLCWa5K4DqK0
	kGYgJaWeDi3OaJYb2ViT4BPMH/ge6kHwkh+G2wGhU5f5OlZAF2bhS1DXgGy5VDQLZxjNxVr1iRgrt
	3xZ76LEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFh-0000000BA08-2p1Y;
	Tue, 01 Sep 2026 07:49:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFe-0000000B9z6-3G2H
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 07:49:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d94c868ea5so10531865ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788248990; x=1788853790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KfyZyO9Nh/74YiXm8QLieiH5kTcxaWjtqwY5nnPQU9w=;
        b=oGqqtxvv9cuYEI2hfCHk4L7fS1iPyvA2cSm8E2EERh8zGPxlyDK1zUC/Dtr2Od/id7
         HT5gkP0Fx7qFnpSm0Z7cpgrv5bKhtHo6b+9hxVHfZVuV6Br5R9Zhu0UyJyuUVccDdkJe
         KnGqMTlQ8wbkqhoXgU8YWZaPt2g3+9zAF4l+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248990; x=1788853790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfyZyO9Nh/74YiXm8QLieiH5kTcxaWjtqwY5nnPQU9w=;
        b=DkDO889uJKuRLUh+cuFfkDaBspcKUIRXVADck61k8I0/gTFRdkQzC3tOcMOoK2QbmC
         5Pwrv7nVcf+RPcxWP45sENA2kxkgZg/8EBurjIN3Q4griHaO6rO/PGwySHx91bjtwfeA
         b4cituUTDSfjirXqchyGgdUhwWyi1XlAuKOnF2jZ1ZJT6g8rLvjriir1BGg1ZLDST51d
         QlZOhLw1sLQu6dN4GkkyLUZDV8tM/hzSW2Lhk9vtihtaONCPn32vXA0sBvLlcufMdbHs
         nhofwR+fQoZ6x1gHmKhF3kd9NuhchrWISx1XovdNfVaCsZKsiDz6GVDbEsvItGvDqvjp
         tUWw==
X-Forwarded-Encrypted: i=1; AKwUvBxMDzHR2IpqSoAE84MbWeSRRqwYOrnp+4k8dTHv/i7+z+eQRUNI8OP0piBknpoETjopxN5dS1nhp5kF/Ib0DA==@lists.infradead.org
X-Gm-Message-State: AFuF++l1pVw88nig/QO2uQdWvtO7ptcV9RGOu/jQ6OnqrnqrW3izCYrv
	MQd9vXkPyJIRfnngUQ8SXmXKHIrX+SPhupdqC1tipkfwSj3iS3pkSTnwZ6QlM3b0cQ==
X-Gm-Gg: AYBFou3dK7QxvIHpMrOSt4/g88kSXarqmv6+FnSKOblRUjiKg/tG5ZyjX2SMeb2sKhW
	QlZM03rbtiRz2rNLh/jr2A9kWcTA8tFvc+hA3G8DNqhVjotHXnQo6NpgmxMqJIjWGXyGKVcDE9o
	j+LA+cDtXsMVs9HeMx4FyjO+ED4PQ4sznq6jB53sR3zr2HOd0v5GelgA3Z/sJuQxBnGy4mzXem3
	WzT10sZ/5m5Sio4A7zt+NH3d/GExGPaZqIU8eF6pMGeEmm4DuxT81fdIGl5KXAoG0c+XCxQFyBJ
	CD7W9W+fkv+qICU6Qy/ZgHY9CZMc+3wL6ny6cAhsSoH7Px+Oi6UoX0nbLB0LUmp6Sf63/BB6kT8
	2VlooLlNHHstGXUgCg6j4DmEesi7x2kET4oT5TY/hXzc0st54c1A4A0QSS2hOvhwQ53yqHgsQKA
	jxzkVaiijx0YR+hYEzeDOFwQDZ686VUduTtaIgdv7bkYdlcU9L48Gd/ShQyENgIhRm5XzAjLUEx
	WqvGE7QM7YIFsuwTmozJ8dnCZOh4ME8Et9f0r3bxCxZYQ==
X-Received: by 2002:a17:902:fdaf:b0:2d8:d4d0:792b with SMTP id d9443c01a7336-2d8d4d079a6mr348893415ad.15.1788248989697;
        Tue, 01 Sep 2026 00:49:49 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:49:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/8] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue,  1 Sep 2026 15:49:18 +0800
Message-ID: <20260901074930.764550-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_004950_979072_97E8A8C8 
X-CRM114-Status: GOOD (  26.99  )
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

This is v6 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v5:
- Patch 1 (regulator)
  - Correctly assign wait_us to all bulk consumers (Sashiko)
  - Check _regulator_is_enabled() > 0 to check for enabled regulators
    (Sashiko)
  - Lock regulator_dev on final _regulator_is_enabled() check in
    regulator_register() (Sashiko)
  - Make it clear that _regulator_is_enabled_recursive() assumes that
    supplies have been resolved (local AI review)
  - Consider supply's last_on timestamp for regulators that are already
    enabled or have no .is_enabled() ops (local AI review)
- Added noautosel tag for some patches
- Added patch to pass component probe success or not to cleanup callback
  (patch 5)
- Only defer regulator disable if a device was found (patch 6)
- Link to v5:
  https://lore.kernel.org/all/20260825041628.988369-1-wenst@chromium.org/

Changes since v4:
- Made regulator core try to set last_on timestamp for regulators that
  were left on by reset default or firmware, but not enabled in kernel
- Dropped two patches that were merged
- Link to v4:
  https://lore.kernel.org/all/20260811122011.3539250-1-wenst@chromium.org/

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

Patch 2 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 3 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 4 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 5 makes the I2C component prober let the cleanup callback know
whether a component was found and enabled. Needed for the next patch
to only delay calling regulator_disable() if a component was enabled.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description. Should not be backported without
the other driver patches.

Patch 8 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 2, 3, and 4 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers.

The DT changes must go in after all the driver changes land, especially
patch 2 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (8):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Let cleanup op know if a device was found
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   8 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |   2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |   9 +-
 drivers/i2c/i2c-core-of-prober.c              |  34 +++--
 drivers/input/mouse/elan_i2c_core.c           |   7 +-
 drivers/regulator/core.c                      | 129 ++++++++++++++++--
 include/linux/i2c-of-prober.h                 |   7 +-
 include/linux/regulator/consumer.h            |  21 ++-
 include/linux/regulator/driver.h              |   2 +
 10 files changed, 172 insertions(+), 48 deletions(-)

-- 
2.55.0.897.gb25b4bd76c-goog


