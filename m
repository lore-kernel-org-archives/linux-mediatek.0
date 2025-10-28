Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EC4CCF9F0
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Oct 2025 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IW5FCsZkz6M+s0ig87IAhPwGfqRhpZn1nQALb78KYc=; b=QspKgMs6jOTUXRgVJQEAjUgga6
	OF2qQPi42jl0GAb9mJe/8X2wWl3PFMdEIhJfXZSZihNAPnnPGHabyo7EytfeCpmN39umLCh6QC6OP
	h+QSDumlUwJ6RQrTixX9Abkru9yFXvnETBA+AmMoKmmpUHRtMQwiUEsc1yeWCrtHmPfXyRWHAcM69
	Z+Iad27DrqXLoLpS/fSC6/RWGsALZ1GtoSuu3Y3enotwZ4gUb2K91oUcLICgbydjqZydG92KrpETt
	y0xCCttWx9mmRj6ZvM8rC7Y1UIj3ofQ4mPYz6xJBNORAqkzxYr2R+izwt5mWDfFP7UrNnnLQqEJeC
	Cy3I+aZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl9f-0000000G8BB-3nf6;
	Tue, 28 Oct 2025 14:58:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl9e-0000000G89q-06tH
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Oct 2025 14:58:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D16EC48AAE
	for <linux-mediatek@lists.infradead.org>; Tue, 28 Oct 2025 14:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93AFC19425
	for <linux-mediatek@lists.infradead.org>; Tue, 28 Oct 2025 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761663512;
	bh=fgrnGbqm4nMPYm0YFueCTLn38xVSXMpZjjfyexFg4zU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fKpHJDLw+LdcON/i87zMt8WeFuLsLOkXCh8EaH+KceiRe9xB3NmNNEipNh06u89Qy
	 AbqjbUQwBsH4cwpPlCHdRBkk9PFn/7DfhwH4wDXKj9w6C1tZEt3y3ZUiJWCH/WFiNw
	 wuRNVHBpYpGjfgPS0713G9KL2KmLK817qGbDZUlo8sOcLtxCp2aLJQGxChIquDiQcy
	 fj2U9lW2HSHWHA2eEH71FCQ37XgLZAwhPofn7BzXS5LFcnE+bQasacaEn/LkVXHexC
	 GPwoVTWQz66mefaw9y9zjwlCNXEP4ixcVgZvMvMMxqtbsTY46dce7rKzABe6widukp
	 ht3DHx+N8Nl9w==
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2947d345949so52942995ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Oct 2025 07:58:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlLsp47IPs8m5AK+d2VcjI6166axG+I0ymWxeqtD0wFknx7UOPeihfIqCm6uJX8pN9ENCt4pUMy9g7j+sh/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys0DI+qkvo7eqZBzdnfJ4Skf8u071KV5agUJECfMMFzWAUi61e
	ePxCp5pQvD5HOq9KG6G2yPaQbtT+RNTejMQUwHQOm8xM5j0oq0+CeyDzo83hDdZGGoo/YZX1VgK
	Tx5qjv1GsL/kWSveb+AKcoDxVgIcAwQ==
X-Google-Smtp-Source: AGHT+IHme6RPgheMLj6a7fR8+m2u2gZ6x3MVu+ulovS2o0skDQiD/daH6FArZWmguxDIJ5KfNDpOra+vAhdzzjURlKs=
X-Received: by 2002:a17:902:dac4:b0:294:63ea:b570 with SMTP id
 d9443c01a7336-294cb65f622mr46857375ad.48.1761663512099; Tue, 28 Oct 2025
 07:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251006093937.27869-1-johan@kernel.org>
In-Reply-To: <20251006093937.27869-1-johan@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 28 Oct 2025 14:58:18 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9rf948byRD3_cCeXREeLt2jXHL2CZPAEUUvAVgJc3dBA@mail.gmail.com>
X-Gm-Features: AWmQ_bnhgsaxyx7-K3gUASFOVVQcGX3sTjPCy2q_RVuuZkcZXgMfDZNuqSDRMTE
Message-ID: <CAAOTY_9rf948byRD3_cCeXREeLt2jXHL2CZPAEUUvAVgJc3dBA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix device use-after-free on unbind
To: Johan Hovold <johan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Ma Ke <make24@iscas.ac.cn>, Sjoerd Simons <sjoerd@collabora.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_075834_105469_FC72F623 
X-CRM114-Status: GOOD (  21.30  )
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

Johan Hovold <johan@kernel.org> =E6=96=BC 2025=E5=B9=B410=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=889:48=E5=AF=AB=E9=81=93=EF=BC=9A
>
> A recent change fixed device reference leaks when looking up drm
> platform device driver data during bind() but failed to remove a partial
> fix which had been added by commit 80805b62ea5b ("drm/mediatek: Fix
> kobject put for component sub-drivers").
>
> This results in a reference imbalance on component bind() failures and
> on unbind() which could lead to a user-after-free.
>
> Make sure to only drop the references after retrieving the driver data
> by effectively reverting the previous partial fix.
>
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 1f403699c40f ("drm/mediatek: Fix device/node reference count leaks=
 in mtk_drm_get_all_drm_priv")
> Reported-by: Sjoerd Simons <sjoerd@collabora.com>
> Link: https://lore.kernel.org/r/20251003-mtk-drm-refcount-v1-1-3b3f2813b0=
db@collabora.com
> Cc: stable@vger.kernel.org
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 384b0510272c..a94c51a83261 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -686,10 +686,6 @@ static int mtk_drm_bind(struct device *dev)
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 private->all_drm_private[i]->drm =3D NULL;
>  err_put_dev:
> -       for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> -               /* For device_find_child in mtk_drm_get_all_priv() */
> -               put_device(private->all_drm_private[i]->dev);
> -       }
>         put_device(private->mutex_dev);
>         return ret;
>  }
> @@ -697,18 +693,12 @@ static int mtk_drm_bind(struct device *dev)
>  static void mtk_drm_unbind(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> -       int i;
>
>         /* for multi mmsys dev, unregister drm dev in mmsys master */
>         if (private->drm_master) {
>                 drm_dev_unregister(private->drm);
>                 mtk_drm_kms_deinit(private->drm);
>                 drm_dev_put(private->drm);
> -
> -               for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> -                       /* For device_find_child in mtk_drm_get_all_priv(=
) */
> -                       put_device(private->all_drm_private[i]->dev);
> -               }
>                 put_device(private->mutex_dev);
>         }
>         private->mtk_drm_bound =3D false;
> --
> 2.49.1
>

