Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675BBCD4F59
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JUeCTdJ3sls71eS4ZZNr+/ElSpCCJujDvm6Vi2xmmfY=; b=NYOuxKN68eazNi
	sJwjf2Apn8utfUNxly27hnv+ftMJWQhhXcMnkifIxCK59GqzSQE2WdjZppJ2YOBDvWdVliGFwiUUq
	03ZhTq18dn0As6maG94yYv1EsxkmCJsbQmQ/ZbxDweKKix8wYhOpVZWZ93Jct80m0a96jFu8tpLi8
	EVljHbL5Ppl3EgXqpfQ3ZV9aRtqeQU3OQtWq1/htYuFdROq03G5oVHc1daDX+ux32QcJrxe6ixBP2
	691wheHsZoigWWRqklEx0BzauUcjPEA9rApzaHKTflAcmPikSJHEvtU5rzlTs0RL4rLppIr/wghZa
	omX9Bd8eItLaYo6f6mhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8TD-00000007gt4-3u9z;
	Thu, 05 Sep 2024 09:08:03 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8Sg-00000007ggY-3C1X
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 09:07:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5334879ba28so603888e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 02:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527249; x=1726132049; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUeCTdJ3sls71eS4ZZNr+/ElSpCCJujDvm6Vi2xmmfY=;
        b=0Rf0TE3kCWUG8AYFHNzex9pAEd4lIRYQMJElFoNkd4+bc2vumDo5VDieVZXdEAlfTb
         n67+UhKUNYDw76V5s7Wa3mtFAGQAWRL5piWwvmpRI+AX1bzuuiGx7l3Fj56dE/bhOdUT
         cjRsZp/kPwAPCMUylMbyU/k4sgAnK8aBN0KzGNW6FgDRXICNzASWTthvx8nl5VbTaNn5
         3bMDg5bAZ5Ava8PVdKmvLKIjULspCPiAAw2L16IqV1RqhRiVoeUvVUFJ5+OBJGBXY6bC
         kAGzAs92/x5xGe3ke2tYhJSkln70fQOhcUUumiSB2aOXyqSmzgpBrajz1tL28U6+TFU6
         5RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527249; x=1726132049;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUeCTdJ3sls71eS4ZZNr+/ElSpCCJujDvm6Vi2xmmfY=;
        b=UKTaRVAT9xKtL9VpnVa3HZL/q1wOWkZkT5bQRHwgVDUncfmA3xBCTn0qGnqYKHvsrA
         FfJOlymApFDwsSDUJPY7jKhOxyRarjUMmfI3ku421t6OAcOcJ1ilCagM6yNmDmK9Y6QP
         gsuAeMrnzktkxd6K1IgG4I0YUyDR5Fj1JgqJXjMoB+MN52B9dMmxZnmNDW633ebBvsFk
         5lVc/AV9F3kvhm5B7Y22cf3frEEnnzZFq5MVpWj2cqI7rSttdKXU+yw4+0TTVPKxWixp
         UQtT6OVbptZ2zuBk3fHgJeq1/fYuwcP575CwMNYqzGwjneay/qRCyiWRCPSXklhuNG5k
         oRPw==
X-Forwarded-Encrypted: i=1; AJvYcCWPz+OhVMJbjCtZDUZjUs0EjcaEED1jyG49rLtiMYmJVkcleJ9s6x8ljmYF+pophuHBj/ipb2JXRKtpwlnn6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh9TKZTBYobs8xKV/M7fSRwlwUl5HkXp7yStVTIcbfPQP8vkKu
	85vKcQ9cihrXqOctDbyqCAi7x5fRKnHwHkK9e2IGf8BE+SBu0fJAJTnjd3/4aes=
X-Google-Smtp-Source: AGHT+IGoXr8sDfb/qLgzQ05rmiOhT+IRh+Lq0NYQ+ICJw9s4N82Vl9TQQJyTL02pfA9YRbTstwBlcg==
X-Received: by 2002:a05:6512:228b:b0:535:6a83:86f9 with SMTP id 2adb3069b0e04-5356a838876mr2189726e87.60.1725527248520;
        Thu, 05 Sep 2024 02:07:28 -0700 (PDT)
Received: from [127.0.1.1] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-535406e5549sm2554188e87.0.2024.09.05.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:07:28 -0700 (PDT)
From: amergnat@baylibre.com
Subject: [PATCH v8 0/5] Add audio support for the MediaTek Genio 350-evk
 board
Date: Thu, 05 Sep 2024 11:06:57 +0200
Message-Id: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALF02WYC/3XOTWrDMBCG4asEratEo39n1XuUUkbSOBYkdpAT0
 xB898peFnv5CZ559WYjlUwjOx/erNCUxzz0dfiPA4sd9hfiOdXNpJBaSGk5PlMeeFZGcE0ACYX
 3ZAyrIOBIPBTsY7cQvFG59Pg4TfboeYlwWu1PvBL2z/si7oXa/Lvmv77r7vL4GMpr/c0Ey+tme
 AJe6y1CJARrXfsZ8HXNodAxDje2XJrkvpZVK6FV0l4lEmlDq32tqgYbgoyN09GYDa33ta5aeBm
 kBG+Tjhva7GtTNTmSxjap1R42tN3XturWGU0R0FmlN7Tb165qa8CnxigE/b89z/MfYa+yDU0CA
 AA=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5825; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=dBxURWX7KTFMbN81hRO4g326ngzL/XDCE/FYjWt5HIo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBm2XTOxzwz7ABWQj56AdCpLONjDkYNZ96e9sKRl/Rf
 w4JiwPmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZtl0zgAKCRArRkmdfjHURT/3D/
 0VlMEO+7VnEC9PokKnpBY6NRgS4pZwPpn2hO+jxxC+y5PI/8wJWWZU+dN4bK5lp2i44JkpeuIvHdNh
 tJAoyGO1hCBCS2HHuZrwgXF2LpROZ4oeBG+v3Lo693gBTqxCttoFLr/1iMHPsESqDLxK5rFJp7f0rG
 F4MkeFZF+Vz3biT3nyF5Nu9lq2Mjr9dSEUe85G8isJbIPvWQfilYdtr0Byfx/TdrI5SIkbqsth9Oci
 C8MoqypoBFPd3Z2kd0N7pxWTBTyXnJN6Rt/XQxIRCOQjUb1vmcJV52XAmEyzWhoPronkiO68s1fuai
 ivM6OW0tsFv+/+TLJ9SyARyyYU1pEdRpRj0noeE8Trs3t/O6SHFn3yoGyO4jTIBk1CMuTOH+697aeX
 X50E+xiGCTGxW/oREwxSrpMvUkur65jO6Kp7mJjf3b/AQ6ferLz+WqpoL62GFT7/wl1nhX/WGhGgs3
 uUx7xjPQB7zXDqQhymrqnyZR9uR5pqDI6kZ75bGhQdZS2ZUMTGD78nPoK+h2Afv3czew3/x088/jRE
 CCL0FCmwNapXFSxPMT9EeCzA7x6RZxQBEBDTa1WbBIrWs+0x6Pt/Pv+O+hqG+PlOjBqWkBtSPBu0wl
 oLU+mK0NM39Z/991TWdLhvsqBM21XP5qxfnf1HV0SHLNrmVOBZ/hSLA6iRLg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_020730_846145_3F4A4602 
X-CRM114-Status: GOOD (  18.11  )
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
- ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
- ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
- dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
- ASoC: mediatek: mt8365: Add common header
- ASoC: mediatek: mt8365: Add audio clock control support
- ASoC: mediatek: mt8365: Add I2S DAI support
- ASoC: mediatek: mt8365: Add ADDA DAI support
- ASoC: mediatek: mt8365: Add DMIC DAI support
- ASoC: mediatek: mt8365: Add PCM DAI support
- ASoc: mediatek: mt8365: Add a specific soundcard for EVK
- ASoC: mediatek: mt8365: Add the AFE driver support

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
Changes in v8:
- Rebase to "sound/for-next" branch
- Fix build issue by removing extra argument into dev_err_probe function.
- Link to v7: https://lore.kernel.org/r/20240226-audio-i350-v7-0-6518d953a141@baylibre.com

Changes in v7:
- Rebase to "sound/for-6.11" branch.
- Move audio-codec properties to the parent node
- Remove gain values change at init to keep HW default values.
- Remove spurious function by inlining them directly.
- Use standard adaptators for regmap.
- Use "ARRAY_SIZE()" instead of defined value.
- Remove unused variable which breaks an x86 allmodconfig build.
- Link to v6: https://lore.kernel.org/r/20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com

Changes in v6:
- Remove spurious defines
- all files: replace "Mediatek" by "MediaTek"
- dts: replace "pins" by "clk-dat-pins"
- dts: drive-strength: use integer instead of define
- Link to v5: https://lore.kernel.org/r/20240226-audio-i350-v5-0-e7e2569df481@baylibre.com

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
Alexandre Mergnat (4):
      ASoC: mediatek: Add MT8365 support
      arm64: defconfig: enable mt8365 sound
      arm64: dts: mediatek: add afe support for mt8365 SoC
      arm64: dts: mediatek: add audio support for mt8365-evk

Nicolas Belin (1):
      ASoC: codecs: add MT6357 support

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts |   86 ++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi    |   43 +-
 arch/arm64/configs/defconfig                |    2 +
 sound/soc/codecs/Kconfig                    |    7 +
 sound/soc/codecs/Makefile                   |    2 +
 sound/soc/codecs/mt6357.c                   | 1855 +++++++++++++++++++++++++++
 sound/soc/codecs/mt6357.h                   |  660 ++++++++++
 sound/soc/mediatek/Kconfig                  |   20 +
 sound/soc/mediatek/Makefile                 |    1 +
 sound/soc/mediatek/mt8365/Makefile          |   15 +
 10 files changed, 2689 insertions(+), 2 deletions(-)
---
base-commit: 097a44db5747403b19d05a9664e8ec6adba27e3b
change-id: 20240226-audio-i350-4e11da088e55

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


