Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC8FC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 04:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zwfDzUYIF2/Ch0TBhvURuwPH0xhlEkOqRiPNAWbTAM=; b=K8bT4NQo9ahhmp
	9b54q3n79TZ8uj3TBFFgqQzSJZ3BvyM0BnDhGKKZSAQhwcUxGCNLz2IkDoyHjBLzmm0uqe0/JGB4h
	oKIrjHi4FKfZR7NiiCq9fmFbgNruYXvHXmJXS9uLwsZckMXVQNMuH1OVkfNk3P56gcJhRgHj+EQPy
	cIWtBkmZ0Y0lYRp6/Umi/T+M1RkIDTS5hULJfBQB158CC+YVRdJXkfQIOcEZ2GKoMdsC6Z/EpbMNO
	kUKtpn8uko1GmhIjZR2aOAL+JX36wObHfNQi6zudT+19FDq87Eis8jpkc3giq9HRjirNfCVIq2MCX
	KiAgkS0VxBZjLJtYGl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV3gs-00F6A1-RT; Thu, 23 Feb 2023 04:58:46 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV3gq-00F68v-Bz; Thu, 23 Feb 2023 04:58:46 +0000
Received: by mail-oi1-x230.google.com with SMTP id bm20so9998453oib.7;
        Wed, 22 Feb 2023 20:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zwfDzUYIF2/Ch0TBhvURuwPH0xhlEkOqRiPNAWbTAM=;
        b=Wu8i+tebr+qM9evWjfiBZqOisU73NEX4GLFp8a7/pfkyhzIk3fiyDPJc6h3f67kJWY
         ZOlbNmgN/3G4xapSB2wbi69lnPmMcQyA2RfVQXdLsvEDOXh9miFAi50A84md91TMaHiQ
         M5AqTlwkYsxAwE0NYg4+HDNST2XGg2ka09FJRf7qoS7JFNPczj1TnNHX28zLQhum6v14
         0owxu8gsPitIYS/yrn5sYlBnK4+ZmNOwmaHR7oCm3tLUV4z8b3OBQH/5yXX00CTl5kIm
         24z5QnQPglgh4C8JR1XUp8C9XuHen1PYUUNDoybXUs/XKYVvLz9DvB2B4+rJvX424MSV
         /J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zwfDzUYIF2/Ch0TBhvURuwPH0xhlEkOqRiPNAWbTAM=;
        b=g5Ap8bv3ujJhluM1kNTVgdmvdt1R7rdl4FCNV3c2ynSf4u1pTnMjWHQSQ9zX6I4NrB
         6zGjjUgP9tbwqppEKx3Q/moDLqpQaGZPbdJjs4S2T55c+ynjRw6yM7Sj+OgFYTlVU6ED
         xgV20oU8qJCrN25hvmjcizZA2eUvpv7RvOE2xV/sRePheE6FwQ6agqMTJoiAWibSSlXE
         Di/oW7e3RUAVURToYXuHg9k2fv6gp0d/O38XD+V0Hp9xICNL79v7PS8tEZ2t5u8RmUK6
         2S0cYsj8Wz9H23yGQXeX0vIobQOdNJS4cVheN3oAAQEi9xRX8ZwoGHmmsZQne1dqooZD
         5Zng==
X-Gm-Message-State: AO0yUKXGsf711iABMtT3or9xBdwjghjo4BMX185eEJlKytPwASNREThS
	qjEPRSR7KbdAPDcqNf8qQt8kYUuZg2FFXRRSYtM=
X-Google-Smtp-Source: AK7set8J9L0Jihnqm6aIw47nAmbm+z3nWjNHyX7IzhURyC7solSWgHuO+mOLsPvPXJcp9+OTsGE6JZluMqIUV4tFvWI=
X-Received: by 2002:a05:6808:13c3:b0:37b:7c36:4df8 with SMTP id
 d3-20020a05680813c300b0037b7c364df8mr402953oiw.144.1677128321624; Wed, 22 Feb
 2023 20:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 23 Feb 2023 05:58:30 +0100
Message-ID: <CAMhs-H8cKG_aQaE_JBuEfchQ4jNZT5NRPEypywWFuFtsc2MiZg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16] pinctrl: ralink: fix ABI, improve driver, move
 to mediatek, improve dt-bindings
To: arinc9.unal@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_205844_455967_22FFE1F3 
X-CRM114-Status: GOOD (  35.14  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ar=C4=B1n=C3=A7,

All of this looks pretty good to me. You did a really big effort with
this series. Thanks for doing this!

On Wed, Feb 22, 2023 at 7:39 PM <arinc9.unal@gmail.com> wrote:
>
> This is an ambitious effort I've been wanting to do for months.
>
> Straight off the bat, I'm fixing the ABI that I broke a while back, by
> reintroducing the ralink,rt2880-pinmux compatible string.
>
> If you take a look at the schema for mt7620 and rt305x, some functions go=
t
> multiple lists for groups. Like refclk on mt7620. Because mt7620 and
> mt7628/mt7688 SoCs use the same compatible string, it's impossible to
> differentiate on the binding which SoC a devicetree is actually for.
> Therefore, the binding will allow all groups listed for that function. Fo=
r
> example, if the SoC is mt7620, only the refclk function for the mdio grou=
p
> can be used. If one were to put "spi cs1" as the function there, there
> wouldn't be a warning.
>
> I address this by introducing new compatible strings for these SoCs, then
> split the schemas. I also separate mt7628/mt7688 from mt7620 pinctrl
> subdriver in the process.
>
> I wanted to split the rt305x driver too but too much code would be reused
> so I backed down from that.
>
> Ralink was acquired by MediaTek in 2011. These SoCs have been rebranded a=
s
> MediaTek. We're moving the Ralink pinctrl driver to MediaTek, and rename
> the schemas to mediatek.
>
> I've renamed the ralink core driver to mtmips. I decided to call the core
> mtmips as I've seen folks from MediaTek use the same name when they added
> support for MT7621 pinctrl on U-Boot. Feel free to comment on this.
>
> The MTMIPS pinctrl driver requires rt_sysc_membase from
> arch/mips/ralink/of.c, so, for COMPILE_TEST to be useful, RALINK must be
> selected. These headers, asm/mach-ralink/ralink_regs.h and
> asm/mach-ralink/mt7620.h, from arch/mips/include are also required but
> they can easily be included:
>
> ifeq ($(CONFIG_COMPILE_TEST),y)
> CFLAGS_pinctrl-mtmips.o                 +=3D -I$(srctree)/arch/mips/inclu=
de
> endif
>
> Sergio, do you see a way to make the pinctrl driver independent of
> architecture code? At least avoid using rt_sysc_membase.

The only really dependent architecture code in these drivers now is
because of the use of
'rt_sysc_r32()' and 'rt_sysc_w32()' in 'ralink_pmx_group_enable()'
function [0]. This is just to set the gpio mode. The read and write
registers here  SYSC_REG_GPIO_MODE and  SYSC_REG_GPIO_MODE2 are in the
system controller area. In all single ralink platform 'sysc' nodes
should be a syscon that can be accessed from the driver side. That way
you can just get those syscon areas via regmap APIs and properly read
and write desired registers. For the mt7621.dtsi file, the node is
already a syscon [1]. Other ralink device tree files should also be
modified to include this in its 'sysc' node (I think in openWRT dts
files at least for mt7620 is already included). You have to add that
in all of them since 'ralink_pmx_group_enable()' is common code for
all. I think this can be done in a different patch series. I can help
you to do this after this series is reviewed and accepted.

>
> dtbs_check will print warnings for DTs with the old strings as it will
> match multiple bindings. I assume that's acceptable in order to have the
> things properly documented without breaking the ABI. The bindings will wo=
rk
> fine with the new compatible strings.
>
> I could define the checks under $defs:, then refer to it if the compatibl=
e
> string is the one which would work fine. Or I could put only the new
> compatible strings on the documentation. What are your thoughts Krzysztof=
,
> Rob?
>
> Ar=C4=B1n=C3=A7
>
>

Best regards,
    Sergio Paracuellos

[0]: https://elixir.bootlin.com/linux/v6.2/source/drivers/pinctrl/ralink/pi=
nctrl-ralink.c#L117
[1]: https://elixir.bootlin.com/linux/v6.2/source/arch/mips/boot/dts/ralink=
/mt7621.dtsi#L62

