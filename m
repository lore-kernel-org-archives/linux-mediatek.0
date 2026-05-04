Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F0AFF885A
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2026 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=; b=BZrL/fbI4yDIiCZkHCxfDei/VD
	V4ND4O4FEO1in8935oKGXwcKg40Fu3JyXype3HNXARqtrkF6AHjVvoFCjQkUZtQSf7APowoZKcfO0
	5cDhHxuAeQw72qM/jjM7OlJ23IDuY+R32TVo/3+c6DfGEMqMb0VXr5HfIlJTeBSPo/DfBLOOuVDDy
	AFK/bEIsvADnhFUjtHsl5Izw0noNBI0NrPjJTg6fGu3oK76XILpKilDsieTXRCRPf0+yxZ2Dr6oCz
	+caavwf5BjCh14RNePr0IBSp8gYvKOsOvtYRJJjOhvxJPN8UuarUhDs8tVA9Qp1xQmwaX5dxD4wfw
	frYDwZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpni-0000000CqKa-01JJ;
	Mon, 04 May 2026 09:41:18 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpne-0000000CqJ5-267E
	for linux-mediatek@lists.infradead.org;
	Mon, 04 May 2026 09:41:16 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so769626e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2026 02:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777887672; cv=none;
        d=google.com; s=arc-20240605;
        b=a4/LWqFgp6iaCR0IaJZXA2ObnoQ7gV4BWAo22EZucXj1xpqrxptorz2Edn20dHWf3p
         Y65fDIrGlXz2RpKoCkRXQc5PRpaFJN7KthJJr9Tdny8WhXkJg48X3Jn385Dt+HyYun3G
         8VILOq+5sBLF1dVJIV+7K0Yzww3hfB69lFy5zAdDAwoYJ9Kf0TULYko7cQ6vfVJa7xXv
         yj7C3ZmvcaEn80QjA5fXQrX4Y5x6XVxtcl5goQBg4L4OxE0Up9xoBVoMZFCDFYO+LKRR
         C0RZnjLp3cUxmcoT2VTq9rVEiRy+NYbmOya2UJgToBBGFyqg5OeejEwGgCP+0wwhoBrQ
         By7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=;
        fh=RhRHjl/gshHxWl5Tv+dpzZwwJem5i9BrJEnVcJlDAOI=;
        b=kIpzqKQ4ZqfL4WhpXc1uXgOWmwG1l5SfOfwGJXehb5bQw0m5G97HR0iZifFFNgVpf4
         6my/N9LelOjIZKYgvfzq53Wdcf3cY0DPEwPCPK8h+M2+6YGIenKl0fp7fYrJ2AbDnj2Y
         w7J90fTJswpLBOW7rueoOJy+DuVOVYD+pvUTgXN3dcmxzCDGCJw7AZcKW/qkGg1Ua/jL
         X3a0Ou/ovy1xs3DTLp174gpUhtILCgwJCQQe/X2CTcjPcS6JndLJGDN0F7tNOsa273q3
         GV8RCBsicph69H5NqtlVKPyRYVrgT8XDXTZwOC5BqCSoGZrUTO/B0PKpUCdAGkZ56vVq
         0I0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777887672; x=1778492472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=;
        b=IdSPxoqVRaXS29cHfHUtbMxqlzfalyYRGLddSPSBKKlyuEY9oAbVSGuLEL49AnmzeZ
         Cs5htAmY4eJuha+EeTxEo1D+55hwhl3gsxFQn/WEYLfxHebN0WoowWWikLXc0TEpC2r1
         yaTIqiYT1un4nxGjT9V3kXPPy+bVBLe3aZJJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887672; x=1778492472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=;
        b=Pj+MpRIcKsdVp/fv58IHpKwP+W6MdRK1p0gFJDl4mXISmqjEpK2BvE65SA0uZ882nM
         z7khzTtBu0wOdarT63uVQEzSsdwQPCtwXNsWPoU/W14bmzsNl30vHv9i2X+S6T45MO6m
         ag3PiN/p7BW7dpR7N3+d/OOAmJbbhTmR3Ubw4ReDBJldp4ytoSMyu/n8FuB5gVcvDoSH
         dSjGHr148re5qWs9YYSl7YBnj6o1A4CsnFQnbu7KSQW3PL9JbcF2MZWsUH7K5fs7CH/D
         7wabNRPyivkU9gxcd2VwfV1tJFY7zmYeCuFpDP0+Nmuot9T7BR7mTRiK2UfmOMD83BrP
         zmpA==
X-Forwarded-Encrypted: i=1; AFNElJ8aoAqWV5+idt1dpFtHz7I5jsV4lcvyUoyBHqSVvvPBKIa+BVkGKH3c1NXnWlT1Iib6NHtcVjSHzebihHhmXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YypdnPhFFxEfaXiwxoIPcrxEZsxsMKSj7okmVfvzYkLF38QafUn
	7NJSXYOxedoZKtlj48JErgxnGADxtFFZVSAYkx9GhEuaVLIys8hTUjr/kyrYlf5++AYy6kCoo8p
	bQ6KiXfokYbhjDZH0dP9bYtmEGZzAoBGD6vykXalk
X-Gm-Gg: AeBDieu8HKLOv8JW51hLT3aRNNyS/4NyuFch6Xr6RQKPiZda9LzjqoU8mmlhlexGYnz
	+qWahT9/cNVWDMZYTUPkWVKL5PAvLa2vv6/URj+MYAsK36tEZwnSBHd6+JcklLVlx2aid6c/y68
	XTUgNExUVRcQ4dGCH47nFZrgKOewJ13Gw9kFmlYtNNWZEdrsYl8/Wz+9eJRBe7jfRT15pltB35I
	xQg2wUPb4TDacMYPt4Lv3rNcdZ8/tWIi4ZIhh0CAH4ntofhPQrr/RGTCJ/ER4NHtVjnP/XI9XNt
	L2cRKdm6+nc25LRwKN2VGqHCUiNK92vvguqCut8BTtVf0yq1
X-Received: by 2002:a05:6512:400f:b0:5a4:304:43c9 with SMTP id
 2adb3069b0e04-5a862fbd635mr2676512e87.14.1777887672100; Mon, 04 May 2026
 02:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260504072846.2581096-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260504072846.2581096-1-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 May 2026 17:41:01 +0800
X-Gm-Features: AVHnY4L9QFY2fxGccmoY4I5c6vHRXkexmo_pKFyAww1n-29lZtiDvf1w1FXMeYk
Message-ID: <CAGXv+5FvdufzjqBRQnnG3y8FVW9bHL47CVv_=e7GbVv2d3eEuA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: enable touchpad
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_024114_661785_ABE6D01B 
X-CRM114-Status: GOOD (  21.97  )
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

On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> Despite the Ciri device's touchpad is on the detachable keyboard, the
> I2C HID device seen by Linux is emulated by ChromeOS EC and always
> present regardless of the presence of physical touchpad.

AFAIK it is actually an I2C HID device on the detachable keyboard.
The I2C bus is "tunneled" across the EC-EC connection. And if you
detach the keyboard, the I2C device will stop responding.

We have some downstream trickery to deal with this:

    https://crrev.com/c/6040044
    https://crrev.com/c/6040045

It basically involves registering the I2C device when the keyboard is
attached, and removing it when it is detached. We haven't gotten around
to upstreaming it though. I talked to Krzysztof about this design last
year, and I believe it was at least acceptable from DT point of view.

So this patch is somewhat incorrect, in that the trackpad should be
disabled by default, and its status should be toggled at runtime based
on the detachable keyboard events.

Otherwise if you boot the system without the keyboard, the driver will
probably fail to read the HID descriptor.


ChenYu

> Enable the device in the device tree.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index 8e423504ec052..8f801454bf84c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -460,6 +460,18 @@ &i2c4 {
>         pinctrl-0 =3D <&i2c4_pins>;
>         clock-frequency =3D <400000>;
>         status =3D "okay";
> +
> +       /* The touchpad HID device is emulated by EC so it's always prese=
nt */
> +       touchpad: touchpad@56 {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x56>;
> +               hid-descr-addr =3D <0x0001>;
> +               interrupt-parent =3D <&pio>;
> +               interrupts =3D <148 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&touchpad_int>;
> +               wakeup-source;
> +       };
>  };
>
>  &i2c5 {
> @@ -1131,6 +1143,14 @@ pins-bus {
>                 };
>         };
>
> +       touchpad_int: touchpad-int-pins {
> +               pins-ec-ap-touchpad-int-odl {
> +                       pinmux =3D <PINMUX_GPIO148__FUNC_B_GPIO148>;
> +                       input-enable;
> +                       bias-disable;
> +               };
> +       };
> +
>         uart0_pins: uart0-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO31__FUNC_O_UTXD0>,
> --
> 2.52.0
>
>

