Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADA0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PL5QpqC90ZYJOImbiAdPCjXGfaAuRz/uWVFNoXmk+9k=; b=Cvm64X9XaTFGkc
	hJcNsF1ekgpunMpXbipjfePD0LahmjeN2TZ6s4TQ5YitCArcFxGyQucramVUP9GoWtTmTEHoF2/Xs
	bFB66YQvwwDSF7KXDgjEuU4RkZsPnFoeLRxPnae0DSwXQKu8tfh6F4LWwzkmIGfLX52wFY78KoJqP
	wbkPsMuph7xJhXvVqD2eZfylFh+37masEw6eVbNcAeyYKbJ5ix1SYdniegJjokX2yppUwnR+eVFQJ
	fdgcq6C/EZJrMpU7OiO1Qg9KLv3WYK/wYIs60sXT0mcyXPqFzYG7EnB8gwMj1yN34/EzPdWqNi745
	Q42uB5nLwLckw+v22B1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWbFg-00Aec3-R4; Tue, 22 Mar 2022 09:56:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWbFU-00Aeaj-Jn; Tue, 22 Mar 2022 09:56:22 +0000
X-UUID: 54ba5df8267249ed82b4b7322955f73a-20220322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=F4c4bGINPd9DLBnDYjrXvlknrqcZVMQ3Aq3YpOQb/Js=; 
 b=LwVWkZK3MWcRoIxVA2lBavpgBHMzUG+j46Sso76flmniyCGqseHjvSGO6kQmXZALhOJKRhk8D6F471qAmW9WVDJMjhclEoHeQEjjCQuDEIFudjtl+hoe8eVsUIP2hwfWEkETyrUspCBHQPg/m9da4KSK1nUw4gmhKzTEkGkzoUo=;
X-UUID: 54ba5df8267249ed82b4b7322955f73a-20220322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2093622373; Tue, 22 Mar 2022 02:56:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 02:46:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 17:46:11 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 17:46:11 +0800
Message-ID: <be6c51b69651edf0d9c42c6e1894724ed391fa34.camel@mediatek.com>
Subject: Re: [PATCH v3,3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Tue, 22 Mar 2022 17:46:31 +0800
In-Reply-To: <8b331befede093265cd9fc0773000c1bf715a2c8.camel@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-4-git-send-email-xinlei.lee@mediatek.com>
 <8b331befede093265cd9fc0773000c1bf715a2c8.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_025620_699518_743E2557 
X-CRM114-Status: GOOD (  29.60  )
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

On Thu, 2022-03-17 at 20:06 +0800, Rex-BC Chen wrote:
> Hello Xinlei,
> 
> On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > To comply with the panel sequence, hold the mipi signal to LP00 
> 
> Could you provide a example panel power sequence to let me understand
> that?
> Maybe you can put them in commit message.
> 
> > before the dcs cmds transmission,
> > and pull the mipi signal high from LP00 to LP11 until the start of
> > the dcs cmds transmission.
> 
> Maybe you can try to write as:
> To comply with...
> - Hold the mipi signal...
> - Pul the miip signal high....
> 
> > If dsi is not in cmd mode, then dsi will pull the mipi signal high
> > in
> > the mtk_output_dsi_enable function.
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge
> > API")
> > 
> 
> Can you remove this blank line?
> 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 31 +++++++++++++++++++++++---
> > --
> > --
> >  1 file changed, 24 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index e33caaca11a7..b509d59235e2 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -203,6 +203,7 @@ struct mtk_dsi {
> >  	struct mtk_phy_timing phy_timing;
> >  	int refcount;
> >  	bool enabled;
> > +	bool lanes_ready;
> >  	u32 irq_data;
> >  	wait_queue_head_t irq_wait_queue;
> >  	const struct mtk_dsi_driver_data *driver_data;
> > @@ -654,13 +655,6 @@ static int mtk_dsi_poweron(struct mtk_dsi
> > *dsi)
> >  	mtk_dsi_config_vdo_timing(dsi);
> >  	mtk_dsi_set_interrupt_enable(dsi);
> >  
> > -	mtk_dsi_rxtx_control(dsi);
> > -	usleep_range(30, 100);
> > -	mtk_dsi_reset_dphy(dsi);
> > -	mtk_dsi_clk_ulp_mode_leave(dsi);
> > -	mtk_dsi_lane0_ulp_mode_leave(dsi);
> > -	mtk_dsi_clk_hs_mode(dsi, 0);
> > -
> >  	return 0;
> >  err_disable_engine_clk:
> >  	clk_disable_unprepare(dsi->engine_clk);
> > @@ -689,6 +683,8 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >  	clk_disable_unprepare(dsi->digital_clk);
> >  
> >  	phy_power_off(dsi->phy);
> > +
> > +	dsi->lanes_ready = false;
> >  }
> >  
> >  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> > @@ -696,6 +692,16 @@ static void mtk_output_dsi_enable(struct
> > mtk_dsi
> > *dsi)
> >  	if (dsi->enabled)
> >  		return;
> >  
> > +	if (!dsi->lanes_ready) {
> > +		dsi->lanes_ready = true;
> > +		mtk_dsi_rxtx_control(dsi);
> > +		usleep_range(30, 100);
> > +		mtk_dsi_reset_dphy(dsi);
> > +		mtk_dsi_clk_ulp_mode_leave(dsi);
> > +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> > +		mtk_dsi_clk_hs_mode(dsi, 0);
> > +	}
> > +
> >  	mtk_dsi_set_mode(dsi);
> >  	mtk_dsi_clk_hs_mode(dsi, 1);
> >  
> > @@ -995,6 +1001,17 @@ static ssize_t mtk_dsi_host_transfer(struct
> > mipi_dsi_host *host,
> >  	if (MTK_DSI_HOST_IS_READ(msg->type))
> >  		irq_flag |= LPRX_RD_RDY_INT_FLAG;
> >  
> > +	if (!dsi->lanes_ready) {
> > +		dsi->lanes_ready = true;
> > +		mtk_dsi_rxtx_control(dsi);
> > +		usleep_range(30, 100);
> > +		mtk_dsi_reset_dphy(dsi);
> > +		mtk_dsi_clk_ulp_mode_leave(dsi);
> > +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> > +		mtk_dsi_clk_hs_mode(dsi, 0);
> 
> The drivers are the same with previous modification.
> I think you can use a funtion for them?
> 
> > +		msleep(20);
> 
> Why delay 20ms but not in mtk_output_dsi_enable?
> 
> BRs,
> Rex
> > +	}
> > +
> >  	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
> >  	if (ret)
> >  		goto restore_dsi_mode;
> 
> 

Hi rex:

Thanks for your review.

1.The normal panel timing is as follows (I will add to the commit
message in the next version):
(1) pp1800 DC pull up
(2) avdd & avee AC pull high
(3) lcm_reset pull high -> pull low -> pull high
(4) Pull MIPI signal high (LP11) -> initial code -> send video data(HS
mode)
The power-off sequence is reversed.

2.
The 20ms delay in dsi_host_transfer is because dsi needs to give
dsi_rx(panel) a reaction time after pulling up the mipi signal.
If you suggest encapsulating it as a function I will add a delay to
mtk_output_dsi_enable in the next version as well.
Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
