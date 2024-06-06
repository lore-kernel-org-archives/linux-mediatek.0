Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01A1C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJXjSMjZjRnIAOv6T41W9J7qtEBo78dk8dXkH+wP9H8=; b=Urh4YUx3apEasXD2ytELWIGMjw
	S69sRGEQTyIrveCfEfC46XrOfE369LRPttxFz1c/TjJc1/40VbiQum1JTJjS68SOHklmbDYZ3dVFb
	dxOnNxJxG1gmcq17kigZcshNDSH6x5WYZxPTEPZb3HDSWv9/EOo+VenQXcB/14y8LI0t/aXjWZQ7c
	sl8tUNJWA55ehX6Lz8GjPvui5AQTEIstaNXcGRZAgDTZfDpfqDQM89R25M/jnbCbgpXbv+n/Fx9vP
	IFh1zf1LEiACMG990muL/9uPltYj8m2sxvXcx0Zj5tZ0wb71j4EtDsWjZOEYnA4Iruj76UkHBs3sx
	I1OQGjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFCLq-00000009iju-0FSY;
	Thu, 06 Jun 2024 12:36:18 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFCLg-00000009icf-1LAN;
	Thu, 06 Jun 2024 12:36:11 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vw3gN4y7Vz6K9Hc;
	Thu,  6 Jun 2024 20:34:40 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 8FE3C1408F9;
	Thu,  6 Jun 2024 20:35:53 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 6 Jun
 2024 13:35:52 +0100
Date: Thu, 6 Jun 2024 13:35:51 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/mediatek: Don't print error if EDEFER_PROBE
 returned on component_add
Message-ID: <20240606133551.00007d14@Huawei.com>
In-Reply-To: <20240605-mtk-disp-rdma-dev-err-probe-v1-1-91259e1d3a93@collabora.com>
References: <20240605-mtk-disp-rdma-dev-err-probe-v1-1-91259e1d3a93@collabora.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_053608_615250_74E4DA61 
X-CRM114-Status: GOOD (  15.41  )
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

On Wed, 05 Jun 2024 12:50:25 -0400
N=EDcolas F. R. A. Prado <nfraprado@collabora.com> wrote:

> Use dev_err_probe() in the component_add() error path to prevent
> printing an error when the probe is deferred. This was observed on
> mt8195 with the disp-rdma driver:
>=20
>   mediatek-disp-rdma 1c002000.rdma: Failed to add component: -517
>=20
> But the same pattern is used across many other drivers, so update them
> all.
>=20
> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c         | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c       | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_color.c       | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c       | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c       | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c        | 2 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c            | 2 +-
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/me=
diatek/mtk_disp_aal.c
> index 3ce8f32b06d5..892dc40458fb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -197,7 +197,7 @@ static int mtk_disp_aal_probe(struct platform_device =
*pdev)
> =20
>  	ret =3D component_add(dev, &mtk_disp_aal_component_ops);
>  	if (ret)
> -		dev_err(dev, "Failed to add component: %d\n", ret);
> +		dev_err_probe(dev, ret, "Failed to add component\n");
Perhaps
		return dev_err_probe(...)

	return 0;

Whilst I can see you are focused on this one problem case, it
might be better to use dev_err_probe() for all the similar
cases earlier in these functions.

Then that return dev_err_probe() pattern will make more sense
as it will be consistent with all the other calls.

