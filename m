Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9464C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 06:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uu9usq4mOX/FOI6pJz5zLJ5pzNWKUs6IvxsWUK8a5c=; b=b/JXb7O+iK4A6Q
	QHYHxR3I+H1Ut54fkPflwWigpufjRiIa6T4lKvWo2vKg7mOvXIDJa3SdyKPqL277RXzUHyKYhpDCa
	nHWoJ0mb+anDs3xMSBElE11BERLgzq3ozV4TIeiHh6w0VhNnD+A/c4j9fjVIXZhnGWqQzETb0LJ6j
	B0EC6AqwKyyJDPTgx9BO1BsvR7GdIucGlG//Uf3LVmVre3VO0n/l8xfE1jNZz60E1jhYYpxBsQphO
	o2ZOYq0PZDBTTFpWHkmA/DxPuZu1GmBYECm6I3InPHKlHYs0JuFsR18g/lKWYSBSsXN2vKYkeVilA
	hNlC4Z2GreDrpov4ltVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXynm-0051jm-Vd; Fri, 03 Mar 2023 06:21:59 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXynk-0051iv-Hs; Fri, 03 Mar 2023 06:21:57 +0000
Received: by mail-oi1-x22e.google.com with SMTP id e21so1072255oie.1;
        Thu, 02 Mar 2023 22:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677824515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uu9usq4mOX/FOI6pJz5zLJ5pzNWKUs6IvxsWUK8a5c=;
        b=fTXyzaCdRaPj0J8hS+NqiNvQyp+yT3pjGkvVFYFKdtXQrqsLwtfmjgrJnX5eZRFHVz
         /4V0diy/bNPdxM3fArpgy8WEGKWfFDKRwKcCVwI1y6L0d0fTGNrfOz10icx1Ko6ZDT6s
         gQ1YsTwWU//GXRs/O1FvhSJEYVcXuB0MW1XHTbrV9C1EhYOYxRWfFS0fK4FfiSzKiljg
         ZM96f/zYX53MqjABYL4QjB4Yoeie3T8r0+V7XUpQT1qMdK+dfq9UVh95zGS0FhIjWtGl
         mqjk0lWsnq6OhEGtPEv0Mtlqnr0zG4deisg6k1svN+Wf6g0BldiUfTfmHBTjqL1FLTRM
         zKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677824515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uu9usq4mOX/FOI6pJz5zLJ5pzNWKUs6IvxsWUK8a5c=;
        b=dG51dhqu0cVag0USzMvBRkWc0J7GbMQkcAoTIg9AFd3p3emHfy/ef5KyebS5lFIukq
         gNEGFx3vkNjKI32F30byRJjcjwy92kjVdo0p2ZsQxwaz3Wi49tDRGt9typCJ3iPgrMtv
         q13dRXy5GDnZpt4ZyMHLJCgybdeDJzTLk0jm498j7NZYDLpOTagp14xSoszocBjP3Egz
         KM22VhTpr3DgZTGAqDP4cCCSbNij+2o6g2UIEE/j3rphubr9WPxSE9OG8i6Q4T2jrp4j
         uzpn3m4wTm9l9Ey5Q/lV0r4UwbKqODN6BqgaIQ5+nVJXSmXxuFPkERO8/u3a1zFS/dBo
         BD2g==
X-Gm-Message-State: AO0yUKU50ut8u/NyL2NrSuYMCFuKeTGr9wLWf7lZR7vWhtY6G27vZut/
	GkzpU82m6ElcOX8NzOJ3k+O1iiVWR4/X5J57Bes=
X-Google-Smtp-Source: AK7set+z64CcHHKhQaG66pxc/FizbSgSp6kitd5gdIWhn5D4zQQDUYQReQikK/llQrfMO6ymTKDyCLfdWAe8qczJ6AI=
X-Received: by 2002:a05:6808:b10:b0:384:c7b:5fa7 with SMTP id
 s16-20020a0568080b1000b003840c7b5fa7mr181580oij.2.1677824515356; Thu, 02 Mar
 2023 22:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-21-arinc.unal@arinc9.com>
In-Reply-To: <20230303002850.51858-21-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 3 Mar 2023 07:21:43 +0100
Message-ID: <CAMhs-H-eLjKG=4gTFKQHm2zDsXOB2P7Pr=TgExKLkwY5frjbvw@mail.gmail.com>
Subject: Re: [PATCH 20/20] MAINTAINERS: move ralink pinctrl to mediatek mips pinctrl
To: arinc9.unal@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_222156_631695_390CD454 
X-CRM114-Status: GOOD (  14.80  )
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

On Fri, Mar 3, 2023 at 1:30 AM <arinc9.unal@gmail.com> wrote:
>
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>
> The Ralink pinctrl driver is now under the name of MediaTek MIPS pin
> controller. Move the maintainer information accordingly. Add dt-binding
> schema files. Add linux-mediatek@lists.infradead.org as an associated
> mailing list.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  MAINTAINERS | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a851eb053ca..83fa1e9651ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16541,6 +16541,28 @@ F:     Documentation/devicetree/bindings/pinctrl=
/mediatek,mt7622-pinctrl.yaml
>  F:     Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl=
.yaml
>  F:     drivers/pinctrl/mediatek/
>
> +PIN CONTROLLER - MEDIATEK MIPS
> +M:     Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> +M:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +L:     linux-mediatek@lists.infradead.org (moderated for non-subscribers=
)
> +L:     linux-mips@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl=
.yaml
> +F:     Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl=
.yaml
> +F:     Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl=
.yaml
> +F:     Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.y=
aml
> +F:     Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.y=
aml
> +F:     Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.y=
aml
> +F:     Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.y=
aml
> +F:     Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.y=
aml
> +F:     drivers/pinctrl/mediatek/pinctrl-mt7620.c
> +F:     drivers/pinctrl/mediatek/pinctrl-mt7621.c
> +F:     drivers/pinctrl/mediatek/pinctrl-mt76x8.c
> +F:     drivers/pinctrl/mediatek/pinctrl-mtmips.*
> +F:     drivers/pinctrl/mediatek/pinctrl-rt2880.c
> +F:     drivers/pinctrl/mediatek/pinctrl-rt305x.c
> +F:     drivers/pinctrl/mediatek/pinctrl-rt3883.c
> +
>  PIN CONTROLLER - MICROCHIP AT91
>  M:     Ludovic Desroches <ludovic.desroches@microchip.com>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> @@ -17486,13 +17508,6 @@ L:     linux-mips@vger.kernel.org
>  S:     Maintained
>  F:     arch/mips/boot/dts/ralink/mt7621*
>
> -RALINK PINCTRL DRIVER
> -M:     Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> -M:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
> -L:     linux-mips@vger.kernel.org
> -S:     Maintained
> -F:     drivers/pinctrl/ralink/
> -
>  RALINK RT2X00 WIRELESS LAN DRIVER
>  M:     Stanislaw Gruszka <stf_xl@wp.pl>
>  M:     Helmut Schaa <helmut.schaa@googlemail.com>
> --
> 2.37.2
>

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

