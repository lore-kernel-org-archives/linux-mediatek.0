Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E771FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNyWqeKIm4Ar062BbCbt8j84j3Z4f4KuWLPcjKkcIAk=; b=h3IhVU4nu6ak/B
	qFiGlgNTtu0c2X7AYkV9LB4mLU5HV85pRvCr7PFpNTbl19MzmFmDxCM2fntBABhxemZ1bQ3Zg6Hs9
	/sAFOJ3vBCJSIedHJbgqavnDkUnyKx7Y62nBHIvpfBhxDzhCxpTtimPg6Sv9F7/RAkEqoZ10DqwSc
	38nk7lg2JSubcS099pPzBzaNxyVYsxYO+oetYUgHEMgPzSKKAIkqH6pcauRxrpBUDj2wWibDgiq/u
	uccYFolk4KMryB+euwdmbNgaeyf1pRQI+6m9t4fPDuxuudngVitp5J3CNkFfoVngBHiq/j+GBJBoi
	5Nl0DiffZ/wg5WfvGLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWKb-00Dn7q-W5; Mon, 14 Feb 2022 08:03:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWKZ-00Dn74-JV; Mon, 14 Feb 2022 08:03:32 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nJWKA-0006vg-Ok; Mon, 14 Feb 2022 09:03:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Yong Wu <yong.wu@mediatek.com>
Cc: James Wang <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 iommu@lists.linux-foundation.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
 Rob Clark <robdclark@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 13/23] drm/rockchip: Make use of the helper
 component_compare_dev
Date: Mon, 14 Feb 2022 09:03:04 +0100
Message-ID: <3640952.nfqboWGjmy@diego>
In-Reply-To: <20220214060819.7334-14-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-14-yong.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_000331_651053_13F81A0B 
X-CRM114-Status: GOOD (  17.33  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am Montag, 14. Februar 2022, 07:08:09 CET schrieb Yong Wu:
> Use the common compare helper from component.
> =

> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=A8=B9bner" <heiko@sntech.de>
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_drv.c
> index bec207de4544..3c2f2d6ecc36 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -290,11 +290,6 @@ int rockchip_drm_endpoint_is_subdriver(struct device=
_node *ep)
>  	return false;
>  }
>  =

> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev =3D=3D (struct device *)data;
> -}
> -
>  static void rockchip_drm_match_remove(struct device *dev)
>  {
>  	struct device_link *link;
> @@ -321,7 +316,7 @@ static struct component_match *rockchip_drm_match_add=
(struct device *dev)
>  				break;
>  =

>  			device_link_add(dev, d, DL_FLAG_STATELESS);
> -			component_match_add(dev, &match, compare_dev, d);
> +			component_match_add(dev, &match, component_compare_dev, d);
>  		} while (true);
>  	}
>  =

> =






_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
