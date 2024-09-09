Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4650FECE587
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 20:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vbR0PZLn8KEJqZCbPZ7+I0eYG+gLo1W6JWcnEjwvfiI=; b=hM2HmgqSW16HYcoG/A8JXuWrK8
	ZSxMyU42at3bXLuopzgiVqZ+gjze/u5B+8493ClsDje43DekWHsdITpXeYmo4as1v4W44xH8wFqeR
	3CUW87+ynVePcA0lSLqHCVMwvFZsW6htavJdbxB9NxvO/GLSm5iilgo5rBom5bv7Nnq5QIA5gK3Yw
	ZupXtjNfCdbSLaftM+IAlgrTxjnItJMbk5PydMVsV6dfK3wmw+U73/BWfSysfpETMSRr2IP1FaBnT
	lAGj608V6Fkhn4KBV3DtsL/4rjGcK6BnO9+Ba+/FSkHmUNhwIsjd4aSJJSvWP+JJHoYSb3D8GKST5
	uv89ZR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snknF-00000003C31-1EYG;
	Mon, 09 Sep 2024 20:15:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjhg-000000032Mg-27gT;
	Mon, 09 Sep 2024 19:05:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-374bb08d011so2704799f8f.3;
        Mon, 09 Sep 2024 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725908734; x=1726513534; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbR0PZLn8KEJqZCbPZ7+I0eYG+gLo1W6JWcnEjwvfiI=;
        b=GtTfRDmDoLzf0I/NhJbahzYTeGGEU/PHYU7M8S3Vq31kXbv4zzuDiSJ0pHOTf73tt+
         Aw2vfNMSx0cizcrW6jo3t23VO26WBmDvRTzjL/rmI5+xUO4lZbg3Klgt/9bQtZx8AiWZ
         A3ZAmA6XG4d+/wUC9hhwQOCzN+wUM9AxzHNf0gjPPdN5o0UT4kJowxKpJ9vs1OMXaP3z
         FYrnIKtJL5Uj9+ZKYGo+E1V3ZFfsb+fSPdMlntuqeGxuDaMYGMtvBWkCOYOvkBBwyK9T
         rlZSGZCV5bMhTtU/zAeLOf1npt9e7Nl5bwPohVmlgOvDho0as6mqZ0z/ZexWuKxbvSY9
         sp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725908734; x=1726513534;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbR0PZLn8KEJqZCbPZ7+I0eYG+gLo1W6JWcnEjwvfiI=;
        b=AQJMHdVeMxKfFLL9vUkNOGiqw79UZ5m6eEaEDG9zHIhko80mdevj9qe0tUgLXrvueO
         UDe9/oqorZvJu9ADFa8eoo1DNgRElOeb5StBw7RQs5ElloKH7Uq8Y/LvujbHY7XZUJzA
         JML5alrflduerc01RsUWiEfcQmjJZw9jY7n+98NtaVF7HIQSxfQ1ARFELchsfSd/9uyh
         9YWnEGh2Bf59qce1QUCxsvKZQKyqEUIRMJfnprvZKYywP6BHAMagVp+H8unV+S9TYHj4
         oUEGK7x8OHJ6RiTxOcevdW7o5hSz0v7jmEJpmc4Xgfz/xNj/B9DDOR3cAWiRytZgu5oV
         doVg==
X-Forwarded-Encrypted: i=1; AJvYcCWdAgqKNUXVVYxwnicGmfttBA8Qrr6xyvaWzxqzrLFoO+51r20vR0yI8/U1yH2PPgJY8Ke1xgtzgODyUdfEiS71@lists.infradead.org, AJvYcCXCh4bIjtMgiZXmUbqvAZK5IbHQcgXFUh3W29NtaYF0othoT6D5X70UP7JbLqOmAoZXHNKuybXIBRfGJvgXu54=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpVSakCpG8AZhcALZhZAQDSfcv945DirbJH1BKqhEcx8/GrY1u
	0DXL84iZpbITZ7apK+nu8Wnxn/DcUfUYkrfI5ydL8ylBFNNw7eYJ
X-Google-Smtp-Source: AGHT+IH0TzUYyYsevLleC+rS2ZAVnsx+hOwAP0rCTluKg89U8LDqEzQqbMrX4w5CBJ2m57ApYZDNPg==
X-Received: by 2002:adf:e3c9:0:b0:368:74c0:6721 with SMTP id ffacd0b85a97d-37889674a48mr7141512f8f.38.1725908733434;
        Mon, 09 Sep 2024 12:05:33 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c9a5eed16sm125075245e9.0.2024.09.09.12.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 12:05:32 -0700 (PDT)
Message-ID: <059656ad-5365-4097-86a1-f4ba43edf5da@gmail.com>
Date: Mon, 9 Sep 2024 21:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek arm64 DTS updates for v6.12
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_120536_573647_B82811E8 
X-CRM114-Status: GOOD (  15.38  )
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

Please find below the patches for the MediaTek device trees.
As you can see it's quite a bit, but several of them are actually fixing 
problems that were encountered. Would be great if you could find the time to 
pull them. Sorry for the delay.

Matthias

---

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/v6.11-next-dts64

for you to fetch changes up to a9efc40fd601cf779eab4e420d8da3372e4302cf:

   arm64: dts: mediatek: add audio support for mt8365-evk (2024-09-09 16:41:36 
+0200)

----------------------------------------------------------------
mt63xx:
- add ADC node to the different PMICs

mt7981:
- Add SPI controller nodes.

mt8183:
- use referenced label for DSI endpoint.
- disable soc_data efuse node, which does not has any cell definde
   (kukui).
- fix the regulator tree (kukui).
- fix potential deadlock by removing not needed clock in the MFG async
   power domain.
- add DPI node.

mt8186:
- fix opp-supported-hw mask for GPU.
- add lvts thermal sensor node.
- add thermal zones.
- fix reserved memory region of ADSP firmware (corsola).
- add power domain to DPI node.
- add SVS node.
- fix internal display by disabling the external display temporarily
   (corsola).

mt8188:
- add thermal sensor for the AP.
- add thermal zones.

mt8195:
- fix pull resistance for hdmi pins (cherry).
- remove keyboard backlight node (cherry), this is detected through
   ChromeOS EC communication.
- fix warning in mdp3 driver by providing a phandel to the SCP.
- fix probe error of the USB controller by disabeling USB3 on the
   controller (cherry).
- assign per default both phys to the USB controller (cherry).
- fix binding validation by re-ordering the dp_intf clocks.

mt8365:
- add AFE audio controller.
- add AFE and audio codec support (evk).

mt8395:
- fix probe error of the USB controller by disabeling USB3 on the
   controller (radax-nio-12l).
- assign per default both phys to the USB controller (genio, kontron,
   radax).

----------------------------------------------------------------
Alexandre Mergnat (2):
       arm64: dts: mediatek: add afe support for mt8365 SoC
       arm64: dts: mediatek: add audio support for mt8365-evk

AngeloGioacchino Del Regno (2):
       arm64: dts: mediatek: mt8186: Fix supported-hw mask for GPU OPPs
       arm64: dts: mediatek: Add ADC node on MT6357, MT6358, MT6359 PMICs

Chen-Yu Tsai (7):
       arm64: dts: mediatek: mt8183-kukui-jacuzzi: Simplify DSI endpoint replacement
       arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled
       arm64: dts: mediatek: mt8395-nio-12l: Mark USB 3.0 on xhci1 as disabled
       arm64: dts: mediatek: mt8195: Assign USB 3.0 PHY to xhci1 by default
       arm64: dts: mt8183-kukui: clean up regulator tree
       arm64: dts: mediatek: mt8195: Correct clock order for dp_intf*
       arm64: dts: mediatek: mt8186-corsola: Disable DPI display interface

Fei Shao (1):
       arm64: dts: mediatek: mt8186-corsola: Update ADSP reserved memory region

Nicolas Pitre (4):
       arm64: dts: mediatek: mt8186: add lvts definitions
       arm64: dts: mediatek: mt8186: add default thermal zones
       arm64: dts: mediatek: mt8188: add lvts definitions
       arm64: dts: mediatek: mt8188: add default thermal zones

Nícolas F. R. A. Prado (4):
       arm64: dts: mediatek: cherry: Specify pull resistance for RSEL GPIOs
       arm64: dts: mediatek: mt8195-cherry: Remove keyboard-backlight node
       arm64: dts: mediatek: mt8195: Add SCP phandle to MDP3 DMA controller
       arm64: dts: mediatek: mt8183-kukui: Disable unused efuse at 8000000

Pi-Hsun Shih (1):
       arm64: dts: mt8183: add dpi node to mt8183

Pin-yen Lin (1):
       arm64: dts: mediatek: mt8183: Remove clock from mfg_async power domain

Rafał Miłecki (1):
       arm64: dts: mediatek: mt7981: add SPI controllers

Rohit Agarwal (2):
       arm64: dts: mediatek: mt8186: Add power domain for DPI
       arm64: dts: mediatek: mt8186: Add svs node

  arch/arm64/boot/dts/mediatek/mt6357.dtsi           |   5 +
  arch/arm64/boot/dts/mediatek/mt6358.dtsi           |   5 +
  arch/arm64/boot/dts/mediatek/mt6359.dtsi           |   5 +
  arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  42 ++
  .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  13 +-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  26 +-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  13 +-
  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi   |   5 +-
  arch/arm64/boot/dts/mediatek/mt8186.dtsi           | 345 ++++++++++++++-
  arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 482 +++++++++++++++++++++
  .../boot/dts/mediatek/mt8195-cherry-dojo-r1.dts    |  11 +-
  .../boot/dts/mediatek/mt8195-cherry-tomato-r2.dts  |  11 +-
  .../boot/dts/mediatek/mt8195-cherry-tomato-r3.dts  |  11 +-
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |   6 +-
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           |  15 +-
  arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |  86 ++++
  arch/arm64/boot/dts/mediatek/mt8365.dtsi           |  43 +-
  .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    |   2 -
  .../dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts  |   1 +
  .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |   2 +
  20 files changed, 1066 insertions(+), 63 deletions(-)

