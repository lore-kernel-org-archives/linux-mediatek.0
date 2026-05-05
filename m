Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E86FF885A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ytUABekc5RrdYiXa04ZEShkxwLJERJBYHoA0rFWO/Y=; b=Ng/KwYM2n24S9BrujEXmYjGcEm
	USbn1v6hkqrfVXl5Lr8a8DyWBINTc2kFgv25Em4NY2cemlJCzIRUUyvC6sJG/0jFYHWLxtnn7/oU+
	ZOOyJtL160NcKre9TMqss9TE6ZXcLDR6kQZF1BFabRha6Oia8OEiFpJp/VhnMoNLtiU+Xe7g4DHA8
	6Tm+gwdGjCrOjebNlc94J8QvWGzH/OU2b1GZiAxc9sm7Tec2KUoRn2UuOsHcWMUicPpF52XFYI56l
	ZJPAkv1ai3cNWSKBVtDQHKLXT0tbAMVrmxndK7yztLyX7gIYHA0B83cEFNPTfHL2UDB74W55yc0IP
	kSoSRE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnL-0000000FqiJ-1NO8;
	Tue, 05 May 2026 10:14:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnJ-0000000Fqfs-1jBD
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/ytUABekc5RrdYiXa04ZEShkxwLJERJBYHoA0rFWO/Y=; b=Qc1bUdCceodUeISsMj9B2jPO4G
	OKLFE4FTMlgd3mQYpm5wBwW3o/cmK4SRUnPWKzH3OkwediK96qwiFmuTgP9f6n62ZlzOlYre0z85d
	BhxpcdazGLHA7r6i96RXZlMBtljALMQkwDFIodwHA6roXYY31RxxzirYn6hNHm+o0mBxeAjoxyHLU
	7KY3p1Q9y7zNnxZvQwzuYwvU8p73VXzhPT+ry5fGLLveSgWF3xBKZjxW2q6/nwTkkRdmo0LqF2UiK
	3+TDOnyM1tL8jCYToUIEAxF/IHkxXkDwCGymnejLcjzw3pz5QlrJL6CGP1R7LLY/Utio5r3Q/MTTK
	pzG8JLVA==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnF-0000000D9UP-4B7Y
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:24 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-837b39eb078so1321623b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976058; x=1778580858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ytUABekc5RrdYiXa04ZEShkxwLJERJBYHoA0rFWO/Y=;
        b=E6ErJeQvXTXzy4m8ugPqNbyW8WatYuVKFqE/BYDp59c75fusMfQfF5KJFu8/JHc6Ig
         Ob0GDsUzbcH02kq1W1AEz35pqwV5PzbgSezQbQ20UITR17T5GNUkXzXcWCRn2U4H+HtV
         p4VKz06SHDy6kPJnM3RsU+VAnxBQmWVec/mSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976058; x=1778580858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ytUABekc5RrdYiXa04ZEShkxwLJERJBYHoA0rFWO/Y=;
        b=DUa2wn1NpfEFiug416zxltp6daQOfCFb+Pko1xEWLrrXh0IJV+WxGkOTGIvZfL+Yx4
         MJuBHnpqG01unMGD6rIRyiElmy7Qo6prVM1vCMsCkSfNScCf9m2n63XFaT4WNXypOGHW
         ewJS0zHjdWAF1KcAiFW35uwqa+chCr6LbVc1qTmDm5YdRpfb6JZij9ZsXltsl+Zvm3eG
         NqR7+IM7uBzOS7DTHG8eobnTuM8FBjGM6uvX4Dz0FbVzBDRuv2hURZ+5H0BONEqHr1qp
         vMQvL4GKahdEOgsLcrPiIuIWLPd+B5S1fY01Kug09RrZgIwzp0q7lnNGmwvIwQnmsu8p
         yOBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jUrK83JAXbVDrSojnHb21qD+O2YViGR+VjfiL4QViH2OPoiMQ00XAF1xCAUNFZQ2XwrTeDRIkTMW8xEhDFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6oZbDUoKEzioYgl3bAzTxiMhHeY7qLnC62LuhdEGmywSxEyGP
	rfIetqcTRdylHuLnNFrR+Yz1Wu3jL1+7+aqic3f7H97djnoujHB4IAczCWM2K0KOuA==
X-Gm-Gg: AeBDiesJwJHPhmLNp+fU83VMvHckf3r8Gzjgh0r+qYI5r+k+dSwBis3q+Kp05awBlhW
	ECQH7CR8iuTLNnr/ZnK38c1uYSK5yuXwWGEwZ8I5eppC0jsIwK2NKjVgPga4zZkqclOHXD6yW37
	zj44Scy3o/nzcz3c+4dRTiGXmi84ek9feoOsZQDG28gvJjg6i4+YuyxvEp0MNuod1NuOQEH9FmE
	verUIzRrl4N+xW0C7+bQzdTsNnWdlA9xNEFxtWq/DyL85QPdB3if3/JYbTzTzKDjtb3/9NGyPU6
	9HFENVR4lGaW0FJWMNNhy0CC2lAKIQkx0ayEqzkuemT2w/wGXsFA0KrGVuhGJTsSoE0OyVloWBP
	svUCHmPLopH/i5430pRKHeJ6tIpgh5qSiLSax8Jqwa34MSLG4HqEEHYLYQoEyckv02uZJmatfDq
	LBEfW+j9s2qMqi4FFPzRLUwEA3KbknkpTtOWC78+DbIpN7NAydZT15kae9mMzsMTzkde+SZ/s2t
	6MEBC7EJEZCA4RIsyA=
X-Received: by 2002:a05:6a00:4b10:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-83923e9857cmr2413115b3a.29.1777976058038;
        Tue, 05 May 2026 03:14:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/16] arm64: dts: mediatek: Regulator cleanup for Chromebooks
Date: Tue,  5 May 2026 18:13:50 +0800
Message-ID: <20260505101408.1796563-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111422_241132_51AF46E2 
X-CRM114-Status: GOOD (  14.30  )
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

Hi,

This is v2 of my MediaTek Chromebook regulator cleanup series.

Changes since v1:
- Switch to properly named vcn33_[12] regulator nodes for MT6359, and
  converted existing users
- Moved PMIC regulator supply properties to PMIC top-level node
- Dropped "mt6359: Add label for regulator sub-node"
- Added all supplies for MT6315, even for unused regulator outputs
- Added missing peripheral supplies on MT8195 Cherry
- Added missing supplies for ChromeOS EC regulators on MT8195 Cherry
- Fixed pp_4200_g regulator name
- Link to v1: 
  https://lore.kernel.org/all/20260320084351.2461060-1-wenst@chromium.org/

This series contains the device tree bits for the collection of regulator
related cleanups for MediaTek Chromebooks. The device tree binding and
driver changes are:

MT6315
- https://lore.kernel.org/all/20260324053030.4077453-1-wenst@chromium.org/
  (merged)
MT6359
- https://lore.kernel.org/all/20260429074113.3720271-1-wenst@chromium.org/
cros-ec-regulator
- https://lore.kernel.org/all/20260320083135.2455444-1-wenst@chromium.org/
  (merged)

The goal is to complete the regulator tree so that there are no orphan
regulators, and there are no devices that are missing supplies.

Patch 1, 4 and 10 add supplies for the MT6315 PMIC in various Chromebook
designs.

Patch 2 converts the vcn33_[12]_(wifi|bt) regulator nodes to vcn33_[12].

Patch 3, 9, and 15 add supplies for the MT6359 PMIC in various
Chromebook designs.

Patch 5 and 11 add supplies for the ChromeOS EC controlled regulators.

Patch 6 and 16 add power supplies for the CPU cores.

Patch 7 and 13 add power supplies for the SPI NOR flash chips.

Patch 8 and 12 fix up load switch descriptions.

Patch 14 adds missing supplies for the USB controllers on the Cherry
design.

Obviously the 3 dependency series need to be merged before this series,
or we will get a bunch of new DT validation errors.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (16):
  arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt6359: Switch to proper ldo_vcn33_[12]
    regulators
  arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC
    regulators
  arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
  arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
  arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
  arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt8195-cherry: Add supplies for ChromeOS EC
    regulators
  arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
  arm64: dts: mediatek: mt8195-cherry: Add supply for SPI NOR flash
  arm64: dts: mediatek: mt8195-cherry: Add vusb33 supplies for XHCI
    controllers
  arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8188-geralt: Add little core CPU power
    supplies

 arch/arm64/boot/dts/mediatek/mt6359.dtsi      | 22 +-----
 .../dts/mediatek/mt8186-corsola-voltorb.dtsi  |  4 +
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 41 ++++++++++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 74 ++++++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 50 +++++++++++--
 .../dts/mediatek/mt8390-genio-common.dtsi     |  4 +-
 .../dts/mediatek/mt8390-grinn-genio-som.dtsi  |  2 +-
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  6 +-
 .../dts/mediatek/mt8395-genio-common.dtsi     |  6 +-
 .../mt8395-radxa-nio-12l-8-hd-panel.dtso      |  4 +-
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  2 +-
 11 files changed, 178 insertions(+), 37 deletions(-)

-- 
2.54.0.545.g6539524ca2-goog


