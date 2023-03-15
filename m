Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DAEC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cFDHkDhzKIIZdfQe731ScSWbZ+pa4Y9mnpJSsgdej0=; b=AdMAvU0UMLQSzZ/O/LjoS49vWz
	vtGOC1HskiPw0dRJBcDgJqpC4GyU79XT1073IYqdbwYhtVlMrtTGCeNONF8GlSF3MnuIZTJEV16rX
	Zv4OCFcuXg7D1KLMBrrKsGisarqqMiNtSsJtg6NhV4VoRnyVRx0P1bclcT00FSZJNDQiwkaibf3vG
	3bygzOl4QMZdlmKiH9cuAczOEGvHMlt3vgHgbINzPmP751volRGnIt/6rQeEmOV6Ie9XhP0tDMO6N
	7tNxjMD/phKl3TfUSpGQ7iHPcsA/Y6pDiwKJ3a33YbUEG1ElRk70bYqzn9/iE/TPk1nfl5zQyBv4H
	2RaKq1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMKO-00Cli1-1n;
	Wed, 15 Mar 2023 08:17:44 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMKK-00Clfr-0a
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 08:17:42 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-53d277c1834so352824917b3.10
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 01:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678868256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cFDHkDhzKIIZdfQe731ScSWbZ+pa4Y9mnpJSsgdej0=;
        b=Cqc1RbAoAG7SPoHu55E0XZTM+z8BoLE9CzEd+0gppfbO0rvJ2HIPlImz3fPiqXHwje
         0fylYt8YoL+Gqaz/wp/yr9FDY7oRovbssk+gZAtfdzJ8JiqF/fFjweB/p7mubvXKXdvg
         TrMAIk1i5uLDH8eB1VxrwaegWVd9al7bQPhlSbOFVxdC4ByBhbQZo2BA74lasOO4aiW0
         seUHl2jWTwnySkP4StLrYKWKwEqTurfN0Skj7FyUEbPOuInFam228Kc3LyPgyEarQ1k9
         UYP++NomYQE1tVK4OpR60XKwJGPVk0d7cfVCZ+WYms8b8MdYDcddn9RTbWnl1xg8zFVI
         aWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678868256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cFDHkDhzKIIZdfQe731ScSWbZ+pa4Y9mnpJSsgdej0=;
        b=b8Ni4EG7n0qxTK2ehZUW0hra1uAYZcE8BkiI7uvBYiK3/uT91mbIF9fupZ68dxyCIw
         yJGDPSyrcJ41n/hl/vT3iPnW/6j1uDcaXPzM2L3rxu6uI8PA5dR4x7HG5cY1QfU5iuRy
         y8dEAr5hLqjp9XLYo8XoVu7zQGk2BhgKNH5kRTUmklXr9K1NBoiycX2w8MaLqf/iq1GU
         rNccIRiaFRI0awUks0mUlGypHajNiPTO+2BWGESRNfgt3KAK8fER08xF4MEzXPoaUG1a
         86NuMNWwn2m1nm9ryRpaqNjDrNkkdQHHQlPri19u15Ck+PsE8zv0cW6gHicIdRRvlUU7
         SVcA==
X-Gm-Message-State: AO0yUKUiELPX6i57gADWrrNnLiwoN7m26dtWaCREX+/40+pGaNxFnY6Z
	A8c6p40hpTcXrJtvVIEnwxDCbx+WGUeWr1wQO3JMPg==
X-Google-Smtp-Source: AK7set+vWYd9VC1u2ZYEyLnKAP2XlPt0kks70Y2AA7nxYNvRmd9OC+0WRfKFUao5ZMBw0zKT8aiEIEKpKMidYl4M3XU=
X-Received: by 2002:a81:b247:0:b0:52f:24ac:9575 with SMTP id
 q68-20020a81b247000000b0052f24ac9575mr26775509ywh.3.1678868256601; Wed, 15
 Mar 2023 01:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com> <ea8aaec1-948d-832b-ff24-b35abd3a59a2@linaro.org>
 <CAFGrd9p0qmfypP2DDJN1vEhJYciVfgFXZWLmvQOdpE=qgSDvKQ@mail.gmail.com>
In-Reply-To: <CAFGrd9p0qmfypP2DDJN1vEhJYciVfgFXZWLmvQOdpE=qgSDvKQ@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 15 Mar 2023 09:17:25 +0100
Message-ID: <CAFGrd9pHB_ACHRHHv41cX+hCoC6ZxoJc=x52wt_=WQcDHWf29g@mail.gmail.com>
Subject: Re: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Xinlei Lee <xinlei.lee@mediatek.com>, Guillaume La Roque <glaroque@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_011740_240418_E526AC1B 
X-CRM114-Status: GOOD (  17.20  )
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

Maybe "oneOf" should be added at least ?

  compatible:
    oneOf:
      - enum:

Regards,
Alex

Le mer. 15 mars 2023 =C3=A0 09:01, Alexandre Mergnat
<amergnat@baylibre.com> a =C3=A9crit :
>
> Le ven. 10 mars 2023 =C3=A0 09:39, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> a =C3=A9crit :
> >
> > On 09/03/2023 15:23, Alexandre Mergnat wrote:
> > > Add compatible for the MT8365 SoC.
> > >
> > > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > > ---
> > >  Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml |=
 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,=
mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.=
yaml
> > > index ca0ca549257d..931d66893dff 100644
> > > --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.y=
aml
> > > +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.y=
aml
> > > @@ -34,6 +34,7 @@ properties:
> > >        - mediatek,mt8186-mdp3-mutex
> > >        - mediatek,mt8192-disp-mutex
> > >        - mediatek,mt8195-disp-mutex
> > > +      - mediatek,mt8365-disp-mutex
> >
> > All these look compatible. Either make mt8635 compatible with something
> > or even rework entire list and make everything compatible.
>
> All of them use "mtk_mutec.c" but have specific data.
>
>       .data =3D &mt8173_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8183-disp-mutex",
>       .data =3D &mt8183_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8186-disp-mutex",
>       .data =3D &mt8186_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8186-mdp3-mutex",
>       .data =3D &mt8186_mdp_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8192-disp-mutex",
>       .data =3D &mt8192_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8195-disp-mutex",
>       .data =3D &mt8195_mutex_driver_data},
>     { .compatible =3D "mediatek,mt8365-disp-mutex",
>       .data =3D &mt8365_mutex_driver_data},
>
> I don't see any SoC compatible with mt8635, and I have no idea which
> rework you have in mind. Can you please point me an example ?
>
> Thanks
> Alex

