Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F33C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 06:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzF6cuApMQRRQTFsDfbWlOzbWCEk5gk5EEfqL32FcVs=; b=YgwyAeKpKypV7r
	5Z5hwDnXt0IpgofnDqkb/+QlBAe8mQNfkl1qRrLY1GsoUwmdS48lu6uxRvDDQ+CbqnJ3fVlNVPI8g
	vLIbEaJX/HVUaoyKEO8w8ub9Jn8qPtmDTkozkV3Akqp7/b0vLnTqqq0GCXhI8N84XTVUjzQNA41Q1
	NIi5SEEascG+o1WPbOe3RBCLiafa/4jnIpWfiDSIvKZzMxsBrtOJK8rA735RIEauuRtOip3J/5v6/
	uPmtvelkr3F0wbF2TZ91EBB/JhwOtGAe+fzv4CnEh5CSzqVdMw3/aCR6dg7U/HIq8ZI39B/Lj+ZCu
	QpXURyLKLChjREhCrz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrZdk-005HlO-OE; Thu, 19 May 2022 06:28:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrZdi-005HiU-2h; Thu, 19 May 2022 06:28:03 +0000
X-UUID: a2fb844038574c0eb6d160636ed15240-20220518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=C06zkT+dUvOYOn/PokeqUMYCHAqjPXsGiUI3WmauPww=; 
 b=bCv8BgRRsaimE0iQwPhuSwf9GF5h6Aa7p0iJ0g/N6S8EtnhyxhprRydjgUZBUTP6rJ+yyt0vAMLemCA/Ppui86KytYANOgdyp1KtdEn4n+sDhsRtxO9i8sweNdBFD48zPeWRwmFJrWgxUUo+L2O8pVYA/zIc0/5p+k1itOW79U0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:ad83eef0-4060-4f63-9d7e-81289699a616, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:2a19b09, CLOUDID:8d04d279-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: a2fb844038574c0eb6d160636ed15240-20220518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 539900664; Wed, 18 May 2022 23:27:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 23:27:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 14:27:54 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 May 2022 14:27:53 +0800
Message-ID: <8b40430e1a2996a04554ee6679e0ac2e1adf0220.camel@mediatek.com>
Subject: Re: [PATCH v6, 3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, "# 6 . 6 . x : b255d51e3967 : sched :
 Modify dsi funcs to atomic	 	  operations" <stable@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>
Date: Thu, 19 May 2022 14:28:39 +0800
In-Reply-To: <cfa87a23495fe5d72c7deed49162b026466cb68a.camel@mediatek.com>
References: <1652337012-9053-1-git-send-email-xinlei.lee@mediatek.com>
 <1652337012-9053-4-git-send-email-xinlei.lee@mediatek.com>
 <cfa87a23495fe5d72c7deed49162b026466cb68a.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_232802_172805_2AFEA612 
X-CRM114-Status: GOOD (  29.29  )
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

On Wed, 2022-05-18 at 11:55 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Thu, 2022-05-12 at 14:30 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > To comply with the panel sequence, hold the mipi signal to LP00
> > before the dcs cmds transmission,
> > and pull the mipi signal high from LP00 to LP11 until the start of
> > the dcs cmds transmission.
> > The normal panel timing is :
> > (1) pp1800 DC pull up
> > (2) avdd & avee AC pull high
> > (3) lcm_reset pull high -> pull low -> pull high
> > (4) Pull MIPI signal high (LP11) -> initial code -> send video
> > data(HS mode)
> > The power-off sequence is reversed.
> > If dsi is not in cmd mode, then dsi will pull the mipi signal high
> > in
> > the mtk_output_dsi_enable function.
> > The delay in lane_ready func is the reaction time of dsi_rx after
> > pulling up the mipi signal.
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge
> > API")
> > 
> > Cc: <stable@vger.kernel.org> # 6.6.x: b255d51e3967: sched: Modify
> > dsi
> > funcs to atomic operations
> > Cc: <stable@vger.kernel.org> # 6.6.x: 72c69c977502: sched: Separate
> > poweron/poweroff from enable/disable and define new funcs
> > Cc: <stable@vger.kernel.org> # 6.6.x
> 
> This patch looks good to me, but do you want to 'back' port this
> patch
> to Linux version 6.6?
> 
> Regards,
> CK
> 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 28 +++++++++++++++++++++-----
> > --
> >  1 file changed, 21 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index d9a6b928dba8..25e84d9426bf 100644
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
> > @@ -661,18 +662,11 @@ static int mtk_dsi_poweron(struct mtk_dsi
> > *dsi)
> >  	mtk_dsi_reset_engine(dsi);
> >  	mtk_dsi_phy_timconfig(dsi);
> >  
> > -	mtk_dsi_rxtx_control(dsi);
> > -	usleep_range(30, 100);
> > -	mtk_dsi_reset_dphy(dsi);
> >  	mtk_dsi_ps_control_vact(dsi);
> >  	mtk_dsi_set_vm_cmd(dsi);
> >  	mtk_dsi_config_vdo_timing(dsi);
> >  	mtk_dsi_set_interrupt_enable(dsi);
> >  
> > -	mtk_dsi_clk_ulp_mode_leave(dsi);
> > -	mtk_dsi_lane0_ulp_mode_leave(dsi);
> > -	mtk_dsi_clk_hs_mode(dsi, 0);
> > -
> >  	return 0;
> >  err_disable_engine_clk:
> >  	clk_disable_unprepare(dsi->engine_clk);
> > @@ -701,6 +695,23 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >  	clk_disable_unprepare(dsi->digital_clk);
> >  
> >  	phy_power_off(dsi->phy);
> > +
> > +	dsi->lanes_ready = false;
> > +}
> > +
> > +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > +{
> > +	if (!dsi->lanes_ready) {
> > +		dsi->lanes_ready = true;
> > +		mtk_dsi_rxtx_control(dsi);
> > +		usleep_range(30, 100);
> > +		mtk_dsi_reset_dphy(dsi);
> > +		mtk_dsi_clk_ulp_mode_leave(dsi);
> > +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> > +		mtk_dsi_clk_hs_mode(dsi, 0);
> > +		msleep(20);
> > +		/* The reaction time after pulling up the mipi signal
> > for dsi_rx */
> > +	}
> >  }
> >  
> >  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> > @@ -708,6 +719,7 @@ static void mtk_output_dsi_enable(struct
> > mtk_dsi
> > *dsi)
> >  	if (dsi->enabled)
> >  		return;
> >  
> > +	mtk_dsi_lane_ready(dsi);
> >  	mtk_dsi_set_mode(dsi);
> >  	mtk_dsi_clk_hs_mode(dsi, 1);
> >  
> > @@ -1017,6 +1029,8 @@ static ssize_t mtk_dsi_host_transfer(struct
> > mipi_dsi_host *host,
> >  	if (MTK_DSI_HOST_IS_READ(msg->type))
> >  		irq_flag |= LPRX_RD_RDY_INT_FLAG;
> >  
> > +	mtk_dsi_lane_ready(dsi);
> > +
> >  	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
> >  	if (ret)
> >  		goto restore_dsi_mode;
> 
> 

Hi CK:

Thanks for your review.
I had some misunderstandings before, and I will modify the back version
to 5.10.x in the next version.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
