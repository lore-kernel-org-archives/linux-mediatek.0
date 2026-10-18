Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC81CCF2C4
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6URPsYJRnMhn86UpOhNKjpas0t0SFBwykPnRhuPO50g=; b=OSwBvs7cxUdcUG
	uKAfy7c67v5lMR0GBbyZtu+f6B/B90fdZ3ovUpZc1lznZdOaB9RHRJqwdD75Vz+y37IfooSqI91xc
	tw50s412Oq2PuLm4xyzSvUMK0qbFbFoH0GeUYtS67p8FcbwuY6tQ3m5hBiiTsTiFRc/vbr/Zf/6A0
	YmWCppxBgG90T2GGIKvtWlPt20+jGdsVvbrluC0E7WzmAaiHBfKAYCco/TD/tLNM1aGidRq5reJw6
	F6Eb4PsAhbZxsq4yKHtHf9eynvkLAATg3KLmnoM9AFkdym8AhS2Q8Dz9u4dExJRDjULEnS5WUFFl9
	qRNmKVJuvzNXCDyi6zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJr3-00000005ZS1-1KTg;
	Sun, 18 Oct 2026 05:54:45 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJqr-00000005ZQc-2obN
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:54:44 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so706000a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302873; x=1792907673; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6URPsYJRnMhn86UpOhNKjpas0t0SFBwykPnRhuPO50g=;
        b=e94uEQGpyvHbHyQZTfbCmuhSwdC4kbPUduK4fizkz9NE8CEAFUiCBXxvzBkS7gTzXA
         vzOSI1c1uxhJfmZUpZnWYZkZ6FgTXvn+ZDGdFH1wl6awvvL/XTDGerDwaruf0pT1qS4x
         pn8aYRguZMl2xDeQ0HVQMw7DLIO5+Tyzxzs0uqQ0uWR7ksWOdnZdpcv09bGnYXJPA4PG
         iQrY6UYB0+FgZo25ddvYNfbfibZw413wOKSBnFFG3tXCGwayagK9UypOyOhlIvLv5od7
         QyrSBWVEMyhlJ/u4Jl0pjLP0zTSkCV42MDAmisc60sk4PB6EAeNXCZ733iroWMsO2Qc2
         ciUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302873; x=1792907673;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6URPsYJRnMhn86UpOhNKjpas0t0SFBwykPnRhuPO50g=;
        b=MOS6YsslYiJi1WAl/yco0S+vc1R2OcZGhKipKb/ifpdZaFlCfgLhWpnjKe16EQ15H+
         Wi46oS4H1aaSucBhlQlU3BBZzT1ZX94fJX7p2E3l/u5YrlUG9ziQv9LrYQuuwArf4ryt
         BaubJB3UsNEPEw4uyJDYuXr972ugaioCR4G3KdSEqD/+jUMw6hABG7ZH51FLvc2Abcdf
         ew82aO4rZxuBFle6xv3iu4pnWG18wkhgCfQw5jkc/b3P5GGgBdQkYDumT7zCK83mnx/W
         bU09Wx/ninuwpdIT7Z0zbCNgwFK/SBwHzSrrhJmfQCmCLry1mzuu7GqWaxVwIpLChbYl
         m0mw==
X-Forwarded-Encrypted: i=1; AKwUvBxfBYke+ZnNHYqVDf04WeYq8gBZzZ3Z+pIfHANsO7ZaBScqkPUm0ddPmOJ+ll2EoqonO/Crl3BcMbPBuIbt7w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIA79qnvdDmDmzpOs2QW9LgeA3IXOD7cNNxWEurwTiM+szQeI+q
	htZMj+WI0bK6P4DjyULIuC7f8rmUu3a2luWoQ5JVrQDgM5FzT48lOV+P
X-Gm-Gg: AYBFou3S852LUtWNkH/Fqj/S3GEXgGEsv1MCSDqJBx2zVs8lrYrX9ckb5V9fhMWghiX
	MyC8oAsC7np35mpDCJTQqJDS1LrjQvBjwpme1nEfYDKo77YYCyUEYZclYcdPLSLjVYVqgF+4Ewy
	qJzEiZjG5pzxX/n8PSd12jg6LxL2Dmdtg0TpDw1o/5PAiFnk85urAXu3BEftBAN8TSUsqG5HwvO
	inc7Po1ue3QHm1pz7wd+enwsLio5+z2MQfrsmqUATb4V1tmBpAXHjXQTK5P7Jq1gDq+WZiPwHyk
	sLqRxpZLa9uU2rt+UPKimHzFpfAGBkADMpAxboU2gtjJLO6YvrUa9U7Je+2Xnvfo7BA5p9Ly1ys
	9txgDfv5hbC24cGQNBDvwPvfBMEduc8fsXFUM6S5dHAhxBIAMA7qX1VFjGERwmfgPJ2rzT4VXfX
	+uXx3fT4gBoPOH9WwpS1xIPz9Vkk0gWgWMVpajyqjfVau4CP0L920t4RwkiBlV3koQXe1M23nGb
	yEBz6w6XG/AIo7m22CwmxfII3ISKL3qTxqBAD+NDD0KOqqWUkvB/qsv6KtKFnLM/5tvpHsXZj2e
	w2ik4ypxEO4uAYgzJ4UhPQyWnel+SLCxa1s4JdMIK2te+A==
X-Received: by 2002:a17:90b:45:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3aceefbd753mr2884766a91.10.1792302872659;
        Sat, 17 Oct 2026 22:54:32 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:32 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v3 00/21] Add speaker and headset jack support for Apple
 Silicon Macs
Date: Sun, 18 Oct 2026 15:53:54 +1000
Message-Id: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBQFf4V0bc3tA1BX/odxUW4L1Ag1LTQaw
 r9L0SjLSc7MmUgw3ppATtlEvIk2WNcvIHYZwVb1jaFWL0w48AKOLKedQjVq66gQyFDWAqRWZJk
 /vKntc01drh8OY3UzOCQ/LVobBudf61dkaffNcvhnI6NAS8kQOahSmvzcdMre9+g6krKR/0QGI
 DciT2IlS6MLIXJ12IrzPL8BlLVE8+sAAAA=
X-Change-ID: 20260915-macaudio-33c1c4f304da
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9750;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=3aMcWhy4tgojr+3EfBTSz3gENuV3a19tf7UPbpG7pQs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rklNL2/XD9/46bF9RVXtqTMFZk4gXXpjYn/A/l95
 30Qd+VY1zGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqHV8ZGU5k5/1Vn6t2f4/78i+yL195a3olMZ/ZYVH6M1JLv73omS8jwz2ZiVW
 6Rx/s87Jd8PfJTo9+5RU7BJ8yvV91LeTB9F/KVjwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225433_749050_2DD4A918 
X-CRM114-Status: GOOD (  22.73  )
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

Hi folks,

This series adds the machine driver and related bindings for the
primary audio subsystem on Apple Silicon Macs. The macaudio
machine driver is based on an RFC sent many years ago
by Martin Povišer[1]. 

The driver uses the DPCM model to dynamically
glue a backend DAI (combination of MCA ports and codecs) to a
frontend PCM. While this theoretically allows us to route any
backend to any frontend, this is not used in practice; the "Primary"
frontend is always used for the headset codec and the "Secondary"
is always used for the speakers.

The audio subsystem on Apple Silicon Macs is rather complicated and
the speaker arrangement is highly variable; some machines have a
single mono woofer while others pull together multiple woofers
and tweeters into a single stereo pair. Every machine also includes
a headset jack, and some also have their own builtin microphones which
are handled by a separate coprocessor with its own driver.

Many functions which are handled by firmware on other platforms
must be handled by the kernel or by userspace. Most notably, speaker
protection is handled by speakersafetyd[2], a userspace daemon.
Speaker protection is handled in userspace due to the expensive
floating point calculations and amount of per-machine configuration
data required.

The machine driver facilitates this by exposing a capture
PCM from which the voltage and current across each speaker's voice
coil can be read. Given that there are absolutely no hardware or
firmware level failsafes preventing permanent damage to the fragile
speakers found on these machines, the driver also implements a
failsafe that will significantly attenuate and lock the gains
of every connected speaker unless speakersafetyd is running.

Version 2 of this series drops numerous fixes and semi-related
patches that are not strictly necessary for the machine driver
to function correctly. These will be resubmitted at a later date.

Adding the required Devicetree updates for M3 series devices would
have bloated this series to an unreasonable size as they are still
missing most prerequisite hardware nodes. They will be added in a
future series.

Regards,
James

[1] https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/
[2] https://github.com/AsahiLinux/speakersafetyd

---
Changes in v3:
- Add TAS5770L compatible to TAS2770 driver to match binding
- Fix incorrect Right Tweeter prefix on J415
- Make reference to dai-common.yaml in cs42l{42,84} bindings for
  common properties
- Fix Devicetree binding formatting in macaudio binding
- Sort macaudio compatible list by fallback compatible
- Add references to fixed regulators for machines with CS42L83
- Fix iMac model compatibles (they are compatible with each other)
- Fix Mac Mini J474 name
- Rework kctl activate/deactivate to be a more pure wrapper of snd_ctl_activate_id
- Check for kctl->put before iterating in soc_set_enum_kctl
- Allocate structs on heap in soc_set_enum_kctl
- Rework snd_soc_set_enum_kctl to be neater
- Refactor snd_soc_set_enum_kctl to eliminate ret assignment
- Set evalue.id and info.id in soc_set_enum_kctl
- Guard against pointer arithmetic errors/null pointer deref in volume limiter
- Replace stored snd_soc_card with static struct
- Mark speaker BEs/FEs as nonatomic
- Link to v2: https://patch.msgid.link/20261004-macaudio-v2-0-7b47ed6335a8@gmail.com

Changes in v2:
- Drop patches that are only tangentially related (will be submitted
  later)
- Drop wildcard-matching API for kctls
- Relabel J473 sound model to Mac mini
- Align Devicetree changes with upstream bindings
- Relax Cirrus CS42L42 required properties to keep DT style checker happy
- Define missing properties in CS42L{42,84} bindings
- Fix mistyped DT properties
- Improve macaudio DT binding description
- Drop generic fallback compatible for apple,macaudio
- Drop now-redundant descriptions from other compatibles
- Constrain DAI link link-name property with an enum of valid values
- Drop MCA node from macaudio binding example
- Fix heading comment style in macaudio
- Drop obsolete module parameter
- Replace string functions with safer variants
- Replace dropped wildcard API with searching for full kctl name
- Rework idle props parsing to better surface errors/invalid Devicetree entries
- Add additional locking to backend setup
- Take controls_rwsem when safety functions are called from workqueues
- Replace all mutex{,un}lock calls with guard/scoped_guard
- Fix incorrect amp gain value for j37x config struct
- static const-ify all config structs
- Cancel control lock update workqueue on teardown
- Drop unused DAPM widget
- Fix commented-out safe volume calculations
- Drop speaker lock kcontrol ownership checks and related core API extension
- Link to v1: https://patch.msgid.link/20260920-macaudio-v1-0-741cc20a74e5@gmail.com

To: David Rhodes <david.rhodes@cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Martin Povišer <povik+lin@cutebit.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
James Calligeros (16):
      ASoC: dt-bindings: cs42l84: Document sound-name-prefix property
      ASoC: dt-bindings: cs42l42: Document additional dai-common properties
      ASoC: tas2770: Add compatible for TAS5770L
      arm64: dts: apple: t8103-jxxx: Add regulators for CS42L83 power supply
      arm64: dts: apple: t8103-j274: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j313: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j293: Add speaker/headset jack nodes
      arm64: dts: apple: t8103-j45x: Add headset jack nodes
      arm64: dts: apple: t8112-j413: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j415: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j473: Add speaker/headset jack nodes
      arm64: dts: apple: t8112-j493: Add speaker/headset jack nodes
      arm64: dts: apple: t600x-j31x: Add speaker/headset jack nodes
      arm64: dts: apple: t600x-j375: Add speaker/headset jack nodes
      arm64: dts: apple: t602x-j41x: Add speaker/headset jack nodes
      arm64: dts: apple: t602x-j47x: Add speaker/headset jack nodes

Martin Povišer (5):
      ASoC: dt-bindings: Add binding for Apple Silicon Mac audio
      ASoC: ops: Introduce 'snd_soc_ctl_activate'
      ASoC: ops: Introduce 'soc_set_enum_kctl'
      ASoC: card: Let 'fixup_controls' return errors
      ASoC: apple: Add macaudio machine driver

 .../bindings/sound/apple,macaudio.yaml   |  212 +++
 .../bindings/sound/cirrus,cs42l42.yaml   |    7 +
 .../bindings/sound/cirrus,cs42l84.yaml   |    5 +
 .../arm64/boot/dts/apple/t6000-j314s.dts |    5 +
 .../arm64/boot/dts/apple/t6000-j316s.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j314c.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j316c.dts |    5 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |    5 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |    5 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |  135 ++
 .../arm64/boot/dts/apple/t600x-j375.dtsi |   65 +
 .../arm64/boot/dts/apple/t6020-j414s.dts |    5 +
 .../arm64/boot/dts/apple/t6020-j416s.dts |    5 +
 .../arm64/boot/dts/apple/t6020-j474s.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j414c.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j416c.dts |    5 +
 .../arm64/boot/dts/apple/t6021-j475c.dts |    5 +
 .../arm64/boot/dts/apple/t6022-j475d.dts |    5 +
 .../boot/dts/apple/t602x-j414-j416.dtsi  |   35 +
 .../boot/dts/apple/t602x-j474-j475.dtsi  |   10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   72 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts |  116 ++
 arch/arm64/boot/dts/apple/t8103-j313.dts |   87 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts |   43 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   43 +
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi |   32 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |  108 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts |  132 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts |   62 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |  108 ++
 include/sound/soc-card.h                 |    2 +-
 include/sound/soc.h                      |    6 +-
 sound/soc/apple/Kconfig                  |   18 +
 sound/soc/apple/Makefile                 |    4 +
 sound/soc/apple/macaudio.c               | 1715 +++++++++++++++++++++++++
 sound/soc/codecs/tas2770.c               |    1 +
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |    4 +-
 sound/soc/soc-card.c                     |   12 +-
 sound/soc/soc-core.c                     |    5 +-
 sound/soc/soc-ops.c                      |   99 ++
 40 files changed, 3196 insertions(+), 7 deletions(-)
---
base-commit: 74612d0b448fe745e80cda87fe49ac3c102ccc1f
change-id: 20260915-macaudio-33c1c4f304da

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>


