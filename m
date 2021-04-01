Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C385C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 14:14:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A3C61355
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 14:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A3C61355
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dPpHBeLrg/3ePhVDMXB0Ffl/q76Ohz4OEry38xp1miU=; b=qOTKOHyl/Vu0LQsv0M8Y7IjzYf
	WT1VYSeiR23bodCKZaXvvfosDwu8m11PC59o33+eHx8yW/zTinQ6nkbSeVtVj1zvA+ROp1nYmqNCy
	T0O5NIs0uWi2M4k6QoznOjWhA7X2/Jso9/wf2NzB5ZKAsmxj61ys0sCxE9nKcKqkcCtKMhSs2VXh8
	ukKyC4es0A2Uk/+Q4fGHsnX172oejaoB414JhjLLUErw/RMAm1XRnD7Mjr/3m79U5rsS3EXIFLbiZ
	+K0LHq5mVa6QGl+EKL1ai1jJSs+MC6I8cPTx33K0hIQ27oI3+uF1N9j4nfIJFNSdYvt4y73zzoqli
	jp3ZUcaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRy5j-009o8U-3R; Thu, 01 Apr 2021 14:14:35 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRy5X-009o2P-Tq; Thu, 01 Apr 2021 14:14:26 +0000
Received: by mail-ed1-x535.google.com with SMTP id e7so2116981edu.10;
 Thu, 01 Apr 2021 07:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=2iPiER7+Mw9G4stxjC5v9//X5TggjLttwCChYXF8TQU=;
 b=jSM2vOBJ5p0I5wFDQI/bRmeDf0iK3BaX458RHLIENtVgxKnla4c1YHGcHkeMKo4xMs
 tYNaSRRAIuqAPLfl6c8DXpNZw3AcJ6tGhCHy3GdyqZvlFDfH0ZeEoS4OxFOHxAZrqq/V
 eNxiu/oo7ppLEtGJaDZlHsY+/Wt3p0XhitTxprnPuEM+5RGLQ9oX5iT+bFq1nyklgffK
 2VDoKV+hkVHgj2MckFJ7LXWA2SN65Pv/EbmAIZlRKIpzO+7Xn/hCsS/VC/As1+uH5lYG
 w3e3sVdTbtSbxuQKcub6i+QnplSFrXuXSOxZptO6rM4F8vin5ddjZO1fjqI3VVKY8SjS
 URTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=2iPiER7+Mw9G4stxjC5v9//X5TggjLttwCChYXF8TQU=;
 b=HotjK0mJFLguafpjv31sgNFzn/sH4wa0Su2ulnzDRjmsJip3ty+HUwGd9HGtEdLbcs
 NPjsdILO+e3e0aHvhZjjxflnIA7e3nJA4aCo8qSKnGugCusxCMHemDg8coWFMSEFKc8J
 Ro1uYsgqqhiueRIO7OGT+K+AJwzWcdMVxUg1t0hhHChn1jx1XlItI4i3OuVm4Pf3tDAq
 /1I0yniX9PBJsyYDwdjA13T2HkuM9tA4ZKaSX+KxMN1vP1GDpnqJ1/+msTezkIm1KszS
 TzsyTe+J0YGJqW4VMFUQ0NU3OogoQRfJ72ryD93mU/LKm8321G29MYwcdtEgkkEcXLPN
 bRPQ==
X-Gm-Message-State: AOAM531loiYNk7h8Li3ux8bOoIbTeamIJeiBIpb6rDmCRuMSb/aj4MHo
 4siJSfgHDyHB5ZygMLVXsIQ=
X-Google-Smtp-Source: ABdhPJyudkq44tnD6PFdxEt8sWOEruY+6c9i6HalMBGJleKVpLrfgUXQ8RA395TNZkdfJ40Z4Ctdlg==
X-Received: by 2002:aa7:da46:: with SMTP id w6mr10348146eds.40.1617286462366; 
 Thu, 01 Apr 2021 07:14:22 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id x9sm3629842edv.22.2021.04.01.07.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 07:14:21 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, Nicolas Boichat
 <drinkcat@chromium.org>, Ryan Wu <Yz.Wu@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Michael Kao <michael.kao@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek: changes for v5.13
Message-ID: <d1121630-5778-0955-fac7-f921174defe7@gmail.com>
Date: Thu, 1 Apr 2021 16:14:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_151424_186174_7A249F54 
X-CRM114-Status: GOOD (  16.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Olof and Arnd,

Please have a look at the updates below. As you can see we have quite some
activity on the MT8183 based devices, with a whole bunch of new Chromebook
bindings added this round. Apart from that the a bit older MT8173 still gets
improvement, which is nice to see.

Regards,
Matthias
---

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.12-next-dts64

for you to fetch changes up to a7dceafed43a4a610d340da3703653cca2c50c1d:

  arm64: dts: mediatek: fix reset GPIO level on pumpkin (2021-04-01 11:39:10 +0200)

----------------------------------------------------------------
- add trivial bindings for MT8195
- fix dtbs_check warnings
- add pinmux for build-in Wifi on MT7622 evaluation borad

MT8183:
- fix USB wakeup register
- add regulator for EVB board
- add registers to mailbox consumers
- add thermal zone and trip points for CPU cooling
- Add new boards:
  * ASUS Chromebook Flip CM3
  * ASUS Chromebook Detachable CM3
  * Acer Chromebook Spin 311
  * Lenovo 10e Chromebook Tablet

MT8173:
- fix PHY property in DSI
- fix power-domain for PMIC wrapper

Pumkin:
- add MT8516 based board
- add MT8183 based board
- fix reset pin for MT8167 and MT8516 based boards

----------------------------------------------------------------
Chunfeng Yun (8):
      arm64: dts: mt8183: update wakeup register offset
      arm64: dts: mt8173: fix property typo of 'phys' in dsi node
      arm64: dts: mediatek: mt8173: fix dtbs_check warning
      arm64: dts: mediatek: mt2712: harmonize node names
      arm64: dts: mediatek: mt8516: harmonize node names and compatibles
      arm64: dts: mediatek: mt7622: harmonize node names and compatibles
      arm64: dts: mediatek: mt8183: fix dtbs_check warning
      arm64: dts: mt8173: fix wrong power-domain phandle of pmic

Fabien Parent (4):
      dt-bindings: arm64: dts: mediatek: Add mt8516-pumpkin board
      dt-bindings: arm64: dts: mediatek: Add mt8183-pumpkin board
      arm64: dts: mt8183: add mt8183 pumpkin board
      arm64: dts: mediatek: fix reset GPIO level on pumpkin

Hsin-Yi Wang (9):
      arm64: dts: mediatek: mt8183: evb: Add domain supply for mfg
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-damu
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-juniper
      arm64: dts: mt8183: Add kukui-jacuzzi-damu board
      arm64: dts: mt8183: Add kukui-jacuzzi-juniper board
      arm64: dts: mt8183: Add gce client reg for display subcomponents
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-kakadu
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-kodama
      arm64: dts: mt8183: Add kukui kodama board

Matthias Kaehlcke (1):
      arm64: dts: mt8183: Configure CPU cooling

Nicolas Boichat (1):
      arm64: dts: mt8183: Add kukui kakadu board

Ryan Wu (1):
      dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC

Ryder Lee (1):
      arm64: dts: mt7622: add ePA/eLNA pinmux for built-in WiFi

Seiya Wang (3):
      dt-bindings: timer: Add compatible for Mediatek MT8195
      dt-bindings: serial: Add compatible for Mediatek MT8195
      dt-bindings: arm: Add compatible for Mediatek MT8195

michael.kao (1):
      arm64: dts: mt8183: add thermal zone node

 .../devicetree/bindings/arm/mediatek.yaml          |  36 ++
 .../devicetree/bindings/nvmem/mtk-efuse.txt        |   1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |   1 +
 .../bindings/timer/mediatek,mtk-timer.txt          |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   8 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   8 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |  12 +
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           |   9 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   6 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  15 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |   4 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-damu.dts     |  31 ++
 .../mt8183-kukui-jacuzzi-juniper-sku16.dts         |  13 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi |  27 ++
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 474 +++++++++++++++++++++
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dts      |  13 +
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dtsi     | 378 ++++++++++++++++
 .../dts/mediatek/mt8183-kukui-kodama-sku16.dts     |  21 +
 .../dts/mediatek/mt8183-kukui-kodama-sku272.dts    |  21 +
 .../dts/mediatek/mt8183-kukui-kodama-sku288.dts    |  21 +
 .../dts/mediatek/mt8183-kukui-kodama-sku32.dts     |  21 +
 .../boot/dts/mediatek/mt8183-kukui-kodama.dtsi     | 343 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    | 378 ++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 158 ++++++-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi           |   9 +-
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |   3 +-
 26 files changed, 1982 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
