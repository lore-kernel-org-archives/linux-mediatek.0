Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A772CF8546
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 22:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2p0RBsu7N/ikXAXwnKT3iU6dfYBdSsewWojsryZ8yU8=; b=ulEXO9cP/YGMU9orZ8+arcf4hd
	aOm4k2/VaEzhkAmzkmeGLUCIv/UX68sNS7NH8MB7Z0/QEEVkgLImXOi+Gh0HBdSuTVfp3q6vB9a4I
	FPU/vDoe37lzAcnJxrG/xLGO57iffy3ALfP0qe4fpX98EPWbTUHI9qtT+3OByNdIf5IlZ9zDp6GVf
	U4irSpUzhrDCf0D6drKTUOkV0oPuaW3HUb53Rj/u6PL+QzisdyRw+ggKa5+/ZYKbUdOlrRqMZ/NUa
	9NJyXqQ6Rs/5ufoJPyBhteinwega0wyf1B1xjyAENhl/wnA+S8jcUzVAsbs6Js0w8RbV6LeRsW9Fd
	57+dM2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw83W-00000007ex6-0Wis;
	Wed, 02 Oct 2024 22:42:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw83S-00000007ew2-2r3H;
	Wed, 02 Oct 2024 22:42:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so2545345e9.0;
        Wed, 02 Oct 2024 15:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727908964; x=1728513764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2p0RBsu7N/ikXAXwnKT3iU6dfYBdSsewWojsryZ8yU8=;
        b=GfwFqifTsLkWEZLTyQS+MvR9U/MH1Te9Cw491GaAjZAbm5GwP4s5gzt40QFHXaDeDK
         UeRdK2z0ENJbozoTj7gjpRnJReyO3fTr1Vyo3jHwUwHs86bhEv/1BHSOF3cVODKseafz
         Vxte5/RJFBhSedgbxRGpIZ7qxSCXV/lk6sQftjEJmRDVw96GmnEvhrlDohQRy276jGwj
         teMH+Gfb0kCGSm85EJqTVDFRUk6+8TDYcC3jV3fP8jyUu2d0FUXP36j5S5IrpZG2OMvA
         w9Z84ZJnrINpksLkdiP/qpgA162GeMjr4m1GXyT94qamgTHatlrKsxzAbUGC4M22mAmX
         iyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727908964; x=1728513764;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p0RBsu7N/ikXAXwnKT3iU6dfYBdSsewWojsryZ8yU8=;
        b=UdhEUCVZPD4fK+MVTEBZZxqUON6i+LtxfKANWWxIQQmb32dIDnK5cNE4bGOHxaPk2q
         mRNCKQYNWs8a2ngwTKF90DJvIb8K3mTjOEe03Li0FqRqgcg3cucrsLphQkHTdGpDC+Jo
         bPQMePIWPeosqZovbZnQwkjLNwjfK08V4lRA6+KgTqsZRYORwguHeDJS3EKWaZbxOZZY
         2EtSsbIYoyuX3osoNly8OnEhtqPCqkuu0MxsmfeqratdxfsGTE3bfOUaF6hsDxyMtPBK
         VYjnrHFPbmXCOzKWDjnuhqM7DDwMd+Xna48b39TQDzWbgHGSKJpgGHJaPBNO7SyOVgOw
         c8qA==
X-Forwarded-Encrypted: i=1; AJvYcCUUZ/EwU+h0QWSE3st5N0P3PU+eRHLie3IIas2rkTiwMDz7zwLR7WhaIWTXrMEzbCar1B2idHvG/RT8CkVAgnmK@lists.infradead.org, AJvYcCXUM7+1xhe01dY/tmPhOBlXIEzrEPJjfYrzwEIXdIY5IJz4cL25QVR9ji8poFFbKA5vC0BGyN+rnqPaPDiX4vY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSCr1MEQ1BoHd5B79JP0mxcJXfN5uymIYQOUhSTpPyx2q0V06Y
	lnxFJS4/W3mVCepqpCAbpb1CiZse7qJd3/MgVUBF0RmA8EcQpxZC4LQui1cq
X-Google-Smtp-Source: AGHT+IGuS5mbK7XVp3K4dA2IOkM9MUozkblHFQyW/rtCI15UZMMVWwioBkHnlLQdNZX3oeUM5mifCA==
X-Received: by 2002:a05:6000:50f:b0:37c:d49c:3ac7 with SMTP id ffacd0b85a97d-37cfba16a65mr3033353f8f.48.1727908964057;
        Wed, 02 Oct 2024 15:42:44 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5742602sm14778829f8f.94.2024.10.02.15.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 15:42:42 -0700 (PDT)
Message-ID: <66fdcc62.df0a0220.15bce8.4398@mx.google.com>
X-Google-Original-Message-ID: <Zv3MX0046FvdpeYU@Ansuel-XPS.>
Date: Thu, 3 Oct 2024 00:42:39 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v5 3/5] mfd: airoha: Add support for Airoha EN7581 MFD
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
 <20241001-en7581-pinctrl-v5-3-dc1ce542b6c6@kernel.org>
 <20241002132518.GD7504@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002132518.GD7504@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_154246_752113_896BCD4E 
X-CRM114-Status: GOOD (  24.10  )
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

On Wed, Oct 02, 2024 at 02:25:18PM +0100, Lee Jones wrote:
> On Tue, 01 Oct 2024, Lorenzo Bianconi wrote:
> 
> > From: Christian Marangi <ansuelsmth@gmail.com>
> > 
> > Support for Airoha EN7581 Multi Function Device that
> > expose PINCTRL functionality and PWM functionality.
> 
> The device is a jumble of pinctrl registers, some of which can oscillate.
> 
> This is *still* not an MFD.
> 
> If you wish to spread this functionality over 2 drivers, use syscon to
> obtain the registers and simple-mfd to automatically probe the drivers.
>

Hi Lee,

let me summarize the situation so it's more clear why
this additional mfd driver.

There were various iteration for these 2 driver (pinctrl and PWM).
Due to the fact that these 2 are placed in the same register block
with the PWM register in the middle, we proposed various .yaml schema
that could better model it.

The first idea was to map the single register used by the 2 driver.

        pio: pinctrl@1fa20214 {
                compatible = "airoha,en7581-pinctrl";
                reg = <0x0 0x1fa20214 0x0 0x30>,
                        <0x0 0x1fa2027c 0x0 0x8>,
                        <0x0 0x1fbf0234 0x0 0x4>,
                        <0x0 0x1fbf0268 0x0 0x4>,
                        <0x0 0x1fa2001c 0x0 0x50>,
                        <0x0 0x1fa2018c 0x0 0x4>,
                        <0x0 0x1fbf0204 0x0 0x4>,
                        <0x0 0x1fbf0270 0x0 0x4>,
                        <0x0 0x1fbf0200 0x0 0x4>,
                        <0x0 0x1fbf0220 0x0 0x4>,
                        <0x0 0x1fbf0260 0x0 0x4>,
                        <0x0 0x1fbf0264 0x0 0x4>,
                        <0x0 0x1fbf0214 0x0 0x4>,
                        <0x0 0x1fbf0278 0x0 0x4>,
                        <0x0 0x1fbf0208 0x0 0x4>,
                        <0x0 0x1fbf027c 0x0 0x4>,
                        <0x0 0x1fbf0210 0x0 0x4>,
                        <0x0 0x1fbf028c 0x0 0x4>,
                        <0x0 0x1fbf0290 0x0 0x4>,
                        <0x0 0x1fbf0294 0x0 0x4>,
                        <0x0 0x1fbf020c 0x0 0x4>,
                        <0x0 0x1fbf0280 0x0 0x4>,
                        <0x0 0x1fbf0284 0x0 0x4>,
                        <0x0 0x1fbf0288 0x0 0x4>;

                gpio-controller;
                #gpio-cells = <2>;
                gpio-ranges = <&pio 0 13 47>;

                ...

        };

        pwm@1fbf0224 {
                compatible = "airoha,en7581-pwm";
                reg = <0x1fbf0224 0x10>,
                      <0x1fbf0238 0x28>,
                      <0x1fbf0298 0x8>;
                #pwm-cells = <3>;
        };

This was quickly rejected as it introduced way more complication
to workaround the overlapping addresses. (the device should map the
entire register space)

The second proposal was a parent+child implementation with the
pinctrl parent and the PWM child by referencing a syscon from
the parent.

        pio: pinctrl@1fbf0200 {
                compatible = "airoha,en7581-pinctrl", "simple-mfd", "syscon";
                reg = <0x1fbf0200 0x0 0xbc>;
                airoha,chip-scu = <&chip_scu>;
                ....

                pwm {
                        compatible = "airoha,en7581-pwm";
                        ...
                };
        };

Also this second proposal was rejected by device tree folks
as the device implement both pinctrl and PWM in the register
space and they are not actually separate devices.

There was also an additional proposal with the entire register
map in a dedicated node with syscon and pwm + pinctrl using it.
This was also rejected by device tree folks. (node that have only
a syscon are a nono)

It was suggested that this is a case of MFD (multi-functional-device)

As suggested we proposed a simple-mfd implementation following
common pattern. Parent node with simple-mfd and syscon compatible
and 2 child nodes, one with pinctrl and the other with PWM with each
his own compatible.

        mfd@1fbf0200 {
                compatible = "airoha,en7581-gpio-mfd";
                reg = <0x0 0x1fbf0200 0x0 0xc0>;

                interrupt-parent = <&gic>;
                interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;

                pio: pinctrl {
                        compatible = "airoha,en7581-pinctrl";

                        gpio-controller;
                        #gpio-cells = <2>;

                        interrupt-controller;
                        #interrupt-cells = <2>;
                };

                pwm: pwm {
                        compatible = "airoha,en7581-pwm";

                        #pwm-cells = <3>;
                        status = "disabled";
                };
        };

Also this was rejected by device tree folks as the property for
pinctrl and pwm needed to be in the MFD node and there should't
be child node with single compatible.
This comes from the fact that DT needs to describe how the HW is
modelled and not how the drivers are implemented.

Finally Rob agreed and added the Reviwed-by on the current
implementation with single MFD node with pinctrl and pwm.
Also Conor and Krzysztof agreed on this solution for the task.

    mfd@1fbf0200 {
        compatible = "airoha,en7581-gpio-sysctl";
        reg = <0x1fbf0200 0xc0>;

        interrupt-parent = <&gic>;
        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;

        gpio-controller;
        #gpio-cells = <2>;

        interrupt-controller;
        #interrupt-cells = <2>;

        #pwm-cells = <3>;

        pinctrl {
                ...
        };
    };

With the following implementation, the only way to probe the
additional driver is with a specialized mfd driver that probe the
2 driver by name and we can't really use a simple-mfd implementation
as that requires child nodes with compatibles.

Sorry for the long message and I honestly hope we can find together
a common path for this between driver and Documentation.

Is it clear now why we had to ultimely had to implement and model things
this way?

--
        Ansuel


