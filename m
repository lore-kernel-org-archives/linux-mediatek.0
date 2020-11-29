Return-Path: <SRS0=HK5I=FD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D63FC3E8C5
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 21:16:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCBDE2078D
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 21:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FMyAcC8n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXAKKnzW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCBDE2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vn2w5iQhJ0rdpKH0gHmhWyMypNnyG3WZ8qvR4liB4C8=; b=FMyAcC8ntcTgcVZRRxlFCICn5V
	OOXYandGOKzK4Vb6Wa+6S4MhAFqhUKuk6t48Unf1fM0qNOqrvDE6PoIPZv/0dC2GSxH8Wvrbd6V/E
	n2IRUPlOs+bn7IDAweQiSpqp7UbPsSI1AzbSiqfYYwT9Zw78G3R/wvvU+9Ue2+C2hqUI2+1x5KeOU
	0kSZ5nOQzTqpcAwxqTHG1KzZl9yU6igiefACPl0jUbkWC+cmcwD7lfo7kTSHX40vBsURFplCqkepc
	bNBc/0GifaiGf1KCM521KbdXoX3xKT5uEQbbSNXkiw9FBYfb+0l9eOEMHOJVoW/xZL/XgeluZWeao
	64+VE9QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjU3O-0006fb-KA; Sun, 29 Nov 2020 21:16:18 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjU3M-0006f4-QU; Sun, 29 Nov 2020 21:16:17 +0000
Received: by mail-ed1-x541.google.com with SMTP id k4so12768952edl.0;
 Sun, 29 Nov 2020 13:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Wzet6YIBcFXIXVjhyotb3WolYA/AVJvDgx1lWrdlNFA=;
 b=WXAKKnzWawzpwaTo42EU1aSJn+Tc7blnHCWoQkVGoZdpM6hba7V+r2FVQLHJqPyqTs
 eQpSFbAeBrm+BX130MyHog/kzs+04MhZ0PODPZiDWjsG4RAeDeWr5pSVaqXULTZjRcgE
 OKD61cXUoTbbq1Qfp0NGRF0UKYvhqNTu6Y4nEQgsUTCJaYE0hxlJ49qONsFqNawPWwRo
 KabhX2nb9D3ktNlKQFCMmUcW6/4+P6A0UypsQLw6zOOPYkGkrc78X8Y7xrKYuvQviwFd
 5xs83o90g/gh/zoDYy5EdLWsKsITCacD+57nVZN3Hx2hyYwyEJXG6o0hBrhLnQiCzScb
 Q9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Wzet6YIBcFXIXVjhyotb3WolYA/AVJvDgx1lWrdlNFA=;
 b=SxvfEQsHxWM3X5uxnEqMOUsXhAzL8ZCL97NeLl7TIEfXX+4jJlTz9e9BjHrhNAbI9r
 I8T+1ouXOvq99q4GCKQX8uW5gzh0eCK/r8YAOdK1417xwN52rcXu6E/IBl/ZzJWmQFjm
 RXK/VQ5+P74WU9nZ4YNGN35ax9xM5+9U6xJB+zRRcR+Wk524vUX3X963wZmso3fCJS4v
 8d6uLlKftUiWgFxsf6WD/zmpiAaUXrFzzNekqnZjrdTA4ssWP0MiPz+ZIZAmu9TWKzSQ
 s4wqTJgMeflx/7oHIlBb5KG+DlKEtP5MOjFklwV5iYQhX8LDMmyv4maT0uHV/wkH3H9o
 tx+w==
X-Gm-Message-State: AOAM533yMZCL/0O+JF75DDcoHAnr2PTn37jmu3rPtCm8fGtKzjzgdau0
 V5Go1RX1DuAW5Rnf75CBIgo=
X-Google-Smtp-Source: ABdhPJxbZdS9blYIpT7OBFHB2Ihl7v8kwNwSXIxqZfxUD5+w2A4rIq+dgRDAFgq57ybPbQYHSwR/Kg==
X-Received: by 2002:a05:6402:c96:: with SMTP id
 cm22mr18352434edb.121.1606684573856; 
 Sun, 29 Nov 2020 13:16:13 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id k3sm7861373ejd.36.2020.11.29.13.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Nov 2020 13:16:13 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: mediatek: devicetree changes for v5.11
Message-ID: <72fe1c4f-f27c-c455-dfd9-66bde90bb295@gmail.com>
Date: Sun, 29 Nov 2020 22:16:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_161616_959304_51C8CC43 
X-CRM114-Status: GOOD (  21.37  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Jitao Shi <jitao.shi@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Seiya Wang <seiya.wang@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,

Please have a look at the following devicetree changes for v5.11.

The most remarkable changes are support for three (!) new MediaTek boards, the 
AiOT chip mt8167, the smart phone chip mt6779 and the tablet/laptop chip mt8192.

Beware that I had to create a stable branch to share the binding includes for 
the new power domain driver found on mt8183 and mt8192.

Regards,
Matthias
---

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.10-next-dts64

for you to fetch changes up to 5833bc6c7319dd59441562d853b8e435e3bc8ac2:

   dts64: mt7622: disable spi1 and uart2 because pins are used by pwm 
(2020-11-27 17:05:32 +0100)

----------------------------------------------------------------
mt8173:
- add new power domain controller node

mt8183:
- add new power domain controller
- add display, iommu and dsi nodes

mt8192:
- add basic support, pinctrl, uart, spi, i2c and timer

mt8516:
- add auxadc, efuse and usb nodes

mt8167:
- add basic support for the SoC
- add support for the pumkin board

mt6779:
- add initial support, interrupt controller, clocks, uart

mt7622:
-  PWM node for all available PWM channels

----------------------------------------------------------------
Enric Balletbo i Serra (7):
       arm64: dts: mt8173-elm: Remove ddc property from panel
       dt-bindings: power: Add bindings for the Mediatek SCPSYS power domains 
controller
       dt-bindings: power: Add MT8183 power domains
       arm64: dts: mediatek: Add mt8173 power domain controller
       arm64: dts: mediatek: Add smi_common node for MT8183
       arm64: dts: mt8183: Add iommu and larb nodes
       arm64: dts: mt8183: Add display nodes for MT8183

Fabien Parent (9):
       arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells value
       dt-bindings: iio: adc: auxadc: add doc for MT8516 SoC
       arm64: dts: mediatek: mt8516: add auxadc node
       arm64: dts: mediatek: mt8516: rename usb phy
       arm64: dts: mediatek: mt8516: add usb1 node
       arm64: dts: mediatek: mt8516: add efuse node
       dt-bindings: arm64: dts: mediatek: Add mt8167-pumpkin board
       arm64: dts: mediatek: add dtsi for MT8167
       arm64: dts: mediatek: add MT8167 pumpkin board dts

Frank Wunderlich (2):
       dts64: mt7622: enable all pwm for bananapi r64
       dts64: mt7622: disable spi1 and uart2 because pins are used by pwm

Hanks Chen (1):
       arm64: dts: add dts nodes for MT6779

Hsin-Yi Wang (1):
       arm64: dts: mt8183: Add pwm and backlight node

Jitao Shi (1):
       arm64: dts: mt8183: Add dsi node

Krzysztof Kozlowski (1):
       arm64: dts: mediatek: align GPIO hog names with dtschema

Matthias Brugger (2):
       Merge tag 'v5.10-next-pm-domains-stable' into HEAD
       arm64: dts: mediatek: Add mt8183 power domains controller

Seiya Wang (1):
       arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile

Weiyi Lu (1):
       dt-bindings: power: Add MT8192 power domains

  .../devicetree/bindings/arm/mediatek.yaml          |   4 +
  .../devicetree/bindings/iio/adc/mt6577_auxadc.txt  |   1 +
  .../bindings/power/mediatek,power-controller.yaml  | 293 ++++++++
  arch/arm64/boot/dts/mediatek/Makefile              |   3 +
  arch/arm64/boot/dts/mediatek/mt6779-evb.dts        |  31 +
  arch/arm64/boot/dts/mediatek/mt6779.dtsi           | 271 ++++++++
  .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  13 +-
  arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h      | 744 +++++++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts    |  20 +
  arch/arm64/boot/dts/mediatek/mt8167.dtsi           |  61 ++
  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |   1 -
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 164 +++--
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  28 +
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 408 ++++++++++-
  arch/arm64/boot/dts/mediatek/mt8192-evb.dts        |  29 +
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 512 ++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8516.dtsi           |  40 +-
  arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |  28 +-
  include/dt-bindings/power/mt8183-power.h           |  26 +
  include/dt-bindings/power/mt8192-power.h           |  32 +
  20 files changed, 2638 insertions(+), 71 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8167.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-evb.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192.dtsi
  create mode 100644 include/dt-bindings/power/mt8183-power.h
  create mode 100644 include/dt-bindings/power/mt8192-power.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
