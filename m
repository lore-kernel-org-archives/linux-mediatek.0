Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AB9C369AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9AOgrKhqWzlPfaierQD2uw1OzuGW6898QT6wOBkGCJE=; b=f5pSIQHvn91jT54kgBV4apbSlR
	Jd+4ubvXu71yw+sWt4npVaVKPo69yB+8H1QSq95Ss1+yCpPYR/7fzWKI/cVibufXnJIGN4HHignao
	vVZ5laBFCNqqoK48A9hnUabiWwNJZpCVrK1S63P5ycJOIlP95zAULu7lFotaSKbXw3mwx+gHH1HUw
	ZswJyL6ui86nRbfC9ovcA8Wvppuy7AzC58hsyjAlNXkh4pLKW7Fj840HJ9ISBFn/MExVzcxpHBino
	9P9t4itnTF6knNaaCnWKuq6X5XBxt2TPVvDfXhnwPAnwol1oAXzIt/nMU5EtG3Kq2qFOERjHXjtc/
	AWeotBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oB4-000000044X9-3yIH;
	Mon, 21 Apr 2025 10:15:02 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9C-00000004449-2HTo
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:07 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b074d908e56so2644160a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230385; x=1745835185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AOgrKhqWzlPfaierQD2uw1OzuGW6898QT6wOBkGCJE=;
        b=i6kgYGGefNyAc8sOGXR4FMZ6Xn6kd0xVsC+5pNs2jgk7oWM8jfkX2ECTeHrtkItHRL
         7qdl/86k98C2pG9x1Exuxo/onwseanISf+tDIqdmwsY39tkAxz9Elz84Xbm1vNyOEItt
         dYUyLogTt4RGXJMUfPEY42WPGd44HG3Pz4/KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230385; x=1745835185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AOgrKhqWzlPfaierQD2uw1OzuGW6898QT6wOBkGCJE=;
        b=smb3sJSWpuUb2NReAZmGHyFYOyH2lZPOBhVduQOQQyt/clq3Hw0ahTi893PisX9m9D
         YFohNPcvI/ix/H9fhm98ap6XV6+1kqZzRJ5XmIZ3Y92kZ6mQgL/Uo34Ur2zo44GH03DQ
         VlaZLg29Y42/Ujnuyk3DUsHE+lHqESioZioloynzA/wXbzuMqfhyK3TY2U/18LfOqErr
         gJJKkgcX/cSs5bn77rI0FGGypiCFg0/PDcxLg/vjqxEJMlPiGiJ2UAh+Qh/1UKeN2kyy
         EwB7KyVryLzW/ViDZ09GZtjSeKQMHEdbLaL4OLIYfB10xrBP7Wf3S1lVfGIk7yTFkNVO
         dB4g==
X-Forwarded-Encrypted: i=1; AJvYcCVhytfzsuj5mUMoiCzYiJGaMKy7GOiAGzamPOjkbqFQYbGtn40RXhDhAUdqjHmPoan8AFgH1PM0adO48jDPWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoqLK4w6Ozszfr3sWnT47D7lTdDAJCme8ppHIBBLHTex28kwB6
	nosxYoZWnsPPyVL2/gJLY/pAQPd83Y//H0xH0LMP+x6dojTnb3zd1fHobQqqoQ==
X-Gm-Gg: ASbGncur5no0UmYMalt7dnJRDePlSeeu/VmHU9nBi353vcxaqRFxRsqy69+PMvVuSHi
	TsYfYr77SN+4uxBPyrAACtyjR9cC+ixgJvz+XPG+JDyTxkoChgbNptO8hX8FEJqJpqLLB+RSKhe
	d4tQQDzeDNKbl75natTzIgOOLWeq8SxpefJEulYWSsj+3/jPzBqfBL6r0drcFQKfxseKQ/acUps
	r6bVKovWVXTmpfM5RsRM4JfxW82+n3YnLdGNBfsgw8ueQn/ISK/RKqye3nH82ZoAdyI2Bp+d8ck
	c3lwUhknaBFPDzvcdXe2OwcCVtdYoKSiBHSlZJxtW9QjjjxvP+ALYO+6yRc=
X-Google-Smtp-Source: AGHT+IGnpHCEjIJrIXmHvs6VqUJ4pvMmeTt+m8C/FSrMMx0dcqiEAz4cygU8b09pUtOZGuXYRXJLmQ==
X-Received: by 2002:a17:903:19ed:b0:224:1c95:451e with SMTP id d9443c01a7336-22c53607dffmr160232245ad.33.1745230385598;
        Mon, 21 Apr 2025 03:13:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 0/8] arm64: mediatek: mt8186-corsola: Consolidate and add new devices
Date: Mon, 21 Apr 2025 18:12:38 +0800
Message-ID: <20250421101248.426929-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031306_611714_0DB54AA8 
X-CRM114-Status: GOOD (  15.83  )
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

This is v2 of my "component probe for Corsola devices" series.

Changes since v1:
- Reworded commit message for Elan I2C-HID binding change
- Dropped I2C address constraint from Elan I2C-HID binding completely
- Dropped enum from new compatible string entry in Elan I2C-HID binding
- Picked up Rob's ack on two binding changes
- Rebased onto next-20250417, resolving conflicts with "spherion
  component prober" changes
- Link to v1:
  https://lore.kernel.org/all/20250312104344.3084425-1-wenst@chromium.org/

Here's a follow up series of the I2C component probers for Chromebooks.
This series enables the component prober for the Corsola series of
devices, combines the two existing Voltorb SKUs, and adds a new
device, codename Squirtle.

Patch 1 adds a new HID-over-I2C touchscreen from Elan.

Patch 2 merges the Voltorb entries in the device tree bindings into one.

Patch 3 adds a new entry for the Squirtle device to the bindings.

Patch 4 fixes up the existing device trees for the component prober to
be active.

Patch 5 merges the device trees for the Voltorb device.

Patch 6 adds a device tree file for the Squirtle device, with I2C
components ready to be probed by the prober.

Patch 7 enables the prober to probe trackpads on some devices in the
Corsola family.

Patch 8 enables the prober to probe touchscreens on Squirtle.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (8):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
  dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
  dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
  arm64: dts: mediatek: mt8186-steelix: Mark second source components
    for probing
  arm64: dts: mediatek: mt8186: Merge Voltorb device trees
  arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
  platform/chrome: of_hw_prober: Support trackpad probing on Corsola
    family
  platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle

 .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
 .../bindings/input/elan,ekth6915.yaml         |  12 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
 .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
 ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
 .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
 11 files changed, 167 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

-- 
2.49.0.805.g082f7c87e0-goog


