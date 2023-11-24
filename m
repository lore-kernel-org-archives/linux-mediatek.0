Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6064EC61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 04:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KekUES4QEaW3T6OzwXPRLAJ7BoFDfNAQJ2uK8ftZs4=; b=FMK1aO5ZVVDnjy
	EX8cyBWgw76ReJGG1HYkfNA33j0PACggR7Sw2WeFs2YcUhpHenJzGErZItPXSrUW1WU9JqJS2A5+4
	74ylJcbcuE2Uu1tFl5YrjP9T2FiIJ4LCUAiumEKWWF874JVMqhyFVP1e7Ep6XpTAapj0dk5Bfsfy8
	nio8gOfnhBRPDbs02u0K4vfbGujVhiasXy5bKxdVR7InEu5AwJ49seQEryqVwo+I1ncfzebdLsMvP
	gn4Lm/gANpz9jTZ7f6JrSPcRysq5I7oOZt09tBoU9TS0cOjiJct589ANNtmZE68yR8BHEh0A5onBa
	D1t8kdjF0foWFlecIsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Nzg-0068UE-0p;
	Fri, 24 Nov 2023 04:40:44 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Nzc-0068TV-2x
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 04:40:42 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507962561adso2282918e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Nov 2023 20:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700800838; x=1701405638; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KekUES4QEaW3T6OzwXPRLAJ7BoFDfNAQJ2uK8ftZs4=;
        b=Bz0yFVwzOkwisi+/qoHnsRb3xT3j+F/3e1vyNowcpgusvndCqT5Fe4s4whnlp0YX7B
         c6iVTAqTv6UgFXTR8X/bq238MDldoy+36lfSulMm/l3BOIY5yGmWRxqGpvFkNgWx82Gz
         3uBJ3W/4VEai5UcTXNgjVbDJzPyt7PLUH1jcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700800838; x=1701405638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KekUES4QEaW3T6OzwXPRLAJ7BoFDfNAQJ2uK8ftZs4=;
        b=t3EK2Ld77PVlXiB+o1vqTa2ILKCjNGDFzzYgy/jUqugG8W1zCOKmydC0yDq/jr1mms
         Ht799xfjmIP0vlAxnWh7Nyldp20DsFbm3kWnRnJQEVu1Vf1dX953CxpHVM3dedSugU/U
         W86PsazDknRA4ymmBulfnjQoKe3Q1Da7gtJkSyXte3Ax0Fr1Qf69x+1YeKcxq/SZmW7W
         X4MxmD4EBP+ozBkFv5PpQdFRKUcrBUGndYdzQCLXF+j3RDDkupE0kZwGh+KOY5JmQMU1
         aTTxWAjduG5n0XkiVY3vy7PP9ur8FvJHEtCzR4FtvG5buULLUJW7WwoQR9EjOeqBrOkw
         bdjw==
X-Gm-Message-State: AOJu0YxnYu/ZnhdjNxzOQxFOEQcgdoIvWkB68k3ePOW1K+QOxCBqgXmS
	QGeXWsfsi5QrFjYtYFYAPuUPZP+lpTrAn7GoWAykfg==
X-Google-Smtp-Source: AGHT+IGdD+/8ruJjlhlvRhWd1o7YaLznxCb2y1AN3J4cYgMXWOthMIC6kIZi9F0WtwbcSOzhaUMLEFUIHM/mmVrW99g=
X-Received: by 2002:a05:6512:3b2c:b0:4fb:9f93:365f with SMTP id
 f44-20020a0565123b2c00b004fb9f93365fmr1155339lfv.38.1700800838386; Thu, 23
 Nov 2023 20:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20230920090658.31181-1-jason-jh.lin@mediatek.com> <4b55632a4cc92932384844f94a7d237aa3f471e3.camel@mediatek.com>
In-Reply-To: <4b55632a4cc92932384844f94a7d237aa3f471e3.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Nov 2023 12:40:27 +0800
Message-ID: <CAGXv+5GvOCOPkjxyhv-Wwwbosp1KrL1aFzSyoU_FhqKPk=evPQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add spinlock for setting vblank event in atomic_begin
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_204040_998479_4ECB1380 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "amergnat@baylibre.com" <amergnat@baylibre.com>, =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 8, 2023 at 3:27=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) =
<ck.hu@mediatek.com> wrote:
>
> Hi, Jason:
>
> On Wed, 2023-09-20 at 17:06 +0800, Jason-JH.Lin wrote:
> > Add spinlock protection to avoid race condition on vblank event
> > between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Please also merge this for fixes so it lands sooner.

> >
> > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC
> > MT8173.")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Suggested-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> > Reviewed-by: Fei Shao <fshao@chromium.org>
> > Tested-by: Fei Shao <fshao@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index b6fa4ad2f94d..cab4fe092f13 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -744,6 +744,7 @@ static void mtk_drm_crtc_atomic_begin(struct
> > drm_crtc *crtc,
> >
> >   crtc);
> >       struct mtk_crtc_state *mtk_crtc_state =3D
> > to_mtk_crtc_state(crtc_state);
> >       struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> > +     unsigned long flags;
> >
> >       if (mtk_crtc->event && mtk_crtc_state->base.event)
> >               DRM_ERROR("new event while there is still a pending
> > event\n");
> > @@ -751,7 +752,11 @@ static void mtk_drm_crtc_atomic_begin(struct
> > drm_crtc *crtc,
> >       if (mtk_crtc_state->base.event) {
> >               mtk_crtc_state->base.event->pipe =3D
> > drm_crtc_index(crtc);
> >               WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
> > +
> > +             spin_lock_irqsave(&crtc->dev->event_lock, flags);
> >               mtk_crtc->event =3D mtk_crtc_state->base.event;
> > +             spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> > +
> >               mtk_crtc_state->base.event =3D NULL;
> >       }
> >  }

