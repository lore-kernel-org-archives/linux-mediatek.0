Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D66CC54E71
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AB0NjkAiiBebf7bl+8ewpoXxo6VcL6ErYGR4u62cKM=; b=W0QalPLw9TIyQw5E6iunXMdq/u
	ICG1R85J+xPAG8rrN6Wwayt4G/+8ddWbOMH0hEnM7IgJ4xE7yvMtdprJCWYEOlIgVW2ZiQStxNywj
	73U91JWCj5aXlZ9bWcH2V2u5gAiv6trESrlzT42H9iNnd2jHX/3C/okAg3t62aw2cygdYuzsV3FIk
	/NtaYn92M8Xw7bjxQSJ8XUkBbJtAgMsHp4T4RRcqjZckUdpDoQ/m6O4HploUXD978aTV5I1SI2mun
	H7ro1almUnponQoyzfhp9L8/aJLmtcjI6Rr5FiaU9tlKTfoqZ9m4/qCl5HxskaqJjHjvLqtllz8ls
	uGU1VxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnaY2-00000006QAG-0Vfn;
	Fri, 22 Mar 2024 08:46:46 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnaXx-00000006Q8P-19vu;
	Fri, 22 Mar 2024 08:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711097194;
	bh=Gs2UAC9Hy8VFwByHDlNC06xdCiz4QDNtsopwA8NrO4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jy/XB7tw0FGS5tI0FcWpWhUzIrqIIeYInUM84WS16IpPsOCwNS4R96cgPgJzhUVRP
	 Eepi17JezOVmbuiLp8Fo5BbSCnDCvXiKAqbunTeSngJxLdItvJYUkrYmITlEBD7ps3
	 F4jlmQq41YUwav4f/MtGeRjSei/PyzDY7n7ADwI3IfGRczolHLEROndp7Qx5y2QuBp
	 S6cPVl1uX0msVhBDSiIuDoagk225ecXPhX9509482xD1yeNasazvucrvYRIr56j6vl
	 IWi9vY7VIbrrTD2Ws0ro9toDee2MVS91LpJ+Eu3ofSM7Q8jIyqwIiRTfC84vANaswp
	 Vqx4X6Y/NL5cA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E90AF37809D1;
	Fri, 22 Mar 2024 08:46:33 +0000 (UTC)
Message-ID: <e1d5d349-c9e3-4af9-a9b6-d563027a5974@collabora.com>
Date: Fri, 22 Mar 2024 09:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] drm/mediatek: Rename "mtk_drm_plane" to
 "mtk_plane"
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240322012808.26234-1-shawn.sung@mediatek.com>
 <20240322012808.26234-4-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240322012808.26234-4-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_014641_650378_71E4D456 
X-CRM114-Status: GOOD (  15.29  )
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

Il 22/03/24 02:27, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> 
> Rename all "mtk_drm_plane" to "mtk_plane":
> - To align the naming rule
> - To reduce the code size
> 
> Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>

Shawn - please - can you fix my typo'ed name also here and on all of the
patches of this series?

Thanks.

> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 6 +++---
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index cbdb70677d305..43137c46fc148 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -93,8 +93,8 @@ static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
>   	return true;
>   }
>   
> -static void mtk_drm_plane_destroy_state(struct drm_plane *plane,
> -					struct drm_plane_state *state)
> +static void mtk_plane_destroy_state(struct drm_plane *plane,
> +				    struct drm_plane_state *state)
>   {
>   	__drm_atomic_helper_plane_destroy_state(state);
>   	kfree(to_mtk_plane_state(state));
> @@ -241,7 +241,7 @@ static const struct drm_plane_funcs mtk_plane_funcs = {
>   	.destroy = drm_plane_cleanup,
>   	.reset = mtk_plane_reset,
>   	.atomic_duplicate_state = mtk_plane_duplicate_state,
> -	.atomic_destroy_state = mtk_drm_plane_destroy_state,
> +	.atomic_destroy_state = mtk_plane_destroy_state,
>   	.format_mod_supported = mtk_plane_format_mod_supported,
>   };
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> index 99aff7da0831d..231bb7aac9473 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -4,8 +4,8 @@
>    * Author: CK Hu <ck.hu@mediatek.com>
>    */
>   
> -#ifndef _MTK_DRM_PLANE_H_
> -#define _MTK_DRM_PLANE_H_
> +#ifndef _MTK_PLANE_H_
> +#define _MTK_PLANE_H_
>   
>   #include <drm/drm_crtc.h>
>   #include <linux/types.h>



