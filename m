Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975A5CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7uH31UN91+fljH+roDUJZnayXqB6OvkipUsIFV6Wzs=; b=M5jzh5EHpeJ5Y06b7B6d7A37xt
	VPjlFiCzP7I0uURnPNU3wXWLguvcFO+08J+54OXFlhTgPCMvE5MDpTQX5o2DmyGVA6OKsAtcttORz
	eulLfi5Ljl2DIyEvvgYTbTyEwyUunFdWd1YMm4/fas9JzRM3129hY0O7sQxy0gq0o19GJtsp/mUCP
	RQoIdfaKrnPZXO3zZjLhCZKxpMTsw8efnoitAjObSVjMunKxhyKzPbSC9/BHAxcjc6nFJ3fOc2sLG
	RCrEfzy6i78WF2BC46Vqop4d7nYeyCbIJl8akY4qEEuX1zfoG+ppwKC7R9lnqHTlLJ5JpGZbCislx
	iIYZMU5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUUb-0000000GRgG-0n47;
	Thu, 14 Aug 2025 09:43:29 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTnY-0000000GK4c-288e
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Aug 2025 08:59:01 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-8900fcc0330so885175241.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 01:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755161939; x=1755766739; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7uH31UN91+fljH+roDUJZnayXqB6OvkipUsIFV6Wzs=;
        b=Y1MGrfcEBZbA10XEJPZx3mDQ/OKs1SJSrHGhmE3Df4XvEQqge3obB/noU+Na2NAExZ
         H76j2OMLT9pS7NIfnaZ3v0TOGgENZJIzg6S1YKAy6rlDeNmxaYxwAVw073OWmbjQyWmn
         TlPJDNBX2z4LtUxxseUbrgTfYZ1fqbGvg8Ep4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161939; x=1755766739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7uH31UN91+fljH+roDUJZnayXqB6OvkipUsIFV6Wzs=;
        b=awhZpFWRa/3QCo9RwIzoAnLpvYLnxvGWpt/6MUL5X2jCRSfB0XkSHx6+36jkf4MwfR
         gNrje2/vA/M2xeA3qPbWw1Ba9Q3BiF+LXHuuiG0/94B8UB0G5TDJrxp+nqRWPk8BPhBa
         82qFShuIbdjRzPMKcpZAPbNLyNXUDkimlGAoeMIoqv8tIAJ319AQT4YCsJjuls+NYiaD
         cnvlisAoF61iVjkncwmWHhfoApzYEvSsXmsbUT5j77PqOqnYJuAIYxKJ6ipObBewSY2O
         o+ntpQJBermMv+viaUbfUZOvNQpPXuz+zjXdrWZTvxfS9xoppRlT9p0/YrCt/wRTgmxF
         TuZw==
X-Forwarded-Encrypted: i=1; AJvYcCXcJUOK1Qwm24Ym9vqi1SFFAocFJPGJ1CczzpmaUSi644nRkr0E+FnkPVUJwoBVSJwUPIe+nqrE9dPM2oJU0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnmGVfW1xjc5aOSzpU8updXc/RFrTkdAWW+XdbSVB7cl1BD0xV
	au0+lU5z7Rph3pu8Y3pilNmrp0llhTiuo6CKuZU8RpLAXNcfXF1qglVHwe+DE2kOdNwfEIqPgfP
	32fM=
X-Gm-Gg: ASbGncvdsVdUht3ashuR/BEVDnokrZCC99FKR0LyIogjRSG5HlnIc3cWz9UIzqSriQI
	RmVBeyW3EMshbftnIZZoWIGCCP+LVFWJDsutNAMGSOdE+KGkEIFma1OPD5D0aY7LRpnnjpgMD0t
	OTtBUFx//JKdSaixZwfBm+1XehUytWoldCpZyrYT29rMvGSp/x12DEmCMugJ8O30pa4u8KQ860Z
	5eqL+uqMwveBhfwuVy92JQPtQrhSk0KIxxH/oPU/iKjIwBjlPP8Z+l/ryoiIZTTy7u9OMB3TO8l
	6uifSUFurtWbsXKznvG3cE0G5kKwVetctf+Eewt2FNmjluhzpIilusQxTKJ95SfTwDQ+t0ku3sZ
	yVXAtCT7drI+8Yg0W7oVzvhz6FFIvi4tWxpT3fFi/ROhNks+AfBpIFWYi7DDEsiA2JJ/wON47TB
	wzmfk=
X-Google-Smtp-Source: AGHT+IEiSgd4tgTkaJtCdB1x3AJSwp76+ftK8MH1OVaYzMwmS15+Lp59d8JT4wdbtt58PQkDfcNVMA==
X-Received: by 2002:a05:6122:6b18:b0:539:237c:f95d with SMTP id 71dfb90a1353d-53b19a6066emr680209e0c.0.1755161938941;
        Thu, 14 Aug 2025 01:58:58 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b01ae75fsm4372855e0c.10.2025.08.14.01.58.58
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 01:58:58 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-50e2e0ce5f3so1491427137.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 01:58:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9jxqZtZDEInZYBTkrVtGgy8OY1PZLffUANPOOZLrqiMw90q8gI4Pka4LNwLr6hjmklyKop7UJ93TcWdP2uQ==@lists.infradead.org
X-Received: by 2002:a05:6102:8083:b0:4e5:5c14:5937 with SMTP id
 ada2fe7eead31-51058a87196mr673671137.1.1755161937736; Thu, 14 Aug 2025
 01:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250814083144.191554-1-wenst@chromium.org>
In-Reply-To: <20250814083144.191554-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 14 Aug 2025 16:58:21 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhz_ESY4VrgWs=dVinLtdOamh6to3EgD1w1Kx=4YBOD9A@mail.gmail.com>
X-Gm-Features: Ac12FXyjQIDoUSwiVtyIticCvke0x3M57lwGIL10ez0LU-OLgFrmxrQr_qqqlnA
Message-ID: <CAC=S1nhz_ESY4VrgWs=dVinLtdOamh6to3EgD1w1Kx=4YBOD9A@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_015900_563033_C4B20AA9 
X-CRM114-Status: GOOD (  20.25  )
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

On Thu, Aug 14, 2025 at 4:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Previously a mutex was added to protect the encoder and decoder context
> lists from unexpected changes originating from the SCP IP block, causing
> the context pointer to go invalid, resulting in a NULL pointer
> dereference in the IPI handler.
>
> Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> context. This causes a big warning from the scheduler. This was first
> reported downstream on the ChromeOS kernels, but is also reproducible
> on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even though
> the actual capture format is not supported, the affected code paths
> are triggered.
>
> Since this lock just protects the context list and operations on it are
> very fast, it should be OK to switch to a spinlock.
>
> Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect dec=
oder context list")
> Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect enc=
oder context list")
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-----
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
>  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-----
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
>  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
>  7 files changed, 26 insertions(+), 20 deletions(-)
>

[...]

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 145958206e38..e9b5cac9c63b 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcodec_d=
ec_dev *dec_dev, struct vde
>         struct mtk_vcodec_dec_ctx *ctx;
>         int ret =3D false;
>
> -       mutex_lock(&dec_dev->dev_ctx_lock);
> +       spin_lock(&dec_dev->dev_ctx_lock);

Do you mean spin_lock_irqsave()?

>         list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
>                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu) {
>                         ret =3D true;
>                         break;
>                 }
>         }
> -       mutex_unlock(&dec_dev->dev_ctx_lock);
> +       spin_unlock(&dec_dev->dev_ctx_lock);
>
>         return ret;
>  }

[...]

> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> index 51bb7ee141b9..79a91283da78 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> @@ -47,14 +47,14 @@ static bool vpu_enc_check_ap_inst(struct mtk_vcodec_e=
nc_dev *enc_dev, struct ven
>         struct mtk_vcodec_enc_ctx *ctx;
>         int ret =3D false;
>
> -       mutex_lock(&enc_dev->dev_ctx_lock);
> +       spin_lock(&enc_dev->dev_ctx_lock);

Also here.

Regards,
Fei

>         list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
>                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu) {
>                         ret =3D true;
>                         break;
>                 }
>         }
> -       mutex_unlock(&enc_dev->dev_ctx_lock);
> +       spin_unlock(&enc_dev->dev_ctx_lock);
>
>         return ret;
>  }
> --
> 2.51.0.rc1.163.g2494970778-goog
>
>

