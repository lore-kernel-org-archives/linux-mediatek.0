Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39719CA5FE6
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h7PcSBlvnmt+J9sgVvOc70qdQQS5yk/hCyycOuso3QM=; b=1LDrMToeaWnr0T
	+EOv4fo59/x7zZN3U5R+f9QhRY1tYXuGk2480rFyiVXaBNoQfFO/c8YFKRiOtfETmt+7GkSWbCKhz
	/wlKw6kDkStvldt7kV/uuQLTIzZLNFghJzZlMynjkInmzWaDKrum9/VSNugETIo5N5QNvPy3AFjr2
	oRR2l2xXfBDDOembfeUWHawLx5a442CKvcEpa1MWhfk3faqUwiEdDL2CSxe2pTxGwbCg/Cyj1UG94
	BUb4SP9pQzBI6m2n6GPi9f19BWewoxHhp68k2x9z1UcwqXqOC/Yu0FUgGIcYiJ1MGkT/t7plocFwb
	6L+2+KymctQSAMrXU23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFL6-0000000ENFt-00A3;
	Sun, 04 Oct 2026 06:04:48 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFKy-0000000ENEh-2ERW
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:04:46 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so107744a12.0
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093879; x=1791698679; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h7PcSBlvnmt+J9sgVvOc70qdQQS5yk/hCyycOuso3QM=;
        b=IsDpY8kVZAXPku9ImxFAbEGVIvnCkS9OFzqm/jxLwm8MQII9/RSh6q/qmRpnyKhIbN
         AVKLSA8tNvYN2g2WcBK0XYrVOJDNIQqIvBHw5vYx504+/fIWCiIN7Zn7PX8JNnNe3NoB
         bUu6tckyBnL+6xuY3RwIkkSFheOJdh6HnT1m07R/d+i7j3km0EHpVdQGZL56C8ZSaHNI
         PplbzxKCqTPs9IgSOCz/UFDfFxbLaQS2bf6Dpa7MPN84sK77N+dG4TWf7b3Q5uT6rRJr
         VQ6dIhyN+Db72B3PwtUgqgI3lxc+zkD0Y2nliALV9oedmWDmZVRE7HS4TcCPV3sG5ZBz
         jcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093879; x=1791698679;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h7PcSBlvnmt+J9sgVvOc70qdQQS5yk/hCyycOuso3QM=;
        b=0eUayEOkN5My2nVsHwudATIudtFJmtIb4QqQMVcb0CU640mC/EYYtB/u84KPslM380
         Mv4onMYluasHm0ExEXw5uOCbQ4P5E2bNSHSVa/tzgB/Kltisvy6JguClXTUuAD1lEQpx
         DDQ0I1IA8ZMmNREe6TCthstUpfG0SgznTuM8DdsJX1RI5SkjdSgJ8JLPHmFAiE/quQ8Z
         eMGRrmvkyABvVIOa2DZcw1vb20ITPLLM7oni+X/9KLfeDVGwIlGbgfBwwanS1OGRHtW+
         vUg5ZYQse/omxgcE7kAM8CnPSVWFGubGbhMNmoHMkn/HUIFlyKaJHLiorHLyGfQZARzu
         BLfw==
X-Forwarded-Encrypted: i=1; AKwUvBzDMRY6iD7CNKCy4n1chKPjtzfeOYKk/spTVnwhhlDHo7QaSykyY2Ma0yGwPzEPro5NuUZRxk7eENxPI3NLNA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL174vHsOWT0rdjXMGRUdHj0YB/FDufPlDo+offL3Or2omOx4JM
	vR2c/gNnzSOVQA13NxpGo2Tl9s5ZSaipypGy9XuQs0xt7efuGTlEDNhq
X-Gm-Gg: AYBFou0/9xMGiOVUt0RfQFqHkWKxOuQ+3dl+U4UNOcnNB5b9xdvK2FhQzm5YKpEZLvN
	9bJU0iCj/VFD17dQXyKBq6w6BUzLKZT+S/zQ9Cqbc2Stj/9a2dF0NVcS1zkBerb+BZDoUImRO1g
	d9Vy+qGnnFcEBs96/3U5iUizC5M6CC2n/dQ/6Hf/M7/9GOVx4Fri3TG8U0AAjZgT6vjKL9/Jrt8
	F3cVen6h1iL9t2lGJBQm6LP//z+1a3Kh+M767ayW7THrRnlHbav9m61xjZMlUKv7X6VNcJhlej7
	ZUkOhHH1e9UIRPce//ZY09kXA8x7+I5jdqNOh6e2hDJN0Iv29iM5cZeo+Z2CJUWAsxydFnytca9
	F3RnXJoUmfaMs1ceMtDz9vKuTnZ70XNAPSE4Pwkn5K1GDeMJhgkfuHnrTr+lC0kzFbrFcY3DeWe
	1C1rSNnMDe8XpwHTA0IbRhXsY1lVsq+rP+mTF29/Q//yATtu61RQOcda++2bMMh7y9ka5PygYx1
	Ky/Ulx/IpZqG+5alqu7114knoBan2WzPg4yfL/p3pVHVdFdb6ZY/Hn/EMXC/pQ3UjLuaK06FTxM
	IAsQIWpRLsJEgpuoSjaLAT5fN7pry5Ic7ruN081SxslOBA0=
X-Received: by 2002:a17:90b:6c7:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3a6ce97d00bmr4270747a91.7.1791093879144;
        Sat, 03 Oct 2026 23:04:39 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:38 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 00/21] Add speaker and headset jack support for Apple
 Silicon Macs
Date: Sun, 04 Oct 2026 16:03:27 +1000
Message-Id: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ6CMBBFr0JmbU1bikRX3sOwqNMBxgglLRAN6
 d0FNHH5kvffXyBSYIpwyRYINHNk36+gDxlga/uGBLuVQUt9kmdViM6inRx7keeo0NS5NM7Cqg+
 Ban7tqVv15TjdH4Tjtt+MluPow3v/mtXm/bJa/rOzElKURiFqaUtDxbXpLD+P6DuoUkofFNBi6
 LIAAAA=
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8568;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=InItdihPvue7KhBnmJaCghTk7rJnuaesPMmkASkU+Ns=;
 b=kA0DAAoW1DYy0VH3eWAByyZiAGrB7GejxJ/BY+XQc5ki3nai1coeDKk54HL6FwSs+x8HSeZoG
 oiRBAAWCgA5FiEEsIISSJsyBtmPFHm91DYy0VH3eWAFAmrB7GcbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJENQ2MtFR93lgTzcA/07o9jzZVCe7oiVoo4GLoAlryGIXkgrMlK/oeh3ub7r
 aAP41EmVnhb+0m1VzqLvSeTfgVll3CIMzOx5GM9pqdyrvBw==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230440_572989_A26A3785 
X-CRM114-Status: GOOD (  20.20  )
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
      ASoC: dt-bindings: cs42l42: Do not require chip power supplies
      ASoC: dt-bindings: cs42l42: Document #sound-dai-cells property
      ASoC: dt-bindings: cs42l42: Document sound-name-prefix property
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
      ASoC: ops: Introduce 'snd_soc_deactivate_kctl'
      ASoC: ops: Introduce 'soc_set_enum_kctl'
      ASoC: card: Let 'fixup_controls' return errors
      ASoC: apple: Add macaudio machine driver

 .../bindings/sound/apple,macaudio.yaml   |  210 +++
 .../bindings/sound/cirrus,cs42l42.yaml   |   11 +-
 .../bindings/sound/cirrus,cs42l84.yaml   |    3 +
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
 arch/arm64/boot/dts/apple/t8103-j274.dts |   67 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |  111 ++
 arch/arm64/boot/dts/apple/t8103-j313.dts |   82 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts |   38 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   38 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |  108 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts |  132 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts |   62 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |  108 ++
 include/sound/soc-card.h                 |    2 +-
 include/sound/soc.h                      |    6 +-
 sound/soc/apple/Kconfig                  |   18 +
 sound/soc/apple/Makefile                 |    4 +
 sound/soc/apple/macaudio.c               | 1699 +++++++++++++++++++++++++
 .../soc/mediatek/mt8188/mt8188-mt6359.c  |    4 +-
 sound/soc/soc-card.c                     |   12 +-
 sound/soc/soc-core.c                     |    5 +-
 sound/soc/soc-ops.c                      |  103 ++
 38 files changed, 3121 insertions(+), 12 deletions(-)
---
base-commit: 74612d0b448fe745e80cda87fe49ac3c102ccc1f
change-id: 20260915-macaudio-33c1c4f304da

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>


