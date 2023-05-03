Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3686BC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 10:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDk/+beT2Vi+sTgcaduCKGPnBsodi2tO/SNsvbOgP+Y=; b=Cx9Z/RfQa9ltJr
	aCNAzltupIgwv7RZWRJ2JZ9OaRfOd42pfyNeKq9qWrHdwpYVcMmFHHI/ol3oY42qyy0DT/QjwEMS4
	yeV2ulOdOuXTK2fIkLi573rjEHboWAfTQijrxDdKcKahFT3O0hdHR8H70TTjVcs6os2SmnCS5DFdc
	dL+c/CEUCYE8c7K4tBA1C03/X4OHhYFBn3iCCgEZDq7eS3Cz9y4zSXS0mSkZBHh/3teUrNXbXpOzB
	arfufGCYF2ra6nLmM9ZPUP2Pq2uxtHbmPvO5BuwKRvd8oVEbbGuZG47keo5EDyDpEJOe29ED+7PMK
	UiRxcP+7HtAONQ1cxNSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu9w7-004DQY-2k;
	Wed, 03 May 2023 10:42:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu9vy-004DEZ-1H
	for linux-mediatek@lists.infradead.org;
	Wed, 03 May 2023 10:42:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f178da21afso33432435e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 May 2023 03:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683110522; x=1685702522;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BDk/+beT2Vi+sTgcaduCKGPnBsodi2tO/SNsvbOgP+Y=;
        b=uiHf7zU5OUclCL+nTNOzI51TiwU3XSMeDr4dH1jtzuJPzyrZsj2smb8gGZc0fqnV7x
         aHL1ofrmje1EDO+5gE0g6qKZ4EuW1aNNu5hqEHzlOnNFJg3dDUsEcnArL7QMqULeZ8QQ
         E78qfLE8YanRXWvr8VWZpJQWQZOP2OfsmOtFdKslaSwhg/W729dCGq8oA9CpVleD+Sf3
         qiwZnpKbCFJljnSJxR0hduidKNBpkgr+9ArXsLE1YdQrUZ5g0UtoCp+WQoSG9oLApN1q
         lpLnom5qusxbymkaYi2fPjD77aDN/15+0Ca22+r2BlmDKzsK4Ofi9VnpgXo/JmVv3006
         rcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683110522; x=1685702522;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDk/+beT2Vi+sTgcaduCKGPnBsodi2tO/SNsvbOgP+Y=;
        b=P0zzCeBt7qbCV3aI3XrRdb53XVanxTemDWHk5lSm8rTt7KaEQ8lMLidEKI1DyBUU/u
         YjmzuT3E0nZdM0J1USF3xsIIJw4yQOb1Gm+SrlbQagn9Up8Ort4YiT+6RocvuYSr8bsQ
         O+PlnkEKuqMYEa2K2LkkEgS43srK61m/uXE8qqUeiy1EFzrFwwGgj96rqueruZolKOEq
         ilEQAk6fqz+/NHCI9fqQD8SXKMhnf4fkne0UvrsZjdYwkKCzSYcbgaA6E+ltjQg7h8Yt
         fHhRJvMA2Ye09bV0RgqyC+rmv0/Qrl3sj0CEiK3F671zeLDSZmFvZTHZl/7qnBu//syt
         Q0VQ==
X-Gm-Message-State: AC+VfDx4uhgSxXUML3dqCoinFhDcKIFQvzV2rQDUNYjQXGlHvjxU/cJQ
	JPcIBMS4e+uqNmISaNWFjbx9fg==
X-Google-Smtp-Source: ACHHUZ4+w/861P1TP8XCtb+nKXdXmZXNl4DkJQUk42yYWgf1yqlqtWDrqllYUzBQocFIkyK2KHDH1w==
X-Received: by 2002:a7b:c391:0:b0:3f1:9391:46c with SMTP id s17-20020a7bc391000000b003f19391046cmr14791096wmj.30.1683110522481;
        Wed, 03 May 2023 03:42:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:68:e58d:3e87:f8c2? ([2a01:e0a:982:cbb0:68:e58d:3e87:f8c2])
        by smtp.gmail.com with ESMTPSA id u19-20020a7bc053000000b003f09d7b6e20sm1512696wmc.2.2023.05.03.03.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 03:42:02 -0700 (PDT)
Message-ID: <10572b4a-c3dc-6a28-bb21-c8a95444886e@linaro.org>
Date: Wed, 3 May 2023 12:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
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
 <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_034206_441032_C51D2323 
X-CRM114-Status: GOOD (  23.49  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03/05/2023 00:01, Christian Hewitt wrote:
> 
> 
>> On 2 May 2023, at 8:40 pm, Rob Herring <robh+dt@kernel.org> wrote:
>>
>> On Tue, May 2, 2023 at 3:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
>>>> On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>
>>>>> Does your script also cater for .dts files not matching any pattern,
>>>>> but including a .dtsi file that does match a pattern?
>>>>
>>>> I assume I built everything after moving, but maybe not...
>>>>
>>>> That's all just "details". First, we need agreement on a) moving
>>>> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
>>>> been stuck on a) for being 'too much churn'.
>>>
>>> Sorry for missing most of the discussion last week. The script sounds
>>> fine to me, the only reason I didn't want to do this in the past is that
>>> we had the plan to move platforms out of the kernel tree to an external
>>> repository and I wanted to do this platform at a time and also only move
>>> each one once. I don't think that is going to happen anytime soon now,
>>> so let's just do your script.
>>>
>>> Can you send me the script and/or a pull request of the resulting
>>> tree based on my soc/dt branch? Everything is merged upstream,
>>> and I think git-merge would handle the remaining merges with any
>>> other changes in mainline.
>>
>> I've dusted off my script and made a branch[1] with the result.
>> There's just a couple of fixes needed after the script is run (see the
>> top commit). The cross arch includes are all fixed up by the script.
>> dtbs_install maintains a flat install. I compared the number of .dtbs
>> before and after to check the script.
>>
>> I think the only issue remaining is finalizing the mapping of
>> platforms to subdirs. What I have currently is a mixture of SoC
>> families and vendors. The most notable are all the Freescale/NXP
>> platforms, pxa, socfpga, and stm32. It's not consistent with arm64
>> either. Once that's finalized, I still need to go update MAINTAINERS.
>>
>> Here's the current mapping:
>>
>> vendor_map = {
>>     'alphascale' : 'alphascale',
>>     'alpine' : 'alpine',
>>     'artpec' : 'axis',
>>     'axm' : 'lsi',
>>     'cx9' : 'cnxt',
>>     'ecx' : 'calxeda',
>>     'highbank' : 'calxeda',
>>     'ep7' : 'cirrus',
>>     'mxs': 'mxs',
>>     'imx23': 'mxs',
>>     'imx28': 'mxs',
>>     'sun' : 'allwinner',
>>     'imx': 'imx',
>>     'e6' : 'imx',
>>     'e7' : 'imx',
>>     'mba6' : 'imx',
>>     'ls': 'fsl',
>>     'vf': 'fsl',
>>     'qcom': 'qcom',
>>     'am3' : 'ti',
>>     'am4' : 'ti',
>>     'am5' : 'ti',
>>     'dra' : 'ti',
>>     'keystone' : 'ti',
>>     'omap' : 'ti',
>>     'compulab' : 'ti',
>>     'logicpd' : 'ti',
>>     'elpida' : 'ti',
>>     'motorola' : 'ti',
>>     'twl' : 'ti',
>>     'da' : 'ti',
>>     'dm' : 'ti',
>>     'nspire' : 'nspire',
>>     'armada' : 'marvell',
>>     'dove' : 'marvell',
>>     'kirkwood' : 'marvell',
>>     'orion' : 'marvell',
>>     'mvebu' : 'marvell',
>>     'mmp' : 'marvell',
>>     'berlin' : 'berlin',
>>     'pxa2' : 'pxa',
>>     'pxa3' : 'pxa',
>>     'pxa' : 'marvell',
>>     'arm-' : 'arm',
>>     'integ' : 'arm',
>>     'mps' : 'arm',
>>     've' : 'arm',
>>     'aspeed' : 'aspeed',
>>     'ast2' : 'aspeed',
>>     'facebook' : 'aspeed',
>>     'ibm' : 'aspeed',
>>     'openbmc' : 'aspeed',
>>     'en7' : 'airoha',
>>     'at91' : 'microchip',
>>     'sama' : 'microchip',
>>     'sam9' : 'microchip',
>>     'usb_' : 'microchip',
>>     'tny_' : 'microchip',
>>     'mpa1600' : 'microchip',
>>     'animeo_ip' : 'microchip',
>>     'aks-cdu' : 'microchip',
>>     'ethernut5' : 'microchip',
>>     'evk-pro3' : 'microchip',
>>     'pm9g45' : 'microchip',
>>     'ge86' : 'microchip',
>>     'bcm' : 'brcm',
>>     'exynos' : 'samsung',
>>     's3c' : 'samsung',
>>     's5p' : 'samsung',
>>     'gemini' : 'gemini',
>>     'hi3' : 'hisilicon',
>>     'hip' : 'hisilicon',
>>     'hisi' : 'hisilicon',
>>     'sd5' : 'hisilicon',
>>     'hpe' : 'hpe',
>>     'intel': 'intel',
>>     'mt' : 'mediatek',
>>     'meson' : 'meson',
> 
> ‘meson’ : ‘amlogic’,
> 
> ^ to match the SoC vendor name (and arm64)

Ack we're trying to get rid of meson, so it would be time.

Neil

> 
> Christian
> 
>>     'moxa' : 'moxa',
>>     'mstar' : 'mstar',
>>     'nuvo' : 'nuvoton',
>>     'lpc' : 'lpc',
>>     'lan96' : 'microchip',
>>     'owl' : 'actions',
>>     'ox8' : 'oxsemi',
>>     'rda' : 'rda',
>>     'rtd' : 'realtek',
>>     'r7' : 'renesas',
>>     'r8' : 'renesas',
>>     'r9' : 'renesas',
>>     'emev2' : 'renesas',
>>     'sh73a' : 'renesas',
>>     'gr-' : 'renesas',
>>     'iwg' : 'renesas',
>>     'rk' : 'rockchip',
>>     'rv11' : 'rockchip',
>>     'rockchip' : 'rockchip',
>>     'socfpga' : 'socfpga',
>>     'stm' : 'stm32',
>>     'sti' : 'sti',
>>     'st-pin' : 'sti',
>>     'ste' : 'st-ericsson',
>>     'spear' : 'spear',
>>     'axp' : 'allwinner',
>>     'tegra' : 'nvidia',
>>     'milbeaut' : 'socionext',
>>     'uniph' : 'socionext',
>>     'vt8500' : 'vt8500',
>>     'wm8' : 'vt8500',
>>     'xen' : 'xen',
>>     'zx' : 'zte',
>>     'zynq' : 'xilinx',
>> }
>>
>> Rob
>>
>> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm-dts-move-v2
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 


