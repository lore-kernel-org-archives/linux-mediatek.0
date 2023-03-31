Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF726C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 11:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TmvPpd2YmgmpZIHsxp1gukcZ6IkVkvn2jIN3kBi1i8=; b=1S5v5UEkGNbX4e4H/S2Q+mhyom
	DAdjotGnIeEtEUDvJWYNik1JRaeXOxrD1DBUC6A5tMSAYadKyI5ZWWLsvG4F+BqYVPgmQqRD6kUb7
	Zv1l6biO9/Uer2hw3KwwdwQesnJrb5UuS3tq8RxScrvPHSEXoBTo48/H8bJ8EdG0M1ngSt3WZxJsG
	sEW51k98w4zUI9qfC3cGpc+umBb3dUmMpNDOtoN9EwCzYN7KwKgpE/Zjf0O73ya9KT6aOUoNaJogE
	oWTeqvfx3QuGDr8if+z6xUiu1A16gKj4b5IeAsrdrGvCkIsnqd1aOYdkNo6v2RwmJxIV1C8VnrS8Q
	Xwl6LOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCrG-0076q1-14;
	Fri, 31 Mar 2023 11:23:50 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCrC-0076oC-1j
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 11:23:48 +0000
Received: by mail-yb1-xb31.google.com with SMTP id e65so26934288ybh.10
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680261823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TmvPpd2YmgmpZIHsxp1gukcZ6IkVkvn2jIN3kBi1i8=;
        b=sTIfTWSObIn7UMlmphrTSYvN9Y7arYi6CRjrwIvqEAI9HkX9Exwa13txK+uYbpM7v3
         l6J4vkOqq8a0i3booWaeIUu92m/13ZKH2zw0OnWjp2qz2/hGDwkQeo9u2FnZnTxFWsxE
         9P7yyDufLYI6/2Q2hVxULgawDVnW3549Q1R+UtZSFfXLvjtNR6wvhVIjY3uC0C87RLam
         hX+jLrZKivu8A7dWkLaZPlBNwjfq5Cle2ETuJ8QDD5u6ndQPqq2STdtrm9yOoRXgMqZE
         Pd8H77fN3eDjuTD2iMiOpP6dJDo1FgaiTZm+w2XLGm3TDUzPGtd+RFL/46DdUX/uY+il
         RK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680261823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TmvPpd2YmgmpZIHsxp1gukcZ6IkVkvn2jIN3kBi1i8=;
        b=h+mcn1YvzC5xGXzP8TqFFn3UEbA4FoJ/rG2zaj0+YvW9AsX1tS97VkvqoxKe6B6J3R
         rWTaDGtgbfauJttOg4qRNnD4Aje6MADMeKVHzzNvMerpcnMl/HtkhRWBckbkcHAa7pbb
         G1HwyTb32ACul0YVBCub9uNFdtjsSLpQ5PKBC7Cn5+59dgciMWWyMtS88nKJYnoLqvjZ
         SswtyseKLu85QPVlIO14O71OvxBRyawTJMk2+C+Xwy2XIZAXevJM+lEyPGiO0SJ2te3A
         yVw98nTuVNWC1ONX0lVb0lBqCZP2HPw0chsbs5sUMNJ5qkEjG0ODdzQjI4fWDYBYia6A
         zLiQ==
X-Gm-Message-State: AAQBX9foPG/wEVpt/T86cfU/O1z7ZCTsNE9KmMbNWqozt/l0XZJi4gHB
	BJ8nmY4pbG/2GnNzrxK7sE6o+nAzrHbei3HqCB6tAg==
X-Google-Smtp-Source: AKy350Y1O6fb4CGhMXuQEcYQBTT1/oazAxitXaSHy0j76q36BAoNePcj7hYGMpWDOiNCG1ARjEL0yjdg1OiNTqnv+G8=
X-Received: by 2002:a05:6902:1181:b0:b6c:2224:8a77 with SMTP id
 m1-20020a056902118100b00b6c22248a77mr17804559ybu.1.1680261823120; Fri, 31 Mar
 2023 04:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-10-0003e80e0095@baylibre.com>
 <7b6be990-9e90-8e44-7c5e-f8b7a2701ce7@collabora.com> <CAFGrd9qMEtHVT+P-mBNxh6g1jOm5ifArSxi1bbGnrKgxCf7zSQ@mail.gmail.com>
In-Reply-To: <CAFGrd9qMEtHVT+P-mBNxh6g1jOm5ifArSxi1bbGnrKgxCf7zSQ@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 13:23:32 +0200
Message-ID: <CAFGrd9oYMXgWVxQHfn6hT0chx6kg+4UhP4Q=v4f+gF_NahhNdA@mail.gmail.com>
Subject: Re: [PATCH v3 10/17] arm64: dts: mediatek: set vmc regulator as
 always on
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_042346_581277_0DB6346C 
X-CRM114-Status: GOOD (  12.32  )
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

Le ven. 31 mars 2023 =C3=A0 13:08, Alexandre Mergnat
<amergnat@baylibre.com> a =C3=A9crit :
>
> Le mer. 29 mars 2023 =C3=A0 15:25, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> a =C3=A9crit :
> >
> > Il 29/03/23 10:54, amergnat@baylibre.com ha scritto:
> > > From: Fabien Parent <fparent@baylibre.com>
> > >
> > > MSDC1 IP block is powered by VMC. Make sure it is always on.
> >
> > Why always on?
> > Can't you just set mt6357_vmc_reg as VIN of mt6357_vmch_reg? :-)
>
> I'm not sure to get it. mt6357_vmc_reg & mt6357_vmch_reg come from
> PMIC and are supposed to be independent.
> You suggest to link them in the mt8365-evk dts file using something like:
> &mt6357_vmch_reg {
>     vin-supply =3D <&mt6357_vmc_reg>;
> };

Additionally, vin-supply is supported by fixed-regulator and
gpio-regulator, which is not the case here.
I think it isn't doable.

Regards,
Alex

