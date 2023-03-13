Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C630BC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 14:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oE2enQPzyqNqSk8RyXT+Utpla6pRTT59WMFFZLHEiIg=; b=3Zy72ksiQdz3749LMD/rwEKrul
	X/2G9eIzEdf+VJQnCXbVZxL0dTUyUrYRGYfxAbI/YPNSgWFkgaPz+YCI8b0DIU6L0FHGx5AmCZ8OO
	qhbSjNSFZ1As7GY+4ZV0Ybj1RpCXUJ737iEpTguUHKJyiROQR+L/NuNZ75GblI1N6o9yYpWe6NhAn
	gGyUy3bVTS2wfPG8OjngrEJQ0BmIwlbqTPIfR5TEFYfiktOn4D/9XjO9Dw3/yUHFZSg3gIPtNWH8K
	PGQznvkgj4XcP9hNqfqy4btgymEcVMrj/fZbxaCJ55LkT1ojXdp9sqZpScFrxBQ0WWo1Evdx8O3c3
	godQGlhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjOh-006Aqp-0L; Mon, 13 Mar 2023 14:43:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjOO-006Aih-LF; Mon, 13 Mar 2023 14:43:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A796CCE10DB;
	Mon, 13 Mar 2023 14:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1B8C433A1;
	Mon, 13 Mar 2023 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678718586;
	bh=rgCmLbjy/I6lPHkIRTEjEK67QV2uGbEfPOrfNv0km3E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XooPvkoQZNq+yZgUzeVpHw+g6yS256JCCota+rkalhXprbU+E1rwSh9QbpKt2FqSc
	 5dBG4TIo1ebzN8CPDRkCYXblQWfWZ07gyWAQdShOGesWRJCNd7mR727Cf/vtnL1Aa/
	 +J2+2M75U84rGhHASOoPiXnrr4rvSFrLP/ms6SaSjUmj97F70m4EVjU86r0wFIUBjG
	 IpON3yeP7gXrKfcaZ+dzg5GP/A6CaCTrDa8qSKxyRUoXQl4cecsEltWSvIgmHXDwKB
	 gxTnA03D9PkUYjZYmPsIEe2fBXB42dFenWtoUZb4TphfTsFxuFitvufcDRJGBm2j3n
	 pQKT3v00tYlLg==
Received: by mail-lj1-f172.google.com with SMTP id h9so12880278ljq.2;
        Mon, 13 Mar 2023 07:43:06 -0700 (PDT)
X-Gm-Message-State: AO0yUKVSsVPz760hEmSPwQjYV3f/Qe7JasA/BuQWHK3N0qKh+/j4Q1Bs
	2Iaw9o4MZaiIx1VsHr6ICKwVkK6En94Y/2Tu/g==
X-Google-Smtp-Source: AK7set+Pgt4VV7yf7ocGK4RBixaIbDvbY9bbI+DYJyzWV/HGNMEg3GuKKinvRhCgws4A/g645UWL8+33qGZwFE8ux4c=
X-Received: by 2002:a2e:a36a:0:b0:295:9040:fb0b with SMTP id
 i10-20020a2ea36a000000b002959040fb0bmr10832555ljn.10.1678718584447; Mon, 13
 Mar 2023 07:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com> <CAAOTY__dkDOpyzRXWeevj_agPdZZ60-=-6Vt-HbBTKy8ai20Yg@mail.gmail.com>
In-Reply-To: <CAAOTY__dkDOpyzRXWeevj_agPdZZ60-=-6Vt-HbBTKy8ai20Yg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:42:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY__YX_LUBpF3QPp6ps769BdyDS39z5fDtpUk6ZFFc=3vwg@mail.gmail.com>
Message-ID: <CAAOTY__YX_LUBpF3QPp6ps769BdyDS39z5fDtpUk6ZFFc=3vwg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: display: mediatek: Fix the duplicated fallback
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_074317_422353_ACAF16C7 
X-CRM114-Status: GOOD (  20.12  )
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

Hi, Alexandre:

Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=8813=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:36=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi, Alexandre:
>
> Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=
=887=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:20=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > The item which have the mediatek,mt8192-disp-ccorr const compatible alr=
eady
> > exist above. Remove duplicated fallback.
>
> Applied to mediatek-drm-next [1], thanks.

It seems that Krzysztof has some comment, so I remove this patch from
mediatek-drm-next [1].

Regards,
Chun-Kuang.

>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.gi=
t/log/?h=3Dmediatek-drm-next
>
> Regards,
> Chun-Kuang.
>
> >
> > Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback =
for mediatek,mt8186-disp-ccorr")
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> > Fix MTK color correction binding
> >
> > The fallback compatible has been duplicated in the 137272ef1b0f commit.
> >
> > To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > To: Philipp Zabel <p.zabel@pengutronix.de>
> > To: David Airlie <airlied@gmail.com>
> > To: Daniel Vetter <daniel@ffwll.ch>
> > To: Rob Herring <robh+dt@kernel.org>
> > To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > To: Matthias Brugger <matthias.bgg@gmail.com>
> > To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
> > To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-mediatek@lists.infradead.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---
> > Changes in v3:
> > - Re-order compatible.
> > - Link to v2: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v2-0=
-4822939a837d@baylibre.com
> >
> > Changes in v2:
> > - Fix commit title.
> > - Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0=
-177d81d60c69@baylibre.com
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml         |=
 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml
> > index b04820c95b22..bda86e6857f5 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr=
.yaml
> > @@ -27,13 +27,10 @@ properties:
> >            - const: mediatek,mt8192-disp-ccorr
> >        - items:
> >            - enum:
> > +              - mediatek,mt8186-disp-ccorr
> >                - mediatek,mt8188-disp-ccorr
> >                - mediatek,mt8195-disp-ccorr
> >            - const: mediatek,mt8192-disp-ccorr
> > -      - items:
> > -          - enum:
> > -              - mediatek,mt8186-disp-ccorr
> > -          - const: mediatek,mt8192-disp-ccorr
> >
> >    reg:
> >      maxItems: 1
> >
> > ---
> > base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
> > change-id: 20230306-ccorr-binding-fix-718c6d725088
> >
> > Best regards,
> > --
> > Alexandre Mergnat <amergnat@baylibre.com>

