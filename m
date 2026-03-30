Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E755BF3D61E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2026 08:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ffjqD22wwfmhO+ld9/luMon3GDz24nlqdVKsWtkc/0=; b=ej1TV8cZPms5Xo7X1hvnjVGklD
	vuBwhExuQcQCh9Tn6+LA+BhYYov3laMzsKXP+E15Dkh9pPeXwzRWqpxiqcwjAMLqx91gUybWGwDUm
	fAbztOHkqMIb1FRD+ADE5MS29+CXnhkm7TMNhavqCs9dwKw7m+HTvpQIoYR/9Qc6pH3kVm7zIrw9Y
	a2QE2cGIYJZf0aDedDF0JizO+cTrW6obVD+gDUo9ck6NxdcHuanyJdz8PrgSgc8mqeo1N9SoTcVjZ
	QEWSzd/sZNmCKH6wk95Ft/tvlmmgjvLXcliMNRzLpBv/DUxiNb7+31K4P8gv5Ykqom1n9u3oJmTdD
	mP8yCgzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785D-0000000Ard9-283g;
	Mon, 30 Mar 2026 08:34:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w785C-0000000ArcN-0WPK
	for linux-mediatek@bombadil.infradead.org;
	Mon, 30 Mar 2026 08:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/ffjqD22wwfmhO+ld9/luMon3GDz24nlqdVKsWtkc/0=; b=Bu988ft8OJM3RV1C6ONiIwb/RC
	Ca2RwxYu28qQFGkUSryi55RK3oMYXNCXAtcpVC9xXOvDEalWmxS8Mz2pqiUfpDVw2bbb4qKm/yGXD
	r5HXFocIAH1vyigFat6ed5dlQv+upNad6i/HhMb+T7rj0v/BV7Yoow2Ke+9MyHvL/Vjh70I2ayv1i
	R1YAJAAkVZWphNaIXzuFwMuiqgXL6xBIz4xnQuPtDGEaooXcppeBzYabYdFaHXG1TpOzVwrcaREPs
	hZrSefy1wBS/vq+VPCz9Gz50kMpYsdx7FbGasgIXgQnl/juSkACUtpfjFSKwQcEr8mHz23XErEamm
	MxAt63Ug==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7859-0000000DKG8-0DIs
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Mar 2026 08:34:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so40953115e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Mar 2026 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859685; x=1775464485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ffjqD22wwfmhO+ld9/luMon3GDz24nlqdVKsWtkc/0=;
        b=g0mBEDCy5Xt1VoE/QHMtZJVUHgblztehyqspci6PVOscCeFcOlJtVLzMxvtSOn3dfm
         cBCdS/cHScP5ZOU42jhYMW2k2D/1ZYLOgUx1Lv8MrERyCCNi1L4LO3PTmZIIUTSQ0nq6
         5LCRmvGBzV4ktJ1JzJpi2KJuorEYgDmsT4nfxdpeN7wvn3USjEDQiqt0zJEdJyF7VWxU
         SanLOm98pytlb5H9QI8tYgo15V2Jj9FRggfsV+Zg+FmvVLWNN8z1Y8dti4FoyP2EcAjP
         ubVaINQ9oaBZ4amhGSQ6Ar0/czorZos8Rk02cGXxc9pXLyPW73bPYUqSk5Oo8earcuov
         ox/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859685; x=1775464485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ffjqD22wwfmhO+ld9/luMon3GDz24nlqdVKsWtkc/0=;
        b=fGdSsd6pxSomwJ5Z0egYROBX1qcIugFaQuxaw1d+VWMk+KsWaNl5CbAy2gIQA0ZiXo
         iUYOvCIM3zp7A3dC6r2CTY8CavMDD8wBCmuLYDF8zR4XcKx8w06joKD6dEnoE1KQ9//x
         X9ke+L93AUP8gfj/DjM6wvP5d42bdubHMRY3WQchNYMoL1kBrupi/OvcYlPdSttvQZFw
         SeneWusPbFkDKpzFwllEiP0S64dV2iDQv8ky0VpTbB7AsP0Go3zI+IpV6+b0xN2LiDyL
         awNEZ5e2GngXIJG99YlEd+4+/yCsmB87WrrYaKl+WRrc5HX89xCowQ3CI9x+8dVhehjB
         6LHQ==
X-Gm-Message-State: AOJu0Yyctng2SMC/VSxz9AhFbUp1pxDwUpHnxCryj4MIkLGdPJRbxScN
	cD5Vjc7kVTEWLOVO3D2jpjAgYf2jdwX/FuGrInv9CR/k6t4EHjlt+QvDpXOXfOdl
X-Gm-Gg: ATEYQzyrMETA2oLHkKT2Ey1tkJIaDs0Lousb1Ux91AFDbyIn/GFcr2D7vgV+NZPvtj4
	v7/U86VkYJaD7qNI3bxA3jKrew4b8OGiFyDYZAc3aMpZy/Eo9G4oIPZh15EKzVY0jyKEchVBP/P
	+Wad/F4sO9W4YpWu1mt8POWqxK6dXW8XHR/UYQY4NquIylv1ThAG5tcWEglC4T82uokeilI8bB5
	34fTFGTxxFwK0Ll6YmH8qsX0G6/B7yecyk7pGM+BaQE0JJW7H65crULv1ZjITmvkwJUhjdGjrfS
	tDvI0S1+3zUzVfj+L6OH9OmYeGXgIZ327BppvpSPdFXpoKUNU93GbutTmv0Oxf3c4b5ls3EA+mm
	jzZrVO61h+hxO8GOyWcQCVf8U2y9EU3XvJ7A/aqg4RjKie+0u6kpwn5WGM9u+DnQ/8g5Pxkc3dE
	oeWMU2PaYgrPnQq7SsEr8=
X-Received: by 2002:a05:600c:6287:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-48727ef6617mr197260045e9.26.1774859684663;
        Mon, 30 Mar 2026 01:34:44 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:34:44 -0700 (PDT)
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
	Gary Bisson <bisson.gary@gmail.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 0/9] Add support for mt6392 PMIC
Date: Mon, 30 Mar 2026 09:29:34 +0100
Message-ID: <20260330083429.359819-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_093447_222032_14D4356C 
X-CRM114-Status: GOOD (  19.33  )
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

The MediaTek mt6392 PMIC is usually found on devices powered by
the mt8516/mt8167 SoC and is yet another mt6323/mt6397 variant.

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

The series has been tested on Xiaomi Mi Smart Clock x04g. In order for
pinctrl to probe successfully patch [1] has to be merged too, but
each patch set is independent from the other.

Changes in v4:
- Dropped usage of the regulator compatible
- Fixed commit messages text to properly reference the target subsystem
- Added supply rails to the regulator
- Reworked the regulator schema and PMIC dtsi. Now all supplies are
  documented and the schema no longer includes voltage information
- Removed redundant ldo- / buck- prefixes
- Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
- Modified the MFD driver to use a simple identifier in the of_match
  data properties

Changes in v3 [2]:
- Added pinctrl device
- Changed mt6397-rtc fallback to mt6323-rtc
- Added schema for regulators
- Fixed checkpatch issues

Changes in v2 [3]:
- Replaced explicit compatibles with fallbacks

[1] https://lore.kernel.org/linux-mediatek/20260317110249.391552-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/

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
 .../bindings/mfd/mediatek,mt6397.yaml         |  11 +-
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
 .../regulator/mediatek,mt6392-regulator.yaml  |  74 +++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  73 +++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 118 +++-
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 +++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 509 ++++++++++++++++++
 .../pinctrl/mediatek,mt6392-pinfunc.h         |  39 ++
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 +++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 ++
 19 files changed, 1527 insertions(+), 31 deletions(-)
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


