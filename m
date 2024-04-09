Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B611CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NmzNUGGq4OZxYDQpggue6Jal58rApphculiJ5bPS4hY=; b=SLsKqhmnsmB8SO
	Z7wLjwkVYdMbq38LXixMfHO5fiNxAbCeXpae590OChl0aQK1ddc+HNpHR+1nwugWn5yGuXAE/jeB1
	lPXn3PV8aQBy0pSElUpB8XME+VQKyT0Zh1OZ9eaCyk4Jvr2RSnDdJgJAH4rNLct7Uhhvz2b94zfUT
	QC+a1RK2cVlyIz4/qthgsvwq45zY+V9AiHcLvBm9TJ68ZBbr7clBnqQeuwD7Ny0XAhCrueYDXNSAq
	XIvHFhodQrwfjrpiqrTQq9VjfgJpCtHoiNhjmVHjNSc6yZ3SIS6ILU5UmJHS4jQw8aH/jLpxA5jPo
	sVaUx2zlvyzpsLq3mMMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8Ur-00000001Nyq-0xsE;
	Tue, 09 Apr 2024 10:14:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8U9-00000001NSZ-2bPT
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 10:13:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4167fce0a41so9378315e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657621; x=1713262421; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmzNUGGq4OZxYDQpggue6Jal58rApphculiJ5bPS4hY=;
        b=mHr/f3jroJOZrt3+RkPz548W0qcoOnaMXZvalBAXvZqPsf0SQdzWkn6acLcF8E5RwT
         QSUwzA3V6RQiFe98QMX0IjdBFz3fy0b7po8pOsrFsNSjQjqqBo+LhdRuqnLTID1SVbA/
         xHjhoyIBFJWyUWSa+d9t8JArAJ+7Ipqi4gXawrPE26c6IT0qPjFaKmF9LLIJR5A1HUPL
         5GYjErLDFcSc62cp3JYcJx2WDC0V8jaDYCSqpocoSuXw5RQsBcZ83xLJW8lWGw+ixIN0
         TC8a2GZzOcQsM7WxywqWoaNNpw2c//fD42DS+PNhV9+AYh6s/EcrJRwyo3urTHM+X3vI
         5NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657621; x=1713262421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmzNUGGq4OZxYDQpggue6Jal58rApphculiJ5bPS4hY=;
        b=kFij4NGJJRmoBtcI2UjZnNClPfFDnDTKKzwdnR03jyrQVFffxCgWJlfxTkuO70Ihar
         kT9hX9h3Ta9iZ5jyrk9AQy72cP7xoSTmphiBTLwsjOKlsZaQlyjdi0wBMW0UW07hz2LD
         YVki6NGoGU2Q3Bvxa9r7JqbFsO/ympLL5pGMeHKmU4dlCQJWTb0qZcGfSxZQR0qSl5qH
         xDY4GVTydy9xvNX94R/dt0MvOVoQ2v9k/sVdKjfJ6UB59sgHIXmo2N7p3LRfk3nUAq0o
         z41bJc9WO7ZjV88vXBJIAlDgqJqGpkcb5ckjqdKGqglVTb82VihTsLjZRNaJGE2H5NSP
         TV+g==
X-Forwarded-Encrypted: i=1; AJvYcCWFUM4Vtlam2VA8NbORUGiGzv0X4TpuMINyj1BMuz4+4MMjESKmschWlvIDeXlezoHfUY4i7WcFq/0RoAmVHsiqlK68ekg/TOnpWdG9u4LZrlkW
X-Gm-Message-State: AOJu0YxluskakpAcDHbPYmm0MASDzLrTren4LN86bX8dabSpSKiy/mEU
	KkxOCj/gisFC89oPuO1NaKF6wd3WhNhjU4Ea7AEnVPaCU6kmm80xTj8/CNyEXk4bICeXIoD2f93
	dEpA=
X-Google-Smtp-Source: AGHT+IEfyUckUTv9y+h7aU1sPKbwv2MnnR3RjfX8QU2JXOf1FG/6NWi+qlxipn3wRvVnx4htRvoj8w==
X-Received: by 2002:adf:e5c9:0:b0:343:e4c7:91ca with SMTP id a9-20020adfe5c9000000b00343e4c791camr1840661wrn.34.1712657620864;
        Tue, 09 Apr 2024 03:13:40 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:13:40 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 00/18] Add audio support for the MediaTek Genio 350-evk
 board
Date: Tue, 09 Apr 2024 12:13:21 +0200
Message-Id: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMEUFWYC/22OwQqDMBAFf0VybjRJNZWe+h9FyhpXXdBEEpWK+
 O+NnnucB8O8nQX0hIE9k515XCmQsxHULWGmB9shpyYyU0LlQinNYWnIcboXgucoZQOiLLEoWBR
 qCMhrD9b0pwIj+s7CnK06Lbk3MrvcjxkQ7DKdxuSxpe+Vf1eRewqz89v1ZpXn+je8Sh7rLUiDI
 LV+tK8atoFqj6lxI6uO4/gBW4L4ZtkAAAA=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5019; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kvrkpkSbwnxP+OsANZxrkaQO2wy0hxgPbU/o5M3cUTc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTS/ESKMk/bMbTCvsa18ZOHK7gykTDFGXyOiufN
 4k1HZauJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0gAKCRArRkmdfjHURXdFEA
 C4PwmmiadLcE9+Npluv5XLQ3noHUP72O6on3QLhDWeBidAaW4MuWNsXNDmBw78Ibuxhti6ePuV9u0u
 J4559KjhY63k4iLFUIILtSQxIgOSMbfPH0w3A1shNPu2u3BRKfZTlbSboJwnk6ghsRPP20M/HCcc3b
 JAVuTaY3B/AEOUxonMKONTywbEfZ/Y2zFgBvI/5UkoDLLLrHqm3W5jzRV9GTpE3+wTT9U5MRGJZIKN
 dH3TNU9QHAlHnEym5M6Ok+Yuq0gV/2LtM6X6OFJsmSR2dZ+k1mTjrHHRCqSWvXCqJoqC6whffyzK9P
 jfr49GaFqunX0GNdXDrFbekBMgvVt+fX8JGA/8wpxPucsC0eKasAqzz92VO3ZLzQqGT5o9OMt8yMyy
 7jOlK9cG7XWMuawc7PjDduFgIzdM3/lfKz0CaLm8OX2cB71HHrNTzvb4jFwzAI62QBIocVlwtH0HdW
 M2qLIWx4hhKJWC2HmOUYQV35SzblKdDHzOE+cFg4JwV7STKlvrmVK/7c8Rl+iKEmanwEeEbVTgNQsN
 TYeMidHTn7N3gWwlr5lFHENpkyv7nNV2g2YxNqChOEkdDVgk3hpZsdjSwmgm578gLstnyp5U2q/VHj
 VsT/K3AY4Hv82/t14rCh9zndJBJlkiu/hTFdm2Af6OdvYW7s04EznzDqUGVA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_031349_808144_54D0C6D7 
X-CRM114-Status: GOOD (  16.65  )
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

This serie aim to add the following audio support for the Genio 350-evk:
- Playback
  - 2ch Headset Jack (Earphone)
  - 1ch Line-out Jack (Speaker)
  - 8ch HDMI Tx
- Capture
  - 1ch DMIC (On-board Digital Microphone)
  - 1ch AMIC (On-board Analogic Microphone)
  - 1ch Headset Jack (External Analogic Microphone)

Of course, HDMI playback need the MT8365 display patches [1] and a DTS
change documented in "mediatek,mt8365-mt6357.yaml".

Rebase on top of sound/for-next branch and the
Angelo's serie "SoC: Cleanup MediaTek soundcard machine drivers" [2]
Work branch with all patches [5]

Applied patch:
- mfd: mt6397-core: register mt6357 sound codec

Test passed:
- mixer-test log: [3]
- pcm-test log: [4]

[1]: https://lore.kernel.org/all/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com/
[2]: https://lore.kernel.org/all/20240313110147.1267793-1-angelogioacchino.delregno@collabora.com/
[3]: https://pastebin.com/pc43AVrT
[4]: https://pastebin.com/cCtGhDpg
[5]: https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/sound/for-next/add-i350-audio-support

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v2:
- Documentation fixed:
  - Remove spurious description.
  - Change property order to fit with dts coding style rules.
  - micbias property: use microvolt value instead of index.
  - mediatek,i2s-shared-clock property removed.
  - mediatek,dmic-iir-on property removed.
  - mediatek,dmic-irr-mode property removed.
  - Change dmic-two-wire-mode => dmic-mode to be aligned with another SoC
  - Remove the spurious 2nd reg of the afe.
- Manage IIR filter feature using audio controls.
- Fix audio controls to pass mixer-test and pcm-test.
- Refactor some const name according to feedbacks.
- Rework the codec to remove spurious driver data.
- Use the new common MTK probe functions for AFE PCM and sound card.
- Rework pinctrl probe in the soundcard driver.
- Remove spurious "const" variables in all files.
- Link to v1: https://lore.kernel.org/r/20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com

---
Alexandre Mergnat (16):
      ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
      ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
      dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
      ASoC: dt-bindings: mt6357: Add audio codec document
      ASoC: mediatek: mt8365: Add common header
      SoC: mediatek: mt8365: support audio clock control
      ASoC: mediatek: mt8365: Add I2S DAI support
      ASoC: mediatek: mt8365: Add ADDA DAI support
      ASoC: mediatek: mt8365: Add DMIC DAI support
      ASoC: mediatek: mt8365: Add PCM DAI support
      ASoC: mediatek: mt8365: Add platform driver
      ASoC: mediatek: Add MT8365 support
      arm64: defconfig: enable mt8365 sound
      arm64: dts: mediatek: add mt6357 audio codec support
      arm64: dts: mediatek: add afe support for mt8365 SoC
      arm64: dts: mediatek: add audio support for mt8365-evk

Nicolas Belin (2):
      ASoc: mediatek: mt8365: Add a specific soundcard for EVK
      ASoC: codecs: add MT6357 support

 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   |    5 +
 .../bindings/sound/mediatek,mt8365-afe.yaml        |  136 ++
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     |   99 +
 .../devicetree/bindings/sound/mt6357.yaml          |   54 +
 arch/arm64/boot/dts/mediatek/mt6357.dtsi           |    5 +-
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |   98 +-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |   46 +-
 arch/arm64/configs/defconfig                       |    2 +
 sound/soc/codecs/Kconfig                           |    7 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6357.c                          | 1898 ++++++++++++++++
 sound/soc/codecs/mt6357.h                          |  662 ++++++
 sound/soc/mediatek/Kconfig                         |   20 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/mt8365/Makefile                 |   15 +
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |  451 ++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h         |   49 +
 sound/soc/mediatek/mt8365/mt8365-afe-common.h      |  491 +++++
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         | 2275 ++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |  315 +++
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |  347 +++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |  854 ++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |  293 +++
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |  348 +++
 sound/soc/mediatek/mt8365/mt8365-reg.h             |  991 +++++++++
 25 files changed, 9456 insertions(+), 8 deletions(-)
---
base-commit: 6a3d4a830e4e9de8e8aefc233d790bef4a5c0037
change-id: 20240226-audio-i350-4e11da088e55

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


