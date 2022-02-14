Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29788C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 08:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRyJ1i5BKt16drxpB5S7lerhVr3qxAgciHZmwrH2Htw=; b=SDNeSEvnDkSLHC
	wTpjc9LtbvX1/y2hgJ1ni0pgUSB/jvH0YIdcf0RMe0tjwCQiZecgT9SMdxY9Xeq3v/0YNtcYFWMLr
	ksWXnqrFoEdbQ83BoYek2RTXfKxM4oZGvw1KTZtZkc1/XpvAjfmCxjtIDvXByaZp204f/KRS+af6h
	bDt6MiOTxJB1GK9ptoRDF9sXODtvoQQ+Kuqq/NNbBHjsnBRXdP8ml2l/SqHuuBUU2QTGhnAKHkJSO
	NPXEQrIlJgjEwYlhXlw4CYcFe41how3WeSo8nu3mdfpsVmo6QVKY8NPyMBOR91rUoQ35DWY0ls4qH
	vyOg9n+71U2h5Do7gJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWsu-00Dz4x-26; Mon, 14 Feb 2022 08:39:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWay-00DrQX-PN; Mon, 14 Feb 2022 08:20:31 +0000
X-UUID: c4880f11ca454420b8e9bbfc3123eabf-20220214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=H+yPNz7tlVpGDTgCRURZdvXvgvsUavd9xV6QIc7od4M=; 
 b=UEw1QNhKRYI9tvo3dHTV++6wz0Jrs4bjguoxi5dif6zhdIMOGQvgJpm4KHICrSRxg44RE9aPLzuONVVizKsFQblsShsZkQV2dfze9PGBe46Q7ocOJotEqcyM48UA1aOqsmsM9j4inGfObhatrqVZDyockYf+5A3boOyfWyb8wlU=;
X-UUID: c4880f11ca454420b8e9bbfc3123eabf-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1264005442; Mon, 14 Feb 2022 01:20:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 00:10:19 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Feb 2022 16:10:17 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 16:10:17 +0800
Message-ID: <e57eb09846a7f4f974500610a1e5967a964ae1de.camel@mediatek.com>
Subject: Re: [v1, 3/3] drm/mediatek: Move the getting bridge node function
 to mtk_dsi_bind
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <jitao.shi@mediatek.com>,
 <"Project_Global_Chrome_Upstream_ Group"@mediatek.com>
Date: Mon, 14 Feb 2022 16:10:26 +0800
In-Reply-To: <092258211c47eca805c4dea6c4bf4ecc4c246cea.camel@mediatek.com>
References: <1643283773-7081-1-git-send-email-xinlei.lee@mediatek.com>
 <1643283773-7081-4-git-send-email-xinlei.lee@mediatek.com>
 <092258211c47eca805c4dea6c4bf4ecc4c246cea.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_002028_891138_67A68552 
X-CRM114-Status: GOOD (  22.83  )
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

On Fri, 2022-01-28 at 13:03 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Thu, 2022-01-27 at 19:42 +0800, xinlei.lee@mediatek.com wrote:
> > From: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > The order of probe function for bridge drivers and dsi drivers is
> > uncertain.
> > To avoid the dsi probe cannot be executed, we place getting bridge
> > node function in
> > mtk_dsi_bind.
> 
> It seems this patch want to fix the same problem as [1]. Does [1] fix
> your problem? If so, let's ignore this patch.
> 
> [1] 
> 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220127143623.123025-1-angelogioacchino.delregno@collabora.com/
> 
> Regards,
> CK
> 
Hi, CK:

As you describe,these two patches modify the same thing,we can ignore
this patch.
Thanks for your suggestion.

Best Regards!
xinlei
> > 
> > Signed-off-by:Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 29 +++++++++++++++-----------
> > --
> > -
> >  1 file changed, 15 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 62af60d..a390f26 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -991,6 +991,21 @@ static int mtk_dsi_bind(struct device *dev,
> > struct device *master, void *data)
> >  	int ret;
> >  	struct drm_device *drm = data;
> >  	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> > +	struct drm_panel *panel;
> > +
> > +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> > +					  &panel, &dsi->next_bridge);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (panel) {
> > +		dsi->next_bridge = devm_drm_panel_bridge_add(dev,
> > panel);
> > +		if (IS_ERR(dsi->next_bridge)) {
> > +			ret = PTR_ERR(dsi->next_bridge);
> > +			dev_err(dev, "failed to add bridge: %d\n",
> > ret);
> > +			return ret;
> > +		}
> > +	}
> >  
> >  	ret = mtk_dsi_encoder_init(drm, dsi);
> >  	if (ret)
> > @@ -1016,7 +1031,6 @@ static int mtk_dsi_probe(struct
> > platform_device
> > *pdev)
> >  {
> >  	struct mtk_dsi *dsi;
> >  	struct device *dev = &pdev->dev;
> > -	struct drm_panel *panel;
> >  	struct resource *regs;
> >  	int irq_num;
> >  	int ret;
> > @@ -1033,19 +1047,6 @@ static int mtk_dsi_probe(struct
> > platform_device *pdev)
> >  		return ret;
> >  	}
> >  
> > -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> > -					  &panel, &dsi->next_bridge);
> > -	if (ret)
> > -		goto err_unregister_host;
> > -
> > -	if (panel) {
> > -		dsi->next_bridge = devm_drm_panel_bridge_add(dev,
> > panel);
> > -		if (IS_ERR(dsi->next_bridge)) {
> > -			ret = PTR_ERR(dsi->next_bridge);
> > -			goto err_unregister_host;
> > -		}
> > -	}
> > -
> >  	dsi->driver_data = of_device_get_match_data(dev);
> >  
> >  	dsi->engine_clk = devm_clk_get(dev, "engine");
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
