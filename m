Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FE2C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s9IoM7ubfwjCRGp2OqRR9/s+nq5WA6taakqxn5di/mM=; b=PLQmYWymdVPiHv
	U4yzLfvB4VU9CBWRi4wxoXmPWBUorOAvdxJLygUNEJ5/AREE2IkAJcjKJ1LwGdR8j95rWv82ZWUXA
	/O+3FEFoU0Mc1eci2mhQ0LJMpA0t+r0oLYX/AqjSuhL+ttZ50TrTf3hV+W+FRsoksm22QOHTPAl36
	nr0e4XLvtsJUjj0+OdiwVQpyxPeemZTJwya1vNIaGdf8fk8zwo3u6G8AKWvTFX3GIcAR9fP1haCZQ
	VLeWz1w0MNkDLTBuHiY/WH1B0i1BQmdlRwY6hc2rcDyCRaGPwg8crXuHUgyCF0WV6CAgQgRvHwdfC
	wEw11IVoDRLlhQsRbnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1M0-00000001lsI-3hrq;
	Fri, 14 Jun 2024 07:28:08 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Lw-00000001loz-3Fyr
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 07:28:06 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52c525257feso2378474e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350081; x=1718954881; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9IoM7ubfwjCRGp2OqRR9/s+nq5WA6taakqxn5di/mM=;
        b=O1yFIeYJGDTrBolsn9aTxAMIWXZ54w95SoW5gHbxphSANLhmb9nnCvZZvmD6t83KRp
         6BcostsLPDUqceh6rRcrj7Wloay9q90B8p0NAxWcW5IIO005jB8av8o6B3tH+a58jIba
         K/qeyFdy910ftnePjIFECOf+c8AvhIJ0lx2PC4YnBvOXEKQVi4c5MF5ETWA69Rc1iaYw
         ETJ2PG9B2EfUlrhIwubqi0AmqiM0ksxNdxT0KlicedY4P217Gi/izPoPsrbWxZVq0bm6
         5q+yRD9Et/8Ybe5SsixCyHL5EwYmgby9kKx95XZrpp2fGBDn4mj5ZJ4+K/Zjm7Qfrj66
         6Mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350081; x=1718954881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9IoM7ubfwjCRGp2OqRR9/s+nq5WA6taakqxn5di/mM=;
        b=HF56Jn4oWW4gra9lAd7KxQy0smPotKNa+9dbYXux8TYoQBWVewm0SliVjnKjwStZyr
         k2Etq+NXgRCteAF0aL6fG4qyouZR8jWjscQRBgWorc7isBUSuHeQKz+tKSC7ZHH9gWJl
         1aUzHTv/GUX/y4aY5tfl82AbpI7mL77GA+UtNzruJA7/iMum8W5T62WoSYUqBJaUJnN+
         ZgfU6PW2MWsNrrS22hwDXtygtwBd9r8YG5VoY7NS8kOJF2hNKsJ15F7OPY6Mgrww+vBQ
         JC82JMbLwR+JrdTYcJZ9Ewjt1HZs+/QQa9brxKOIFgMvI5IgY6c5qXQsjpJSrz058k/t
         bqbA==
X-Forwarded-Encrypted: i=1; AJvYcCWt6xOhST1rdtJGivKb8PWRL0mQQRQNORmr6pHM66gqWc+BDd5huNygKXJWtDc4nHjjQRjASppoqCsu+vy4ieqDsctp1JBERH9IF0sXj05oEpJQ
X-Gm-Message-State: AOJu0YxSVXW46UiU4bIcw2MBz2C4lohHLP6df2xDJ9ojQ3rVLVvRXsK1
	0xcs5RGpPnzm0WKa6KkiC9EkDF1mUEemcHXTSFZWtLHFWN9aHoqTwmAIW7mYKAk=
X-Google-Smtp-Source: AGHT+IH7jwWOinuGgk9Yh4fKOKzw7iS3gNe54534Bx2QCDD1JZRWa3nwTm2WmaGaG0eJmrFlVO/D9A==
X-Received: by 2002:ac2:5e79:0:b0:529:b632:ae4e with SMTP id 2adb3069b0e04-52ca6e55cf9mr1142689e87.2.1718350080874;
        Fri, 14 Jun 2024 00:28:00 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:00 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH RESEND v5 00/16] Add audio support for the MediaTek Genio
 350-evk board
Date: Fri, 14 Jun 2024 09:27:43 +0200
Message-Id: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5809; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=6mA9w0EQq5o6RRMrcQA5mF6HTvpiguhhgrxdASPo2e0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D+4o7mUCLHzgUTyyTd19/m/OIX5wyM35S6Ro6f
 vyCUjcCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/gAKCRArRkmdfjHURYrrD/
 46Bl7UukNdZ1mmx9xyLzjuAGddTGNxhqBafqECIuekGVdt3+Zt5+FAqnrETRS3r/RYb9sUf+bQ+Hhh
 Yp0tDYgZFt/M4gTmOJaobXz9V/gckgfnUCrhrPjdjdQwNUANF2LaLtmmao0m6H9uq6EZ3F6AvWtO7k
 NQTdMhnno1qKPbYP75nDdpH60vNQiNEOE66FHWXbYlXGTfvv+7nkF8ourvZ8CJ9T2ufQTBeHmXijai
 NYEmOlMWvcYUtlgQUj9YV4W+4nA6qwmKrt5UI3MCgBZUc6+F1nGuymtIH2kOijwy52T29OmefzSDlc
 iTfdiY/jdXwAkSu9l/5FJ+M/rZHcol4YhQYAcaRU/sicl/3XxWSEkHIbBAIFCl3GzS6np0csxNzpwV
 IEkIYjS2vuzpY57x4F+1YB/xbm/6X6PIQ++QUB2nMkgjVf5UNvNwxWxrwUTF8PZ1HnWvZuqTzrK4hs
 rpM3OcWGIZ6YOTbBoPnBPlSTq3JMsPkEh0VOJZpzyEA8VZnlrvqTShwwZXjtfXXsOY7kJIB3gtV/1q
 fgyvIJD58sdPhmJvjZqcSfo0hiUqk0FGGe33KY00USqRTrPaH85YV23ckIkMrKxDnMDA8e6/zc3f/5
 LdKWGIMkjKzKTIKhB5fMMGpSSGGxw4xDXJH8qDZ867TtTWsNwUVtJO+rYGlA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_002804_861541_6CA9D3B2 
X-CRM114-Status: GOOD (  17.52  )
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
Changes in v5:
- Rebase to "next-20240523" branch.
- bindings: power supply property moved to the parent node
- Replace "SoC" by "ASoC" in the patch title (5/16)
- Move and rename DAI I2S's defines
- Improve code readability and cleanup
- Link to v4: https://lore.kernel.org/r/20240226-audio-i350-v4-0-082b22186d4c@baylibre.com

Changes in v4:
- Rebase to "next-20240422" branch.
- Re-pass dt_binding_check, functionnal tests, mixer test and pcm test.
- Remove copyright changes.
- Move mt6357 audio codec documention from mt6357.yaml
  to mediatek,mt6357.yaml
- Fix broken indentation in mt8365-evk.dts
- Remove empty node.
- Add more dai link name according to the HW capability.
- Remove spurious property (mediatek,topckgen)
  from mediatek,mt8365-afe.yaml
- Rename "afe" to "audio-controller" in the documentation.
- Link to v3: https://lore.kernel.org/r/20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com

Changes in v3:
- Re-order documentation commit to fix dt_binding_check error.
- Remove $ref and add "mediatek," prefix to vaud28-supply property.
- Link to v2: https://lore.kernel.org/r/20240226-audio-i350-v2-0-3043d483de0d@baylibre.com

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
Alexandre Mergnat (14):
      ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
      ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
      dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
      ASoC: mediatek: mt8365: Add common header
      ASoC: mediatek: mt8365: Add audio clock control support
      ASoC: mediatek: mt8365: Add I2S DAI support
      ASoC: mediatek: mt8365: Add ADDA DAI support
      ASoC: mediatek: mt8365: Add DMIC DAI support
      ASoC: mediatek: mt8365: Add PCM DAI support
      ASoC: mediatek: mt8365: Add the AFE driver support
      ASoC: mediatek: Add MT8365 support
      arm64: defconfig: enable mt8365 sound
      arm64: dts: mediatek: add afe support for mt8365 SoC
      arm64: dts: mediatek: add audio support for mt8365-evk

Nicolas Belin (2):
      ASoc: mediatek: mt8365: Add a specific soundcard for EVK
      ASoC: codecs: add MT6357 support

 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   |   33 +
 .../bindings/sound/mediatek,mt8365-afe.yaml        |  130 ++
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     |  107 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |   89 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |   43 +-
 arch/arm64/configs/defconfig                       |    2 +
 sound/soc/codecs/Kconfig                           |    7 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6357.c                          | 1898 ++++++++++++++++
 sound/soc/codecs/mt6357.h                          |  662 ++++++
 sound/soc/mediatek/Kconfig                         |   20 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/mt8365/Makefile                 |   15 +
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |  429 ++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h         |   32 +
 sound/soc/mediatek/mt8365/mt8365-afe-common.h      |  491 +++++
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         | 2275 ++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |  311 +++
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |  340 +++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |  850 ++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |  293 +++
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |  345 +++
 sound/soc/mediatek/mt8365/mt8365-reg.h             |  991 +++++++++
 23 files changed, 9364 insertions(+), 2 deletions(-)
---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240226-audio-i350-4e11da088e55

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


