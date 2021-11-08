Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859F3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 08:35:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46E8961265
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 08:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46E8961265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnpBVUZ91GswcpuRDml6FXnJYO8DNh3iPR5DLqrQwZM=; b=RNscViXlxSMJXt
	mRfX8RtnuRF17TdHXAeWSC3PIeeJZH8mhn0kvNT3AyxWVVsI+E1tagkCTYFC0qS6K/8/ogPz7EX2e
	qYhZ64oT0IaORjZVg/0U7U1WigbJ7r8oE9RoEZhQ9Hpn0Fnvr2OaipzY4FhicWs14oblhCjph0u0X
	o3HN8NhSac6vnESaH3byctsw4cQ1jdqmbbeZ7/4GnV8DLzlrFYGFd4jkleL47EzKXDQYoTqXjRXB5
	dQVAtKHu6Ixyc9fTq5E72/zN7HnAVhT0sagcYJV5VbnzX+qmJnfl0ab3wVqQI+Wzh0SEqB2QVHGul
	LMRFrUrIl7cmW86kqM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk07c-00Fkxr-Li; Mon, 08 Nov 2021 08:35:20 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk07a-00Fkwo-05
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 08:35:19 +0000
Received: by mail-ua1-x929.google.com with SMTP id t13so14600183uad.9
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 00:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jE0hvZm1CnV5/i3mmJblxPY/W6dO7LJVD1RwLqkPDw0=;
 b=dCMWyIa/+YrcZHKRoRnQM9gVOfF7IOsyGuDNr/bNc9jbZ5x+9Cn3MntVxnJ1b6/BOr
 ArtTLNIG8l3mgSqb2ilNELaA+tIgs0Arsa+GbaoTHARBrhnA0sAX2xtfXFjf6XNz386r
 31tzYHXj6Du+eYfXEczkpK/hzvHq+7q+1BKRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jE0hvZm1CnV5/i3mmJblxPY/W6dO7LJVD1RwLqkPDw0=;
 b=sRpdy8dhCjqWnLwEagpXsQMdMXpBPO++GHfH0JFDNa8KdHU/73justN71TYtBQwMNE
 y6wWltmgE8pE+OfGvC97YL6/3ucXR3YDqKAory8vj6Q4fcfiPrKPEm6qyFycX3zxOEfF
 E7H8vWX7hhSEzjp5fGno0OzSkp/hgXOedtH+qJ3VwgVcsdHIEYu6Hv5Zn30RF/4tchoj
 VzHwhZF5+Bq8ygm6/N3nPJE+s+YSCY4ICjj7N3EFjN7HQDc1NHa46tYGUwcg6TuMj287
 D4vZP11a52fv05vHwfJJHFzKmzcsNlFs0l8vcjBPP71lwEQzFC+cohAsEKOlEB827NK6
 A0Hg==
X-Gm-Message-State: AOAM531r5Pu2GYt9Magt6o+2pEFXt4myziFNzNtkxAwxDurOkhZSWUB9
 25xkMPLifwuVNDyE1C92zIZHwd9Sgs/4FlyAO86bCQ==
X-Google-Smtp-Source: ABdhPJyjxxZEpepvL9dwdhHLGv6N2wKGk64BSC4O3Ml6VAD6HeqbWhYrzOPXHigQcEzcsIn4fxguH8WhpTH9DZ9EX9M=
X-Received: by 2002:ab0:3ca0:: with SMTP id a32mr48206975uax.63.1636360517198; 
 Mon, 08 Nov 2021 00:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20211108072711.1628566-1-hsinyi@chromium.org>
 <20211108072711.1628566-7-hsinyi@chromium.org>
 <CAGXv+5GD7KU4i+P--6RShhMu32Rhf-g6SZF8SRDscc4XEG4QrQ@mail.gmail.com>
 <CAJMQK-iHHitbgxk5q2Z8dRt=o2XwX=WK5dbi+xcZ6Jk4MQzzig@mail.gmail.com>
In-Reply-To: <CAJMQK-iHHitbgxk5q2Z8dRt=o2XwX=WK5dbi+xcZ6Jk4MQzzig@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 8 Nov 2021 16:35:06 +0800
Message-ID: <CAGXv+5E-a6Rq-TsnUFrNkOBba0SmGg2_YHayGkd9xYPF0QRu_A@mail.gmail.com>
Subject: Re: [PATCH 7/7] dt-bindings: arm64: dts: mediatek: Add sku22 for
 mt8183 kakadu board
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_003518_086171_E10EB49F 
X-CRM114-Status: GOOD (  19.46  )
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

On Mon, Nov 8, 2021 at 4:28 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Mon, Nov 8, 2021 at 4:10 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > On Mon, Nov 8, 2021 at 3:29 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > Add sku22 which uses different audio codec than previous kakadu board.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > >  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > index 99e7f8e294cd03..da5f9ecc1a9b37 100644
> > > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > @@ -161,8 +161,11 @@ properties:
> > >            - const: mediatek,mt8183
> > >        - description: Google Kakadu (ASUS Chromebook Detachable CM3)
> > >          items:
> > > -          - const: google,kakadu-rev3
> > > -          - const: google,kakadu-rev2
> > > +          - enum:
> > > +              - google,kakadu-rev2
> > > +              - google,kakadu-rev2-sku22
> > > +              - google,kakadu-rev3
> > > +              - google,kakadu-rev3-sku22
> > >            - const: google,kakadu
> > >            - const: mediatek,mt8183
> >
> > This matches
> >
> >     "google,kakadu-rev[23](-sku22)?", "google,kakadu", "mediatek,mt8183",
> >
> > which isn't what you want. You want:
> >
> >     "google,kakadu-rev3", "google,kakadu-rev2", "google,kakadu",
> >     "mediatek,mt8183"
> >
> > or
> >
> >     "google,kakadu-rev3-sku22", "google,kakadu-rev2-sku22", "google,kakadu",
> >     "mediatek,mt8183"
> >
> > I think the following is closer, but I'm not sure if nesting "items" is valid.
> >
> > items:
> >   - oneOf:
> >     - items:
> >       - const: google,kakadu-rev3-sku22
> >       - const: google,kakadu-rev2-sku22
> >     - items:
> >       - const: google,kakadu-rev3
> >       - const: google,kakadu-rev2
> >   - const: google,kakadu
> >   - const: mediatek,mt8183
> >
> How about
>
> items:
>   - enum:
>         - google,kakadu-rev2
>         - google,kakadu-rev2-sku22
>   - enum:
>         - google,kakadu-rev3
>         - google,kakadu-rev3-sku22
>   - const: google,kakadu
>    ....

This would also match:

    "google,kakadu-rev2", "google,kakadu-rev3-sku22", ...
    "google,kakadu-rev2-sku22", "google,kakadu-rev3", ...

which is not correct. Also I believe rev3 should be in front of rev2?


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
