Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD2CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbewHNiIDPrh2vDJAS18QQyUgoqR1U2XFbW+RCOiyVY=; b=qiyURx1s+ompX8
	ogEdymiIbrOscT7+swwwFIB1fzYTBtI3oqqYhjiUj/KFdFU2qLpqZ4xJvIFLqN4CQDZhqatK4BASM
	GDFiNsvYc/Ukzq/QE2lclQOs50rhjn8jGUJpiEbRdGaZqUQGelF6rAX1XlROJ1G7sFUe4J7dQdij8
	N9caWGWnU6lFRCFluJ9Gs1QLERomSZ/RfL1TgMwpfOpBZnjpg60AkOWZs4n86FdYmUskT1eC3QV6q
	gRtEhr/fJWoEQv29nYRwu3iCQm9GTzrkfUaWcwL+CWg+AgGfcQ9plUFb5LJaun4QbiRL6+T67REzk
	3zHSFumeLGQqiX2UilqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OQs-00H5Nt-KY; Wed, 30 Nov 2022 14:51:30 +0000
Received: from mail-qv1-f46.google.com ([209.85.219.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OQp-00H5K9-1k; Wed, 30 Nov 2022 14:51:28 +0000
Received: by mail-qv1-f46.google.com with SMTP id e18so10717928qvs.1;
        Wed, 30 Nov 2022 06:51:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbewHNiIDPrh2vDJAS18QQyUgoqR1U2XFbW+RCOiyVY=;
        b=bx5mQUAq01GPNrPkPC0BGz4gSQtCGcPvwJOFihbcmNyzsmT450IJLUdJNmUDAx04+V
         G+7wS1bUGCMbNd7JIWLjHFFyHXjxK1fO9393/2rNx5MH3k+gPLPKBGgFiuvG1fOkXdoG
         sALE5a99Gdk7jDfUmwiXNCOD1bOoxnZGJQOpWDaNKx9DI3bXHt7GAElbuLgyptmaRVSr
         F5RE1vtUbY5hkOzzIH+4+077doHKB++XClo2PyTcNEVUw5gKHmCrOI6sVTJFoG79bpKm
         4kEh2gDS6Ms5uvQacx4WRjGIwVrLjMic6VmAHBw5gR6XDU2o2tvipTJ5Jdv33D+EH+SW
         7I3Q==
X-Gm-Message-State: ANoB5plc1XR+JoLqSh1jVh2KZiI2Q2tpn1edojA0IJsizTGYjiRv6blg
	ZHFlMxORJyol+F+FopUQYJyGB7Yd7kyFGw==
X-Google-Smtp-Source: AA0mqf7pFM4RRZ1uqEBGDtiBdz0B3ovwyH3NMQJdPKfWAcv0pQz5OUd1mrKuJy0Uz234y/oiP1jWZA==
X-Received: by 2002:a0c:d646:0:b0:4b1:d133:a4a8 with SMTP id e6-20020a0cd646000000b004b1d133a4a8mr40036136qvj.130.1669819885342;
        Wed, 30 Nov 2022 06:51:25 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id s12-20020a05620a0bcc00b006ee7e223bb8sm1330541qki.39.2022.11.30.06.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 06:51:24 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id v206so5121219ybv.7;
        Wed, 30 Nov 2022 06:51:23 -0800 (PST)
X-Received: by 2002:a81:f80f:0:b0:38e:e541:d8ca with SMTP id
 z15-20020a81f80f000000b0038ee541d8camr55824371ywm.283.1669819872327; Wed, 30
 Nov 2022 06:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20221130141040.32447-1-arinc.unal@arinc9.com> <20221130141040.32447-3-arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-3-arinc.unal@arinc9.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Nov 2022 15:51:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBZiWxORfb2hd0hn_En6yFEwm8uJXr553YfB8gv1sOFw@mail.gmail.com>
Message-ID: <CAMuHMdVBZiWxORfb2hd0hn_En6yFEwm8uJXr553YfB8gv1sOFw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm: dts: remove label = "cpu" from DSA dt-binding
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_065127_117480_A3D7FC16 
X-CRM114-Status: GOOD (  19.87  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tim Harvey <tharvey@gateworks.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, Michael Ellerman <mpe@ellerman.id.au>, Gregory Clement <gregory.clement@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Riesch <michael.riesch@wolfvision.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CC cleger

On Wed, Nov 30, 2022 at 3:33 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
> This is not used by the DSA dt-binding, so remove it from all devicetrees=
.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

>  arch/arm/boot/dts/r9a06g032.dtsi                          | 1 -

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -401,7 +401,6 @@ switch_port3: port@3 {
>                                 switch_port4: port@4 {
>                                         reg =3D <4>;
>                                         ethernet =3D <&gmac2>;
> -                                       label =3D "cpu";
>                                         phy-mode =3D "internal";
>                                         status =3D "disabled";
>                                         fixed-link {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

