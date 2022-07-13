Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7B4C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFBl54go6bbp895f6CpJo/cJgp+SQIq2apGuPfKEw8I=; b=j+WU+Sas2KG9Uj6knvwK1T8rWy
	jH7PjtnhjzF6V1eyAXEsFnU8dVVFmqujOLMyIMnZiF9dxJc29dHey9TlhRied4r+UP+XGKw3PhouS
	H0X+TyPIgxteAviWn6QN/1oBzUOq4/jEqw9Zg0Wb59rdvhMH+2HjYBG00lH865ZoosJqLrdfY8RHs
	+c9Cuz/TiPU4vyE9WMNfAnkEQJ0GfGWllRdYXcRhUWlatlGFovyg8Oj7RwUhN5DlDW8exD31X5IJS
	lolvkFKibzxotBapmK32f/R+D4KQKEUVuaNU5BmSKbn/s44UNY2wB0GeD9mJfOts0U2/meaHkUfbU
	63ZDuXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXuz-001iR8-7M; Wed, 13 Jul 2022 08:40:25 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXuo-001iMS-BO
	for linux-mediatek@lists.infradead.org; Wed, 13 Jul 2022 08:40:15 +0000
Received: by mail-lj1-x230.google.com with SMTP id w2so12683594ljj.7
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Jul 2022 01:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rFBl54go6bbp895f6CpJo/cJgp+SQIq2apGuPfKEw8I=;
        b=HJy70qwl9lN8HnV2r/htxl8ByNBeHMo2DaIIq8mk7an1rDp/Hy4hkXfktfvmdxUaxv
         3A8sUvjtVkw53mw340DrAJeHLmOzxTyLbalQEkV/XibwwFuwinmbY8O4rPtYpX5yrLiy
         JCufh3uEsQSrI+YvGbyX9Y+722Yi/OGL4EsdeTD0EdSrLJ29gdu6g6g4kPCs/WNN/s56
         Ok1r003S2vR+FcsNad/mJW0vO/uHVdrcEbuS7mChc7ssvfhznEANrqB0zDNs+h4LpO7Z
         +re5NfTf0wvT6R8Qp16Ggu7kuyCNhK8MTP9WtoFIw6A9JRGk4YAt/6tiRiaJDLitsXUv
         FA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rFBl54go6bbp895f6CpJo/cJgp+SQIq2apGuPfKEw8I=;
        b=uDR9Y/ktkb/dqq1LY+qeEzNS0HyGJ8hpj1qPAEBoIFQhmt7GWD9dwgzqG4HcEVUett
         GuGfNuETT+GPtKOfnzioBB59W1bsDHuF36AjyijuVwzUjIPLqjTl+qSuFxaYpRgFu8zF
         dhgA+5TxEF2Dcl7xRc5WsznU7N42Vc6xedL9km5LyaZM84cUhK3FKXHPI478xuPQebAP
         +rQlR8skYCoRXztbP+OF9RF1KYshnhnNyYe72xKbagP2E4kG+tUFRfkKrKlWzrkXQWPS
         ryiWjt2Y7sRYwIpLU8gAV9XY6jo4X0kfxfOQkxQt++seIgVrNcMSGW0Xk+QvHo9L+k3M
         19FA==
X-Gm-Message-State: AJIora8bbjx/DibFubQNkDN3I/yCVb4EinKZnt3oy0HIucbgmPu1XWi+
	Y4KfVujDvImbThVYLdQGrq72Dw==
X-Google-Smtp-Source: AGRyM1vqC3mk/Y63Y88qA3IPGzsb8ZUXDS2zCGPmro0xfJGvd0YSbgfDR3MJrICvvK8L1MwmkoFzRw==
X-Received: by 2002:a05:651c:1038:b0:25d:53cb:ba22 with SMTP id w24-20020a05651c103800b0025d53cbba22mr1104823ljm.407.1657701609473;
        Wed, 13 Jul 2022 01:40:09 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025d6ecbc897sm1720865ljc.46.2022.07.13.01.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 01:40:08 -0700 (PDT)
Message-ID: <0131e1d6-09c0-31a4-5b9d-0e2fc49d61ac@linaro.org>
Date: Wed, 13 Jul 2022 10:40:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: Kconfig.platforms: Re-organized Broadcom menu
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 SoC Team <soc@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 william.zhang@broadcom.com, anand.gore@broadcom.com,
 Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Wei Xu <xuwei5@hisilicon.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
References: <20220712164235.40293-1-f.fainelli@gmail.com>
 <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_014014_431209_082EBF21 
X-CRM114-Status: GOOD (  24.68  )
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

On 13/07/2022 10:25, Arnd Bergmann wrote:
> On Tue, Jul 12, 2022 at 6:42 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> There are now multiple Broadcom SoCs supported so group them under their
>> own menu such that the selection is visually more appealing and we can
>> easily add new platforms there in the future. This allows us to move
>> ARCH_BRCMSTB back to its siblings.
>>
>> No functional changes introduced.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>
>> Note this is based on "arm64: bcmbca: add arch bcmbca machine entry"
> 
> Hi Florian,
> 
> So far, we have tried to keep the Kconfig.platforms file rather coarse-grained,
> mainly limiting it to company names and high-level families, but avoiding
> sub-menus or adding too many sub-families.
> 
> If we add per-vendor submenus, we should probably first decide how we
> want to structure this across vendors. I've added maintainers and lists to
> Cc for a couple of the ones that are in a similar situation.
> 
> I can see a couple of ways we can do this:
> 
> a) keep the list of platforms as short as possible, combining related
>   SoC families from a single vendor wherever possible, but no sub-menus
>   (same as today)
> 
> b) Always use sub-menus when there is more than one family, but
>    keep relatively coarse platform selection.
> 
> c) Use sub-menus and also move to a more fine-grained SoC
>     selection, similar to what we have on 32-bit arm.
> 
> I would not really want to go to c), but a) and b) both make sense to
> me as long as do it consistently across all platforms.
> 
> Any other ideas or opinions?

Whatever we decide here, the SoC can override in drivers/soc, just like
Renesas did. I think Renesas chose option c), but made it in
drivers/soc. I would vote to have consistent policy, so if arch/arm64 is
a) or b), sub-archs should not redefine it in drivers/soc.

Or we could choose d)
d) keep arch/arm64 list of platforms as short as possible, but sub-archs
can do whatever they like on drivers/soc.

Personally, I find fine-grained SoC selection a bit ridiculous
optimization, like compiling kernel, Glibc and userspace with -O3,
-funroll-loops and many other flags. One gets smaller size but looses
multi-platform and ability to test one kernel on different boards.
Therefore I would vote for b) with disallowing drivers/soc defining more
ARCH_ and more SOC_.

Best regards,
Krzysztof

