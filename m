Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C272C7EE30
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZYzYl65lrl4NIak+68JmKnOBYHqlW8O3mwHR68tLLkw=; b=juCX2LZB2UOxrk
	egLQOjyS/VD0tJf1zDry1NmHKb8KReXHtn7KtWvuzJXIxOWu4jykDEFDNLQM2B6nYtGmcLY80yzJ9
	V7Znx+E1M5chN1JuMXK+GFXyTy1fVeKs7xfCQZfJeG9digrF+Wqr2NFsSc2zjZIs8qckBKBkfst1i
	T0Jg9OPmMHOodhlnr/OJtMhcE/9dtp4Ahmp2yo1Hp0MIvM7+8acOztu6ZyKgPDDKjfMltZTYt2+6/
	iA7UQwyPWIJA5qB/BUvXPq+zqZnMQqueGJfSJybe3j7lRZjqL+tPUpijLvRCzoCOz6m7jIL8x3InH
	VTn5IDqj2hOeE9HPqJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJ6-003qfP-QY; Fri, 03 Mar 2023 00:29:56 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJ3-003qe5-Kw; Fri, 03 Mar 2023 00:29:55 +0000
Received: by mail-lj1-x22b.google.com with SMTP id g18so771809ljl.3;
        Thu, 02 Mar 2023 16:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYzYl65lrl4NIak+68JmKnOBYHqlW8O3mwHR68tLLkw=;
        b=JfUrCkNOnBcbDT2s9JlFztH5eY16LbVYb4C4xlE3tDBEaRi1JVwxRjJW6XAU5eouio
         DcX/lkRwKBMgu3gN0nnPo9Z8DHNteKZP9MGznEXoq6tXdWAnWJLlRsLhGnL95kCD1IAQ
         1TcP2EbyNyugC48p2leCDlnW7XQXwdqxvCjyqfYkd/oS5wePLrNAuzolUUSzmbq87BF1
         R73MWB7pdv+kB3gy5HSSQQbHZgqvAMp3bNAyab/HI7s0kMa6ow0VRYv7xgnV9kcuPfbZ
         ZCtm+/UfIQZnX22E1R+AFe/g14uKLHxS7705jZWtq6ZbwzjAnQT3Yis7dmLqFveX7LU2
         bfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYzYl65lrl4NIak+68JmKnOBYHqlW8O3mwHR68tLLkw=;
        b=xrvKGU0fzVaIMZd96e6GmUObZyV1Ql2nahfKR8ICBJhVQTo/ZPFD+iYPcDGCoKFK8x
         CMiTPIieA9X7Jpx7ffqYZxC4x+xbmBTz20FrxblcYeorKgec1pDj8nD8vvyghtg81+7r
         gy1nyE2WDlS85abt45Lz8ALBS0SAmivSkNC9/YyOHki12rAjFWmTojqrcii9Hgn7dQcZ
         mZDggL9+6V4Gdd0gAQTCk66tmsqItHg/7ZxoV106ivMOg++sMPB0SHUFmJo5QJI8f6Oe
         jkK/bLCTzh29MLCFo7Xp/g4rK/9Y5azK49w2ukA4P5h5CftsFhII18vawUIY4/t9Hzrr
         erhw==
X-Gm-Message-State: AO0yUKX+ipYYkbBXJNnJfD+kh8YMlNhfg/Vwf7TxVUUgqbcAAqdDOCRN
	I8obUt/ibSirfEPFH6+jkPU=
X-Google-Smtp-Source: AK7set+pFQzgv0tmjuSOt+nwG3CWBIaTBdJ79tRgzbqGyFk7pkKXomLzTWSeIdFDPbHTOMiURlC0zQ==
X-Received: by 2002:a2e:9111:0:b0:295:a2d0:57ed with SMTP id m17-20020a2e9111000000b00295a2d057edmr4067558ljg.4.1677803390200;
        Thu, 02 Mar 2023 16:29:50 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:29:49 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to mediatek, improve dt-bindings
Date: Fri,  3 Mar 2023 03:28:29 +0300
Message-Id: <20230303002850.51858-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_162953_745806_FF5DA39B 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to mediatek, improve dt-bindings

This is an ambitious effort I've been wanting to do for months.

Straight off the bat, I'm fixing the ABI that I broke a while back, by
reintroducing the ralink,rt2880-pinmux compatible string.

If you take a look at the schema for mt7620 and rt305x, some functions got
multiple lists for groups. Like refclk on mt7620. Because mt7620 and
mt7628/mt7688 SoCs use the same compatible string, it's impossible to
differentiate on the binding which SoC a devicetree is actually for.
Therefore, the binding will allow all groups listed for that function. For
example, if the SoC is mt7620, only the refclk function for the mdio group
can be used. If one were to put "spi cs1" as the function there, there
wouldn't be a warning.

I address this by introducing new compatible strings for these SoCs, then
split the schemas. I also separate mt7628/mt7688 from mt7620 pinctrl
subdriver in the process.

I wanted to split the rt305x driver too but too much code would be reused
so I backed down from that.

This platform from Ralink was acquired by MediaTek in 2011. Then, MediaTek
introduced new SoCs which utilise this platform. We're moving the Ralink
pinctrl driver to MediaTek, and rename the schemas for MediaTek SoCs to
mediatek.

I've renamed the ralink core driver to mtmips. I decided to call the core
mtmips as I've seen folks from MediaTek use the same name when they added
support for MT7621 pinctrl on U-Boot. Feel free to comment on this.

Arınç

RFC to v1:
- Address Rob and Krzysztof's reviews, add Rob's acked-by.
- More cleanups, hooray!
- Keep ralink,rt2880-pinmux deprecated.
- Deprecate ralink,mt7620-pinctrl. Another one bites the dust!
- More slight changes I can't currently remember to mention.

Arınç ÜNAL (20):
  pinctrl: ralink: reintroduce ralink,rt2880-pinmux compatible string
  pinctrl: ralink: {mt7620,mt7621}: add new mediatek compatible strings
  pinctrl: ralink: rt305x: add new compatible string for every SoC
  pinctrl: ralink: mt7620: split out to mt76x8
  pinctrl: ralink: move to mediatek as mtmips
  pinctrl: mediatek: remove OF_GPIO as reverse dependency
  dt-bindings: pinctrl: ralink: improve bindings
  dt-bindings: pinctrl: ralink: add new compatible strings
  dt-bindings: pinctrl: ralink: {mt7620,mt7621}: rename to mediatek
  dt-bindings: pinctrl: mediatek: mt6795: rename to mediatek,mt6795-pinctrl
  dt-bindings: pinctrl: mediatek: mt8186: rename to mediatek,mt8186-pinctrl
  dt-bindings: pinctrl: mediatek: mt8192: rename to mediatek,mt8192-pinctrl
  dt-bindings: pinctrl: mediatek: mt8195: rename to mediatek,mt8195-pinctrl
  dt-bindings: pinctrl: mediatek: fix naming inconsistency
  dt-bindings: pinctrl: {mediatek,ralink}: fix formatting
  dt-bindings: pinctrl: mediatek: drop quotes from referred schemas
  dt-bindings: pinctrl: mediatek: mt7986: fix patternProperties regex
  dt-bindings: pinctrl: ralink: rt305x: split binding
  dt-bindings: pinctrl: mediatek: mt7620: split binding
  MAINTAINERS: move ralink pinctrl to mediatek mips pinctrl

 .../pinctrl/mediatek,mt65xx-pinctrl.yaml        |  28 +-
 .../pinctrl/mediatek,mt6779-pinctrl.yaml        |  37 +-
 ...mt6795.yaml => mediatek,mt6795-pinctrl.yaml} |  39 +-
 .../pinctrl/mediatek,mt7620-pinctrl.yaml        | 298 ++++++++++++++
 ...inctrl.yaml => mediatek,mt7621-pinctrl.yaml} |  23 +-
 .../pinctrl/mediatek,mt7622-pinctrl.yaml        |  32 +-
 ...inctrl.yaml => mediatek,mt76x8-pinctrl.yaml} | 252 ++----------
 .../pinctrl/mediatek,mt7981-pinctrl.yaml        |  35 +-
 .../pinctrl/mediatek,mt7986-pinctrl.yaml        |  72 ++--
 .../pinctrl/mediatek,mt8183-pinctrl.yaml        |  30 +-
 ...mt8186.yaml => mediatek,mt8186-pinctrl.yaml} |  51 ++-
 .../pinctrl/mediatek,mt8188-pinctrl.yaml        |  76 ++--
 ...mt8192.yaml => mediatek,mt8192-pinctrl.yaml} |  53 +--
 ...mt8195.yaml => mediatek,mt8195-pinctrl.yaml} |  44 +--
 .../pinctrl/mediatek,mt8365-pinctrl.yaml        |  28 +-
 .../bindings/pinctrl/ralink,rt2880-pinctrl.yaml |  11 +-
 .../bindings/pinctrl/ralink,rt305x-pinctrl.yaml |  89 +----
 .../bindings/pinctrl/ralink,rt3352-pinctrl.yaml | 243 ++++++++++++
 .../bindings/pinctrl/ralink,rt3883-pinctrl.yaml |  11 +-
 .../bindings/pinctrl/ralink,rt5350-pinctrl.yaml | 206 ++++++++++
 MAINTAINERS                                     |  29 +-
 drivers/pinctrl/Kconfig                         |   1 -
 drivers/pinctrl/Makefile                        |   1 -
 drivers/pinctrl/mediatek/Kconfig                |  54 ++-
 drivers/pinctrl/mediatek/Makefile               |  63 +--
 drivers/pinctrl/mediatek/pinctrl-mt7620.c       | 138 +++++++
 .../{ralink => mediatek}/pinctrl-mt7621.c       |  32 +-
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c       | 283 ++++++++++++++
 .../pinctrl-mtmips.c}                           |  90 ++---
 .../pinctrl-mtmips.h}                           |  16 +-
 .../{ralink => mediatek}/pinctrl-rt2880.c       |  21 +-
 .../{ralink => mediatek}/pinctrl-rt305x.c       |  47 +--
 .../{ralink => mediatek}/pinctrl-rt3883.c       |  29 +-
 drivers/pinctrl/ralink/Kconfig                  |  35 --
 drivers/pinctrl/ralink/Makefile                 |   8 -
 drivers/pinctrl/ralink/pinctrl-mt7620.c         | 391 -------------------
 36 files changed, 1723 insertions(+), 1173 deletions(-)



