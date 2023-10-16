Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A2FCDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 08:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvF2PcqRl9KSZwBr6MB/2HHkdrTa98SVPuAoc53btQU=; b=OqsVbLJYll0yAuDgBtLEYUw/qv
	FecCdt/gBFPEatlXokWLupVgEvcjrjvBiOO9+Bq6leNHoZRYygD4r+JSfFtLCXp6pdDjWg3jZ9r2i
	ExY2NtlnA7tyWbJLLhZt/i9WVQFRV0WwvIeLQSGzOluYkovhVeMGwaO9X8kZa5NJ8MwHIG8mc2Wjf
	WMcHxw+M5lKuRoA4YxtagELIFTJk3oIxN2YqOk1Op8fSBlonT9nu5LDhkf0GK5SdZ11vHmZeHYOIN
	TcbG4XolwoI5I97l74tTVa14OC6E3HZT2oEknXotSAeQ3RLl5Ubo2uaIlF6RU16EA4Kq4ntap0/ov
	Yknqus4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIYc-008k8g-2k;
	Mon, 16 Oct 2023 08:02:34 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIYV-008k1Z-1f;
	Mon, 16 Oct 2023 08:02:32 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so7257968a12.3;
        Mon, 16 Oct 2023 01:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697443343; x=1698048143; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvF2PcqRl9KSZwBr6MB/2HHkdrTa98SVPuAoc53btQU=;
        b=lFYN6vzxtXinJxwzsio4ydvxq8wsY9uQ8xfdDYa7TfQRDmn+m01FZsZROjyygxcSgS
         uziGffZVx8Wwrw+PeYN6EtYLrT8hCcKdEJavpDxqQK7GE//R1XWt/F8U7mipKmzpg81O
         SNhydZcFi1niwTNZXDpXo3FMjIELrmVz0wosiweqaMMJB32X8fxOZqxlpGKDUoCcmSr7
         5VllC71xVdMyfPzsi8JfXyEOnJMGN6RLMzTrc41YxovtSljRjUqAbwEyGG7bWqkqMrvM
         IhWELD2RhLXOzagRViDKNWd6yC/8LfDxCv5eZdG6YsfaB2TyzzVPq+zFnFFdAIRc+UEM
         ghOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697443343; x=1698048143;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvF2PcqRl9KSZwBr6MB/2HHkdrTa98SVPuAoc53btQU=;
        b=wUS20074Zb66xuDYv2CTuuiQyMUlL+xmcrB5vIcO1yFVH3z5R4UC64I+kdB7tOSLFF
         HLQCCPKroL2tbgd+g71yQ/SP0EPnoC/cVEjwNNZvlAAHyx6s2+ZbZwDeY2UOectd+xVs
         taZ4q6j+b2ffjNVDzCUPBrOJvz7iOkooEjtOMpvWC/ID6sQmrGtzl3NvAbyPGGFEMvxR
         mq8awiRnX9nDZpr6Lmr1fQtQyimojbk7e58od5UcBLA2kk79olsACSIsrMN5XsG8McdY
         NyOl2oHNvgNAvRHldaHK3UKVmDESw2qXDrqQ6YslCFWusMArZ79yZbb8JZUd6GjGygKl
         oeMw==
X-Gm-Message-State: AOJu0YwKlT3cDo1pR8uacvt0aaAMYa+5tPikRqmnC54gBvy9zKYaVXzo
	kbdkWB6gsRiJ3s4QOGgxZDM=
X-Google-Smtp-Source: AGHT+IElTsjn90fwq4hatmt/dgv1pYY/XJlmk6y+MMUK7RR8JqCX9MwWGnjQLP+uu5RVV+AOlO0f2Q==
X-Received: by 2002:a05:6402:5192:b0:53e:2b80:2f74 with SMTP id q18-20020a056402519200b0053e2b802f74mr9645102edd.0.1697443342650;
        Mon, 16 Oct 2023 01:02:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id u26-20020a50951a000000b0053ecef8786asm1190691eda.75.2023.10.16.01.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 01:02:21 -0700 (PDT)
Message-ID: <a2cbe324-9226-1d9d-2e7f-3ce7fcb706a0@gmail.com>
Date: Mon, 16 Oct 2023 10:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [GIT PULL] arm64: dts: mediatek: Updates for v6.7
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
 <ae62c7e0-3e72-403c-abb4-569573037980@app.fastmail.com>
 <aca26ff7-801c-65ad-0cc2-fef8a4f74e27@gmail.com>
In-Reply-To: <aca26ff7-801c-65ad-0cc2-fef8a4f74e27@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_010227_556075_FBA85482 
X-CRM114-Status: GOOD (  29.71  )
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

Hi Arnd,

please find below the new tag, based on v6.6-rc3 this time, sorry for the mess.
Please let me know if you need that in a separate patch or not. I'll no go 
forward and delete the old tag.

Regards,
Matthias

---

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

   Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.6-next-dts64.2

for you to fetch changes up to 976868a021ee654f4cf6eb6a2f40f95c78c04093:

   arm64: dts: mediatek: cherry: Configure eDP and internal display (2023-10-16 
09:55:08 +0200)

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

On 16/10/2023 09:52, Matthias Brugger wrote:
> Hi Arnd,
> 
> On 13/10/2023 22:40, Arnd Bergmann wrote:
>> On Mon, Oct 9, 2023, at 12:34, Matthias Brugger wrote:
>>> Hi Arnd and Olof,
>>>
>>> Please find below a few patches for the 64 bit DTS files targeted for v6.7.
>>>
>>> The patches were picked up with the help from Angelo.
>>> With these changes we have now support for the Genio 1200 EVK board for IoT
>>> applications. Also the MT8365 from the same business line has much more support
>>> of peripherals.
>>> Also support for the new 4th revision of the Acer Chromebook 514 was added. The
>>> difference with older board is the audio codec used.
>>> On the Mobile phone side of things, support for the Helio X10, which is used by
>>> the Sony Xperia M5 got support for the display.
>>
>> Hi Matthias,
>>
>> The contents all look good and I'm happy to merge them, but I noticed that
>> the branch is based on -rc4, while my soc/dt branch is based on -rc3.
>>
>> Pulling it in would slightly mess up the git history and the 'git request-pull'
>> output because of the backmerge of the mainline contents. Do you
>> have a hard dependency on something that went into rc4, or can you
>> rebase the branch to -rc3 or earlier?
>>
>> I usually recommend using -rc1 as a base unless there is an important
>> dependency on something that was merged later.
>>
> 
> AFAIK ther is no dependency on -rc4. I'll send a new pull request based on the 
> correct -rc3
> 
> Sorry for that.
> 
> Regards,
> Matthias

