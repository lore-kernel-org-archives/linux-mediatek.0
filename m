Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808EDC7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 22:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Mp6CzPotn9aMhYuP1SiSdnM3toCuetUTL6p1Pka30U=; b=M9F95Th2vh1gTHaLBDEnFtg30+
	txY2t0cp/Mv+6EBOifFG7ApNz6oDTTD78B4hK1mJ9uIm/F1UEksATxxNzWu0cfSv+MMj1kxRlnVIu
	BUCLUcmvFfTzxYUEMbNmMaG+WU5kCY7S+lvqr+vQtRjDewsPDdvsyYBU8k54gwX6jQyAIHjGWcbVz
	w3HdNHyejozuu3Xb6rphD0H6BFvQc0B9p2xRaK3aQP51W8tJFgcHIUuxwP8gtN1M3CnUnRFzpfE2h
	pR5LgYUli3qXJD1hB+9Q8K/7u2pEraKLVnM2eKkUJKQFm/p3KmBR3C7PAoR9xL+f5dd6u/HM8AG+L
	iZJ21NYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puKzM-005zbb-0z;
	Wed, 03 May 2023 22:30:20 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puKzH-005za0-1w;
	Wed, 03 May 2023 22:30:17 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-24e4e23f378so848980a91.3;
        Wed, 03 May 2023 15:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683153012; x=1685745012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Mp6CzPotn9aMhYuP1SiSdnM3toCuetUTL6p1Pka30U=;
        b=bNRlnnTF+SjZJvfO0HArhda1ki6KEyIa7yIRZQPDhMmTqTNNooLEQemu27nE0HCTDC
         ehg0UFT/VFvJrzxIMMpqs/LfyiZTcvfm3F+XeRCHeLKiHGTslEamAcA/igyUj1RUpYqb
         jGTv1DRSnyHXSO+6BklV+H0tQUegWEpRcj9ZpU3IZeJyr0OTp0uWflXKxNLt/Dv3Fo9Q
         lyreFoA/HC5oPSx7g0RJgiSEs9GwL3CQmot20cPJQBMw9eDNFCnNWmZeSQ/ZfOgd+UUX
         wLIk2ukG1JzFJdW7nk5OX9lr2jX57mY836CjkAxfeHIEUZ2uly4MzKA0lNXFe8yznUDm
         6rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683153012; x=1685745012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Mp6CzPotn9aMhYuP1SiSdnM3toCuetUTL6p1Pka30U=;
        b=fvSppl+XYrlj0G5PSUThWBml7cvvVPPPY1HN1s6thpwAF8dGXwwtw68mPWWP4kJBoD
         6//Kampt7t+jvSUumc7Zj6rCa8rPNmB1d+/CtHJ8WFVkhV941ZdkfE/9P23IHcdzNV/i
         nrQkb7jk/o5cBHE9hTTREnfSOJx5B+rCMT7sXzmX51xwunXa6RTUzyGNbG9EGcxPwhve
         j2skdoFy96fDSKbDdoGyh4aLaLLTdRUyqREfQ7Fv5WEaiooR4TMmeYnG/yz5LztTcYMP
         6IUoK9ZIGVeM5zMAKmL8pf5loST4nEb+uF4RoOShGiLcvvuJ6L+7nkB4wEjLB1NOxRZ6
         er/Q==
X-Gm-Message-State: AC+VfDysi5oCru+/qjFl9X2wg4L6X2QRr2VvdXNry7f2vkjLPOJ1CxXt
	gOm9NAkDl06JQuRtPMMuIaY=
X-Google-Smtp-Source: ACHHUZ68cmsHxtB87iONW+SsuMsSJr4NkMfMrRrxl8kzW+7lj28j0Q7Ue/XhdACq9ZdVdGd7yUEu7w==
X-Received: by 2002:a17:90a:a891:b0:247:bdd3:a039 with SMTP id h17-20020a17090aa89100b00247bdd3a039mr172899pjq.8.1683153011868;
        Wed, 03 May 2023 15:30:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id jx12-20020a17090b46cc00b0024e0141353dsm1872551pjb.28.2023.05.03.15.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 15:30:11 -0700 (PDT)
Message-ID: <bae5336c-a26a-cabb-6b83-ee9cece18130@gmail.com>
Date: Wed, 3 May 2023 15:29:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Olof Johansson <olof@lixom.net>, Christian Marangi <ansuelsmth@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
 <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_153015_665548_AA3866F4 
X-CRM114-Status: GOOD (  21.81  )
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

On 5/2/23 18:04, Rob Herring wrote:
> On Tue, May 2, 2023 at 6:02 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On 5/2/23 12:40, Rob Herring wrote:
>>> On Tue, May 2, 2023 at 3:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>>
>>>> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
>>>>> On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>>
>>>>>> Does your script also cater for .dts files not matching any pattern,
>>>>>> but including a .dtsi file that does match a pattern?
>>>>>
>>>>> I assume I built everything after moving, but maybe not...
>>>>>
>>>>> That's all just "details". First, we need agreement on a) moving
>>>>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
>>>>> been stuck on a) for being 'too much churn'.
>>>>
>>>> Sorry for missing most of the discussion last week. The script sounds
>>>> fine to me, the only reason I didn't want to do this in the past is that
>>>> we had the plan to move platforms out of the kernel tree to an external
>>>> repository and I wanted to do this platform at a time and also only move
>>>> each one once. I don't think that is going to happen anytime soon now,
>>>> so let's just do your script.
>>>>
>>>> Can you send me the script and/or a pull request of the resulting
>>>> tree based on my soc/dt branch? Everything is merged upstream,
>>>> and I think git-merge would handle the remaining merges with any
>>>> other changes in mainline.
>>>
>>> I've dusted off my script and made a branch[1] with the result.
>>> There's just a couple of fixes needed after the script is run (see the
>>> top commit). The cross arch includes are all fixed up by the script.
>>> dtbs_install maintains a flat install. I compared the number of .dtbs
>>> before and after to check the script.
>>>
>>> I think the only issue remaining is finalizing the mapping of
>>> platforms to subdirs. What I have currently is a mixture of SoC
>>> families and vendors. The most notable are all the Freescale/NXP
>>> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
>>> either. Once that's finalized, I still need to go update MAINTAINERS.
>>>
>>> Here's the current mapping:
>>>
>>> vendor_map = {
>>>       'alphascale' : 'alphascale',
>>>       'alpine' : 'alpine',
>>>       'artpec' : 'axis',
>>>       'axm' : 'lsi',
>>>       'cx9' : 'cnxt',
>>>       'ecx' : 'calxeda',
>>>       'highbank' : 'calxeda',
>>>       'ep7' : 'cirrus',
>>>       'mxs': 'mxs',
>>>       'imx23': 'mxs',
>>>       'imx28': 'mxs',
>>>       'sun' : 'allwinner',
>>>       'imx': 'imx',
>>>       'e6' : 'imx',
>>>       'e7' : 'imx',
>>>       'mba6' : 'imx',
>>>       'ls': 'fsl',
>>>       'vf': 'fsl',
>>>       'qcom': 'qcom',
>>>       'am3' : 'ti',
>>>       'am4' : 'ti',
>>>       'am5' : 'ti',
>>>       'dra' : 'ti',
>>>       'keystone' : 'ti',
>>>       'omap' : 'ti',
>>>       'compulab' : 'ti',
>>>       'logicpd' : 'ti',
>>>       'elpida' : 'ti',
>>>       'motorola' : 'ti',
>>>       'twl' : 'ti',
>>>       'da' : 'ti',
>>>       'dm' : 'ti',
>>>       'nspire' : 'nspire',
>>>       'armada' : 'marvell',
>>>       'dove' : 'marvell',
>>>       'kirkwood' : 'marvell',
>>>       'orion' : 'marvell',
>>>       'mvebu' : 'marvell',
>>>       'mmp' : 'marvell',
>>>       'berlin' : 'berlin',
>>>       'pxa2' : 'pxa',
>>>       'pxa3' : 'pxa',
>>>       'pxa' : 'marvell',
>>>       'arm-' : 'arm',
>>>       'integ' : 'arm',
>>>       'mps' : 'arm',
>>>       've' : 'arm',
>>>       'aspeed' : 'aspeed',
>>>       'ast2' : 'aspeed',
>>>       'facebook' : 'aspeed',
>>>       'ibm' : 'aspeed',
>>>       'openbmc' : 'aspeed',
>>>       'en7' : 'airoha',
>>>       'at91' : 'microchip',
>>>       'sama' : 'microchip',
>>>       'sam9' : 'microchip',
>>>       'usb_' : 'microchip',
>>>       'tny_' : 'microchip',
>>>       'mpa1600' : 'microchip',
>>>       'animeo_ip' : 'microchip',
>>>       'aks-cdu' : 'microchip',
>>>       'ethernut5' : 'microchip',
>>>       'evk-pro3' : 'microchip',
>>>       'pm9g45' : 'microchip',
>>>       'ge86' : 'microchip',
>>>       'bcm' : 'brcm',
>>
>> How about we use 'broadcom' here, to follow what arm64 does? I could
>> rename arch/mips/boot/dts/brcm to arch/mips/boot/dts/broadcom for
>> consistency, too?
> 
> Okay, though if starting clean I'd somewhat prefer to use the vendor
> prefix. I guess since arm and arm64 share dtsi files, they should
> match.

Sounds good to me, let's go with "brcm" then.
-- 
Florian


