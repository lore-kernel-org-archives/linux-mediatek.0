Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62141C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 03:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FP6NWwGt2yLd5NrF6PlqZHYY77QgWx+wZeQ/PeTpYkc=; b=EDvRVbBzQZjoHif16frUXlDMDf
	SoQZKWbVPKRlWVZBOXaykBZrenZplD3wi5/om8mDh+87dT8E9VPX8DBjychdWeTcrEZwB7yOqDniv
	+fo6j9rT+C6Ev7wgDRbEhcnRMf0mGJ9gb2gC5JkPz+wkEHQdT6c4Lgijm+kg7Y1c0VVOyAFlqI3wh
	9knA2V8EKcWLo3CsViyAFUPv76Qf+OpAr0qBZStHjz1ajpkgSX7Li0xajUoBfn2dUTHpx2eU99N9c
	XHzfN3xBAkjoZDbTbH/OpAOYkVk5oEH0gnXSyGiCvPKMou0smWKX/CeKafsGUmLia1fZVfoN+Pzi3
	WlIfLGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjApt-00E2WD-02;
	Mon, 03 Apr 2023 03:26:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjApp-00E2Ul-1D;
	Mon, 03 Apr 2023 03:26:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 86E99B810F8;
	Mon,  3 Apr 2023 03:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4475CC4339B;
	Mon,  3 Apr 2023 03:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680492373;
	bh=hrX4wjuNXtUa4it9dS1gD+x/opOelCsgKzVa5rmkya8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lNZ2cNh5LZpMSXs0x/GvA01FLXnCCZrRUi8x0zt9XdLbswQFhwKt1GrMX6DdqCKrV
	 +XIeXxupFEE3HyaVh2Uv9dqBn2fEooSbgytsHRqpxQ557IYsvYpAc1vqR8whoL6iDY
	 179fpo8Q1SlLLItRyriF6rwe+bFJ6BgokR/EvdNeDhMDCoLuunJ5CyTN8xdCDBjIpI
	 fWyn4lUm9XJWSYwnn0eowVtdsr2Nm9CKQ7k+Mosa301wJSbOG3hNwEjAnZXkPfbyDy
	 5YmtOs6xWfmvr5qr50umrnSvWNJ9LnmeowmgVHghW+7yKc55frTA+kLUhP3AJWty7i
	 dXMuJIQC5TbVA==
Received: by mail-lf1-f48.google.com with SMTP id h25so36234802lfv.6;
        Sun, 02 Apr 2023 20:26:13 -0700 (PDT)
X-Gm-Message-State: AAQBX9f3Vb9zr1PZoj2A2spof6CVHu2O2yp+iPde3LczX4lo5Xk8R6oP
	S9zzYNfotidNWawR4/kwnVFY3wf7hnMVL2KlDQ==
X-Google-Smtp-Source: AKy350YF5//fW3gKfi6NnVQPdCCMScWgB0PgA7jqaFFkilLrWcB2n9ijboh/wvLC2SKCsSxOdK5aX4P6/95BuMo1yus=
X-Received: by 2002:ac2:596a:0:b0:4e8:6261:58c2 with SMTP id
 h10-20020ac2596a000000b004e8626158c2mr9881249lfp.7.1680492371303; Sun, 02 Apr
 2023 20:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-1-45cbc68e188b@baylibre.com> <CAAOTY_8G03TpY88hMmUgbq5E6P2Y8h5a4DB5T72qfNG6CA+NQA@mail.gmail.com>
 <c8861fda-63c6-7951-29a7-9d29a73e8f3e@gmail.com>
In-Reply-To: <c8861fda-63c6-7951-29a7-9d29a73e8f3e@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Apr 2023 11:25:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-2eba2JYZdLPutCkLEWgEgOBrXQ4pqpasxu=d1QMWvUg@mail.gmail.com>
Message-ID: <CAAOTY_-2eba2JYZdLPutCkLEWgEgOBrXQ4pqpasxu=d1QMWvUg@mail.gmail.com>
Subject: Re: [PATCH 01/21] dt-bindings: display: mediatek: aal: add binding
 for MT8365 SoC
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Xinlei Lee <xinlei.lee@mediatek.com>, Guillaume La Roque <glaroque@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_202621_693150_FCD23939 
X-CRM114-Status: GOOD (  18.69  )
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

Hi, Matthias:

Matthias Brugger <matthias.bgg@gmail.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
31=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:55=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi Chun-Kuang Hu,
>
> On 13/03/2023 16:02, Chun-Kuang Hu wrote:
> > Hi, Alexandre:
> >
> > Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=
=9C=889=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:23=E5=AF=AB=E9=81=
=93=EF=BC=9A
> >>
> >> Display Adaptive Ambient Light for MT8365 is compatible with another S=
oC.
> >> Then, add MT8365 binding along with MT8183 SoC.
> >
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> >
>
> I'm a bit puzzled that you give your reviewed by while I would have expec=
ted
> that you will take the display binding patches. Will you take these or do=
 you
> want someone else to take them?

I usually apply whole series together, and I've question about
"[07/21] dt-bindings: display: mediatek: dpi: add binding for MT8365"
in this series. This is just the first version, so maybe I would apply
partial patches in later version.

Regards,
Chun-Kuang.


>
> Regards,
> Matthias
>
> >>
> >> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> >> ---
> >>   Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml=
 | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediat=
ek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,a=
al.yaml
> >> index d4d585485e7b..d47bc72f09c0 100644
> >> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> >> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> >> @@ -33,6 +33,7 @@ properties:
> >>                 - mediatek,mt8186-disp-aal
> >>                 - mediatek,mt8192-disp-aal
> >>                 - mediatek,mt8195-disp-aal
> >> +              - mediatek,mt8365-disp-aal
> >>             - const: mediatek,mt8183-disp-aal
> >>
> >>     reg:
> >>
> >> --
> >> b4 0.10.1

