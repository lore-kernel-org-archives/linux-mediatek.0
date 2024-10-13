Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A52FCF258D
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 21:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwQ+0QBqpruUrAoix4rKJMBSmDvfPtsp4gDbiv475pg=; b=ankVrVQEFHoJUoC88zYGp2sCvI
	Vg0urYu4voXs7J/ZiID3K2VhCD7edRll4l5z2Jhl6gMlzUH2oV6VCDdMOMXk15gYShNapgpZPJstG
	kOz8KMQT9JI/ex0FqSTHg0tZmV12cFGhRaHXB8gk+MkBvg0wZXGulWD6TfWV8lq80dnhbYMvDK80T
	Bg5kEO1vnHJDReYFzTWz5fvPzAQwdE5ZkmzVJc0PsRVqGYNGNy3nwFbZ0fsOc/JABaQXBeyE9gjgW
	mX2bSbNnQlccDBSC7uvAlpUTPt8kEzPVvm1QsbsgAKX8L7W/zL+kaI1SglAeNggR5NbzJ/1kxRjpb
	vpuqqw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t05uL-00000003F9r-3cHv;
	Sun, 13 Oct 2024 21:13:45 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t05sx-00000003F2h-0xCj
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Oct 2024 21:12:21 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so576488e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 14:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728853937; x=1729458737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwQ+0QBqpruUrAoix4rKJMBSmDvfPtsp4gDbiv475pg=;
        b=iw/kDpcVlTJ9e+DB6xVNwHcmlaLSXtRR1xYB/9TdOutkyTXMdsrXXSNCWUnAhOAYdM
         acq43BbbptseB+ph8Z/AXwdNiHw8nH3VpFi4Ha8bp8g3qqanSyR/qSDENiqf/enkhUvi
         3d0Oo2YUUtDWhmDYUub6DDXcvugggLvLgwBOrX4wkYUwHLs1CLP+lnTSm0HbucJsNUwO
         bnk0+dhx7JasoXC+8rv6O5lIrnxugFw9ihZgv5jcHm/a3wuTvTk4ikT/ZyK27UZwjyHu
         2a5VaXV0j52zZfVHpNyqN/6NozbCeg8NgKgvQtI5w9TxtHtk3sdSm45ilJr3ErbgjMsm
         8PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728853937; x=1729458737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwQ+0QBqpruUrAoix4rKJMBSmDvfPtsp4gDbiv475pg=;
        b=O4EmbGpM4QDPCx2PK9QShq4so3NVSjKUwsUGulhv6tAZRnPZMZT5pZo0biJnIPzxkC
         v2M+xV0MIMo+UAjbviqy9NkZThtCcfGOz5yxYRt6Aow9w7VCVDVwXzD3cI8lMlDuDmTk
         KVz367JCju8dFyK0Y1Xx48+hF2/3rxBzmxKxkG1gxX4N+zT54UaPh8AhnRvbFELzy3+b
         yZS5Bhi6ONJP0z7oInYd8RmvNZSYZJl3gR5C6BJpy9+Uff6gyHgzcWLZusO0ArVkUbe1
         snMVNZkto8upIHLq+cvq+VLcTVdNiA3sxnT5buRA5CdRBQZAWqIU6mADwWnBYy6Drd9e
         9shQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv3yjn67H9zJQlTqgHGxN5ekTJ4HwbOnU2sWJs9QO2RuAFBh9LpXuJlNP4p+qycffHLuMrtFsm+IJlBXqHeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt4xYGl7e7aCAabGGPJrk6D9fS0edUnHt/ih3hO17XJqXx7ytO
	avjbWuhdu0bfawBH0WK9Nux051aI5lvw6hMpRdVCMRcayEfrAzIYaHa3RLRuUp8g6g7/ZSF4KPa
	ijMT+XvwRw0TlIDuTokwGRBCjrqm1LDKPLRPr6A==
X-Google-Smtp-Source: AGHT+IG22JRYupZ1fLsDed6hOclviXUZ6gkDKTz/1J3tmXWEWFDaDkSBlGmH4CesWUEdr/RrovlO1A4TEXMMoyRsCbs=
X-Received: by 2002:ac2:4e16:0:b0:536:554a:24c2 with SMTP id
 2adb3069b0e04-539da3c5ee1mr4707787e87.13.1728853937291; Sun, 13 Oct 2024
 14:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org> <20241013-en7581-pinctrl-v6-5-2048e2d099c2@kernel.org>
In-Reply-To: <20241013-en7581-pinctrl-v6-5-2048e2d099c2@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 13 Oct 2024 23:12:06 +0200
Message-ID: <CACRpkdZKkv=CKkA1WS4ZwSj8vXzzZFM-uv6eiMeij+fL_cvTzQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] pinctrl: airoha: Add support for EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_141219_286638_B4F5DE12 
X-CRM114-Status: GOOD (  10.03  )
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

On Sun, Oct 13, 2024 at 12:08=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.o=
rg> wrote:

> Introduce pinctrl driver for EN7581 SoC. Current EN7581 pinctrl driver
> supports the following functionalities:
> - pin multiplexing
> - pin pull-up, pull-down, open-drain, current strength,
>   {input,output}_enable, output_{low,high}
> - gpio controller
> - irq controller
>
> Tested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Co-developed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Nitpicks follow:

I would have changed the below:

+       pinctrl->gpiochip.data =3D gpio_data_regs;
+       pinctrl->gpiochip.dir =3D gpio_dir_regs;
+       pinctrl->gpiochip.out =3D gpio_out_regs;
+       pinctrl->gpiochip.status =3D irq_status_regs;
+       pinctrl->gpiochip.level =3D irq_level_regs;
+       pinctrl->gpiochip.edge =3D irq_edge_regs;

Can't you just use e.g.

chip->data =3D ... etc in the top section?

+       chip->parent =3D dev;
+       chip->label =3D dev_name(dev);
+       chip->request =3D gpiochip_generic_request;
+       chip->free =3D gpiochip_generic_free;
+       chip->direction_input =3D pinctrl_gpio_direction_input;
+       chip->direction_output =3D airoha_gpio_direction_output;
+       chip->set =3D airoha_gpio_set;
+       chip->get =3D airoha_gpio_get;
+       chip->base =3D -1;
+       chip->ngpio =3D AIROHA_NUM_PINS;

I always call that varible "gc" rather than chip, but no big deal.

+       chip->irq.default_type =3D IRQ_TYPE_NONE;
+       chip->irq.handler =3D handle_simple_irq;
+       gpio_irq_chip_set_chip(&chip->irq, &airoha_gpio_irq_chip);

I usually declare a local variable
struct gpio_irq_chip *girq;

girq =3D &chip->irq;
girq->default_type =3D...

Yours,
Linus Walleij

