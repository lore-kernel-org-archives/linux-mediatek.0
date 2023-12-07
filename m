Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92204C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 23:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcHSEXT85lSArYArJxJaMebEv/60P46HdNj3pu54ZCw=; b=i0X/HeWBpWbuB5
	31Fy9LCA0PJQNz5lCaV9z/zhnLYN9zDIBAuvrlbbnVmymtzaiCg8BMZ8sSt7lqjKpZTuGVWiLi0/N
	KVlOYoT3/euiHIXcHyh/Qs/vZbpOxCZ8Fa0vN/mVl20wkUd1msnvnDYmXzNCr4VBswcAY65cc2BBs
	8Ne3EYS0Fcr/UsOUH6V4hMaV9oYmjCRYubhPW2Atj9Jd7aSvWzbwMCzwdlXgk9VCAMvinzoc4HzwH
	yZ261S9LAc06xMYy7sw5Ln3+Y42QuUuWROfXPjg217WPJMnpmeHy/0hLI1pPSyEpFRfxpMbGENYPf
	uqV4GvevKlkszs2WjjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOCE-00EG6p-1b;
	Thu, 07 Dec 2023 23:54:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOC9-00EG5T-2e;
	Thu, 07 Dec 2023 23:54:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8D793CE25BA;
	Thu,  7 Dec 2023 23:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADC9C433C9;
	Thu,  7 Dec 2023 23:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701993253;
	bh=126f2FINqt2NzWMdkeMGSXx7WFzHGP22zRHVVvtlMF8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XnIp6TPoRpB+tTuSRCkWDYVjXYYCb2ToRcsX08HDu4Y9thS+rx4r2QBAhlCTZnoam
	 jQckTNwxUoBLM0rNUVAz1q6J8/dwpMIZp1bw2Aga/fudIHn64PqlJuHLgeJAkauAk4
	 XqkPfddSNM202KFCBCNg0qY1dNzFll5sliKwGBRLApuMN32bcVdYlRvokQrEI2R8DP
	 QG1L7CcdTaTxYXkjfTkAC3xeZ1M6/jRHfTst78FWyzzC+ZVRp3GtM+T9hDG8Icr8Dw
	 IzgxvG0L4bH69FW2V/CepoXeEhNYg4TWnwfC5GslkgUZxsv7F3FTotLWL+koujZhB5
	 OiQLDb5rp4J1g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c9f166581dso18817551fa.2;
        Thu, 07 Dec 2023 15:54:13 -0800 (PST)
X-Gm-Message-State: AOJu0YyZo0IuNrDgiz8o+JA79MRSoO3an7tvLDyvVzCjIlukyEOYcBWx
	TrobXicuVEPBetLTvPwyvkJOxaHSm3S0wLovaQ==
X-Google-Smtp-Source: AGHT+IFG1YJnNx0pOc8S7TKFLRo4jr/uqeafdNxD4kyWaFE3oQZnuq4vicxphBN5NfQQmfMRMfbvWf4LsTLiiniVQFg=
X-Received: by 2002:a2e:8ec6:0:b0:2ca:12f5:c5d3 with SMTP id
 e6-20020a2e8ec6000000b002ca12f5c5d3mr2081298ljl.33.1701993251999; Thu, 07 Dec
 2023 15:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20230905084922.3908121-1-mwalle@kernel.org>
In-Reply-To: <20230905084922.3908121-1-mwalle@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 8 Dec 2023 07:54:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9xrt_ku-fZotJAnPa2ns-2PCGken4TepMrQYG9KEJcFA@mail.gmail.com>
Message-ID: <CAAOTY_9xrt_ku-fZotJAnPa2ns-2PCGken4TepMrQYG9KEJcFA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/mediatek: fix kernel oops if no crtc is found
To: Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_155418_356920_B9686ACF 
X-CRM114-Status: GOOD (  19.29  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Michael:

Michael Walle <mwalle@kernel.org> =E6=96=BC 2023=E5=B9=B49=E6=9C=885=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> drm_crtc_from_index(0) might return NULL if there are no CRTCs
> registered at all which will lead to a kernel oops in
> mtk_drm_crtc_dma_dev_get(). Add the missing return value check.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT=
8195")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> v4:
>  - collected tags
> v3:
>  - none
> v2:
>  - collected tags
>  - fixed typos
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 93552d76b6e7..2c582498817e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -420,6 +420,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         struct mtk_drm_private *private =3D drm->dev_private;
>         struct mtk_drm_private *priv_n;
>         struct device *dma_dev =3D NULL;
> +       struct drm_crtc *crtc;
>         int ret, i, j;
>
>         if (drm_firmware_drivers_only())
> @@ -494,7 +495,9 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         }
>
>         /* Use OVL device for all DMA memory allocations */
> -       dma_dev =3D mtk_drm_crtc_dma_dev_get(drm_crtc_from_index(drm, 0))=
;
> +       crtc =3D drm_crtc_from_index(drm, 0);
> +       if (crtc)
> +               dma_dev =3D mtk_drm_crtc_dma_dev_get(crtc);
>         if (!dma_dev) {
>                 ret =3D -ENODEV;
>                 dev_err(drm->dev, "Need at least one OVL device\n");
> --
> 2.39.2
>

