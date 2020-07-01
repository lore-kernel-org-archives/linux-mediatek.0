Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10675C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 11:37:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D450020780
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 11:37:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FjiIHBCT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D450020780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L2+H8tYSE4phu05Re6KFtUCFA0QRr7IvWO3peXazDO0=; b=FjiIHBCTtdEBCKt/I76voSBsA
	ocPhoAeAixxhJCUNEpbhix6kRljdHBZex7FQE9j6yfTFx8xhVj7oMrGkItc97AsHr/5t3c97VmJf+
	z1O0orj6bAWEqlDPUEgC1deZYV5HI4HI3EDaH8ux+tRDRDRHciCHNK5x/WqFpodf1HWrTdAtK4QJj
	kN/xWfZVJ8us+OIxYzgEoaB26ovXadPz1XFM9cHuXmj7P1Ny369qerw7/hgmwqsIg7QXBX7O/Qys0
	LRxyq41VzHHwQvzggAmexdSuqAqPt+kaIdIZLCniQF0AuTPR+VNgWa2D34+/xM+fyJZICfRkltyvH
	SvXHUaH1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqb2s-0005T7-PA; Wed, 01 Jul 2020 11:36:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqb2o-0005S8-Rs; Wed, 01 Jul 2020 11:36:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 188AE2A5340;
 Wed,  1 Jul 2020 12:36:48 +0100 (BST)
Date: Wed, 1 Jul 2020 13:36:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [RESEND PATCH 1/3] drm/mediatek: mtk_dpi: Rename bridge to
 next_bridge
Message-ID: <20200701133645.329a1305@collabora.com>
In-Reply-To: <20200701132303.047ea605@collabora.com>
References: <20200518173909.2259259-1-enric.balletbo@collabora.com>
 <20200518173909.2259259-2-enric.balletbo@collabora.com>
 <20200701132303.047ea605@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_073651_021507_9B5142F4 
X-CRM114-Status: GOOD (  24.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 linux-mediatek@lists.infradead.org, laurent.pinchart@ideasonboard.com,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 1 Jul 2020 13:23:03 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Mon, 18 May 2020 19:39:07 +0200
> Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:
> 
> > This is really a cosmetic change just to make a bit more readable the
> > code after convert the driver to drm_bridge. The bridge variable name
> > will be used by the encoder drm_bridge, and the chained bridge will be
> > named next_bridge.
> > 
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > ---
> > 
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 7fbfa95bab09..7112125dc3d1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -61,7 +61,7 @@ enum mtk_dpi_out_color_format {
> >  struct mtk_dpi {
> >  	struct mtk_ddp_comp ddp_comp;
> >  	struct drm_encoder encoder;
> > -	struct drm_bridge *bridge;
> > +	struct drm_bridge *next_bridge;  
> 
> Did you consider moving the drm_of_find_panel_or_bridge() call to
> mtk_dpi_bind() so you can get rid of this field?

Nevermind, you need it in patch 2 for the recursive call to
drm_bridge_attach().

> 
> This makes we realize there's no refcounting on bridges, which means
> the bridge can vanish between the drm_of_find_panel_or_bridge() and
> drm_bridge_attach() calls :-/.
> 
> >  	void __iomem *regs;
> >  	struct device *dev;
> >  	struct clk *engine_clk;
> > @@ -607,7 +607,7 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
> >  	/* Currently DPI0 is fixed to be driven by OVL1 */
> >  	dpi->encoder.possible_crtcs = BIT(1);
> >  
> > -	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL, 0);
> > +	ret = drm_bridge_attach(&dpi->encoder, dpi->next_bridge, NULL, 0);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to attach bridge: %d\n", ret);
> >  		goto err_cleanup;
> > @@ -747,11 +747,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> > -					  NULL, &dpi->bridge);
> > +					  NULL, &dpi->next_bridge);
> >  	if (ret)
> >  		return ret;
> >  
> > -	dev_info(dev, "Found bridge node: %pOF\n", dpi->bridge->of_node);
> > +	dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
> >  
> >  	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DPI);
> >  	if (comp_id < 0) {  
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
