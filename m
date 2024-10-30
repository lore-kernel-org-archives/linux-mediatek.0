Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8017FD7497F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZnoNZrdZV2/crQbUH4IG8um4cL2sl75Grz7lZVdnH8=; b=GBTl4iP30zrezjuf6PjYhru0cq
	YDIAovbMlba69E89Rs/CB5ul9C4h6Res9xFDrKZk1vth5D+/AK5I5tMjGZsE5G2nGgVTIYEQ0l7IY
	t8xzQbNLRggtBeF6l4nuwg1xWnt73uu2xJnhQInfA5fajg6AjMNDVTV537tD/tGGwUxNczWkfoOP4
	pJM2OSBd0aOJH7v0XvdaTlkhr0im2HoTtvtuBpRIO3HHSN7dpU/+LfapUTiype73HFgDf8nr/CRj9
	rslMAx9CHepGhNvMuNDjXp9bB0we2xxibvBoMwf/NnWWAMIV4OgXnLJiPgJ77f8Z1bxH2pu2TdAfH
	YSgFrrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t64RO-0000000HKnX-221Q;
	Wed, 30 Oct 2024 08:52:34 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t64RL-0000000HKmp-07t4
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Oct 2024 08:52:32 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539eb97f26aso6627381e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Oct 2024 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730278349; x=1730883149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZnoNZrdZV2/crQbUH4IG8um4cL2sl75Grz7lZVdnH8=;
        b=W81e6TunMPt9P8EBJUhYW/pYti2LQBFU2xKgWTjtJ6xED3qGiouYiRaJ6TFdhioShg
         j4TiIcsNkuaF0BcERhnphxNF8Hx3vWUOdsUlXlkd5kMQhO+jM1b8Z59E5Z4Gwfx6gKkh
         nJPimqwjJMtPEcJnxJLz5K186FizlKY8kMlqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730278349; x=1730883149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZnoNZrdZV2/crQbUH4IG8um4cL2sl75Grz7lZVdnH8=;
        b=ksDYL6mN10ZSPd+JWb2BdSlSRjJoUT9Rq5YAQJA5TqcXSbRvFPBm82OVrc8UEqD5Zo
         yM+ZCKGbTtuCi1b2NkiHM426RRf92Dq0fd5PCUQRizkxq2Q95R0dTKoe48Zj2wEcFCFp
         ENwzCw1+9uy2kj4nOTTd+pJbFswkBVi6n+0vqseVtHt/nrmEmTUsCp15oqM8n7JdIfyi
         TtV6jq8R5p0wY5MGL4PHejHN2LnmBKL1/6lnKSma4mdWy2JrVQ8eg+p2kSAQQmiCP/XU
         v9lP0vw29/XIBuzHwDF+iB+zOG1yOcU0Jwppk3c6hnaNsUP4A6Fnb4v72/Mz2ZozQAol
         98Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWSCWhqPMmLYk+nf/mqrum+gSEyNiHeMNYxYiCnfb+5x6x6ZE5StwjFzQDbahPw4XQ5G0a8cGpl5KwiWKsfxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx6OxSVabGz8E2ikk3QWo70qeKb7yJ/TKXPd8CM+KMkJNg4aCt
	9sITIacs+aUL+RsNzXqIYiv3RsmyRrNkqbmUvGC4/Y3oid789ZI219co+ExvnM9ICDRShgcGYa3
	mn7ikMIjWJr2mtBgGGT3dmi3cbK62ZgJEs2Ii
X-Google-Smtp-Source: AGHT+IFN+5L8Zy7+Hnrc96LK5WeSb49IZ59brkNk4NXUJ6HqftStgtUU7GRQnbHmisIT1dsrtBDF17VQ5Tz/yjajEuE=
X-Received: by 2002:a05:6512:350e:b0:53c:74dc:2252 with SMTP id
 2adb3069b0e04-53c74dc2378mr320758e87.49.1730278349113; Wed, 30 Oct 2024
 01:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241029111309.737263-1-wenst@chromium.org> <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
 <20241030-hot-peridot-falcon-57bdbb@houat> <0cfba5bdc9443fb4b9719c47ee93c2a467cc66bd.camel@mediatek.com>
In-Reply-To: <0cfba5bdc9443fb4b9719c47ee93c2a467cc66bd.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Oct 2024 16:52:17 +0800
Message-ID: <CAGXv+5EWyGGKYo+NNQ3Ykd3QUUO2cOManSnhZQaVhhCnupNx=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mripard@kernel.org" <mripard@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, 
	"ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_015231_116594_59111DDD 
X-CRM114-Status: GOOD (  22.41  )
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

On Wed, Oct 30, 2024 at 4:48=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89)=
 <ck.hu@mediatek.com> wrote:
>
> On Wed, 2024-10-30 at 09:25 +0100, mripard@kernel.org wrote:
> > On Wed, Oct 30, 2024 at 03:30:34AM +0000, CK Hu (=E8=83=A1=E4=BF=8A=E5=
=85=89) wrote:
> > > Hi, Chen-yu:
> > >
> > > On Tue, 2024-10-29 at 19:13 +0800, Chen-Yu Tsai wrote:
> > > > External email : Please do not click links or open attachments unti=
l you have verified the sender or the content.
> > > >
> > > >
> > > > The recent attempt to make the MediaTek DRM driver build for non-AR=
M
> > > > compile tests made the driver unbuildable for arm64 platforms. Sinc=
e
> > > > this is used on both ARM and arm64 platforms, just drop the depende=
ncy
> > > > on ARM.
> > >
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > >
> > > I find this days ago, but I don't know there is someone who apply it.
> > > Let this patch go through drm-misc tree which already has the bug pat=
ch.
> >
> > If you are ok with this patch, why didn't you apply it yourself?
> >
> > I think that's very much the expectation, so it's probably took a while=
 to merge.
>
> That's ok for me to apply it if drm-misc has no plan to apply it.

I'm confused. The culprit patch is already in drm-misc. So this one has
to go in drm-misc as well.

I can try to apply it to drm-misc myself, or have a colleague assist with
that. I'll let it sit for another day in case anyone has something to say
about it.


ChenYu

