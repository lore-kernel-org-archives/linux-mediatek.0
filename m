Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3596C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIC1WJEzRx0biR1jlnaOGcvHz3drv3jxx9gpBp4lV4E=; b=djbtOpQXW5CmZb1Jjck/pjgFcJ
	5lzxuj6HX7y8Z1HFWFO/aBe4PWUrNyG7E7ZknhOdvsUurSTAKlKgj1ZlSUBefggomF36kKadEJ2bo
	kXYqZum9Evx2ouilxxcSjxpYNTYq9DGqRyDnk3hTTBHFTIEDrELQMyLcSOu46sh6uV589s7WTDns6
	vD/U84+Pz2hcX4qwT9r0sy9kX9LSzef9N5lSyUWZ2bvKCLZ7hb5EEc0SkciRO9NDTCKBbkMR1CnKK
	ZQtVM8cxuPSFnxPk1f4AFW5zo4E2BO1qYrmdNQIDhe25NsH5o22aw8ZxztqbZ0xV+SlW/KOJHunDu
	iVoUm7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZz8-00AlBf-L8; Thu, 21 Jul 2022 17:29:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZyx-00Al40-0W; Thu, 21 Jul 2022 17:29:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 378316601ABB;
	Thu, 21 Jul 2022 18:29:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658424541;
	bh=ZwBOqbXQCiDJrGaaYB3nSbHLVzztmKxAsw+KrM0BKjE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=H4cpsF3fvmDf6Py8DbatCE8t/PKBhBzn+rpNJbPfCKhWbWJt429xCGiQroxcd/IXV
	 vdBjvxCzc/7oXEcOzDFngg1PA9XuIwrWU2zFhYcuRlkYmPtcAtBDYG/1PvtdO2s7rK
	 uIRCHpfMdCY7aP6HT6S9d5piuwtY71nMgB8svJokMwtel7+hnVr7knD20X85UOniuy
	 TmW5SU4NAglwuyYv91c5/sYWV1nqS8ujxPjsCRGFqfNdeadrvqqvN+/chKN902CEBL
	 aJmbJWkQqWgqTZFK4vZ14WrFJmDkZ0ZJhLg42CJ/eviX/atTknDZmL/WjFvIUvkykS
	 TSLf0zx89wU4g==
Message-ID: <7a5b9c8a-f074-e6ce-d458-61068452e43f@collabora.com>
Date: Thu, 21 Jul 2022 19:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 jitao.shi@mediatek.com
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
 <1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com>
Content-Language: en-US
In-Reply-To: <1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_102903_352693_21BFD8E3 
X-CRM114-Status: GOOD (  26.66  )
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

Il 20/05/22 04:00, xinlei.lee@mediatek.com ha scritto:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> In order to match the changes of "Use the drm_panel_bridge API",
> the poweron/poweroff of dsi is extracted from enable/disable and
> defined as new funcs (atomic_pre_enable/atomic_post_disable).
> 
> Since dsi_poweron is moved from dsi_enable to pre_enable function, in
> order to avoid poweron failure, the operation of dsi register fails to
> cause bus hang. Therefore, the protection mechanism is added to the
> dsi_enable function.
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Hello Xinlei, CK, maintainers:

This patch is breaking machines that are using a DSI->DisplayPort bridge (like
the ANX7625 chip), but that's not the main issue.

----> I have never given a Reviewed-by tag for this commit <----

It's true I've given my tag for an older version [1] of this one, which was *not*
using atomic_* callbacks and that one worked fine (which is why I gave you
my R-b tag for it).

You have changed commits in this series to use atomic_(pre_)enable callbacks
but kept my tag, which is seriously wrong - and even more, because it's actually
breaking display support for a generous number of Chromebooks upstream.


Please be careful next time and ask for a new review when you make substantial
changes to your commits.


Anyway, I have already sent a fix for this situation, please look at [2].

Regards,
Angelo

[1]: 
https://patchwork.kernel.org/project/linux-mediatek/patch/1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com/

[2]: 
https://lore.kernel.org/lkml/20220721172727.14624-1-angelogioacchino.delregno@collabora.com/T/#u

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 53 +++++++++++++++++++-----------
>   1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index f880136cec09..d9a6b928dba8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -691,16 +691,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>   	if (--dsi->refcount != 0)
>   		return;
>   
> -	/*
> -	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> -	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
> -	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
> -	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
> -	 * after dsi is fully set.
> -	 */
> -	mtk_dsi_stop(dsi);
> -
> -	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
>   	mtk_dsi_reset_engine(dsi);
>   	mtk_dsi_lane0_ulp_mode_enter(dsi);
>   	mtk_dsi_clk_ulp_mode_enter(dsi);
> @@ -715,17 +705,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>   
>   static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
>   {
> -	int ret;
> -
>   	if (dsi->enabled)
>   		return;
>   
> -	ret = mtk_dsi_poweron(dsi);
> -	if (ret < 0) {
> -		DRM_ERROR("failed to power on dsi\n");
> -		return;
> -	}
> -
>   	mtk_dsi_set_mode(dsi);
>   	mtk_dsi_clk_hs_mode(dsi, 1);
>   
> @@ -739,7 +721,16 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
>   	if (!dsi->enabled)
>   		return;
>   
> -	mtk_dsi_poweroff(dsi);
> +	/*
> +	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> +	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
> +	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
> +	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
> +	 * after dsi is fully set.
> +	 */
> +	mtk_dsi_stop(dsi);
> +
> +	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
>   
>   	dsi->enabled = false;
>   }
> @@ -776,13 +767,37 @@ static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>   {
>   	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>   
> +	if (dsi->refcount == 0)
> +		return;
> +
>   	mtk_output_dsi_enable(dsi);
>   }
>   
> +static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					     struct drm_bridge_state *old_bridge_state)
> +{
> +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> +	int ret;
> +
> +	ret = mtk_dsi_poweron(dsi);
> +	if (ret < 0)
> +		DRM_ERROR("failed to power on dsi\n");
> +}
> +
> +static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +					       struct drm_bridge_state *old_bridge_state)
> +{
> +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	mtk_dsi_poweroff(dsi);
> +}
> +
>   static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>   	.attach = mtk_dsi_bridge_attach,
>   	.atomic_disable = mtk_dsi_bridge_atomic_disable,
>   	.atomic_enable = mtk_dsi_bridge_atomic_enable,
> +	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
> +	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
>   	.mode_set = mtk_dsi_bridge_mode_set,
>   };
>   

