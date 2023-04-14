Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863A1C77B78
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tpYSQRcLoZ2NNWNhd1p0+Azk81/34fPL8j6kX4EVcck=; b=skAoRoCZJ1hq5NMVWVE9U3wkhf
	GsS+KhaSm6xNgqJ6oXEINOiZJMEJEJJf2Gn0LI8i7rXXdhEfBcKYaDNsdM1TKZ3JP9uk6ZWQqOwW5
	7pJhvwUeR3ZR7C4Lt5vb7NYygiugJh7sC1FY/ng9CXLRd16bL/Mr6Npt4rr8F8+PGXV0O77lleb25
	1jo1VzO7hwrbZTWXosO/V1W2AcbJHF54Ce8R8EEqwK21lk3gKyxqC47upV1rCyp1CZKxmRMQK9HgP
	RIrRacjK9UFuSX3tDvInPXTIJQ6L8sscbOhEb3yDwX6g/ssjzDkyv9BLvFZupDvkh9MH2/IsuO3j9
	K7PjMYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMnn-00ABX3-2J;
	Fri, 14 Apr 2023 17:01:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMnl-00ABVu-0g;
	Fri, 14 Apr 2023 17:01:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id s2so14939549wra.7;
        Fri, 14 Apr 2023 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681491691; x=1684083691;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpYSQRcLoZ2NNWNhd1p0+Azk81/34fPL8j6kX4EVcck=;
        b=bCcjSgTmtygluGkiwy7ZH/Yg6HWR0r9DKq71+6NqvqyaNyOEphhiAkiGDpBAzwPhaN
         dTr6esiOR89FgDRQZnFMsUi+/pepQmeSxKUKGlBd0OIUg1yhmJXB1XUXvv5MQThF7P+C
         VKdhWZZwhdM/j4K4326XCaghhFj4meAaTgjj92PdQw9v8Xsjr+CIJmSZf0Vi2eYynABj
         cgxRjtCLjXoYKAqXCiK6F5DW7UzRBjllC0zUSZ+GcEXawPabqaPMCXHhTZ0Nu+D/y3Pg
         CyKk17+PaR0qVMytzUuW39c1DO5Cp1qTr9AWE+0GndRH2pFS0JlHMWpVYkWFNk3myGDM
         PIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681491691; x=1684083691;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tpYSQRcLoZ2NNWNhd1p0+Azk81/34fPL8j6kX4EVcck=;
        b=JYhAbzf3bQIqmb5qP1Irko/DSQdrHs+OQcTCJY4L02oFqx14LMqfzBQ5UohSbQM0VC
         5YF+FDEV3XJXCivv1meBUe49K9ut3CL2gDnuI/wZAIi5qM6YCKZqjSdmMBf5VwxUuEkd
         ZttQpZIbFJc2Lbihwiibwwls5OLNi7A3DLEqBFyJ+uYFUZmQtsgR41Tv6HNUVPIPItOk
         FrBSfQoo52L/+biMZXGH6vOs0JBOGUB64eRDlNGzdTMknw4vFxTp5DOvhU1yoJZ3aZyL
         tq+sI9IbznI8Z+s5hndwyaXyH+cbYCL1hzYFW0DkBfLWWR59u8hsKZ4Cmres8z0+lZ/O
         o/XQ==
X-Gm-Message-State: AAQBX9fL1haWlIkguKQJexg2+czJDK4GmezapaEfWZat2oyIjStv9McD
	5aiQSsjUvJGUm2PXknpCiN0=
X-Google-Smtp-Source: AKy350ZrjI0stSD4JEQTpCjrHz4ZUNwDVniU/jwdDHZurgbltaw4iFK4TqKYrpFEcd3N7ZOwacMAgw==
X-Received: by 2002:adf:e352:0:b0:2f5:a651:6bb2 with SMTP id n18-20020adfe352000000b002f5a6516bb2mr4356304wrj.15.1681491691190;
        Fri, 14 Apr 2023 10:01:31 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j15-20020a5d564f000000b002f7780eee10sm1250868wrw.59.2023.04.14.10.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 10:01:29 -0700 (PDT)
Message-ID: <6920736b-ddb3-29df-d0b2-46db40cef49f@gmail.com>
Date: Fri, 14 Apr 2023 19:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Moudy Ho <moudy.ho@mediatek.com>, "Nancy.Lin" <nancy.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek ARM64 DTS updates for 6.4 (resend)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_100133_251656_5D4F9D66 
X-CRM114-Status: GOOD (  16.47  )
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

[resending as I forgot to CC the mailinglists]

Hi Olof and Arnd,

Please have a look to the 64 bit changes for MediaTek chips. We had quite some 
activity to get GPU on the different SoCs used in Chromebooks up and running.

Apart from that we got support for the MT8365 SoC and EVK. Also support the Sony 
Xperia M5 (based on MT6795) get more mature. It's nice to see how MediaTek 
upstream support is taking over other areas then 'just' Chromebooks.

Regards,
Matthias

---
The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.3-next-dts64

for you to fetch changes up to 13961ef828cbc254cc272221b7fc54851caa39a7:

   arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer 
(2023-04-12 14:44:15 +0200)

----------------------------------------------------------------
mt6795
- enable frequency hopping controller (FHCTL)
- add i2c, power domains and some clocks for video enconde/decode
- Sony Xperia M5 enable touchscreen, proximity sensor, accelerometer
   and NFC

mt8173
- align keys with DT binding

mt8183
- enable GPU DVFS

mt8186
- enable GPU

mt8192
- enable GPU

mt8195
- add mutex for Video Processor Pipeline Subsystem (VPP)
- add support for Mali-G57 Valhall Natt GPU baked by panfrost
- add support for display on vdosys1
- add thermal support
- add display PWM

mt8365
- add support for the eval kit including i2c, pmic-wrapper, mmc and
   ethernet

----------------------------------------------------------------
Alexandre Bailon (1):
       arm64: dts: mediatek: Increase the size BL31 reserved memory

Alexandre Mergnat (5):
       arm64: dts: mediatek: add i2c support for mt8365 SoC
       arm64: dts: mediatek: enable i2c0 for mt8365-evk board
       arm64: dts: mediatek: add pwrap support to mt8365 SoC
       arm64: dts: mediatek: add mmc support for mt8365 SoC
       arm64: dts: mediatek: add ethernet support for mt8365 SoC

Alyssa Rosenzweig (2):
       arm64: dts: mediatek: mt8192: Add GPU nodes
       arm64: dts: mediatek: mt8192-asurada: Enable GPU

AngeloGioacchino Del Regno (31):
       arm64: dts: mediatek: mt8183-kukui: Couple VGPU and VSRAM_GPU regulators
       arm64: dts: mediatek: mt8183-kukui: Override vgpu/vsram_gpu constraints
       arm64: dts: mediatek: mt8183: Remove second opp-microvolt entries from 
gpu table
       arm64: dts: mt8183-pumpkin: Couple VGPU and VSRAM_GPU regulators
       arm64: dts: mediatek: mt8183-evb: Couple VGPU and VSRAM_GPU regulators
       arm64: dts: mediatek: mt8183: Use mediatek,mt8183b-mali as GPU compatible
       arm64: dts: mediatek: mt8192: Add mfg_ref_sel clock to MFG0 domain
       arm64: dts: mediatek: mt8192-asurada: Assign sram supply to MFG1 pd
       arm64: dts: mediatek: mt8192-asurada: Fix voltage constraint for Vgpu
       arm64: dts: mediatek: mt8192-asurada: Couple VGPU and VSRAM_OTHER regulators
       arm64: dts: mediatek: mt8195: Add mfg_core_tmp clock to MFG1 domain
       arm64: dts: mt8195: Add panfrost node for Mali-G57 Valhall Natt GPU
       arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
       arm64: dts: mediatek: mt8186: Add GPU node
       arm64: dts: mediatek: mt8183-pumpkin: Override vgpu/vsram_gpu constraints
       arm64: dts: mediatek: mt8183-evb: Override vgpu/vsram_gpu constraints
       arm64: dts: mediatek: mt8195: Add display pwm nodes
       arm64: dts: mediatek: cherry: Add configuration for display backlight
       arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
       arm64: dts: mediatek: mt6795: Add apmixedsys syscon node
       arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
       arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
       arm64: dts: mediatek: mt6795: Add SoC power domains
       arm64: dts: mediatek: mt6795: Add VDECSYS and VENCSYS clocks
       arm64: dts: mediatek: mt6795-xperia-m5: Enable I2C 0-3 busses
       arm64: dts: mediatek: mt6795-xperia-m5: Add Synaptics RMI4 Touchscreen
       arm64: dts: mediatek: mt6795-xperia-m5: Add Sensortek STK3310 Proximity
       arm64: dts: mediatek: mt6795-xperia-m5: Add NXP PN547 NFC on I2C3
       arm64: dts: mediatek: mt6795: Add tertiary PWM node
       arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
       arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer

Balsam CHIHI (2):
       arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
       arm64: dts: mediatek: mt8195: Add temperature mitigation threshold

Fabien Parent (2):
       arm64: dts: mediatek: Initial mt8365-evk support
       arm64: dts: mediatek: add mt6357 device-tree

Krzysztof Kozlowski (1):
       arm64: dts: mediatek: mt8173: correct GPIO keys wakeup

Matthias Brugger (1):
       arm64: dts: mt8167: Align mmsys node name with dtschema

Moudy Ho (1):
       arm64: dts: mediatek: mt8195: add MUTEX configuration for VPPSYS

Nancy.Lin (1):
       arm64: dts: mt8195: add display node for vdosys1

Nícolas F. R. A. Prado (1):
       arm64: dts: mediatek: mt8192-asurada: Add MFG0 domain supply

Roy-CW.Yeh (1):
       arm64: dts: mediatek: mt8195: add MMSYS configuration for VPPSYS

Xiangsheng Hou (1):
       arm64: dts: mediatek: Fix existing NAND controller node name

  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
  arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   2 +-
  arch/arm64/boot/dts/mediatek/mt6357.dtsi           | 282 +++++++++
  .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 166 ++++++
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 182 ++++++
  arch/arm64/boot/dts/mediatek/mt7622.dtsi           |   2 +-
  arch/arm64/boot/dts/mediatek/mt8167.dtsi           |   2 +-
  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |   6 +-
  arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |  17 +-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  17 +-
  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  17 +-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  34 +-
  arch/arm64/boot/dts/mediatek/mt8186.dtsi           |  17 +
  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |  24 +-
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 116 +++-
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  29 +
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 633 ++++++++++++++++++++-
  arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 183 ++++++
  arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 488 ++++++++++++++++
  19 files changed, 2181 insertions(+), 37 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6357.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

