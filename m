Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0895CC38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TN/VbXkwesW+Q2JTh4RoodpYQJLem7tSs3AFkQpa144=; b=1TlHToYiQTXny1ZyvwND93QfcE
	X1sJeW3uV04YfPU4on7p5t/3ZJoi2xPZCfpmuHjXzYgzeeG5i+TI8IBfPX9a5LODdoh9EX0nJiq1R
	WAM7o41uixhaG+jCxN65vnz8WFq6972UHDg5tg7CQuqbXNUFaf+NgCmQt8KnV1Azw8bIqFulMHG1s
	K7h1RLFjvEzrnpm7E1hjgwsMvvsuwrcjvK7yx96dB//HQ1kZSRxSvcNPHt59oYcmN5LUeg+oGw8CW
	O2LwgfTIW7QFENFq+AzMmDehnqtQrh+dVkV7xLMMyMAbo8m8ZjbEigGtFaxWP6dJv21K+O/mohRKG
	s36hdGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRQI-000YyP-Sw; Fri, 28 Oct 2022 15:37:30 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROQ-000Y6o-96; Fri, 28 Oct 2022 15:35:38 +0000
Received: by mail-lj1-x22d.google.com with SMTP id bn35so8826927ljb.5;
        Fri, 28 Oct 2022 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TN/VbXkwesW+Q2JTh4RoodpYQJLem7tSs3AFkQpa144=;
        b=kre6+kf+Bfs2qZUPhSAd3Orphb5tJDtPWCQs7IW7o0k7QKaJHNh3dXK7sVCrKuvZt2
         4gU9tYsY0IUBR21bmS/fW3cDyv/vVgglaz15/PV1rNO0ewW5i+AR1BcFUpas0WxM1lgm
         FdTMJ62fZtfZMc3LEBiXd86u+3yVpfTUQ++whI0WoehTLg397n1PKUcOlEazbmWvPh1h
         PIlaiABXqdROm1QRpvDPYtbBHAt1wIGxiErIOQKwz/Y9PQsw9fx+MbQ8Ixoz6tQlb48h
         isINRJN8PKhbTtuNvLIT12WfZ0F+rHXZidCvnp4eEZvtB452EWiYAN+ZEhOGW/JPvmlm
         F6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TN/VbXkwesW+Q2JTh4RoodpYQJLem7tSs3AFkQpa144=;
        b=YEEpJS+nsxdxooKDQWHXZtfMUgv8AlQ5UiYrTZOyZD57gmcyfHhRwMsWKzWLJit6pi
         COXCkrKF5lqtfa5sDBM3mz0bLzb+TTZ6Cx3K7DvCUEAOjffLgNfCbbpKo/Y6qqQMG1XS
         Qtb7leYaf+D8wNDrQ0tkjKy+q9lAp8kJce9tg0VmT1h5XWkr8hHgzawzI2faTkILB7eG
         /aPbv6O4Lb+sSigU3QwuKsjDG7eaFbUOMVJ/dKJYH1wu52Gy1KltZ0HASvIop6Oh/qjN
         N9ykLTXYTZX7pX+I8d29KhCn1an4HkbejFFLGkVNpcof4mRhM/JhJn5YXzxMj4M/F/7X
         SmUQ==
X-Gm-Message-State: ACrzQf1MWyk77NZMt5VKafh0o4nrwy1CJB7T7ZxbkMM1H4HceXc+Dan+
	SdY0AfCGOwf2mePAin81d6dtMbu3W8vVrQ==
X-Google-Smtp-Source: AMsMyM5PWMxFH7MgYaEUwVRyrioiTpyeD9ckYu4KzmwlSXUjziO6cc6F60LXGf+PwDYY9S6Q/icsPQ==
X-Received: by 2002:a05:6402:5107:b0:462:3014:3d73 with SMTP id m7-20020a056402510700b0046230143d73mr17041907edd.177.1666971320853;
        Fri, 28 Oct 2022 08:35:20 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:20 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/13] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Date: Fri, 28 Oct 2022 18:34:52 +0300
Message-Id: <20221028153505.23741-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083534_433195_7D085F9E 
X-CRM114-Status: GOOD (  17.80  )
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

This series adds a driver for the pin controller found on the MediaTek MT6735
and MT6735M SoCs. The two differ in the last 6 physical pins, which are used
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist on it
to begin with). In preparation to document DT bindings for this pin controller,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration node
names. Necessary cleanup is done along the way.

Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.
 
Changes since v2:
 - Add interrupt descriptions.
 - Change interrupts property item limits.
 - Move pinmux examples from node description to example dts.
 - Properly add myself as maintainer for MT6735 pinctrl driver and DT bindings
   document.
 - Remove tabs from a few defines in pinctrl-mt6735.c.

Changes since v1:
 - Combine other documents into existing mediatek,mt6779-pinctrl.yaml
   instead of creating a new document with wild card in its name.
 - Split first patch into smaller patches focused on specific changes.
 - Remove syscon compatible from MT6779 DT to avoid a check error.
 - Fix interrupt count for MT6795.

Yassine Oudjana (13):
  arm64: dts: mediatek: mt6779: Remove syscon compatible from pin
    controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve description
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Make gpio-ranges
    optional
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6797
  dt-bindings: pinctrl: mediatek,pinctrl-mt6795: Fix interrupt count
  dt-bindings: pinctrl: mediatek,pinctrl-mt6795: Improve interrupts
    description
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node
    changes from MT6795 document
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode
    and property descriptions
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT
    bindings
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin
    controller
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  308 +-
 .../pinctrl/mediatek,mt6797-pinctrl.yaml      |  176 -
 .../pinctrl/mediatek,pinctrl-mt6795.yaml      |  224 -
 MAINTAINERS                                   |   10 +-
 arch/arm64/boot/dts/mediatek/mt6779.dtsi      |    2 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |   20 +-
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  584 +++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 10 files changed, 4866 insertions(+), 458 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h

-- 
2.38.1


