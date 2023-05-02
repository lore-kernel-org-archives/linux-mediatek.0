Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9FCC19F20
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 22:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1p8PAJD9DFCngojw0T3kSd1c2uyqBORxfNEmDK3GJ4=; b=wvP777/93OOKHhSswIX70ZSNh1
	vjoouUAqay6RbXTnwPVVw3HPs4xJK8NY11ZgC5pOL46ZAdVhW2xzbw9REocw0iL2lNlehC2y47Ovs
	2KsN87heqa2JIKhQls8d2wOD5S44cpZ+KWD7LFG0vSjvpkPBNTZpzB9f15jq1QkkQkYYdlG/+c4L/
	6agg72Eix8TPRxUr6Q99nOc/3EdgAHO5vCYP/y5EemhD9/g7LhvI45zR33GzPIi07IN+FXyMSeN9h
	hJuKm5yc8+EdvyB340yXlE9s/ZmBo0I3nOo2T8/JBT5Jqwl5e2Lh5Jk8HoLMhSC6axsC3Sb+oAuAY
	+Wsg+U3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptyrJ-002p5C-21;
	Tue, 02 May 2023 22:52:33 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptyrF-002p2I-3C
	for linux-mediatek@lists.infradead.org;
	Tue, 02 May 2023 22:52:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f0108a7d20so5140718e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 May 2023 15:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683067945; x=1685659945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1p8PAJD9DFCngojw0T3kSd1c2uyqBORxfNEmDK3GJ4=;
        b=BUUnQw61aCluaeaOfOjylr17lq4wyiS3svEJzNGaImPvwBFbxjY1AYjKa65LSPa2ym
         yE16k3jpuP3N8wCSlIVKGAALWKur7gs6Ffzu8U/kGAiuA1Xyx/x2hK/JJfWNLEFbZFh+
         gw5Uv9OoWoi9etQy1IAyVFsO7YWXlAUhhQim+LNTWB6y3zMhsYaevaqfbTuzGPLNMccY
         J+vqS7x9RyTltzOUQDkaayM18bum3WFZAKA4wqgFiMMBPsbYfXaNiW1/rSr4VdyK3Fqn
         5j1I0Zeq+WoDj447GF++RwHlJ/hGKjEKpd2ivZT8M021uOxvON7tTCA8VLC+2Vt7SgLR
         uLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683067945; x=1685659945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1p8PAJD9DFCngojw0T3kSd1c2uyqBORxfNEmDK3GJ4=;
        b=eLajJULF1UPFnKzbeWAF0jGJaSwuy1tSjKSG5j6UCu8sDXiVCtaIlvAcSnTQIExwOr
         8SKenh630lrXwQINNuzQc1XQ70C82sjyZHyhETUhiN6wwQMifMg16ylmBbZDeUkogsoB
         vua1AtH/BO2fiWpMUacbyN03hjx1bUwRPN/eqIi9IFNQJ8od5D+MDT8zbg8s4ETjix9a
         RwzzF7HrSy+Oc89qZkne9ot5m0UPh23IcwgIs1H3RQNbMTgjh16SQ09aTiAHJphiBmgD
         wR2/W6722azrOUfe/gWx6Dv8BW9u36VPUraZN+Ytd46C6VcfgR5J1vQDXpEJ+0mCjlxA
         U4YQ==
X-Gm-Message-State: AC+VfDxOpsfQavfWOYrqaj16tKvyN4z52UUJb7RHnalrce4oSg5tGlsx
	7AEMYvy/h4jc4BVBqBpJ3KFuGw==
X-Google-Smtp-Source: ACHHUZ6Oo6CNJusINV9/L7Xt1q+0o1hyr6U1jjDYvnM0ZlUDdwA1vrQ5KYtmvDXiiUxPR0FKQ1HT5g==
X-Received: by 2002:a19:c204:0:b0:4f1:223c:dc83 with SMTP id l4-20020a19c204000000b004f1223cdc83mr355945lfc.48.1683067945539;
        Tue, 02 May 2023 15:52:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r16-20020ac24d10000000b004ddaea30ba6sm5607156lfi.235.2023.05.02.15.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 15:52:24 -0700 (PDT)
Message-ID: <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org>
Date: Wed, 3 May 2023 01:52:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-GB
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
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_155230_140601_4EC45AFC 
X-CRM114-Status: GOOD (  26.74  )
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

On 02/05/2023 22:40, Rob Herring wrote:
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

I'd question if it makes sense to split the pxa line. Yes, it was sold 
by Intel to Marvell, but IIRC the devices still had some inheritance. 
So, if we have the 'pxa' subdir, I'd move Marvell PXAs to that dir too.

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
>      'exynos' : 'samsung',
>      's3c' : 'samsung',
>      's5p' : 'samsung',
>      'gemini' : 'gemini',
>      'hi3' : 'hisilicon',
>      'hip' : 'hisilicon',
>      'hisi' : 'hisilicon',
>      'sd5' : 'hisilicon',
>      'hpe' : 'hpe',
>      'intel': 'intel',
>      'mt' : 'mediatek',
>      'meson' : 'meson',
>      'moxa' : 'moxa',
>      'mstar' : 'mstar',
>      'nuvo' : 'nuvoton',
>      'lpc' : 'lpc',
>      'lan96' : 'microchip',
>      'owl' : 'actions',
>      'ox8' : 'oxsemi',
>      'rda' : 'rda',
>      'rtd' : 'realtek',
>      'r7' : 'renesas',
>      'r8' : 'renesas',
>      'r9' : 'renesas',
>      'emev2' : 'renesas',
>      'sh73a' : 'renesas',
>      'gr-' : 'renesas',
>      'iwg' : 'renesas',
>      'rk' : 'rockchip',
>      'rv11' : 'rockchip',
>      'rockchip' : 'rockchip',
>      'socfpga' : 'socfpga',
>      'stm' : 'stm32',
>      'sti' : 'sti',
>      'st-pin' : 'sti',
>      'ste' : 'st-ericsson',
>      'spear' : 'spear',
>      'axp' : 'allwinner',
>      'tegra' : 'nvidia',
>      'milbeaut' : 'socionext',
>      'uniph' : 'socionext',
>      'vt8500' : 'vt8500',
>      'wm8' : 'vt8500',
>      'xen' : 'xen',
>      'zx' : 'zte',
>      'zynq' : 'xilinx',
> }
> 
> Rob
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm-dts-move-v2

-- 
With best wishes
Dmitry


