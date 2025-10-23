Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE98CCD1BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGXEqrpxuGhtSiEzqEbGWZIE6q4kkUxKyl23ZhAYOrg=; b=kZCrcxiaiI0HTA/KsSZDffPrJz
	rR+7VLXOzMWHorFj9k3WOohW25LuKu1aHZvdR/TFBaGgjFqMCjVqMf33XaF7V2lTGy72RtVZUHkJj
	qTrKbsfv3Kg165JLc1DqYA3tauF/wAi9omqHPShwNMy3crS+77hZajzQkjIlXMFIgwTUnjGOPsz26
	g2g2RQ8zx2U3SZ7bOyfwaOgIrzRBjQVugIw/xOXx6MfxhSPg0clsQKBNw2qsxo7zW96/ZRCZDG12H
	KciD2AopP533HnGVofJ366oY6W0LOIAa8VY/oZsBHOiMl57R71wjNR9qBzIO2f+08GZk/GuVDz7IT
	aU2xkPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxiv-00000006pTa-2Zdp;
	Thu, 23 Oct 2025 15:59:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxit-00000006pSS-0eds
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Oct 2025 15:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47CCC4AF62
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Oct 2025 15:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29424C19422
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Oct 2025 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761235170;
	bh=HNETIspV1pbV0Y7043vMBsmXaAMmB/3oT01AgEruh5o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Iqm9YOj1nwjHauObiKeCKcztOyM7IDzlzvu7DqnfXoWrCbXW8LFQnOaNQwQXRS/vD
	 G93NwnP0QcDAlRnItO34nCtCUky9f5sS8uIW06ELuZh/XCOzOm/HDb1MBsqjFSD1aj
	 tUZsK+U0FhYJA2963vqqMBLycJQx6Y+A1Y7m8Cofj4McSrdU2ytBtGI7MC1J4jK3Hd
	 mzx3D0bfz4oapjweIXnuUQKhb+BuvvR15B9uAYCoh6UoLCFVSpT8LzYnGRU9LK32iA
	 J29QaMXqAP0qOIIA3RnPHS0tkvekxr7aTAvoWDw3Tmz2gp6M+QxSYKuCqRcd71pATw
	 TSezQ+JvIMjNw==
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2907948c1d2so10321205ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Oct 2025 08:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQ0kSAIRzbmzD1qr1rQAM1n83gImKh+dUBylT7E81GLzmBczT9LauO7YjCU0C2OkkA6HrdblH4OkhhZKcGNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUm9l1oYq0zvDCpv5eKvmsJreBk5XFbec6U0tuZlxJvBo6gQrM
	wz/pS5BfNUORRS/D8wrLqkSNAFFCO8POO6r6JxkUpN/zePLdZ61sj4vcAaiTbBDHFEmbiqokDiK
	dTwLWgEMoJStNxIlPbJezQ/0/e69OSg==
X-Google-Smtp-Source: AGHT+IECkDSLnMI58q2z6cfhGJynJyGmcN+cdUTnJb3cy4ZottyIHIlB5uHCXuVcpJ10ENJOaHc75BD0rCg14pUbOyU=
X-Received: by 2002:a17:902:d48b:b0:269:a2bc:799f with SMTP id
 d9443c01a7336-2946e0ebfe2mr35532765ad.29.1761235169689; Thu, 23 Oct 2025
 08:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com> <20251023-mediatek-drm-hdmi-v2-v11-5-7873ec4a1edf@collabora.com>
In-Reply-To: <20251023-mediatek-drm-hdmi-v2-v11-5-7873ec4a1edf@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 23 Oct 2025 15:59:17 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8y6C5=jSjzBVVJ2vJq1L+Nf9U0tZvxzVX-e-3g91xEeQ@mail.gmail.com>
X-Gm-Features: AS18NWBPNnpQTLl2v2M-LiIiRpHYJ2lBBGYEU56O8zLVvGRR7Usps46KfOInouI
Message-ID: <CAAOTY_8y6C5=jSjzBVVJ2vJq1L+Nf9U0tZvxzVX-e-3g91xEeQ@mail.gmail.com>
Subject: Re: [PATCH v11 05/11] drm/mediatek: mtk_hdmi_common: Make CEC support optional
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_085931_227218_20746D86 
X-CRM114-Status: GOOD (  24.71  )
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B410=E6=9C=8823=E6=97=A5
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
>
> In preparation for adding a new driver for HDMIv2, for which CEC
> is not strictly required, change the of_get_compatible_child()
> failure error to -ENOTSUPP to be able to differentiate between
> error conditions in mtk_hdmi_dt_parse_pdata().
>
> In that case, if -ENOTSUPP is returned, this driver will print
> an informative message saying that CEC support is unavailable,
> as the devicetree node for that was not found, but after that,
> function mtk_hdmi_dt_parse_pdata() will not return error to
> the caller.
>
> This will not change functionality of the mtk_hdmi (v1) driver
> as that is still checking whether CEC is present and, if not,
> will fail probing with an error saying that CEC is required
> by HDMIv1.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm=
/mediatek/mtk_hdmi_common.c
> index f28e63716d7c2e2c6bdf5b28d24789bc926d2beb..989479fdfe40952762a1b6379=
7bf602b520dcac5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> @@ -253,12 +253,11 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hd=
mi, struct device *dev, struc
>         /* The CEC module handles HDMI hotplug detection */
>         cec_np =3D of_get_compatible_child(np->parent, "mediatek,mt8173-c=
ec");
>         if (!cec_np)
> -               return dev_err_probe(dev, -EINVAL, "Failed to find CEC no=
de\n");
> +               return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC =
node\n");

The checkpatch show the warning:

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#40: FILE: drivers/gpu/drm/mediatek/mtk_hdmi_common.c:256:
+        return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");

I find many driver use ENOTSUPP, so I'm not sure which one is better.
I really don't understand the description about these two error code [1].
If you choose ENOTSUPP, please give me some explain.

[1] https://man7.org/linux/man-pages/man3/errno.3.html

Regards,
Chun-Kuang.

>
>         cec_pdev =3D of_find_device_by_node(cec_np);
>         if (!cec_pdev) {
> -               dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
> -                       cec_np);
> +               dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_n=
p);
>                 of_node_put(cec_np);
>                 return -EPROBE_DEFER;
>         }
> @@ -319,7 +318,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *h=
dmi, struct platform_device
>                 return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c=
 adapter by node\n");
>
>         ret =3D mtk_hdmi_get_cec_dev(hdmi, dev, np);
> -       if (ret)
> +       if (ret =3D=3D -ENOTSUPP)
> +               dev_info(dev, "CEC support unavailable: node not found\n"=
);
> +       else if (ret)
>                 return ret;
>
>         return 0;
>
> --
> 2.51.0
>

