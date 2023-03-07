Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9748C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhS9WuvDVLCH/07BDFe4S3wnXC3MatfvUcLm7rOWzPU=; b=b4AN0UAXFI08Ym1GymJmnOmAZW
	YPLZ/RHcs+vTGzA7QLH4bIS6XpDhoiM656R1UQ/kgVhUq+kxievhEdGkIQgUIhiQgpd4pnY1LQfLD
	FpCZLW1QfCgMsGQw3iV/h1s/zQodKChu/zdyRh3mzEwlsdUNMGzyfM6/hax2+h5LZ6S7XFy9olHFo
	3bTCRLFBJCAoJR3NknTIeJ/PRGZY5D6JWpJjlOSIFGVxeLsdgfqyelKe0grVyXZZuq83dBcxkzBsJ
	SnSJRWZHb4CkDjXJ96sjlzQhXTYOfHQXgJE37U2oMEQwYfBqmcgL9oYnpQC6oELoM5JCCnONUKEZ3
	BkrA1+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTcG-00Gtm5-3c; Tue, 07 Mar 2023 09:28:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTbv-00Gtbz-M5; Tue, 07 Mar 2023 09:28:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id v11so13393309plz.8;
        Tue, 07 Mar 2023 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678181273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhS9WuvDVLCH/07BDFe4S3wnXC3MatfvUcLm7rOWzPU=;
        b=IIwvrYveZMftYjvctthjlBYZfsacrBWVljfA/5J0vr0PcgbCGnOfcnJRU27qrxTv93
         DyiWrvJX9sGIHdz5xjFCQ8fzBQB9qp0Z537ErAGFhX8eA1OBDHJBrRFR/iEqk9XbnCdy
         q078ee9CfLzrFWHGO29KJCwSa0PIXTWBDIDjhKQC+R1dWN77mXOxTSg5G6yEd3KQY7wn
         La9hh5KbolMEXhOodflYLfQTM2GQRnPGr9FQ36cT5QmW1+K2g2TU+kQdsIQBclodnJl4
         W/XVTYkxEvweelFcBWZaF8+KJKeByx1Zv4p8CjlvWmDBUJPFzqqHGIJgboaIqAOr1xwr
         h7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678181273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhS9WuvDVLCH/07BDFe4S3wnXC3MatfvUcLm7rOWzPU=;
        b=pxWU2t7+4VOVqR24ucegohcmG+V+BkZqjOFpaKYI6JUz1/E8EkfX4/aJXsp0SUH2vk
         YekBJf74q6k8InkwA1ta6SiCYSCOrnratlGfLezVgSGSjSVbLObJMcv6yylOXeEsTnoT
         7rcMcdXs9rnOVQrJf2V6J+4we30fVEdRYoILpY1DX5oEM0umJQZX1bH5nv2HwcgHtp8O
         kurzjPRxaJOEGN4xyr+r62E1txeC+lhFBEpmcyFzRcjJORsVxVazasHbOLtWM6v6jIsP
         N7JbEFnvmxSuZopEDKUWM9p82q6J0ir3tEU7fWFTBblvBUrM5Wvi9spjzVw8wMoNRKW+
         As8A==
X-Gm-Message-State: AO0yUKVNQLGVm4setvrQdvTWuYR7RkVXvzOzz9FGHaqO3gyvrK2Lacga
	G90bnOZ7MxC8i6FmwF5r8tgK3tXgDI2/Ud6+89E=
X-Google-Smtp-Source: AK7set/cJsa7T6lRnhe3AOvYaVAEX3dOwNKizDvDRu5d9q0M5oZM2coLOWPB9DeQoaPW9yb4Q+CgVIpU3/LV3N7Km6k=
X-Received: by 2002:a17:902:ef92:b0:19a:8259:c754 with SMTP id
 iz18-20020a170902ef9200b0019a8259c754mr5338648plb.0.1678181273514; Tue, 07
 Mar 2023 01:27:53 -0800 (PST)
MIME-Version: 1.0
References: <20230306062633.200427-1-zyytlz.wz@163.com>
In-Reply-To: <20230306062633.200427-1-zyytlz.wz@163.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Tue, 7 Mar 2023 17:27:41 +0800
Message-ID: <CAJedcCzeVwwi9SkkwouFXUAVhF-tKF4dkqsFqVQwszSwY1SJ0A@mail.gmail.com>
Subject: Re: [RESEND PATCH] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
To: Zheng Wang <zyytlz.wz@163.com>
Cc: mchehab@kernel.org, bin.liu@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 1395428693sheep@gmail.com, 
	alex000young@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_012755_747725_36CBDBF8 
X-CRM114-Status: GOOD (  18.66  )
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

Is there anyone who can help with this? I can provide more details
like invoking chain if needed.

Thanks,
Zheng

Zheng Wang <zyytlz.wz@163.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=B8=80 14:28=E5=86=99=E9=81=93=EF=BC=9A
>
> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> and mtk_jpeg_enc_device_run may be called to start the
> work.
> If we remove the module which will call mtk_jpeg_remove
> to make cleanup, there may be a unfinished work. The
> possible sequence is as follows, which will cause a
> typical UAF bug.
>
> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
>
> CPU0                  CPU1
>
>                     |mtk_jpeg_job_timeout_work
> mtk_jpeg_remove     |
>   v4l2_m2m_release  |
>     kfree(m2m_dev); |
>                     |
>                     | v4l2_m2m_get_curr_priv
>                     |   m2m_dev->curr_ctx //use
>
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 969516a940ba..364513e7897e 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1793,7 +1793,7 @@ static int mtk_jpeg_probe(struct platform_device *p=
dev)
>  static int mtk_jpeg_remove(struct platform_device *pdev)
>  {
>         struct mtk_jpeg_dev *jpeg =3D platform_get_drvdata(pdev);
> -
> +       cancel_delayed_work(&jpeg->job_timeout_work);
>         pm_runtime_disable(&pdev->dev);
>         video_unregister_device(jpeg->vdev);
>         v4l2_m2m_release(jpeg->m2m_dev);
> --
> 2.25.1
>

