Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CDBC5DF63
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 14:43:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A8C217F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 14:43:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lA4sp6br";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="DJ7GRoQw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A8C217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsszsK/Ql6wJ/dNGzfGe8zQlhtFpwAAWDHZvfwlifgM=; b=lA4sp6brD1ECZX
	72Q1mFPjhHGQM5F2lqTTR3tDWURqwKs8WmAvv7Y+beHtUD8kKaTlQV+4ESnPFKRtptcYZW1mT2huz
	wGjSWwjDa4TjiHP/AiLXeF6Rnb4x2+W4gCwJVc8y+tSRY91jWGC9b0CO4wRtFGfYgjDBudr8DNbRz
	2y2zyGWHnDw5VB9ICwrtnCWgs6hNNm4Lr1f2uCYdRxRHxoyOuFG0opkrYE1DzAxnXnl3mP+Ea8GAn
	7/tBYsJB4rVKvkjbwfAOPh3OM+jOKaEqJ3nLJspoVmD8joTJtBtS1ybzm/d+RnduJijw/K2BayukR
	T/f1Dp71Sz2sIjOeDu7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSMWc-0007Sj-19; Wed, 06 Nov 2019 14:43:10 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSMWZ-0007Rq-Ls
 for linux-mediatek@lists.infradead.org; Wed, 06 Nov 2019 14:43:09 +0000
Received: by mail-il1-x141.google.com with SMTP id z12so10025749ilp.2
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2019 06:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UgbtTe5dfKDfjSAPPMs/EABl+5bwJ2fJ35WEQgISza0=;
 b=DJ7GRoQwtoJVvxh25wjbOVxrGXKnOfZUfCfrccd998QNYDbeEbmI9jR+5Yf1CUA4MI
 U91L4xMXytJAtCx+r6/SK7Wc7mC5bpryeamAr+BD28yJ/ss41ilPO0FBhsBdc8NNwHTO
 pI6ajBoiiX1590yszT2CLjXcxRFL1BcAEK09Wr/xHZphiCaetD8mNRraZB0dInanLbeJ
 7EzcAgk3/SvyIkRdH+o0e93JbZzUC0KgRFYNXsQmNZUC3dr85fE5jSgX+rrKafPlo2qG
 beuQ/XbnZb8Rmo2s3OpSGsIBVGMvdCnCJgt7toEGxv518Hqq+sC7Avs9oZ3aZpaRDC/I
 rzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UgbtTe5dfKDfjSAPPMs/EABl+5bwJ2fJ35WEQgISza0=;
 b=W/+Hdt5odi9oCr4Ju2Yu9kygws/SHjxIAy7GdNwCLYxnptOh/Y+2i64XfRHf2ZTOuj
 MWaXU75rIt4e9hMilFEqjPyArEZFyr1YSQQd2B328cjh4UzQJy7KlswclWQIfJZWogt0
 COvOtI4IsjkwB1SYNR60TSSsDnHWZYNm3VEobudXWyBnahK7E5vYbY7hcnCa1HjKElg/
 NX5GIT8gkB5izp1T9Ei4E9W4pNw3RMvxDbtdQmqea4YrtYdRHTUFVNuA0h+3045S+E6Q
 3MbSM7bzTBvuodPyMV2fPw2FBCsYmf3LZ9RiPIEihSXxxz25vJDWV/f99KaObqU/LFXl
 zz2g==
X-Gm-Message-State: APjAAAXZfkEQFut3MsFXhbBBR1TVf7jplxLz0NBMTgZtGxU9zafsAjzA
 hxB7WwVjiPQDArKOr8yfOJG7Pvsu4ZbH89JBHwulmA==
X-Google-Smtp-Source: APXvYqxrvorcUxqto/zT7qnrJ74yhghH4wbgzwgyazlJSpgoqiDGrdIhp+fcXb3osgPdsezRxHND7qjelFPlg9cKvkY=
X-Received: by 2002:a92:c152:: with SMTP id b18mr3052785ilh.71.1573051386198; 
 Wed, 06 Nov 2019 06:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20191105211034.123937-1-sean@poorly.run>
 <20191105211034.123937-8-sean@poorly.run>
 <1573031243.15410.2.camel@mtksdaap41>
In-Reply-To: <1573031243.15410.2.camel@mtksdaap41>
From: Sean Paul <sean@poorly.run>
Date: Wed, 6 Nov 2019 09:42:30 -0500
Message-ID: <CAMavQKJ+_+fytidjp4WvMwSrytJO_aU+57a54h1ACAqPHp3e7A@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/mediatek: Support 180 degree rotation
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_064307_779302_CBD753CC 
X-CRM114-Status: GOOD (  18.73  )
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
Cc: Daniele Castagna <dcastagna@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Fritz Koenig <frkoenig@chromium.org>, Miguel Casas <mcasas@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 6, 2019 at 4:07 AM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Sean:
>
> On Tue, 2019-11-05 at 16:10 -0500, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Now that we support both reflections, we can expose 180 degree rotation
> > and rely on the simplify routine to convert that into REFLECT_X |
> > REFLECT_Y
> >
>
> Patch 1 ~ 6 of this series looks good to me.
> For this one, I think the rotation check in mtk_ovl_layer_check() should
> be modified.
>

Thanks for the quick reviews, CK!

In what way would you like the check to be modified? I'm guessing
you're asking that I add it to the bitmask passed to the
simplify_rotation function?

If that's the case, we don't actually want to modify the
simplify_rotation bitmask since that bitmask is supposed to be only
the rotations that the hardware can achieve. So if you pass ROTATE_180
into simplify_rotation, it will return REFLECT_X | REFLECT_Y, which is
what we want. Does that make sense, or am I missing something?

Thanks,

Sean

> Regards,
> CK
>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > index f4c4d3fedc5f..4a55bb6e2213 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -143,8 +143,8 @@ static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
> >
> >  static unsigned int mtk_ovl_supported_rotations(struct mtk_ddp_comp *comp)
> >  {
> > -     return DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y |
> > -            DRM_MODE_REFLECT_X;
> > +     return DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
> > +            DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
> >  }
> >
> >  static int mtk_ovl_layer_check(struct mtk_ddp_comp *comp, unsigned int idx,
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
