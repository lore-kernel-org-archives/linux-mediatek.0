Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A068C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 12:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjGy87pNKsb6y2cBmiWPHVqOZpmYwx0L2pBm6FPlioo=; b=cNpqwbfLffdrNaCvFL7CVwW/tw
	q2rciw9taOhogEMcO/aUB9cE5ufmGYYMA+bChmnfKbtXEKnC/JuVj8AjqdbjcWCQcslkrzmuLxJmz
	rTePIVByGgVBWHxckhG7daPcgWjg5gDlfjKLSw2QRVcQL/lTe4gRazv2Gavs5TaZm0YZ2xBuaytCL
	GWZa4RrWhVGTYf3kbsP7lwEEbbyZfxf5qrJY9tCEcieygLa44Hnc7SeHxdi9+n1jIWK6NJyXVCdz5
	wHSzaleUjPnzfeV68IIT5Dn1GR27d9Vc5LBB2sF4g2xL/btnnrqaax4LZB5yHYKEvG6Urec4gusw0
	eYjXv/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8tA-002AQ3-0V;
	Fri, 17 Mar 2023 12:08:52 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8t5-002AON-1K
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Mar 2023 12:08:50 +0000
Received: by mail-yb1-xb29.google.com with SMTP id p203so5299851ybb.13
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Mar 2023 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679054922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjGy87pNKsb6y2cBmiWPHVqOZpmYwx0L2pBm6FPlioo=;
        b=7xIEFhptaAK8MOSW/KceXs42/aS/R0TPdFaNQBFbHxeQNT2G2qEOR4ut2cSERK9jRZ
         a31SiWJWCrHhbWBSFreq5X1iFizZEjZIcOJN+YYW1HNqxhVoxWc3Oq3GN9JU+fYgnddF
         qnfVMZqZAv4hbcZMsDyxVdUrqqBBGy70R3UjRhmOvH4+slSl21MUEjenmsaa5U61vRxF
         Zv2O4FMnSrfyIQa/juBUsKyNJolMwS3SKIThkxNHc4NYapqXToXNBT1I6nI6uo8OZ2zv
         ePcBmKUaLc8odWHqfX9mEGfcoYyPxySm3bow7Jz4wqAKGl/pzkvwNRednOiExEgaW0Yd
         Mmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679054922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjGy87pNKsb6y2cBmiWPHVqOZpmYwx0L2pBm6FPlioo=;
        b=bK7AaOureFfg4+1kQXQwMPPw9p12z8jg5qAX5BVgeze02ggPsojRIjlaZRN3Hhw3bS
         cDOiC3f9YmUZkHzc6s2PJtIZ9MOgeMBsT4xMF+ECXvPG6APsPF7mXxL6BhQfsZhzXbxS
         Vi10PdG139Ywgy3LmR0aoNZEjlBN0CrCpPBxap6qFjXtYlcdDJfeWQwqPHDA+S8v4ANs
         OdWBQNkVI2HjUIx2rTypJuv/5/yf0iXJCNzhhb3MyQmYt00bjSQLspIQOlRUzu4sw8aG
         gWqIEEGskTSOTHMVit+euSGbXVwTRhN3KrP0LD0g2rh9ciXqIPscwY9SCwbRdaNKAA1m
         tXBA==
X-Gm-Message-State: AO0yUKU06oCGvVc4CTiKoTfXN78gNrHxCI32Vy6nhEdC2fhawWJJUbwh
	TlQ5fAt3h+prDwx0w6aCdxbd5lrw76J7E2w4E64FfA==
X-Google-Smtp-Source: AK7set/61F0QRhWRgg7+EjPAdnt8sqw4F2reO2/4CNJsbOeWAawezoBi8JybRiyvSSaD/Go45y0C6kZXjlKT4HS18yY=
X-Received: by 2002:a5b:bc7:0:b0:b3b:6452:6a0d with SMTP id
 c7-20020a5b0bc7000000b00b3b64526a0dmr10618375ybr.1.1679054922495; Fri, 17 Mar
 2023 05:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230306-ccorr-binding-fix-v2-0-4822939a837d@baylibre.com> <008996c3-074c-b443-73f2-c14f0fdf8e4e@gmail.com>
In-Reply-To: <008996c3-074c-b443-73f2-c14f0fdf8e4e@gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 17 Mar 2023 13:08:31 +0100
Message-ID: <CAFGrd9rAH4LmuZ915+sNbUcriOWU8hNXZWr94_BEjzey5YbBRw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: Fix the duplicated fallback
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_050847_448218_7CD95CC9 
X-CRM114-Status: GOOD (  19.90  )
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

Hi Matthias,

This version is outdated.
Here the last one:
https://lore.kernel.org/all/20230306-ccorr-binding-fix-v5-0-6c56aaecc3b1@ba=
ylibre.com/

Regards,
Alex

Le ven. 17 mars 2023 =C3=A0 12:25, Matthias Brugger
<matthias.bgg@gmail.com> a =C3=A9crit :
>
>
>
> On 06/03/2023 17:15, Alexandre Mergnat wrote:
> > The item which have the mediatek,mt8192-disp-ccorr const compatible alr=
eady
> > exist above. Remove duplicated fallback.
> >
> > Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback =
for mediatek,mt8186-disp-ccorr")
>
> We can argue if dt-binding patches should have a fixes tag at all. Given =
the
> fact that there are so many warnings still around, I don't see any value =
add to
> backport these to stable kernel.
>
> That said, this is defenitely no fix, as it's only a code clean-up. No wa=
rning,
> no bug, no functional error fixed here :)
>
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
> > Changes in v2:
> > - Fix commit title.
> > - Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0=
-177d81d60c69@baylibre.com
> > ---
> >   Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yam=
l | 3 ---
> >   1 file changed, 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml
> > index b04820c95b22..3aaf44719786 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr=
.yaml
> > @@ -29,9 +29,6 @@ properties:
> >             - enum:
> >                 - mediatek,mt8188-disp-ccorr
> >                 - mediatek,mt8195-disp-ccorr
> > -          - const: mediatek,mt8192-disp-ccorr
> > -      - items:
> > -          - enum:
> >                 - mediatek,mt8186-disp-ccorr
>
> Please sort compatibles, that will allow for easier reading once we add m=
ore to
> the file.
>
> Regards,
> Matthias
>
> >             - const: mediatek,mt8192-disp-ccorr
> >
> >
> > ---
> > base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
> > change-id: 20230306-ccorr-binding-fix-718c6d725088
> >
> > Best regards,

