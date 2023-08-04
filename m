Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD82FC04A94
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 03:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+t/HonaVoWzmjCN2vKrohh+X2mnS21wD/73jjSfFPw=; b=LeNd6drBXWX27FG/TjMSzbUPPS
	4rBjhj2WyzB2Yl6Ucmwefe+GE7WsHswHcCUjux0o1EhwxfrQFtQWV0+2nkyjDfO7rNhrvVxoR0iZa
	JSsF9zbHNJIXjOu448RXiTAFlPqQy4ux7u946keQpUejDQUS8sNOdzHLdAH1Nf8GNZ4rehZUXDzjx
	cNYrBVhXiWYeEejepY6EEHUAmRgrxuso1pEHoStOvQcM2dk0XyYTdSWrRI9ltRJOuqnI+CB3JmMoq
	YPU/1HvBt72FjsyNmK57l16C8CQT+0pJjagXZlf7Hl2UZsOqHp/AKxiV6yhc/22o6ez7dQ5TXWtNa
	QJq+h+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRlnN-00BTPP-1k;
	Fri, 04 Aug 2023 03:48:09 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRlnK-00BTOF-2N
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Aug 2023 03:48:08 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-79a31d66002so571461241.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 20:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691120882; x=1691725682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+t/HonaVoWzmjCN2vKrohh+X2mnS21wD/73jjSfFPw=;
        b=gPMS9kXOSEC57SZyWO9OqYOW2W0WoScwyiKZG6BkS5Og7VultoRaKpQkIjocn9ViIK
         opTgk1IvCoNb+JLQAqWDkcQqLR6au611KWn1V63n6ZegVBL26YsDAyFIal6atsQ7FIc/
         u5eEDUR0Rg+Vg7VBYIVnLrqrcFcpcz1Y2N/gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691120882; x=1691725682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+t/HonaVoWzmjCN2vKrohh+X2mnS21wD/73jjSfFPw=;
        b=TmUOpcHy/Dm+k+KuiyrXMyZwHv3k49yAQ8g8ZdsP9orvaZiHajsn+OuoOEzw9bybe8
         cliM8J4U0ns33CHYR3lU84NBkVjg81x3eoVg7LNq0EIL725R4mR3tE3TkGPz68sR1nEU
         u27P7+bd0Nyq4rmztm0Yoz2CbzTg/3Rw/h8Temw8SEcaLlicv3BG4+Pq+kFokXtBXkHm
         dEvcLZkjHh7A/E0d5x6x4gy5BYpGn6usY/Xp9d411FbvlAZvhqnfCe3R5oYoL/5T0W0o
         2aEPIpxaDCTdhZ8vcxOy4fYFJEDzM+7/71JMGK1dtgWJWltrmdXNpT0cJ5DLMBS/5jTv
         i9ew==
X-Gm-Message-State: AOJu0YwkQjSUa9OlZ4qS4pqONSpne+SFbyxNyfnt6exDk2XR1+weC2Nz
	ZNNnx45B8j8XFfA+0DKUUK7q02CIncKAmS1/hx7xwA==
X-Google-Smtp-Source: AGHT+IE0JrneMuDwCDfIF7LG9FYsde1kPnC7QcFEApmoZ63I9xCwDh3ekdDL3ZnP/i4RkyjMLJAwzYsJDtB0/2+uWEY=
X-Received: by 2002:a1f:c14b:0:b0:481:4b85:4298 with SMTP id
 r72-20020a1fc14b000000b004814b854298mr353450vkf.1.1691120881803; Thu, 03 Aug
 2023 20:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230803074249.3065586-1-wenst@chromium.org> <20230803074249.3065586-4-wenst@chromium.org>
 <aa8f232f-701a-5b4c-eda8-89fc0e6fe5a8@collabora.com>
In-Reply-To: <aa8f232f-701a-5b4c-eda8-89fc0e6fe5a8@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 4 Aug 2023 11:47:50 +0800
Message-ID: <CAGXv+5EAR9Q5gGzkw=5UEEMOHbp56oKD5m_FyiHfZ3em8QwVAQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] mfd: mt6397: Split MediaTek MT6366 PMIC out of MT6358
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
X-CRM114-CacheID: sfid-20230803_204806_776418_996849AA 
X-CRM114-Status: GOOD (  26.88  )
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
> > Add a separate compatible for the MT6366 PMIC. The regulator cell for
> > this new entry uses a new compatible string matching MT6366.
> >
> > Fixes: c47383f84909 ("mfd: Add support for the MediaTek MT6366 PMIC")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> I agree in that the LDOs are a bit different, but that's handled by the
> mt6358-regulator driver regardless of the actual devicetree compatible,
> as that's selected through a chip_id check.
>
> Finally, looking at the driver implementation itself, the addition of a
> specific mt6366 compatible here seems redundant, because the actual HW is
>   - Handled by drivers, but
>   - Described by bindings
>
> Any other opinions on this?

Well, on the bindings side, we can't have MT6366 fall back to MT6358,
neither for the whole PMIC nor just for the regulators. For the latter
it's because neither is a subset of the other, which a) makes them not
fallback compatible as required by the spirit of fallback compatibles,
and b) cannot be described with a fallback compatible, as the fallback
one will have properties/nodes that are not valid for the other, and
vice versa.

Without a fallback compatible to lean in for the regulator driver, we
will need to split out the compatible at the mfd level as well. AFAIU
the mfd core matches mfd-cells based on the compatible strings it is
given in the driver.

ChenYu

> Regards,
> Angelo
>
> > ---
> >   drivers/mfd/mt6397-core.c | 31 +++++++++++++++++++++++++++++++
> >   1 file changed, 31 insertions(+)
> >
> > diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> > index f6c1f80f94a4..3f8dfe60a59b 100644
> > --- a/drivers/mfd/mt6397-core.c
> > +++ b/drivers/mfd/mt6397-core.c
> > @@ -206,6 +206,26 @@ static const struct mfd_cell mt6359_devs[] =3D {
> >       },
> >   };
> >
> > +static const struct mfd_cell mt6366_devs[] =3D {
> > +     {
> > +             .name =3D "mt6358-regulator",
> > +             .of_compatible =3D "mediatek,mt6366-regulator"
> > +     }, {
> > +             .name =3D "mt6358-rtc",
> > +             .num_resources =3D ARRAY_SIZE(mt6358_rtc_resources),
> > +             .resources =3D mt6358_rtc_resources,
> > +             .of_compatible =3D "mediatek,mt6358-rtc",
> > +     }, {
> > +             .name =3D "mt6358-sound",
> > +             .of_compatible =3D "mediatek,mt6358-sound"
> > +     }, {
> > +             .name =3D "mt6358-keys",
> > +             .num_resources =3D ARRAY_SIZE(mt6358_keys_resources),
> > +             .resources =3D mt6358_keys_resources,
> > +             .of_compatible =3D "mediatek,mt6358-keys"
> > +     },
> > +};
> > +
> >   static const struct mfd_cell mt6397_devs[] =3D {
> >       {
> >               .name =3D "mt6397-rtc",
> > @@ -280,6 +300,14 @@ static const struct chip_data mt6359_core =3D {
> >       .irq_init =3D mt6358_irq_init,
> >   };
> >
> > +static const struct chip_data mt6366_core =3D {
> > +     .cid_addr =3D MT6358_SWCID,
> > +     .cid_shift =3D 8,
> > +     .cells =3D mt6366_devs,
> > +     .cell_size =3D ARRAY_SIZE(mt6366_devs),
> > +     .irq_init =3D mt6358_irq_init,
> > +};
> > +
> >   static const struct chip_data mt6397_core =3D {
> >       .cid_addr =3D MT6397_CID,
> >       .cid_shift =3D 0,
> > @@ -358,6 +386,9 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
> >       }, {
> >               .compatible =3D "mediatek,mt6359",
> >               .data =3D &mt6359_core,
> > +     }, {
> > +             .compatible =3D "mediatek,mt6366",
> > +             .data =3D &mt6366_core,
> >       }, {
> >               .compatible =3D "mediatek,mt6397",
> >               .data =3D &mt6397_core,
>
>

