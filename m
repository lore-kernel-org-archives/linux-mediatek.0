Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1489C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpaZuAjuThZlRnxKVIKAQ0qtHdJgyrsxdPIII0CXp90=; b=HwTd+g6/1aFpIx0IVpYZQ4zZg/
	bTLvTG+4pN7ewsBsmWmFmVoG5Ny76JdE0jQN2JHD2mslt32DbctcoivagdAGSPHw8xoX7liDpwdW7
	s9TMIBuYcD6Dg26x2RkpwEQhgQP0hxAqJJUiKAORHScT/EMLCweuLr82hybVXnB563p5xPcv/egSA
	mAS6ABHb0DSOwNFaUe/0loifmdY8SGPC7f9q3HFpXJpfRTLfCO4OGOFwQsUfzH++dhK1tKSC5DKy4
	74MBshpO0EP64/UZjhy/dUw5/DywkgrnqEuUA6z8De8o5z6w0eIaAGYFZNeq3BNiQ0IG+FjfIedSQ
	vBKAczTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68vE-00EVAG-R9; Fri, 16 Dec 2022 11:30:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68u6-00EUd0-9d; Fri, 16 Dec 2022 11:29:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso1560839wmb.0;
        Fri, 16 Dec 2022 03:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GpaZuAjuThZlRnxKVIKAQ0qtHdJgyrsxdPIII0CXp90=;
        b=mtPEMKQHC49rkYm08SN7j+aZwE8oH/Dfcl0zxcEud0XrB9fRQY8dX8IcspXsHJId6n
         kWEXzbqtkYKTFLxjBX8o+I4YntjcX/ZjlAw/zpZ7Zdqku6PiWDARV4Oeba/tqCHMqz3V
         9sDZYIP5TAGVL7oz9KzO6lQbYnM9j8KYANcD+mgCqJIVUY3a7U6V/5tWaN5r9f3+ub9Z
         +q3hSddbuiGFqQj49l/oKfjfDMeeOmzhMhrHHLBr5zePDXKzRjWzXUThyhRBRc6baFka
         fAlkrjxFUQdPqWjR9E1hi65AzC7mreNFqYgr26gvOS1K0jC9v29OK2wdAjcQknXfAgbe
         NI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpaZuAjuThZlRnxKVIKAQ0qtHdJgyrsxdPIII0CXp90=;
        b=cPyy2qeBd1LwX1uipcQDf8K0BtvxeX+FdHA2tqmoucvaSlMoW91BJfWM9wHQ98sVdK
         7oZF/9rWRG7mJYNznkqW0Mig3wzaCf3sO8qXeGtA8vQxxDMwB038W4vXC4PT7ZaLa8Y1
         vnLlXxxrmOb/6Oz2/CrnN56AGiFw6FAakxAuQUXxy6BKX/XPEj1J6a1XsW9yl9mKhPWx
         BuKm3Ib3xKDq+ahgMjffWEY/ObZIb163hfCR+9qLhB5rMJ0aoTnd/8JRiBcdAHdkrc0+
         hKDSQ3NfMxfKrRPUQkyvV9mm7GLegWw6xJuQdnr3LZfSDqp4j0KYy8RABluTxridkl/N
         F/Kg==
X-Gm-Message-State: ANoB5pmjjOM7DkytqX3uL4HY2WXLK1l/Y25XTjvhHNagIFXXO4ipN39j
	jSN0AXdN5AfPU5rd1cKAGaE=
X-Google-Smtp-Source: AA0mqf50vgGgC0E+2Bl73SKnO7Rm9G5Kboue3lmjZtVDqghVtmFE3ITyL4Y94fjiMAmnbOWmSCsVCQ==
X-Received: by 2002:a7b:cd17:0:b0:3d2:2d2a:d58f with SMTP id f23-20020a7bcd17000000b003d22d2ad58fmr12911627wmj.2.1671190163034;
        Fri, 16 Dec 2022 03:29:23 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q14-20020a1cf30e000000b003cf6a55d8e8sm2256748wmq.7.2022.12.16.03.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:29:22 -0800 (PST)
Message-ID: <ec30d7c3-39af-197b-58df-440dcdb27a36@gmail.com>
Date: Fri, 16 Dec 2022 12:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/4] arm64: dts: mediatek: Fix systimer clock description
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
References: <20221201084229.3464449-1-wenst@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221201084229.3464449-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_032926_388979_73147ED8 
X-CRM114-Status: GOOD (  19.25  )
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



On 01/12/2022 09:42, Chen-Yu Tsai wrote:
> Hi,
> 
> This series fixes the clock description for the systimer block. The
> systimer is fed by the main 26 MHz oscillator, and internally divides
> the clock, normally by 2.
> 
> However this ended up being modeled in various incorrect ways, such as
> the clock divider being in the TOPCKGEN block, or as a standalone 13 MHz
> oscillator.
> 
> This series fixes the description of the systimer clock input in an ABI
> compatible way, i.e. the clock rate of the input clock remains the same
> at 13 MHz. The clock is now modeled as a divide-by-2 fixed factor clock
> being fed by the main oscillator.
> 
> An added benefit is that in Linux the systimer no longer requires the
> main SoC clk driver to do an early init dance.
> 
> Please have a look.
> 
> The next step would be to fix up the systimer driver in a backward
> compatible way and have it read the divider value from hardware.
> 

Whole series applied, thanks!

> 
> Regards
> ChenYu
> 
> Chen-Yu Tsai (4):
>    arm64: dts: mediatek: mt8183: Fix systimer 13 MHz clock description
>    arm64: dts: mediatek: mt8192: Fix systimer 13 MHz clock description
>    arm64: dts: mediatek: mt8195: Fix systimer 13 MHz clock description
>    arm64: dts: mediatek: mt8186: Fix systimer 13 MHz clock description
> 
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 12 ++++++++++--
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi |  8 +++++---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++--
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 11 ++++++++++-
>   4 files changed, 35 insertions(+), 8 deletions(-)
> 

