Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF0ECA5FAB
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 23:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfNrPFE2/IENfsII90Vt8A6OX76G8R6ZgvMpj6jZeww=; b=gS0DEZhixq9rdfoveYQYNOwFVD
	YEXWaOKjCRzaT+Hwk+6sLr7xF+Z7nPywU5//Qza93fqT0gX2i5aTiOeAD+8e8b6y5Awl5RXvi1SXj
	R+fgtATZCgLomjUwzazIolQHZu2Dpl4x1RozApBuZZ/fbg1QRac5cW+ouM7pv+vxGYu0+zVeyoJm0
	vwj75SCHqj+t/i8Ykb3btlev2sRM9Pq8mcif4GWOcM+QQZCv5YPgQxxPtjtIRExlflRkfojUyPMKP
	y/iAwsi7XHs8mxCvynAtnOX2v6ABnBqyEUyqMM/3LKnZSSwrS79/qDuEQWg23j11rL5Q/YJ6LePYN
	OIEemD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKmF-00000001sMo-35Ae;
	Mon, 28 Sep 2026 23:28:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKmE-00000001sMH-1Ee1
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 23:28:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F0BB600D1
	for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FB51F00898
	for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790638133;
	bh=jfNrPFE2/IENfsII90Vt8A6OX76G8R6ZgvMpj6jZeww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SlR20X4u9vAyQFfMO92S47QUK9yBB+P7gG41NknqY/af6wpl4Hm/J0ra67LtDoSOQ
	 l/lqYoBHTv9xFC9u8u8MCgosK2Uq3gFezKU11wts4PZajg5JY15YmefbgHZvIAA+iV
	 mZ4839MQbl7MSXEr1Kg5aU0GZbG4Qq0ahNMT/bIpLIyPqzcq2NSj0vtDym5yz6eB/3
	 tMWwJbj8RZW1ptEWS3F/76DFUD/VYDn118KSA3LfSuM1YK+D5fU8/opP8Uz1NEWSt4
	 VhaZ62p9hu6UbyLukHnfM17AgI5o1es/AmU2J0Ny1UKnkGUThgKC3k1vNp/RpMXFZ0
	 CQdKKYncXD9Iw==
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab50so1565920c88.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 16:28:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzbpJS3UNEy5HEUOrsmA2AoqZv1To3pqDTS/LasT+Z2v6JeVFdZfKV5tNEk4SNEklAt/0BZlKaKPIVQDLn6Og==@lists.infradead.org
X-Gm-Message-State: AFuF++mb+RVrAm+PW+xO76Cg/4/kdm+y4Bj6MCUdH5tzLCXajM64RxZk
	QZkqXYJzGr1FOen7bJFfO1OWKNwZlkrS02by0GTwRTK9OFiFZSAikY6YasKqgoH7+Zd0X5s/Q8F
	aUaUjj9k4TPLavkssiTJbGcG1P5rdMg==
X-Received: by 2002:a05:701b:4314:b0:143:50a0:56d6 with SMTP id
 a92af1059eb24-146cdfbe26dmr10687171c88.7.1790638132459; Mon, 28 Sep 2026
 16:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <7a3cbf55bf6a97835ee426eb38c34b2c153437eb.camel@mediatek.com> <20260825100845.438893-1-lihaojie@kylinos.cn>
In-Reply-To: <20260825100845.438893-1-lihaojie@kylinos.cn>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Sep 2026 07:30:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-yXPCDQT4b2s6hEDDQ3Wa-x8bttg136MaZVqtgAs3Nsg@mail.gmail.com>
X-Gm-Features: AclHuK8HNY3IA0QITI8piNzSYqjyY4DjhKThRjLr8iy4Knqan-haBW6sZ5vbbc0
Message-ID: <CAAOTY_-yXPCDQT4b2s6hEDDQ3Wa-x8bttg136MaZVqtgAs3Nsg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add missing IS_ERR check for ovl_adaptor
 platform device
To: Haojie Li <lihaojie@kylinos.cn>
Cc: ck.hu@mediatek.com, chunkuang.hu@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Haojie Li <lihaojie@kylinos.cn> =E6=96=BC 2026=E5=B9=B48=E6=9C=8825=E6=97=
=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:09=E5=AF=AB=E9=81=93=EF=BC=9A
>
> platform_device_register_data() can fail and return an ERR_PTR, but the
> return value is used without checking, leading to an invalid pointer
> being stored in ddp_comp[].dev and passed to component_match_add() and
> mtk_ddp_comp_init(), which could result in a kernel crash.
>
> Add an IS_ERR() check to jump to the error handling path on failure.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT=
8195")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haojie Li <lihaojie@kylinos.cn>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index c86a3f54f35b..b281482ab8c8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -1112,6 +1112,9 @@ static int mtk_drm_probe(struct platform_device *pd=
ev)
>                                                             PLATFORM_DEVI=
D_AUTO,
>                                                             (void *)priva=
te->mmsys_dev,
>                                                             sizeof(*priva=
te->mmsys_dev));
> +               if (IS_ERR(ovl_adaptor))
> +                       return PTR_ERR(ovl_adaptor);
> +
>                 private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev =3D =
&ovl_adaptor->dev;
>                 mtk_ddp_comp_init(dev, NULL, &private->ddp_comp[DDP_COMPO=
NENT_DRM_OVL_ADAPTOR],
>                                   DDP_COMPONENT_DRM_OVL_ADAPTOR);
> --
> 2.25.1
>

