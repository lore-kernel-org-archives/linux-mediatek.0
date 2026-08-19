Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02A9C5DF87
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fjy7BDi48DK0VY42L1wkEP3ayVKA14OCO7JVfsirlug=; b=p3dZov+u0BolMO+yYFbtXYUKTj
	pEsL4NdJKmRLPqjB/Oc7NsBrSRGrYqwf4X6TNyYv6EU9bkwpTovKk1G+T6TxFR/6w1oMMkGVgHIAj
	i5i8+XBi45O4NiqTA7daXBpvOLed72jJTNFRKn0NCRn6ljKrXC+2u64MENhyYDNEu500PU65yCJ0H
	fV3bUONByOD4RtB1QiN7nyxLZ1+fPq8Fg14guPivHEz5FpgZRWzO/NX1qd09PBcssUQ3ZbgqSFJ46
	L+vezVnLX7dqkrg2WjESYieB8mz32HCrVHbCaF6jrdNhX6OzlTrws/MFUnzaEnysqLtyYyoS73Jrm
	DNZQzskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOA-00000009Vq6-2FXA;
	Wed, 19 Aug 2026 10:19:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO1-00000009VkA-0nEo
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so10054765e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134747; x=1787739547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fjy7BDi48DK0VY42L1wkEP3ayVKA14OCO7JVfsirlug=;
        b=L2gK/hZyE1qV5LevuU6WcZCKNhHSone4OqHzOU9Oux4QLvCl0+JecXig1lbaLsbO2Z
         8hEwKTlchd23LwyXMh62dw7hXTpccG8hxLSuMtwxxqeClTZSNDYsUevkchYEkoNyzI6i
         3uPZwvum/pmUZ8QLtl10jh3X57o6reFQsZzcolwur9UE7NdcQxPyJam+wWf4BSoh20IP
         YTMl9AMol5G2jrKBFVH4J+NWSK642/mItY2SK1waU5qifhs7SkUkHBa0T9sWx4DV8g/+
         S5TwPj23COX3Cc6aoX6CxU3MbCADpohsGprBHrEj1KlBrCvolML/DW8aCz6HEorjljjT
         B9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134747; x=1787739547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fjy7BDi48DK0VY42L1wkEP3ayVKA14OCO7JVfsirlug=;
        b=g7Z7922ZNwpvN/qHwU7z3uCmHvQIC6PaVjSe+l1GVgLNVWCc6VLsJm1aUqWMAiob2T
         LsQ0huQIy3nsc7/2cyJg9fouqZMxbK96uOgxAQ60nmQN+zV3Pkm1ilxwOcIB9DzFgAo7
         U7wtwqNn1HqfBJ+T+2ZnkQP5Mghq3cHFq5i4cM7DhDIaqJFw6E4nQDujJGe68kG2WCPc
         A+qQBwDECn2t0/7eOKWqflkaeVHH2zT+M6iup98kLCXbaFf6ipQcygSyHTxHeq1K/VQp
         EH2MDNq+stfZMMxOunqXPqcQjj6od9oWRSdr8t5QlFo5lbpbf3Yhpzc7e8s/pWxlv0n6
         wYWQ==
X-Gm-Message-State: AOJu0Yy8iRe8wzxj7OxGSH4hUAM3HNb3Rf7gzhPFLv5rfLSq4Xyp66o2
	YGZ2spEi3g2TPVFxDEqFUbECXqZjlgrI3EndddRV/24vuEouRCUJm6J04Dsp5wEi
X-Gm-Gg: AR+sD131oq5jM4MCtC/dkxy2LF0mEsJX3QHg8A5SPsBzC5e8lLKPsysWzl5viR5hbOX
	xImMrOeoMF0LaoduQrfsFyiORZa1S1U59uajP4IB7V3fDhcpJrfsDlf6y+fqKNjFypCqikNMffz
	i+vbwsPpO1PD58ayN26ImR8Zk/cTOlv6wHYRvVHPXTp4h3PZHm/xvHzIXh8tX4fZAREd/bkGu/Z
	TTPa0AB2NHIQq94Il8V4b5sIqxaGgruoVYzNzGOiPqjzg91NYHEZqEoHXbqgQdkCbVGsSzufje0
	yKp2MQs0JpxBKsHMlq0fnoUowmPf0Ue45OPQIvV3FoVe0ZSoA24Xhq4j3tdq1A8mAL09OtPsTuu
	XPvyqZ+cKIS73dJl46+CijQWxLA6fIvJC6moKarb3dCgX3sOjHN9UD/dXPZfTNruJpdzyTriW0l
	MQru+25s3cbaIzfprmz1qNMxQFd2pgKVwljpZ7oGK8IdYaOtPbJXmSbg==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499aa20c7b1mr56722905e9.15.1787134746695;
        Wed, 19 Aug 2026 03:19:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/7] Properly describe mt6589 and mt8167 toprgu resets
Date: Wed, 19 Aug 2026 12:16:21 +0200
Message-ID: <20260819101853.44681-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031909_292895_C9F5B753 
X-CRM114-Status: GOOD (  22.45  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt, which does not support toprgu
resets yet. This series adds support for mt6589 toprgu resets with bit
definitions obtained from Android stock sources.

However, according to its data sheet, mt8167 has 14 sw resets instead of
12, and the reset bits are non-contiguous. This is currently unsupported
by the mtk-wtd driver, and it caused confusion between reset IDs and reset
bits in device tree includes.

Therefore in the first three patches we improve the description of the,
resets for mt6589 using the definitions obtained from Android sources.

Then we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Also while
we're touching the bindings reset includes, we add IDs for the MMSYS
resets.

In the 5th patch we add support for a watchdog reset table to accommodate
the distinction between device tree reset IDs and the actual bits in the
registers. Code is inspired by the reset table currently implemented in the
mmsys driver. There should be no effect on existing sequential wdt resets.

In the 6th patch, we define the mmsys reset table for the SoC. According
to the datasheet, there are 28 mmsys reset bits divided across two
adjacent registers.

In the last patch we actually enable the watchdog driver for mt8167 by
adding a node for the mt8167 watchdog referring to the new compatible in
the SoC dtsi.

The series has been tested on a Sony PlayStation Classic Mini and on a
Lenovo Smart Clock 2.

Changes in v4:
- Squashed the reset IDs includes together with the bindings change;
- Added support for a reset table to the mtk-wdt driver. This allows us
  to decouple reset IDs from device trees from reset bits and lets us
  describe correctly the non-contiguous reset bits of mt8167;
- Improved explanations in commit messages.

Changes in v3 [3]:
- Improved explanations in the commit messages;
- Added the #reset-cells property to mt6589 watchdog node;
- Included the mediatek,mt6589-resets.h file in mt6589.dtsi;
- Included the mediatek,mt8167-resets.h file in mt8167.dtsi;
- Moved the mmsys reset table from the mt8167-mmsys.h header file to
  the mmsys driver implementation.

Changes in v2 [2]:
- Sashiko pointed out correctly a missing entry in the mmsys reset table
  in the last patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260717163959.714561-1-l.scorcia@gmail.com/


Luca Leonardo Scorcia (7):
  dt-bindings: reset: Add mt6589 toprgu reset IDs
  watchdog: mediatek: Add wdt/toprgu resets for mt6589
  arm: dts: mediatek: mt6589: Enable toprgu reset controller
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  watchdog: mediatek: Add support for mt8167 toprgu/watchdog
  soc: mediatek: mtk-mmsys: Add resets for mt8167
  arm64: dts: mt8167: Properly describe the SoC watchdog and mmsys
    resets

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm/boot/dts/mediatek/mt6589.dtsi        |  2 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 10 ++++
 drivers/soc/mediatek/mt8167-mmsys.h           |  3 ++
 drivers/soc/mediatek/mtk-mmsys.c              | 38 +++++++++++++
 drivers/watchdog/mtk_wdt.c                    | 54 +++++++++++++++++--
 .../dt-bindings/reset/mediatek,mt6589-wdt.h   | 20 +++++++
 .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 ++++++++++++
 .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 ++++++++
 9 files changed, 179 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-wdt.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h

-- 
2.43.0


