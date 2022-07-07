Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B6DC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLAAA3jB5ned5BtejBh+nPdee1Nblybf2I+LfI9tzQs=; b=m54uFOZi5REbSr3OwRds6gteno
	YwGHn9u1aN4splLtimDzVNKOqGQlhsCVg2z9xxBSzGDSlnJo0s3/xd9LveBzgeoPYoI+sAC8QTnn3
	bU/6KOst/BrdWuquYmpIozfW7wynbC/yBAaFd2MOf8sNZ+yCe/NOjUQcxKc3dS6c7HIbEedDxo3zz
	/g1YgJpgajS1K9hREeH8W4Gc4WYDzUl95F3V5zx8ITOUxDiLdBYWFYTESnsSe8KxfjY/cygbno2IN
	WkciZefIqhg8LCW0QM3+MIylV6XDr0oqXP4FR4tzrLD23u5gDcgbflwrrAxeegsW+Ex+IczSH4fiQ
	Z03w/4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Sg2-00GWRW-Mu; Thu, 07 Jul 2022 14:40:22 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Sfo-00GWGx-L9; Thu, 07 Jul 2022 14:40:10 +0000
Received: by mail-io1-xd2e.google.com with SMTP id p128so17031364iof.1;
        Thu, 07 Jul 2022 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lLAAA3jB5ned5BtejBh+nPdee1Nblybf2I+LfI9tzQs=;
        b=bOH+gOGS1u/iAoiZWro7bolFufuXBkMZK3BmdgRtq6mS8ETkhcbgAz/GaBT87WcvUM
         7CO9/h/JJBpBzlMwLoho5HxJU5wq7xtlmSv/8XgyPISZZrN56CyegikUvPhyU1b9/ZKz
         qvQL9alQJoWSzkV2ZYZxobmAUomcpncFitywVRS2qiQqaa448ZpkcuLhzydHoEwRJl3p
         u1I4P1sxV66/HohRwRZQ8UvoFTIvx4bvoyQB2s9ZCkRtozwq4EiGZieQEn0ppg3Uckzi
         jxlTcs/h2v89lnyEifEx91C16k/3nONG2M7Zs8c+kMsLF0+JDPhnZsocRKEm5chJXwLK
         INkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lLAAA3jB5ned5BtejBh+nPdee1Nblybf2I+LfI9tzQs=;
        b=Q0gO0bH62YM2eKWqxWWAo6VX1x/PxPJeddoFU+lzABzgQaiDjhToRdEQGR4Zj0+6Dn
         P/w6BfKnEAjELb2h2ZbIoA2X0JBXsce1NrwtPcNwp+WFcQKfQYIUoWpqmu1gDtWb2sgV
         ks5hGv/ea83XHie95Ocb+oOqGtqH38bRHPQ04olVKvz7kP6DbtR/vyP7pmu7F5BpKU3t
         ZlRKuxu3bN5xl81phzCXV8iORyBg/lHnl2RLriUp3d07rk8i7NcvLGCt3X6m3V1+i8LN
         sbmLcJ0lj2CMusx+L7ENwUVdyRm1PMeh7CPyH0tgLFeRwj7BqNDKTzKlZHK6umZpVt0S
         QATA==
X-Gm-Message-State: AJIora/Xhc0v3U44i2DGmpzWET7X9Qk4njhGq88hjYBUT3ZJnVVGx34u
	TfKNttKRGt9CwjjOtxtq0Bc=
X-Google-Smtp-Source: AGRyM1tcdZz6WCLgzbZOg4t66E2w8JRX6w6VJKKALhz2O8eKDvyuRelZup930FhxSmAKhzVB6L13Zg==
X-Received: by 2002:a05:6602:1593:b0:678:d98b:cf60 with SMTP id e19-20020a056602159300b00678d98bcf60mr3584389iow.172.1657204805902;
        Thu, 07 Jul 2022 07:40:05 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i5-20020a056e02054500b002dc27838576sm2847886ils.77.2022.07.07.07.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:40:04 -0700 (PDT)
Message-ID: <730cf556-6512-1d54-b798-01aa90a88406@gmail.com>
Date: Thu, 7 Jul 2022 16:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 00/19] Introduce support for MediaTek MT8192 Google
 Chromebooks
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Luca Weiss <luca@z3ntu.xyz>, Maxim Kutnij <gtk3@inbox.ru>,
 Rob Herring <robh+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220629155956.1138955-1-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_074008_776411_046D2046 
X-CRM114-Status: GOOD (  18.38  )
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



On 29/06/2022 17:59, Nícolas F. R. A. Prado wrote:
> 
> This series introduces Devicetrees for the MT8192-based Asurada platform
> as well as Asurada Spherion and Asurada Hayato boards.
> 
> Support for the boards is added to the extent that is currently enabled
> in the mt8192.dtsi, and using only properties already merged in the
> dt-bindings, as to not add any dependencies to this series.
> 
> This series was peer-reviewed internally before submission.
> 

Whole series applied. Thanks!

> Series tested on next-20220629.
> 
> v3: https://lore.kernel.org/all/20220512205602.158273-1-nfraprado@collabora.com/
> v2: https://lore.kernel.org/all/20220505194550.3094656-1-nfraprado@collabora.com/
> v1: https://lore.kernel.org/all/20220316151327.564214-1-nfraprado@collabora.com/
> 
> Changes in v4:
> - Added patches 17-19 enabling MMC, SCP and SPI NOR flash
> - Switched mediatek,drive-strength-adv for drive-strength-microamp
> - Switched mediatek,pull-up-adv for bias-pull-up
> - Updated Vgpu minimum voltage to appropriate value
> 
> Changes in v3:
> - Renamed regulator nodes to be generic
> - Fixed keyboard layout for Hayato
> 
> Changes in v2:
> - Added patches 1-2 for Mediatek board dt-bindings
> - Added patches 13-16 enabling hardware for Asurada that has since been
>    enabled on mt8192.dtsi
> 
> Nícolas F. R. A. Prado (19):
>    dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-spherion
>    dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-hayato
>    arm64: dts: mediatek: Introduce MT8192-based Asurada board family
>    arm64: dts: mediatek: asurada: Document GPIO names
>    arm64: dts: mediatek: asurada: Add system-wide power supplies
>    arm64: dts: mediatek: asurada: Enable and configure I2C and SPI busses
>    arm64: dts: mediatek: asurada: Add ChromeOS EC
>    arm64: dts: mediatek: asurada: Add keyboard mapping for the top row
>    arm64: dts: mediatek: asurada: Add Cr50 TPM
>    arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C trackpad
>    arm64: dts: mediatek: asurada: Add I2C touchscreen
>    arm64: dts: mediatek: spherion: Add keyboard backlight
>    arm64: dts: mediatek: asurada: Enable XHCI
>    arm64: dts: mediatek: asurada: Enable PCIe and add WiFi
>    arm64: dts: mediatek: asurada: Add MT6359 PMIC
>    arm64: dts: mediatek: asurada: Add SPMI regulators
>    arm64: dts: mediatek: asurada: Enable MMC
>    arm64: dts: mediatek: asurada: Enable SCP
>    arm64: dts: mediatek: asurada: Add SPI NOR flash memory
> 
>   .../devicetree/bindings/arm/mediatek.yaml     |  13 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>   .../dts/mediatek/mt8192-asurada-hayato-r1.dts |  47 +
>   .../mediatek/mt8192-asurada-spherion-r0.dts   |  62 ++
>   .../boot/dts/mediatek/mt8192-asurada.dtsi     | 959 ++++++++++++++++++
>   5 files changed, 1083 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> 

