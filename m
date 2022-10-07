Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6651BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GoXR88retRSnzKi9SQ+DNP62Xg+ufywzOFm5LdXFhwY=; b=SOL3TH48VJtKRpsIVc+M43qAKe
	EkheFHYfe2pHxBWsHBQuiAyatebDZEhsbzKMIELT5PJtZPDLuN+bMwJFLcQINtY/rMgMwMSWdJfzf
	TqWknejTjh1NjIMrsWTx1vFMCKVDkYaKgv7YvOoJJpbWpFoHIkXCZMl9UxLiLAv8gVWvtBUR5LHjj
	ZdPG/rkmgfVWbf4kuXSOxOIQ68PynqwPPps5xZFTQ9ekRFVUFdyE0JEQK1BPHL7SxTk/3WGZu7xtH
	KrQJ+wFlIYa3ajXURLWjY0ZbeaH0FMgCUxt6sIMxu3W5sqd2TnsvxIIOeInM8HEfefLRopLRvaCvp
	TFbsgZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmx3-00907y-VG; Fri, 07 Oct 2022 12:59:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmx0-00906d-Mz; Fri, 07 Oct 2022 12:59:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id b4so7222979wrs.1;
        Fri, 07 Oct 2022 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GoXR88retRSnzKi9SQ+DNP62Xg+ufywzOFm5LdXFhwY=;
        b=k+mVXH4Gz8yB/q4XKu2MrFh1OKP+bdxk7cyfhuTqgtj+7CONa+B9JcYsVqr/CZr3dT
         vB/XjU8pDovv24Ac2NIOUZQHqAk/oyB3OXn21lTj1wM+a9w3/hPRwArb5CHwATxdfS34
         5feYWg+Ng0RhIHTGYtacIZdFmHn4NFQbDYIbm1koA3XIqqdn23sbfLZN4PEEgLcVipue
         tQXVpvEc6Kgu7tbmQ8/VVEq3xgoVrZSz71AmO7PmfRch8BDmRkGwRCr6v7deBE4Qz/FQ
         HRKmUub9UaKImMeQselqUYejMLKtRlgAlagEPLMpAhjKqosJBNc5kwxzs/DtLjS+f7qk
         lBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoXR88retRSnzKi9SQ+DNP62Xg+ufywzOFm5LdXFhwY=;
        b=E9o0BGU5Yegwcr3TfFuTCjFnMNII2qXvN6ficWafWeEvTO2dwcATDtJJ0cnB+WI8a7
         k5t1qqeYEK55t1IR5vroBTemlpiQmF4m2Llx93I6suw1vX82WxePxvoMov0AgBuzWH8F
         awxEvSZ/kc7Gll/ruoVFkAaR7qUZY7aaBSTFKb3RJrzWFLaKvsrytzJJfEWSHxMYwHn4
         os5qh3aEnFvIYzoB6QQ7jHmQBQDQqh4dhlase07wmAkv8x2QjLkMww+SKyo12juwqXcR
         5qeBSouJes6CdaPw5ZPGLDypjmnxI8rlL8nQKNIspnjVmavL+59u5gpmeabohe//Bop4
         Z48A==
X-Gm-Message-State: ACrzQf32Ah1TuH0shfy5PjddAIxqckReZw4a/vFkuZReYWVHUwBTNgoz
	shuf+Mw8nzWkJW0ELXc4j71J41oJx8blcw==
X-Google-Smtp-Source: AMsMyM6o9uWfQyFqAn0xA1CEOLG02sgWyrjx3yIgDqq8ibYW2qogc2VijL0OLTkJeKDzt5qoWEbBFg==
X-Received: by 2002:adf:e491:0:b0:22e:4483:a8b5 with SMTP id i17-20020adfe491000000b0022e4483a8b5mr3252574wrm.497.1665147573296;
        Fri, 07 Oct 2022 05:59:33 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b00223b8168b15sm2008243wrs.66.2022.10.07.05.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:59:32 -0700 (PDT)
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
Subject: [PATCH v3 00/10] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Date: Fri,  7 Oct 2022 15:58:54 +0300
Message-Id: <20221007125904.55371-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_055938_790882_01497906 
X-CRM114-Status: GOOD (  17.14  )
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

Yassine Oudjana (10):
  arm64: dts: mediatek: mt6779: Remove syscon compatible from pin
    controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve description
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Make gpio-ranges
    optional
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6797
  dt-bindings: pinctrl: mediatek,pinctrl-mt6795: Fix interrupt count
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT
    bindings
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin
    controller
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  254 +-
 .../pinctrl/mediatek,mt6797-pinctrl.yaml      |  176 -
 .../pinctrl/mediatek,pinctrl-mt6795.yaml      |  224 -
 MAINTAINERS                                   |   10 +-
 arch/arm64/boot/dts/mediatek/mt6779.dtsi      |    2 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |   20 +-
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  584 +++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 10 files changed, 4816 insertions(+), 454 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h

-- 
2.38.0


