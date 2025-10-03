Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A470CCA471
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Oct 2025 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcjsGAtJBDRTbKSc6ZGZGbuEJNUcV2kb0nQ6sHCx+Sk=; b=E2jW0MGHFSuYNRtrfLdOhibNlh
	bcTLZhvVJmwMNcw84uAEv8GWz4kUKB2KPbPr606woCKhOpuR1lRBPIrsdTZl98W3e0L4oMdZ7FCZh
	61GHICEzWbQr0FKX+L3gbuTso+XZEJiJdnpRjfVhvrVU8tdLcoPACJQK0YyYu3Ppsp8l0sT9Zbgsk
	sKYLpcAwFaj+B0A4Uc8DmeASQrfINmvzk60NEw9nIWE9CHyvMXGLDuinKGZ4ucy+gyR0Iq8O/tz1b
	OaIj7tb1dDtg+0q/Snzyt0JOAveUlvr1Gc5I7n4zRHbUOLWXSMZ/Oe6o1eUPapTMTW75Yns1MS5bb
	e0jElJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hxl-0000000CfOK-2w88;
	Fri, 03 Oct 2025 15:44:53 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hxj-0000000CfNJ-0jrA
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Oct 2025 15:44:52 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4de584653cfso36664461cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Oct 2025 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759506289; x=1760111089; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CcjsGAtJBDRTbKSc6ZGZGbuEJNUcV2kb0nQ6sHCx+Sk=;
        b=OHAfCod/Up+9cGZNabfb3pE5neucTzvpXI4AmiCvWwN8mRWSP8EwsvsU1Ji2h2OBB1
         ywIbjNw2BxUOAhMhWDOcmxror/mNvdSBUudeEpnRmPbmGL12Of34PUCvU4/wUDfbAql1
         5PHX1/jDVppE75C8xBu56hnboIASEFBSLIL5hdwHIrraYC/XpPd7phMzL8cEjIXk/phB
         BNImlLo/oY02jxVp31C4srQiDOzqkqGbl0N7+sUInOCz4FX5UmibK4iq7m4WOPRH7cMS
         1IxobUFezNDN/d4lWTT7nE8alhskoc1k6Kk1TrZCtgG+Da028wdk+Q6ehCGVMxzGTyH8
         LYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759506289; x=1760111089;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcjsGAtJBDRTbKSc6ZGZGbuEJNUcV2kb0nQ6sHCx+Sk=;
        b=Y/W2vZhe+1zBh0bG95QMXhwJuPRcIm2qbwnhklr7PMTa0bAUQFDzD60hEYR7u18MmR
         YbgFH6JpC49QbvqFhSiGzawSlN0x3RA8KejP9LNW25UGCBTvoXI5U8puA2VQcyV+TTtg
         6oBrkB1+Ol0kiY8M5M0FvZ7RIn7k5em1F7lBhV2d+LeFlNI0zfktGfMkcMZEAJRZFitV
         BwUMqoZKxlbeMd04sABBFnQnlH2NInvrVuASbYHb7PNM/Qn7mtZkyZ6rYFSxkgBWlgDL
         TlCdwCukX4xmK4p7W4yWLCJSG6GuTDzQQEYnPFvPDp/F3HC5Jv1tGCEDtYAcLD/TymmR
         MFtg==
X-Forwarded-Encrypted: i=1; AJvYcCVdho2qXSccL14kHoX7VcChylp0qr96f2uPDB6qbiet6g2ALMjOgYHajlCoEq9oG62U96MGT9ySdBhtNoC1sA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw624llX8Qr/JNS/UopBJrpqKPGE90M3cyPE+AnwPNLVisEMxTq
	WC1sQ8dI5L4NTRuVDSWLaAemgnIkWA3DSvnWdYNUjWlslkfECphq0anqY/p58VYckMg=
X-Gm-Gg: ASbGncs21OVjufuknZ0Y+VWnuSLa0vvQYtPC0ZaXEN7ejTfZUm03wK2n5HxyE5OsYvs
	2R66+oeXEAoz4y7zszSQjTxmHCE4t5pAcXUtSF/HWdwjxN4CbalKvGwu51xo1lAHIaepNiBHdMV
	h6KJkm0D6PFOWlTJUGvk4Ezeal5ShRg59NjYK7Ho7jRj13A1TR7GTMs8p08vHHoKPd3S4VSMQB8
	8wwRcefQFIQRfEoxqyEzZnVGNi1E25nvspXcny04NmuqlLBYsrOVwunwrmDO46kKIPKIcuCbEVg
	SCoSFD4FXrIn/LWIeOZ7Mwgg1thlf2aF84TUsHzbOCkzINi8BJGIwxP6mH1KJj6auGTGMjNT5HO
	FoEcRJukrPghseuqqDm6TlzG96IXrt/+4k2aLDX529lEj0yLazHOKFwWwk3e57L4ef0r/Ttkick
	zIWA==
X-Google-Smtp-Source: AGHT+IG3nggyzp6rBeV7O8SFngJ0q7vh9MKYuGI8B+E0xgcql9QjTelcIZpNtFB3s282izeII55ing==
X-Received: by 2002:a05:622a:343:b0:4b5:e9e3:3c90 with SMTP id d75a77b69052e-4e576a5d586mr46819141cf.9.1759506287912;
        Fri, 03 Oct 2025 08:44:47 -0700 (PDT)
Received: from [192.168.42.140] (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55aa44901sm41212601cf.18.2025.10.03.08.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:44:47 -0700 (PDT)
Message-ID: <e22a74d0298d7318c59841f706f6f731c77241db.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mtk-mdp: Fix some issues in mtk_mdp_core.c
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <haoxiang_li2024@163.com>, minghsiu.tsai@mediatek.com, 
	houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Fri, 03 Oct 2025 11:44:45 -0400
In-Reply-To: <20250917094045.28789-1-haoxiang_li2024@163.com>
References: <20250917094045.28789-1-haoxiang_li2024@163.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jvh4cueVjwyOExiJXg2C"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_084451_340298_607ED2A4 
X-CRM114-Status: GOOD (  19.62  )
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


--=-jvh4cueVjwyOExiJXg2C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le mercredi 17 septembre 2025 =C3=A0 17:40 +0800, Haoxiang Li a =C3=A9crit=
=C2=A0:
> Add check for the return value of vpu_get_plat_device() to prevent null
> pointer dereference. And vpu_get_plat_device() increases the reference
> count of the returned platform device. Add platform_device_put() to
> prevent reference leak. Also add platform_device_put() in mtk_mdp_remove(=
).

I think we should improve the subject a little. What about ?

  media: mtk-mdp: Fix error handling in probe function


Nicolas

>=20
> Add mtk_mdp_unregister_m2m_device() on the error handling path.
>=20
> Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
> Changes in v2:
> - Add check for vpu_get_plat_device()
> - Add platform_device_put() in mtk_mdp_remove()
> - Add mtk_mdp_unregister_m2m_device() on the error handling path.
> - Modify the patch title and description. I think you are right.
> =C2=A0 Thanks, CJ!
> ---
> =C2=A0.../media/platform/mediatek/mdp/mtk_mdp_core.c=C2=A0 | 17 +++++++++=
++++++--
> =C2=A01 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> index 80fdc6ff57e0..8432833814f3 100644
> --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> @@ -194,11 +194,17 @@ static int mtk_mdp_probe(struct platform_device *pd=
ev)
> =C2=A0	}
> =C2=A0
> =C2=A0	mdp->vpu_dev =3D vpu_get_plat_device(pdev);
> +	if (!mdp->vpu_dev) {
> +		dev_err(&pdev->dev, "Failed to get vpu device\n");
> +		ret =3D -ENODEV;
> +		goto err_vpu_get_dev;
> +	}
> +
> =C2=A0	ret =3D vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, m=
dp,
> =C2=A0				=C2=A0 VPU_RST_MDP);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(&pdev->dev, "Failed to register reset handler\n");
> -		goto err_m2m_register;
> +		goto err_reg_handler;
> =C2=A0	}
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, mdp);
> @@ -206,7 +212,7 @@ static int mtk_mdp_probe(struct platform_device *pdev=
)
> =C2=A0	ret =3D vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(3=
2));
> =C2=A0	if (ret) {
> =C2=A0		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> -		goto err_m2m_register;
> +		goto err_reg_handler;
> =C2=A0	}
> =C2=A0
> =C2=A0	pm_runtime_enable(dev);
> @@ -214,6 +220,12 @@ static int mtk_mdp_probe(struct platform_device *pde=
v)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +err_reg_handler:
> +	platform_device_put(mdp->vpu_dev);
> +
> +err_vpu_get_dev:
> +	mtk_mdp_unregister_m2m_device(mdp);
> +
> =C2=A0err_m2m_register:
> =C2=A0	v4l2_device_unregister(&mdp->v4l2_dev);
> =C2=A0
> @@ -242,6 +254,7 @@ static void mtk_mdp_remove(struct platform_device *pd=
ev)
> =C2=A0
> =C2=A0	pm_runtime_disable(&pdev->dev);
> =C2=A0	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +	platform_device_put(mdp->vpu_dev);
> =C2=A0	mtk_mdp_unregister_m2m_device(mdp);
> =C2=A0	v4l2_device_unregister(&mdp->v4l2_dev);
> =C2=A0

--=-jvh4cueVjwyOExiJXg2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaN/vbQAKCRDZQZRRKWBy
9KWiAP0QJQMSss66nBhuvWdyP3z+yb6Q5jk6MMuOVBfPG9I+XgEAlm/xzfuJ8BPA
DxlLGE1JMwN8N8zLQzYhKhp61WB8XwQ=
=RvA4
-----END PGP SIGNATURE-----

--=-jvh4cueVjwyOExiJXg2C--

