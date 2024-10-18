Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01BCD2F7E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gob43/+gAdlsPFue9el9gcoewwrv63+OSZMDYy79pec=; b=5C1EAC3Sx2ys9cO3pnGT1/3iaw
	QZ/XNKrq1TVS24/U2ELMhYEo1y3thjNT84/rE39ttSsAkIjLMTRBH6ZQ3iOIrOSKjVm7boOpRXkzy
	FM7knH/6VasDMEDDqxzUGcHsfTQUw62oMZ10lesOiVJaCfTqlUFgx9Ya3IKPRpk3ETjUs4DmvVA4x
	RnGt/PUvvN4TiubYWX7R0H8kZJcyOyCDAhjnpnTz9WKW3QCOvRvCgHJCE1jxH1zucnklUmxysXFGc
	TAA8gRicg2minGkKmlTMb1YzikCIQjs/QCnDaUfvNEfmnW2p9cIIBndKNxg8KVrQHNcIkPwgkd7SN
	z33JM0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iGw-0000000HVKy-3bqS;
	Fri, 18 Oct 2024 08:23:46 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1i59-0000000HSLT-2qWw;
	Fri, 18 Oct 2024 08:11:37 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so2959909e87.0;
        Fri, 18 Oct 2024 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729239093; x=1729843893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gob43/+gAdlsPFue9el9gcoewwrv63+OSZMDYy79pec=;
        b=NAeF0jOfM2tcezPzAkVMZZA5lGna79wX5mrN11kIwzJmgX+7KCV+V0pti5hkku5o2i
         jSfrHvGTL/Fcsy+uJ9Pyv2XauyxMnUYLMp0M7yLudC/VqBeS1huBFV4rB6zF0xyoTFf/
         QA2MRhexOEV1x+6yKlcoPYcYivUU7ucNa5ayUq3TGM5QlSaIJBVRTAp+Oom6Xqmgu3HL
         cdk5parZIysYhK5icIOntGmrdJlYk21o1nLPaWvmJ3h7uXv8Tnl/+zv19c1PCGCH0Pi3
         RHtfCOAgs39dJFGv70sEUUF9dExnxonyyXCDDK01EOgTChwPTX2DCLLrQNoWHgSXkFWQ
         fhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729239093; x=1729843893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gob43/+gAdlsPFue9el9gcoewwrv63+OSZMDYy79pec=;
        b=aNZhuvHeV1DFN5g4DVxOqKedk0px6BqFGGU16AZ8Rypkxl6Ha4inJvUT6L3tP41txq
         Hzgx6OSJYpuJMJo9UQbLSgqN75q5e2ulZ4zB6bg3+EUO+tUmcijtEv4DYsUADaIVr1Km
         CWuQR4iIemjzQqF4bPR5/BnE1pf38CK2K4i+6HEqC+niiDTSzWxIF6+zDVoeP6LS6rfh
         TxIV1is81De28pEhHlUPNmGIRlLpCsuoEOYh+bwGG4M5GE92/8oQSU8YpUw4ygcZUIh9
         pYz1aFZ1VPtFPuAww67RrfXh2Y8E0hl7Vx/sbmZ63mHbCJnsTlbQdDG+OOlrCQsuGIod
         pkmg==
X-Forwarded-Encrypted: i=1; AJvYcCXPcDv9VZXr772E4YtT5LtJOspHyLUoVoiKOwI+oynnESLGaGdgHoZsfpFjY3OQR7JGOsYsCwm2owUvaIsRCBU=@lists.infradead.org, AJvYcCXzV+W+6cETffN37Q61nn/34i2lpriYigfenyoXD27gaueGL00UwiiAVxZYMnGVeKwLGJ4hTBMjTZVylg3Mbczi@lists.infradead.org
X-Gm-Message-State: AOJu0YyiPq9GuyZZKwCs/P1Z+YbxgPJxGC8lyj7u43E1NGcVcV2jKwtY
	Or7p2TIcfEpB6ZHkXvyX+ThEysccgYm5o9VtTu3pwFj+qejl5jTip5cm2yZt
X-Google-Smtp-Source: AGHT+IG/FXLUUpVPX3ROT5kd9YPxAoOY00obRdb0wk6QPFIDPBYVog79O1m31Xhkog/xCiQfLs20GQ==
X-Received: by 2002:a05:6512:12d6:b0:539:968a:9196 with SMTP id 2adb3069b0e04-53a154ce943mr1009789e87.48.1729239092911;
        Fri, 18 Oct 2024 01:11:32 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68a8e734sm61129666b.24.2024.10.18.01.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:11:31 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/6] MediaTek MT6735+MT6328 SoC/PMIC pair base support
Date: Fri, 18 Oct 2024 11:10:42 +0300
Message-ID: <20241018081050.23592-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_011135_743989_5019D84D 
X-CRM114-Status: GOOD (  13.20  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision)
can be found here[1].

This series adds base support for the MediaTek MT6735 SoC and MT6328 PMIC pair.
This includes PMIC wrapper support on the SoC side and regulators and keys on
the PMIC side. The PMIC has other blocks such as an audio codec and battery
charger which can be supported in the future.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Yassine Oudjana (6):
  dt-bindings: mediatek: pwrap: Add MT6735 compatible
  dt-bindings: mfd: mediatek: mt6397: Add bindings for MT6328
  soc: mediatek: pwrap: Add support for MT6735 and MT6328 SoC/PMIC pair
  mfd: mt6397: Add initial support for MT6328
  regulator: Add driver for MediaTek MT6328 PMIC regulators
  Input: mtk-pmic-keys - Add support for MT6328

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   2 +
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |   1 +
 drivers/input/keyboard/mtk-pmic-keys.c        |  15 +
 drivers/mfd/mt6397-core.c                     |  32 +
 drivers/mfd/mt6397-irq.c                      |  23 +
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6328-regulator.c          | 479 ++++++++++
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 251 +++++-
 include/linux/mfd/mt6328/core.h               |  53 ++
 include/linux/mfd/mt6328/registers.h          | 822 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h               |  11 +-
 include/linux/regulator/mt6328-regulator.h    |  49 ++
 14 files changed, 1741 insertions(+), 8 deletions(-)
 create mode 100644 drivers/regulator/mt6328-regulator.c
 create mode 100644 include/linux/mfd/mt6328/core.h
 create mode 100644 include/linux/mfd/mt6328/registers.h
 create mode 100644 include/linux/regulator/mt6328-regulator.h

-- 
2.47.0


