Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C15C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HvjioZHPtwBf4fSwa9wIuwFcez8I2M80JFO0QJMojs=; b=GaNN6/VgDqf37zcenksfLg2eRX
	5vFPMYLwLfdzatHUxlfMZxpmWj/nLOp/D3NtYDJ5TBcMqQML5N9AwjVIVPz4fgZnAaHcU8m6RtgnH
	Uj2OsjMPeyEL+aeklft/VhzBt8W78G8jlQ50dgiW3cxgA4xcdrc8fHrUbCCHksUiDnnGicAdozzhX
	m7xg57LyRwwNiMNT/v8wo0VvuzXOrKvdcYM9emQHGXxg+fghMXsvb6GlDsKN8o5PpyGDdGb7Mm/cy
	42iitHpziLl8SAXefSxgGRsG1QPEju8LT/VcilGztXjyJ04QIeGy1qVGFO7FV4tofAxaYZOVyu4An
	67sl7E8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o42TX-00BDzW-Sg; Wed, 22 Jun 2022 15:41:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o42TM-00BDxT-4c; Wed, 22 Jun 2022 15:40:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id x6-20020a1c7c06000000b003972dfca96cso13488wmc.4;
        Wed, 22 Jun 2022 08:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6HvjioZHPtwBf4fSwa9wIuwFcez8I2M80JFO0QJMojs=;
        b=dpZHPTmcfuFjzjJ0Lys34TeMfY59Nf1bKZM5XTxOYpqqCBsl7Y6AhxrXkzb+gPakMK
         FloXTG3essSGnodFfCg3jtPf0tPM+4wamt0q6BPSfR89FBPb/HfsmktFXGDn/eile+Y8
         /yK/eD6l6WjEX6SjenLshLSETc34Dq0GIAUxh5to/GL+FYMWttj7fc3sYov1tPtYCCOR
         dBP/PX7cqo2YrMZAIB7/zxxxT0TtRBoETiX67M1AssNL8bCqTidpwSyWiO3dm0cdg1ES
         JdHLImitJR/7Tnz6Cv6zOWfoqt9Zh8aGFUZVk+pLR7jGoIrbbaB8qllQxWmm2FDQhN5q
         Yt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6HvjioZHPtwBf4fSwa9wIuwFcez8I2M80JFO0QJMojs=;
        b=Za6lZk6KMg8qlxHMNByCgjCpdFvgerkAfMnz6muy9hj/IVSKBe+8I2CcbwF++0hfPB
         l5x7ypvklO0ga5iwTOOPiBXU6e0em0lLQt+qPKrFngFYaFhggMelM5pO2KfRQmf+o+K9
         ULjD6ZKLhWtpED52YK14ICAJzc3h6rwICDGQS1mllezUB97XAZlHeRy9uJDCEsLyEo1Y
         MZh0kumOSnk/3edU4vCvrqnOu3IdIAEnDAjXvrg22cLb1PT9Yb7rjYk2R3NX7OtxUNn6
         nPE5FntVR8hdMf+R2a4ClgDf/2aK4RvHwF3aPJNcHzM3x58uzhQxtyMypbHYXh9oETuX
         EWkw==
X-Gm-Message-State: AJIora85/5viib3NlDcPIarv/0+s1AyTRjIkJCtujF1mAqFHHkDZM34j
	GGzygk0qMX/bp1OInjt0QJ0=
X-Google-Smtp-Source: AGRyM1ulMlpI/C9yUV5vRRJTaw3SQd1l5jIXTUtRosaGOoW6+N4l7XU10IynPKr7U0RVMv8wVfr7bw==
X-Received: by 2002:a7b:c402:0:b0:3a0:2ba7:1fa7 with SMTP id k2-20020a7bc402000000b003a02ba71fa7mr3160994wmi.152.1655912449594;
        Wed, 22 Jun 2022 08:40:49 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id r64-20020a1c4443000000b003942a244f39sm31645408wma.18.2022.06.22.08.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 08:40:48 -0700 (PDT)
Message-ID: <37fb545a-bc45-65b0-b67b-5ef1b0346777@gmail.com>
Date: Wed, 22 Jun 2022 17:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v11 0/3] Add basic node support for MediaTek MT8186 SoC
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 hsinyi@chromium.org
References: <20220520122217.30716-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220520122217.30716-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_084052_230005_99A85990 
X-CRM114-Status: GOOD (  20.09  )
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



On 20/05/2022 14:22, Allen-KH Cheng wrote:
> MT8186 is a SoC based on 64bit ARMv8 architecture.
> It contains 6 CA55 and 2 CA76 cores.
> MT8186 share many HW IP with MT65xx series.
> 
> This patchset was tested on MT8186 evaluation board to shell.
> 

Applied, thanks!

> Based on next-20220519, linux-next/master
> 
> changes since v9:
>   - remove some merged PATCHs from series
>   - reorder nodes in dts (cpu-map)
>   - remove okay status in auxadc
>   - remove unnecessary suffix node name for i2c
>   - add pwm node
>   - add dsi-phy node
>   - add dpi node
> 
> changes since v9:
>   - add one space before equal sign of drive-strength-adv
>   - corect compatible name for big cores (ca76)
>   - use upper case of address in pinctrl
>   - add pwrap node
>   - add pwm node
> 
> changes since v8:
>   - change name from pins_bus to pins-sda-scl
>   - correct email address
>   - add capacity-dmips-mhz for each CPU
>   - add ppi-partitions in gic node
>   - change name to power-domain
>   - remove status "okay" in scp node
>   - update timer and pericfg compatible in series
> 
> changes since v7:
>   - add scp&auxadc node
> 
> changes since v6:
>   - remove unnecessary blank line
> 
> changes since v5:
>   - replace Mediatek a to MediaTek
>   - use GPL-2.0-only OR BSD-2-Clause
> 
> changes since v4:
>   - correct driver clock of mt8186
>   - add power domains controller and clock controllers
>   - add pinctrl, usb host, spi and i2c nodes
>   - add node status in mt8186-evb.dts
>   - correct some dtbs_check warnings
> 
> changes since v3:
>   - remove serial, mmc and phy patch from series. (already merged)
>   - remove mcusysoff node
>   - move oscillator nodes at the head of dts
>   - change name from usb-phy to t-phy
> 
> changes since v2:
>   - add soc {} in mt8186.dtsi
> 
> changes since v1:
>   - add dt-bindings: arm: Add compatible for MediaTek MT8186
> 
> Allen-KH Cheng (3):
>    dt-bindings: arm: mediatek: Add mt8186 pericfg compatible
>    dt-bindings: arm: Add compatible for MediaTek MT8186
>    arm64: dts: Add MediaTek SoC MT8186 dts and evaluation board and
>      Makefile
> 
>   .../devicetree/bindings/arm/mediatek.yaml     |    4 +
>   .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
>   arch/arm64/boot/dts/mediatek/Makefile         |    1 +
>   arch/arm64/boot/dts/mediatek/mt8186-evb.dts   |  232 ++++
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 1016 +++++++++++++++++
>   5 files changed, 1254 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi
> 

