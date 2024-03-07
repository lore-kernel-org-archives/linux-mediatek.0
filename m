Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B621C54E49
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfiN71yjEq06kQnKXoFCj8BeAGC6FOe9WVX5nTE06dw=; b=EoOH6pbyUPhy93v8F2TzAP7wFh
	VIyshFEp5nX1lcFLSrLi7VJ7GtKfNK113oJX+eiFMsnjT1/b91qHPsgYDIAexx8WQVh/YlSnJb+Ol
	5JXIYcp3nkjZSeIe5gtXR6pAa08XwKQuEuc3trPB/KwrN5lGikRJ6PG6YOSa1VXnZzOzIuNSVFPYi
	XxzP1EGsYtheENNuJZ+O7/LCvQl+BqjWcvKGP3dejqnDUvNS0Y1+D6I40sKUc9qqsy3hpuijlqfVS
	nfjnTXGd0ie0/bL6T0HAT1Y1oFkXdQeDGiY28bgjf0PGZPW6bfENF51KIWYx+19d+cQVH1wLSwPJF
	mGCKY6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riC0j-00000004Jho-2JlG;
	Thu, 07 Mar 2024 11:34:05 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riC0g-00000004JhH-0sTP;
	Thu, 07 Mar 2024 11:34:03 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-21f5ab945e9so336309fac.0;
        Thu, 07 Mar 2024 03:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709811240; x=1710416040; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfiN71yjEq06kQnKXoFCj8BeAGC6FOe9WVX5nTE06dw=;
        b=Ur79uxQHWfx+dPBETEV0RAgHGGRgrzL4sZMpeSUF52zgsRZ11HnS06VLJZ8i6Dp6Os
         wYZVo15REpqb5K2lC4yhhLMaH5wFuDkb8ap7REFcopG79DGYce7hJEiY56muBeXIemGZ
         ku3NwNItYBDLqGhiHGG0P2+8/Q3UebLMAUYbab2RLOXDoDJszxHSz7BDf5hcAtRLT+B5
         c4nt514iKSocnJxkj79asnKYiV7ELofBtCMab0E383Mkk1oLcRbA9wh7NKI9jsv+O7VX
         8cLlAqw+wyD2/43T72KJLptugVYxiZwYS/fs9nhOZFI9J6tZSzeeNh4vGT1twmRGRlUJ
         XhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709811240; x=1710416040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfiN71yjEq06kQnKXoFCj8BeAGC6FOe9WVX5nTE06dw=;
        b=mJVJaG4wReMeNp/jas13tIrm7EGkz8Z7IYWVPyMC4D9lGfjPQtf1npJfciflfxhFya
         FEVqHzQs7PrYA6tY0XTagKzzyq2dAMwZh0IuG8rgLOkKDNHtBpVl91Cb5CNxo3Ajkyt4
         yZjnoKKZvjAI5cRfBRJg6d5VMi+ZDUCLzgUGku3eMaB/FeNvr6yYWkci25a/USb0cfW6
         51O7kLaYZm1i3Jwjj4gOGFrLPj5wRXy1anzBA0r99K2zuFbQt52o4FE1cIY9cq2z29gh
         rXO7+KMODDaMmpHkWznQnbj3FQhIFWYJnaFMe8Fpg3ozHDn3ff9ym7tiRPkCvX9CkqaE
         MH4A==
X-Forwarded-Encrypted: i=1; AJvYcCXACmgAWddo6T67d7nq5hx7z+ZKTd82IbAYMgM5zWKjxMBUtke0z+zqlg02R2q7HEW0R1VL6CMmc53BWJo9r7/4m/rt/SS5DB9FMgoijyBajeyYQglueE1OToca07VJQIHJ1FS73gtUPB86KZA44UwWanHUohGlVPU=
X-Gm-Message-State: AOJu0YznoM6AQ2j/2LZts3mgKJv02jNWbmDK0LTE1H9UoChWxW1n5ztn
	mzda6oemFk1u7YJ5zRopc3YHGb15iloCaC9a+T9qQKRMn7hJWLDkr9GLekLPgVLCAm/FJRB9qRQ
	0SZW2gMt5o3Jme+kp/xFMVKF2cqQpBROt
X-Google-Smtp-Source: AGHT+IF9nU7Bw5OL1UXfJ/VIJjzxqtaiFExqbxtku03iI/6LOpc+8ghFzU/DzqruvQCOJMPRfluToZmoiQqEG5Q3XkM=
X-Received: by 2002:a05:6870:1715:b0:221:3ba2:ffef with SMTP id
 h21-20020a056870171500b002213ba2ffefmr399867oae.14.1709811240638; Thu, 07 Mar
 2024 03:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20240306201045.1475-1-justin.swartz@risingedge.co.za>
In-Reply-To: <20240306201045.1475-1-justin.swartz@risingedge.co.za>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 7 Mar 2024 12:33:48 +0100
Message-ID: <CAMhs-H9nFA_HKb=8vj+ZESoNKDM8D9UFQmngX+T0Ntamc=5x0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mips: dts: ralink: mt7621: associate uart1_pins with serial0
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
X-CRM114-CacheID: sfid-20240307_033402_348398_3DC0321F 
X-CRM114-Status: GOOD (  10.27  )
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

On Wed, Mar 6, 2024 at 9:11=E2=80=AFPM Justin Swartz
<justin.swartz@risingedge.co.za> wrote:
>
> Add pinctrl-name and pinctrl-0 properties to declare
> that the uart1_pins group is associated with serial0.
>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

