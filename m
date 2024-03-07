Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBEAC48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xx95w56RGEnqgt7Xz0ZlhIHC5BxWGFuvJi0FDnmldPs=; b=u+yJa5UiZ2PxmcMBAHH8BjG5yb
	5w0WVGdyJ9NgxXIiifxohJ5fColbTgrq4EShcIOvn2ZnwFcSUL5f+fe4Qe854v/S65sZMTaBKhELo
	Jtt7tpexUnwlQazypLfKmX+umGVlO419fjpIN2FrqyewnGRhq515za6EAvBBL5IyuLIzV2xc/oDsk
	7lblSWzgABFKhukpAEkUgTADWh62WYNLKwtZxfICqoQ6PP4sH+wgYqSs1R6pZCT/U/7e+HtDy+miH
	b9ExEj1c6Tojr42d1EiQJ/cH+JHtUV5ZGeLIsbNm4mkW1zK8Nb97N4p5gXnKAv3UkZHHg9qbix08I
	qn+XtuDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riAcK-000000040Ru-3Spm;
	Thu, 07 Mar 2024 10:04:48 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riAcH-000000040Q3-0fHB;
	Thu, 07 Mar 2024 10:04:46 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-59fc2d22cfaso231973eaf.3;
        Thu, 07 Mar 2024 02:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709805883; x=1710410683; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xx95w56RGEnqgt7Xz0ZlhIHC5BxWGFuvJi0FDnmldPs=;
        b=UhAbS99uNXrJb8t+N+tf1+RI9b8UwsFnqNpro4USPp32eV4E0et/+fxcdKo2kQF/eA
         i1i8sD1gWXFTd3T9Ufcmsh/zIfSY/WorMT/gM57wwojF1hGYO4XGZNOgDumUg2M8yZKG
         NIZ7K+Wnvk9bwZ6iIBxiuru6fP8JytBGaMqTJIab1K7gwxcb2RlBvrMQQ3iF2K5OKGyI
         cdDwJcNwXYEVyRtlKTOUJTCNqbT1srIkji+bsjxBiyOD32Ui0y5/ChHifYkUGTw+yGmq
         wNhzqKatLeFpYiXtg9bB0Vcr56Y9BB0BAId5ogpTvpzAy4GbwXLm9YcvPFJmosX+K4ls
         9fmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709805883; x=1710410683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xx95w56RGEnqgt7Xz0ZlhIHC5BxWGFuvJi0FDnmldPs=;
        b=kd73uz9ChDoNS8Q37p1a+jZ3zlvh5J6paiBQQotlTAmq8GyOD1dMYokiDSZTuzSSfc
         W8aismHEvWosIdm0g7Fg+X5/ZHrWM94fjCA/aEQ0+JM/SN1vEaaXhKospHXbO24BIJ5c
         /J4/y8AlE68xq5KFBOQmdg+YvHlEoJV4IlIt/FqCpf6MtmRwl41vrJKLRxJwuz30uuqM
         kUC670/uFq/pu2wmx2m52BfgC1zMlmfucMdiUO1KETdo5WOxUQr4fJE1msRA7I4rQkdY
         kCPvxmHgsQSDLu2JdMsg4YEKJ02c2oeQNCnEtoW0FxuL9EPdT3tF8kLBZvbPPm44R1tQ
         mVhg==
X-Forwarded-Encrypted: i=1; AJvYcCWt5Fyvtx8saSWiR7qXorUWDHV3u3ATMZmapAPCnaUhrxUBG2eMNIW69l8YQQTGpwKpO4jWa8q/cPsCVbaXv9gmmjH6xstnRws3EJsSflbGU+InXM6rrepwX2NjbakO2aWh4OjQ/0VWCHjWGj5EaU4mt79/BvypouI=
X-Gm-Message-State: AOJu0YzQxahg5gjy2NfXMRFtiI5i2Qsch1GJobJnOTL/pjKhD/zpCXTK
	aUUcqYqobUQWqAgJBVkrNGFJ/HpK+HCfUkENPp9k/9OAtzgjIWjCvbjo95I5w5Hkqm3gkOTY040
	oKFypcoLZLJSKlz7KEWgEmC70V/k=
X-Google-Smtp-Source: AGHT+IGVD3wzaX3Yt+FvOko++C+SVpoj1sdjPBxPgVYX2N06XjupwxcD0RKYjgL/jX1N4ZEi5q0aWnVeEtCsn4tGWZY=
X-Received: by 2002:a05:6870:1c7:b0:220:cf76:a9b7 with SMTP id
 n7-20020a05687001c700b00220cf76a9b7mr8692531oad.44.1709805883490; Thu, 07 Mar
 2024 02:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20240306201045.1475-1-justin.swartz@risingedge.co.za> <20240306201045.1475-2-justin.swartz@risingedge.co.za>
In-Reply-To: <20240306201045.1475-2-justin.swartz@risingedge.co.za>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 7 Mar 2024 11:04:31 +0100
Message-ID: <CAMhs-H9WyQZsvEvCfUcZ0_eU8--EzxEmaxR50wdRFDGP3E64ZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mips: dts: ralink: mt7621: add serial1 and serial2 nodes
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
X-CRM114-CacheID: sfid-20240307_020445_224686_F392A397 
X-CRM114-Status: GOOD (  14.90  )
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

Hi Justin,

On Wed, Mar 6, 2024 at 9:11=E2=80=AFPM Justin Swartz
<justin.swartz@risingedge.co.za> wrote:
>
> Add serial1 and serial2 nodes to define the existence of
> UART1 and UART2.
>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 38 +++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/r=
alink/mt7621.dtsi
> index dca415fdd..2069249c8 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -128,6 +128,44 @@ serial0: serial@c00 {
>                         pinctrl-0 =3D <&uart1_pins>;
>                 };
>
> +               serial1: serial@d00 {
> +                       status =3D "disabled";
> +
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0xd00 0x100>;
> +
> +                       clocks =3D <&sysc MT7621_CLK_UART2>;
> +
> +                       interrupt-parent =3D <&gic>;
> +                       interrupts =3D <GIC_SHARED 27 IRQ_TYPE_LEVEL_HIGH=
>;
> +
> +                       reg-shift =3D <2>;
> +                       reg-io-width =3D <4>;
> +                       no-loopback-test;
> +
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&uart2_pins>;
> +               };
> +
> +               serial2: serial@e00 {
> +                       status =3D "disabled";
> +
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0xe00 0x100>;
> +
> +                       clocks =3D <&sysc MT7621_CLK_UART3>;
> +
> +                       interrupt-parent =3D <&gic>;
> +                       interrupts =3D <GIC_SHARED 28 IRQ_TYPE_LEVEL_HIGH=
>;
> +
> +                       reg-shift =3D <2>;
> +                       reg-io-width =3D <4>;
> +                       no-loopback-test;
> +
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&uart3_pins>;
> +               };
> +

Please follow the preferred order for properties described in dts
coding style [0]. I know that there is some mess around the properties
order in some nodes with the current dtsi file but we did not have
coding style before and now we have it, so I think we should follow it
at least for new additions.

Best regards,
    Sergio Paracuellos

[0]: https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

