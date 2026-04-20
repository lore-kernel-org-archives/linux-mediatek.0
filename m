Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27844F5A8BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 21:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=; b=gcN7pdmSmgWO9MsgTNOLqCmsYZ
	X8f/+8ejCjFQZRaZ2/X0srbss4BcByvXEzELkyTHM+hZ5aBYY06PKsiGgA7Dln9Jfv/PPzlcXabMA
	9AKssjksbiy1T4M8FwQwv2Ey9rbSGod00qGkWDI6t/L8U+gx5H6u2AEYiTRphmSe20ajqdSZZvvvS
	3qYrCOlafyczM9zqI7/tdoJP7eXQz7JE+a/hjwJD8oPnEk59wOiAGvH+nS0w47YKUUeIumJ4cKga3
	bOFeLY8ZdZ0Rpb1O+1gnYgeN+Mh6iH5IwADTv7o5bHPf2egOyzeWT17AebuGfIniAvbAEuh6wteMD
	Se7INbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwHs-00000007jel-0Tnn;
	Mon, 20 Apr 2026 21:36:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwHp-00000007jeN-0LKN
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 21:36:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso11822985e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 14:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776720967; x=1777325767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=;
        b=I5Bc0Andt8B5yb8aCa8ojXuhq9KgL4PwoxokkL+x5lfLilBhd7mdaxS+5OGMOpvvjh
         b0KpmkPSW9QbLPHcBKR/x4rdR90ecMwfri97SI5kbjV6aaFzUqzJ+7wi6/VaXATeqnhQ
         r3bUBcdIw2jUyU9PHbzNk0HXbdFe08RK5CMhwORQMWXLZyEyPM8Ax1enGmWt5CIyDNHT
         6C4uphXSVfUKlXOZNVzoLcNhkWv1zFFOk3hs7PkTdvwo34WlHzgkVB72liIUyqw1o7BG
         6b2WVxH/RuhkxFcfAUB8ObhYUuIeEK75ZYHolLCa2JH5m+wcfOS7pClxJ/CwXay7lQlI
         z7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720967; x=1777325767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=;
        b=jIIxJxOsgFAj5oqTojRvLLJ9307h3uYRIGmiNAbm7v6k/vNKCYgwWet01nD+9yXEpm
         DhIwwgYukEks00YyTN2U48n8zNJADcp2f5WYM43JZQDy7r02yXlhGBqMn4gnwrxjwfq6
         G2uGTxDm9HUWpBwIvuGEbptZXbitHs1F35qqePyz5eg5wN39lSn+5Cmp9DrzTgpyeFEB
         oXcxi863npoLJ/MIaEEeckyefhTBgJuyyD2PN2HmjglgfqErFHStNhLcqWW4AcjgccZt
         0tmq5zrIfAOLqcs8IOWSQ/Xbem2xdSb/lxJumGAgeZQfK0MzGZBPgAj3r6iwit7z4QQ1
         yONQ==
X-Gm-Message-State: AOJu0Yyc9DvkUudju0JxyW6ED4WjvB9n7dGTqaOFgqnTF3jZOFV+Rm7h
	GOL8zEojR38lFxw9Q18PpDwQto8WuVV9nyUwQ8YW7A6F/Xk6WKLEX3mKc6iv/qCV
X-Gm-Gg: AeBDieuxVew9YK5wL3wz9VL85t+EUV+ZHcXyV26eHkUibmlRLF24PC118g5x2gm63kI
	rkRafELrBEHgmSJwOVzTqifx2s99jUxU21c0b3BiwD59rtKtaQ8B5Cn04RHrW/bfYRxIu4rcTtH
	crY+q0b/y62cY0tad8TXOgLcJ4W7hV+sbRdDopD/KyFaIDP8ArBooIs2wpdiDpnKyZy0sPPea0z
	HhQ8y1Zffs1A5D9FzMATaR1GTm5pzUD37kdhVff84OMcaX080PiIRS9BK6LeCBFftCkoNt0b+Uh
	pMV4CucS+nhJ5zzX+Q1dthXkHqB+uuyfsvHVT4bk4vZnefWF1kvb/bF/2RSgo3gGEOexjXBTEbd
	FZwi1ouYjRIBMI9g+Synvn6uCNGNfYFiBllliztjhCNgXv9bPspYrI4QyRCvwiP3gkywPfMi5NW
	MWF7uBcZiQPbvYHqj62nB8diS6vOji4g==
X-Received: by 2002:a05:600c:34c3:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-488fb792dd0mr216654415e9.23.1776720966527;
        Mon, 20 Apr 2026 14:36:06 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 0/9] Add support for MT6392 PMIC
Date: Mon, 20 Apr 2026 22:29:59 +0100
Message-ID: <20260420213529.1645560-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_143609_149980_4989CE4C 
X-CRM114-Status: GOOD (  19.11  )
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

The MediaTek MT6392 PMIC is usually found on devices powered by
the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

This series only enables four functions: regulators, keys, pinctrl
and RTC.

I added a handful of device tree improvements to fix some dtbs_check
errors, added support for the pinctrl device and addressed the comments
from last year's reviews.

The series has been tested on Xiaomi Mi Smart Clock X04G.

Changes in v5:
- Double checked regulator driver with data sheet and Android sources.
  The data sheet I have misses a lot of register descriptions, but
  Android sources have been helpful to fill the gaps
- Reintroduced the required attribute for the regulator compatible
  in the bindings
- Fixed the missing reference to the MT6392 schema
- Fixed casts/unused vars reported by kernel test robot
- Removed Reviewed-by tags from the regulator patches as they have been
  modified in this version

Changes in v4 [4]:
- Dropped usage of the regulator compatible
- Fixed commit messages text to properly reference the target subsystem
- Added supply rails to the regulator
- Reworked the regulator schema and PMIC dtsi. Now all supplies are
  documented and the schema no longer includes voltage information
- Removed redundant ldo- / buck- prefixes
- Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
- Modified the MFD driver to use a simple identifier in the of_match
  data properties

Changes in v3 [3]:
- Added pinctrl device
- Changed mt6397-rtc fallback to mt6323-rtc
- Added schema for regulators
- Fixed checkpatch issues

Changes in v2 [2]:
- Replaced explicit compatibles with fallbacks

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/cover.1771865014.git.l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
[4] https://lore.kernel.org/linux-mediatek/20260330083429.359819-1-l.scorcia@gmail.com/

Fabien Parent (4):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC
  regulator: Add MediaTek MT6392 regulator

Luca Leonardo Scorcia (3):
  regulator: dt-bindings: Add MediaTek MT6392 PMIC
  dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392 pinctrl
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |  27 +-
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
 .../regulator/mediatek,mt6392-regulator.yaml  |  76 ++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  73 ++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 118 ++-
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 740 ++++++++++++++++++
 .../pinctrl/mediatek,mt6392-pinfunc.h         |  39 +
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  42 +
 include/linux/mfd/mt6392/registers.h          | 487 ++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 +
 19 files changed, 1776 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


