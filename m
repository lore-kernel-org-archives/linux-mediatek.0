Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8246CC001DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 03:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVSXp7pt1ynfIFYVxUfKRmE0SvUQ9GE4LWveQ3EWr04=; b=b2Rbw9xr7RIKNYu85ohLE4Z/3s
	aOXVOi+yqiiJa4Q2nXlKeHevL17CswKTIOYB+5UOvvxvOM5Pdz4WvWbXYBnlzeUh2YQ9am2sBrj1U
	g+Y4MkDjv6gHuncqxw1/giG+IUVcEVl8tgb2B3DC6bL/bAw3PB/1lJNG6+jHyhvcf4Vj8SflweGyI
	WivVRT5ydgCyPJHA2ie367T1fpqR8h9qIHTn5NqZ5BTWx8O+eHLcAc1laBUQtvTaWk5faI4SSta5E
	5MVYZP5fTM4NMPzH2KcLJxaTDQzva9lxlSQm1O8kTSViWPgzNc021Rw+rzt1OO61yqK+QeJaBowlu
	VPMh7M1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRlpA-00BTdd-2L;
	Fri, 04 Aug 2023 03:50:00 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRlp7-00BTam-37
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Aug 2023 03:49:59 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-48715f54356so372393e0c.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 20:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691120993; x=1691725793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVSXp7pt1ynfIFYVxUfKRmE0SvUQ9GE4LWveQ3EWr04=;
        b=kuZVbEqhHTsnlhU4yOn7K+V0x//RYjK4AwrNZf3Pi5jTwku1adyhSoQ6KkKQ+LLqDh
         Qa+Vf7E/P3XbgbKMEG3wnNn0cu1Nh1j+fzr7YFAmPi4NyCBd2T41h2s5+r822Dk25Dbd
         sLCHjo4nM1pZUy5NDn8ET+YoCmMJsWoQNUWWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691120993; x=1691725793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVSXp7pt1ynfIFYVxUfKRmE0SvUQ9GE4LWveQ3EWr04=;
        b=Jhq3n9T+HrYx+ZzQ8T71z8PNSSJSITlF71csgXH6TJDHIXDoBqKr6dGtCis7WSlmCV
         GI+dn8PLS9ji8d/iN/KeYooyDX8DjAG38huJs55itmob6cCx8L55f0fhWSBvLwF+Luc9
         8FOkDwXkgqdnYGHgJen8/uqaFs7HLJB4PqeXrQQ09PnFmresrhtqXc9pvg+3W7nb5+y5
         UQRUgiL6MTzBRV8XXtZGp8DTOPH99+dylfmqSrQ3MoBjWn78x2jLRFFuQHRAji89LMIU
         caCRHQAum+T2xrbX3VnvgOBawATXAZFxjDlcOxIL5P4lMzv+e2uvtxAOsXH7HFOffRgZ
         O4NQ==
X-Gm-Message-State: AOJu0Yzq9RcY5hxv16kKi6VJPvETABA3lNBwq3ESxgo7qmpkR/xc12B2
	2cDkErvj7dF9LrfLMflp1Rb4giuguVxFVZv3v0v6Wg==
X-Google-Smtp-Source: AGHT+IHYBwhOGTrCuCN8IOCqvpmaj2FCreDh6icca0SFM57jjcqreajpJTjlRkJ6xgR7wTok6XJeu9AaAfRKP49caHs=
X-Received: by 2002:a1f:e081:0:b0:486:556c:a0bb with SMTP id
 x123-20020a1fe081000000b00486556ca0bbmr269439vkg.9.1691120993526; Thu, 03 Aug
 2023 20:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230803074249.3065586-1-wenst@chromium.org> <20230803074249.3065586-10-wenst@chromium.org>
 <e9c38029-f27d-7800-2ba8-d9ee19d999e4@collabora.com>
In-Reply-To: <e9c38029-f27d-7800-2ba8-d9ee19d999e4@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 4 Aug 2023 11:49:42 +0800
Message-ID: <CAGXv+5G+kLNaj3F1NG+Y2zQuc7Xv_wczHeFUEUNGo8ZdVWYM1w@mail.gmail.com>
Subject: Re: [PATCH 9/9] soc: mediatek: pwrap: add support for MT6366 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_204958_047499_C1055A26 
X-CRM114-Status: GOOD (  25.78  )
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

On Thu, Aug 3, 2023 at 5:01=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 03/08/23 09:42, Chen-Yu Tsai ha scritto:
> > The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It ha=
s
> > a different set of regulators. Specifically, it lacks the camera relate=
d
> > VCAM* LDOs, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.
> >
> > Add a separate compatible for the MT6366 PMIC.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> We can express the same partial-compatibility state with bindings, adding=
 a
> new compatible here with the same platform data doesn't really add any va=
lue...
>
> ...also because in DT we'll have something like
>         compatible =3D "mediatek,mt6366", "mediatek,mt6358";
>
> so if any variation of platform data in mtk-pmic-wrap will ever be needed=
, we
> would still be able to do that in the future without any headache.
>
> In my opinion, this commit can be dropped.

As mentioned in my reply to the mfd patch, this might not be doable. There
are limitations on both the DT bindings and mfd driver sides.

ChenYu

> P.S.: We could add a comment in the mt6366.dtsi pmic devicetree for that,=
 too?
>
> Cheers,
> Angelo
>
> > ---
> >   drivers/soc/mediatek/mtk-pmic-wrap.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediate=
k/mtk-pmic-wrap.c
> > index 11095b8de71a..e3c0e767033b 100644
> > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > @@ -2257,6 +2257,8 @@ static const struct of_device_id of_slave_match_t=
bl[] =3D {
> >       { .compatible =3D "mediatek,mt6357", .data =3D &pmic_mt6357 },
> >       { .compatible =3D "mediatek,mt6358", .data =3D &pmic_mt6358 },
> >       { .compatible =3D "mediatek,mt6359", .data =3D &pmic_mt6359 },
> > +     /* MT6366 is mostly compatible with MT6358, except for slightly d=
ifferent regulators. */
> > +     { .compatible =3D "mediatek,mt6366", .data =3D &pmic_mt6358 },
> >
> >       /* The MT6380 PMIC only implements a regulator, so we bind it
> >        * directly instead of using a MFD.
>
>

