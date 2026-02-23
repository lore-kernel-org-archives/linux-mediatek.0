Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7B2EC110E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hyGEcrLpV4bwwocVSCsdzUyZjiaZncJT9oIq/dUyqxc=; b=iNn3YAQCfaJP2KYpsS4GzNUaUL
	ANnNebS540l+npWvUNysECtr1xBI5xCa9cBnwqYEhiYUolO3irQFn4McT1a2G6MwfTzLlWhUZFc5v
	5WLgOZhm6sBvQ++1Q1T0VKFFIsTGbOO5i7vFGFNf/QI9PuitsQQRoN/igEHY3m0SgKLuVwzUb6LQp
	+adtQt3QdHVBjgIantJlMp7sQbI1KCsvPwSy3JPvCOUzqOphTW8kC63XORJy6J1qW5m9hmuS1y3B8
	hcywKgBf3Q8qzZ2KJUP13Bvd/MQnFiYrpg3rTR9kjh6AfVV73W8qtH27gH5LwpxhhfOgpRCNC0EQf
	+eBHCpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYY-00000000jhk-0WmR;
	Mon, 23 Feb 2026 17:17:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYU-00000000jgk-3zu8
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 17:17:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4837907f535so41307825e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 09:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867029; x=1772471829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hyGEcrLpV4bwwocVSCsdzUyZjiaZncJT9oIq/dUyqxc=;
        b=dVHyqrk2mCtt//qFyPHtwGysqx9N7DdtfPwAPKJvGbzlr95YMT2jlqOdifoF0Ldd9L
         zSBayrU2n7FnXq7Y/uOb67XPCu2uYg8Jwu8g6vvoTPj2wrktzX0yjZeI9JZ8vBz0fUo9
         9U09UD3YnBHo5gShdULoVO62ICogaNRR2WQMzVW+j52q0jBLf6VwOdUZKBD2rrY+Rgdq
         uiuGoH058RAaLbX3LaW1psM/elURGglc7lME+JatIDvSKq5saiixtN2SLvbjUONPH8u1
         sl80ZswVWL9KtNyjsUEHqymSI42Tdj3uD68ZC6IAhBaGPzurxr5YRX5tCh/I1cxLt63M
         yGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867029; x=1772471829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyGEcrLpV4bwwocVSCsdzUyZjiaZncJT9oIq/dUyqxc=;
        b=REGrkItDUQRMtb2gDKkiGM3cjvMWWFDYIRBpfGHNedvp2hSf9VGkckcIKaCYzPtLU1
         UwuV89/dmWFet1W1Ygc/FipZccuKbVXvWJaQ/od1bdc3hrV5BxIF9hkCKfCuMmRQOqT5
         sPscbm8Lf981D7zsE9gRpYPKWCGjxVw/KCVDKS9YwRFi9Ee3HRkwEa6rzopkIdthSiY7
         JH944vqyZshRfxG3RfAf7HJApw2sdC/Rknm18HbkfZXkz7z1j00/pzCsLECfFMGjVPy4
         k378FxDCmzk9Fex8AizgYtjONQqYdZcBRWJPtX0b79RPAyPhBqY4Xb/qROAPIogRaoHH
         n2jw==
X-Gm-Message-State: AOJu0Yz20b502BIgq/oKMmjaZOO/A2MXfUPCJZuqT0JgdwJ66MFQrYOj
	ShWXpLsoCuD/c5UV5W5YP9HDR1NgxRWmiGkgxax8V1z5A1Dm9Wq/yDJz1nLigQ==
X-Gm-Gg: ATEYQzzTO6B2VSBsK1ejgpWvSLiGKp6qZduS6Kj6GOgRvV58L9OPE82uAjzD3bMOIDL
	aT1XEqt41dhLLnqppBhVRACenH6/XB2ldXNKRBmDW6K1BwppFN7iHaSQ3FVy+vo8z2Hkhne05kr
	6wayR7whM/zDWYXbBHtG5ejXqi7G4j2Z3Ho3UGMEnaomiywulxEzkD2MHATdJT8eT+sW7fOpVBB
	J97jzzsSNpcWwTUXJBjO4KFNHa62Skntd7f6Pzr8YR8GbQScceYjuodTAfU1sbrzn/UPm9mvE5Y
	sFQEax5W4lbAiexizHzaZqAPbiLqC1Jfe5nEC8aFMTyPZiLDVXDNF/HfoM5xwpxNujJ8FQDeiRv
	CaZB0FtUxCZZ+JvB/aHeBLejv7URDvzkMcqyiUhkVY7ROJsPQenNHRAg6fGUTt6axFHjD5dIMZC
	dbf7Mfhn5wGnCAMSnehfA=
X-Received: by 2002:a05:6000:2910:b0:437:8111:e2d0 with SMTP id ffacd0b85a97d-4396f1562efmr16272260f8f.8.1771867028658;
        Mon, 23 Feb 2026 09:17:08 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:08 -0800 (PST)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 0/9] Add support for mt6392 PMIC
Date: Mon, 23 Feb 2026 17:12:39 +0000
Message-ID: <cover.1771865014.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091711_000083_5A0DF412 
X-CRM114-Status: GOOD (  13.25  )
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
the mt8516/mt8167 SoC, and is yet another mt6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

This series only enables three functions: regulators, keys, and RTC.

I have added a handful of device tree improvements to fix some
dtbs_check errors and addressed the comments from last year's
reviews. The series has been tested on Xiaomi Mi Smart Clock x04g.

Fabien Parent (5):
  dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
  dt-bindings: regulator: add support for MT6392
  dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
  mfd: mt6397: Add support for MT6392 pmic
  regulator: mt6392: Add support for MT6392 regulator

Val Packett (4):
  soc: mediatek: mtk-pmic-wrap: add compatible for MT6392 PMIC
  input: keyboard: mtk-pmic-keys: add MT6392 support
  rtc: mt6397: add compatible for MT6392 PMIC
  arm64: dts: mt6392: add mt6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   3 +
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 133 +++++
 drivers/input/keyboard/mtk-pmic-keys.c        |  15 +
 drivers/mfd/mt6397-core.c                     |  43 ++
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 491 ++++++++++++++++++
 drivers/rtc/rtc-mt6397.c                      |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          |   1 +
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 +++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  40 ++
 15 files changed, 1276 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


