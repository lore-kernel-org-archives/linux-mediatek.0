Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6772EC54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cck3p2bHkYZmQVnYplpxpScYPbxksZ8gwr6LYvSKs4g=; b=W0u6Rk0kIWiIm7A2MqkZfybSky
	hN0iTySZDvrQd38OhpInGznTz3fAhLMZzIsSvVHn7/68wajWrepiHSju1vN8s+ER1TMEqckSXgZ6+
	X6hf0+u8it+a3flUelXTEg024bHeBpFLbGAr2Ct8S/0InuJ3+Hb+steWrBsGNK6Ne+Zt1NRbZ7q5z
	KI7u6mAsyIq9BklHEvol5mh9KD6BxvysGB2i8MFcblMZ6U8FTmzV4XoO9ijmNFI1gRVkTttpE+Pqf
	OP6RUJQebGa/pgRzSmGJ9+C27VT2HMfBNKAUzln0884IUX3gzyIz/AyJIaTyl12MXgs6gZkyGLHvt
	XzzsEIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlWIS-00000003O4d-2fA0;
	Sat, 16 Mar 2024 15:50:08 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlWIO-00000003O3a-3xkK;
	Sat, 16 Mar 2024 15:50:06 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2222b96e4d2so1835122fac.3;
        Sat, 16 Mar 2024 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710604199; x=1711208999; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cck3p2bHkYZmQVnYplpxpScYPbxksZ8gwr6LYvSKs4g=;
        b=Dg+sYtYelchjvfYggLtNrqkm582tq7RVrv3RMKWezyjJMP1jz26qXx3xbT7vAO6xAr
         U1iHDOt0qN8zBWfT+AlSI/ncU3FgB86YWJbeiz7iJyhYhZHQp9G4UO8vrGGhvw7+QYYn
         AqE6dTfQSbGvJnxzanQmCEtroH7cis9w7tXLRev4abWR994jskzvwR1Vug4G6PRgoVoo
         AS+QxyqTnOVx08WTRhqrYTYmJdC+jdRE3p93sRsyhVI4DL4nobvBmfBVzbeLo7Z59oAk
         twH7xfwnH6eIja1vavky7Ol48I711Mi/f7s3zKupFGbYFdlEOqZPD/ZdZrqykylD6xNf
         jeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710604199; x=1711208999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cck3p2bHkYZmQVnYplpxpScYPbxksZ8gwr6LYvSKs4g=;
        b=gZXuJJS7pdkQS0FwQY/R5+l6z+5fSfpxdPeHqPY3mAnbPYy8kypbN8IN0iLpI7ANwh
         QF44yAbE/G2xM61rXc85dZpe0ZtMOt5VdwBHLIl9GEwh/l2ygiTJY7mAfbaDkk3wJE4i
         23mbcZMPd8YSWQqVQzC2rM9MhDrQBCtkZVEXBrujQxSJWASei6mJW7T/G9caodqs9AmV
         LALPheyE4n6Y+mFY5Y8nYcDO8HxPvZXS08dI6nuDewUD2Jw22czYwEztu6PoUm3GhcTT
         ZwepIAalTLP/xBrs5kAmwGHYhBsZjqjFz2+eNB4CjIXjUyIO7QvDXopjqdDTF5DmtFxF
         wnCA==
X-Forwarded-Encrypted: i=1; AJvYcCV+Vd21BBsezzJ3om7MqocOvoXwSRYrOHLlB48tql/VEtmiyPH8rGjz/7zaPcTrOu6Z6A8KYpZUauNTq5grP3KHEI8Mqj7TMjwuvBQ2j52pg877cepENlo2fZLYuJl5LBbsCbkCWICJpsdno3KJnT8/vQs+ZzNyNJk=
X-Gm-Message-State: AOJu0YyExmF4AGIjo//HeP9ekZRA4KfD3TWKGG7RZfS9rYIybRfGKkw/
	DRRQsZR+meYBwRuDSbM2ypfqY9EEEfWT7z1NgVVh1VkRTQlw+DgfUmunXMkb0a52asxsWJpqX+t
	jyl71t0Q/9PCrLy72HLqnPOgwH4o=
X-Google-Smtp-Source: AGHT+IGpuhlnnJG0YoQhTHmJ9vL6fGs8Zhjj2Yr1tRmgqae2WvFGnduJnmBncXhg+nKSqKXwsiveXkjy4WkuRSKmNuo=
X-Received: by 2002:a05:6870:e0c6:b0:220:8b6c:80a5 with SMTP id
 a6-20020a056870e0c600b002208b6c80a5mr9500717oab.24.1710604199037; Sat, 16 Mar
 2024 08:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
In-Reply-To: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 16 Mar 2024 16:49:48 +0100
Message-ID: <CAMhs-H9ZO-sitsrASuvsEd+ddwVyHH35gj7yAABTqFNfOCGYYw@mail.gmail.com>
Subject: Re: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
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
X-CRM114-CacheID: sfid-20240316_085005_043355_D6B79513 
X-CRM114-Status: GOOD (  10.94  )
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

On Sat, Mar 16, 2024 at 5:54=E2=80=AFAM Justin Swartz
<justin.swartz@risingedge.co.za> wrote:
>
> This set of patches was created with the intention of cleaning up
> arch/mips/boot/dts/ralink/mt7621.dtsi so that it is aligned with
> the Devicetree Sources (DTS) Coding Style [1] [2] guide.
>
> [1] Documentation/devicetree/bindings/dts-coding-style.rst
>
> [2] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
> Justin Swartz (14):
>   mips: dts: ralink: mt7621: reorder cpu node attributes
>   mips: dts: ralink: mt7621: reorder cpuintc node attributes
>   mips: dts: ralink: mt7621: reorder mmc regulator attributes
>   mips: dts: ralink: mt7621: reorder sysc node attributes
>   mips: dts: ralink: mt7621: reorder gpio node attributes
>   mips: dts: ralink: mt7621: reorder i2c node attributes
>   mips: dts: ralink: mt7621: reorder spi0 node attributes
>   mips: dts: ralink: mt7621: move pinctrl and sort its children
>   mips: dts: ralink: mt7621: reorder mmc node attributes
>   mips: dts: ralink: mt7621: reorder gic node attributes
>   mips: dts: ralink: mt7621: reorder ethernet node attributes and kids
>   mips: dts: ralink: mt7621: reorder pcie node attributes and children
>   mips: dts: ralink: mt7621: reorder pci?_phy attributes
>   mips: dts: ralink: mt7621: reorder the attributes of the root node
>
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 430 ++++++++++++++------------
>  1 file changed, 239 insertions(+), 191 deletions(-)

For the whole series:
     Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks for doing this.

Best regards,
    Sergio Paracuellos

