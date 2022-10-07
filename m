Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CCDC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 03:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RerK2rBiuhYMfubodkZfB/ZpDqYK/wxKKL/JNwD3Q+M=; b=nSIpbpxMjIX0p4kDA0/mNxLCNM
	hVTBjRIfB3kWNwj6nY2N07mQWjFR97BFBnkZOwE/AKKPBhh+liak5TiCnc9cPnUo+3CXYrWwZM1Lb
	orzhWWgYSX1GE/+kHD3JMjvzI5FRNPEJ5mu0cvOqBTOTdwaC6Uh8IU3jGEMNiFGv4o/4+eQIrszXW
	zD+5ywQMGZMG7/KdiBCCVJ/+S3N6CmP5+wumcJSWgxx0MA77Wgo0oE7FmBFpJcirJ3J0wznL1T7DG
	BiKhvhaPxmQKYeuZ1c3z3UbotnsLXPGXSa4ngb4m7BMTM6xSxbgxgv1cF0Wz6dF5IIz2JcQOT5Ise
	zbgFADeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogeOl-0071Wp-Pn; Fri, 07 Oct 2022 03:51:43 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogeOj-0071UA-FV
	for linux-mediatek@lists.infradead.org; Fri, 07 Oct 2022 03:51:42 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id n186so3883007vsc.9
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Oct 2022 20:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RerK2rBiuhYMfubodkZfB/ZpDqYK/wxKKL/JNwD3Q+M=;
        b=dlmBPgiOtRxGkbv7rjlv2SMcccR1EQVBHJ2axjdsJ02yrr5hKaM36d+WvZWaDEzGGt
         0Ip2I6qxqD35xFWKvcjWIRq3XMC3cSpvesLHz4hwsf8JP/9SIqaaTetF/Ruw2KzYi6+x
         O/+bfdw6x86sDV0ciAF9kUjgj1XrBkcTYu3P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RerK2rBiuhYMfubodkZfB/ZpDqYK/wxKKL/JNwD3Q+M=;
        b=mAv9fanUFOnnX2bvMtiMiIhXfRWUAittR/JX7uMVdJ8Xw+CeVtWvpg7YPos+9DoAYS
         4SheTJDBDyKZF58O6ENz5mp1K5ivLODrJoBi4swWUa/sZ0KKheq0tT2NuAdpUu7t0t8E
         cLKtMfz+/B7zO5SZXTn+mDgaa+/iVXOjYM9emt/fiHlxCyfH1LXVOU6os1Tzuk5wRvKp
         htfO8rU7Bt2q4WZgsLSKj15jz4tJ+lHbx3tUlfIdHI6Al3//o/3Y+qtTBN13YKMF2BQR
         rZZmKvVOxrgYoz5oWPo8YOtYDaoEteHqzkaaGXA5tF451vEFAALqJVrIkbejTkt8hDhD
         wSvA==
X-Gm-Message-State: ACrzQf37tndY9hJQ6Ddq6q/QYVivQpBVwILLv8Ot1MuCKN/PhscUVmp9
	dlPapLkG3mCbKPACHM4Fr/Gk+Au0ivF0MC+ZCDuVlA==
X-Google-Smtp-Source: AMsMyM6DZCU3H5d9leQfxkyqeLDM36598wR9p8zY1m3Q8gko7dMPnHiaV3d9xfcbyRe5ChJLBf+e8d8wNaErE59zoxY=
X-Received: by 2002:a67:ac09:0:b0:39a:eab8:a3a6 with SMTP id
 v9-20020a67ac09000000b0039aeab8a3a6mr1621057vse.9.1665114699289; Thu, 06 Oct
 2022 20:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221006212528.103790-1-nfraprado@collabora.com> <20221006212528.103790-6-nfraprado@collabora.com>
In-Reply-To: <20221006212528.103790-6-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Oct 2022 11:51:28 +0800
Message-ID: <CAGXv+5GmJOYnfLsovO_+piuJ1ry1R0ZQqALRGK3MNp=nUO-TNw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: mediatek: asurada: Add aliases for i2c
 and mmc
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_205141_568849_953C3FDE 
X-CRM114-Status: GOOD (  16.33  )
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

On Fri, Oct 7, 2022 at 5:25 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Add aliases for the i2c and mmc nodes on the Asurada platform DT to
> ensure that we get stable ids for those devices on userspace.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
>
> Changes in v2:
> - Added this commit
>
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8192-asurada.dtsi
> index dac2d4f5e670..758ca42a6156 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -11,6 +11,18 @@
>
>  / {
>         aliases {
> +               i2c0 =3D &i2c0;
> +               i2c1 =3D &i2c1;
> +               i2c2 =3D &i2c2;
> +               i2c3 =3D &i2c3;
> +               i2c4 =3D &i2c4;
> +               i2c5 =3D &i2c5;
> +               i2c6 =3D &i2c6;
> +               i2c7 =3D &i2c7;
> +               i2c8 =3D &i2c8;
> +               i2c9 =3D &i2c9;

You should only add aliases for interfaces that are actually enabled.

Also, I think we can disable i2c6. None of the current products use it.

ChenYu

> +               mmc0 =3D &mmc0;
> +               mmc1 =3D &mmc1;
>                 serial0 =3D &uart0;
>         };
>
> --
> 2.37.3
>

