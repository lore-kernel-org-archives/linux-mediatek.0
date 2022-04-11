Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1D3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 09:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVuQlt+oshPhfUVKFHLLvVmyVRMOO2gMhXk+sA5obqA=; b=FFq0zw4JCH7vj3
	P0w5mu/FE7M0Vs8Owi3DgjvhJfmWg1wQ9zIldkOAMhhZBaZYvUnPhYWUeL88OydnB/+7LPPFRaZF1
	q4kDO6U+ZA8okyK8ZTzK4RNsOsNCvH34ZvdqdZKtfE3CkWgvd5kTQ+Xmiwj3MPM/INkcelAcLhvDJ
	lz73JuIrrIIJYLF/zU/3LJxSyzKQLT3WejIjClY7xPc9e8NRvpkqAvb02Rc5EVOv2uaNaXPLhwOOB
	sUtf97u5o0kxgmOHVej23gNDmFgcYz5yY03xm5+GdTZQ0ACeXTvuiXbUOi1o6QqRDAsqsNHW76kgF
	n8wCgg0NA6yeHSOTTx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndq5d-007nn8-9e; Mon, 11 Apr 2022 09:12:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndq1M-007lW0-19; Mon, 11 Apr 2022 09:07:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3E1291F43465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649668058;
 bh=/BxB8I3hVWgWdEz3fBOpIt5kSfdx7FY5Q3jtn/JageQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iP8/l6eZFGMBCI+fYqrI9frunX10G/bsIaDU5ibF43HYTwGMg/eZrlGuS7KNvP77y
 M4BrjilcLZd8g+DFp6+yyyCUqRa6SnZN6PtuPBdsGtP6jVkXqV+zeL+w7EnLIj0WaC
 illhVbc+nbX0wwQqbS/uL20X+VwCyHmQFy/sJJTpx8/8gZCNZ6HT5UxiOWdbLpe5tg
 Y83tnFtNMIzJHLEPLJJTbtXAVMQt8n6nuNBAAqGXut6PYTr7CHhyCMSAY72Xasjz4g
 v2dlo1xwHlcYiCbGx/sBByiIr5n341sEMhspVpxMk8nITcHzhWZpVFQ5IWjbgfTnRQ
 aQ5DyS10zKz4A==
Message-ID: <7a4e5afb-6947-ed7f-8555-c7402aaa3a29@collabora.com>
Date: Mon, 11 Apr 2022 11:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4, 3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 rex-bc.chen@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jitao.shi@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-4-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1649644308-8455-4-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020740_276159_397FC3E2 
X-CRM114-Status: GOOD (  18.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/04/22 04:31, xinlei.lee@mediatek.com ha scritto:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> To comply with the panel sequence, hold the mipi signal to LP00 before the dcs cmds transmission,
> and pull the mipi signal high from LP00 to LP11 until the start of the dcs cmds transmission.
> The normal panel timing is :
> (1) pp1800 DC pull up
> (2) avdd & avee AC pull high
> (3) lcm_reset pull high -> pull low -> pull high
> (4) Pull MIPI signal high (LP11) -> initial code -> send video data(HS mode)
> The power-off sequence is reversed.
> If dsi is not in cmd mode, then dsi will pull the mipi signal high in the mtk_output_dsi_enable function.
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 28 +++++++++++++++++++++-------
>   1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index cf76c53a1af6..9ad6f08c8bfe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -203,6 +203,7 @@ struct mtk_dsi {
>   	struct mtk_phy_timing phy_timing;
>   	int refcount;
>   	bool enabled;
> +	bool lanes_ready;
>   	u32 irq_data;
>   	wait_queue_head_t irq_wait_queue;
>   	const struct mtk_dsi_driver_data *driver_data;
> @@ -654,13 +655,6 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>   	mtk_dsi_config_vdo_timing(dsi);
>   	mtk_dsi_set_interrupt_enable(dsi);
>   
> -	mtk_dsi_rxtx_control(dsi);
> -	usleep_range(30, 100);
> -	mtk_dsi_reset_dphy(dsi);
> -	mtk_dsi_clk_ulp_mode_leave(dsi);
> -	mtk_dsi_lane0_ulp_mode_leave(dsi);
> -	mtk_dsi_clk_hs_mode(dsi, 0);
> -
>   	return 0;
>   err_disable_engine_clk:
>   	clk_disable_unprepare(dsi->engine_clk);
> @@ -689,6 +683,23 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>   	clk_disable_unprepare(dsi->digital_clk);
>   
>   	phy_power_off(dsi->phy);
> +
> +	dsi->lanes_ready = false;
> +}
> +
> +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> +{
> +	if (!dsi->lanes_ready) {
> +		dsi->lanes_ready = true;
> +		mtk_dsi_rxtx_control(dsi);
> +		usleep_range(30, 100);
> +		mtk_dsi_reset_dphy(dsi);
> +		mtk_dsi_clk_ulp_mode_leave(dsi);
> +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> +		mtk_dsi_clk_hs_mode(dsi, 0);
> +		msleep(20);

This is a very long sleep, which wasn't present before this change.
Please document the reasons why we need this 20ms sleep with a comment
in the code.

Regards,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
