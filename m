Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F882C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5Je0y3MKSY9EnJ0vnn4Sf8bQ8bTdsG8Jn34SwdnM5U=; b=eHF7EsDjWWNqH7
	14Je+wK1ZjajpleI6QYuQ33NHgcf6ZO0cnfatxve+CNzGurKEZ73pVpiEjql0f4cO7roAFndNGPrH
	EhZ8pHt/s2EXoKRFUwUm/mUF/hfxmn7XCsg2Ohhjjr8/5+hNXGocFFCMDVB6+O9MjD4bjhLSse2/C
	OkfykjW5Rbzlb9L1ZnuATg/R78Ogu+mu2y7++cTmAo49dh9/kD9LVOGo+ixw8VNEZ/DeP0igFdIuJ
	DtSE1E7VhmFlbEUBiI6ckDe8iidFK3vfw7rq0sRm8EIriGWntmadLAr7ZWhYVvSEM9umcnTEgn1C5
	Ztqc14ykVmXl2gNPhvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvM2w-00Af9e-14;
	Tue, 24 Oct 2023 18:22:30 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvM2u-00Af8f-1U
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 18:22:29 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6ce2d4567caso3238622a34.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698171746; x=1698776546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5Je0y3MKSY9EnJ0vnn4Sf8bQ8bTdsG8Jn34SwdnM5U=;
        b=Rl2tTctP0vlb4IyDEv21/F0fEMoJicEYBGBRXmEuoI4AMB4VX86iv/cXrOxkJdsG3T
         2O/Dznuw9XzthGNyGSRuRF8Oor3GKkXgF6M38u6Tj26vhuwvixE53z4sbjz1eFaSNADy
         hy5ITX5rx9jOmg0aqpUNQ8jIdLzXhO8HzB1pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698171746; x=1698776546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5Je0y3MKSY9EnJ0vnn4Sf8bQ8bTdsG8Jn34SwdnM5U=;
        b=wxk9PwQbNuWfafeY5/6lKJN0fJkxhDaxZ4ITUDzm5rTHy3pLuAdukIklGULrkPvJG6
         phZ4h/3DJAYDHiuSbVVaRzFtqgsaWfKm+JiKqh0QwGZW9AGhlSsH8X5ttqJdClxfXOBq
         4SWdTK5uaoHDYC0OL+vEbdeZlUvJIPeiTU0xliLhvWad04dLyIbR9CKWgh61ovBBoqGu
         Pc9ZAOlOnOfU8v9ui8JcehgWamb3hSSfwTAmm7XBWmCgR4/XQwq36uOZpwqSV92+UUZf
         RK2nwvaMxBpYP4eGfIQGbPiooOc47CA9/1PfvExoOaJMtouG/R3DzpBiFDWqNMFQnOcl
         44XQ==
X-Gm-Message-State: AOJu0YzQ+UIGN4WqOVZD99WapF7Zntvis/TRwlDBdA/cd+G3prCJ8idT
	5Ifn0vFDfxjqXkgNqQElMSss/QclGRSQ4AVR1xGnGA==
X-Google-Smtp-Source: AGHT+IELaHYYxIByrxXgKujkDSN0ViXa19s603EMKyAcH2uHi+NrtNxd6KmykPPX38FeGkI5PStPU/mX/HVy7qowNd0=
X-Received: by 2002:a05:6830:442a:b0:6c6:4473:6f05 with SMTP id
 q42-20020a056830442a00b006c644736f05mr13078761otv.9.1698171745825; Tue, 24
 Oct 2023 11:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231024000724.57714-1-hsinyi@chromium.org> <20231024000724.57714-4-hsinyi@chromium.org>
 <20231024-bobbed-although-06f341259ebb@spud>
In-Reply-To: <20231024-bobbed-although-06f341259ebb@spud>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 24 Oct 2023 11:22:00 -0700
Message-ID: <CAJMQK-hvhjNGFUfgqb7pm=pAYjJ0wZAhkPGXxDCUJ5cnUDh2gw@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-makomo
To: Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_112228_520770_20C8E95A 
X-CRM114-Status: GOOD (  15.10  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 24, 2023 at 8:17=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Oct 23, 2023 at 05:02:26PM -0700, Hsin-Yi Wang wrote:
> > Add makomo sku0 and sku1 which uses different audio codec.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/arm/mediatek.yaml | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docu=
mentation/devicetree/bindings/arm/mediatek.yaml
> > index fe8c488a3207..b131e0bdbf01 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -250,6 +250,18 @@ properties:
> >                - google,kodama-sku32
> >            - const: google,kodama
> >            - const: mediatek,mt8183
> > +      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK=
 2)
> > +        items:
> > +          - const: google,makomo-rev4-sku0
> > +          - const: google,makomo-rev5-sku0
>
> With these bindings, how does one describe a makomo-rev5-sku0?
> What you have here is only suitable for describing the makomo-rev4-sku0.
>
makomo-rev5-sku0 and makomo-rev4-sku0 uses the same dts:

compatible =3D "google,makomo-rev4-sku0", "google,makomo-rev5-sku0",
                      "google,makomo", "mediatek,mt8183";

In this case, can bindings be listed like that?




> Cheers,
> Conor.
>
> > +          - const: google,makomo
> > +          - const: mediatek,mt8183
> > +      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK=
 2)
> > +        items:
> > +          - const: google,makomo-rev4-sku1
> > +          - const: google,makomo-rev5-sku1
> > +          - const: google,makomo
> > +          - const: mediatek,mt8183
> >        - description: Google Willow (Acer Chromebook 311 C722/C722T)
> >          items:
> >            - enum:
> > --
> > 2.42.0.758.gaed0368e0e-goog
> >

