Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49645C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1x4ZN9o6V9W+qBh0ggz87xL1gWqHwTlf5r/ePU2u7s=; b=owv1S6wiK7tAgw
	YQPfPMYjNFXmL9TQLVH8sZxd3jkErkGvbjLW37cs8MaZg31FzViz30Syh27i7NqkRuZjHj2ZuLJMQ
	U9Gv/8kVh0XT00LFapo+6B5O2gJX/tqk0v3cWVqF4rFtDrfWuU/3GADG9CzZyHGLx/T0PYTGZkiQ9
	VYHsrbichxeveZEP2h2zX00fhUJNSw5rhCUmkUF7bFaqViWgyvk23nBm0MC/g7NFLpDibW2vekdgH
	44NTg8FfA2RXYR+k8wOJ7/fEWjDFwEO8OQoVNvaNdS1s+o7CVUVB5oOTwVD8xnoWMRfTx/8EZxdu7
	UeU9PArRcILAzylRmfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY6EX-006aVH-7N; Fri, 03 Mar 2023 14:18:05 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY6ET-006aUV-By; Fri, 03 Mar 2023 14:18:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1677853069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W045bdmzx75s5wZRdqKXSj6MKbsu2H2RGd+UAnNckVvKqLut14P74dngx9EFa3evMrmBYiHdBTRXJyPx2A4RrAaB9laruuFL2SwFjdx9hQUid2fVKXWKx7WL+MK1YPXYFFKHTxgcsJJ3Z6VlRjXLRQ6cNqlTNKsqb7apzFbFe8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1677853069; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=J1x4ZN9o6V9W+qBh0ggz87xL1gWqHwTlf5r/ePU2u7s=; 
	b=HJnA1Gl0ulvNFNp12PIcPvVUaBO6ptuEg6ynGu9Yl44nim8zC+8upY72jeHPZRItXgGOYveaI+tR5pZI7GIPIkurvIukwH05ZudxJOyZ9j1NeT95XpvNzgp/Y+QXqj18DFIbH079gA0xokv+XXs7ClCvyKPjG9eW71OFxJMz3WI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677853069;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=J1x4ZN9o6V9W+qBh0ggz87xL1gWqHwTlf5r/ePU2u7s=;
	b=MaWvmbrf7SOR8X/C8UKjWp5SLXWJ2UbwfRjhDt+BXZvBSmv3nFgNLQZ5KGi97Y5K
	ESrqbdmG0ZN1lnt5Rze51IjtCv2PetxHEqIe7SO4WubKJkNu1cmAnGILIpLlwXLq+4T
	FWKpYkEwBL8lWP22gmTE+9UXhAJ6eDW+Hnt+PMxk=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1677853067111992.3122175211197; Fri, 3 Mar 2023 06:17:47 -0800 (PST)
Message-ID: <fc6dc970-5bae-1c27-9473-8c9d90ac79a1@arinc9.com>
Date: Fri, 3 Mar 2023 17:17:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/20] pinctrl: ralink: move to mediatek as mtmips
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-6-arinc.unal@arinc9.com>
 <CAMhs-H-VGjP32AZc2cuY=Co4iqx8xPtvjr+hMg-haMMFaQzzsg@mail.gmail.com>
 <CAMhs-H8OsG-SEWigimG3fT-SGjZruH-7tnjff198Z2qhb0O=yA@mail.gmail.com>
 <2106f6d0-63cc-4656-1e52-19640994fb43@arinc9.com>
 <CAMhs-H869pR6CzaWfvf44w-ak+0OCyxnMEEU4kWYpw=C14ShsQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H869pR6CzaWfvf44w-ak+0OCyxnMEEU4kWYpw=C14ShsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_061801_508330_BC67E4EC 
X-CRM114-Status: GOOD (  32.20  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Heyo,

On 3.03.2023 13:57, Sergio Paracuellos wrote:
> Hi Arınç,
> 
> On Fri, Mar 3, 2023 at 9:16 AM Arınç ÜNAL <arinc.unal@arinc9.com> wrote:
>>
>> Hey Sergio,
>>
>> On 3.03.2023 09:34, Sergio Paracuellos wrote:
>>> On Fri, Mar 3, 2023 at 7:17 AM Sergio Paracuellos
>>> <sergio.paracuellos@gmail.com> wrote:
>>>>
>>>>    Hi Arınç,
>>>>
>>>> On Fri, Mar 3, 2023 at 1:30 AM <arinc9.unal@gmail.com> wrote:
>>>>>
>>>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>
>>>>> This platform from Ralink was acquired by MediaTek in 2011. Then, MediaTek
>>>>> introduced new SoCs which utilise this platform. Move the driver to
>>>>> mediatek pinctrl directory. Rename the ralink core driver to mtmips.
>>>>>
>>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>> ---
>>>>>    drivers/pinctrl/Kconfig                       |  1 -
>>>>>    drivers/pinctrl/Makefile                      |  1 -
>>>>>    drivers/pinctrl/mediatek/Kconfig              | 51 ++++++++++-
>>>>>    drivers/pinctrl/mediatek/Makefile             | 63 +++++++------
>>>>>    .../{ralink => mediatek}/pinctrl-mt7620.c     | 34 +++----
>>>>>    .../{ralink => mediatek}/pinctrl-mt7621.c     | 30 +++----
>>>>>    .../{ralink => mediatek}/pinctrl-mt76x8.c     | 60 ++++++-------
>>>>>    .../pinctrl-mtmips.c}                         | 90 +++++++++----------
>>>>>    .../pinctrl-mtmips.h}                         | 16 ++--
>>>>>    .../{ralink => mediatek}/pinctrl-rt2880.c     | 20 ++---
>>>>>    .../{ralink => mediatek}/pinctrl-rt305x.c     | 44 ++++-----
>>>>>    .../{ralink => mediatek}/pinctrl-rt3883.c     | 28 +++---
>>>>>    drivers/pinctrl/ralink/Kconfig                | 40 ---------
>>>>>    drivers/pinctrl/ralink/Makefile               |  9 --
>>>>>    14 files changed, 246 insertions(+), 241 deletions(-)
>>>>>    rename drivers/pinctrl/{ralink => mediatek}/pinctrl-mt7620.c (81%)
>>>>>    rename drivers/pinctrl/{ralink => mediatek}/pinctrl-mt7621.c (80%)
>>>>>    rename drivers/pinctrl/{ralink => mediatek}/pinctrl-mt76x8.c (81%)
>>>>>    rename drivers/pinctrl/{ralink/pinctrl-ralink.c => mediatek/pinctrl-mtmips.c} (74%)
>>>>>    rename drivers/pinctrl/{ralink/pinctrl-ralink.h => mediatek/pinctrl-mtmips.h} (75%)
>>>>>    rename drivers/pinctrl/{ralink => mediatek}/pinctrl-rt2880.c (71%)
>>>>>    rename drivers/pinctrl/{ralink => mediatek}/pinctrl-rt305x.c (75%)
>>>>>    rename drivers/pinctrl/{ralink => mediatek}/pinctrl-rt3883.c (80%)
>>>>>    delete mode 100644 drivers/pinctrl/ralink/Kconfig
>>>>>    delete mode 100644 drivers/pinctrl/ralink/Makefile
>>>>>
>>>>> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
>>>>> index dcb53c4a9584..8a6012770640 100644
>>>>> --- a/drivers/pinctrl/Kconfig
>>>>> +++ b/drivers/pinctrl/Kconfig
>>>>> @@ -537,7 +537,6 @@ source "drivers/pinctrl/nomadik/Kconfig"
>>>>>    source "drivers/pinctrl/nuvoton/Kconfig"
>>>>>    source "drivers/pinctrl/pxa/Kconfig"
>>>>>    source "drivers/pinctrl/qcom/Kconfig"
>>>>> -source "drivers/pinctrl/ralink/Kconfig"
>>>>>    source "drivers/pinctrl/renesas/Kconfig"
>>>>>    source "drivers/pinctrl/samsung/Kconfig"
>>>>>    source "drivers/pinctrl/spear/Kconfig"
>>>>> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
>>>>> index d5939840bb2a..ada6ed1d4e91 100644
>>>>> --- a/drivers/pinctrl/Makefile
>>>>> +++ b/drivers/pinctrl/Makefile
>>>>> @@ -66,7 +66,6 @@ obj-y                         += nomadik/
>>>>>    obj-y                          += nuvoton/
>>>>>    obj-$(CONFIG_PINCTRL_PXA)      += pxa/
>>>>>    obj-$(CONFIG_ARCH_QCOM)                += qcom/
>>>>> -obj-$(CONFIG_PINCTRL_RALINK)   += ralink/
>>>>>    obj-$(CONFIG_PINCTRL_RENESAS)  += renesas/
>>>>>    obj-$(CONFIG_PINCTRL_SAMSUNG)  += samsung/
>>>>>    obj-$(CONFIG_PINCTRL_SPEAR)    += spear/
>>>>> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
>>>>> index a71874fed3d6..2eeb55010563 100644
>>>>> --- a/drivers/pinctrl/mediatek/Kconfig
>>>>> +++ b/drivers/pinctrl/mediatek/Kconfig
>>>>> @@ -1,6 +1,6 @@
>>>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>>>    menu "MediaTek pinctrl drivers"
>>>>> -       depends on ARCH_MEDIATEK || COMPILE_TEST
>>>>> +       depends on ARCH_MEDIATEK || RALINK || COMPILE_TEST
>>>>>
>>>>>    config EINT_MTK
>>>>>           tristate "MediaTek External Interrupt Support"
>>>>> @@ -22,6 +22,12 @@ config PINCTRL_MTK
>>>>>    config PINCTRL_MTK_V2
>>>>>           tristate
>>>>>
>>>>> +config PINCTRL_MTK_MTMIPS
>>>>> +       bool
>>>>> +       depends on RALINK
>>>>> +       select PINMUX
>>>>> +       select GENERIC_PINCONF
>>>>> +
>>>>>    config PINCTRL_MTK_MOORE
>>>>>           bool
>>>>>           depends on OF
>>>>> @@ -43,6 +49,49 @@ config PINCTRL_MTK_PARIS
>>>>>           select OF_GPIO
>>>>>           select PINCTRL_MTK_V2
>>>>>
>>>>> +# For MIPS SoCs
>>>>> +config PINCTRL_MT7620
>>>>> +       bool "MediaTek MT7620 pin control"
>>>>> +       depends on SOC_MT7620 || COMPILE_TEST
>>>>> +       depends on RALINK
>>>>> +       default SOC_MT7620
>>>>> +       select PINCTRL_MTK_MTMIPS
>>>>> +
>>>>> +config PINCTRL_MT7621
>>>>> +       bool "MediaTek MT7621 pin control"
>>>>> +       depends on SOC_MT7621 || COMPILE_TEST
>>>>> +       depends on RALINK
>>>>> +       default SOC_MT7621
>>>>> +       select PINCTRL_MTK_MTMIPS
>>>>> +
>>>>> +config PINCTRL_MT76X8
>>>>> +       bool "MediaTek MT76X8 pin control"
>>>>> +       depends on SOC_MT7620 || COMPILE_TEST
>>>>> +       depends on RALINK
>>>>> +       default SOC_MT7620
>>>>> +       select PINCTRL_MTK_MTMIPS
>>>>> +
>>>>> +config PINCTRL_RT2880
>>>>> +       bool "Ralink RT2880 pin control"
>>>>> +       depends on SOC_RT288X || COMPILE_TEST
>>>>> +       depends on RALINK
>>>>> +       default SOC_RT288X
>>>>> +       select PINCTRL_MTK_MTMIPS
>>>>> +
>>>>> +config PINCTRL_RT305X
>>>>> +       bool "Ralink RT305X pin control"
>>>>> +       depends on SOC_RT305X || COMPILE_TEST
>>>>> +       depends on RALINK
>>>>> +       default SOC_RT305X
>>>>> +       select PINCTRL_MTK_MTMIPS
>>>>> +
>>>>> +config PINCTRL_RT3883
>>>>> +       bool "Ralink RT3883 pin control"
>>>>> +       depends on SOC_RT3883 || COMPILE_TEST
>>>>> +       depends on RALINK
>>>>> +       default SOC_RT3883
>>>>> +       select PINCTRL_MTK_MTMIPS
>>>>> +
>>>>
>>>> I am not a Kconfig expert at all but...
>>>>
>>>> Should not all of these be depends on SOC_XXX || (COMPILE_TEST &&
>>>> RALINK) and avoid the " depends on RALINK" next line in all of them?
>>
>> This seems to do the same thing but I'm following the "either change
>> them all or fit into the crowd" ideology.
>>
>>>>
>>>> Just asking since we have yet arch read and write register operations
>>>> in pinctrl common ralink code. Having in this way, when we address
>>>> this arch thing  in the next series just removing the "&& RALINK" part
>>>> makes the review pretty obvious.
>>
>> You'd have to change RALINK with OF since we're still depending on that.
>> RALINK selects OF by default so it's currently a hidden dependency.
>>
>>>>
>>>> Other than that, changes look good to me.
>>>
>>> I think "depends on SOC_XXX || (COMPILE_TEST && MIPS)" would work also
>>> and might be more accurate for compile testing targets.
> 
> Are you sure? SOC_XXX here is already being enabled only if RALINK is
> already enabled, right? [0]

I'm not sure who's your reply to, or what it's about here.

> 
>>
>> This is not OK in both cases. If the driver is dependent on Ralink
>> architecture code, choosing any other MIPS platform will make the driver
>> available to compile, which will fail.
> 
> SOC_XXX is already dependent on RALINK for real uses but the driver is
> going to be selected for other MIPS platforms only for COMPILE_TEST
> targets. Ideally drivers should be arch agnostic so can be selected
> for any single arch build. Now we have arch dependent read and write
> calls in the code, so you need the right headers to be properly found
> to be able to compile testing. I think MIPS is enough dependency here
> to properly find them. But if not, this should be (COMPILE_TEST &&
> RALINK)

I expect below to work without requiring the MIPS option.

ifeq ($(CONFIG_COMPILE_TEST),y)
CFLAGS_pinctrl-mtmips.o		+= -I$(srctree)/arch/mips/include
endif

> 
>>
>> If the driver is independent of Ralink architecture code, you're
>> limiting the driver to be compiled only when a MIPS platform is selected.
> 
> So... how are you planning to allow compile testing of the driver in
> any single arch when we get rid of all the arch dependent code? If you
> make everything dependent on RALINK you cannot.

I intend to make it dependent on OF, not RALINK.

Arınç

