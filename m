Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B03C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 03:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQepwmJn2g7GbWQuC1FSIk0kvRpvf/knCO5kkNwMuuk=; b=gqxfjVavvGWDai
	DtUzJFTZhk1cwLK/z5Ele3WI4FmbC6G2t/KAe0PXuuH8iqIisBqQX9+tBShRavvL2H9FVHXkYC+qh
	m+zBPo4bY/Z6m/sKnqmCE5rxX1dYGe1n2Ysno2WE8ecWLtSCVAB8BYOxO7GSkfNw+9VA9KtikPFki
	7VRGsObp4XobHOtkjPFwFmSi8zae13oGsNnNJFHN7vN2gaj8Wf/8TXtWkwm/1A3D/VHNVLMMXD2Sn
	yFnSBQZFDm/AWITJ0gN0INX+FbfODu54GSmoQ1ian9xGoGEXaMM1+tiXrkfO9RgPiqAV4gsUVoMSn
	StKrulTyWn1frEXQFatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrAmZ-00GxMI-Ur; Wed, 18 May 2022 03:55:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrAmX-00GxLa-5O; Wed, 18 May 2022 03:55:30 +0000
X-UUID: 4acf4e65b6ac43a6b735c13c80042c28-20220517
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:874606d9-6e31-4c0d-968e-1b4f54d45d3c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:6b5194e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 4acf4e65b6ac43a6b735c13c80042c28-20220517
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1509684421; Tue, 17 May 2022 20:55:25 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 20:55:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 11:55:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 18 May 2022 11:55:21 +0800
Message-ID: <cfa87a23495fe5d72c7deed49162b026466cb68a.camel@mediatek.com>
Subject: Re: [PATCH v6, 3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, "# 6 . 6 . x : b255d51e3967 : sched :
 Modify dsi funcs to atomic	  operations" <stable@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 18 May 2022 11:55:21 +0800
In-Reply-To: <1652337012-9053-4-git-send-email-xinlei.lee@mediatek.com>
References: <1652337012-9053-1-git-send-email-xinlei.lee@mediatek.com>
 <1652337012-9053-4-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_205529_257064_26ABF2DD 
X-CRM114-Status: GOOD (  24.38  )
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

Hi, Xinlei:

On Thu, 2022-05-12 at 14:30 +0800, xinlei.lee@mediatek.com wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> To comply with the panel sequence, hold the mipi signal to LP00
> before the dcs cmds transmission,
> and pull the mipi signal high from LP00 to LP11 until the start of
> the dcs cmds transmission.
> The normal panel timing is :
> (1) pp1800 DC pull up
> (2) avdd & avee AC pull high
> (3) lcm_reset pull high -> pull low -> pull high
> (4) Pull MIPI signal high (LP11) -> initial code -> send video
> data(HS mode)
> The power-off sequence is reversed.
> If dsi is not in cmd mode, then dsi will pull the mipi signal high in
> the mtk_output_dsi_enable function.
> The delay in lane_ready func is the reaction time of dsi_rx after
> pulling up the mipi signal.
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge
> API")
> 
> Cc: <stable@vger.kernel.org> # 6.6.x: b255d51e3967: sched: Modify dsi
> funcs to atomic operations
> Cc: <stable@vger.kernel.org> # 6.6.x: 72c69c977502: sched: Separate
> poweron/poweroff from enable/disable and define new funcs
> Cc: <stable@vger.kernel.org> # 6.6.x

This patch looks good to me, but do you want to 'back' port this patch
to Linux version 6.6?

Regards,
CK

> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d9a6b928dba8..25e84d9426bf 100644
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
> @@ -661,18 +662,11 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>  	mtk_dsi_reset_engine(dsi);
>  	mtk_dsi_phy_timconfig(dsi);
>  
> -	mtk_dsi_rxtx_control(dsi);
> -	usleep_range(30, 100);
> -	mtk_dsi_reset_dphy(dsi);
>  	mtk_dsi_ps_control_vact(dsi);
>  	mtk_dsi_set_vm_cmd(dsi);
>  	mtk_dsi_config_vdo_timing(dsi);
>  	mtk_dsi_set_interrupt_enable(dsi);
>  
> -	mtk_dsi_clk_ulp_mode_leave(dsi);
> -	mtk_dsi_lane0_ulp_mode_leave(dsi);
> -	mtk_dsi_clk_hs_mode(dsi, 0);
> -
>  	return 0;
>  err_disable_engine_clk:
>  	clk_disable_unprepare(dsi->engine_clk);
> @@ -701,6 +695,23 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> *dsi)
>  	clk_disable_unprepare(dsi->digital_clk);
>  
>  	phy_power_off(dsi->phy);
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
> +		/* The reaction time after pulling up the mipi signal
> for dsi_rx */
> +	}
>  }
>  
>  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> @@ -708,6 +719,7 @@ static void mtk_output_dsi_enable(struct mtk_dsi
> *dsi)
>  	if (dsi->enabled)
>  		return;
>  
> +	mtk_dsi_lane_ready(dsi);
>  	mtk_dsi_set_mode(dsi);
>  	mtk_dsi_clk_hs_mode(dsi, 1);
>  
> @@ -1017,6 +1029,8 @@ static ssize_t mtk_dsi_host_transfer(struct
> mipi_dsi_host *host,
>  	if (MTK_DSI_HOST_IS_READ(msg->type))
>  		irq_flag |= LPRX_RD_RDY_INT_FLAG;
>  
> +	mtk_dsi_lane_ready(dsi);
> +
>  	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
>  	if (ret)
>  		goto restore_dsi_mode;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
