Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A85C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gODxfsE/HHgM1MgYRiVapr5n8XIE2gqB7afHvfw3Kj4=; b=Zm6TIKJ0zfI2wPfehdA7hmsG+E
	qXECevkLKq8RreKW7WEXsVU8B+qfGn+LyRs6B0yKzxiC6ZLDN+tnqOwphE7lrP1oSVDoEpGAiWwRC
	17g4yCoPfavw5OmT01qPUbiSYHIryMGH2ZdxAeGJXUAwtjfxcJyn0mzUqdiNZqIQ9oQBEcbPnLcqn
	FUhRD70PxuYkzlFJ/ZIIOr++stTu3YV8LvAuu5FPj8Y7TdS2/vQOliSrhL7PXIecwoMD4wizbzJvB
	NlNsCbpGrAs/gDzk9Ua/CC8g0bDKoduWTA4nO7xP65sf9TAEyx82sRFuNaoHgZagGxaSzWT/dSLJG
	U5YT7tMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOz30-00Ft7R-2b; Tue, 01 Mar 2022 09:43:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOz2n-00Ft5P-Ew; Tue, 01 Mar 2022 09:43:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id u1so19476524wrg.11;
 Tue, 01 Mar 2022 01:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from:cc
 :subject:content-transfer-encoding;
 bh=rOmN4V+xJUGCVbSaaoQKRY67N1Y8KELF/hGRuY/098s=;
 b=GIZ0LwDzThgQ8EkckWdE3U+8RlWFFpAZObsHcDdplrezM43ysRw31PCFl0K58iSL5s
 C37hTR8fEAGkhfqWaNUKkPPVGsQLEYtMen7z96TQgotwdAc3awjRIEsRVkj7o8a+7Vge
 iNV2Jo5hz/l0Zw7yGPqNGkzuYsgKh87aTdnDoReUEh0ipNzarBNrmsPdC/gFQp2pLT2C
 1Egiv6Ibg8IB/sElmQfpW33UYbu3DL4YCgk3fnbLO9U5qsrFbWlTbBO9pmQ4OpVZMYhr
 ESXbLmI6z8J6WI5jndWu77hPTbVdlsgDQJZteYYVigvvrc5NCv9L//QjiOhq9fb9ZS+y
 +PQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:cc:subject:content-transfer-encoding;
 bh=rOmN4V+xJUGCVbSaaoQKRY67N1Y8KELF/hGRuY/098s=;
 b=ZI9A051NvoiAbU6JETyQifiyk8lgsDKUqISjujM9bAwAaj+c1Gu0LJ8ySZlFR8DOLD
 YUGbpA2FzwdzY0FdBobhE9okH95Oc4KbCyLagyzcBfiTxDm2RYYvXy3limRGMaVSWOcS
 ZdUb+Rb2qC6FaYqVVAuD88VAFQ5htvi986PDisnwnA1MGsYUdeHZH0dJFSWeOLCMFRq5
 8p8A40QNJnUpK9fkSOmtYGXN9KV1zpNiRiAlDzz6VPwEWJ93jdwP/O0GVtrxNXofGSuI
 JuirPAeKjUFuPWht8XeZgNHqsvwU4FijMkOhfV6S+T9l+GPOmKlchVSlyPXqVnjKfn2T
 6eog==
X-Gm-Message-State: AOAM531H2DHXVhHlxBbAEj6T3LZsDU5iXavl8O1iY9CExYidlY62aTDx
 89XofjTI0H5e/Q3Oy94mbH/i6MbA9hWfww==
X-Google-Smtp-Source: ABdhPJzbfQbp6ZUKvlQYKBtdH/149h6N2qnfXs47IS27PDANx/7exxQPeC56Ym/gFRKMWf0/JGF8Eg==
X-Received: by 2002:a5d:560e:0:b0:1ef:7498:bcc2 with SMTP id
 l14-20020a5d560e000000b001ef7498bcc2mr14759842wrv.36.1646127823748; 
 Tue, 01 Mar 2022 01:43:43 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 m62-20020a1c2641000000b00380d0cff5f3sm2009856wmm.8.2022.03.01.01.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 01:43:43 -0800 (PST)
Message-ID: <c2064dcc-acdc-c86b-5ef7-cb8e7ae3122f@gmail.com>
Date: Tue, 1 Mar 2022 10:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Sam Shih <sam.shih@mediatek.com>
Subject: [GIT PULL] arm64: dts: mediatek updates for v5.18
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_014345_549144_83545171 
X-CRM114-Status: GOOD (  12.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Olof and Arnd,

Please have a look into the below updates for v5.18
Little by little the mt8192 is getting into shape, now that the devices have the 
corresponding clock drivers. We also gained watchdog and power domain controller.
Also mt8183 has now support for the keyboard connected to the PMIC as well as 
the JPGEG enconder.
On the router side, unfortunately the mt7986 is moving a bit slow. Hopefully in 
the next cycle we can get more drivers supported for this new chip.

Regards,
Matthias

---
The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.17-next-dts64

for you to fetch changes up to 809967d76e919af142028fae0f024b8d6966fac8:

   arm64: dts: mediatek: update mt7986b memory node (2022-03-01 09:49:02 +0100)

----------------------------------------------------------------
mt8192
- add clocks to the devices
- add watchdog node
- add power domain controller node

mt8183:
- add pmic (mt6358) key board node
- add JPEG enconder node

mt7986:
- update memory node
- add clock controller for mt7986a version

----------------------------------------------------------------
Allen-KH Cheng (6):
       arm64: dts: mediatek: Correct uart clock of MT8192
       arm64: dts: mediatek: Correct SPI clock of MT8192
       arm64: dts: mediatek: Correct Nor Flash clock of MT8192
       arm64: dts: mediatek: Correct I2C clock of MT8192
       arm64: dts: mediatek: Correct system timer clock of MT8192
       arm64: dts: mt8192: Add watchdog node

Chun-Jie Chen (1):
       arm64: dts: mediatek: Add mt8192 power domains controller

Maoguang Meng (1):
       arm64: dts: mt8183: add jpeg enc node for mt8183

Mattijs Korpershoek (1):
       arm64: dts: mt6358: add mt6358-keys node

Sam Shih (3):
       arm64: dts: mediatek: add clock support for mt7986a
       arm64: dts: mediatek: update mt7986a memory node
       arm64: dts: mediatek: update mt7986b memory node

  arch/arm64/boot/dts/mediatek/mt6358.dtsi     |  12 ++
  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |   3 +-
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi    |  68 +++++-
  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |   3 +-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi     |  12 ++
  arch/arm64/boot/dts/mediatek/mt8192.dtsi     | 299 +++++++++++++++++++++++----
  6 files changed, 350 insertions(+), 47 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
