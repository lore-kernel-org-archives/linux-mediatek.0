Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FBDCD5BD1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 17:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZ/IhhKarGkjsev1ebvJY6DbVpgdipumlxcq7yohLJc=; b=Ur/5Ne5VnafEWdUJJwjCXw5Ejz
	BWGqTi1Int1C9j/O6WJSB4LkmFoymy1b9zyiEmClyOfocCcJClJByWo+aVx0YcpqQlP3V+TVevznu
	qsgfiDD2CPJ06L1PS6HSiRT2geWRoNTNlEKwNRyJU9hKHGFAguJbBHItL4jth+d8shOoQm22xC57l
	ywPyntwhYp9BEh8wyYSl6PjHsBcchq4IacbB2zOuJdsA8ndfIF2eM2zgeu/zNwTo7FcHoZojMDsNv
	MzxVDj0UbM+hIZo69SWc1RM+YTga1tYzxN81bpE346/5O2vPmkUZVJHFHsne0yRt7yTwY/iq4IUmk
	ibgoTT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6pJ-0000000BcOO-08LM;
	Mon, 01 Jun 2026 17:53:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6pF-0000000BcNb-35S3
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 17:53:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F25F0441B7
	for <linux-mediatek@lists.infradead.org>; Mon,  1 Jun 2026 17:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B6D1F0089A
	for <linux-mediatek@lists.infradead.org>; Mon,  1 Jun 2026 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780336400;
	bh=WZ/IhhKarGkjsev1ebvJY6DbVpgdipumlxcq7yohLJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nr+gO/iRezHfQIb24kdU3vqS4vOhiseSZ6xa7VjdriTDL9IbS2aIb/ojqPcIAIVZJ
	 qWxMunqkAm0wsMP6jrIO/7UlDOaNeH7hF27BB4N0afm/wO9bfvems0F28Ck8HW4I+I
	 1VZF0t3infumq2ZX4u/zQHt/PMjvFZ4IZqx4HURNlzc9NZpclnCutWKA5Cokv/j6kG
	 ELynKCEyyuody05IlXgmfcbAQ6oOGK+gk/WUOluQn2EVVq+2EAE+oJyrNgd7hIwZCm
	 jMB+R6lwKZxxHw05OWX4JAKdOMWqYxmirNq7GgfqF9+TPyFy45+DAFZj52CCaauQaz
	 rQpGjHtF9aadw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso1828482e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2026 10:53:20 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxu5lIPyN7hREmmxG7EukJm6FyPBlW6RGwCRsFWfGi7QrPa0YyA
	oBaeS8kl2cDVFegO/RojyRalpIoIARF5hzN2v+69vXb734USLUmNgEltsJ7v8Ec3OL9lvrhI+ay
	syWb9jOktd7es3dakzQO9y4Qt8XJFPEo=
X-Received: by 2002:a05:6512:3094:b0:5aa:6f47:32a0 with SMTP id
 2adb3069b0e04-5aa6f47362cmr1141285e87.11.1780336399508; Mon, 01 Jun 2026
 10:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260601152707.29039-1-l.scorcia@gmail.com>
In-Reply-To: <20260601152707.29039-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 19:53:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
X-Gm-Features: AVHnY4I49xiJB05RGboGIRNa8JpcA6v3sUBoiJTKtDzGmvM3jaAvFsRby97G7MQ
Message-ID: <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_105321_796897_91B428ED 
X-CRM114-Status: GOOD (  13.00  )
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

Hi Luca,

thanks for your patch!

On Mon, Jun 1, 2026 at 5:27=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The driver for MT6795 pinctrl already supports the slew-rate property.
> Add its description to the documentation.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
(...)
> +          slew-rate:
> +            description: |
> +              Set the slew rate. Valid arguments are described as below:
> +              0: Normal slew rate
> +              1: Slower slew
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Ideally slew-rate is V/s (or V/us, any suitable prefixes).

Of course that would vary for any capacitance on the output line,
so that value would be for an infinite impedance (open circuit).

Do you know that value for the SoC to you can express it like
this and translate it in the driver?

Maybe we should even invent something like
slew-rate-volt-per-microsecond =3D <...>; to push this into
SI units.

That said, there are many SoC:s doing what you're doing
above so it's no strict requirement.

Yours,
Linus Walleij

