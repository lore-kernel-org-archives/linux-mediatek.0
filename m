Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10EFCD54B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oW5h8gTCLyh5fVNEeJOU3/bQft83u19zi1nFnE631PM=; b=H+yuOPUTG4aE0c
	t4HmPMJ0DIE0/5ogIpNyX3w9BhcQOUt9TwJLa04gNWOOEX/TwsTQAqWIf2r2Ea4o+yQE1++G8xxNX
	G8c/fCn4j1/rZtooE0paGJUq4yWdzAmDwwc8C3sKa70HnOKSUDJJ30uWtGgdPlHTXfEwWY9BW2pUe
	vrDIHfBpyUvUmCmBp7cUjclwDlQkf/wsazPb37mND4L0fcH7yk3GNy6Fj2Kl3AS4OiR7xqTQxMKgF
	qP9v9g6fr3Q/8mNFxplJBkCzq1PMeB7qxAJ1+bICRK+pdC7kBeP/APUStYH4Lxy6mtWoKmVomWS1V
	z462FfGtDWCbKYnlnu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXrx-0000YF-0j;
	Tue, 19 Sep 2023 10:22:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXrt-0000Wm-1e;
	Tue, 19 Sep 2023 10:22:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5F6B3B812A2;
	Tue, 19 Sep 2023 10:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401D0C433D9;
	Tue, 19 Sep 2023 10:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695118925;
	bh=dmvhQW3YLOhvdxKcJnLHYW07oPHwFw9/FP6t9KaaBPU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=hriYbPVslGyfrsnGFmcsr7R+8NjC4RqrTjShBOKOHR9REu/ziEQxVzgDOVmLgChEi
	 CJhReFFBIkcSyRDUEq2BPCZtw8WZPuvYQ2ZXSZ43WUA4DGJWwvwXaga0T01VWuNHrC
	 BX4E7A0ySENPPHPi/tMZ0ggl4h97MrFAiFYQgTVEo8TqxMvuMww/Vl4BDxK4Bq6df/
	 7AsxoDxZMtsdpp2uNCxd+H/LzznDZyhyCqPjBSVygrjRzZr1+EbRcw2XBL4OwD+WCs
	 otVTSCa1ZQe9dt2fHgKp7O+fPBS+ISN625MdoLY0jRn/HDqVqRhwgN1G+JwEG/kuhq
	 ZIwGdggkI4biQ==
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-27489f78e52so3216915a91.1;
        Tue, 19 Sep 2023 03:22:05 -0700 (PDT)
X-Gm-Message-State: AOJu0Yykkgg+uKBwxvv4ACZwfozL7OU5M2w79OgYEkIvuecS2YsaZ8H0
	628P4YbCX2OxwXLXUfyehSCBb5hA4Ik/e6IO2yc=
X-Google-Smtp-Source: AGHT+IFLP8u/IhPMpECtmeJDblMAwMQZVF6Uy108M/E7nMutryw3NKtyqd+bECmp03Rcsik4eRGitLcY4pbQ8nsu5Hs=
X-Received: by 2002:a17:90b:4f82:b0:276:ae0f:57bc with SMTP id
 qe2-20020a17090b4f8200b00276ae0f57bcmr628564pjb.2.1695118924779; Tue, 19 Sep
 2023 03:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com> <20230919095938.70679-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919095938.70679-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 19 Sep 2023 18:21:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v66rEqWBjdMNO3VMZhYj36hhKTxPk+9pborPjnqW0B-=ZA@mail.gmail.com>
Message-ID: <CAGb2v66rEqWBjdMNO3VMZhYj36hhKTxPk+9pborPjnqW0B-=ZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: platform: mtk-mdp3: Use devicetree phandle to
 retrieve SCP
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com, 
	hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com, 
	u.kleine-koenig@pengutronix.de, linqiheng@huawei.com, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com, wenst@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_032209_841648_25A26086 
X-CRM114-Status: GOOD (  21.70  )
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
Reply-To: wens@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 19, 2023 at 6:00=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of walking the entire parent node for something that has the
> right compatible, use the scp_get() function provided by the MediaTek
> SCP remoteproc driver to retrieve a handle to mtk_scp through the
> devicetree "mediatek,scp" (phandle) property.
>
> In case of multi-core SCP, this also allows to select a specific core.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../media/platform/mediatek/mdp3/mtk-mdp3-core.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 8677e7fd5083..d93d3833633e 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -254,13 +254,17 @@ static int mdp_probe(struct platform_device *pdev)
>                 goto err_destroy_job_wq;
>         }
>
> -       mm_pdev =3D __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
> -       if (WARN_ON(!mm_pdev)) {
> -               dev_err(&pdev->dev, "Could not get scp device\n");
> -               ret =3D -ENODEV;
> -               goto err_destroy_clock_wq;
> +       mdp->scp =3D scp_get(pdev);
> +       if (!mdp->scp) {
> +               mm_pdev =3D __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
> +               if (WARN_ON(!mm_pdev)) {
> +                       dev_err(&pdev->dev, "Could not get scp device\n")=
;
> +                       ret =3D -ENODEV;
> +                       goto err_destroy_clock_wq;
> +               }
> +               mdp->scp =3D platform_get_drvdata(mm_pdev);

You need to keep the original code as a fallback for old device trees.

ChenYu

>         }
> -       mdp->scp =3D platform_get_drvdata(mm_pdev);
> +
>         mdp->rproc_handle =3D scp_get_rproc(mdp->scp);
>         dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handle);
>
> --
> 2.42.0
>

