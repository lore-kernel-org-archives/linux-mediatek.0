Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98F1E706F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 09:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wl90tBKKO3bfptskJ3yz8Ad+tSM8Utlfmo70JdbbbAA=; b=0eSYoHnQMKdvvGYZ1g0WEXDh3W
	sdKQYVsQnLNhbumkzFkUvdLaonLWignPr6tNbWgG1HmFWju6EjIOLQTydVdwNOPoslu2kJ5AZ0cnM
	VX5dCoVP+Gx6+ZZeCXQO7kp+ipyYAudcUj7X/6hFLNzDiITuUqoZ+MZemdW9zMjNo0TgeXbV3eyvk
	z4P9rXy3dlltMD4E2erDuuu7Vcp41N22RpLjr5NFohHEVrXAw2rXRdhgKE4G1NUcRLNwESmDO4JqT
	UCltRGCOZs6u/rtKgXv/Ps3lwBn8+UMGcZ3aYoWRU1ymPmeIomkblmlnP5Unceq3wacKM7bcao8yt
	J82uQv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFtj-005aBs-04;
	Thu, 21 Sep 2023 09:22:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFtg-005aAj-09;
	Thu, 21 Sep 2023 09:22:57 +0000
Received: from [192.168.0.125] (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 542A566072EE;
	Thu, 21 Sep 2023 10:22:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695288173;
	bh=5h61+8nLC/rHN8t6PmIBUe2/aZ2dOAIEsl5dm5eSgJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dzv0gpQSDo0rKOZzDlhbND/2kK6VC1bMm0YlWY+r9vdq/Sfg2whf1875ZtdTQwOks
	 cg0jKDZaJ87PPpjE4cgeq2G2kaw3ybXKOb4HF+EkTwlzlhu69qyisPOAgw/Ek8YgaA
	 r2ILSPR22QLBi767iiaKmTBntRz7DSovd57aM5Tt2N2d3XixEOrz9vs5eftTeUW0ls
	 aV0vcUGCtqZLJ43Yn6sowhzHcyIkjB13XAppWge1fr/FBMMSq88G5U1D7Uau42E+NV
	 k05eDgRjS9fftNKPYsvV9+g4c6fs3Y6fWs+ccTlofX+ujDI/ueRmwuh6rc4OL/De5X
	 MJI+pV4OOqlBg==
Message-ID: <3a9a9d52-0db9-360e-55f7-78753428ee7f@collabora.com>
Date: Thu, 21 Sep 2023 12:22:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] drm/mediatek: fix kernel oops if no crtc is found
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
References: <20230905084922.3908121-1-mwalle@kernel.org>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230905084922.3908121-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_022256_244188_702569AF 
X-CRM114-Status: GOOD (  20.64  )
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

On 9/5/23 11:49, Michael Walle wrote:
> drm_crtc_from_index(0) might return NULL if there are no CRTCs
> registered at all which will lead to a kernel oops in
> mtk_drm_crtc_dma_dev_get(). Add the missing return value check.
> 
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I tried this patch as well, hit the crash during my tests. I also 
reviewed your changes

Tested-by: Eugen Hristev <eugen.hristev@collabora.com>
Reviewed-by: Eugen Hristev <eugen.hristev@collabora.com>

Eugen

> ---
> v4:
>   - collected tags
> v3:
>   - none
> v2:
>   - collected tags
>   - fixed typos
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 93552d76b6e7..2c582498817e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -420,6 +420,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   	struct mtk_drm_private *private = drm->dev_private;
>   	struct mtk_drm_private *priv_n;
>   	struct device *dma_dev = NULL;
> +	struct drm_crtc *crtc;
>   	int ret, i, j;
>   
>   	if (drm_firmware_drivers_only())
> @@ -494,7 +495,9 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   	}
>   
>   	/* Use OVL device for all DMA memory allocations */
> -	dma_dev = mtk_drm_crtc_dma_dev_get(drm_crtc_from_index(drm, 0));
> +	crtc = drm_crtc_from_index(drm, 0);
> +	if (crtc)
> +		dma_dev = mtk_drm_crtc_dma_dev_get(crtc);
>   	if (!dma_dev) {
>   		ret = -ENODEV;
>   		dev_err(drm->dev, "Need at least one OVL device\n");


