Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733B0C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 09:47:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A8C60EC0
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 09:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47A8C60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhWad8Xg6WlvlHtlirjUb9SFdMjiJRWkeNWWchWYdvM=; b=4neEtq28SrjqMT
	nEghsnM7kGaGPscxwhdlGF1R7W8aMfEbwRq5wOVlABOUZcoS60v3xWNM2tfEpFCQnKXsV7srt9YyH
	B91igAPWf0O339Nw468WFnJdC/EL6YJWLH8zMs+lItsuYQcP6P6H43gbckRwBzUDU8NRPWZiNUIKg
	erQj54xXMcrnyGh6ylSmmmu5SrZO8TQ74uoQoLowsXS7qiyEGGszOlfworNA3Hh4xqdvaPZ4iNXir
	VyiBWxwCwYa3z4h9XUsGWFpwpGKs7dEXvFqIwvDAiMt+OnW8Sdd1W0OShddea2RLboIf6+jK/ypYc
	nRgFrY3DK3+VnC8fQbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6rmA-004AMZ-1g; Fri, 23 Jul 2021 09:47:26 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6rjx-0049NB-9c; Fri, 23 Jul 2021 09:45:10 +0000
Received: by mail-oi1-x22d.google.com with SMTP id q6so1212638oiw.7;
 Fri, 23 Jul 2021 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ITlUIkGJZ3EJcyJveAVPnUvECk1290YkodSeO4Z4UU=;
 b=uBpSfrknBJUVSdjmW6KG2R9vMs/JUY0uM6lYTVL+oe6b/A6Xnxo36O6xiETTPzs3ph
 u/cv+oUz4NuIjQiTPUnNay9YHsXK8X7Ahj3I/+QSZDrOE/K6X+otgwvyaoE03U6MxKOr
 PGaSfkzBzd+KRZNUVBbzIaFzY6fTxF9Qna+Kk5fTzKNIzcZpaXoN+ELfVKSO8kMC+c2Z
 RZsQ/hHfI8rLR4nBPDTxCab58snIi3/07i7IDwL5Lor55S2f5af/HGDCM/cNojd7iO/0
 854gA1qnHv3HrICTREICTlDzA1284z6IZANhu92LGv/I1WpY8n7hLNQvhd6OeY+MvpLn
 +uHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ITlUIkGJZ3EJcyJveAVPnUvECk1290YkodSeO4Z4UU=;
 b=f2bIk3s8MeB46Tgrt3JYBFxOoLtj078MmyT3EZpzwryELMvMnFvp001fpPQclVphDH
 DfjMYTVaMs+Klwqf9Ovfjr22akmihqQnMfAVrX6ItXtcvdS+fxN1vpvgVb8aSV2Gzx47
 6081h4j1m8aKVF7+JguLBabGxu3SHsDP3xmQDkTrhEtpWja3huPCIuPXJazx+D4fGhRY
 i/RUBObZiFzVlh+GYMFw1GvhiP4tN114rHg7s0VjZ2fzX9Uy7hUZiUQ1S8lmB5DIAt0j
 GM4phKB3+jHxrrrz9nMIfFUyIY9q41m4ny6+Pgty0FxE7GO6ienumhJSVqp+/ow786Je
 mDUA==
X-Gm-Message-State: AOAM530GRZhnFNpyY9uUMjWUIfU5uKWKZuw6id8+kspe7cKAySDHri2x
 52mLBwnNy0jxKu1VJgy7vE0qUQDJ+Y/AKZgPiWc=
X-Google-Smtp-Source: ABdhPJwLFlNpJvmb+cvMuHIQOIUTXTVWE1efhwIfBt0eE69929SsJekntO5P1eJv7ZPFnY+dc1rsukjlpTjQA0VjmkQ=
X-Received: by 2002:aca:38c3:: with SMTP id f186mr8091241oia.39.1627033507873; 
 Fri, 23 Jul 2021 02:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210519161847.3747352-1-fparent@baylibre.com>
 <20210521014815.GA2476751@robh.at.kernel.org>
 <CAL_Jsq+HWxQwFuKM==g-PBROxGN_xoWCc060U0pDpsDdfWJWPg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+HWxQwFuKM==g-PBROxGN_xoWCc060U0pDpsDdfWJWPg@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 23 Jul 2021 11:44:56 +0200
Message-ID: <CAFqH_50rKvYZGeRMoaqtYZ6Hdbm6tjLTHB3N9JGsFai1ad0Dzg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: mmsys: convert to YAML
 format
To: Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_024509_412161_B9015096 
X-CRM114-Status: GOOD (  17.73  )
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

Hi Rob,

Missatge de Rob Herring <robh+dt@kernel.org> del dia dv., 21 de maig
2021 a les 3:51:
>
> On Thu, May 20, 2021 at 8:48 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, 19 May 2021 18:18:44 +0200, Fabien Parent wrote:
> > > Convert the mmsys bindings to the YAML format.
> > >
> > > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > > ---
> > >  .../bindings/arm/mediatek/mediatek,mmsys.txt  | 31 ----------
> > >  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 57 +++++++++++++++++++
> > >  2 files changed, 57 insertions(+), 31 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> > >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> > >
> >
> > Applied, thanks!
>
> Actually, should go with patch 3. So dropped and:
>

I think that this patch can be applied alone through your tree, patch
2 and 3 can be applied later for the maintainers when they are fine.
There are other patches in the ML that depend on having this meged, so
it would be really nice to have it. Although it has already your
ack/review if it help I also took a look and I know the hardware so:

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
  Enric

> Reviewed-by: Rob Herring <robh@kernel.org>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
