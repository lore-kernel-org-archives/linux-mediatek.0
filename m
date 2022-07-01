Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 08:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjPShDBHHP87Imcfwdo2tTquxXkaxpf5jj9N3B/J1Sw=; b=uSwh5Y+WFfogrshvSwLBZcYj00
	rq3jykRTf47KMlGKYlxiuHynpDYpyAI3u9ZeKaJSA+jQKOZB5DJvF6Z7H8120oNxTVQLB6qthIuDO
	NWqR6CooUjITK2p83nXA07BrKO3fyewbuCyB1q6Ppsf0eFSZuc4mY4GCHq8Gmc/OAcaZoZtuWy1WT
	5yd4aL23A4LrwaYUdsq0d20TXhRssNdG5BMZLmAGvQL87vEFPTjadotbLIxX4uobKn4y+8z1xZ7Vz
	zmMdCfWOBXhZHc93nDnT9R1qkmKKaJT778mhxpQCrRp3BUTVp7aSyXfxZbwNLh9TpKidmY/9mU43t
	ghThNVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BnH-003YxY-7b; Fri, 01 Jul 2022 08:14:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Bmz-003Ypb-HK; Fri, 01 Jul 2022 08:14:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3FA956601974;
	Fri,  1 Jul 2022 09:14:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656663247;
	bh=oX88CugqBfAMEuhfwgO7WJ1IBMMlTDVxIs1zooaswFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OrhyVBuFvFKAcT64g3zBqktpN6W6lmU6Z7vqgOE+kfn63T3GUrTPJf1Brz6hpDrus
	 zY/MMpdHKye4D1rc5SHWwbNyJ/rM4S3NJsgL9538JL85q1d8o+KvsX4uW+bdplDH+d
	 k9wzv6YqD1Ac+hOJ016TwfphmemQzRLsXI8D91pJc4Sn9vzQZP+dGY0uouTZny/68V
	 gYpiHqbS/wmnq6esnVTOtYzOsdC73JJGMzMJ4FQKztfvN4ZgrbPK8DUFZ2w5/N7Tv3
	 Kt9ACJ1fKb8l8eYtcMzZVJIfKWPpuNCQkyR2LQ6yNw3U8qT3IHl2+GS5UFAuBCxHye
	 5WSCex46vm2uQ==
Message-ID: <5971f465-9514-d830-8467-e722475ecc7f@collabora.com>
Date: Fri, 1 Jul 2022 10:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 06/10] drm/mediatek: Add MT8195 External DisplayPort
 support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
 <20220701062808.18596-7-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701062808.18596-7-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_011409_835726_8C915B81 
X-CRM114-Status: GOOD (  20.21  )
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

Il 01/07/22 08:28, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds External DisplayPort support to the mt8195 eDP driver.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c     | 197 +++++++++++++++++++++-----
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h |   1 +
>   2 files changed, 161 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index b672d5a6f5bd..c3be97dd055c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -105,6 +105,7 @@ struct mtk_dp {
>   	struct regmap *regs;
>   
>   	bool enabled;
> +	bool has_fec;

You're introducing this has_fec variable here....

>   
>   	struct drm_connector *conn;
>   };


> @@ -1018,6 +1074,8 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
>   	mtk_dp->info.depth = DP_MSA_MISC_8_BPC;
>   	memset(&mtk_dp->info.timings, 0, sizeof(struct mtk_dp_timings));
>   	mtk_dp->info.timings.frame_rate = 60;
> +
> +	mtk_dp->has_fec = false;

.... setting it as false here ....

>   }
>   
>   static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)

> @@ -1498,15 +1562,38 @@ static int mtk_dp_init_port(struct mtk_dp *mtk_dp)
>   static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   {
>   	struct mtk_dp *mtk_dp = dev;
> +	int event;
>   	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
>   
> +	event = mtk_dp_plug_state(mtk_dp) ?
> +		connector_status_connected : connector_status_disconnected;
> +
> +	if (event < 0)
> +		return IRQ_HANDLED;
> +
> +	dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");

P.S.: This should be a dev_dbg().

> +	drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> +
>   	if (mtk_dp->train_info.cable_state_change) {
>   		mtk_dp->train_info.cable_state_change = false;
>   
> -		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> -				   DP_PWR_STATE_MASK);
> -		drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
> +		if (!mtk_dp->train_info.cable_plugged_in) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +
> +			mtk_dp_initialize_priv_data(mtk_dp);
> +			mtk_dp_set_idle_pattern(mtk_dp, true);
> +			if (mtk_dp->has_fec)

...and you're checking it here, but there's nothing ever setting that as true!

Is there anything you forgot? :-)

Cheers,
Angelo

