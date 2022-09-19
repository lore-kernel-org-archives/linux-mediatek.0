Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89519C6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 10:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zt9/L7mv46x+tMkdan6S1TWVTWPJHerYZbSiTiF39Bk=; b=zAwFkxcfYjIdAbknmw70mS3bIq
	UVhsuXyMJ4BwzVp1I8ThIPN57PWPX0RYHrAl/r7Se8LmYkXF2jsBzl+M5JLMYaI2ktqNezhackPhW
	UmqxqmtrZrbdM60bYlvn0LFJobyg0/IO+4Smc2UyvgfSdUATrnjm8741Gy6BC/SPahch3H9kKKpPs
	nlUbWQSpsLwbxz764w/gQJqQxEAdAJVliJkRcnJEV/pWcMOfEcwBA01v+18VyWY/hgY5mhOI8lGL/
	0zMlkQsK27fBkalYbmb30DJnwQsM492EgeERRfx0DIGWZP5BgjAaH9y1XqH0oZ8OpJTbATq7AushU
	Aj98hqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEMF-00BOI2-08; Mon, 19 Sep 2022 10:50:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEM0-00BOBQ-Pg; Mon, 19 Sep 2022 10:50:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id h130-20020a1c2188000000b003b4cadadce7so3102581wmh.3;
        Mon, 19 Sep 2022 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=zt9/L7mv46x+tMkdan6S1TWVTWPJHerYZbSiTiF39Bk=;
        b=eGlGfPlVwAfj5fVHptbsSk3lNVQfRHcbdNcnYKmguMxticjb3UzOqlD0Hs1hdq/xUt
         mJAmis2r01KXGfo3ilQL2XfqKzGxOzcZt6BTJLzSS6aw7ycwpx63Hq/J25yco8+XCoZR
         r2H6vrFqjLFbI2xsDIPj3/5F/pp2HZ5dS8PLxfCsu0CMXHcpAiczDk5Ns/R2n56cNAZe
         MzcUPPrGyPpDmKtbRK00ZL1Rdv8JT69Z7ziTEJzdnpt0s+jmNWQehcczL5y+Qe1xQaBP
         imgt5Jng/8QP1PbBXVdBiCLMEOeePcf2Rad/pu35UdwOy0yC1wSh6OIzlmU0oa6dO2kl
         LaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=zt9/L7mv46x+tMkdan6S1TWVTWPJHerYZbSiTiF39Bk=;
        b=fws2WR0N3w0kQPlodw07pHmKbvo2lEcODzTNacUxmzBOqVnQaT+ZOqmJZkBGfVmiqi
         hDaieKU9MlH7ZjNt+tKhUakOEIMznNGeraObAeHYpl4VTgG0/uz3kRtFyc4IpA1aydSk
         XWxhrx/+V0iHTV881oxTP5lssvD9MA7+tZxtzvKj85nbkKSNdIgOfM0wZY70O+XI/Fcq
         b5E0P8LkTrgIfx+CNcewQWAFOplZ5pHIVLNWHuXtoUhAhatqRc8RrstfO2yeLv3FiUQk
         AVOh7e9+ZhBeyl3B3F46gPI7/yRl/FORn9tCM7QxSfANhvuz82wUeYlCgoGLgcXQ+W8c
         wZ9g==
X-Gm-Message-State: ACrzQf0le6oe37YJQrzT2La+BfVAAQJYo4MUxMz5+iLAItVxc5Ml7pzn
	XKRK3fleO6PxOII5QiAJHMc=
X-Google-Smtp-Source: AMsMyM7O37kNCtN4XEKZro5zQsRxPHEhO5SYR8+u84l1OSSgFdbTICmLLc9gdww8tJ5CmvfAVAXtsw==
X-Received: by 2002:a05:600c:4f0f:b0:3b4:c09b:37c5 with SMTP id l15-20020a05600c4f0f00b003b4c09b37c5mr8865197wmq.181.1663584617271;
        Mon, 19 Sep 2022 03:50:17 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id ay9-20020a05600c1e0900b003a5c7a942edsm13427829wmb.28.2022.09.19.03.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:50:16 -0700 (PDT)
Message-ID: <3b915692-c8a9-c508-5a4a-0fdb49355e99@gmail.com>
Date: Mon, 19 Sep 2022 12:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>, Moudy Ho
 <moudy.ho@mediatek.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Peter Chiu <chui-hao.chiu@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, YC Hung <yc.hung@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: MediaTek updates for v6.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_035020_910259_D13854A2 
X-CRM114-Status: GOOD (  17.49  )
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

Hi Olof and Arnd,

unfortunately a bit late, but hopefully still in time the updates for the DTS 64 
bit.

The most important updates are support for the MT8186, up to now only the EVB, 
but I hope we will see more board with that SoC later one. Apart from that we 
have a huge update for the MT8195 supported IP blocks, especially tied to the 
Acer Chromebook Spin 513 series.
Apart from that we have some more support for MT8192, especially for graphics 
support.

Regards,
Matthias

---

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.0-next-dts64

for you to fetch changes up to 5ebb14aa5a193b3a6a5c359bdd4d3573cb14bdf1:

   arm64: dts: mediatek: mt6795: Add CPUX system timer node (2022-09-15 18:18:53 
+0200)

----------------------------------------------------------------
mt6795:
- add add system timer node

mt7986a:
- add wifi support

mt8183:
- add MDP3 and keypad

mt8186:
- basic support for the Evaluation Board including, i2c, usb and uart.

mt8192:
- add nodes to support PWM, MIPI transciever, display with GCE and DSI.

mt8195:
- disable nodes not used on all boards
- Add support for CPU freq, clocks, power domain controller, spmi, scp.
- Enable audio decoder, DSP, IOMMU, mailbox.
- Add display nodes for vdosys0.
- On Cherry based chromebooks, enable the system companion processor,
   Cross EC, Google Security Chip, secondary MMC controller, trackpad and
   a few regulators.

----------------------------------------------------------------
Allen-KH Cheng (6):
       arm64: dts: Add MediaTek MT8186 dts and evaluation board and Makefile
       arm64: dts: mt8192: Add pwm node
       arm64: dts: mt8192: Add mipi_tx node
       arm64: dts: mediatek: Add mmsys #reset-cells property for mt8192
       arm64: dts: mt8192: Add display nodes
       arm64: dts: mt8192: Add dsi node

AngeloGioacchino Del Regno (8):
       arm64: dts: mediatek: cherry: Enable the System Companion Processor
       arm64: dts: mediatek: cherry: Wire up the ChromeOS Embedded Controller
       arm64: dts: mediatek: cherry: Add Google Security Chip (GSC) TPM
       arm64: dts: mediatek: cherry: Add keyboard mapping for the top row
       arm64: dts: mediatek: cherry: Enable secondary SD/MMC controller
       arm64: dts: mediatek: cherry: Enable Elantech eKTH3000 i2c trackpad
       arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus
       arm64: dts: mediatek: mt6795: Add CPUX system timer node

Fabien Parent (2):
       arm64: dts: mediatek: mt8183: add keyboard node
       arm64: dts: mediatek: mt8183-pumpkin: add keypad support

Jason-JH.Lin (2):
       arm64: dts: mt8195: Add gce node
       arm64: dts: mt8195: Add display node for vdosys0

Moudy Ho (1):
       arm64: dts: mt8183: add MediaTek MDP3 nodes

Nícolas F. R. A. Prado (1):
       arm64: dts: mediatek: Add missing xHCI clocks for mt8192 and mt8195

Peter Chiu (1):
       arm64: dts: mt7986: add built-in Wi-Fi device nodes

Tinghan Shen (9):
       arm64: dts: mediatek: Update mt81xx scpsys node to align with dt-bindings
       arm64: dts: mt8195: Disable watchdog external reset signal
       arm64: dts: mt8195: Add vdosys and vppsys clock nodes
       arm64: dts: mt8195: Add power domains controller
       arm64: dts: mt8195: Add spmi node
       arm64: dts: mt8195: Add scp node
       arm64: dts: mt8195: Add audio related nodes
       arm64: dts: mt8195: Add iommu and smi nodes
       arm64: dts: mediatek: Fix build warnings of mt8173 vcodec nodes

Trevor Wu (1):
       arm64: dts: mt8195: Specify audio reset controller

Tzung-Bi Shih (1):
       arm64: dts: mt8195: Disable I2C0 node

YC Hung (1):
       arm64: dts: mt8195: Add adsp node and adsp mailbox nodes

YT Lee (1):
       arm64: dts: mt8195: Add cpufreq node

  arch/arm64/boot/dts/mediatek/Makefile           |    1 +
  arch/arm64/boot/dts/mediatek/mt6795.dtsi        |    8 +
  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts    |   38 +
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi       |   23 +
  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts    |   40 +
  arch/arm64/boot/dts/mediatek/mt8167.dtsi        |    3 +-
  arch/arm64/boot/dts/mediatek/mt8173.dtsi        |    7 +-
  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts |   21 +
  arch/arm64/boot/dts/mediatek/mt8183.dtsi        |   75 +-
  arch/arm64/boot/dts/mediatek/mt8186-evb.dts     |  220 +++++
  arch/arm64/boot/dts/mediatek/mt8186.dtsi        |  819 +++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8192.dtsi        |  200 ++++-
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi |  256 ++++++
  arch/arm64/boot/dts/mediatek/mt8195.dtsi        | 1072 ++++++++++++++++++++++-
  14 files changed, 2765 insertions(+), 18 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi

