Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED8DC19F20
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVUCe/5y2Ex7bNIQOvHne7x9R8A0wELwbdEse2WDpF8=; b=d9Q3+dRKYz5kcPYDHzE24zrWCZ
	RnpV8LuoWp0cEiCoalzvFUbVkfTwuz+huLp2dg7EC5rqRxE/bWnmhn/BIXJG5bWPJD9jNyzDjOXvJ
	Y2jPYCZclh+3FPBrY/txmbXoc/z/y7trB2XPq5iwSlZVxtFnk3HV0joHUppv4Sg0l3RCDCeQDYL9U
	X5ZAi6ovHv7UUmGByQ3fzBtoHZyNXmYxLfuTqZaWJnFcO4Zif/jg7Xdgs4kZN1J1Q04/6Mt5+2Hvn
	X2h/Kk7JSGYz9wlaezRvfilH1JH7l9QxTTBnLSMurMlmpthWv1gLXk6a9AUMgF5z2f7tVB5MsOoCz
	jLevt3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptz1L-002qRA-0h;
	Tue, 02 May 2023 23:02:55 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptz1E-002qPH-1A;
	Tue, 02 May 2023 23:02:51 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7515631b965so46537685a.0;
        Tue, 02 May 2023 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683068567; x=1685660567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVUCe/5y2Ex7bNIQOvHne7x9R8A0wELwbdEse2WDpF8=;
        b=iHBlY9kIRMOF3Yq8hT/HYtLwTwjoof0FVfaEhNjRSWPoYgoA1qtRUzGwD+nkjOzJPI
         u09FXpbJrjxtM3MFyzM74JfHNsb7UZ0GJze/A7Ip/HD+5roEWeYmZwjlYu0a2cdkfbwf
         +kLbPvAmDmxad5KujOjWnyiCW+W4okHTLQRqn4fLYSw7t/qXPwhwMm5mWSJxb8hi+d0O
         ev3gtx0+XlazA6w82yl+mnLoL1jpad70ZxSgOz1YQXa9W1BLk0lheCYSgecLnoqpXxAH
         /k0Y7rMrxmhfNEQZTdJyCemWb5DMYD7STFJO05Jiqj2/50xWs6TXP7C2X1ywzoueu5sn
         IGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683068567; x=1685660567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVUCe/5y2Ex7bNIQOvHne7x9R8A0wELwbdEse2WDpF8=;
        b=h8vGgYOsVBnljhYkgYd5rmn31TSUCZnzfOzIeQoZxygXWSByCOPbkBTH4cJ1mQsqvs
         jR2FdQk37WdGjC77VqFFxu9IcOFC+JnZN/S7kduRzn8nKBUgaCszbKQGKDQalWpeyAx6
         RrpBg9/2sLU4AGkLnM4W+LDZaNx+UQSuVXIrhO1AqRrPsd7aj4JdlxBFH/MkVOHWIzG0
         lN0mM2ftbmPpoyEbQ1A8VVvaz1nsTLqT12THT1+IzaLHpuO9hX8GVJcJAjINrTENLRkt
         R7YH8e+TG4cMDo8s4kMGCl0xymy1q1Uew2kiaVREX2ztxwrmjmzcy1zf5C2F2L/lUOMm
         n1wg==
X-Gm-Message-State: AC+VfDwb0dflP30VAqt+9pnt5PwcoCT+CA5HuY7oMjwgB8LW5G/dFKKL
	2K00kiMrPe+hu3lrdqPVc6E=
X-Google-Smtp-Source: ACHHUZ4eSB1jw2dhw1LAIzPe/MR5kdc4AoCnBVEG18379hjnfMdu0BtdA7D5r0jmXaGKb3nbIbuwpA==
X-Received: by 2002:a05:6214:d64:b0:61a:96d3:bd20 with SMTP id 4-20020a0562140d6400b0061a96d3bd20mr380920qvs.10.1683068566677;
        Tue, 02 May 2023 16:02:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id t18-20020a0cea32000000b0061b71220644sm326246qvp.19.2023.05.02.16.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 16:02:45 -0700 (PDT)
Message-ID: <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
Date: Tue, 2 May 2023 16:02:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson
 <olof@lixom.net>, Christian Marangi <ansuelsmth@gmail.com>,
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
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_160248_445605_2988CCEB 
X-CRM114-Status: GOOD (  26.35  )
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

On 5/2/23 12:40, Rob Herring wrote:
> On Tue, May 2, 2023 at 3:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
>>> On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>
>>>> Does your script also cater for .dts files not matching any pattern,
>>>> but including a .dtsi file that does match a pattern?
>>>
>>> I assume I built everything after moving, but maybe not...
>>>
>>> That's all just "details". First, we need agreement on a) moving
>>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
>>> been stuck on a) for being 'too much churn'.
>>
>> Sorry for missing most of the discussion last week. The script sounds
>> fine to me, the only reason I didn't want to do this in the past is that
>> we had the plan to move platforms out of the kernel tree to an external
>> repository and I wanted to do this platform at a time and also only move
>> each one once. I don't think that is going to happen anytime soon now,
>> so let's just do your script.
>>
>> Can you send me the script and/or a pull request of the resulting
>> tree based on my soc/dt branch? Everything is merged upstream,
>> and I think git-merge would handle the remaining merges with any
>> other changes in mainline.
> 
> I've dusted off my script and made a branch[1] with the result.
> There's just a couple of fixes needed after the script is run (see the
> top commit). The cross arch includes are all fixed up by the script.
> dtbs_install maintains a flat install. I compared the number of .dtbs
> before and after to check the script.
> 
> I think the only issue remaining is finalizing the mapping of
> platforms to subdirs. What I have currently is a mixture of SoC
> families and vendors. The most notable are all the Freescale/NXP
> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
> either. Once that's finalized, I still need to go update MAINTAINERS.
> 
> Here's the current mapping:
> 
> vendor_map = {
>      'alphascale' : 'alphascale',
>      'alpine' : 'alpine',
>      'artpec' : 'axis',
>      'axm' : 'lsi',
>      'cx9' : 'cnxt',
>      'ecx' : 'calxeda',
>      'highbank' : 'calxeda',
>      'ep7' : 'cirrus',
>      'mxs': 'mxs',
>      'imx23': 'mxs',
>      'imx28': 'mxs',
>      'sun' : 'allwinner',
>      'imx': 'imx',
>      'e6' : 'imx',
>      'e7' : 'imx',
>      'mba6' : 'imx',
>      'ls': 'fsl',
>      'vf': 'fsl',
>      'qcom': 'qcom',
>      'am3' : 'ti',
>      'am4' : 'ti',
>      'am5' : 'ti',
>      'dra' : 'ti',
>      'keystone' : 'ti',
>      'omap' : 'ti',
>      'compulab' : 'ti',
>      'logicpd' : 'ti',
>      'elpida' : 'ti',
>      'motorola' : 'ti',
>      'twl' : 'ti',
>      'da' : 'ti',
>      'dm' : 'ti',
>      'nspire' : 'nspire',
>      'armada' : 'marvell',
>      'dove' : 'marvell',
>      'kirkwood' : 'marvell',
>      'orion' : 'marvell',
>      'mvebu' : 'marvell',
>      'mmp' : 'marvell',
>      'berlin' : 'berlin',
>      'pxa2' : 'pxa',
>      'pxa3' : 'pxa',
>      'pxa' : 'marvell',
>      'arm-' : 'arm',
>      'integ' : 'arm',
>      'mps' : 'arm',
>      've' : 'arm',
>      'aspeed' : 'aspeed',
>      'ast2' : 'aspeed',
>      'facebook' : 'aspeed',
>      'ibm' : 'aspeed',
>      'openbmc' : 'aspeed',
>      'en7' : 'airoha',
>      'at91' : 'microchip',
>      'sama' : 'microchip',
>      'sam9' : 'microchip',
>      'usb_' : 'microchip',
>      'tny_' : 'microchip',
>      'mpa1600' : 'microchip',
>      'animeo_ip' : 'microchip',
>      'aks-cdu' : 'microchip',
>      'ethernut5' : 'microchip',
>      'evk-pro3' : 'microchip',
>      'pm9g45' : 'microchip',
>      'ge86' : 'microchip',
>      'bcm' : 'brcm',

How about we use 'broadcom' here, to follow what arm64 does? I could 
rename arch/mips/boot/dts/brcm to arch/mips/boot/dts/broadcom for 
consistency, too?
-- 
Florian


