Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C70CDB474
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 23:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fujGqJo8d5KpjN+xClqT+zqDBhYovL+8QaLrTy0NKbw=; b=bijQceT1BSM/VFDiTXrqc3XiBO
	/d8pHcVdWz/HrzyK1EorNAqxmcp0prIVHYFr4KHtGjOKrL6oJRrVz+HJr5CzIxze6O2gO2uk5I9Or
	wGUCHo2jKyNE99pRu3RGzC9RemdMa8+XWk6+7ogVdGfRuRWJ/HEgIVBCgc2Lm8cbyDCNFyqj2C6O9
	qhYwFwES+Sd+DQwA+57lF3E8bRnmLAGLqXuUgLQ3zsG7XAMVGglV7snfcgnpyaP0WKa/D7wFVyDq0
	nDClgDL9q0M6l7nsH/3NUneyRCH2OxOHOYpTgVp73GFlxc5KdAlUUo0GkCj5+NDWGuLdMXWiDmMi+
	HglkihqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4hn-0022mF-0g;
	Thu, 12 Oct 2023 23:02:59 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4hj-0022jC-37
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 23:02:57 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c88b467ef8so12670355ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697151769; x=1697756569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fujGqJo8d5KpjN+xClqT+zqDBhYovL+8QaLrTy0NKbw=;
        b=HRqsc7Z6m4cpoTY0rUU8PWc9V5rNLWll0xIf9cuCZ7x9ZwmARlrRO+c0QW4T8DqGx/
         7ARVc1N0RgDt5oxjR7LQHqjgOr5lTGDO7BSSZkZM0V5Sfa2jC2Fj8U5r/ZTKDtAre/X6
         nzGgSpz2oH9Sx1Ep0+tbuknllBG68N92WmjI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697151769; x=1697756569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fujGqJo8d5KpjN+xClqT+zqDBhYovL+8QaLrTy0NKbw=;
        b=stDA2HaTJHPUF2cLNWb5TOTNst1rq9UbzW18Liq3Q8X7pqHHbGsbzMhZ28iiPXs7Sr
         lkrImHy9isg6kOh1huW4JO635b3IRVBBdq57a9cUt/Ocd5Mev0J0zYH262nN073ihPoG
         qz9kb799W8xDWOVdC3WzCLmwLbkbjZ2duIQ9FDe2+vL09Iy71ZSokcxZhyTe57R8dSXf
         0PquszP6pCb1N3AlltWnQsoP9zONvL9RJi5bhAyPTjLnnf2TbMV+WyxAZMnfnPhKeH+h
         6GQFOY46gaINHCFTMDTshBNEGy0xVfZQFpUY3UET0PWQUYtAUNR7fBT3GSUDLmT1Wb/Y
         PF0g==
X-Gm-Message-State: AOJu0Yzj5cWTpGvr9mKKME7LkHEPv6Rz0S2WFH+ayfJM9HdiK1YPKfHY
	BxbE/D97ZOLdCuWZLgKvKlwUYA==
X-Google-Smtp-Source: AGHT+IGOx7c4BoiqaOrWcZL7VPY0mklJe7+GjZVJP6qldhsyBTfupZnml0azshrUG3DdBgLRiJav8Q==
X-Received: by 2002:a17:902:f54c:b0:1c7:2476:c977 with SMTP id h12-20020a170902f54c00b001c72476c977mr27645759plf.33.1697151769484;
        Thu, 12 Oct 2023 16:02:49 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7397:2561:ed13:bac8])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001c613091aeasm2494390plt.297.2023.10.12.16.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 16:02:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] arm64: dts: mediatek: Add MT8186 Corsola Chromebooks
Date: Fri, 13 Oct 2023 07:02:26 +0800
Message-ID: <20231012230237.2676469-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_160256_007195_A41C8094 
X-CRM114-Status: GOOD (  16.43  )
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

This series adds device trees for the various MT8186 Chromebooks that
were initially released. These are the Tentacruel / Tentacool devices
released by ASUS, and the Steelix / Rusty / Magneton devices released
by Lenovo. The device trees are taken from the downstream ChromeOS v5.15
kernel, ported to mainline and cleaned up.

Corsola is the Google codename given to the MT8186 platform. This
platform has two reference designs, Krabby and Kingler. Kingler was not
used in any actual product, and is therefor not included. Steelix is
an alternative design put forward and is effectively a mix-and-match of
the two reference designs.

Most of the core design is shared between the variants. The differences
are on which external components, such as the display bridges, are used.

Patch 1 cleans up the current list of MediaTek boards. The entries are
reordered by SoC model first, then by board name.

Patch 2 through 5 add DT binding entries for the Tentacruel/Tentacool,
Steelix, Rusty, and Magneton Chromebooks.

Patch 6 through 9 add board device tree files for these devices. Patch 6
also adds the corsola dtsi file for the commonalities between the designs,
as well as a dtsi file for the krabby reference design.

Currently external display support is missing. Audio is not working, as
enabling the audio DSP causes my test systems to hang.

Please have a look and test if possible.


Regards
ChenYu

Chen-Yu Tsai (9):
  dt-bindings: arm: mediatek: Sort entries by SoC then board compatibles
  dt-bindings: arm: mediatek: Add MT8186 Tentacruel / Tentacool
    Chromebooks
  dt-bindings: arm: mediatek: Add MT8186 Steelix Chromebook
  dt-bindings: arm: mediatek: Add MT8186 Rusty Chromebook
  dt-bindings: arm: mediatek: Add MT8186 Magneton Chromebooks
  arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel /
    Tentacool
  arm64: dts: mediatek: Introduce MT8186 Steelix
  arm64: dts: mediatek: Add MT8186 Steelix platform based Rusty
  arm64: dts: mediatek: Add MT8186 Magneton Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     |  180 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   10 +
 .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  130 ++
 .../mt8186-corsola-magneton-sku393216.dts     |   38 +
 .../mt8186-corsola-magneton-sku393217.dts     |   38 +
 .../mt8186-corsola-magneton-sku393218.dts     |   21 +
 .../mt8186-corsola-rusty-sku196608.dts        |   21 +
 .../mt8186-corsola-steelix-sku131072.dts      |   18 +
 .../mt8186-corsola-steelix-sku131073.dts      |   18 +
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |  197 ++
 .../mt8186-corsola-tentacool-sku327681.dts    |   49 +
 .../mt8186-corsola-tentacool-sku327683.dts    |   26 +
 .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   28 +
 .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1704 +++++++++++++++++
 15 files changed, 2461 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi

-- 
2.42.0.655.g421f12c284-goog


