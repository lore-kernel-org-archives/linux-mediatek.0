Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BDFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 08:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87A06113D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 08:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A87A06113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PieGXe3yCg7m1/kLXekstwqyotB55XzykbsuyfhG6K0=; b=R0QjyOze7TYMfp
	42PYqNJ7RoOo2jOs9kBznYa+BBPEuCo8n+RdefIxMX0++E5S0HpvTu1GdoVoHZlzpx+1UhZrMp2f1
	zlyB2pPLIvvP0eFodd5+g1f7msalwPswiX0GQk9K3jGOK7UmDeTiPP/36XeY5JZUcyTVW149dsWoF
	UI+Ncld37DOh30PMlBFcECgFxOHVBn90px3VVsUAQbrEzrvSrcDqw7dEbhGemokH4pzZHC8s6/uFI
	xXnXdk8XHw5UXHoty7HobyhaPoFJsuF+KFrNlkPLC7FSrRanFf9QYIL0fZVLg+uXVgVKNHl2vo0qW
	t7MzZS9CtjwdFGrsbkOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk01A-00Fjhl-8Z; Mon, 08 Nov 2021 08:28:40 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk00u-00FjdK-Uj
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 08:28:27 +0000
Received: by mail-il1-x134.google.com with SMTP id s14so16032285ilv.10
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 00:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0lEfzRhEv5nLfiUNxNLUbl+a6LR8Um12H8MIrdzaUE8=;
 b=Bj2FPDb5XEY1QTxJkJ96nDpx0QX6fremmFOktl+5WbL4QJQ0UF9kfVRh6hIXXIszzS
 JVXX69E959ZITaQ2UfNCwCoilKGQ8xOtVDJEU4k5otGI/C+pOqwgB1qay6bwOZUCVhZo
 kikTcghNiGTTQ8vwinbywDQtJ4a33cxQVO9ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0lEfzRhEv5nLfiUNxNLUbl+a6LR8Um12H8MIrdzaUE8=;
 b=I3X7KBrEPvC5Rnv/tHOhnXp7X6ADsyCUodTAlIlz5D54ejNbKHxmlsecASncgNxgpH
 y7rx2dvQ3fPwbTufL4rWhPZvPDEFrI6IVS8w6EgabWDFOyFs8ZO7Xm1w0rXa8eSkhS+H
 /1gs8jGBeqvG1A6pGEyjbpPmcY0HPUpHemk7ih0WgOD3DpxscZkS1Jld3aKK55w/ZXDg
 3X6KN2AZJmkCidHSn6hsSf6ZaHdd8jFgzS56qi7bmO/FzT8pWT5PC3eQinczxg0/rkxd
 W0mSdxtFJupLOPbyleeJ/ZrGcEwUIgCVRuxc80LQCFtMftIsb10JSgJeLdgX3dpKsKs8
 4RVQ==
X-Gm-Message-State: AOAM530KDvApKSN+MQZvqGnrt406CMQ65lo4dZdzQWp8Env8QOim+Cb0
 VlRaZjxQ9tShv+/ti8u5filTP2Ewqn/kpbEtART3yw==
X-Google-Smtp-Source: ABdhPJzZ2sLmjcU/xcMOLtZRTFE1A/1jUa95N+Xr7vk+BsL9XbPBxFalg+nFVb8TYFPMvIbL0DATPFhlQBQQHsp7uDk=
X-Received: by 2002:a05:6e02:1aa2:: with SMTP id
 l2mr42399910ilv.114.1636360103665; 
 Mon, 08 Nov 2021 00:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20211108072711.1628566-1-hsinyi@chromium.org>
 <20211108072711.1628566-7-hsinyi@chromium.org>
 <CAGXv+5GD7KU4i+P--6RShhMu32Rhf-g6SZF8SRDscc4XEG4QrQ@mail.gmail.com>
In-Reply-To: <CAGXv+5GD7KU4i+P--6RShhMu32Rhf-g6SZF8SRDscc4XEG4QrQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 8 Nov 2021 16:27:58 +0800
Message-ID: <CAJMQK-iHHitbgxk5q2Z8dRt=o2XwX=WK5dbi+xcZ6Jk4MQzzig@mail.gmail.com>
Subject: Re: [PATCH 7/7] dt-bindings: arm64: dts: mediatek: Add sku22 for
 mt8183 kakadu board
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_002825_004742_868D45F0 
X-CRM114-Status: GOOD (  18.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 8, 2021 at 4:10 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Mon, Nov 8, 2021 at 3:29 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Add sku22 which uses different audio codec than previous kakadu board.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > index 99e7f8e294cd03..da5f9ecc1a9b37 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -161,8 +161,11 @@ properties:
> >            - const: mediatek,mt8183
> >        - description: Google Kakadu (ASUS Chromebook Detachable CM3)
> >          items:
> > -          - const: google,kakadu-rev3
> > -          - const: google,kakadu-rev2
> > +          - enum:
> > +              - google,kakadu-rev2
> > +              - google,kakadu-rev2-sku22
> > +              - google,kakadu-rev3
> > +              - google,kakadu-rev3-sku22
> >            - const: google,kakadu
> >            - const: mediatek,mt8183
>
> This matches
>
>     "google,kakadu-rev[23](-sku22)?", "google,kakadu", "mediatek,mt8183",
>
> which isn't what you want. You want:
>
>     "google,kakadu-rev3", "google,kakadu-rev2", "google,kakadu",
>     "mediatek,mt8183"
>
> or
>
>     "google,kakadu-rev3-sku22", "google,kakadu-rev2-sku22", "google,kakadu",
>     "mediatek,mt8183"
>
> I think the following is closer, but I'm not sure if nesting "items" is valid.
>
> items:
>   - oneOf:
>     - items:
>       - const: google,kakadu-rev3-sku22
>       - const: google,kakadu-rev2-sku22
>     - items:
>       - const: google,kakadu-rev3
>       - const: google,kakadu-rev2
>   - const: google,kakadu
>   - const: mediatek,mt8183
>
How about

items:
  - enum:
        - google,kakadu-rev2
        - google,kakadu-rev2-sku22
  - enum:
        - google,kakadu-rev3
        - google,kakadu-rev3-sku22
  - const: google,kakadu
   ....

>
> ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
