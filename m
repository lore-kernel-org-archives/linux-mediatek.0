Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789E6C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIVo0OQ1EsBJVsYCtM25PmcXBbJ96Ax/6H8Xf2sBrfU=; b=kWcjeqYGs0yL5Vd/SJVfv2n4eC
	UzmxT6nR9AYlcE/AJICf3v4iWDEEdRjNnEugJsI0L0BzCVV8tbDGgk/b6XnMvmiXHN4qcmkL5iGF/
	nh6HU5Z7ttLHB+/l/s44GLKV5jP4bBopiEsFmSatOLhNaDhtFQqO0puvaCZLSTEqyVnmynNCtaeVX
	ZiLeA9hy7b9bD6BYDFRWia5m8JU8OZQlgRTM5inhh9inAU+rksjEDj6NVFfJWj5jQDD6PdvRgqolk
	I75XhIrwJDChKMnLZcO+7EzcXLH3QI/8YL4T2iEj47q3fGmnUPfZig6cEu8fki32y0enF7YCvRP3u
	1zebohbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNRD-0000000GYlm-46LH;
	Thu, 18 Jul 2024 09:28:35 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNQr-0000000GYgi-1ira
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 09:28:15 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-8101c661979so211445241.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721294892; x=1721899692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIVo0OQ1EsBJVsYCtM25PmcXBbJ96Ax/6H8Xf2sBrfU=;
        b=CqQnwHYPko4KqKm9h0aCQg6gGyvozFX+pCNgFAt1emJGXwmLtYsGtNyc+cOJRZFaTi
         uc9CxGmZbcyUChrzvleZNFWuhJgC5TU2q5Ev0Fw0WZvra6ESctKTKugxoW/JoTvif8RQ
         GhMt4/zA87u525a+ii92o8UY8WcqxzAGRgRns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294892; x=1721899692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIVo0OQ1EsBJVsYCtM25PmcXBbJ96Ax/6H8Xf2sBrfU=;
        b=sjKFxLH+abEe8Hf4rsAIrw9RPG/mcECMJor2AM8fW7BnMEbi9F+9ugEyNlKjGXz13Z
         Zh2JR6BmUh7rEEipik8yf1udOryapm5p7jOCFL26SV+eTJbBfuzWqUwJlrgi2FBLp5cP
         Usb3FO1ZQGBUO6YRvjkbxB8qMr0Iwldx3cYpDnk+JMVyYsuACEqQYtW6ra+Vy29PfnXz
         gc4kL4LlaDtv+ZS6cT7nXV8C2M11shp6XHW1dIARDJZ6ryRy7muqhz5Pk2RTrOALIOhP
         BvkoHaeX1qMb3x0JufHKdl0kChkIGTJsjb4Sb56QxQlstKHty8iWkyxZbbCvyKhDynT2
         T/GA==
X-Forwarded-Encrypted: i=1; AJvYcCW8rPQtiA7q4laeof+NFoiswv8NblpkP7YWW8acSK0zxMJ7ZOoxICJWmVCpgTOn6NiFGn3O/55PfgUxE0GHXzkGcyc1yDO9ohdWoKOk3LbIy4uA
X-Gm-Message-State: AOJu0YxOUdTrcdLEY0Omj3A6zdDnspIw83YA5xM024jAE4FqrY+go5DD
	ddlVSCSUxwCKaI7FpvwsVK0lAnLf+R22rvHYdL9ZiUf3bYRUeUENlSTy3A6yYY1WjUj7hiFTI+l
	F7A==
X-Google-Smtp-Source: AGHT+IFhUanRwMTVsDBovcC48zlOqcIg2Fz1NBTnl4OX9gL947Zhvs2rH846IZ/NvhIZr5LlR+nJzA==
X-Received: by 2002:a05:6102:149d:b0:48f:dec0:b6bf with SMTP id ada2fe7eead31-49159731806mr6185850137.4.1721294892008;
        Thu, 18 Jul 2024 02:28:12 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4915617d3a4sm787694137.26.2024.07.18.02.28.11
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 02:28:11 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4e1c721c040so208597e0c.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 02:28:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOg8+ul5TeAfKI1fTcKsO7KzD8152IcsgHd/Rhr9x50yjbiT81btvoPkjSu8PCZAZu+c9bdTPb6djm79mstu8O5JoFl0foKxIggu60PsV9Ourp
X-Received: by 2002:a05:6122:3684:b0:4ec:fc9b:a0bc with SMTP id
 71dfb90a1353d-4f4df688191mr5774468e0c.4.1721294891079; Thu, 18 Jul 2024
 02:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com> <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
In-Reply-To: <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 18 Jul 2024 17:27:33 +0800
X-Gmail-Original-Message-ID: <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
Message-ID: <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
	matthias.bgg@gmail.com, shawn.sung@mediatek.com, ck.hu@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_022813_458896_7C4D9260 
X-CRM114-Status: GOOD (  24.83  )
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

On Thu, Jul 18, 2024 at 4:49=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> (CC-ed Fei Shao)
>
> On Thu, Jul 18, 2024 at 4:24=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Hardware-speaking, there is no feature-reduced cursor specific
> > plane, so this driver reserves the last all Overlay plane as a
> > Cursor plane, but sets the maximum cursor width/height to the
> > maximum value that the full overlay plane can use.
> >
> > While this could be ok, it raises issues with common userspace
> > using libdrm (especially Mutter, but other compositors too) which
> > will crash upon performing allocations and/or using said cursor
> > plane.
> >
> > Reduce the maximum width/height for the cursor to 512x512 pixels,
> > value taken from IGT's maximum cursor size test, which succeeds.
> >
> > Fixes: a4c9410b31ca ("drm/mediatek: Set DRM mode configs accordingly")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_drv.c
> > index 6f0b415a978d..b96763664c4f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -540,8 +540,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
> >         }
> >
> >         /* IGT will check if the cursor size is configured */
> > -       drm->mode_config.cursor_width =3D drm->mode_config.max_width;
> > -       drm->mode_config.cursor_height =3D drm->mode_config.max_height;
> > +       drm->mode_config.cursor_width =3D 512;
> > +       drm->mode_config.cursor_height =3D 512;
>
> Fei already did the same (?) workaround downstream just recently.

Well, so another userspace gets confused...
I actually sent a separate userspace (i.e. Chrome) fix where I
encountered the issue, so I didn't proceed with upstreaming it in the
end.

This matches my preference in [1], so of course I'd like to see it
merged... if maintainers are okay with it.
Given I've tested the exact same change before:
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

[1]: https://lore.kernel.org/all/CAC=3DS1nhKPo5BUYJ_cHGz3OoPrWNh5eO8rhdyikL=
imsqSOrZ5Xg@mail.gmail.com/

Regards,
Fei
>
> OOTH, Intel recently added a feature for enumerating "suggested"
> cursor sizes. See https://patchwork.freedesktop.org/patch/583299/
>
> Not sure if other compositors will end up using it or not.
>
> ChenYu
>
> >         /* Use OVL device for all DMA memory allocations */
> >         crtc =3D drm_crtc_from_index(drm, 0);
> > --
> > 2.45.2
> >

