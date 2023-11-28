Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14B2C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 03:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wp5HnTgZ7ZLaUo9Q/M6nPjzjSUwa62T1Maa/se+gxo=; b=XOL69iKRUjkVJj0rwPB1sBDqGM
	TIVyC93YKSNUFq2YST7iwUg76HQyR52/0AVKQPdyXuArJhtk96ZgzGt92sgZqjjosReAJUQrDpseR
	+2pL1MHai6Nl1lPW/7H/SDZmhsSKMMwVVQLDmXq72ajgdLORE4ISXpqd0dHqD0hrOsf4TA4RGVLyD
	l1YVjsR4aPL5N1M80a4GXPea8UzlrDa16Q/58eeP2as5NZfxpfnsz+0zkrVCmtjoir+v37zWTw8sL
	06xASjosnhZynEAcGhRJgMT+xZxpJEHmUkmcI5c3oTX5YrJgSxahJRLAbSxxLmG2ari+gyXB0aCcV
	GLjkL3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7obT-003xNn-0g;
	Tue, 28 Nov 2023 03:17:39 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7obQ-003xMb-1P
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Nov 2023 03:17:38 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507be298d2aso6793167e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Nov 2023 19:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701141451; x=1701746251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wp5HnTgZ7ZLaUo9Q/M6nPjzjSUwa62T1Maa/se+gxo=;
        b=PvuTuSk+JfWbymOj8Fw6HaHctNE+6He5+GA37cZbqzjXxHsFFScLsf7cEwD1ESdKN3
         RCtIFUMM89LuNLeVZ8q+oN4ZslahJMVm/Ja3+v8H2g6E2Lo0dt3U6uufm4cjQYWyM5DY
         wuo0mo+GbjQuqBFkMD19eeoYPVMCP/e0lztOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701141451; x=1701746251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wp5HnTgZ7ZLaUo9Q/M6nPjzjSUwa62T1Maa/se+gxo=;
        b=c9mk5UYuChD+jzUYJ1L13/nenBwFpTwrgk56emWmwoNvjpNaKS+8JTyE7JK+XeCzW1
         PpMFKcLY3p4bMI+G5vpgnUEXBYSfmTWVdVYY6tM1YKL5w9RkPXxI0RLjJF1WekQ8ilvU
         RkNn7gx4OEQuuXr8u0otCBy7e+WKprsY+pNe5MW4CHrVldIYq322ng0WG0Fy05l6pu3N
         AM7Rw5s0ZZGd2avkEfXB6vFQteUeCK+7EiXZEFA3CN6Xa/mZPaPuEBU7WHrk7/eo/sc6
         OCe5Clc39laA6/6hDTzFHoNi/kW/NMWmDGlgDpdJ4og9RcqI9TOFsgs0c5YmyA5+jBSD
         7+FQ==
X-Gm-Message-State: AOJu0YyIImtQJJUdaT0Bc8P216+afPJhV5y62mCznRGI6gAb0mPZtwds
	yPKubHVFq+fAfjiUtiwaTc5B0RPx55tbmbe0RFMinA==
X-Google-Smtp-Source: AGHT+IGSvCVqHokq1V085rudx0pq9tIghj1AHgkp2YjyyUW/OKHrDERsAUTAxkQUm4r6WUQntkQt94tB1L8sdCreRbM=
X-Received: by 2002:a05:6512:3585:b0:500:d4d9:25b5 with SMTP id
 m5-20020a056512358500b00500d4d925b5mr7469216lfr.56.1701141451084; Mon, 27 Nov
 2023 19:17:31 -0800 (PST)
MIME-Version: 1.0
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-4-jiaxin.yu@mediatek.com> <c35ef2d8-ab40-484b-9a4c-38f2f3e7d99c@collabora.com>
In-Reply-To: <c35ef2d8-ab40-484b-9a4c-38f2f3e7d99c@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 28 Nov 2023 11:17:20 +0800
Message-ID: <CAGXv+5G2tP9i8VrUc6-xs2d72_nL9XH9iSCeixzA2AM7X5fXOQ@mail.gmail.com>
Subject: Re: [v3 3/3] drm/bridge: it6505: Add audio support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, 
	kuninori.morimoto.gx@renesas.com, nfraprado@collabora.com, 
	alsa-devel@alsa-project.org, chunxu.li@mediatek.com, 
	allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, ajye_huang@compal.corp-partner.google.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_191736_515635_40A840AA 
X-CRM114-Status: GOOD (  24.51  )
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

On Tue, Nov 21, 2023 at 8:54=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/07/23 20:08, Jiaxin Yu ha scritto:
> > Add audio support for it6505
> >
> > 1. Bridge to hdmi-codec to support audio feature. At the same time,
> >     the function of automatically detecting audio is removed.
> > 2. It is observed that some DP-to-HDMI dongles will get into bad
> >     states if sending InfoFrame without audio data. Defer to enable
> >     it6505's audio feature when PCM triggers START or RESUME.
> >
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
>
> Hello Jiaxin,
> this patch doesn't apply anymore (and it won't build anymore) upstream.
>
> > ---
> >   drivers/gpu/drm/bridge/ite-it6505.c | 81 ++++++++++++++++++++++++++--=
-
> >   1 file changed, 75 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/brid=
ge/ite-it6505.c
> > index 504d51c42f79..1cfcb0731288 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -2162,7 +2162,6 @@ static void it6505_stop_link_train(struct it6505 =
*it6505)
> >
> >   static void it6505_link_train_ok(struct it6505 *it6505)
> >   {
> > -     struct device *dev =3D &it6505->client->dev;
>
> This is because this changed to `struct device *dev =3D it6505->dev;`
>
> >
> >       it6505->link_state =3D LINK_OK;
> >       /* disalbe mute enable avi info frame */
> > @@ -2170,11 +2169,6 @@ static void it6505_link_train_ok(struct it6505 *=
it6505)
> >       it6505_set_bits(it6505, REG_INFOFRAME_CTRL,
> >                       EN_VID_CTRL_PKT, EN_VID_CTRL_PKT);
> >
> > -     if (it6505_audio_input(it6505)) {
> > -             DRM_DEV_DEBUG_DRIVER(dev, "Enable audio!");
> > -             it6505_enable_audio(it6505);
> > -     }
> > -
> >       if (it6505->hdcp_desired)
> >               it6505_start_hdcp(it6505);
> >   }
> > @@ -2846,6 +2840,45 @@ static void __maybe_unused it6505_audio_shutdown=
(struct device *dev, void *data)
> >               it6505_disable_audio(it6505);
> >   }
> >
> > +static int it6505_audio_hw_params(struct device *dev, void *data,
> > +                               struct hdmi_codec_daifmt *daifmt,
> > +                               struct hdmi_codec_params *params)
> > +{
> > +     struct it6505 *it6505 =3D dev_get_drvdata(dev);
> > +
> > +     return it6505_audio_setup_hw_params(it6505, params);
> > +}
> > +
> > +static int it6505_audio_setup_trigger(struct it6505 *it6505, int cmd)
> > +{
> > +     struct device *dev =3D &it6505->client->dev;
>
> ...and because you'll have to change this one, and other occurrences of t=
hat
> as well.
>
> Can you please respin this series?

Please also add a patch adding #sound-dai-cells to the it6505 binding.

