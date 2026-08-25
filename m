Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29EEC5DF81
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 04:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJaZXX8cNoxV0uNCu7A5Ojv5p0WSmZqW9OZzrJevJb8=; b=vCG/ApTDWBBdYUbYdaleb1yyOV
	i0sJNRxOvdEmwVZMJCusQLnM9fQ3fuGTVGrDKc6hjbUkbBFqtYc5guKzKHqPdxnW5yiBd4bySQQfs
	vnJWQNTmIcAOxMXkqJ/AURfscDH4eqHPbofT9RferrbmnHq2+i85pMZxX5oXxWvsO8no4BGhFd9X6
	qfmjjEFmh18Gd485UODY1rtjJF6v+z0QBG1NTxzkcx9q8rkecL5WUU/zWcqbAZzdAxU8NuiIQ+0/s
	TxDFL0VECw6kKRjrAw6rBJw+Cv5KXxpCrB2SqUs+7CCRJF8VIjA3o87jlYH/Nx4b4hKZ75itbLdLS
	7Ef8ECgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyiqu-0000000088O-0y3r;
	Tue, 25 Aug 2026 04:33:36 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyiqq-00000000878-2B42
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:35 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so393168a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 21:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632411; x=1788237211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJaZXX8cNoxV0uNCu7A5Ojv5p0WSmZqW9OZzrJevJb8=;
        b=VslJTxFKMhsLZmagDaKNPiQ5Wzr6lZB1Wt/mHWoSB1vbpSxkv53gtHUaID5WY53WK4
         SQ9gzexVRNNlOdfXL8NMbm4r3MEEeh26kyUlv2yRWQFSHs2UqYadl5QF0MuAFw8+7onB
         //qFSJ4dqD62IwQtbre4++pi1rEO87dcxZSPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632411; x=1788237211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJaZXX8cNoxV0uNCu7A5Ojv5p0WSmZqW9OZzrJevJb8=;
        b=QtKo9B9axmeojmAcoWCBMg/7e2qsW1f0Wx8OieToJdcACGMC/+2E7PkHJBmkTdysMe
         Fexe96OlaKSo0n4saJ1xVm7rXERstjVgbDm1SkrSe2yRTVX+RYt9shRQl3MjVTLxbCs9
         vAPGH03DuGgEQ1LaBvyXH4qDI+ssLRbKlhsUUEQqefqYilPtiEAhV6b7WkVcC9Ax8FoX
         Siq3kvbKGvBaEOA1lJ/7zIMqGVFgfNJ3Gqs0BuJBDs67JJNY5m98Cz+b9a7sKdnGUFxM
         Orezq5vdyFXBJID5WX4LgoJ/tPimh/UrcH+y0OQQWyDFVrmnmX0TfrrnScpjOCQCx5Ew
         hs/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoASdxRp9PV+S9hgiXsyxcYDaoOB7qn5xqsEUg9MAuK91AQxtOq0jRrzUwOdQvsB+7g/zfC2KLOBigCE+HQAw==@lists.infradead.org
X-Gm-Message-State: AFuF++ki9QkSM8WKFwvdV3ewuZQlbtNNPyHkwDgYQzTZ1ggRUlKQVjFv
	k++Sr+YATERZBs39bCm7litvSxG/o20ZWeU9aKuAete2D6uztobLVrICttS/ARCFqw==
X-Gm-Gg: AR+sD105w8vT2hefFF5IKM/wUJ21BZG3OqLEb47cuePk3vF4CiDwTIDDZVOH0r4hYfg
	IikdS8MZDfcyfnYIFNtlOZ7W5pn98rikjFvGA1x2jelns823I4CBFnMXEtX6ewVPisqFNjbeV0u
	ySWWXfvcxT8k3FftrUgHK8BcajMYUn3qTYNo4x7MYMKXf28vqknu6wQ8B3ioY4Z1pTalHFSHd5u
	tpKityc053JVAIZyXSG1Sg8y2PJ7O9d59bbKX83g6GrNcf4da/rYPKWxvRIZPyxHZFo2GcP32U0
	e/lDnSJqd8Srw87M+64VkZ+GHhw0K6fTXFrQybZW0+qckUJ9X+gysW9ZpVa7Zpl+PFnb1Gq1VIw
	suwDJzeE4CNTZDfd4PeZ1TsJN3+1eUX+oFyWHNXVehfaHZnKHzguzytT9CuGhadtRqC3R3YNfWL
	O/HV57m7PCm3eHfllArFG4E8RgOmODr9z4Vav1wbmlFd/BPKvRtLi8p9wysftpC78Y0ayhcZ/7w
	kDxwIq6Sle33A9x6mSFK/j6QGfVB11/hQYEtAB+1S1eT8I=
X-Received: by 2002:a17:90b:1b04:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-395c33406e0mr52907259a91.2.1787632409907;
        Mon, 24 Aug 2026 21:33:29 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:29 -0700 (PDT)
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
Subject: [PATCH v5 0/7] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue, 25 Aug 2026 12:16:18 +0800
Message-ID: <20260825041628.988369-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213333_467493_099BCEAB 
X-CRM114-Status: GOOD (  26.15  )
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

This is v5 of my Chromebook trackpad supply fixes and optimization
series.

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

Patch 5 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 6 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 7 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 2, 3, and 4 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers. Or if it's not too late, Mark could take patch
1 for v7.3-rc1 and the rest can go in later.

The DT changes must go in after all the driver changes land, especially
patch 2 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (7):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
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
 drivers/i2c/i2c-core-of-prober.c              |  25 ++--
 drivers/input/mouse/elan_i2c_core.c           |   7 +-
 drivers/regulator/core.c                      | 117 +++++++++++++++---
 include/linux/regulator/consumer.h            |  21 +++-
 include/linux/regulator/driver.h              |   2 +
 9 files changed, 149 insertions(+), 43 deletions(-)

-- 
2.55.0.860.g4b6b3295ed-goog


