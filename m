Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 02:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUWyIngLdCuhjuNjynaXLKMzNmqo6wNmnvWykJXaX+8=; b=dySci4XnapACNM
	LV1vcrXH7dBvGW/cq62pnBjF+qoEmw+QTpqyP2t1di9okHF9Ux1y8De8A+gMlCPF6jtnA8NVdbmeC
	cfxFj3B1JhfI5+Ot09cUloe5SAgrnt+QURZqPiLd0l6Ua+nPLdb7kzidfylruJaEYVabQJ+PIMfOS
	Zbm797DmgLqtEoKOti8yWQnsuiI9AMALo1Q+3qeUuNHTbm1k9Vsxwwm8tvtFLEs4BYHQPEi2WAxYl
	3tAJHm4XPcCFJ6d/zU5Jj58BPLGBT6fqdupljef9FFhyo/fTF5MO0F6Km/YZehxig1k3zPGsWmzvJ
	yZWpV+uIDCE7cNKC4Q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfBjE-0087wl-75; Fri, 15 Apr 2022 02:30:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfBjA-0087vm-O8; Fri, 15 Apr 2022 02:30:30 +0000
X-UUID: 7e24ef0662ad4502a0bfec10c6bdfe1c-20220414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=P1R87J0gDSOcY1wKiD3i3dDjSfpfLvXmKQ/L8tvV76w=; 
 b=buf8m7S8ptX9K4HMVbH8skD6w4hUGgwUGlMqC5z9zQhTUmIAuqTLmbRc8bgz5wUShlxW8n0JSZmDSvwMjrYGe3yDdrrOwbMfafUoMR8ljXSCNqBfD42AyNH4uGeo0ZQSPndHDGmmst9aIf4yddjd+89KeRt6RRIvuoSrD0mp5YM=;
X-UUID: 7e24ef0662ad4502a0bfec10c6bdfe1c-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1386780856; Thu, 14 Apr 2022 19:30:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 19:30:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 15 Apr 2022 10:30:21 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 10:30:21 +0800
Message-ID: <be9807025772b68416c38800616d52d8bd06d746.camel@mediatek.com>
Subject: Re: [PATCH v4, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 15 Apr 2022 10:30:53 +0800
In-Reply-To: <b1edb995f5dba2f8e313192a79cfc0972b7c832f.camel@mediatek.com>
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com>
 <b1edb995f5dba2f8e313192a79cfc0972b7c832f.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_193028_825550_67CD6905 
X-CRM114-Status: GOOD (  26.07  )
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

On Wed, 2022-04-13 at 15:31 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Mon, 2022-04-11 at 10:31 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > In order to match the changes of "Use the drm_panel_bridge API",
> > the poweron/poweroff of dsi is extracted from enable/disable and
> > defined as new funcs (pre_enable/post_disable).
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge
> > API")
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 51 +++++++++++++++++++-------
> > --
> > --
> >  1 file changed, 32 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 262c027d8c2f..cf76c53a1af6 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -679,16 +679,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi
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
> > @@ -703,17 +693,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi
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
> > @@ -727,7 +709,16 @@ static void mtk_output_dsi_disable(struct
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
> > @@ -762,13 +753,35 @@ static void mtk_dsi_bridge_enable(struct
> > drm_bridge *bridge)
> >  {
> >  	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> >  
> > +	if (dsi->refcount == 0)
> > +		return;
> > +
> >  	mtk_output_dsi_enable(dsi);
> >  }
> >  
> > +static void mtk_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +	int ret;
> > +
> > +	ret = mtk_dsi_poweron(dsi);
> > +	if (ret < 0)
> > +		DRM_ERROR("failed to power on dsi\n");
> > +}
> > +
> > +static void mtk_dsi_bridge_post_disable(struct drm_bridge *bridge)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +
> > +	mtk_dsi_poweroff(dsi);
> > +}
> > +
> >  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
> >  	.attach = mtk_dsi_bridge_attach,
> >  	.disable = mtk_dsi_bridge_disable,
> >  	.enable = mtk_dsi_bridge_enable,
> > +	.pre_enable = mtk_dsi_bridge_pre_enable,
> 
> The flow looks good to me, but according to [1], pre_enable is
> deprecated. Use atomic_pre_enable instead.
> 
> [1] 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/drm/drm_bridge.h?h=v5.18-rc2#n235
> 
> 
> > +	.post_disable = mtk_dsi_bridge_post_disable,
> 
> Ditto.
> 
> Regards,
> CK
> 
> >  	.mode_set = mtk_dsi_bridge_mode_set,
> >  };
> >  
> 
> 

Hi CK:

Thanks for your suggestion.
I will revise it in the next version.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
