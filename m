Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FF8C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 14:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFBY/59HAcFXCoUkn6tpERfsKHI5WTonhgCZoTEbwOg=; b=nzEV3wh2OrRTp9YEpR/JZFNziR
	K9RO04ug7eFbsc0tfOzw2vvyLiXs6sLeiNSuXhLNiaoZYte8HNNgkVz2r/w+PITt/78x8ROBgmHQW
	imw1XFoiq5N0DQHzbcLw2GaN4nadNhBiy8ECz6brI3QttNE0Gj7qssxV5dr4lIx2kf+xze4BWGDFS
	w6mcx6nC1Ein8hgUWpJa1eV0Qs/k/05Ex0onTzqhepH8YGVYpyoHNksqS5Im1oJNoJmDERaA54+d/
	AeKHv83l3/bGlYRggoQJMYDk+W6Pm75/W7/KpUgkmABAcPZIUtH+nSLs4WFPbf7hxY84HP4/4kjrh
	gHbYbyeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SiH-00GY1l-1K; Thu, 07 Jul 2022 14:42:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Shr-00GXjZ-0B; Thu, 07 Jul 2022 14:42:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id h131-20020a1c2189000000b003a2cc290135so1061526wmh.2;
        Thu, 07 Jul 2022 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hFBY/59HAcFXCoUkn6tpERfsKHI5WTonhgCZoTEbwOg=;
        b=AAATC3IjXA6RsahrVYilBmFfSZ0oguDLc8FvDpacKln1dFLCUvEQZ2nN6IR5h+zGC5
         PNRYRY5SuGZH+FdXjM8eG/xR1tcE0uouLFZTBfR9y52L9t+jidmQiVG5ghkp4MJVDPHA
         ASvn0USJ5JXe7VcHNYfvMklfuUa6H6TrV329QRNRhYi4O3EXbpt872KWynvrNWeDLfc1
         Mt+1UO2Bxdt1Jb1oILXZxD8BAL6ZyjOTVWnDjIk9/0ho1F8YK0Qeul64ZQPAx+N+5vb+
         itGx7lAflAgy8SaDBo5AXQP3SRjLEqcsoRiwcABoep6kSXWxQ2CDdkSe9McOVTvUyNsA
         2GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hFBY/59HAcFXCoUkn6tpERfsKHI5WTonhgCZoTEbwOg=;
        b=aUd5Y4U3itGXUZiMA0gYbWyJU5iLHYg/QiuaeLhJVNkBwj74zHt7K5ekgw6xK/ekef
         z2cyUbG91mjpJhCE2pTIdxx4C9QdPaQun/AQ6VRQArFce/bCfCfNE4GBBhINm7cmInc/
         wH4CsLwzKOY5Qmzfa2iWPPyEFj53jyCDglCF+NTKHBSNIUhLx3xyP8ZrfJsTz3TA5Kyg
         RNpzYgUB8xi8IoFjixT83gxU76y78dEER7L+ATlHJhIF/9oolbP034O/Bq1aedZM8tmb
         sMEFeuFa96rGchDfK/VhTUYJq8K4kvNDuFvzk/m+wQEIaQCkjQdO2sY/pD8ZCCDXq7+Q
         Gmog==
X-Gm-Message-State: AJIora8ifk/oZKz25QVt1z2arkQAetP27mfnWjAm1w4uXs9Caf4QWNzF
	ytKxuwd+Qn3ZIC11NcZqO+0=
X-Google-Smtp-Source: AGRyM1sWtLR8zgi6kzKF2OShM6ctfTjiFq7rNCAiC2vlw6wFlKpTJ4dcj02VoAJ2FYooe9pPWq0Fog==
X-Received: by 2002:a05:600c:4e8d:b0:3a1:2e4d:1dd2 with SMTP id f13-20020a05600c4e8d00b003a12e4d1dd2mr5074937wmq.85.1657204931102;
        Thu, 07 Jul 2022 07:42:11 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id x2-20020adfdd82000000b0021d62e30a62sm14467685wrl.50.2022.07.07.07.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:42:10 -0700 (PDT)
Message-ID: <0958f352-2eaa-d051-ec14-a379bb2c0d8c@gmail.com>
Date: Thu, 7 Jul 2022 16:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/11] MT8195 Chromebooks devicetrees - Google Tomato
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, hsinyi@chromium.org,
 nfraprado@collabora.com, allen-kh.cheng@mediatek.com, gtk3@inbox.ru,
 luca@z3ntu.xyz, sam.shih@mediatek.com, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_074215_099962_B2DEB17B 
X-CRM114-Status: GOOD (  19.20  )
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



On 04/07/2022 12:13, AngeloGioacchino Del Regno wrote:
> This is the first part for upstreaming Google's Cherry Tomato
> Chromebook (Acer Chromebook Spin 513): in this series, we introduce
> the devicetrees for the four revisions of this Chromebook and enable
> every controller and feature that can be added as per the current
> state of the main SoC devicetrees (mt8195.dtsi) and its PMIC
> devicetree (mt6359.dtsi).
> 
> More parts will come as soon as more support will be added by
> MediaTek in the mt8195 devicetree.
> 

Series applied, thanks!

> Note: This series will introduce a dtbs_check warning about a failure
>        to match compatible for 'mediatek,mt6359': that's expected, as
>        this is defined in devicetree/bindings/mfd/mt6397.txt (so there
>        is no schema, yet).
> 
> Changes in v2:
>   - Added changes from Nìcolas' review
>   - Changed board 'model' from 'MediaTek Tomato' to 'Acer Tomato'
> 
> This series depends on the following fixes:
> [1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220630110453.186526-1-angelogioacchino.delregno@collabora.com/
> [2]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220630122334.216903-1-angelogioacchino.delregno@collabora.com/
> [3]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220630131543.225554-1-angelogioacchino.delregno@collabora.com/
> 
> 
> And it depends on Nìcolas' dt-bindings patch for the [01/11] to
> apply cleanly (this is done to keep mediatek.yaml ordered):
> [4]: https://lore.kernel.org/all/20220629155956.1138955-2-nfraprado@collabora.com/
> 
> 
> AngeloGioacchino Del Regno (11):
>    dt-bindings: arm: mediatek: Add MT8195 Cherry Tomato Chromebooks
>    arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato
>    arm64: dts: mediatek: cherry: Add platform regulators layout and
>      config
>    arm64: dts: mediatek: cherry: Assign interrupt line to MT6359 PMIC
>    arm64: dts: mediatek: cherry: Add support for internal eMMC storage
>    arm64: dts: mediatek: cherry: Document gpios and add default pin
>      config
>    arm64: dts: mediatek: cherry: Enable I2C and SPI controllers
>    arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers
>    arm64: dts: mediatek: cherry: Enable MT6360 sub-pmic on I2C7
>    arm64: dts: mediatek: cherry: Enable support for the SPI NOR flash
>    arm64: dts: mediatek: cherry: Add I2C-HID touchscreen on I2C4
> 
>   .../devicetree/bindings/arm/mediatek.yaml     |  13 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   3 +
>   .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  15 +
>   .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  35 +
>   .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  36 +
>   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 702 ++++++++++++++++++
>   6 files changed, 804 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> 

