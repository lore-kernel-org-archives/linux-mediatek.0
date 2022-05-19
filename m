Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52888C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDvGaArqMajxrSPcYKUDPW85hYCH4Vh4EVOf1iPKBD0=; b=fAm+e4jSpP7S/m
	Kmaw3fmbTl4bfcJrmFcEkN0eWYYwjg4BC4wi/8FCGSVDbcehzbI17bu2x0zqYcDWIiFeOphmY51sF
	Qj8TXWLY9yf8t5E4zR1a3EROdmo2NImjLdLogxz4MhDbGBr/0qNMlenpAnw6jIpoKavRy+uw0mZCx
	K5Wg8CN5i8JbtFurbTXfAVNr7WTNBVeEntzujOPmFF+xBv/N+gORbuhNowWys+gAZonMN6M0dX45Q
	IN59PncLvk8w2VZ7GsqCTpb13QLNesH7RJbCQ2HFARGq1fmni9aMUvAyS/XNzZupJUXm23ea5xX/A
	jWQJp5567zsALDJns3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrZxx-005MTO-6C; Thu, 19 May 2022 06:48:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrZxs-005MQh-OP; Thu, 19 May 2022 06:48:54 +0000
X-UUID: 318d6dc38bdf424ab1b423799e5759f0-20220518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WdEMr2PK9t6w2N1+jhlKySDIa+M6QgnX2ZXSsHcV2Rw=; 
 b=IVGo2PLHNJO9A+BRsnUnIbNrYu3+okkp3H8wxOBIy9jRSDuVyVRPgt1ergghfMVRTHUIEnLrm2lt/ckwbNUIeheVcXzKljOz6LjhaX7xFpI+2cMA4ri0zJN/yGEHKPBUebewDB/dWA9489dvSWPGu8s7Hpch9Apgy4brNM4fCKU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:3db00ccf-51fe-487c-9125-aac4b774ca8c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:2a19b09, CLOUDID:0949d379-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 318d6dc38bdf424ab1b423799e5759f0-20220518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1420857037; Wed, 18 May 2022 23:48:47 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 23:38:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 14:38:44 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 May 2022 14:38:43 +0800
Message-ID: <c84c9392c048e6108c22f3ab3e1f635acea659bb.camel@mediatek.com>
Subject: Re: [PATCH v6, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <rex-bc.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 19 May 2022 14:39:29 +0800
In-Reply-To: <1bad78e79feb40a2e1e5b09e70438b15aff379ab.camel@mediatek.com>
References: <1652337012-9053-1-git-send-email-xinlei.lee@mediatek.com>
 <1652337012-9053-3-git-send-email-xinlei.lee@mediatek.com>
 <1bad78e79feb40a2e1e5b09e70438b15aff379ab.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_234852_882893_9327AA75 
X-CRM114-Status: GOOD (  29.27  )
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

On Wed, 2022-05-18 at 11:39 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Thu, 2022-05-12 at 14:30 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > In order to match the changes of "Use the drm_panel_bridge API",
> > the poweron/poweroff of dsi is extracted from enable/disable and
> > defined as new funcs (atomic_pre_enable/atomic_post_disable).
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge
> > API")
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 53 +++++++++++++++++++-------
> > --
> > --
> >  1 file changed, 34 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index f880136cec09..d9a6b928dba8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -691,16 +691,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >  	if (--dsi->refcount != 0)
> >  		return;
> >  
> > -	/*
> > -	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> > -	 * mtk_dsi_stop() should be called after
> > mtk_drm_crtc_atomic_disable(),
> > -	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> > irq.
> > -	 * mtk_dsi_start() needs to be called in
> > mtk_output_dsi_enable(),
> > -	 * after dsi is fully set.
> > -	 */
> > -	mtk_dsi_stop(dsi);
> > -
> > -	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> >  	mtk_dsi_reset_engine(dsi);
> >  	mtk_dsi_lane0_ulp_mode_enter(dsi);
> >  	mtk_dsi_clk_ulp_mode_enter(dsi);
> > @@ -715,17 +705,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >  
> >  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> >  {
> > -	int ret;
> > -
> >  	if (dsi->enabled)
> >  		return;
> >  
> > -	ret = mtk_dsi_poweron(dsi);
> > -	if (ret < 0) {
> > -		DRM_ERROR("failed to power on dsi\n");
> > -		return;
> > -	}
> > -
> >  	mtk_dsi_set_mode(dsi);
> >  	mtk_dsi_clk_hs_mode(dsi, 1);
> >  
> > @@ -739,7 +721,16 @@ static void mtk_output_dsi_disable(struct
> > mtk_dsi *dsi)
> >  	if (!dsi->enabled)
> >  		return;
> >  
> > -	mtk_dsi_poweroff(dsi);
> > +	/*
> > +	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> > +	 * mtk_dsi_stop() should be called after
> > mtk_drm_crtc_atomic_disable(),
> > +	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> > irq.
> > +	 * mtk_dsi_start() needs to be called in
> > mtk_output_dsi_enable(),
> > +	 * after dsi is fully set.
> > +	 */
> > +	mtk_dsi_stop(dsi);
> > +
> > +	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> >  
> >  	dsi->enabled = false;
> >  }
> > @@ -776,13 +767,37 @@ static void
> > mtk_dsi_bridge_atomic_enable(struct
> > drm_bridge *bridge,
> >  {
> >  	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> >  
> > +	if (dsi->refcount == 0)
> > +		return;
> 
> This seems not related to pre_enable()/post_disable(). So separate
> this
> to another patch.
> 
> Regards,
> CK
> 
> > +
> >  	mtk_output_dsi_enable(dsi);
> >  }
> >  
> > +static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge
> > *bridge,
> > +					     struct drm_bridge_state
> > *old_bridge_state)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +	int ret;
> > +
> > +	ret = mtk_dsi_poweron(dsi);
> > +	if (ret < 0)
> > +		DRM_ERROR("failed to power on dsi\n");
> > +}
> > +
> > +static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge
> > *bridge,
> > +					       struct drm_bridge_state
> > *old_bridge_state)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +
> > +	mtk_dsi_poweroff(dsi);
> > +}
> > +
> >  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
> >  	.attach = mtk_dsi_bridge_attach,
> >  	.atomic_disable = mtk_dsi_bridge_atomic_disable,
> >  	.atomic_enable = mtk_dsi_bridge_atomic_enable,
> > +	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
> > +	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
> >  	.mode_set = mtk_dsi_bridge_mode_set,
> >  };
> >  
> 
> 

Hi CK:
Thanks for your review.

The modification here is related to pre_enable()/post_disable().
Because in the previous dsi_enable function, dsi_poweron will be
executed first and then the dsi register will be operated.
But the current modification will move dsi_poweron to the pre_enable
function, and the pre_enable is of void type, when dsi_poweron fails,
an error log will be printed, but the dsi register will be operated in
dsi_enable later , it may cause bus hang.

Therefore, dsi_poweron is judged in the dsi_enable function to avoid
the above situation.
I'll add that description in the comments on the next edition.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
