Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80163C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 04:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdbThC6UYA7te+6XA3Enf9qJIg3kkpE1/MlMGM3bZ64=; b=J0+k4SimrqiSEI
	NhEkoC4d8DLcaYRbRpUNzvWRcvmTjvuoDxlGH9/3EDLSwdkvCDgRPVsNHMd8dpGdz809iQM6LHqiL
	K4XM8IZAEjXFkd1T0AoK5GfLkypWARMgIKX1IHlh0hRegJ0GqeVkN3W04cEIQATANhSXqUeRB/hFX
	CbwErHSp46l79Qi+szDqXxYW8+FaozcGaJEu9lYJ+92FNoTq70bO2nHrLJm92TM6bDunW6QtBRDjR
	lsPBYO1y7G4LLYTssQn1SGTC7nof+cozAIZLCzXKSLroIECkpoDJk1Wrwe5nGXwgaABiwg8OpiaZw
	5Py2ZQM4OeEZj0qsKjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncJsT-009M3F-Rg; Thu, 07 Apr 2022 04:36:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncJA0-009Ciz-TW; Thu, 07 Apr 2022 03:50:19 +0000
X-UUID: 34ea3f803228423a90cca3b28ca87591-20220406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+NYe7dscBpsdauizQk1b3zrz0HXT8zPnE/52TQmYc3o=; 
 b=uoNUvTAYJ1kBTQpD0lQN6pZwJwGWgg3vaTSiYtXvrR8Jugy4+Z8YwYhRZez2zG7MefMy4kLJFe6+s5aL6r3zKTLAc+98Pjywco/SRaajg6ESmzZ0bGueObrZGX3ma3VivlRtkNM3YVx9OVICt9iwl1UMqIJvV8OnCKUZwcbwacw=;
X-UUID: 34ea3f803228423a90cca3b28ca87591-20220406
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 761470637; Wed, 06 Apr 2022 20:50:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 20:50:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 7 Apr 2022 11:50:06 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 11:50:04 +0800
Message-ID: <bdeeb164ad0144eafa6af2dc4ad1b6f7ce2a08e3.camel@mediatek.com>
Subject: Re: [PATCH v3,2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Thu, 7 Apr 2022 11:50:32 +0800
In-Reply-To: <eca60f45ab518a53b1d281c078f562b8bc610060.camel@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-3-git-send-email-xinlei.lee@mediatek.com>
 <390025b57d3345c34071231c68350e9311af64c9.camel@mediatek.com>
 <4d022881d08ea1d4a222b3439510c6d6d26d7284.camel@mediatek.com>
 <eca60f45ab518a53b1d281c078f562b8bc610060.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_205017_042888_9DE4086E 
X-CRM114-Status: GOOD (  45.56  )
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

On Wed, 2022-03-23 at 19:46 +0800, Rex-BC Chen wrote:
> On Tue, 2022-03-22 at 17:23 +0800, xinlei.lee wrote:
> > On Thu, 2022-03-17 at 20:02 +0800, Rex-BC Chen wrote:
> > > Hello Xinlei,
> > > 
> > > On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> > > > From: Jitao Shi <jitao.shi@mediatek.com>
> > > > 
> > > > In order to match the changes of "Use the drm_panel_bridge
> > > > API",
> > > > the poweron/poweroff of dsi is extracted from enable/disable
> > > > and
> > > > defined as new funcs (pre_enable/post_disable).
> > > > 
> > > > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > > > drm_panel_bridge
> > > > API")
> > > > 
> > > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > ---
> > > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 45 +++++++++++++++++-----
> > > > --
> > > > --
> > > > --
> > > > --
> > > >  1 file changed, 26 insertions(+), 19 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > index 262c027d8c2f..e33caaca11a7 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > @@ -679,16 +679,6 @@ static void mtk_dsi_poweroff(struct
> > > > mtk_dsi
> > > > *dsi)
> > > >  	if (--dsi->refcount != 0)
> > > >  		return;
> > > >  
> > > > -	/*
> > > > -	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric,
> > > > since
> > > > -	 * mtk_dsi_stop() should be called after
> > > > mtk_drm_crtc_atomic_disable(),
> > > > -	 * which needs irq for vblank, and mtk_dsi_stop() will
> > > > disable
> > > > irq.
> > > > -	 * mtk_dsi_start() needs to be called in
> > > > mtk_output_dsi_enable(),
> > > > -	 * after dsi is fully set.
> > > > -	 */
> > > > -	mtk_dsi_stop(dsi);
> > > > -
> > > > -	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> > > >  	mtk_dsi_reset_engine(dsi);
> > > >  	mtk_dsi_lane0_ulp_mode_enter(dsi);
> > > >  	mtk_dsi_clk_ulp_mode_enter(dsi);
> > > > @@ -703,17 +693,9 @@ static void mtk_dsi_poweroff(struct
> > > > mtk_dsi
> > > > *dsi)
> > > >  
> > > >  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> > > >  {
> > > > -	int ret;
> > > > -
> > > >  	if (dsi->enabled)
> > > >  		return;
> > > >  
> > > > -	ret = mtk_dsi_poweron(dsi);
> > > > -	if (ret < 0) {
> > > > -		DRM_ERROR("failed to power on dsi\n");
> > > > -		return;
> > > > -	}
> > > > -
> > > >  	mtk_dsi_set_mode(dsi);
> > > >  	mtk_dsi_clk_hs_mode(dsi, 1);
> > > >  
> > > > @@ -727,7 +709,16 @@ static void mtk_output_dsi_disable(struct
> > > > mtk_dsi *dsi)
> > > >  	if (!dsi->enabled)
> > > >  		return;
> > > >  
> > > > -	mtk_dsi_poweroff(dsi);
> > > > +	/*
> > > > +	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric,
> > > > since
> > > 
> > > Why they are asymmetric?
> > > 
> > > > +	 * mtk_dsi_stop() should be called after
> > > > mtk_drm_crtc_atomic_disable(),
> > > > +	 * which needs irq for vblank, and mtk_dsi_stop() will
> > > > disable
> > > > irq.
> > > > +	 * mtk_dsi_start() needs to be called in
> > > > mtk_output_dsi_enable(),
> > > > +	 * after dsi is fully set.
> > > > +	 */
> > > > +	mtk_dsi_stop(dsi);
> > > > +
> > > > +	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> > > >  
> > > >  	dsi->enabled = false;
> > > >  }
> > > > @@ -765,10 +756,26 @@ static void mtk_dsi_bridge_enable(struct
> > > > drm_bridge *bridge)
> > > >  	mtk_output_dsi_enable(dsi);
> > > >  }
> > > >  
> > > > +static void mtk_dsi_bridge_pre_enable(struct drm_bridge
> > > > *bridge)
> > > > +{
> > > > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > > > +
> > > > +	mtk_dsi_poweron(dsi);
> > > 
> > > Should you handle the error of mtk_dsi_poweron?
> > > If you failed to mtk_dsi_bridge_pre_enable and do
> > > mtk_dsi_bridge_enable,
> > > what will happend?
> > > 
> > > > +}
> > > > +
> > > > +static void mtk_dsi_bridge_post_disable(struct drm_bridge
> > > > *bridge)
> > > > +{
> > > > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > > > +
> > > > +	mtk_dsi_poweroff(dsi);
> > > 
> > > If you failed to mtk_dsi_bridge_disable and you do
> > > mtk_dsi_bridge_post_disable,
> > > what will happend?
> > > Do you need to handle this?
> > > 
> > > BRs,
> > > Rex
> > > 
> > > > +}
> > > > +
> > > >  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
> > > >  	.attach = mtk_dsi_bridge_attach,
> > > >  	.disable = mtk_dsi_bridge_disable,
> > > >  	.enable = mtk_dsi_bridge_enable,
> > > > +	.pre_enable = mtk_dsi_bridge_pre_enable,
> > > > +	.post_disable = mtk_dsi_bridge_post_disable,
> > > >  	.mode_set = mtk_dsi_bridge_mode_set,
> > > >  };
> > > >  
> > > 
> > > 
> > 
> > Hi Rex:
> > 
> > Thanks for your review!
> > 
> > 1.Why they are asymmetric?
> > =>My understanding mtk_dsi_stop() and mtk_dsi_start() is to make
> > dsi
> > switch from LP11 and HS mode.DSI has two working modes:
> > If it is cmd mode, the data sent is sent by LP11, and dsi_start is
> > just
> > a signal. In this mode, dsi_stop is not required after sending cmd.
> > If it is video mode, because the data needs to be sent in HS mode,
> > dsi_start is required to make dsi enter HS mode from LP11. After
> > suspend, drm will call dsi_disable, and call dsi_stop to make dsi
> > return from HS mode to LP11 state.
> > Therefore mtk_dsi_stop() and mtk_dsi_start() are asymmetric.
> > For example, in the dsi_host_transfer function, only dsi_stop has
> > no
> > dsi_start operation.
> > 
> > 2.
> > Because the return type of pre_enable & post_disable in common code
> > is
> > void type. If there is an error, it will be processed in
> > poweron/poweroff, and the error message will be printed.
> > Do you mean that pre_enable & post_disable needs to accept the
> > poweron/poweroff error return value and then print the error log?
> > 
> > 3.
> > If pre_enable fails, there is only a problem with the dsi module,
> > and
> > it does not affect the execution of other modules and enable funcs
> > under drm. 
> > Same goes for post_disable & disable.
> > 
> > Best Regrds!
> > xinlei
> > 
> 
> Hello Xinlei,
> 
> about failure for mtk_dsi_poweron(), it is all becuase of error
> setting
> for clock.
> If we do not set clock correctly and not enable DSI, after set DSI
> start, will it cause any issue? (maybe bus hang or something.)
> 
> Because in original drivers, if mtk_dsi_poweron failed, the DSI will
> not start.
> 
> IMO, it also needs some error message for mtk_dsi_bridge_pre_enable()
> and mtk_dsi_bridge_post_disable().
> 
> BRs,
> Rex
> 

Hi Rex:

Thanks for your review.
In the original dsi_poweron, if (++dsi->refcount != 1) is used to
determine whether poweron has been repeatedly run.
The poweron failure to execute DSI Start you mentioned may indeed lead
to Bus hang in extreme cases, so I will add a poweron-like judgment
mechanism before the next version of enable.
And will add some error message for mtk_dsi_bridge_pre_enable() and
mtk_dsi_bridge_post_disable().

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
