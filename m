Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9344FC54E51
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1kXm5bhwE0RIFKLS+klmit5NTgkdIxAJX8Ps6s9DZUw=; b=BdNfVkG3UjntcW
	fDLJ3R18JtEY9IbLlQ7NGJ7TmAZMvZASPTLy7yaAv082CzMtGsMlVnxjjNByfWjtb4Eaf3ij+HE27
	Ognlyjd06n69fhoiMQBBIcHQnSSTsXgiSODhRBSXA+WvlmHckLJYnQaGLxEfdY7BRYqukvSE8LQJM
	Oea1qiKQwmGn4LsDaSuQ5e9mU0TY5ORS2j8yf2y+y9PbnWInOL5/gNYRQgEcutBqnAM5+kJSJrGIJ
	O6sXx1wk+ysjQuhLpcurPHXIKGeMOkWe6NAREXmzM4j+aOU5M21WFjBUchaBH3lhCOYkvCDJsrjU3
	rfC78KpgoKLf/RzewNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reciS-00000001N9H-437P;
	Mon, 26 Feb 2024 15:16:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYo-00000000ydE-1LsE
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Feb 2024 14:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1kXm5bhwE0RIFKLS+klmit5NTgkdIxAJX8Ps6s9DZUw=; b=KdSOM0NloFSzVwfyhqJQyZOZtU
	l/ml7MfeonW2bjdFtYjyLwBrgDMuVDJALoxiY1nYzUATALUDpwe/eoMrEpB+i3yNsfUFpzpclRZlc
	tmP41PljohfynKAIP5/fQiv/3njW24W9ZGYvYem8nDGKZlu+8II+1jsEWlh2H+2b9uW3ZUvzj9l1H
	t/JyrO/itJHZRX6LkmgipUrBjvWhIQyCaD2xHqo8OymaCOS37NU4DMksNsA7rqedtrEeNObGhSL1n
	uFr4fyF+vn/sc/7Izd5C6NtMiE7ihEC0MpsN11G56eg/vinJwk05G8WxbiLDotnQ0ZNpH4Gq9DvRz
	hJLmzThw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYZ-00000001ETV-0MQQ
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:24 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-412a87f0d8eso2798535e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956127; x=1709560927; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kXm5bhwE0RIFKLS+klmit5NTgkdIxAJX8Ps6s9DZUw=;
        b=yInY3o2xGcfsUZ+bId9zvn645cVfW0rdl/0wylIKRiQOEKhXQhSJOyuzpV7jZRo7yo
         zmY0weTqfXue+tWVA+FKp+ydV3Jz8vns3IWnfl5/rPPq0WSI94JOtXabNADtHO2W7y7Z
         VFLJniEjQRrV3nO6H+7gTmz0ly+Zl+aXqQix34zmjdjYn9X+NSx/qgJ1y4JL+2YV1uAO
         YzSxY3T3SAD0+DFjVgz944E0Th4zbahpC03Oaiod07jxnqfRkuu9bpso8ul84uwsjygZ
         W43mfRie1tM+UREQNail0Rg2TyKV8jobt69L/cEmyM17DSmK9MVpTpkPxb1Z3PihaUKN
         mRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956127; x=1709560927;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kXm5bhwE0RIFKLS+klmit5NTgkdIxAJX8Ps6s9DZUw=;
        b=ndi9FEt2/8M3JyiMw/TwJVMctV4U9HYF1FmmPSze0nhpRDnlAJuDpoQKMSN6IoTn90
         +wxOlikeZ8M0Wm4/alDINgpF41+XKop02EZzq763m+b4EMyBXpnR9Cv+XM5xfwjxNjRs
         E7ijgRFtPdVkd9h0VY4FEmRnkr41JBFqMExqQW8IsM9y3/1cUBwfVOLmYZCE9weddRNf
         aOlOSC27j098k0o/g2ODEPq9NL/u07bFOWl9He1RyU8/ayw9gt9Lhfd5O2kxfZ9fL6qo
         2CuQAY+uS818sYC0RkbCYVOVebhkgBEhQW95JJkbNyVkdz7ABvY7jwH+/ThO02rIlGo+
         BU1A==
X-Forwarded-Encrypted: i=1; AJvYcCUEbuW75+UMoeD95P6PlIDFkqfmC56k5oMlUK9H7s1MWMmq1RusyOENYb7BJ6vYfD0DDee7rkIcBAF+QliZrHRJsJ64ffqLBTuJhn/VPkeb4gJ/
X-Gm-Message-State: AOJu0YwLC8NVY9KOT8NvGosvlot9boPR91GwUvIstKW9eT1NzgHEPf1i
	TLjcwidlzyRak8DlHsYrrF1QElsuBjSmb4YJVfvLw7XXEmkAB/Kf8BP3J1rRmnQ=
X-Google-Smtp-Source: AGHT+IGxhQkl9Xqk2as1WdZDuKZznJImfUbVUhJLg9Dl69bLd0mMxQOlNl7tJbZdZSMC2T0clhx0uA==
X-Received: by 2002:a7b:c459:0:b0:412:817c:364e with SMTP id l25-20020a7bc459000000b00412817c364emr4917841wmi.36.1708956126570;
        Mon, 26 Feb 2024 06:02:06 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 00/18] Add audio support for the MediaTek Genio 350-evk
 board
Date: Mon, 26 Feb 2024 15:01:38 +0100
Message-Id: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMOZ3GUC/x3NQQqDMBBA0avIrJuapEZCryKljMlUB9ookyoF8
 e6NLv/i8TfIJEwZ7tUGQitnnlIJc6kgjJgGUhxLg9W20da2CpfIk+Kb06ohYyJq78k5KKDHTKo
 XTGE8CH5IhoTfem2vXkkw9Wmf4U2YlvkQs9CLf+e+e+z7H1s9ilOOAAAA
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3544; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=zP1cF1mgMLFjF9Qj79hddJ9+2MDw+VU8qnc4hJ6MA+c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JnboXUAMF+d1Pz/oxJlDp69tLo702vaeLTtEvz3
 Zs54U5iJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ2wAKCRArRkmdfjHURf7dEA
 CMc6/wfi/2TzT8m4kxe9uHkWXnmfVn8cMY1YQ/FMS4X65BJAh4PE5cSprnuKt+voatzOKr85v3ee7w
 cVEroPkVPySozdENDx/SoDfTd5A4upnm10iuMq6gccPYG/Aah23WwOXsuaKqtNjrkdeEmfyFoTxfu6
 jk+Grduq0B8+5hMC8OKKu6Vd33+oEblbSK5/0mvmtK3ztTt6wWq6TDBF/0KkBeVGXIQKy/1C3jHV8I
 vlIqSfEmHOT4vaUunm9J11XyRb6fIiVJ6cndJ+vi/FbBH6okKqufmwFuBuL1TdxSZyQkU0BY6M6BDY
 fZDD3k0Kgoux87c4tgFJJISAVFLCqbKyWTpvLc0lYNphbICyl50RnLyXrDOiOd7rJK7gfy5Gmgg6Qy
 DJxUROkZF0nCvpncUQFPBNVbrIBNbXNAV25DDG+b2BiZeBwnkRsT4b1ehNK8cqg8lpkJylY28Y3msl
 rD+88VGE2PDXtuOlfan1IGfcwOAXyJLB2lYbc6sty2yWMaNM0uVctSwHvsRKReA4EOvUxnQyGaauqg
 Y0q3s/vBKUORMb0RUABnpUoTSC2v875meO3LhXRrlqw3HFt5TJM1YtP4BlyIRTPyIucWiJTTqJKHAe
 U3GiLPL+dK3MeZIBisMzUY3gT3jDvsIuQJ7fco/aWeWkwUpWEYfZ+LVdlnNA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140212_639829_DA2A10AC 
X-CRM114-Status: GOOD (  13.60  )
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

[1]: https://lore.kernel.org/all/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (15):
      ASoC: dt-bindings: mediatek,mt8365-afe: Add audio afe document
      ASoC: dt-bindings: mediatek,mt8365-mt6357: Add audio sound card document
      dt-bindings: mfd: mediatek: Add codec property for MT6357 PMIC
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

Fabien Parent (1):
      mfd: mt6397-core: register mt6357 sound codec

Nicolas Belin (2):
      ASoc: mediatek: mt8365: Add a specific soundcard for EVK
      ASoC: codecs: mt6357: add MT6357 codec

 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   |   11 +
 .../bindings/sound/mediatek,mt8365-afe.yaml        |  164 ++
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     |  127 ++
 arch/arm64/boot/dts/mediatek/mt6357.dtsi           |    6 +-
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |   95 +-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |   47 +-
 arch/arm64/configs/defconfig                       |    2 +
 drivers/mfd/mt6397-core.c                          |    3 +
 sound/soc/codecs/Kconfig                           |    7 +
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/mt6357.c                          | 1805 +++++++++++++++
 sound/soc/codecs/mt6357.h                          |  674 ++++++
 sound/soc/mediatek/Kconfig                         |   20 +
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/mt8365/Makefile                 |   15 +
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |  455 ++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.h         |   55 +
 sound/soc/mediatek/mt8365/mt8365-afe-common.h      |  495 +++++
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         | 2347 ++++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |  355 +++
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c        |  475 ++++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |  901 ++++++++
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c         |  298 +++
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |  379 ++++
 sound/soc/mediatek/mt8365/mt8365-reg.h             |  987 ++++++++
 25 files changed, 9718 insertions(+), 8 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240226-audio-i350-4e11da088e55

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


