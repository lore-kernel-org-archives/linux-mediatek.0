Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE72FED9F6
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 18:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L3B+l1nCm3FNhk4kBJBwRpPq14NGITcxDK6Zz7w/Wh0=; b=kZ70Bo9i4Crrn7TuVO766tXWdq
	cNJEz/obtyfo4kJgG7NmZKR5NNSSDD54KpPvgR/ZjzIGUTmbg7dgoJBnH4/0Bz7LHklZ+7yK20s1c
	xkXZ51kTVY8I9NDXYitzo66IJR81+aYDgjzDjoWfxXUBpuBPH2s+xw8kygMA0hP9LyY7X9iSnP7cU
	wb+Nloq7Cvf87zQYNheb0y34TuVwzIi9tuId3bqRDQbvuE+bV8cXptXPDqlBBGHymPpLj4ZoWhA7W
	oYBSMrL+Ktn0QbQ4BVkQGEVH1pLlZaghmOIFZx/jKlX/Rcam0HnEVEbhL2AA3eLrd1AU8NvF9iapy
	gqVfORWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQ5-000000074G7-1gVz;
	Tue, 17 Mar 2026 18:45:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQ2-000000074FO-2Pl0
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 18:45:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso54718155e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 11:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773128; x=1774377928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L3B+l1nCm3FNhk4kBJBwRpPq14NGITcxDK6Zz7w/Wh0=;
        b=jyEtJsIRRF9Qpsnp4cY/VAE4xuI8lHKZdJybs49Ww/5xhJOJuKKowQLszWdTlHyG1J
         JkXKwJzcGJkFrCL2CgFgwHtza2p8TO+jQcWySCBfR701yWptsr3XbXw1myQCQmRb5jB6
         7LtVNphhqwyEOZunwI5W2osiOklp32St7teuQcH6A4SB5m5U/vAvihoOPzWzmrY2PGNq
         AGMOwXn60FTD1zFORCOM1uIoWjF3SwAiU2kbr036wmmbShvlZCPIOqXRuk2Qt1tGgyEE
         iQPzcT/yl/0P4zPAn7epUwd78l3T+PPmQlSNjERtIY69Ow2q5qx2qDR/VYyQcIfi/Gix
         nz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773128; x=1774377928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3B+l1nCm3FNhk4kBJBwRpPq14NGITcxDK6Zz7w/Wh0=;
        b=XXx1MxLY9WYYn6bm92IUPH+0vCyGskE3p5D3FrTWUsT+wSZSYW1FwWfvxiLz7Nv1g4
         o4poVbVbyI3PNieSlTGUOydntmZg0G/0hpOWfgzpJsRcdSeH5qIGTPGd//OXfUgBoupN
         TDm3v2V5x2MLWXQiyJ6wQd30xvKHAYmWa1Knwntt/IWqX7DTsXKCjFYwFP7BykYBrQga
         uj7++AQ+RETFv3HdnOqgzZIwxfZoYXly2VYC6G65X5CCM76HkWcT+TiN0owS3tGMJDY9
         XjWfM2tmdHWAq9IRelXb6IGlmUq6POkhI2sBGnjkfdrG4O+6NrdqsxqIW8ztLdAGWp+A
         Yrug==
X-Gm-Message-State: AOJu0Yx1yvPzmnpDjoFVYNkbc8AeS9V+PYiMchzDQ1Bjy8n60irubcSN
	oxv2TtsZRI4dtnjJLeAxKyyEMUg55m/2ZAdTJWVF/RfH4d9ZcwXDoumUx8wSIm9Z
X-Gm-Gg: ATEYQzz6pfytU7P3pQVYORKfFkd7HKKifClJNx43xsMvIy4FYz9Oj3F3323Tg039p5r
	O0SV/Xa+A8Ivx4ZdbBg0C2aQnZR45XkhH5bp1DP1EyY7UFPUrTtPBNbqSjrd56rB5bBDbpbwyb/
	JUoMlvyJKUQAWQrd7Aer4ofXHpU+bsVSR5A/yyrQu/Tf5Dv6O3maYUQkclV7aDEdJQAmuK+2tM1
	qM4+GTEYDpW961uv6pP+yRr8gnxvF9laMrq5L5k6PVni0IyadEUnaydZC9LwjJTXg0o56O/DNIF
	cLpMsEqPHQs5oSinF4uWJDrvhDcYhn8jXTFPB6aCnAGcMMyXDdYfUDFmctZ97vDelYNjS9QRWFc
	zHsCUvsK9gT/oXaNs21DyZYjNZACXUeTulsgQiXXModGHjZuTsADsz4iYrYYVKJU+aNLeU8Mc2n
	nDBo0X1Yg2rnCbEZZ07J8=
X-Received: by 2002:a05:600c:198c:b0:483:7980:4687 with SMTP id 5b1f17b1804b1-486f457232dmr11065415e9.17.1773773127876;
        Tue, 17 Mar 2026 11:45:27 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:45:27 -0700 (PDT)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/9] Add support for mt6392 PMIC
Date: Tue, 17 Mar 2026 18:43:03 +0000
Message-ID: <20260317184507.523060-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114530_633760_38414448 
X-CRM114-Status: GOOD (  15.49  )
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
the mt8516/mt8167 SoC, and is yet another mt6323/mt6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

This series only enables four functions: regulators, keys, pinctrl
and RTC.

I added a handful of device tree improvements to fix some dtbs_check
errors and addressed the comments from last year's reviews.
The series has been tested on Xiaomi Mi Smart Clock x04g. In order for
pinctrl to probe successfully patch [1] has to be merged too, but
each patch code has no dependency on the other.

[1] https://lists.infradead.org/pipermail/linux-mediatek/2026-March/105005.html

v3: Added pinctrl device, changed mt6397-rtc fallback to mt6323-rtc,
    added schema for regulators and fixed checkpatch issues.
v2: Review feedback - replaced explicit compatibles with fallbacks

Fabien Parent (4):
  dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
  dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
  mfd: mt6397: Add support for MT6392 pmic
  regulator: mt6392: Add support for MT6392 regulator

Luca Leonardo Scorcia (3):
  dt-bindings: regulator: Document MediaTek MT6392 PMIC Regulators
  dt-bindings: pinctrl: mt65xx: Document MT6392 pinctrl
  pinctrl: mediatek: mt6397: Add support for MT6392 variant

Val Packett (2):
  input: keyboard: mtk-pmic-keys: add MT6392 support
  arm64: dts: mt6392: add mt6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   9 +
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
 .../regulator/mediatek,mt6392-regulator.yaml  | 318 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 141 +++++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     |  46 ++
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 +++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 487 ++++++++++++++++++
 include/dt-bindings/pinctrl/mt6392-pinfunc.h  |  39 ++
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  40 ++
 19 files changed, 1770 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/dt-bindings/pinctrl/mt6392-pinfunc.h
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


