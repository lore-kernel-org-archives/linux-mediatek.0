Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFCFC04E69
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 13:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70p97bF2yfpR7se8To5x2VZtf1iSgpwI4SiSr88fzXs=; b=nMBc8Y8oAtZ6mwVUke7VSXH7aw
	FEoO+kxtz1rmKFXZQg4iBwRkVSmeysQTAXT9PwS2iyAap5XAeyrvzkzCnf7pSobLDhPedq5MUmzgF
	t8hwy+x6wt7ofIdytIGVY/jallNsQayW9K4t3bzduXo319yIcJz+Q5OFcuk7/9cGCrZvgQVNsu7xQ
	NWuMFBi80rXXVvI1ATGOsh1J/bdLu2fW0xidzvByO6g72Vs4+rNGvBIS6djmAJIQNM40Bd7RgWWBq
	yjoN3Prk9KP9RvMtrxPJRTTDtoZ4qBA365IEJtK746js3v8teGDRiZURDDor4QVrmmrNcr/XlmX0t
	qVBtRfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYDe-008tQS-0P;
	Thu, 03 Aug 2023 13:18:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYDa-008tMl-2E;
	Thu, 03 Aug 2023 13:18:20 +0000
Received: from [192.168.0.125] (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A0966600359;
	Thu,  3 Aug 2023 14:18:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691068696;
	bh=ehtnooF4XJa6rGTTWGX8btVhMNGF1adK7GnhGx2DAtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ipwFnpLSOqCnx0wmqJHvBrSv2dMow/rQ+/kB4KqSlAY3JSTm7Tj7+m82MaRDPfAE7
	 +tmY5B9VuWavIYILkiw3ltBLZjuhYo6tqzEaI+DsXCXfq8x1UpJ7LHBj4wNhcz0QYe
	 VOuJ9H8LohHpv4klgjgYz3b5oG/e8v8woDmveqadGeEOA2JkebW8YXS/Y+vEAp6kpm
	 CgbtoJIuVqT4pkD3sg8SYZbHmKSOuI7PSR232FlkYF8Gvhw+UjYPt9QA1ORJWRFdtm
	 gk1yHbOEZKG/YYBIxjDhf9JADiNuFY8//MhhVDyJlhE9LNURJUvFwCNUaK1SL6XnO5
	 8wyKQm3thV+5Q==
Message-ID: <38720b56-df8e-d25a-0e6f-ca6e1fb3df26@collabora.com>
Date: Thu, 3 Aug 2023 16:18:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 2/8] drm/mediatevk: Add crtc path enum for all_drm_priv
 array
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230802144802.751-1-jason-jh.lin@mediatek.com>
 <20230802144802.751-3-jason-jh.lin@mediatek.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230802144802.751-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_061818_949386_921D6E5E 
X-CRM114-Status: GOOD (  16.59  )
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

On 8/2/23 17:47, Jason-JH.Lin wrote:
> Add mtk_drm_crtc_path enum for eatch display path.

Typo: each

> 
> Instead of using array index of all_drm_priv in mtk_drm_kms_init(),
> mtk_drm_crtc_path enum can make more readable.

can make *code* more readable ?
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 +++---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h | 8 +++++++-
>   2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 249c9fd6347e..89a38561ba27 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -465,21 +465,21 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   		for (j = 0; j < private->data->mmsys_dev_num; j++) {
>   			priv_n = private->all_drm_private[j];
>   
> -			if (i == 0 && priv_n->data->main_len) {
> +			if (i == CRTC_MAIN && priv_n->data->main_len) {
>   				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
>   							  priv_n->data->main_len, j);
>   				if (ret)
>   					goto err_component_unbind;
>   
>   				continue;
> -			} else if (i == 1 && priv_n->data->ext_len) {
> +			} else if (i == CRTC_EXT && priv_n->data->ext_len) {
>   				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
>   							  priv_n->data->ext_len, j);
>   				if (ret)
>   					goto err_component_unbind;
>   
>   				continue;
> -			} else if (i == 2 && priv_n->data->third_len) {
> +			} else if (i == CRTC_THIRD && priv_n->data->third_len) {
>   				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
>   							  priv_n->data->third_len, j);
>   				if (ret)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index eb2fd45941f0..f4de8bb27685 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -9,11 +9,17 @@
>   #include <linux/io.h>
>   #include "mtk_drm_ddp_comp.h"
>   
> -#define MAX_CRTC	3
>   #define MAX_CONNECTOR	2
>   #define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
>   #define DDP_COMPONENT_DRM_ID_MAX (DDP_COMPONENT_DRM_OVL_ADAPTOR + 1)
>   
> +enum mtk_drm_crtc_path {
> +	CRTC_MAIN,
> +	CRTC_EXT,
> +	CRTC_THIRD,
> +	MAX_CRTC,
> +};
> +
>   struct device;
>   struct device_node;
>   struct drm_crtc;


