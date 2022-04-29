Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EDCC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 07:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ergTLr5EhusxOp5xddF45PJi3yTrOnb12R4hacnXvUo=; b=h9FMHe1/UCvjrk
	D5EmWh5lCe0etk352TUMP+yvQyp1aYYC9Dy6idFJ45EGnLdugHobqut1RM4bmI/iwke2HDUSuAg1f
	+S0FCIKXgh8x29oJ/lEVt5tuO0hQOM0RjVbyaQKWZMeX9ND1XPzqUzJeRrMNpeddlnn6sX/G89tcO
	rLtFPBqroyFJb3KSjFW85nl5DPTY0dFoHhJ+Qo5X7D++ls4az0zRpSu1ZUy+cEH0c5Mwq8B0Nnvid
	s0nCFmRe5YEFJekzCMNNgCF6sAgAtPWxcX3nTpbfj2bYxtZNJFTfCnXQJ/xxZ4BHgd1gbl3Ezf0Wo
	KXW6vk0ZUCo02B3Vum0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkL6x-009z8u-JK; Fri, 29 Apr 2022 07:32:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkL6b-009yy6-7W; Fri, 29 Apr 2022 07:31:59 +0000
X-UUID: f92bb20576534942866e42237d926462-20220429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8b2a11e1-12b2-4a62-bbd8-47ef7895355f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:439fefc6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f92bb20576534942866e42237d926462-20220429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 300797239; Fri, 29 Apr 2022 00:31:50 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 00:24:35 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 15:24:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 15:24:34 +0800
Message-ID: <2003dbbd3243f935788316560bf64196bb97ffe4.camel@mediatek.com>
Subject: Re: [PATCH v4, 3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: CK Hu <ck.hu@mediatek.com>
To: xinlei.lee <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 29 Apr 2022 15:24:34 +0800
In-Reply-To: <7a1f4de98a349d0910d45a92d09d112773cd5fc0.camel@mediatek.com>
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-4-git-send-email-xinlei.lee@mediatek.com>
 <fb3d631cd1e86ee12dff5ee3bc1b82b12cb2cb10.camel@mediatek.com>
 <7a1f4de98a349d0910d45a92d09d112773cd5fc0.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_003157_334010_F007F6E4 
X-CRM114-Status: GOOD (  33.17  )
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

On Fri, 2022-04-15 at 09:58 +0800, xinlei.lee wrote:
> On Wed, 2022-04-13 at 16:31 +0800, CK Hu wrote:
> > Hi, Xinlei:
> > 
> > On Mon, 2022-04-11 at 10:31 +0800, xinlei.lee@mediatek.com wrote:
> > > From: Jitao Shi <jitao.shi@mediatek.com>
> > > 
> > > To comply with the panel sequence, hold the mipi signal to LP00
> > > before the dcs cmds transmission,
> > > and pull the mipi signal high from LP00 to LP11 until the start
> > > of
> > > the dcs cmds transmission.
> > > The normal panel timing is :
> > > (1) pp1800 DC pull up
> > > (2) avdd & avee AC pull high
> > > (3) lcm_reset pull high -> pull low -> pull high
> > > (4) Pull MIPI signal high (LP11) -> initial code -> send video
> > > data(HS mode)
> > > The power-off sequence is reversed.
> > > If dsi is not in cmd mode, then dsi will pull the mipi signal
> > > high
> > > in
> > > the mtk_output_dsi_enable function.
> > > 
> > > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > > drm_panel_bridge
> > > API")
> > > 
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 28 +++++++++++++++++++++---
> > > --
> > > --
> > >  1 file changed, 21 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > index cf76c53a1af6..9ad6f08c8bfe 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > @@ -203,6 +203,7 @@ struct mtk_dsi {
> > >  	struct mtk_phy_timing phy_timing;
> > >  	int refcount;
> > >  	bool enabled;
> > > +	bool lanes_ready;
> > >  	u32 irq_data;
> > >  	wait_queue_head_t irq_wait_queue;
> > >  	const struct mtk_dsi_driver_data *driver_data;
> > > @@ -654,13 +655,6 @@ static int mtk_dsi_poweron(struct mtk_dsi
> > > *dsi)
> > >  	mtk_dsi_config_vdo_timing(dsi);
> > >  	mtk_dsi_set_interrupt_enable(dsi);
> > >  
> > > -	mtk_dsi_rxtx_control(dsi);
> > > -	usleep_range(30, 100);
> > > -	mtk_dsi_reset_dphy(dsi);
> > > -	mtk_dsi_clk_ulp_mode_leave(dsi);
> > > -	mtk_dsi_lane0_ulp_mode_leave(dsi);
> > > -	mtk_dsi_clk_hs_mode(dsi, 0);
> > > -
> > >  	return 0;
> > >  err_disable_engine_clk:
> > >  	clk_disable_unprepare(dsi->engine_clk);
> > > @@ -689,6 +683,23 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > > *dsi)
> > >  	clk_disable_unprepare(dsi->digital_clk);
> > >  
> > >  	phy_power_off(dsi->phy);
> > > +
> > > +	dsi->lanes_ready = false;
> > > +}
> > > +
> > > +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > > +{
> > > +	if (!dsi->lanes_ready) {
> > > +		dsi->lanes_ready = true;
> > > +		mtk_dsi_rxtx_control(dsi);
> > > +		usleep_range(30, 100);
> > > +		mtk_dsi_reset_dphy(dsi);
> > > +		mtk_dsi_clk_ulp_mode_leave(dsi);
> > > +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> > > +		mtk_dsi_clk_hs_mode(dsi, 0);
> > > +		msleep(20);
> > > +	} else
> > > +		DRM_DEBUG("The dsi_lane is ready\n");

Once mtk_dsi_host_transfer() call this function first, then
mtk_output_dsi_enable() would call again. This function would be called
twice in normal sequence, so I think this debug information is not
necessary.

> > >  }
> > >  
> > >  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> > > @@ -696,6 +707,7 @@ static void mtk_output_dsi_enable(struct
> > > mtk_dsi
> > > *dsi)
> > >  	if (dsi->enabled)
> > >  		return;
> > >  
> > > +	mtk_dsi_lane_ready(dsi);
> > >  	mtk_dsi_set_mode(dsi);
> > >  	mtk_dsi_clk_hs_mode(dsi, 1);
> > >  
> > > @@ -1001,6 +1013,8 @@ static ssize_t mtk_dsi_host_transfer(struct
> > > mipi_dsi_host *host,
> > >  	if (MTK_DSI_HOST_IS_READ(msg->type))
> > >  		irq_flag |= LPRX_RD_RDY_INT_FLAG;
> > >  
> > > +	mtk_dsi_lane_ready(dsi);
> > 
> > In [1], YT has move mtk_dsi_lane_ready() before panel prepare for
> > dsi-
> > > panel case. Now you move mtk_dsi_lane_ready() after panel
> > > prepare,
> > 
> > this may break dsi->panel case. Please provide a solution for both
> > case.
> > 
> > [1] 
> > 
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/mediatek/mtk_dsi.c?h=v5.18-rc2&id=0707632b5bacc490f58dfbad741d586c06595ff3
> > 
> > Regards,
> > CK
> > 
> > > +
> > >  	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
> > >  	if (ret)
> > >  		goto restore_dsi_mode;
> > 
> > 
> 
> Hi CK:
> 
> Because the order of dsi->panel in [1] is as follows (tv101 panel as
> an
> example):
> 1. dsi_poweron (lane_ready)
> 2. panel_prepare
> 3. panel_prepare_power
> 4. panel_init_cmd
> 5. dsi_host_transfer (actually send panel initial code)
> 
> This modified order:
> 1. dsi_poweron
> 2. panel_prepare
> 3. panel_prepare_power
> 4. panel_init_cmd
> 5. dsi_host_transfer (lane_ready)
> 
> It can be seen that the lane_ready is delayed closer to before
> sending
> the initial code, which is necessary for some panels with stricter
> timing requirements.
> And if this screen does not need to send initial code, it will also
> do
> lane_ready in output_dsi_enable, so that dsi can complete LP00->LP11-
> > HS mode.

Understand. You call mtk_dsi_lane_ready() in both
mtk_output_dsi_enable() and mtk_dsi_host_transfer(). The panel prepare
may call mtk_dsi_host_transfer() and mtk_dsi_lane_ready() would be
called.

Regards,
CK

> 
> [1] 
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/mediatek/mtk_dsi.c?h=v5.18-rc2&id=0707632b5bacc490f58dfbad741d586c06595ff3
> 
> Best Regards!
> xinlei
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
