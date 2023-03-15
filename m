Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C25C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 09:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah3hCHxRKLhXbUb0/zDpGbrf+oZe//U+DP3mMWw+T8c=; b=WS2jxRCVlNbOxX2QS123Z85rMk
	rV7o6V9e0eyZbaiKgrxNoS7b3LzWN/EzA5VYLF1yKywPTOrbIaFTz6eie5PwBWTXluQMg/L0gw3Zc
	znx0QvRiq0jX/UDOrPhkMIhZUjWqq4YjMB4yzDs9OnJ0cuXBGDXPi3IWOqK0zxJr5IVtmySXvN3rj
	dofmCdXp3jQmuAzWhvP5h5SPs8pUQ7t0XauYJNqOol8sCRt7rbvbElieptq/Kah5ZPHsTue7s8W4B
	d5P0QElDeIalZT3bON9TbkpKB+cxbLkK224AeRVSeF4TY8VMCSzYiJEJrMH7emZpPt5YCsehrYi6v
	ybJrPE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNPD-00Cw3V-29;
	Wed, 15 Mar 2023 09:26:47 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNPA-00Cw1n-22
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 09:26:46 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id cj14so7396162ybb.12
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 02:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678872395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah3hCHxRKLhXbUb0/zDpGbrf+oZe//U+DP3mMWw+T8c=;
        b=d5zFDRwPxETDMQPbed+EfhECDqFpfx8TgxdVjJLVO33pllTKXnCeZ6Hk9QAQn7Dw4+
         oWwetYLyd4CtHpCifM8AroVKcjrw/2ujfEkNx21G9ysAvCmRlxgPsHRPxWKrE2hdexcp
         2idemqhli6FqtgkUkuZRShsSSKCkHav0hjtzcnLS7vLs5njq0I3+r1M58wEZWZSRe/5w
         MCX69ZCeDYaPs4V+n656TCYSZm7Bait5OLJkSVV06dPD39msVSlk9Vj+T+JqXAaZEp+K
         GA8c9VFqG4DPd1462qMWj+Lsk0Zv64cNfsfFiHVdem5Z+73jTMqu/Y35+PZOiQVe4uUq
         AS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678872395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ah3hCHxRKLhXbUb0/zDpGbrf+oZe//U+DP3mMWw+T8c=;
        b=CMV/gSiMP4YEzl/HSPvkPoyuBFLQPBf6eadU2vzXGrFaF/fDKNWai/8DUGa/SvRYTW
         2JWK2W+mT89Sqt+z12jyxWkrYXYhH3ZLWEgsuGpqMjMEvGI+XM+niJowkPvnqES8eoMF
         EC8ObZAxZ762UubXKqtdumg1Fg5Ss9ImgtmC4GruKy1ERe3iqK8nxSDSeHdSZKd89EpE
         UjTyweBcw13t0d3sFrEqq2OZYXn8IbeYFZJwZJnrFXjVTaf8h8GZg3axU9uWTsnf+aJe
         Ds+z3k8ghHj6Pi1q43jjOfLeuOFsG+hX5VPeVkIP0deARfPsggvIzdKb6UQLEYajjK35
         LcJw==
X-Gm-Message-State: AO0yUKU8uDkzvzl8gKW73VbeKJf2enw9S8AnqNCrR6GiKlUZrxO8578/
	4yLNbO7igjZTMIRnAXXsz8oKZ7N9xkCMNiTd44Przg==
X-Google-Smtp-Source: AK7set85Tksbs5R01RThGTgUkuOcBof0bxceE3ivDeTB4gA3qDm/+jVks8dAQC4UN3fTwJGP5ML+MUn6x7iNEe2KU4g=
X-Received: by 2002:a05:6902:10e:b0:98e:6280:74ca with SMTP id
 o14-20020a056902010e00b0098e628074camr23209983ybh.1.1678872394826; Wed, 15
 Mar 2023 02:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-7-45cbc68e188b@baylibre.com> <CAAOTY_819JuuidLgTOm+Ps=WnueW0Quos+abEDjrx8q8GifGKA@mail.gmail.com>
In-Reply-To: <CAAOTY_819JuuidLgTOm+Ps=WnueW0Quos+abEDjrx8q8GifGKA@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 15 Mar 2023 10:26:23 +0100
Message-ID: <CAFGrd9qVhJb--COXJmGHuW6NxDnXZGdQnxbHGRvaA5Jqhx-yNg@mail.gmail.com>
Subject: Re: [PATCH 07/21] dt-bindings: display: mediatek: dpi: add binding
 for MT8365
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Fabien Parent <fparent@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_022644_669362_5DAC7224 
X-CRM114-Status: GOOD (  12.54  )
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

Hi Chun-Kuang,

Le lun. 13 mars 2023 =C3=A0 16:17, Chun-Kuang Hu <chunkuang.hu@kernel.org> =
a =C3=A9crit :
>
> Hi, Alexandre:
>
> Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=
=889=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:23=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > From: Fabien Parent <fparent@baylibre.com>
> >
> > DPI for MT8365 is compatible with MT8192 but requires an additional
> > clock. Modify the documentation to requires this clock only on MT8365 S=
oCs.
>
> If MT8365 DPI has additional clock, why it is compatible with MT8192 DPI?
> I think some part of MT8165 DPI works under the speed control by the
> DPI clock and this is different with MT8192 DPI, how could these two
> are compatible?

AFAII, The mtk_dpi driver manage the 4th clock as optional
dpi->dpi_clk =3D devm_clk_get_optional(dev, "dpi");
And all configuration variables for mt8192 are the same for mt8365.
These configuration clock variables (like cal_factor) aren't
correlated with the 4th clock.
The clock number doesn't impact the configuration variable because the
4th clock is simply retrieved from DTS, saved in the driver structure
and prepare/unprepare/enable/disable, like other clocks.

Regards,
Alex

