Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 12:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9hb0HbvkEJS7xqxA1yDoNMCo4VMOszE11VTnNRUvPE=; b=07jt1ESXMRArto
	6lGAoznlSyg24shEv0/9g0xGLEv/3wbAxXl3wtDtN3LqK2OXrc4KsAhNPmSzXCOvy3VwqydwLdyVV
	sq1PtFzfE0/frhlHc6PkUSXhyd6rWA2vPL3RycorUIgKsFBJwZSRZbuSkfj7RkI+tLKG7BZVcG2YN
	d4nllqspJzkxrd/t+CS7RjNw+SN0Tm8355h5C3+GKV+BtHOr/yiWURQKfvpl5SPMXgxGMK73tD4Bf
	tqy53haONzSpW4NDPiesSfUSxEtVXfYM8xtlMtlMEaegtO/VYGqgk762sJhEXKKGNwbmESBApdlDg
	xOmTshB17VpN2vDpLwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUp77-00G1qO-Gs; Thu, 17 Mar 2022 12:20:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUou7-00Fx4H-Ia; Thu, 17 Mar 2022 12:06:57 +0000
X-UUID: 54677a2288fd4dbb8406dfce276089b9-20220317
X-UUID: 54677a2288fd4dbb8406dfce276089b9-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1861350446; Thu, 17 Mar 2022 05:06:48 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 05:06:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Mar 2022 20:06:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 20:06:44 +0800
Message-ID: <8b331befede093265cd9fc0773000c1bf715a2c8.camel@mediatek.com>
Subject: Re: [PATCH v3,3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Thu, 17 Mar 2022 20:06:44 +0800
In-Reply-To: <1647503611-13144-4-git-send-email-xinlei.lee@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-4-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_050655_674233_BB9E9C5D 
X-CRM114-Status: GOOD (  21.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Xinlei,

On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> To comply with the panel sequence, hold the mipi signal to LP00 

Could you provide a example panel power sequence to let me understand
that?
Maybe you can put them in commit message.

> before the dcs cmds transmission,
> and pull the mipi signal high from LP00 to LP11 until the start of
> the dcs cmds transmission.

Maybe you can try to write as:
To comply with...
- Hold the mipi signal...
- Pul the miip signal high....

> If dsi is not in cmd mode, then dsi will pull the mipi signal high in
> the mtk_output_dsi_enable function.
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge
> API")
> 

Can you remove this blank line?

> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 31 +++++++++++++++++++++++-----
> --
>  1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index e33caaca11a7..b509d59235e2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -203,6 +203,7 @@ struct mtk_dsi {
>  	struct mtk_phy_timing phy_timing;
>  	int refcount;
>  	bool enabled;
> +	bool lanes_ready;
>  	u32 irq_data;
>  	wait_queue_head_t irq_wait_queue;
>  	const struct mtk_dsi_driver_data *driver_data;
> @@ -654,13 +655,6 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>  	mtk_dsi_config_vdo_timing(dsi);
>  	mtk_dsi_set_interrupt_enable(dsi);
>  
> -	mtk_dsi_rxtx_control(dsi);
> -	usleep_range(30, 100);
> -	mtk_dsi_reset_dphy(dsi);
> -	mtk_dsi_clk_ulp_mode_leave(dsi);
> -	mtk_dsi_lane0_ulp_mode_leave(dsi);
> -	mtk_dsi_clk_hs_mode(dsi, 0);
> -
>  	return 0;
>  err_disable_engine_clk:
>  	clk_disable_unprepare(dsi->engine_clk);
> @@ -689,6 +683,8 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>  	clk_disable_unprepare(dsi->digital_clk);
>  
>  	phy_power_off(dsi->phy);
> +
> +	dsi->lanes_ready = false;
>  }
>  
>  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> @@ -696,6 +692,16 @@ static void mtk_output_dsi_enable(struct mtk_dsi
> *dsi)
>  	if (dsi->enabled)
>  		return;
>  
> +	if (!dsi->lanes_ready) {
> +		dsi->lanes_ready = true;
> +		mtk_dsi_rxtx_control(dsi);
> +		usleep_range(30, 100);
> +		mtk_dsi_reset_dphy(dsi);
> +		mtk_dsi_clk_ulp_mode_leave(dsi);
> +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> +		mtk_dsi_clk_hs_mode(dsi, 0);
> +	}
> +
>  	mtk_dsi_set_mode(dsi);
>  	mtk_dsi_clk_hs_mode(dsi, 1);
>  
> @@ -995,6 +1001,17 @@ static ssize_t mtk_dsi_host_transfer(struct
> mipi_dsi_host *host,
>  	if (MTK_DSI_HOST_IS_READ(msg->type))
>  		irq_flag |= LPRX_RD_RDY_INT_FLAG;
>  
> +	if (!dsi->lanes_ready) {
> +		dsi->lanes_ready = true;
> +		mtk_dsi_rxtx_control(dsi);
> +		usleep_range(30, 100);
> +		mtk_dsi_reset_dphy(dsi);
> +		mtk_dsi_clk_ulp_mode_leave(dsi);
> +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> +		mtk_dsi_clk_hs_mode(dsi, 0);

The drivers are the same with previous modification.
I think you can use a funtion for them?

> +		msleep(20);

Why delay 20ms but not in mtk_output_dsi_enable?

BRs,
Rex
> +	}
> +
>  	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
>  	if (ret)
>  		goto restore_dsi_mode;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
