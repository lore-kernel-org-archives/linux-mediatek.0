Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F6EC25B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 08:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s9IoM7ubfwjCRGp2OqRR9/s+nq5WA6taakqxn5di/mM=; b=DoBBfntPk0FVup
	QjKTtflwXaLHyJLqbz9rN35A/cMDT4pY4Wfyf9fOyW6TQbV+YfPizewcShzsNxatYb1fOFKvNKHb/
	73GmdZOnTetpzE8bRxDoH4D6As+CcTIn62RmBsaE4ZetUGLZQaztHhUqs1WJcpoVY6E7pETr1KWFz
	NXWisKGmh1ejPiZzPlHzMVhKaec3KDnFHwcIQDhhLAH5YaXlL0W21QwSnN5+8V4YB3TdzJ5VPirMZ
	VHL42Aos10H/b92ZihJZh2ApH9YGGnN5AIaRXciTgyJPJE8JdunSlR5bK2bADnJ7hcnw5PmP9X/t9
	sY9GUTgCVQFm42v43Lug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42D-00000005Wvp-3P9Q;
	Thu, 23 May 2024 08:42:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA429-00000005Wt2-21zp
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 08:42:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41fd5dc0480so49226585e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453762; x=1717058562; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9IoM7ubfwjCRGp2OqRR9/s+nq5WA6taakqxn5di/mM=;
        b=uP5dC0kSWAdSqYbpx/RhH9vbdN3O7rfSs0JeGK87tbTbSah2ceLLzfHDCk87tYQwJU
         Gzp0l5UrcP9PG4Nvni1GA9G/u9pT7ywtSSgCypndt3MqtxywNoldHcnu44uyITpN2v67
         e3T4XKcecL0RnGJi4I68xNQ/ZBMlU9bHk6i+MpkKKOFIAZ7yYkui4qlwhXXvMNIp3MgC
         H88n+afCBSdE59UKTL10+gOUwUW/qyTjrz8oKAmEHE4sixZpn2WbYz4bYK2qRFL5Jqwj
         SxcTm7hsgoZxH49gcUPQVvjzfIQjvUAwkJAFS4Pl2Ktt3iF/V5wFpAwbSy2NV8+bfv0E
         9rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453762; x=1717058562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9IoM7ubfwjCRGp2OqRR9/s+nq5WA6taakqxn5di/mM=;
        b=O+zr6XzfwlWW88dtAXr+ritkgdtAIgmLDFPaOi+vbX3F138DlmMZuXaIS+bugCHVP0
         +bVLsF7P4UJ5Nrof66dgn1nzR/Jzt195uRnVN92Q2XLtFB4KSovrtcA9N9uEJmsLhRlj
         VVnLNDjmjxbjmvt5SntXcrLyTdsmWgASQALQdGRObMNoYpyzdEMjIM3SzoWb/Kz+3lqP
         yNmdEpw+uK8BeNVl+DZJpQYwel4YgYbTkWaXKGmJqsmQHrW6H/zK/M5UNN/OCpIvUPNd
         eC9oxk8rAmy8c74yBUvv83jusiOZII5qmMyJRScYm3062l0bhEuWmkFr6Ltsr/P7wxY1
         lTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxYf7EtnhbBfzqtZpfhZ/w7XmnjfdOGgWd6m3obEXBeWo7PFc+9of+oobP87hMsfmLJDhXlYubIT5SguPNPP5xwdUPtsW38MgbmwC9CbRC4Fqw
X-Gm-Message-State: AOJu0YywbbkdpS4OR12mXcgZuJc7B1AQZeMHYg83p76e7bemjNhSz6tD
	jgcvxVMPjD4QZ1SLvPOZoPTeDCWIkfFNVvxKBluBJ2dD1JNqcAWPtvhtKuBssds=
X-Google-Smtp-Source: AGHT+IEeSF0n+GzArx73nwYO6lnriXZ6tJ0DRv8D6jLr9WeIudFedWUiTESJQl7Eo1V0D4QbkiLZMg==
X-Received: by 2002:a05:600c:584c:b0:418:f760:abfb with SMTP id 5b1f17b1804b1-420fd2d7071mr29842315e9.5.1716453761573;
        Thu, 23 May 2024 01:42:41 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:42:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 00/16] Add audio support for the MediaTek Genio 350-evk
 board
Date: Thu, 23 May 2024 10:42:29 +0200
Message-Id: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHYBT2YC/3XOTW7CMBAF4Ksgr2uwxz+4XfUeFarG9oRYAgfZE
 IFQ7l4nyypZvpG+9+bNKpVElX3t3qzQmGoacgvmY8dCj/lMPMWWGQjQAsByfMQ08KSM4JqkjCi
 cI2NYAx4rcV8wh34meKVyzng/jHbveAnysNjfcCHMj9ssboW69Fzmf04t96neh/JavhnlfF0dH
 iVv6x3KQCitPXbfHl+X5Avtw3Blc9MI2xqaVkKrqJ2KJOKKVttaNS2t9xA+jzoYs6L1ttZNCwc
 eQDobdfinp2n6AyV0kEyTAQAA
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/BUH/8IbYUnAckzLUkGmhFoeLd1jg/OI0wnsK
 bUZ4x6OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURWW7D/
 sHp0Ao+lZD/Vn6BLG/eCP+OxIy594sYU8PBH193MniLgdvURvi1RArpum6PqVbLKrZul1xG/g2YvdR
 sqt8QK7fF/ZwjabEs+53x3DXhvmOv3uBthAH8gWXLthhC5R1PETsMvli9L8lp7O3XyKVcizHJfYhWi
 zlZUdLFCQe5exrBmd7q9pWtJnkPXZjZvgIHcrMUBhX2b/kBZUrg4cQ/qKKjqlfwRV4srqQpj98Sm9J
 cl3u+A8Go5Ig1OaFacv+7WsuJPJTcg97R+YFsbuLvbtQqv9DmdbJ8FT8DDhOYRXdTabUhpWbQwRdCy
 VHmoCtr7dfNpnosf4di42MTHBaoHw/INpDi3OTRcU58gqfQYhIJFMoWbwCxkaaOH6PQ4mzW9OD5BHO
 tweyZQFWxQBcANsCIrIrExjdD6gQszvZI3bnjG1wBNcH/jRZkisd07vTZM5C8rxDWDtNddnTH608FN
 GXKeKIBk9JZFzM1VohHg9KGcsAt1msPFBlLYyQxJHuSMHSf3NCmsXU2TSE9eEAMOHvuIL/ZHL4Cr2k
 HIFWhrUbNS3fVp+xNn3x+Qsw/ztOqzrMvtLDTSXkkwChA2EQFaAgqh2Zcen92jvz2Lv++j7pkEzx/F
 h637DaBirZmda/kkMfDm+aoGBVZ3GYhYwgsMubHgGSj2MNvqW2rLWR4YNaLg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_014245_540246_E2E37D48 
X-CRM114-Status: GOOD (  17.64  )
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


