Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07D5D2445E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 23:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQq6z3ygsMPz3YqMkjOj9nbopV+BNnluNPMVMs2m49Q=; b=UxaIoJ4oDsVjfzXPdfrjIjzzx2
	Bwbs2mw+mkN/e3djkSWyj8L7f5v/AYjp0sb2lUrBvur3OjRKYnnL/jv5vVFwN7mQNk8mlVNmtgGCq
	mQy31IOtjQY7B2biLBf3E4QQ5lAohrxsSqwKIuTnnPeBrHap4iFy1STBfmqsUy5ujKj8mH6KSvqQw
	COs7+QDrNhFG7PO/wJ60QBx1pMfJTabPTfBmE+WgtPwSsksG8Al8SrmJAfYhd66tzqgAKEf/opJBh
	ttG9U+djMgBQPi5vCPtk9dybAFr8/5Z+2NDxYUeXxYn3C+Ikpht5b/RG1G00NCtdAvFiaHdPseaKJ
	JYp9UxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2A2-0000000EcBU-1Xlq;
	Thu, 10 Oct 2024 23:01:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syyvt-0000000E7mC-3H5Z
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Oct 2024 19:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pQq6z3ygsMPz3YqMkjOj9nbopV+BNnluNPMVMs2m49Q=; b=ed8Hm2jh9/pinkIutxH1azOqCK
	WGz6QET8ey64fYjzMixjkpuAbsvVVCvlDFNpUDSc73WOokZn4gqeBYGGW0v1wwPtqKPw9ZTptMqLR
	Cx+CxeOwIH/PuaNwiiGBwYBUTwOLRY9EI1hIIn31BJuvXpWjMqb7N1/H5/njS0EWZS7odjRE0nkjj
	7aniC5I5vqXZYBgxEA9BFW5MRKuzcviOfTKPCprrAophgUCVdnhsvIM/qjSJyDqFxae1I55YZeKPP
	3kjUaLy0DICcILN9glrmNLr9j9IgZc75qgr+/i69dSxSeQ4bE9njKcPFJBvgOac243TbB4z/A23hr
	2GjWQwnQ==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syyvq-00000005Yyi-2mqe
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Oct 2024 19:34:44 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fac9eaeafcso14842861fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Oct 2024 12:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728588879; x=1729193679; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQq6z3ygsMPz3YqMkjOj9nbopV+BNnluNPMVMs2m49Q=;
        b=RVN0QPYReG9aSl5OC3B/aZylqd4B5l0xS2Gzk7I44csW/y6pj3Id14su0A2NfJK5oq
         giZ9qwgszASc5Awx3s0wIRY3mhkXXBgaqqpejEw4xBt7u35kwi6gBxNbaX5kr8o3WpUB
         rVboYrRwo3k1KarWXgNPShvdjuM3polqdCdpT8w2s8jDq3xMix1lm/gS0BdWSvf3mnAW
         48zF2S8CHX9KCJcT87p7aPBOszBGcbSl+E6S7RdHPrFY6i4ZPrxOkFuvobviv25d3/qf
         GTbhWypEezcuXkH2jjMpU6MRcYbs8/5Wqa7brq65Q0VPZZHzwp9pqCErIg3plgu6kT5W
         IRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588879; x=1729193679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQq6z3ygsMPz3YqMkjOj9nbopV+BNnluNPMVMs2m49Q=;
        b=IRsqHAg8CkilgfqE5tPGu/jgKWtOerfaMRfdum+oFkrVg3xuSFOmNq6bPV8UyEtQmU
         oEDsbvW2LGNVaQqpAIYSXK73ikF5px5ioWSz7v72bGhyp0chMJ5Fh5Z9WXx1DlopMpgp
         dIIpiDs5hBhQrDLANMkDIKzOA6S0cZI80n4IoIdqyuqZguJZof7kbupDnc2DYgMPcq4p
         z2Fw+/Y02V9eW12FneNTYf+6bAgtAjqS/YRzmp0ZjDXT3fRmLNl2PSNaPUygIzeOTWVB
         5lkjGsCtyhJc/lKvWpYOgMo7RTfxwGqhuSKn5iDbTtMJtFX6sBxCnDv1iZi3EPluJz8J
         GBOg==
X-Forwarded-Encrypted: i=1; AJvYcCUxEF1efZqLNQVlacREM9SrgLCDUOA2XFUteJyRz9IGwNAT17QEr9Xm+PQzS/rXdvyV0MuILIoZqEBnJXRCAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeO/lVdLHyAoTO+BIYBvGI5vicst5qCKrW220l7WQN6jJdWB/m
	RIA5nGOUe+5rv1tvxpo2yftktSUMOsWMi0pQ34qESYuNBsXyFFDTuQtrazlpI3JNbjymbzJnUpq
	an17RGWm8H22frxtxc43HWum2Ce1XqVnoYfW7gA==
X-Google-Smtp-Source: AGHT+IGzJnKBr8EbYHzKmabwtIiY3NDZ6btpJ38bRunXPDbntBAO6WkgR8iAwZj51AAJj3L9eS8HKDnSVkvHZFdWbzY=
X-Received: by 2002:a05:651c:2126:b0:2fa:e7f2:764b with SMTP id
 38308e7fff4ca-2fb187ac0d8mr49847661fa.33.1728588878809; Thu, 10 Oct 2024
 12:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
 <20241001-en7581-pinctrl-v5-3-dc1ce542b6c6@kernel.org> <20241002132518.GD7504@google.com>
 <ZwWscWk5axQI9H1t@lore-desk> <20241009104821.GF276481@google.com>
 <20241009105550.GG276481@google.com> <6707a8ec.df0a0220.376450.293e@mx.google.com>
In-Reply-To: <6707a8ec.df0a0220.376450.293e@mx.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Oct 2024 21:34:27 +0200
Message-ID: <CACRpkdanpA-wq0sYv9HRF=uVeAX_mW4LaKhE8i6TgC9+0d7bCg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] mfd: airoha: Add support for Airoha EN7581 MFD
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_203442_818184_B4B3A904 
X-CRM114-Status: GOOD (  10.08  )
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

On Thu, Oct 10, 2024 at 12:14=E2=80=AFPM Christian Marangi <ansuelsmth@gmai=
l.com> wrote:

> mfd: system-controller@1fbf0200 {

Drop the mfd: thing, you probably don't want to reference the syscon
node directly
in the device tree. If you still give it a label just say
en7581_syscon: system-controller...

>         compatible =3D "syscon", "simple-mfd";
>         reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
>
>         interrupt-parent =3D <&gic>;
>         interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>
>         gpio-controller;
>         #gpio-cells =3D <2>;
>
>         interrupt-controller;
>         #interrupt-cells =3D <2>;
>
>         gpio-ranges =3D <&mfd 0 13 47>;

I think you want a separate GPIO node inside the system controller:

  en7581_gpio: gpio {
         compatible =3D "airhoa,en7581-gpio";
         interrupt-parent =3D <&gic>;
         interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;

         gpio-controller;
         #gpio-cells =3D <2>;

         interrupt-controller;
         #interrupt-cells =3D <2>;

         gpio-ranges =3D <&en7581_pinctrl 0 13 47>;
};

So users pick GPIOs:

foo-gpios =3D <&en7581_gpio ...>;

Notice that the gpio-ranges should refer to the pin controller
node.

>
>         #pwm-cells =3D <3>;

Shouldn't this be inside the pwm node?

         en7581_pwm: pwm {
                 compatible =3D "airoha,en7581-pwm";
                 #pwm-cells =3D <3>;
         };

So PWM users can pick a PWM with pwms =3D <&en7581_pwm ...>;

>         pio: pinctrl {

I would use the label en7581_pinctrl:

>                 compatible =3D "airoha,en7581-pinctrl";
>
>                 mdio_pins: mdio-pins {
>                         mux {
>                                 function =3D "mdio";
>                                 groups =3D "mdio";
>                         };
>
>                         conf {
>                                 pins =3D "gpio2";
>                                 output-high;
>                         };
>                 };
>
>                 pcie0_rst_pins: pcie0-rst-pins {
>                         conf {
>                                 pins =3D "pcie_reset0";
>                                 drive-open-drain =3D <1>;
>                         };
>                 };
>
>                 pcie1_rst_pins: pcie1-rst-pins {
>                         conf {
>                                 pins =3D "pcie_reset1";
>                                 drive-open-drain =3D <1>;
>                         };
>                 };
>         };
>
>         pwm {
>                 compatible =3D "airoha,en7581-pwm";
>         };
> };

This will make subdevices probe and you can put the pure GPIO
driver in drivers/gpio/gpio-en7581.c

Yours,
Linus Walleij

