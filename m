Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F29FC761AF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2Yj8+6rac+oWtMSroVgtG8FgK+CLOna3xmgumj6lLs=; b=OZPMR0S7zmqYtXhaGBg9+ZX91K
	npGZuhRBZTvIfezlPTISH6icrH0iwftYqc5KBBKpWzBkiD80K6ByURCor9TLbU8vccHf7ahdekLd0
	CG+EYIbR3J1CLS2jpjWXhTTyjnED29yAuA/JAGUov/iEiOQ65VfxK8A1sgZ0xNRdNsmsn5vr/GIaL
	o9V9J7QHg5a5B358RXS1cJn/xMiNqS1atT88VQVJLVo8oyj75DL1iNUJ9/TpvXJzEhWsJZsMRuJpu
	/79qSHPvWRObPChlu0SJdgwlEHPynwC/QZEiqmTKFdLeSWxkf5sZNebi2ykkPE/GCUydvfARu4V60
	tjqt9g1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phn2p-002yYT-0r;
	Thu, 30 Mar 2023 07:50:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phn2l-002yWz-0h;
	Thu, 30 Mar 2023 07:50:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so7555327wmq.3;
        Thu, 30 Mar 2023 00:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680162596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p2Yj8+6rac+oWtMSroVgtG8FgK+CLOna3xmgumj6lLs=;
        b=f2aLCGR7bb9A9uz3r7WTbcr3IrYLXykt4K5wi/HIYtzguQUGHO7BXbCkFYITS+R6No
         5kykc3yYu8om7nagnDucLMGmIZsLjFb3BM2lzYwcJYO3x++ACHXqwb82MyGFVMd0MTBl
         ToHAVkw2M8cu1s1ikQtSX/QeG1gVHGAJ7V6rTNXM5YbnaYmQktumpf4RsrN/XvF8iaYw
         OZtVH0eosvc+UxUYKhwqI9tZjXiPHmfxien//MijaIVACdd3xri+BYrdWSaq1d8BaHCt
         9sIHRLEMTjcmCt00GmbEoTIDmDtpr3hzkQeBdq9cW8ufwu+TMKseXUtxWYYKiLBTB3UY
         8Xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680162596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2Yj8+6rac+oWtMSroVgtG8FgK+CLOna3xmgumj6lLs=;
        b=eM+ySckpNWGaTVgMfFCYCZRCxHy8ALmgnZl7CDNbiTRsMDV22UelQWg65GY/e5VX8m
         khbbdYLGLeO1fzML7QNK6HDZG3CaWryJfBWDw0NnGuGt6IQniqj2U3lGnhfLIlyZR+A6
         IYzcSXKpojrciqgGl7UnpEitQPchhA3timqCk7j+qKL7veg0u4rDQ5K43++2TRbQwDYe
         9fvXeeijp3ivvzR2ZiSV+KVJzXjfEKRzpG08/I0PJGdWIuU6ox34pyExvrDtYv1S5cy1
         caFO3F/LhB5reAgDE+XimGOCGbWasr0pOoX6yZ/uaNFBxUaZhjTSDObZPaJH5qL5eRzM
         w8pg==
X-Gm-Message-State: AO0yUKUao7tg8o+0KfVhqr/+gRda0M1CJb1+c/5je6nsMsq8Q6J1tXxd
	DG51To3Ogtu+JzqgpzmwUjKwkXq/tGsy8TVF
X-Google-Smtp-Source: AK7set9m9jZdEwstgP9yAGFN+jesF4c75G/nHeFfXao4ibkEeJTHOxAAVg569Wtjq47hrkctGNg0Iw==
X-Received: by 2002:a05:600c:282:b0:3ed:b094:3c93 with SMTP id 2-20020a05600c028200b003edb0943c93mr16795513wmk.23.1680162595935;
        Thu, 30 Mar 2023 00:49:55 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n19-20020a7bcbd3000000b003ef684c5e32sm4759483wmi.48.2023.03.30.00.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:49:54 -0700 (PDT)
Message-ID: <c0aecb1a-eb84-bc59-4ba1-1af9cf88e72e@gmail.com>
Date: Thu, 30 Mar 2023 09:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 00/19] Enable GPU with DVFS support on MediaTek SoCs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_004959_260824_F1DC256E 
X-CRM114-Status: GOOD (  20.16  )
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



On 01/03/2023 10:55, AngeloGioacchino Del Regno wrote:
> Changes in v4:
>   - Added a fix for MT8192 Vgpu voltage constraints
>   - Changed constraints for MT8192 VSRAM-GPU to reflect the maximum
>     achievable voltage as per the actual vsram-vgpu relation constraint
> 
> Changes in v3:
>   - Changed MT8186 compatibles for new bindings
>   - Added min/max voltage overrides for vgpu/vsram_gpu on
>     mt8183-pumpkin and evb as suggested by Chen-Yu
>   - Cosmetic fixes for "arm64: dts: mediatek: mt8192: Add GPU nodes"
> 
> Changes in v2:
>   - Changed MT8186 to use only two power domains for the GPU.
> 
> We finally have working GPU DVFS on MediaTek SoCs.
> On Panfrost.
> For real.
> ...and the best part is that it's going upstream.
> 
> In order to get GPU DVFS working, it was necessary to satisfy a
> specific constraint (which is different, depending on the SoC)
> between two regulators: GPU VCORE and GPU SRAM.
> This was done through adding the mtk-regulator-coupler driver,
> which transparently manages the voltage relation between these
> two vregs, hence completely eliminating the need to manage these
> regulators in the Panfrost driver; this solves the long standing
> issue with devfreq+opp tables not supporting managing voltages
> for two regulators per opp entry out of the box, due to which
> we never got GPU DVFS on those SoCs, often locking them out to
> a low GPU frequency.
> 
> This changes. Right now!
> 
> Tested on MT8192, MT8195 Chromebooks.
> 

Applied, thanks!

> This series depends on [1].
> 
> [1]: https://lore.kernel.org/lkml/20230228102704.708150-1-angelogioacchino.delregno@collabora.com/
> 
> Alyssa Rosenzweig (2):
>    arm64: dts: mediatek: mt8192: Add GPU nodes
>    arm64: dts: mediatek: mt8192-asurada: Enable GPU
> 
> AngeloGioacchino Del Regno (16):
>    arm64: dts: mediatek: mt8183-kukui: Couple VGPU and VSRAM_GPU
>      regulators
>    arm64: dts: mediatek: mt8183-kukui: Override vgpu/vsram_gpu
>      constraints
>    arm64: dts: mediatek: mt8183: Remove second opp-microvolt entries from
>      gpu table
>    arm64: dts: mt8183-pumpkin: Couple VGPU and VSRAM_GPU regulators
>    arm64: dts: mediatek: mt8183-evb: Couple VGPU and VSRAM_GPU regulators
>    arm64: dts: mediatek: mt8183: Use mediatek,mt8183b-mali as GPU
>      compatible
>    arm64: dts: mediatek: mt8192: Add mfg_ref_sel clock to MFG0 domain
>    arm64: dts: mediatek: mt8192-asurada: Assign sram supply to MFG1 pd
>    arm64: dts: mediatek: mt8192-asurada: Fix voltage constraint for Vgpu
>    arm64: dts: mediatek: mt8192-asurada: Couple VGPU and VSRAM_OTHER
>      regulators
>    arm64: dts: mediatek: mt8195: Add mfg_core_tmp clock to MFG1 domain
>    arm64: dts: mt8195: Add panfrost node for Mali-G57 Valhall Natt GPU
>    arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
>    arm64: dts: mediatek: mt8186: Add GPU node
>    arm64: dts: mediatek: mt8183-pumpkin: Override vgpu/vsram_gpu
>      constraints
>    arm64: dts: mediatek: mt8183-evb: Override vgpu/vsram_gpu constraints
> 
> Nícolas F. R. A. Prado (1):
>    arm64: dts: mediatek: mt8192-asurada: Add MFG0 domain supply
> 
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  17 ++-
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  17 ++-
>   .../boot/dts/mediatek/mt8183-pumpkin.dts      |  17 ++-
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  34 ++---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  17 +++
>   .../boot/dts/mediatek/mt8192-asurada.dtsi     |  24 +++-
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 116 +++++++++++++++++-
>   .../boot/dts/mediatek/mt8195-cherry.dtsi      |   5 +
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  95 +++++++++++++-
>   9 files changed, 315 insertions(+), 27 deletions(-)
> 

