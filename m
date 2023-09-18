Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F161C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11o+CB6BjJCUVYOY4jdnDbQOvIN+SebUJmbfTwlkwtE=; b=rXz321qJritR5dm0uJSs0J+QzK
	SBSsVYFXmbT2cQ7pQY11TyXMtYt8FelnKBjsZ+crNAuXJLw3gOZ6QcA0ecfJ7GK2AU/vqATeNyfJH
	HgQVSUQNtpgtRL1Tm+C7r9Ru9Ww18s3I0k8vtc+zjAcNcXWAjCco87UCtQ5ua0glua8EcOmoIcJ2B
	VHTa7YgRz8bHpAZ4C7hRNgMM/wbb9iWeQ1ZGodmvLqjeyWEp63oH/WEBKkEpwTPLbggI8QmonjoVI
	s6hLNyu+hoHOSVsJpBPcH8wOY5QiA7r7Cn7q1Fw5im1Rj37/77l7iDXbxWv1RCZ1WdpedyHEQre5E
	mQYlWIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBnZ-00FG9N-1F;
	Mon, 18 Sep 2023 10:48:13 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBnW-00FG7e-1i
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:48:11 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7927f241772so166065339f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695034088; x=1695638888; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11o+CB6BjJCUVYOY4jdnDbQOvIN+SebUJmbfTwlkwtE=;
        b=jxWGz3toSkd+qnYg6ie54Jm1hzOBQGOg9jK1kcELxAiZFSpjQIYcu6DW8+DzHCY/w5
         Wdkv88i+18QZw3BJ2OOHLd5Dak1Jx/q55ia4xQPGCH00Rj3o3iqCcqKTnzX6DFoMOPWV
         vgGZPnGGtGCLYKo27yXeATfTioq4We3duLmQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695034088; x=1695638888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11o+CB6BjJCUVYOY4jdnDbQOvIN+SebUJmbfTwlkwtE=;
        b=o8t+DtuBCmfejzvPjxgIjg6Y6WsKM52ASXPD7M4eIBJY48FPBT0geXkj+9uiV16w1N
         MgpHi91M9A9pySFErm4Tdo/vXsakKQFDldu5+QOgTQ6LBry6IYL28ZErT12Q0x9Qefdo
         g2etYF/vwF/HAZmHk0JUtvT81qHlGjnl3lKCj7vLt0kf55m+AHxlZaTPEf4ykfQLaouz
         X0AHUnvOSD253X6RCcGvfqdze3P+BxDErefqQBvwmZiRKFuMwekaywcGN9aU0OnaoQqO
         Jc86PLtfq9HleTM8DmCiBzcrs6zBkVibt1KvLqLU3UXzf8Uub3fL3HPyRnKFrHvPt7eM
         b84A==
X-Gm-Message-State: AOJu0Yw1hPvjjTS0W9xX95NOUbg2SaJeA1nJMq57FYgw+4qU2iIM6Wyb
	+Ypnyqk9x+wZoSoOXV/ecy5UF65XrPoQO8AtbnePUw==
X-Google-Smtp-Source: AGHT+IHMVsr/rg0kskjAi7urCoWH9GzJI/tk/UUoEsw/rYMKpKMQZCdRFpyGCyij3gjb1aY8gbw1CA==
X-Received: by 2002:a6b:f30b:0:b0:790:fa58:69d2 with SMTP id m11-20020a6bf30b000000b00790fa5869d2mr9828285ioh.20.1695034087965;
        Mon, 18 Sep 2023 03:48:07 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id n11-20020a056602220b00b0079187c8524asm2850466ion.3.2023.09.18.03.48.06
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 03:48:06 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7983b202929so165479939f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 03:48:06 -0700 (PDT)
X-Received: by 2002:a5e:9804:0:b0:780:ce72:ac55 with SMTP id
 s4-20020a5e9804000000b00780ce72ac55mr10973227ioj.10.1695034085996; Mon, 18
 Sep 2023 03:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com> <5a4a0d12-d16a-0836-f6c5-6e6c2f3a9097@collabora.com>
In-Reply-To: <5a4a0d12-d16a-0836-f6c5-6e6c2f3a9097@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 18 Sep 2023 18:47:28 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng8033sSGNFYr1vYfYfHbdG0Dk_0xai08=uomGO-EN66A@mail.gmail.com>
Message-ID: <CAC=S1ng8033sSGNFYr1vYfYfHbdG0Dk_0xai08=uomGO-EN66A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in atomic_begin
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Eugen Hristev <eugen.hristev@collabora.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_034810_567151_F49B9F88 
X-CRM114-Status: GOOD (  24.82  )
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

Hi Angelo,

On Wed, Sep 13, 2023 at 4:35=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 22/08/23 15:26, Jason-JH.Lin ha scritto:
> > Add spinlock protection to avoid race condition on vblank event
> > between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().
> >
>
> Hello Jason,
>
> Can you please provide more information about this race condition?
> (check below)
>
> > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8=
173.")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/=
mediatek/mtk_drm_crtc.c
> > index d40142842f85..128a672fe3c9 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -746,6 +746,9 @@ static void mtk_drm_crtc_atomic_begin(struct drm_cr=
tc *crtc,
> >                                                                        =
 crtc);
> >       struct mtk_crtc_state *mtk_crtc_state =3D to_mtk_crtc_state(crtc_=
state);
> >       struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&crtc->dev->event_lock, flags);
> >
> >       if (mtk_crtc->event && mtk_crtc_state->base.event)
> >               DRM_ERROR("new event while there is still a pending event=
\n");
> > @@ -756,6 +759,8 @@ static void mtk_drm_crtc_atomic_begin(struct drm_cr=
tc *crtc,
>
> ...because my suspect is that what creates the race condition in this fun=
ction is
> the unlocked *assignment* to mtk_crtc->event, not the rest.
>
> If I'm right, you don't need to unconditionally spinlock at the beginning=
 of this
> function hence ever-so-slightly improving performance compared to this ve=
rsion.
>
> Can you please try this one and check if this *also* solves the issue?
>
>         if (mtk_crtc_state->base.event) {
>                 mtk_crtc_state->base.event->pipe =3D drm_crtc_index(crtc)=
;
>                 WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
>
>                 spin_lock_irqsave(&crtc->dev->event_lock, flags);
>                 mtk_crtc->event =3D mtk_crtc_state->base.event;
>                 spin_lock_irqrestore(&crtc->dev->event_lock, flags);
>
>                 mtk_crtc_state->base.event =3D NULL;
>         }
>
> P.S.: I'd try that myself, but I can't seem to reproduce the issue.

I'm still able to reproduce it so I gave it a try, and this approach
also seems to fix the issue.  :)
FWIW, the way I reproduce that is to toggle the night light mode on
and off repeatedly through the UI panel while playing YouTube videos
on my device.

Jason, can you post a new version with Angelo's suggestion?

Regards,
Fei

>
> Regards,
> Angelo
>

