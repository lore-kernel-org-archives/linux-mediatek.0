Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0343C27C5E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 08:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FJ4wWGzAk9zvwj0uuJWuO5koyeWmpl/oABRugz0xbQ=; b=L2wuLWASOCpJC/
	lPOfzQb416nZLsQOQb9JcC84cGyVuget50+SomwjLvNrLVRPl2RcBV4p5SgF3fh5XG2IDy62VgJN3
	fe8TuSp9ZdurHXh9BKukQkWRFDnp4udqTP8T4YxVkHOirmo1igNFg3Coa6IplB/jfp6GTin2mKT1a
	W/BnBUqNF2ay+qoUz+As587YRxBySDtkVDuPDpiek1qnEFDiwF7smDqTTOMtxM4OcH3jMSmW+AIhS
	nt4//yBRs672zFO35b8o+bY5kiy6dVXsOqcZoe1UhJGHfDZ8rjQMBxgvvOagr8wiysWFEDC31LwVa
	KQLWog5vN3HZwiw2ufGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaB4-00000004Cyj-0mPR;
	Mon, 10 Jun 2024 08:14:54 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaAx-00000004CuV-2qU3;
	Mon, 10 Jun 2024 08:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718007286;
	bh=hiymsBDkWx+5f+WbKRv/x3OWu8HZLGmoG8GTw35O2Qg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mOnAwwTGZ+Ixo/GyUOcrUmw/ItEwWb2jBikLWg+TG/bLU8YYLUxxU6f+6g2R3RWES
	 CitorP61LjJpZ1+DtbgwvXtoVw2WMwX84DL0qmp/NKbsjaBM1159mTZhZZxZlQwa0P
	 T8D8UO9YNZzIG8fmdqEcAhp5gHeg8iStd10x3sNRFzSz3hEQtpVYB4TznPavzLJN06
	 gFbyt5UDrs3IP3xU2kecgb2UpBdhFKSQ10Tquhbu6P4BLcwGdE46Isg6wV/ZxSO7c/
	 2nw0sbVb8uX3YQ6IQk0CegS3iLri1Zj4bA5UGY8Su7U2uW8YS+6JeoquD3Y24do1Yr
	 Eg+SnN3LnShrA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7FA2A3780575;
	Mon, 10 Jun 2024 08:14:45 +0000 (UTC)
Message-ID: <3dd1631a-fbd0-44a5-8119-c03e8a186da0@collabora.com>
Date: Mon, 10 Jun 2024 10:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/16] drm/mediatek: Set DRM mode configs accordingly
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
 <20240606092635.27981-6-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606092635.27981-6-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_011447_958274_ADB3E860 
X-CRM114-Status: GOOD (  16.62  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/06/24 11:26, Shawn Sung ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Set DRM mode configs limitation according to the hardware capabilities
> and pass the IGT checks as below:
> 
> - The test "graphics.IgtKms.kms_plane" requires a frame buffer with
>    width of 4512 pixels (> 4096).
> - The test "graphics.IgtKms.kms_cursor_crc" checks if the cursor size is
>    defined, and run the test with cursor size from 1x1 to 512x512.
> 
> Please notice that the test conditions may change as IGT is updated.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h |  4 ++++
>   2 files changed, 26 insertions(+)
> 

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index 78d698ede1bf..6cfa790e8df5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -46,6 +46,10 @@ struct mtk_mmsys_driver_data {
>   	bool shadow_register;
>   	unsigned int mmsys_id;
>   	unsigned int mmsys_dev_num;
> +
> +	int max_width;
> +	int min_width;
> +	int min_height;

Only one nit here.

Since {min,max}_{width,height}:
  - Will never be negative; and
  - Will never need more than 16 bits; and
  - Are local to this driver and anyway copied to drm later

Can you please change them to unsigned 16-bits (u16)?

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

>   };
>   
>   struct mtk_drm_private {



