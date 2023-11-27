Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04323C07CB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 03:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdQ/Y6CJ/tXJPIZwoVwtxZbsYvh8pLzEZAF/c5I9cSM=; b=Ejl7LqP7GFz79ySvalpIUXuCPl
	kvrCBQWyq7LTPlNXGtK60CG+hrLZQtoT4jjoWZywBPxSFS1DFiVnORembINn98z+suNNtcUQn4tfX
	pyTLV59zCnH8csT83AJhmL9KER5vCOOisEjhe//GHsuwPKREW+cepqh/TXCNFnPLYATtbG5MP2Am3
	JOVNthUpjjO1eOFYp+I4HpqWn24J7GAwvRrLSCJeWjxukRiExHJ03MwIALk6P/r+6Xi8wLbbCJZRu
	IWDrPnDA+zN5clJrxc60mTQCRp+rxfBfb5gY0QI38d/ujivMC5V4k/l+GOJuJW3F8z+iaT3XV4vkr
	QC35zGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Sjj-001G0a-0z;
	Mon, 27 Nov 2023 03:56:43 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Sjg-001Fzp-0f
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 03:56:41 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507962561adso5781484e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Nov 2023 19:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701057397; x=1701662197; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdQ/Y6CJ/tXJPIZwoVwtxZbsYvh8pLzEZAF/c5I9cSM=;
        b=hJu5DsaX+OWkjzVT9RAX9U2vStiAx5XsTzAJ8j0eivJXWv3HreMXzLjkOp9ficZBtG
         HjcUr2finr9Ikb4cAClcuOr0wknMw8YcYUhbGuWiT8alpz7FiH3C9kb0G/rDwg34/GwJ
         5IKSktKdExDeC9YyfcjCUFzrgNbX/O9XYcDkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701057397; x=1701662197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdQ/Y6CJ/tXJPIZwoVwtxZbsYvh8pLzEZAF/c5I9cSM=;
        b=Psfl7JDfXWffJ84iCBhN6IQU1uBW0Xo/fWYKJ2NZvNB/yNnqqGS8/iKmQLUo0mmvkv
         rqvQ+wsj/Mu3zFjP7+Xa0EBChLNBpwBSDQItv6tC1ez0aO38cqhnBNhrL9WFPDuRnUsZ
         cixIBsXIc0xNU5tPKCk9+uNwdIgch9/HQQK8zHnF153JQXQq2djjeLGFOHrdDsDCU+qY
         inwsFQNy5kXt86YoGj1xidkBi80OS5UObrU0l/ii/7NAHBH0rx97DmwIFEcnqlOmhyex
         a2L7W2CX/3how3LSMwiGr3jVzpb3G+r02/HYCDRIOyLPtreiqV95oPDkTT+o6KuNEAWJ
         YbIQ==
X-Gm-Message-State: AOJu0Yx4cQGwphjQMMkn/G4+aT0YPLs0N23YAYKtjOoHSgClQiyisD8j
	n/Bhim0x9qut04rFTjuKcuSPOfm5zGYHwresyVQZapnugdRDW+AU
X-Google-Smtp-Source: AGHT+IH2iG08bIzEYYLAosPnZIOh4c7YPh9mfzAUPfhoifHONl5nCDKLKbiU6DKmkAdHGe0GNyiN+vKEshOsCkQVOrw=
X-Received: by 2002:a05:6512:3d94:b0:507:9a66:3577 with SMTP id
 k20-20020a0565123d9400b005079a663577mr4725984lfv.5.1701057397494; Sun, 26 Nov
 2023 19:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20231012230237.2676469-1-wenst@chromium.org> <20231012230237.2676469-8-wenst@chromium.org>
 <bbc99c85-750e-4736-9320-cf9471fe4c92@collabora.com>
In-Reply-To: <bbc99c85-750e-4736-9320-cf9471fe4c92@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Nov 2023 11:56:26 +0800
Message-ID: <CAGXv+5EiopM2wdccvh5_p9+67DAZnCpEhLeXUfm=3ih2hFZU3g@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: mediatek: Introduce MT8186 Steelix
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_195640_289041_58580B25 
X-CRM114-Status: GOOD (  23.45  )
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

On Mon, Oct 16, 2023 at 4:36=E2=80=AFPM Eugen Hristev
<eugen.hristev@collabora.com> wrote:
>
> On 10/13/23 02:02, Chen-Yu Tsai wrote:
> > The MT8186 Steelix, also known as the Lenovo 300e Yoga Chromebook Gen 4=
,
> > is a convertible device based on a common design of the same name. The
> > device comes in different variants. Of them, whether a world facing
> > camera is integrated is the only differentiating factor between the
> > two device trees added. The different SKU IDs describe this alone.
> >
> > The other device difference is the touchpad component used. This is
> > simply handled by having both possible components described in the
> > device tree, and letting the implementation figure out which one is
> > actually available. The system bootloader / firmware does not
> > differentiate this in that they share the same SKU IDs.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
> >   .../mt8186-corsola-steelix-sku131072.dts      |  18 ++
> >   .../mt8186-corsola-steelix-sku131073.dts      |  18 ++
> >   .../dts/mediatek/mt8186-corsola-steelix.dtsi  | 197 +++++++++++++++++=
+
> >   4 files changed, 235 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steeli=
x-sku131072.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steeli=
x-sku131073.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steeli=
x.dtsi
> >

[...]

> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b=
/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
> > new file mode 100644
> > index 000000000000..8488f2f9dc4d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
> > @@ -0,0 +1,197 @@

[...]

> > +&i2c2 {
> > +     i2c-scl-internal-delay-ns =3D <22000>;
> > +
> > +     /* second source component */
> > +     touchpad@2c {
> > +             compatible =3D "hid-over-i2c";
> > +             reg =3D <0x2c>;
> > +             hid-descr-addr =3D <0x20>;
> > +             interrupts-extended =3D <&pio 11 IRQ_TYPE_LEVEL_LOW>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&trackpad_pin>;
> > +             vdd-supply =3D <&pp3300_s3>;
> > +             wakeup-source;
> > +     };
>
> Hi Chen-Yu,
>
> This is not okay, the `trackpad_pin` is shared with touchpad@15 , and if
> drivers are probed in parallel , this can lead to a conflict on this pin
> (GPIO11)

You're right. I've moved it under i2c2 for now, as we do for other platform=
s
with second source components.

This should hopefully be cleaned up once we have a hardware prober.

ChenYu

