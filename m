Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3537DCD98CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 20:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8rQCLAIxALSz/Z8tD2vL5V4eDD0YacOILyc6cFmNdB8=; b=QPPJn1Mdw7Ut4LzvQUK1L8jX0d
	ZtjZ1XIdopIQNEEEBkKdLspemLzDahFfFvOwpTsOoVFjZS1oSCi7FaaUKJk4qSkv5VKv9HIU0dtKF
	PUD0c9RQvNTUjimCtpiF6Hv7XkP9fiFphH18kK4068UIbKJt9MpF8t5kaVQgg6tCJErSibwpN1ONq
	H/f6gTMqyS4qWD8wlGvHkkILyIZaV7srJGa6W+8L0OHQ+3uohNrymU4mEIUaExy0pLnKrHTbZeKXH
	ukWlcg/DMDhL8i115jA4P24Ry8NrufuFDL3V7GhgwNanCnXa5gsr3CPieyKzny95+VBYFfYKKYsQn
	8cfbrM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8S7-0000000BXcu-0m8i;
	Fri, 12 Jun 2026 20:26:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8S4-0000000BXbt-2UWv
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 20:26:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490c1915793so11822285e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 13:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781295962; x=1781900762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rQCLAIxALSz/Z8tD2vL5V4eDD0YacOILyc6cFmNdB8=;
        b=FtCcBOYah4wt/HbSugHP0WR6+SUFYujCLwhS9XTwhaNWNpQKrx6Uyd5aqPlGWw8U7r
         j7O6oR7qLDWGtY3TK5d76AXY4kGEQYeOb2BXsNqpraw6jjDhW401Kc8geQVpW1FjfnZw
         arLqLqNIxOt1XUWf/EGAe5DahnaMpno3/YLW8Lv4QZN5QETfpl9aU9e7gDFT7VH+pJjN
         SNlAj25Dmb/srQCHSIIE+HD2c61W3W9MWo9Yefp84vlc/7wgH+0A/6JVphbdEbpzZ5iL
         yhCqmQ8Gcc2MqqSH7UCuAbSZboSHBiM3QWyhuuJB34xsxKVHcGP2CiVEzl9FK9V0rgMj
         L+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781295962; x=1781900762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rQCLAIxALSz/Z8tD2vL5V4eDD0YacOILyc6cFmNdB8=;
        b=o9Qh6dt3nmUcf7glAIOyViy3oC8kd47jDxBsBGJeSAUBiNwENcsXOP0D+8G+Jmmpsp
         mvETk3TRuBW7PMQHipxrwR6H3IEzRSAJCDc8xMrc7RmXTD6hcr9cHndf8gh9HLXE0qKD
         xHGfO2Z/V2zNmah9jtuuWFVfkFuYrU7LFTJH35zkGsf1su8RddP8aGTRMkRL36wg3mUT
         UJWnEcMBwjyyROdleh58ZCFBaK/cOj2oXiBERafvwSfj5zVgPC5ZEEFtWq1io+HqMm9x
         yENkpXN0dWfTY4FZKuWXHQ9B65WcKcyjj5M2JfIr9H10CWx5ZBpJj6dZ3QbvGNY9icwN
         cHaQ==
X-Gm-Message-State: AOJu0YzToyDOEwMybp41h/6zGpuGw/8Gu1CYnZgiVsr1p981hTodf/VS
	vAFQLVFe2pMfI9qebF0JL2aMc7ClBzI8DKvkkM7iy5LUpoP7g+qGtmrW/aVvNd3p
X-Gm-Gg: Acq92OGqvAYCeSXkTf7/1G6asyTQovbYwng/Jo7kKmVC5ldgD09V1XQsZTQ49WMdqQq
	OwDkGC0htlx0l4J72uep/XjoWOqPlB3LJPKAv1PexQLb8Voz1ND/zQe7CPDw/7wk0vFoKZYbL0d
	2Opnk8ZZMB5WFqqJWY80hLWSRb6RkrN1aTXojEXVLCIs2rxYNe9NTFZ3tLM5N8ukzJ6wBRcu2Ld
	Ych5piYm+Xey8c3iDdHadJ2I3vKX+DmX5bIsTTNsdli4oIBGFcFtZ0h/cuRwwEyQr56BHpIVw7R
	E7tdqoTDEJ5Ze01vgKXROn9qRkChvtSPQqa7SUpg7YO5XbqnIjvRv4V9Gk0MtaO4W5zmSwBqZrz
	9pDOhqspnqZgsxehwlyPLFbylu8XOgKT889mJS6yOkmlVqBHPUAo6a0Ejsqo3DL5MK3i60pCO88
	3uOxTwKyczwRzs6dRX
X-Received: by 2002:a05:600c:3585:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490ec4d4f71mr59232905e9.8.1781295962029;
        Fri, 12 Jun 2026 13:26:02 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:26:01 -0700 (PDT)
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
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 0/7] Add support for MT6392 PMIC
Date: Fri, 12 Jun 2026 22:04:05 +0200
Message-ID: <20260612200717.361018-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_132604_661224_854EB296 
X-CRM114-Status: GOOD (  24.11  )
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

These patches only enable three functions: keys, pinctrl and RTC.
Regulators and speaker amp will follow later as I still need to further
improve those two, but getting the main PMIC in will make the series
easier to review.

I added a handful of device tree improvements to fix some dtbs_check
errors, added support for the pinctrl device and addressed the comments
from last year's reviews.

Please note that patch 0005 depends on patch 0004 as they both need the
registers.h file, but they belong to different driver areas. I'm not sure
if I'm supposed to squash them even if they belong to different driver
areas of if it's fine like this. Any advice is welcome.

The series has been tested on Xiaomi Mi Smart Clock X04G and on the
Lenovo Smart Clock 2.

Changes in v6:
- Dropped the regulators driver for the moment
- Explained the FCHR key name origin in the commit message
- Introduced the MFD_CELL_* macro in the sub-devices definitions.
  A separate, independent commit introduced MFD_CELL_* to all the
  subdevices in the mt6397-core.c file for consistency
- Replaced of_device_get_match_data with device_get_match_data
- Removed the mfd_match_data enum in favor of the preexisting
  chip_id enum
- Adjusted the error message if the device is unsupported

Changes in v5 [5]:
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
[5] https://lore.kernel.org/linux-mediatek/20260420213529.1645560-1-l.scorcia@gmail.com/

Fabien Parent (3):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC

Luca Leonardo Scorcia (2):
  mfd: mt6397: Use MFD_CELL_* to describe sub-devices
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   8 +
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  41 ++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 294 +++++------
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 +++
 include/linux/mfd/mt6392/core.h               |  43 ++
 include/linux/mfd/mt6392/registers.h          | 488 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 11 files changed, 840 insertions(+), 162 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h

-- 
2.43.0


