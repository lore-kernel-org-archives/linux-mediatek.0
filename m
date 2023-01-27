Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9B8C54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0zMJ072HyjI8o0dmjz9Fq16gA+b6u68Xpvv/0fjmqA=; b=MRXQsHNibnJpSA
	UhZoCfTUdRwK5EPPg0np4YxQLdMlQXIr52CV/w7TXlvduuNmRYyYIv+/uN0LhylEt8PH1wzwrKptN
	ubZPXASDLXbj79PVfSBmnocFnNfQhc41gLYkNzdNtS0ex0ltjvTFQEb361H5eg4E1OccELczQnPj/
	Z08sa8cH+7aw9Qo0T38uKezHWHexeVBJqhioSzv7CQUxmKXSoMRnWoiNdo/zXv7CR+TmRlHQWBqrI
	Jq/lY/agHYMYa5xkBAXSHIkqsdlJic4c5VInY1wQyCUojXVoYSZjQ/2YUUq/VlBhznQ+dxU/dABR0
	YLSLr+4Bd1zM+iZ/yYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQP9-00FQ4M-2c; Fri, 27 Jan 2023 15:12:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQOr-00FPye-Vg; Fri, 27 Jan 2023 15:12:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6C9A7B81FCB;
	Fri, 27 Jan 2023 15:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98DF2C433A8;
	Fri, 27 Jan 2023 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674832338;
	bh=XEGrj08mrGc6T/CEgbRHQGd2YGIb4XomZMq/krxPioc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NE7iOLypBK0VcyoXe938Wrub/Dw5KzL7dSr6El5xLMjFDdDwRIPzcnb+RnFl1DtR4
	 zGKUbwkZUSDBwoNhnLnciBA2uFF3bwTK1gnIasFfpIKr/mtB4yhOjWYYnOTsRZT5Jp
	 1o+734IVEyh++hTgc3TLwfQv34XrT54Ip0EG8+3tetxKa4A359ip3Ehvu7DMyVqjWh
	 4r7bfZr3KRlXZHsFJm47FxEOMa0EkDWPOBS/DB8Tig1jfugQ814tNJDL2x7s3zbC+K
	 lLG0wk7i3F7AJlWLNjiOJV3nzAa+Wqrcg2t110cjECkctz+1+EyjVYeM/ggu2PUuCN
	 hjnKH0Nwe32EQ==
Received: by mail-lf1-f52.google.com with SMTP id d30so8592952lfv.8;
        Fri, 27 Jan 2023 07:12:18 -0800 (PST)
X-Gm-Message-State: AFqh2kqMEmwsaAXvPsxxOMjnl7BFpy3GLWwozbcgsyqR9L4C3pmjvB1S
	VQuNVv2EOwzIG03zHj/Xg+TZYDF/lld/Pe/Nvg==
X-Google-Smtp-Source: AMrXdXsMmkgRBQo0TFynmEJqLTZw81aRoOnst7MOnAoZNQlO8IkeJrvkMJCE/StM8437PfU6MBsslI61mZGCWtvv18g=
X-Received: by 2002:a05:6512:1043:b0:4ca:f9e4:c410 with SMTP id
 c3-20020a056512104300b004caf9e4c410mr2228287lfb.97.1674832336570; Fri, 27 Jan
 2023 07:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20221122143949.3493104-1-nfraprado@collabora.com>
In-Reply-To: <20221122143949.3493104-1-nfraprado@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 23:12:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY__oFQ8DyAbdCyQEGAw7tFi+6AONiOHZxu_qJhT9MHNpoQ@mail.gmail.com>
Message-ID: <CAAOTY__oFQ8DyAbdCyQEGAw7tFi+6AONiOHZxu_qJhT9MHNpoQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Clean dangling pointer on bind error path
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_071222_352536_BCDE3622 
X-CRM114-Status: GOOD (  17.09  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, kernel@collabora.com, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Nicolas:

N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> =E6=96=BC 2022=E5=B9=
=B411=E6=9C=8822=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:39=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> mtk_drm_bind() can fail, in which case drm_dev_put() is called,
> destroying the drm_device object. However a pointer to it was still
> being held in the private object, and that pointer would be passed along
> to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
> point, resulting in a panic. Clean the pointer when destroying the
> object in the error path to prevent this from happening.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
>
> Changes in v2:
> - Added Fixes tag
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 39a42dc8fb85..a21ff1b3258c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -514,6 +514,7 @@ static int mtk_drm_bind(struct device *dev)
>  err_deinit:
>         mtk_drm_kms_deinit(drm);
>  err_free:
> +       private->drm =3D NULL;
>         drm_dev_put(drm);
>         return ret;
>  }
> --
> 2.38.1
>

