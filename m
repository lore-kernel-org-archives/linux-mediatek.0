Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38051C83F2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Aug 2024 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5+OhPgFMQPHXgPA+PEaRl3P/bg2oC02oe1j1Q1GZNE=; b=DBbnIb4NFqzA5PbS0a910Jk9Ym
	yaxq1ox9KvgLSurcGAg58G/Zr79C6ryQq+PfgzlTaI9/ex/9fLZ73JXgH+YxXyvh/7+ITP3Ar16gU
	4qqV3LlrFcBQEegoqe/gGzDp2g3J20orHjhsFsBPXW/NkIUoptFIEs1u/qEX+d3V7YKzlL66rMxDG
	LL198ZuF5r9YEBB+2Tgp5X9/4Br4pqS3FT5W925DCM25Y4dvl6nx04kjxaYLK8v6bB+qz7WyI0Ctm
	0YIzjfHnLLSIUQyDKXbPeTOB7YtEP/QF5VFP4PABIqtQAAbHYxfEJtagDBNzkT5IOeIAfTx58ZvBJ
	0sDrqkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjgay-00000002Vin-3Ivy;
	Thu, 29 Aug 2024 14:57:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjgak-00000002VbQ-0Dzd;
	Thu, 29 Aug 2024 14:57:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0A501AE4CF6;
	Thu, 29 Aug 2024 14:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED67C4CECB;
	Thu, 29 Aug 2024 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943459;
	bh=77GZ3QzaWVWSIhtGl6NhqkeP6FIDiOftlrdOL+sQSfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IXCxsIijxUX/8BlxE4wUwVpkDDZPGZE9b2TUSGTOSni2Hu78alR/djQiMtZnQVhB0
	 8wFS0l6/gylyIqYoqPTJCyjybjCq0aq72vjtu1XRHAkF+oK4wbI4CAdN2yaz2HPSbI
	 5AF4xUklzO5vLWZRZuVQ5qb5HwJNH4i/1tUWQr+xVNdIR14gZ3HJ15e2+39VF1hKI6
	 lyZG5fdUN6TftBMjrh+wrKOFRy6Lp8XJdduhr5D2EArIoi9AUUyolhhzJB/5Ip5vfJ
	 5dalhgT/FghRSBJgQZKaDBMd48gki3+17ofaGHTkMk+GoPRejpGiGYMtyhRJfuWBN9
	 roZkJFd3nU04Q==
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7cd9e634ea9so487290a12.0;
        Thu, 29 Aug 2024 07:57:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhyoUCt2T85O/l3IR/GiqZ5UCTNM730rhUdOoJTrQyN+Qnmw24r7Kn0Bw1NrMA3a5rAn4uFPNzKAX5roGgezk=@lists.infradead.org, AJvYcCW8sNsaAA/CjpXjIRYZ76+xZy3QSrpZAkVKJLXnofFImoZ6btU+D10kB0oH5CWErYoVSDyJIpCrDbQs7vHKK6VW@lists.infradead.org
X-Gm-Message-State: AOJu0YwA3DNKa19QovX+/1yduli2xWu+QYydNdcJk8xw+lA7DUpoUgbf
	XWQDHlC0ZFOKi49LolASSPZu3oGI3Q+xY+QgZyoZpS27blrU8YpKpx6l9VO0kDi5XgbqDXEzU5f
	DVfzP1yWu/f53Bh+gjvL57iCQVA==
X-Google-Smtp-Source: AGHT+IHbbf11aBEzm+xsp/uTtv2EomAhCmlwdvkMwIl7kiohHuf6+VCO/ZMXf47TFVKkRpa1ddvlFhJUARNVpXA5tY0=
X-Received: by 2002:a05:6a20:c89c:b0:1c0:ef24:4125 with SMTP id
 adf61e73a8af0-1cce101e0a0mr3244740637.26.1724943459001; Thu, 29 Aug 2024
 07:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240828101511.3269822-1-fshao@chromium.org>
In-Reply-To: <20240828101511.3269822-1-fshao@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 29 Aug 2024 22:57:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9K5wb_d-DbFnDKDUPdSkt9Tt8ObbVc6eErehpO1SNbvw@mail.gmail.com>
Message-ID: <CAAOTY_9K5wb_d-DbFnDKDUPdSkt9Tt8ObbVc6eErehpO1SNbvw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Use spin_lock_irqsave() for CRTC event lock
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_075742_381768_5ABFB0CC 
X-CRM114-Status: GOOD (  15.80  )
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

Hi, Fei:

Fei Shao <fshao@chromium.org> =E6=96=BC 2024=E5=B9=B48=E6=9C=8828=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:16=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Use the state-aware spin_lock_irqsave() and spin_unlock_irqrestore()
> to avoid unconditionally re-enabling the local interrupts.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 411f5c1eacfe ("drm/mediatek: handle events when enabling/disabling=
 crtc")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 6f34f573e127..42f47086f414 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -449,6 +449,7 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *mtk=
_crtc)
>  {
>         struct drm_device *drm =3D mtk_crtc->base.dev;
>         struct drm_crtc *crtc =3D &mtk_crtc->base;
> +       unsigned long flags;
>         int i;
>
>         for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
> @@ -480,10 +481,10 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *m=
tk_crtc)
>         pm_runtime_put(drm->dev);
>
>         if (crtc->state->event && !crtc->state->active) {
> -               spin_lock_irq(&crtc->dev->event_lock);
> +               spin_lock_irqsave(&crtc->dev->event_lock, flags);
>                 drm_crtc_send_vblank_event(crtc, crtc->state->event);
>                 crtc->state->event =3D NULL;
> -               spin_unlock_irq(&crtc->dev->event_lock);
> +               spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>         }
>  }
>
> --
> 2.46.0.295.g3b9ea8a38a-goog
>

