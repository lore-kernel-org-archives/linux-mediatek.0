Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88483C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=096LyLBnznfaygZ8MTrCc0dknQcfjeOez9z2CidW0kg=; b=DpnJWtFOSI9zZY
	dNVgrxzlfhhfqMeHqDMMFge+9jrFV+8A1r8I8TteXViK7vf8AD60lNLtXS/+CY8gbPr78TXfRfPu1
	3umTHe8ZMq+9SUvXP/Enplp2gS4zT/0wal5+LN+7pAVnUC1mr/72SlhaNO1taN/N+KxkGFAn7EoLC
	cZ09kaFZZ44UlOT7rldOz9m0jxr6Z8PXyKGFk9/qZYuR8YOlYLNUkdYQsZ/EAlcnjNsWE+yixWYaR
	lS+8qu2F9mcGmu0LISrv79ud/q1vAyXppOvqeKzM81hJ1IzVcwrpCJG41y6kOz+AhaQhc0qn+l7rP
	wNgzOkHywG9nkFI+Mgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2nO-00Bnkh-0Q;
	Tue, 12 Dec 2023 13:27:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2nC-00Bncj-2c;
	Tue, 12 Dec 2023 13:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702387641;
	bh=0tiP4C6j3nPpwwBDA8CElSa/FRmWHJ0rT18IdY5QwUo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d6g969f8omCxYQdo7HlUZUe7r1BUINP4N/LK2oyrCJY3EYRMUE+Nhhrd7W0qg84fp
	 4m2d2fwgeXwcmQpbBibnm7wIyVSW4d6Q+QcB6B5UO7zJ3x+ECfot522PvvaAVENOoa
	 1cQvXA7rKdHHjsudorhrWiR6X96x63GO3zYIbtDzXAYFZWLVBMy+LZrULd7DeRttph
	 JpidxkyTHLk8/mUZZHD7kifEulhdhqZVMzACn9zqU0UnCMsUHza+30DsFPUnk54jsI
	 tME/GkMS7y0So/KmuKZIhyBaTvzciSEM9VPqg/8XVeDmZPyb5u7RXWFIDFZ5n7shVR
	 4au0sSFLcPXzQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 508853781462;
	Tue, 12 Dec 2023 13:27:20 +0000 (UTC)
Message-ID: <8f2c5728-0be2-415e-bccb-798c4a22e853@collabora.com>
Date: Tue, 12 Dec 2023 14:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/17] drm/mediatek: Set DRM mode configs accordingly
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
 <20231212121957.19231-6-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212121957.19231-6-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_052722_982469_B01DF977 
X-CRM114-Status: GOOD (  22.05  )
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/12/23 13:19, Hsiao Chien Sung ha scritto:
> Set DRM mode configs limitation accroding to the
> hardware capabilities.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 28 ++++++++++++++++++--------
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h |  1 +
>   2 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 5d551bff6b3f..a4b740420ebb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -304,6 +304,7 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
>   	.conn_routes = mt8188_mtk_ddp_main_routes,
>   	.conn_routes_num = ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
>   	.mmsys_dev_num = 2,
> +	.max_pitch = GENMASK(15, 0),
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
> @@ -318,6 +319,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>   	.main_path = mt8195_mtk_ddp_main,
>   	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
>   	.mmsys_dev_num = 2,
> +	.max_pitch = GENMASK(15, 0),
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
> @@ -325,6 +327,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>   	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
>   	.mmsys_id = 1,
>   	.mmsys_dev_num = 2,
> +	.max_pitch = GENMASK(15, 0),
>   };
>   
>   static const struct of_device_id mtk_drm_of_ids[] = {
> @@ -463,16 +466,16 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   	if (ret)
>   		goto put_mutex_dev;
>   
> -	drm->mode_config.min_width = 64;
> -	drm->mode_config.min_height = 64;
> -
>   	/*
> -	 * set max width and height as default value(4096x4096).
> -	 * this value would be used to check framebuffer size limitation
> -	 * at drm_mode_addfb().
> +	 * Set default values for drm mode config
> +	 * these values will be referenced by drm_mode_addfb() as
> +	 * frame buffer size limitation.
>   	 */
> -	drm->mode_config.max_width = 4096;
> -	drm->mode_config.max_height = 4096;
> +	drm->mode_config.min_width = 1;
> +	drm->mode_config.min_height = 1;
> +	drm->mode_config.cursor_width = 512;
> +	drm->mode_config.cursor_height = 512;
> +
>   	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
>   	drm->mode_config.helper_private = &mtk_drm_mode_config_helpers;
>   
> @@ -502,6 +505,15 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   		for (j = 0; j < private->data->mmsys_dev_num; j++) {
>   			priv_n = private->all_drm_private[j];
>   
> +			if (priv_n->data->max_pitch) {
> +				/* Save 4 bytes for the color depth (pitch = width x bpp) */

This comment is confusing. Did you mean 4 *bits*? Four bytes is 32 bits.

Also, I'd change the last part to "(pitch = [ width or height ] x bpp)"

> +				drm->mode_config.max_width  = priv_n->data->max_pitch >> 2;
> +				drm->mode_config.max_height = priv_n->data->max_pitch >> 2;
> +			} else {
> +				drm->mode_config.max_width = 4096;
> +				drm->mode_config.max_height = 4096;
> +			}
> +
>   			if (i == 0 && priv_n->data->main_len) {
>   				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
>   							  priv_n->data->main_len, j,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index d2efd715699f..3d6c1f58a7ec 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -41,6 +41,7 @@ struct mtk_mmsys_driver_data {
>   	bool shadow_register;
>   	unsigned int mmsys_id;
>   	unsigned int mmsys_dev_num;
> +	u32 max_pitch;

Is it expected to have a max_pitch > 0xFFFF on newer SoCs?
If not, please change this to u16.

Regards,
Angelo

