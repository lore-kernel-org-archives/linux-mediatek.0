Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DF3CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4++QhAQg+/03UfB843ypMKyW5Q/oDjHNpsI6P/rHtMI=; b=LEimOg1actiEOuOLMC4aWdWd3T
	4vSU28YZpIIwDgzBap+IF+TQ7jpnWUUt0+ZrR+GPEsc0GhUphh8lwxDQg59z9fM9D9ZuXGu5eUvMc
	bgtB7yZI1joPmjs2Qu+mLpu/ABVcHtrBNZx0cYoU3RAOZj9DyLcdiC1vxuJUx2+DCbsFghoaVrjHS
	vcneRgILqqIpwAD69wgpIGJUQPrcF6bwcPlQIFjroM5v89pxNL+ouqMxZjUP+RZ5lS+G9Tu54gndi
	H0ATHEFbtyjwpKcVs/pafyPACpTpL+PfGkppR/8KM5EhdBmUA29BvYycZMVnQpiI3HegAuQ2wJFE1
	okVAaALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtREa-00HAPe-1s;
	Thu, 19 Oct 2023 11:30:36 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtREX-00HAOG-1G;
	Thu, 19 Oct 2023 11:30:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9becde9ea7bso148602366b.0;
        Thu, 19 Oct 2023 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697715028; x=1698319828; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4++QhAQg+/03UfB843ypMKyW5Q/oDjHNpsI6P/rHtMI=;
        b=e1AkG2+FyOdKBpw7bN7HWZeTWEWtlp2gdWbUb0SvG9Yr5qGS6hvjD7lGhU+sJG35g4
         WvCmaohqQe5KQyJSfxNZFhaDYEwZ9W4p275jg0DOFSn0yMPKpN0HLW7eJHXPRDnGHU5Q
         SQmbLm94QjLTWL3NhALvpPDGztBq0+jvwI8KLmGqYm7cLaSAJDqhcTcCpaqwZBoeOjq8
         te4YYpVAkjDt4/qXcqvCDdDyEgs1UuVFg1INTlmjt7UuOUcqRBSErsUFwpSXfqVpLlhj
         UPCrAgKVTobIV78jYNfKi50OHaor13ZiZU9kqOGjflnJ/3At4egKvAicEKAaID9RuHsu
         tX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697715028; x=1698319828;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4++QhAQg+/03UfB843ypMKyW5Q/oDjHNpsI6P/rHtMI=;
        b=qSAb9gCbo4doCDx9q7NCdGSSetVuLdU4JUQsHzwIKScIEz5E5DaaMhMFxDHVWsZvuV
         2xVF3NerYQqSD4GsVMIyYZwyy2m3PQrmcqb7WQSsvjwjpsnsOfkoSvmtt3xlSYlteoPa
         qpHecyFE/IN/ZXh9YtzBZ4ktqfEIZVDxakXJbuirATaEJc1aDUFEM/u2NnHzJrSxhTZt
         iXFTWX32ylPHieJMXcCg92om6nJz8V3xhB5PIRTXGHfGdAJL5spbJMtiuI7uhGl6bc0I
         c20EBBNh5k/RMN8tvp7kD9h6+f0+OJQtB2SqHmY41NTVo1vmaqTHwEBfkLI66+OzRDvn
         GGHA==
X-Gm-Message-State: AOJu0Yy8gMzJC/CyWY1xa5xDkaJcjfkD+BELTDkzV0YN6sQbXbKJpZng
	HLVT0KAPJIdn1hsFTvxodbo=
X-Google-Smtp-Source: AGHT+IH6lhh5H3ucq4FquoRuYGX+x5ITg3xc8/1C3phGxtzbyl4dEsKYA3TdDq0W3AWO0eGmIOw8+A==
X-Received: by 2002:a17:907:2d12:b0:9ae:577b:3832 with SMTP id gs18-20020a1709072d1200b009ae577b3832mr1713173ejc.24.1697715027955;
        Thu, 19 Oct 2023 04:30:27 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id oz4-20020a170906cd0400b009c751e41ebasm2645285ejb.141.2023.10.19.04.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 04:30:26 -0700 (PDT)
Message-ID: <298f159c-f80d-3ba8-fde9-b11b59e5a58e@gmail.com>
Date: Thu, 19 Oct 2023 13:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US, ca-ES, es-ES
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek: Updates for v6.7 - third try
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_043033_430919_F14C2AB5 
X-CRM114-Status: GOOD (  18.64  )
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

Hi Arnd and Olof,

This is the third try to send you a pull request that meets all requirements. 
Sorry for the mess in this round.

Please find below a few patches for the 64 bit DTS files targeted for v6.7.

The patches were picked up with the help from Angelo.
With these changes we have now support for the Genio 1200 EVK board for IoT 
applications. Also the MT8365 from the same business line has much more support 
of peripherals.
Also support for the new 4th revision of the Acer Chromebook 514 was added. The 
difference with older board is the audio codec used.
On the Mobile phone side of things, support for the Helio X10, which is used by 
the Sony Xperia M5 got support for the display.

Happy merging,
Matthias

---
The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

   Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.6-next-dts64.3

for you to fetch changes up to 4055758a80395cb6d40fa26361e39bcc6f924651:

   Merge remote-tracking branch 'ulfh/genpd_dt' into v6.6-next/dts64.3 
(2023-10-18 09:52:47 +0200)

----------------------------------------------------------------
MediaTek ARM64 DTS updates for v6.7

- Add support for SMI/IOMMU/LARBs, power domains and multimedia
   related subsystems for the MT8365 SoC
- Add support for MediaTek Genio 1200 IoT evaluation board
- Add support for newer revisions of MT8192 Chromebooks
- Add support for internal eDP display on MT8195 Cherry Chromebooks
- Add display and display backlight support for the Helio X10 SoC and
   for the Sony Xperia M5 smartphone

----------------------------------------------------------------
Alexandre Mergnat (7):
       arm64: dts: mediatek: add mmsys support for mt8365 SoC
       arm64: dts: mediatek: add camsys support for mt8365 SoC
       arm64: dts: mediatek: add apu support for mt8365 SoC
       arm64: dts: mediatek: add power domain support for mt8365 SoC
       arm64: dts: mediatek: add smi support for mt8365 SoC
       arm64: dts: mediatek: add larb support for mt8365 SoC
       arm64: dts: mediatek: add iommu support for mt8365 SoC

AngeloGioacchino Del Regno (4):
       arm64: dts: mediatek: mt6795: Add support for display blocks and DPI/DSI
       arm64: dts: mediatek: mt6795-xperia-m5: Add display backlight support
       arm64: dts: mediatek: mt6795-xperia-m5: Add DSI Display and its vregs
       arm64: dts: mediatek: cherry: Configure eDP and internal display

Chen-Yu Tsai (1):
       arm64: dts: mediatek: mt8183-kukui: Add PMIC regulator supplies

Danila Tikhonov (1):
       dt-bindings: power: qcom,rpmpd: Add SM7150

Fabien Parent (1):
       dt-bindings: power: Add MT8365 power domains

Macpaul Lin (2):
       dt-bindings: arm64: mediatek: add mt8395-evk board
       arm64: dts: mediatek: add device-tree for Genio 1200 EVK board

Matthias Brugger (1):
       Merge remote-tracking branch 'ulfh/genpd_dt' into v6.6-next/dts64.3

Nícolas F. R. A. Prado (5):
       dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of hayato
       dt-bindings: arm64: dts: mediatek: Add rev4 of spherion
       arm64: dts: mediatek: Remove asurada-audio dtsi files
       arm64: dts: mediatek: Add hayato-rev5-sku2
       arm64: dts: mediatek: Add spherion-rev4

xianwei.zhao (1):
       dt-bindings: power: add Amlogic T7 power domains

  .../devicetree/bindings/arm/mediatek.yaml          |  16 +
  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |   3 +-
  .../bindings/power/mediatek,power-controller.yaml  |   6 +
  .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
  arch/arm64/boot/dts/mediatek/Makefile              |   3 +
  .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 101 +++
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 253 +++++-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  28 +
  .../mt8192-asurada-audio-rt1015p-rt5682.dtsi       |  19 -
  .../dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi |  26 -
  .../dts/mediatek/mt8192-asurada-audio-rt5682.dtsi  |  21 -
  .../boot/dts/mediatek/mt8192-asurada-hayato-r1.dts |  19 +-
  .../dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts |  64 ++
  .../dts/mediatek/mt8192-asurada-spherion-r0.dts    |  19 +-
  .../dts/mediatek/mt8192-asurada-spherion-r4.dts    |  77 ++
  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |  28 +
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  33 +
  arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 210 +++++
  .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 901 +++++++++++++++++++++
  include/dt-bindings/power/amlogic,t7-pwrc.h        |  63 ++
  include/dt-bindings/power/mediatek,mt8365-power.h  |  19 +
  21 files changed, 1840 insertions(+), 70 deletions(-)
  delete mode 100644 
arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682.dtsi
  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi
  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
  create mode 100644 include/dt-bindings/power/amlogic,t7-pwrc.h
  create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h

