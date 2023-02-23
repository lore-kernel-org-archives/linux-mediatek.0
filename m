Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F660C636D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 06:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fY/rYZ/QSdL3EXsPZDuBUtoL1olQYQkD3lDEY+ykYo8=; b=eThkX7xom3Fwvh
	6eIQb8eXe6QywwpZPBA1Iz0KNH1H4iql39+5hnuPd8kiL/f2Xdx0brYJJuec98pEfWjoiyWToxuVt
	mkGTqGA0Irsp4HyltHJkSiSJaZ62cuN1hjOYeCJHcF2Y5mJh+5AemqCLJXI5Z/9UirHvNpYJnc82Z
	jyQQhI+Ibpu3/gaogOCqDS7SL8u8C7l6l00lIFVSNQwLP12EsDY5fwwqIyEKDPllz9IH2dnjlpamQ
	kj1iiY2UOy7AOm4DRzamVclNozMXTljOQNTcmjGOmUhYFO1BlaFhLMdi2x5pdBSMSfE1aIT1pzdQO
	kB8qJ4GZnQOBaNqAe4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV4gO-00FE4m-E3; Thu, 23 Feb 2023 06:02:20 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV4gL-00FE3C-4c; Thu, 23 Feb 2023 06:02:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1677132127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DIzq2l3H4WTqdlWLW2VWNcBP97sE4gt5oo+hksxZCt//lBhPoIP/lExLhjp94atUtFHgN4EyPPVfYbin64IVUB86UOrokuDHfgKbHe3veGP9nIfT3Qr3O1FgMvNgPUFrytwpLymruJDBrVa7zhzO6ElX5vTcyV4Lz7giutoiYYA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1677132127; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fY/rYZ/QSdL3EXsPZDuBUtoL1olQYQkD3lDEY+ykYo8=; 
	b=Bl11M0rzEUMQIlZf06U01wkUBGWse4NxABzpXv1O7tVKSrujJuJ+PBz0/0TEjslrJcwvrkzGay5YxY2GJtQMt2wt0QSJBCBCY3b7cD+S1V2Hr+xG/1GH+03br8QLlf5M4AzcdJ/S871a4PZIQUGm+Mx2vJULXQoWyEYIuOR3Mws=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677132127;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fY/rYZ/QSdL3EXsPZDuBUtoL1olQYQkD3lDEY+ykYo8=;
	b=ImdvYPi59x5HDhSWSS9w6Fiep1G2P1O8DhCt1FsW2I50vp33aQNz3VDmdDlYslDD
	wO7wgx8nLmuPJvZgdREzQTkYbIcsKJmAXNFbOTZRtDmB2f0UOttqfCinJDMSr2nZuoE
	IKgny9ZRGAZx7RA/Nk7bRp2c/3qsNOUdHsjomhHc=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 167713212609062.82464009307694; Wed, 22 Feb 2023 22:02:06 -0800 (PST)
Message-ID: <286c6f85-8c5c-907f-a77b-b0c62e97a18a@arinc9.com>
Date: Thu, 23 Feb 2023 09:01:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 00/16] pinctrl: ralink: fix ABI, improve driver, move
 to mediatek, improve dt-bindings
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <CAMhs-H8cKG_aQaE_JBuEfchQ4jNZT5NRPEypywWFuFtsc2MiZg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAMhs-H8cKG_aQaE_JBuEfchQ4jNZT5NRPEypywWFuFtsc2MiZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_220217_277826_DB31642F 
X-CRM114-Status: GOOD (  31.98  )
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

On 23.02.2023 07:58, Sergio Paracuellos wrote:
> Hi Arınç,
> 
> All of this looks pretty good to me. You did a really big effort with
> this series. Thanks for doing this!
> 
> On Wed, Feb 22, 2023 at 7:39 PM <arinc9.unal@gmail.com> wrote:
>>
>> This is an ambitious effort I've been wanting to do for months.
>>
>> Straight off the bat, I'm fixing the ABI that I broke a while back, by
>> reintroducing the ralink,rt2880-pinmux compatible string.
>>
>> If you take a look at the schema for mt7620 and rt305x, some functions got
>> multiple lists for groups. Like refclk on mt7620. Because mt7620 and
>> mt7628/mt7688 SoCs use the same compatible string, it's impossible to
>> differentiate on the binding which SoC a devicetree is actually for.
>> Therefore, the binding will allow all groups listed for that function. For
>> example, if the SoC is mt7620, only the refclk function for the mdio group
>> can be used. If one were to put "spi cs1" as the function there, there
>> wouldn't be a warning.
>>
>> I address this by introducing new compatible strings for these SoCs, then
>> split the schemas. I also separate mt7628/mt7688 from mt7620 pinctrl
>> subdriver in the process.
>>
>> I wanted to split the rt305x driver too but too much code would be reused
>> so I backed down from that.
>>
>> Ralink was acquired by MediaTek in 2011. These SoCs have been rebranded as
>> MediaTek. We're moving the Ralink pinctrl driver to MediaTek, and rename
>> the schemas to mediatek.
>>
>> I've renamed the ralink core driver to mtmips. I decided to call the core
>> mtmips as I've seen folks from MediaTek use the same name when they added
>> support for MT7621 pinctrl on U-Boot. Feel free to comment on this.
>>
>> The MTMIPS pinctrl driver requires rt_sysc_membase from
>> arch/mips/ralink/of.c, so, for COMPILE_TEST to be useful, RALINK must be
>> selected. These headers, asm/mach-ralink/ralink_regs.h and
>> asm/mach-ralink/mt7620.h, from arch/mips/include are also required but
>> they can easily be included:
>>
>> ifeq ($(CONFIG_COMPILE_TEST),y)
>> CFLAGS_pinctrl-mtmips.o                 += -I$(srctree)/arch/mips/include
>> endif
>>
>> Sergio, do you see a way to make the pinctrl driver independent of
>> architecture code? At least avoid using rt_sysc_membase.
> 
> The only really dependent architecture code in these drivers now is
> because of the use of
> 'rt_sysc_r32()' and 'rt_sysc_w32()' in 'ralink_pmx_group_enable()'
> function [0]. This is just to set the gpio mode. The read and write
> registers here  SYSC_REG_GPIO_MODE and  SYSC_REG_GPIO_MODE2 are in the
> system controller area. In all single ralink platform 'sysc' nodes
> should be a syscon that can be accessed from the driver side. That way
> you can just get those syscon areas via regmap APIs and properly read
> and write desired registers. For the mt7621.dtsi file, the node is
> already a syscon [1]. Other ralink device tree files should also be
> modified to include this in its 'sysc' node (I think in openWRT dts
> files at least for mt7620 is already included). You have to add that
> in all of them since 'ralink_pmx_group_enable()' is common code for
> all. I think this can be done in a different patch series. I can help
> you to do this after this series is reviewed and accepted.

Awesome, thanks a lot! Note to self, "depends on RALINK" menu entries 
should be changed to "depends on OF" when this happens.

Arınç

