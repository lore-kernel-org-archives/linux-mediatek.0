Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CC7C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 14:14:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3588F2173E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 14:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tmS/46sq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="ZEpemDip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3588F2173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rstKs+6hxGgRmEaOsV/pzfRA91Bzvfvkwjp2gxHS9ZY=; b=tmS/46sqgyalza
	rC5xnBr9m+NBWlthWa+3BnZjmziTzSuO7s4KYcvAvWYG5Ptg+MfPOD9qJo670Y0Hd7+crC2Nlav/C
	RuIm+YlFh8q6atF3vNGMjR89OdME2FcptJQbOllR+twxGHlu0NHCr3CkAl7htC290jKFGSMEsMdOB
	yL4VjDSUxBptAt5gFEsUEc5RAA0XImtaRODDX4t5w2hIIwTPTPD/bl1PUglz2MwcIBB6LS5mbxYHZ
	O4Hu/IAgI72JsK1CIIgasRR0wsK+hs82l94f39xHdwFavhBMLiWBvgv6fbLYrEKKSTd55q17oeYB9
	07L5J+fwL75ctprWi/Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifPEg-0004eT-TV; Thu, 12 Dec 2019 14:14:34 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifPEe-0004e1-3l
 for linux-mediatek@lists.infradead.org; Thu, 12 Dec 2019 14:14:33 +0000
Received: by mail-io1-xd41.google.com with SMTP id x1so2924302iop.7
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Dec 2019 06:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rYO0vtrh5ndy7gwZikU1oH7JLP2fHnRpDb1aMOPMlmg=;
 b=ZEpemDipLJFLngdu5DRHLK9+G9LT0ArmVRxkc8wGxIJnqkil2etBm4qSp+IMEctcSB
 OaorxX5ZkSpoAZAOyvdKfot1SClAuqc5sA1E179IY2tokIY8etLGQ1V5l4ZhuXNJJm/4
 x6IRDfrQ977wlrNNXnTBZrDV7TgagxbLLav5lYzy1dl2N/pjWuNkYxf1v27pDbQ6tyce
 n9zaJ+LgPuJ2H69BsPTLviGI7wdCrYaCVRSkFz8RPRGsGZZDxAixGKOt1caM6QhqC3G1
 QegodW0hqpFnlRN2EmipG2w/5jSb7CygatS9gavL1rORWt3K7EZGGYkkyNtIXvNQcVGF
 PDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rYO0vtrh5ndy7gwZikU1oH7JLP2fHnRpDb1aMOPMlmg=;
 b=tifmldMLIVBaqetAj4ozHqGcny+P1cski3MIvwXjzpiLBjWYtxZoFm2nhdJmMUj3Eb
 HphR+f56XNNAm5tx4J5po2ZRRJmxV768cQitwacZlA2OnsPiyB/O3QIzxFCqu3NMi9Gk
 cBkKBOPawtDtmVltJ4cOzumQkx3I+e8qVKBIpsjcPILGDZw2ygF8U/hptQKNukMK84WK
 3Kk4kEUZIaEKT3Ti+jgI7YMMUeFiQiDJE0svxM2PvLikjSH4On+v6sjQI1GdTCPn5vgD
 EkIimI11K1DzaN7pIroyDiOINjEiahQopScqOVI470xsJFQ0sbC8J154ntBZLDRM5Yc9
 iX+A==
X-Gm-Message-State: APjAAAU7rR0ncH4C/XA3RpmS9kEq8HQntmQdW5ofEVPJmHpj86CuLQ8F
 EeLubhbI7fwJ4mnB8ijoaWoS/i//X/784NlWAogT1g==
X-Google-Smtp-Source: APXvYqwXu9iyecqx40na9enDvYofmCWOETmlMVhDGZVixaQ93xIQYvWAz1tw1Gs5v2KKKODm4Ff9b32roWCcC4rYKpM=
X-Received: by 2002:a6b:bd06:: with SMTP id n6mr3199167iof.165.1576160070755; 
 Thu, 12 Dec 2019 06:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20191211154901.176256-1-markyacoub@google.com>
 <1576125900.29693.0.camel@mtksdaap41>
In-Reply-To: <1576125900.29693.0.camel@mtksdaap41>
From: Sean Paul <sean@poorly.run>
Date: Thu, 12 Dec 2019 09:13:55 -0500
Message-ID: <CAMavQKKOtYKVnCs3RCi3iYiX-2rLHoaDBTsEHyQmvWGoYj4M0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] Return from mtk_ovl_layer_config after
 mtk_ovl_layer_off
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_061432_218923_CE9AFA54 
X-CRM114-Status: GOOD (  18.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Daniele Castagna <dcastagna@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2019 at 11:45 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Mark:
>
> On Wed, 2019-12-11 at 10:49 -0500, Mark Yacoub wrote:
> > drm/mediatek: return if plane pending state is disabled.
> >
> > If the plane pending state is disabled, call mtk_ovl_layer_off then
> > return.
> > This guarantees that that the state is valid for all operations when the
> > pending state is enabled.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>

Thanks for reviewing these patches, CK. When you apply them to your
tree, could you please fixup the subjects with the correct prefixes?

Both patches are also

Reviewed-by: Sean Paul <seanpaul@chromium.org>

Sean

> >
> > Suggested-by: Sean Paul <seanpaul@chromium.org>
> > To: CK Hu <ck.hu@mediatek.com>
> > To: dri-devel@lists.freedesktop.org
> > Cc: Daniele Castagna <dcastagna@chromium.org>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > index 4a55bb6e2213..526b595eeff9 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -260,8 +260,10 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
> >       unsigned int src_size = (pending->height << 16) | pending->width;
> >       unsigned int con;
> >
> > -     if (!pending->enable)
> > +     if (!pending->enable) {
> >               mtk_ovl_layer_off(comp, idx);
> > +             return;
> > +     }
> >
> >       con = ovl_fmt_convert(ovl, fmt);
> >       if (idx != 0)
> > @@ -283,8 +285,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
> >       writel_relaxed(offset, comp->regs + DISP_REG_OVL_OFFSET(idx));
> >       writel_relaxed(addr, comp->regs + DISP_REG_OVL_ADDR(ovl, idx));
> >
> > -     if (pending->enable)
> > -             mtk_ovl_layer_on(comp, idx);
> > +     mtk_ovl_layer_on(comp, idx);
> >  }
> >
> >  static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
