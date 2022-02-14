Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C43C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 11:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsoDjUB++7xYoC6OU4sgVibVupDvbDXqHoyadtIV4ns=; b=NYmRrDw8GJABlROYzbBr3OYFyx
	eP2BM172HJRNW0DLaMXzzLTRDvMH28ly+KX24ScDYM/k23JsYJHUJ4vrTyH+52iGD0c7MVVCnCq0H
	s0Pm8+1isZvdHj4lIdgC2RJW/lZHulFMdrVD58Muic04//zJbkWpxLQHM9fUuFW5R82EcIiKp+6VM
	6l9We9OBNbnbtZaQxVTnHTyMNnS7TM4lsMaXZ6WVAeZhE4Rr3xk4QJJe3t74Xgfblj3vPTCumVk0T
	Ui/85LUk1KmtsUbrZ2BKZRQ0bUxxuOyPyDA9B5HtIRfxTcoGUzXeHTIDvtETo19VTjSNTnzaPWU9L
	PXAh2xGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJZQi-00Emjr-NO; Mon, 14 Feb 2022 11:22:04 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJYCd-00EOcc-5t; Mon, 14 Feb 2022 10:03:29 +0000
Date: Mon, 14 Feb 2022 10:03:01 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/23] drm/ingenic: Make use of the helper
 component_compare_of
To: Yong Wu <yong.wu@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, James Wang <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, iommu@lists.linux-foundation.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, linux-kernel@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com, Rob Clark
 <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, linux-mips@vger.kernel.org
Message-Id: <19HA7R.NEIIBC5SNORY1@crapouillou.net>
In-Reply-To: <20220214060819.7334-7-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-7-yong.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_020327_448940_2B2E1AC3 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Le lun., f=E9vr. 14 2022 at 14:08:02 +0800, Yong Wu =

<yong.wu@mediatek.com> a =E9crit :
> Use the common compare helper from component.
> =

> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: linux-mips@vger.kernel.org
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index b4943a56be09..23b8f012b418 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1322,11 +1322,6 @@ static int =

> ingenic_drm_bind_with_components(struct device *dev)
>  	return ingenic_drm_bind(dev, true);
>  }
> =

> -static int compare_of(struct device *dev, void *data)
> -{
> -	return dev->of_node =3D=3D data;
> -}
> -
>  static void ingenic_drm_unbind(struct device *dev)
>  {
>  	struct ingenic_drm *priv =3D dev_get_drvdata(dev);
> @@ -1360,7 +1355,7 @@ static int ingenic_drm_probe(struct =

> platform_device *pdev)
>  	if (!np)
>  		return ingenic_drm_bind(dev, false);
> =

> -	drm_of_component_match_add(dev, &match, compare_of, np);
> +	drm_of_component_match_add(dev, &match, component_compare_of, np);
>  	of_node_put(np);
> =

>  	return component_master_add_with_match(dev, &ingenic_master_ops, =

> match);
> --
> 2.18.0
> =




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
