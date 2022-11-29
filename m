Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6168BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 04:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQJriYYoXhycdFppxIrfyXtPVy4esIPKw5wab9lgd0U=; b=2nUtBLppjZDpCMaTdjN99YMUDd
	7XHRAcnop6zyVNp7hfyCy/VWOd/skUreX0+oX+8OnA1xW2HB1PZWNrG4oDEOpD3Bwob8G0pKURZ4K
	gMUvMApC55wBODNZI16EnYiF57vkw0CHuojk6GjpC6zTxXlduBBgAxfgG4CcyZVJAIO/Nklz4U3+J
	INE4zTm7Vgw5xUJ//14lV4OB9sS5VTJ+1l8OR5ojSkdLJkgbDOFOpD4MIuVqV8BCl7cLjqCX0vgGK
	IXXefj1HVZGwchTGtAeyt7WPrB648zVDJBQZZUkoLxVlVCAO8mLu+1a5oZ/RUZtQQV8TUF+8LZ6D6
	DYQeGi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozsKI-0067Zz-PT; Tue, 29 Nov 2022 04:34:34 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozsK5-0067UL-UF; Tue, 29 Nov 2022 04:34:23 +0000
Received: by mail-ot1-x329.google.com with SMTP id 94-20020a9d0067000000b0066c8d13a33dso8346416ota.12;
        Mon, 28 Nov 2022 20:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQJriYYoXhycdFppxIrfyXtPVy4esIPKw5wab9lgd0U=;
        b=CUkrijMW5IrXJMwL0+zJUVPixrr3LQO9UL9NyPEgfk0Bf5KVaV0Mq6ozs9REarA5MY
         ZsqU0z2UN0yFFk3ImXGAxDzKb7xB5RpYWBMKO3thLVAeweFWXXSvW28mqntKw+3nIr1T
         X69mancNZKv6iHAKwRaA0Q3MxUDxQ/4rKQA6Wz65xFtSOYA+GYWUjhd7lF8WcKIzilpn
         sNO0i4Fja0f/BjBYkbMsVBhmNqINxNIWrYbwhV6/NNedznV4nwSDDarUAURAnqbga+Vj
         s3E3r1OhqzU9xvf6O2XVV63iv5qOojgggrUl6zsWhdAck5LMeV3IHF1isPys8EmafDSf
         dnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQJriYYoXhycdFppxIrfyXtPVy4esIPKw5wab9lgd0U=;
        b=jRD9uhxzs5TAVo0iTcnIKD9eeyLem/VpC/IjnPwCK4M9M5AT6gK3VhS2IkeIjsbPn9
         zOUxo69B+ow+f3AFhNg6M8ckLu9Z0TJgh0QDbTWpdJhgICFxMpHdAQ2Ns6TMmLvxtw9r
         aMknS0Hv9Ri1DepCLgmGqolaP6UeV6o4EI5awHQb1KoOEENWTsuoruSEiIzXxkjrpgUG
         85liH7BH8//RxCoU5a2lkGlRWVOXUXxEnzH+oP3XSMdrQLN2byOjSLCodCU+5wzaT8XB
         eLdAOexm4BufrwGAaO0S7AhJWSufUNJ1AqyNlpK/fTHtivfRdgfnJi2tjV4xr6SxX63m
         Sn9g==
X-Gm-Message-State: ANoB5pk53wzAZzb7ISrEUxARpJHSils/n+Y81K8V7C2vRpD97XAMRo85
	3Th4w8l1Nvz66VWrQDJWp5aauDas2FTRe7P/tRc=
X-Google-Smtp-Source: AA0mqf6/XYxlYHxhs9kQru0NF89/KXPCrtasB+MfuvgCaTgm1pPa8NmW29U0wOCl8i+uKDmQOI9kGcAFCxRY6MdVsZQ=
X-Received: by 2002:a05:6830:1e65:b0:661:b632:4259 with SMTP id
 m5-20020a0568301e6500b00661b6324259mr17837342otr.304.1669696459200; Mon, 28
 Nov 2022 20:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20221128213238.3959-1-arinc.unal@arinc9.com>
In-Reply-To: <20221128213238.3959-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 29 Nov 2022 05:34:07 +0100
Message-ID: <CAMhs-H_Oz_W1HWM521qS2fLj15okptQCVE1D88P=p0L31UiF7g@mail.gmail.com>
Subject: Re: [PATCH] mips: ralink: mt7621: fix phy-mode of external phy on GB-PC2
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Petr Louda <petr.louda@outlook.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_203422_029771_A4A68AD7 
X-CRM114-Status: GOOD (  10.88  )
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

On Mon, Nov 28, 2022 at 10:33 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arin=
c9.com> wrote:
>
> The phy-mode property must be defined on the MAC instead of the PHY. Defi=
ne
> phy-mode under gmac1 which the external phy is connected to.
>
> Tested-by: Petr Louda <petr.louda@outlook.cz>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

