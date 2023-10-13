Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47C3CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOIrFGsafUUFipy0EmdcVavE31dFTWyMITdmJ3ogb1U=; b=pvclqAyyjusMrXhcA0WD0XlZXA
	LNxtuU0cFoVEMhUFbOLmZMv3jglwJfs5Mzny7I9BV8Zq3hAhs0ISAVmSi6DfF+5fINM7NIOzunp5B
	pCB9NOyhqCy4ghg6ctHp2tV3fnJmdQkUzzWPKD5cXtg1ot/awG+sx0cdPz5EDLXEewjUc0n1ZAiSn
	GtCGk/cDpCYEu8f36fPQkQ/eqaKAs/s3BeiDj2vYk5TtWTjiVMGQVhETMFAHPMGL7AppW56LhDHsH
	X4JyV/dJKdOfMcbTnP3Kb1go/FmZpnfiTCXBqHvbvvWalJ+IpRRaRR2W6tJcr5V5nuBsDcfTi0qT/
	wqyaY1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrLyp-003y6z-2r;
	Fri, 13 Oct 2023 17:29:43 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrLym-003y4w-22
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Oct 2023 17:29:42 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-504a7f9204eso2977548e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Oct 2023 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697218177; x=1697822977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOIrFGsafUUFipy0EmdcVavE31dFTWyMITdmJ3ogb1U=;
        b=g0fUAaHln4Kb2LzypiWuRFQNDg8wyKD6qJrm/hAjBTa6uyS4oWk8pWVE46XXq7VOmK
         5IcNNzdHFZe9xrZ/dDx5jSHWU+vYq3HP+iwNyd9eQtKAD9b+tZdhYqkbWvm1PoQPX83j
         fH0jrs3rx8Dq46BXjUFf/8jQCWRbdR6PP/sIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697218177; x=1697822977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOIrFGsafUUFipy0EmdcVavE31dFTWyMITdmJ3ogb1U=;
        b=UgGKw8oGoPyU2r00pNn+rX/mMX3nFTTj1NBZcYxgGaqKCg4aGOWR/txHOfaVmIqs8s
         kcZqiazlT+2ce03vojLPio0l0rm4j64rv55KYg+Ib8BcEm5aFqa1R9G1C6g/PocYEfvs
         iC14Jvke5TYHj554LReX0Ka5dPsMIkny2QrbQE9+dmeGCgKtXCOu3o9PlShk00tE4KVF
         15wHfay4vP/VxjIxHaAMrLowJd/MN7uS/rNCjUNZE7qU8rzNZXc0+dgZN7KBLbKfmz8z
         uXt3B55kDNPdqrRgPi4e0YBoY0/jL7PEGpaUJdTVEejAVaJMqSVmXcjczhHd95j6tOW1
         UtGA==
X-Gm-Message-State: AOJu0Yy5xJ/x1Tuy77WDuAGWvzxPzF8A3PfYZCiJxISR4eXuyFhKbqTj
	unLudBpaYCWhj0vfOW7G3YmG135ccasMU6Psu4dxDA==
X-Google-Smtp-Source: AGHT+IHlXOJUPgc4YdKF/GwqBVPUCLNSqtKKe94qTc6GOyoD0rJldQQHCAq2U9X6KxHG9reLUEBxj80c3R0OY+ZYNl8=
X-Received: by 2002:a05:6512:230e:b0:507:95ea:1e72 with SMTP id
 o14-20020a056512230e00b0050795ea1e72mr4194306lfu.22.1697218176696; Fri, 13
 Oct 2023 10:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231012230237.2676469-1-wenst@chromium.org> <20231012230237.2676469-3-wenst@chromium.org>
 <20231013-washer-mortally-b27c196ac50f@spud>
In-Reply-To: <20231013-washer-mortally-b27c196ac50f@spud>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 Oct 2023 10:29:25 -0700
Message-ID: <CAGXv+5GF7HfQSOg9c=G+c4DPUW24Ax7LX4raTynDbE3xc8iCdg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel /
 Tentacool Chromebooks
To: Conor Dooley <conor@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_102940_699563_44C2DE7E 
X-CRM114-Status: GOOD (  22.57  )
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

On Fri, Oct 13, 2023 at 8:11=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Fri, Oct 13, 2023 at 07:02:28AM +0800, Chen-Yu Tsai wrote:
> > Add entries for MT8186 based Tentacruel / Tentacool Chromebooks. The tw=
o
> > are based on the same board design: the former is a convertible device
> > with a touchscreen, stylus, and some extra buttons; the latter is a
> > clamshell device and lacks these additional features.
> >
> > The two devices both have two variants. The difference is a second
> > source touchpad controller that shares the same address as the original=
,
> > but is incompatible.
>
> > The extra SKU IDs for the Tentacruel devices map to different sensor
> > components attached to the Embedded Controller. These are not visible
> > to the main processor.
>
> Wha? Given your ordering, is a "google,tentacruel-sku262144" a super-set
> of "google,tentacruel-sku262145"? If not, this compatible ordering
> doesn't make sense. I can't tell from your description, and the
> absence of a
> items:
>           - const: google,tentacruel-sku262145
>           - const: google,tentacruel-sku262146
>           - const: google,tentacruel-sku262147
>           - const: google,tentacruel
>           - const: mediatek,mt8186
> suggests that there is no google,tentacruel-sku262145
> device?

AFAIK all four SKUs exist. And as far as the main processor is concerned,
they look completely identical, so they should share the same device tree.
As mentioned in the commit message, the differences are only visible to
the embedded controller, which fuses the sensor inputs.

Writing it this way avoids having four identical device tree files.

We also do this for many other device families, though those cover
different revisions, such as:

      - description: Google Hana (Lenovo Chromebook N23 Yoga, C330, 300e,..=
.)
        items:
          - const: google,hana-rev6
          - const: google,hana-rev5
          - const: google,hana-rev4
          - const: google,hana-rev3
          - const: google,hana
          - const: mediatek,mt8173


ChenYu

> Cheers,
> Conor.
>
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../devicetree/bindings/arm/mediatek.yaml     | 26 +++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docu=
mentation/devicetree/bindings/arm/mediatek.yaml
> > index 60337b439744..aa7e6734b336 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -206,6 +206,32 @@ properties:
> >            - enum:
> >                - mediatek,mt8183-pumpkin
> >            - const: mediatek,mt8183
> > +      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM14=
02F)
> > +        items:
> > +          - const: google,tentacruel-sku262144
> > +          - const: google,tentacruel-sku262145
> > +          - const: google,tentacruel-sku262146
> > +          - const: google,tentacruel-sku262147
> > +          - const: google,tentacruel
> > +          - const: mediatek,mt8186
> > +      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM14=
02F)
> > +        items:
> > +          - const: google,tentacruel-sku262148
> > +          - const: google,tentacruel-sku262149
> > +          - const: google,tentacruel-sku262150
> > +          - const: google,tentacruel-sku262151
> > +          - const: google,tentacruel
> > +          - const: mediatek,mt8186
> > +      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
> > +        items:
> > +          - const: google,tentacruel-sku327681
> > +          - const: google,tentacruel
> > +          - const: mediatek,mt8186
> > +      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
> > +        items:
> > +          - const: google,tentacruel-sku327683
> > +          - const: google,tentacruel
> > +          - const: mediatek,mt8186
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-evb
> > --
> > 2.42.0.655.g421f12c284-goog
> >

