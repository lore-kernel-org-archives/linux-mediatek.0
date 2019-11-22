Return-Path: <SRS0=vzOr=ZO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAADC432C0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 08:06:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D9C20659
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 08:06:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dvbM70cC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UBj+tYl7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84D9C20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+ltNJa7AC/FcGp745U7+PWsjvH/zHPb0VdSm8eqaCM=; b=dvbM70cCWlnrsL
	nZB6+Qq4ScY7FTVbw363EVofgrn+tfZMlSNgQ+89duZrcDlne481Ao0iO73BxOgSsajtbQrAHJF7i
	M7SujPRyexHTqjhZxeNQhF7A2wMn4DdR2+hGb2Fa6MHEwTwoq9S1t5qquxw/fGDoZPROklfiY8rzq
	ibaEGJbwi2cDnmYQHi7G8/T1CTX3eiZPGtGUjaM5cQ0AobADc+9CKV/fJ0ZeA3K0zdvT4ZC3facZt
	APaxcb6u4rHy7rq8ypvEn8m19I24Fqdy2cr50ueiddwtW2Oi3q0a/HETeE/l99IcUtL0OOZkbpeJO
	PROOADBxrWcVn4mp1jPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iY3xJ-0004zq-Nz; Fri, 22 Nov 2019 08:06:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY3x8-0004rC-9K; Fri, 22 Nov 2019 08:06:07 +0000
X-UUID: c67523ec6fd74517b7d51280abb0e710-20191122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=biiWaCmeF2zekF9ph9b3ZsgnAyXW/XZddTvqnNdWtZI=; 
 b=UBj+tYl7o9PnBzb8JAMkkcAghNv1ZKFDCo9BnYhfPiCD+tgcKL5SWitrbPEE07xrbjCFBmvsH/G+upGp27sMPLuxWXBotj+fV6v4HMdYPyl9nkdv9QeTBV5eIvEwp+FdjeN7tZTgqjoPB+f2ewwuSZU/YumK1cR4RBquWG74viE=;
X-UUID: c67523ec6fd74517b7d51280abb0e710-20191122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 54808159; Fri, 22 Nov 2019 00:06:00 -0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 23:59:11 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 22 Nov 2019 15:59:03 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 22 Nov 2019 15:59:04 +0800
Message-ID: <1574409521.12825.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Check return value of
 mtk_drm_ddp_comp_for_plane.
From: CK Hu <ck.hu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Fri, 22 Nov 2019 15:58:41 +0800
In-Reply-To: <20191118061806.52781-1-pihsun@chromium.org>
References: <20191118061806.52781-1-pihsun@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_000606_337450_CEB278E6 
X-CRM114-Status: GOOD (  13.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Pi-Hsun:

On Mon, 2019-11-18 at 14:18 +0800, Pi-Hsun Shih wrote:
> The mtk_drm_ddp_comp_for_plane can return NULL, but the usage doesn't
> check for it. Add check for it.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Fixes: d6b53f68356f ("drm/mediatek: Add helper to get component for a plane")
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index f80a8ba75977..4c4f976c994e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -310,7 +310,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  
>  		plane_state = to_mtk_plane_state(plane->state);
>  		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> -		mtk_ddp_comp_layer_config(comp, local_layer, plane_state);
> +		if (comp)
> +			mtk_ddp_comp_layer_config(comp, local_layer,
> +						  plane_state);
>  	}
>  
>  	return 0;
> @@ -386,8 +388,9 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
>  			comp = mtk_drm_ddp_comp_for_plane(crtc, plane,
>  							  &local_layer);
>  
> -			mtk_ddp_comp_layer_config(comp, local_layer,
> -						  plane_state);
> +			if (comp)
> +				mtk_ddp_comp_layer_config(comp, local_layer,
> +							  plane_state);
>  			plane_state->pending.config = false;
>  		}
>  		mtk_crtc->pending_planes = false;
> @@ -401,7 +404,9 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
>  	struct mtk_ddp_comp *comp;
>  
>  	comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> -	return mtk_ddp_comp_layer_check(comp, local_layer, state);
> +	if (comp)
> +		return mtk_ddp_comp_layer_check(comp, local_layer, state);
> +	return 0;
>  }
>  
>  static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> 
> base-commit: 5a6fcbeabe3e20459ed8504690b2515dacc5246f

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
