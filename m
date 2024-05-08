Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F0EC04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 21:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buSNW1rXJ5tp0mHF2b1c12zxGyNSJnH+cWUgnRIBSqA=; b=C3MSEAKIbJytCIYJ8ftXy1Y+K3
	GCDwTl5n09nX+RosjIeDsn020XxgP/X5d+RXnS5dgbRhuQ67R5OSkGjHMdNoLffuTPFLi2jAACdPR
	jaGphV3c6sFKT0/gRR5UV0dirbUUDiEQTY8JVQ1bbFvJHeI2z6eT35ap1kgcQH5sfxGFkYDopuI2G
	0unKZFIF9Iu0BXpLHFueJns9h1IgWvbU3Im3+EzRzJE2VsSKZn4rGsy0oGhylWGcYTKayqpTOgVPA
	voJfydGDElFPk8rBOg1vteN1bC6SeSNuuKvCzUsIizx5gjLqbvWK44DxbFP+aS+GaMHNYveR/LOwi
	ohOtiwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4od2-0000000Gzok-23T4;
	Wed, 08 May 2024 21:15:08 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ocz-0000000Gzn7-0J4k
	for linux-mediatek@lists.infradead.org;
	Wed, 08 May 2024 21:15:06 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-792b94301eeso11455285a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 May 2024 14:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715202901; x=1715807701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buSNW1rXJ5tp0mHF2b1c12zxGyNSJnH+cWUgnRIBSqA=;
        b=Wqw8c4S6ztSZtZWWJImaKeCQpexkZ7eFmlPjJ0Q2MdOoD9Q9/lbCdZisjQomu1FpXg
         GNcUj89T8kxER19xEDD0wLAYERAR1eOEBCVvsqVZX8KLWMZLnRbQVsiY4EaFHKH/5Uyq
         4xwxibBkwN4cAxbRdwoBHC1aNcSVeTpSo9seo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715202901; x=1715807701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buSNW1rXJ5tp0mHF2b1c12zxGyNSJnH+cWUgnRIBSqA=;
        b=E4HVPvDmYW3cbabWyUtMLppG3clSZZIuiGdeHC+mR3OHzyC0Ijlhqg3kMyIGGu2GMN
         fnj+LbZL79/3HyC61ye2Q/E2kN+XMbp0Cn/B6x1jpFGBKqUcbS3n9Bv7EIzHTkiniiSh
         PzDQzGwUvLi03U2GdINvr8Heti8r+cpHZydiSPkxIbndxxiBzReLYgPzpISOX08EcEC6
         lom28QnrxnoK1UIPi2XDTNJNXHdbLPCJzL3hH44xn6cSIsKLzMtWaiDM13zsL5UvEPcs
         ssaeQOMvDr5btlM3e+nyAPz5qdcCPLHTiu5VLv5EVG26+iAnydh71P8bPa1Hk/AsCg7e
         5/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWN8+BRoLy6zEYh58u1nASNhg8OHZSqrbxz44DOiqAl17lNH+zn0rhLA61OEjw3e/eKH+FAPm1pte5JbHa3JxTNahJfVxaGuZ912AKox2+rcURo
X-Gm-Message-State: AOJu0YwQbriVkvwoR5DibftIGM8g8VVrbu8qehfKdS5ru6PfseNURSVt
	IzXqDXD3NWII0yTFLQDDfLqy9CSx8J8vQCt/ZKUmWX21OYvk6+nBhfDEtUcTrxyr9EsgJTxdxbE
	=
X-Google-Smtp-Source: AGHT+IGXrtFIVUrIYMutRDWOd1ho3q7rqrFSvJMaNzDi1JBs6XV8+K2LQ9W9slkSm9DK6OIXXiS2Aw==
X-Received: by 2002:a05:6214:e69:b0:6a0:c162:2944 with SMTP id 6a1803df08f44-6a15153bdabmr38499706d6.29.1715202900627;
        Wed, 08 May 2024 14:15:00 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id pv7-20020ad45487000000b006a0f4d06452sm5903774qvb.88.2024.05.08.14.15.00
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 14:15:00 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-439b1c72676so47181cf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 May 2024 14:15:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIA2GJ247Pv7C+bf78S1MXb6P5vXzX/yBxKkgKTQ/9nTW431AZkux6uCdAbmgqYA5nzHutfjcnH01FbggFaKjqgRVJdLh5pp+nuycTd/JnmfwD
X-Received: by 2002:a05:622a:1c0d:b0:43a:c1cd:2f4c with SMTP id
 d75a77b69052e-43df44dc04cmr169931cf.5.1715202879034; Wed, 08 May 2024
 14:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org> <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com>
In-Reply-To: <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 May 2024 14:14:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WoYm43SzrdrSZ1Np58iQ4nMwF0u6uamOAnZc4pqmBpsg@mail.gmail.com>
Message-ID: <CAD=FV=WoYm43SzrdrSZ1Np58iQ4nMwF0u6uamOAnZc4pqmBpsg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Yuran Pereira <yuran.pereira@hotmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
	Purism Kernel Team <kernel@puri.sm>, Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_141505_126847_7977F7A5 
X-CRM114-Status: GOOD (  42.43  )
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

Hi,

On Sun, May 5, 2024 at 11:52=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Fri, May 3, 2024 at 11:36=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
>
> > As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> > prepared/enabled in drm_panel"), we want to remove needless code from
> > panel drivers that was storing and double-checking the
> > prepared/enabled state. Even if someone was relying on the
> > double-check before, that double-check is now in the core and not
> > needed in individual drivers.
> >
> > This series attempts to do just that. While the original grep, AKA:
> >   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
> >   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> > ...still produces a few hits after my series, they are _mostly_ all
> > gone. The ones that are left are less trivial to fix.
> >
> > One of the main reasons that many panels probably needed to store and
> > double-check their prepared/enabled appears to have been to handle
> > shutdown and/or remove. Panels drivers often wanted to force the power
> > off for panels in these cases and this was a good reason for the
> > double-check.
> >
> > In response to my V1 series [1] we had much discussion of what to
> > do. The conclusion was that as long as DRM modeset drivers properly
> > called drm_atomic_helper_shutdown() that we should be able to remove
> > the explicit shutdown/remove handling in the panel drivers. Most of
> > the patches to improve DRM modeset drivers [2] [3] [4] have now
> > landed.
> >
> > In contrast to my V1 series, I broke the V2 series up a lot
> > more. Since a few of the panel drivers in V1 already landed, we had
> > fewer total drivers and so we could devote a patch to each panel.
> > Also, since we were now relying on DRM modeset drivers I felt like we
> > should split the patches for each panel into two: one that's
> > definitely safe and one that could be reverted if we found a
> > problematic DRM modeset driver that we couldn't fix.
> >
> > Sorry for the large number of patches. I've set things to mostly just
> > CC people on the cover letter and the patches that are relevant to
> > them. I've tried to CC people on the whole series that have shown
> > interest in this TODO item.
> >
> > As patches in this series are reviewed and/or tested they could be
> > landed. There's really no ordering requirement for the series unless
> > patches touch the same driver.
> >
> > NOTE: this touches _a lot_ of drivers, is repetitive, and is not
> > really possible to generate automatically. That means it's entirely
> > possible that my eyes glazed over and I did something wrong. Please
> > double-check me and don't assume that I got everything perfect, though
> > I did my best. I have at least confirmed that "allmodconfig" for arm64
> > doesn't fall on its face with this series. I haven't done a ton of
> > other testing.
> >
> > [1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46=
d6b234f89613b5cec0f14@changeid
> > [2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium=
.org
> > [3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium=
.org
> > [4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromiu=
m.org
>
> This is the right thing to do, thanks for looking into this!
>
> As for the behaviour of .remove() I doubt whether in many cases
> the original driver authors have even tested this themselves.

Yeah, I'd tend to agree.


> I would say we should just apply the series as soon as it's non-RFC

It's not actually RFC now, but "RFT" (request for testing). I don't
_think_ there's any need to send a version without the RFT tag before
landing unless someone really feels strongly about it.


> after the next merge window

With drm-misc there's not really any specific reason to wait for the
merge window to open/close as we can land in drm-misc-next at any time
regardless of the merge window. drm-misc-next will simply stop feeding
linuxnext for a while.

That all being said, I'm happy to delay landing this until after the
next -rc1 comes out if people would prefer that. If I don't hear
anything, I guess I'll just wait until -rc1 before landing any of
these.


> and see what happens. I doubt it
> will cause much trouble.

I can land the whole series if that's what everyone agrees on. As I
mentioned above, I'm at least slightly worried that I did something
stupid _somewhere_ in this series since no automation was possible and
with repetitive tasks like this it's super easy to flub something up.
It's _probably_ fine, but I guess I still have the worry in the back
of my mind.

If folks think I should just apply the whole series then I'm happy to
do that. If folks think I should just land parts of the series as they
are reviewed/tested I can do that as well. Let me know. If I don't
hear anything I'd tend to just land patches that are reviewed/tested.
Then after a month or so (hopefully) I'd send out a v2 with anything
left.


> The series:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

-Doug

