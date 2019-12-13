Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0ABEC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 02:35:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B255122527
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 02:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ekNSY91S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OQv/fxiQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B255122527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atr37b7f2HF7l5bmjNOsIfK2YcR+FQa4hWJv6ec70Q0=; b=ekNSY91SY7aPpu
	szE/H0YAp7GiDr8YpeY1srPMiMVIIe3t1/XhwMvrgly2UA5I02sEvcBxxuQacjotpD6o0Ynv5+mYF
	j0KwIKCzBKUrBkU8fX9XoFitJK/bzVcNyGHTjqDVXQLHNTCE//5ZYW4CfdxUqfLZrN4XHFaYuDaE7
	BB99avoK6OBlJY8JrNUEShjjrRgSbeg3aiRvRMLnN+Iyzy7MQjfi7mJxAmB/Mx4HCD/qju/eCRnqL
	Q3ZxdMrYrYUcE1wc8CFHDo6VTuWmLmYE6NgdTPlQKp2GxR05u7rwoPYJIDqdQfjiJwzoGbaoYiMmA
	EfKT8CJFJC60N4qHf2UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifanP-0004C7-5s; Fri, 13 Dec 2019 02:35:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifanM-0003YZ-8s; Fri, 13 Dec 2019 02:35:10 +0000
X-UUID: 47fa587e52fc447683185be32e24f6e0-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yhFMIzdACTJWG8hG2F5mM6oLY9KIsSirpu7dj4pmzWo=; 
 b=OQv/fxiQsfz4cvuh5JCsWQWp2JRkjT1QaFhtXzcgEfYxmmzin8CsOw79fhtWlphFO76eLW+07eYB+O8zKugRMO8JivvHFUMbzH2x63ELE60uieaRK2swT6thOuy/iTJDEyiI2n0pCYqHYmvGhNwdHcr1o+h6XYOghd9Suw+u0MY=;
X-UUID: 47fa587e52fc447683185be32e24f6e0-20191212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1796512916; Thu, 12 Dec 2019 18:35:01 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 18:35:16 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 10:34:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 10:34:51 +0800
Message-ID: <1576204492.26694.0.camel@mtksdaap41>
Subject: Re: [PATCH 1/2] Return from mtk_ovl_layer_config after
 mtk_ovl_layer_off
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Fri, 13 Dec 2019 10:34:52 +0800
In-Reply-To: <CAMavQKKOtYKVnCs3RCi3iYiX-2rLHoaDBTsEHyQmvWGoYj4M0g@mail.gmail.com>
References: <20191211154901.176256-1-markyacoub@google.com>
 <1576125900.29693.0.camel@mtksdaap41>
 <CAMavQKKOtYKVnCs3RCi3iYiX-2rLHoaDBTsEHyQmvWGoYj4M0g@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_183508_332736_CBB67145 
X-CRM114-Status: GOOD (  19.46  )
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

Hi, Sean:

On Thu, 2019-12-12 at 09:13 -0500, Sean Paul wrote:
> On Wed, Dec 11, 2019 at 11:45 PM CK Hu <ck.hu@mediatek.com> wrote:
> >
> > Hi, Mark:
> >
> > On Wed, 2019-12-11 at 10:49 -0500, Mark Yacoub wrote:
> > > drm/mediatek: return if plane pending state is disabled.
> > >
> > > If the plane pending state is disabled, call mtk_ovl_layer_off then
> > > return.
> > > This guarantees that that the state is valid for all operations when the
> > > pending state is enabled.
> >
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >
> 
> Thanks for reviewing these patches, CK. When you apply them to your
> tree, could you please fixup the subjects with the correct prefixes?

Thanks for your notice. I've already planed to do so.

Regards,
CK

> 
> Both patches are also
> 
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
> 
> Sean
> 
> > >
> > > Suggested-by: Sean Paul <seanpaul@chromium.org>
> > > To: CK Hu <ck.hu@mediatek.com>
> > > To: dri-devel@lists.freedesktop.org
> > > Cc: Daniele Castagna <dcastagna@chromium.org>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-mediatek@lists.infradead.org
> > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > > index 4a55bb6e2213..526b595eeff9 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > > @@ -260,8 +260,10 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
> > >       unsigned int src_size = (pending->height << 16) | pending->width;
> > >       unsigned int con;
> > >
> > > -     if (!pending->enable)
> > > +     if (!pending->enable) {
> > >               mtk_ovl_layer_off(comp, idx);
> > > +             return;
> > > +     }
> > >
> > >       con = ovl_fmt_convert(ovl, fmt);
> > >       if (idx != 0)
> > > @@ -283,8 +285,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
> > >       writel_relaxed(offset, comp->regs + DISP_REG_OVL_OFFSET(idx));
> > >       writel_relaxed(addr, comp->regs + DISP_REG_OVL_ADDR(ovl, idx));
> > >
> > > -     if (pending->enable)
> > > -             mtk_ovl_layer_on(comp, idx);
> > > +     mtk_ovl_layer_on(comp, idx);
> > >  }
> > >
> > >  static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
