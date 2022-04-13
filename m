Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DCAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 08:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EImR1u9GGAn8Foo947R3lHI6K5AR3aImgfqfPaeHTxc=; b=gdVsl4ZhlDxjMF
	Ucelz15hG3xcQQmi74l1bfgXIZM/VeoKQmc5nR6zH2Go7LUV06XVNLZ+3XfibbU/qp6TqiMeg+4Fm
	PJluYnaRakWZ9wwiPo0ohh/NaZXCr217ivgoNh60ysAk8bBwjfkGZ065hORmjFsBUWE2iyKnkn+cM
	i76ExM9h3n0YfVycqCVwFgAdNg6ixFhr5/tOcffgR18F/42yGAO/AYpwKjiz++QvRVRaEzrPpTQd7
	CHbkSRo+EQTROdIWWUdYf3UDwuU1VjT09ML6QztVj82u/HysM3yYzSrhVvcYkxfa7mWpIjfyc+Mhu
	ioNZawP/6nd28fXJV2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYZh-0008PX-Rh; Wed, 13 Apr 2022 08:42:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYZH-0008B7-Ik; Wed, 13 Apr 2022 08:41:42 +0000
X-UUID: f0c2fbbe74284be2a014febd23d3b4ff-20220413
X-UUID: f0c2fbbe74284be2a014febd23d3b4ff-20220413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 373274467; Wed, 13 Apr 2022 01:41:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 01:31:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 16:31:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 16:31:42 +0800
Message-ID: <fb3d631cd1e86ee12dff5ee3bc1b82b12cb2cb10.camel@mediatek.com>
Subject: Re: [PATCH v4, 3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 13 Apr 2022 16:31:42 +0800
In-Reply-To: <1649644308-8455-4-git-send-email-xinlei.lee@mediatek.com>
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-4-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_014139_656283_1925E88B 
X-CRM114-Status: GOOD (  21.01  )
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

On Mon, 2022-04-11 at 10:31 +0800, xinlei.lee@mediatek.com wrote:
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
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge
> API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index cf76c53a1af6..9ad6f08c8bfe 100644
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
> @@ -689,6 +683,23 @@ static void mtk_dsi_poweroff(struct mtk_dsi
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
> +	} else
> +		DRM_DEBUG("The dsi_lane is ready\n");
>  }
>  
>  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> @@ -696,6 +707,7 @@ static void mtk_output_dsi_enable(struct mtk_dsi
> *dsi)
>  	if (dsi->enabled)
>  		return;
>  
> +	mtk_dsi_lane_ready(dsi);
>  	mtk_dsi_set_mode(dsi);
>  	mtk_dsi_clk_hs_mode(dsi, 1);
>  
> @@ -1001,6 +1013,8 @@ static ssize_t mtk_dsi_host_transfer(struct
> mipi_dsi_host *host,
>  	if (MTK_DSI_HOST_IS_READ(msg->type))
>  		irq_flag |= LPRX_RD_RDY_INT_FLAG;
>  
> +	mtk_dsi_lane_ready(dsi);

In [1], YT has move mtk_dsi_lane_ready() before panel prepare for dsi-
>panel case. Now you move mtk_dsi_lane_ready() after panel prepare,
this may break dsi->panel case. Please provide a solution for both
case.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/mediatek/mtk_dsi.c?h=v5.18-rc2&id=0707632b5bacc490f58dfbad741d586c06595ff3

Regards,
CK

> +
>  	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
>  	if (ret)
>  		goto restore_dsi_mode;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
