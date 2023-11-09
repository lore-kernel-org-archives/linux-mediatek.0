Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FE8C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79oUciC1MphFLchMyW5zN+ld+Ip/ohdJ3MzsnnkdArI=; b=Qg3fNYhdRrf31el1hQCbWj90G3
	kJD4LaX1xM6cjnnTbbbr6K0zX906NzqJc++hT812BqHCat3q6vUq+mKqZWqGQhueYDQ73EpqK5T3m
	1Sng0tOOtQ5WlJymRabHxJB9CLaEBEiJ256tS/W5j9mOxt8Qjaj+QyAAXMLGfcM5u1qbJMn7tGb1Y
	3WRwKnuQq6WmULP2e5DePeVWgynrrnbYtQMoQC3z1J59fMvcKiWSo/InAZEi1ss3+uikzLqpUc7vV
	SUDx/SY5iLtUk6t9W1vBnNdVbqLC5QgMLxTe2sJmO9Qgou/dnb+SUF9IvDY85sfOQLJ6THQqDuZXy
	ScvXu+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1BXY-007AwN-0U;
	Thu, 09 Nov 2023 20:22:12 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1BXU-007AvF-2M;
	Thu, 09 Nov 2023 20:22:10 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4ac42a7bffeso557958e0c.2;
        Thu, 09 Nov 2023 12:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699561324; x=1700166124; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79oUciC1MphFLchMyW5zN+ld+Ip/ohdJ3MzsnnkdArI=;
        b=Y1bHWUvrualm5xtRth7u9xmjC2dDNcaX8/tNudL1jTnDEPPD4wsCpGIULrz3BOhgRM
         RlLEtQu2eONyD/IezfwSRuKfXcsLX2T3MwBMyw2XB844q+BazzbWFka0RKNOMpg54Ro8
         7GW5Ahccvfb/Vs7CZemxWPuEHTp1RPO2aMoquRNld/T35i/MV3Pd6tLKCeceZRa9ku/d
         uw54Y4ISrNc7SnxlIvvYns7vihWduESgPJxM9i+PuAqodsduE1wq48xsiFBpjKiGAAF8
         AuvhIf4agrehxpo65N1aggVUG5K/Fz1IvJs+aQIvrEhVd8IizMgUa9QQEXNeIJGgMjuZ
         owVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699561324; x=1700166124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79oUciC1MphFLchMyW5zN+ld+Ip/ohdJ3MzsnnkdArI=;
        b=saSrJypo/9gjo8PiSZHKgOJbylCvdavd2cPTU7zO8pXPK6U4nutrduBlLLrWBMJc+H
         mVm6vOLUbEANtNoTuAfnset4qH0k4O6oy+X6RENBqPsexKg5+rN5ktGPPTDV+UxcMTNL
         nShcTeywFoxBoomStIH0hSizr3wBfLZeuwVfrDu1rlpCsejLdxGm2tI2mUJj5a5Kg/Lq
         cmiIqetBUk/zF0R5KrMNUVTygqrE3W6ulEA/n+s4cjY4H98/3OF3miQAYTDYdbvuxuyD
         qyc0BSaGiOpnZzlmbuaMsyH95ASHSWKMxikTR73P/ski6t9sPpl7zLDpWXEwk2/+ke+9
         6/PQ==
X-Gm-Message-State: AOJu0YwNTy5eAPWoffbwuuhA+Jai1JuhIXqS20gEfEMWFrKo+fODNeN3
	arFR77DNqUJDhFpdgZLKoF4P3l4cChwjqXPbE08=
X-Google-Smtp-Source: AGHT+IHeEYBi5nUVdK8O1Fji9SXoWwVQ1ionOejtl0pq9n4Oxy3eyVaDJB4oTZ8X0i5CLfXx5Mqs5VNvA3gtw+Gk21c=
X-Received: by 2002:a05:6122:1807:b0:4a1:7278:3bf5 with SMTP id
 ay7-20020a056122180700b004a172783bf5mr2992264vkb.4.1699561324079; Thu, 09 Nov
 2023 12:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com> <20231109163512.179524-39-benjamin.gaignard@collabora.com>
In-Reply-To: <20231109163512.179524-39-benjamin.gaignard@collabora.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 9 Nov 2023 20:21:17 +0000
Message-ID: <CA+V-a8t33Q5C00dUmo=i=wd5wPzqdCNVO8MLH8to-7Ge9SjYuQ@mail.gmail.com>
Subject: Re: [PATCH v15 38/56] media: ti: Stop direct calls to queue
 num_buffers field
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com, 
	ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	kernel@collabora.com, Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_122208_812946_E20E5085 
X-CRM114-Status: GOOD (  16.58  )
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

On Thu, Nov 9, 2023 at 4:38=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly=
.
> This allows us to change how the number of buffers is computed in the
> future.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   | 5 +++--
>  drivers/media/platform/ti/cal/cal-video.c        | 5 +++--
>  drivers/media/platform/ti/davinci/vpif_capture.c | 5 +++--
>  drivers/media/platform/ti/davinci/vpif_display.c | 5 +++--
>  drivers/media/platform/ti/omap/omap_vout.c       | 5 +++--
>  5 files changed, 15 insertions(+), 10 deletions(-)
>
Reviewed-by: Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/med=
ia/platform/ti/am437x/am437x-vpfe.c
> index 5fa2ea9025d9..f18acf9286a2 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -1771,9 +1771,10 @@ static int vpfe_queue_setup(struct vb2_queue *vq,
>  {
>         struct vpfe_device *vpfe =3D vb2_get_drv_priv(vq);
>         unsigned size =3D vpfe->fmt.fmt.pix.sizeimage;
> +       unsigned int q_num_bufs =3D vb2_get_num_buffers(vq);
>
> -       if (vq->num_buffers + *nbuffers < 3)
> -               *nbuffers =3D 3 - vq->num_buffers;
> +       if (q_num_bufs + *nbuffers < 3)
> +               *nbuffers =3D 3 - q_num_bufs;
>
>         if (*nplanes) {
>                 if (sizes[0] < size)
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/pl=
atform/ti/cal/cal-video.c
> index a8abcd0fee17..94e67c057a20 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -603,9 +603,10 @@ static int cal_queue_setup(struct vb2_queue *vq,
>  {
>         struct cal_ctx *ctx =3D vb2_get_drv_priv(vq);
>         unsigned int size =3D ctx->v_fmt.fmt.pix.sizeimage;
> +       unsigned int q_num_bufs =3D vb2_get_num_buffers(vq);
>
> -       if (vq->num_buffers + *nbuffers < 3)
> -               *nbuffers =3D 3 - vq->num_buffers;
> +       if (q_num_bufs + *nbuffers < 3)
> +               *nbuffers =3D 3 - q_num_bufs;
>
>         if (*nplanes) {
>                 if (sizes[0] < size)
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/m=
edia/platform/ti/davinci/vpif_capture.c
> index 99fae8830c41..fc42b4bc37e6 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -113,6 +113,7 @@ static int vpif_buffer_queue_setup(struct vb2_queue *=
vq,
>         struct channel_obj *ch =3D vb2_get_drv_priv(vq);
>         struct common_obj *common =3D &ch->common[VPIF_VIDEO_INDEX];
>         unsigned size =3D common->fmt.fmt.pix.sizeimage;
> +       unsigned int q_num_bufs =3D vb2_get_num_buffers(vq);
>
>         vpif_dbg(2, debug, "vpif_buffer_setup\n");
>
> @@ -122,8 +123,8 @@ static int vpif_buffer_queue_setup(struct vb2_queue *=
vq,
>                 size =3D sizes[0];
>         }
>
> -       if (vq->num_buffers + *nbuffers < 3)
> -               *nbuffers =3D 3 - vq->num_buffers;
> +       if (q_num_bufs + *nbuffers < 3)
> +               *nbuffers =3D 3 - q_num_bufs;
>
>         *nplanes =3D 1;
>         sizes[0] =3D size;
> diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/m=
edia/platform/ti/davinci/vpif_display.c
> index f8ec2991c667..9dbab1003c1d 100644
> --- a/drivers/media/platform/ti/davinci/vpif_display.c
> +++ b/drivers/media/platform/ti/davinci/vpif_display.c
> @@ -115,6 +115,7 @@ static int vpif_buffer_queue_setup(struct vb2_queue *=
vq,
>         struct channel_obj *ch =3D vb2_get_drv_priv(vq);
>         struct common_obj *common =3D &ch->common[VPIF_VIDEO_INDEX];
>         unsigned size =3D common->fmt.fmt.pix.sizeimage;
> +       unsigned int q_num_bufs =3D vb2_get_num_buffers(vq);
>
>         if (*nplanes) {
>                 if (sizes[0] < size)
> @@ -122,8 +123,8 @@ static int vpif_buffer_queue_setup(struct vb2_queue *=
vq,
>                 size =3D sizes[0];
>         }
>
> -       if (vq->num_buffers + *nbuffers < 3)
> -               *nbuffers =3D 3 - vq->num_buffers;
> +       if (q_num_bufs + *nbuffers < 3)
> +               *nbuffers =3D 3 - q_num_bufs;
>
>         *nplanes =3D 1;
>         sizes[0] =3D size;
> diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/p=
latform/ti/omap/omap_vout.c
> index 4143274089c3..72ce903717d3 100644
> --- a/drivers/media/platform/ti/omap/omap_vout.c
> +++ b/drivers/media/platform/ti/omap/omap_vout.c
> @@ -944,10 +944,11 @@ static int omap_vout_vb2_queue_setup(struct vb2_que=
ue *vq,
>                                      struct device *alloc_devs[])
>  {
>         struct omap_vout_device *vout =3D vb2_get_drv_priv(vq);
> +       unsigned int q_num_bufs =3D vb2_get_num_buffers(vq);
>         int size =3D vout->pix.sizeimage;
>
> -       if (is_rotation_enabled(vout) && vq->num_buffers + *nbufs > VRFB_=
NUM_BUFS) {
> -               *nbufs =3D VRFB_NUM_BUFS - vq->num_buffers;
> +       if (is_rotation_enabled(vout) && q_num_bufs + *nbufs > VRFB_NUM_B=
UFS) {
> +               *nbufs =3D VRFB_NUM_BUFS - q_num_bufs;
>                 if (*nbufs =3D=3D 0)
>                         return -EINVAL;
>         }
> --
> 2.39.2
>

