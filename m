Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403B6C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lG+xQGmZjeb7VMZJeCb/pkjMl5CuSkW5IR7fRNg07Ho=; b=ux2uwIe0R8c3mknUPs77F9wAnj
	s7H6P/9fX3QK8zhM1aAehVe/uiRibBr1WAwQq2XRNqR5e2BnrjOkFL2uMk3Zt4cbDvRus+yrZmKqE
	8MR96UlUAVdFdaiteuwwAwZSVWno5MsMIUjbJQQam6Qgz/z5eQXJpZAGAhzIh7+qCUvmEgvlrnaGR
	u5mac0KYeEjHjXXbLVrpqVfgaHo57bysyD+e/JvM5HJJhBwkVbkyHONRqYW9W5PmJUsRkXBrVg67d
	YOdCFPPJOEmJaeSR1qfNBOPmyIGWR1CfZJ0ZHlRWVjQggl7UZHHVzEWOyIFWHxi/H+eEtoEaOIJu/
	kgjvV4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUdw-000000088aH-2e7E;
	Fri, 08 Mar 2024 07:27:48 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUdt-000000088ZM-1zzc;
	Fri, 08 Mar 2024 07:27:47 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-22195b3a8fbso413911fac.3;
        Thu, 07 Mar 2024 23:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709882863; x=1710487663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lG+xQGmZjeb7VMZJeCb/pkjMl5CuSkW5IR7fRNg07Ho=;
        b=IY0oxgoQSXPuK/A6lfRDBa/FoaUo3qcg8tA9BUB+gtxZX3fqpozMtnceaA1tXg/YE5
         86yTu/MrpJ7umEaOxYWwHewQE2wD1PxQGVfgC0fkHjo70aktigLXjiOpb26Csl+MO/n7
         KKHorsAphOmZ06XB9unusXLpnRUoeNUopmSaO8NmwQufpU4EYU8FgyhgHWadSrcuqQSj
         Zd9yOhqi8m38nppYntZOVy6LZUTYc37smTQfAcJM4zEWbuEoSBtkqOfqtYfxc+sA10q3
         mrIQft+xybIsC4Sh7XqoT3RH8bIq7teOJJt0QOenZpY1zGCyoIaLqcKJWYW2vuQh1j/F
         r6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709882863; x=1710487663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG+xQGmZjeb7VMZJeCb/pkjMl5CuSkW5IR7fRNg07Ho=;
        b=S0zQN+7A/CUjb4Brhp3NFQn9d2Yp4+ZxNAexz5dkEk3ZVk71PX+La2N4wxt9tFXrPe
         e9tD6Ad1fJhU5RuevJwuXEPNxyFx/Vn2G0YjVX40lnXgL2lyeGtbL237GnVu2EiufMDa
         AV9405OyhhWferjq9Iiw1Q4lZLi9ojwKgHiaFJfzJXbhNpNxedxA6uB7gjlEtuV1Kpyb
         XXpVkv8/CNXiILU9T6vCJsVQAyjlgPeDlv65plYFY6VECarlaDzySVriEgZpM+CQFxQR
         NRf2XHnJw4hZdjZUCzqRrDruSjPrRI3qXncTTOOo8PpWwsbug2jGD6SHqpjlttl19AJS
         Ohyg==
X-Forwarded-Encrypted: i=1; AJvYcCWMTHVSKbQoYT/pUwVT0lkV4LozXi9Tg9She2+fXWzk6ZLdgrZ1dIQH6cbG9elTHYd7B4VPhFPiwF7L/ca+hlblY6vN1S7WhoLBV0sWyGhGxJPI6Ts+6pdi88RFWukZnrNpxwY9H8pDMMVTWc9ZKTCsFjK4SvOaG04=
X-Gm-Message-State: AOJu0Yw/AM0sdlpS312D75puqheerXIeK4h5MkeYkpDvIL3Y0Q9/v5uc
	KyE2AjFGdQGz0SkL4sChJHc9/am+PataQz9kumbTGWGvZLdnLEf+yfpYOYLqGDsme3Lij7zyBC2
	cI9KNrvqO1UGlUosgOHBKXLWpz3zUDqRKWRk=
X-Google-Smtp-Source: AGHT+IHpDW+Mjc9hOrkKCdTn6Fn9WDpnVluwyApXOAVMal2VWHjOAcRX9Awal8j3U/IOsrvPoIGUIvda6AP8ayCtYbo=
X-Received: by 2002:a05:6870:d620:b0:221:85fb:cc0c with SMTP id
 a32-20020a056870d62000b0022185fbcc0cmr2414620oaq.34.1709882863630; Thu, 07
 Mar 2024 23:27:43 -0800 (PST)
MIME-Version: 1.0
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za>
In-Reply-To: <20240307190408.23443-1-justin.swartz@risingedge.co.za>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 8 Mar 2024 08:27:31 +0100
Message-ID: <CAMhs-H-qHGEpjJqMu4J2SxBo1Sq3+yy74v-j=oH=P9sSt-19zg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mips: dts: ralink: mt7621: associate uart1_pins
 with serial0
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_232745_765688_03CC012D 
X-CRM114-Status: GOOD (  13.72  )
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

On Thu, Mar 7, 2024 at 8:05=E2=80=AFPM Justin Swartz
<justin.swartz@risingedge.co.za> wrote:
>
> Add missing pinctrl-name and pinctrl-0 properties to declare
> that the uart1_pins group is associated with serial0.
>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/r=
alink/mt7621.dtsi
> index 35a10258f..dca415fdd 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -123,6 +123,9 @@ serial0: serial@c00 {
>                         reg-shift =3D <2>;
>                         reg-io-width =3D <4>;
>                         no-loopback-test;
> +
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&uart1_pins>;
>                 };
>
>                 spi0: spi@b00 {
> --
>

 Please add Acked-by/Reviewed-by tags when posting new versions.

Thanks,
    Sergio Paracuellos

