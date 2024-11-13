Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780B6D462A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2024 13:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8EhfYVRnnDaaDgm96KhczVA/W2i6QYF4ETYO5Uyxvg=; b=yuc35+K1Wlaag21hkk1FUmj/3w
	Ixc/9+Q6Y9yZQwB1iEzy0Yh0s0Zcs76Fn5wcWlnfnfnZDTsaQ0VzwKzBCjmoVWZ1SthDXeizogvAh
	L3D3pLELhe525wyc4vZhvvdky20SCayGpCCKoT8H7pKzGPcno/HNYl0KBcRX6jgMjiTuu0VGd0uDr
	z1bEAmv2G6c1L2bsew0RI/RM6R/TMLiTUk/iyegW1utb5YbibbLIZebOx/H4KOlUcMag88bxabvhu
	GlAbFlhn3kbK7utUYOcHLISSP9D+JToV+/JaonaJ4w4kkRrIhsShYX0mrlPPEH8rDNlfXzrbbodjl
	MLXdb5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDg0-00000006yKC-1pHl;
	Wed, 13 Nov 2024 13:44:56 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDfy-00000006yIx-0v0D
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Nov 2024 13:44:55 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ff3232ee75so36474551fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Nov 2024 05:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731505492; x=1732110292; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8EhfYVRnnDaaDgm96KhczVA/W2i6QYF4ETYO5Uyxvg=;
        b=jLFz6cMESXpYB7Z1kK0+Gikeml0VzPRvxNLl25WJcfDYgv1G6H4nMlQWcUN9SNqQIS
         mwMdrR4jdMI1Z5E+3CVf2l4PmkFfmsJCdXsY0h6vUm2UpEomWvCNu9cEu/e8Rn7AjZl6
         H4yEIUkqTmLaYlRyADOS8TpqEvW1dJBFMkDD84N05A1EOVgcVN1Et/blfEfckC8hMqC8
         Ay8fByfZuSjD5zxwu/Nt4SjVyIJJitpdYXEt6wby8Sdfy2lNyomtlbowRNmwaFNrBwpH
         nPLYusnyGljLSloWFlq8vzPHLy40bscwH+YlNAC1mEtFUojAFlAtC5d0aFtBGtO/xwyD
         UKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731505492; x=1732110292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8EhfYVRnnDaaDgm96KhczVA/W2i6QYF4ETYO5Uyxvg=;
        b=Rm2Txn+13Xg1CyKZ3ZXqZXRlPNOlTntdItEi5k7Y9YMqadyaQl0bY5U0qyWnIRRsnL
         ZlnJ1tsDvSf7GIUuA2gzk7wOBzUalWvwTBMhqMqNve1I/bWZnldUUSDRTFw99Y/X24xc
         RJz5BuDCt8sE9zgNJvoNxrfIFbIlCdxR1UGUq8aoSlTE/A6CAIIf2qAiP6ufAo7tFART
         5PbtYcScmmLOsHxWShsH6/agEy62YFrcWeACBxk82Lcgd1k2dJPgjJtFrX5/fVUHj3Uy
         u8OryyTjEJk2TgW2QSAlth3cDhjLsPXY/E4+/K1JVdzSU2LFyPLUlzmCbVoz/y10Jlwv
         JEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtKcIXdN8IdAupekXiPaBR00EG4ZlIJUXs9uJT4WHJbc5y3mwCUvqXmzRt6k5m4uSwCnCodlT937e8ecHG5A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6GQGf21UEs352GRc9AhbIBWtYjNadviQ2tlXqTCWo+ACxOOvU
	ttSE5Vsv1pBPF5Ew4++/kBSWjaNQ9CUYAq6C6jVXXc9M09jN9FAL0B12gmafle2xLaaVh3+WutO
	gw2HRdxWTDXSfAENoFPs7MxiW8qij4hJ3n48c+w==
X-Google-Smtp-Source: AGHT+IG+b5aWSuZA3i2xX9eloxv3604GVUnlQQDb4BSsgZiEIKgWWJy1Jg5YtPgwVqZ9JZiAd6sMw7fi49j+Y5nheN4=
X-Received: by 2002:a05:651c:1542:b0:2fb:5038:3eb4 with SMTP id
 38308e7fff4ca-2ff202686a4mr114192251fa.29.1731505492020; Wed, 13 Nov 2024
 05:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20241106100741.173825-1-y.oudjana@protonmail.com> <20241106100741.173825-8-y.oudjana@protonmail.com>
In-Reply-To: <20241106100741.173825-8-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:44:40 +0100
Message-ID: <CACRpkdZBwSBD2ueM=5zZX3wBxxd-ZJoEKS-zTq5fuqiKOSu3mg@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_054454_299892_E45FFD8F 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On Wed, Nov 6, 2024 at 11:09=E2=80=AFAM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:


> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
(...)
> +static struct platform_driver mt6735_pinctrl_driver =3D {
> +       .probe =3D mtk_paris_pinctrl_probe,
> +       .driver =3D {
> +               .name =3D "mt6735-pinctrl",
> +               .of_match_table =3D mt6735_pinctrl_match,
> +               .pm =3D &mtk_paris_pinctrl_pm_ops,

.pm =3D pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops),

this is why you get build errors.

Yours,
Linus Walleij

