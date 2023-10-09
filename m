Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E6CE95A8E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:From:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9YUkzYC9b2rzdqnb8rIk9Q53PP7Dw9g4wRmdWVmjnTs=; b=ylfkhzhG46KmlS/uYO7wQuN4tS
	V5HQZleV6TiUF8Ot0mOfqPympLAYrh+x9d/Co0juYP92X/P4qwyqg4CiLEVMIHKM2IRDnozCql0bh
	Ej7PZdwLS4COMddhvHh7ly6WQNtW1dKITVo5f6lz3BDQK3/RArJfDDCObI6R+yK3PDEHAXX/DLqAz
	vf/6PiXaRfDCiSASR2vSM4gZoh1uHZywj53SlYYRR70aPxH39AOEb14RnLk+Ek9vDbPiDSg0zq6hD
	RHa5HPKDlv30CTEY6brrYrO0aKQAx+XKYMuiRQZ0ISHgr1VFYB4xK10Q50hUhtqX+AtSPsHA9z8qf
	765ussvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpnbM-00AEoe-2s;
	Mon, 09 Oct 2023 10:35:04 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpnbI-00AElw-2W;
	Mon, 09 Oct 2023 10:35:02 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9ba081173a3so369029166b.1;
        Mon, 09 Oct 2023 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696847697; x=1697452497; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YUkzYC9b2rzdqnb8rIk9Q53PP7Dw9g4wRmdWVmjnTs=;
        b=QhpST0DK3rDJaPLodPKSiquKrhgK6aCuRimxtY/JRGC860XRwqgYhQDbn/QPBgAxPm
         FZVBwi4kHDJPej66C35+WcSK7aWsvl0sPTPZU0oqKLylEkdFH4G7eOGzXpBy0511ZqFw
         OFu9scmi7MqkF7VHf2jVPTJ07wzgyoBB7KkBQLaeXd1epiV6wcGGd+7If33knm6ju0Fn
         c2A/TeniyZmnIZsdSFUmk1LXWzjb6V0yfObYxYlbu9j5HiV2cdfgR4XyO0Wk7XzwWEtk
         aDbJ1/TIPYrdbQ/nlBykZtQGEiLCoq5Rt5CNw//dVvb828ecgJrBP9o9dv+MAkDjZBoG
         9IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696847697; x=1697452497;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9YUkzYC9b2rzdqnb8rIk9Q53PP7Dw9g4wRmdWVmjnTs=;
        b=JA4ZPdiL/52YPx5Tz2VSfb33iSszXwsJXwXh2RS8AtLvsiUYQ9aKDgT7WPecxrVigk
         eoG//q/slDNvCdayKCfntCGN9pIDjvJbv+ZDGIimH4DzXgyEiDGCGmB4erR2ujTNLqJI
         mJ9bANUvs6ctdQX527iGDsO/Vt3FW73U+5GN2wwjADMeaWjmQaf4ZxT7FHB+ZEov+OOi
         g+qrSmL6XlacJucITnB8NY014NdEk6rqoe802ZyVruUd1P6e6kRo2h7Q0IOpiKNdRmGI
         8Jsd0fOyU1GxpIb7Q7ikY/DvWDZ9V8Za2v7RTyYHyc0Rz93J+pqlePwcFsXDAa27DmK6
         cvCA==
X-Gm-Message-State: AOJu0Yxbwx2jWwLpCqoZ2w7EVuE+NCNQzypz3iriadF2Y+DFRJ4tsruf
	e/lObZNXcCd/JmxWL+Y8qmg=
X-Google-Smtp-Source: AGHT+IGhKD+tXQcKdNKjbY6RRzyK2L8mvDla0H42TWnRcIxtPBO5ZpdJqMO1b1fI2w0jBfTUxDURvw==
X-Received: by 2002:a17:906:1097:b0:9b2:b786:5e9c with SMTP id u23-20020a170906109700b009b2b7865e9cmr13153248eju.28.1696847697183;
        Mon, 09 Oct 2023 03:34:57 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709062b0600b009ae57888718sm6484722ejg.207.2023.10.09.03.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 03:34:56 -0700 (PDT)
Message-ID: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
Date: Mon, 9 Oct 2023 12:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US, ca-ES, es-ES
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Subject: [GIT PULL] arm64: dts: mediatek: Updates for v6.7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_033500_843574_B4D1C4F5 
X-CRM114-Status: GOOD (  17.12  )
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
The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

   Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.6-next-dts64

for you to fetch changes up to 252d6a178ee3df2984194b3579851b00cbe8cdbd:

   arm64: dts: mediatek: cherry: Configure eDP and internal display (2023-10-06 
11:10:18 +0200)

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

Macpaul Lin (2):
       dt-bindings: arm64: mediatek: add mt8395-evk board
       arm64: dts: mediatek: add device-tree for Genio 1200 EVK board

Nícolas F. R. A. Prado (5):
       dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of hayato
       dt-bindings: arm64: dts: mediatek: Add rev4 of spherion
       arm64: dts: mediatek: Remove asurada-audio dtsi files
       arm64: dts: mediatek: Add hayato-rev5-sku2
       arm64: dts: mediatek: Add spherion-rev4

  .../devicetree/bindings/arm/mediatek.yaml          |  16 +
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
  16 files changed, 1749 insertions(+), 69 deletions(-)
  delete mode 100644 
arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682.dtsi
  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi
  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts

