Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22914C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3bVJBWsI0HOddrdtALMADwhYzO13my+/zEJnDGLD4M=; b=SHCiRrK+0Y9HZLw3ONu8NedIff
	d9rKW1sHrU/COCKqbMSeNMbPy44+zwVHXjD2+aAq2+Z8kuREk4yzg9qKWgw9RduceAO68TkElQSR/
	edYPrV8maKzaGMoIo3iXbmqs85AcpNTM440N/TRnIozpkTcsGu4onAqyPqfdTPm1GWiXOWRnpKC5F
	+wQfvDvBqTQX9tT/rctY7HyElWoXeyzFoiOTEZuMmbbISuo6maz36Ios5qoWf2xDX1+oHgkM8ZjSg
	1kSQL6HLSnF2AJGUXF5D4UJegD3/DnvKg15hmW8d+prvv2pHZty7YvdMD4GJtfZl/waYhG+PBHVW9
	0vlyQavw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybey-000MWr-Fg; Fri, 25 Nov 2022 16:34:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybej-000MMb-ES; Fri, 25 Nov 2022 16:34:27 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E2A0666029AD;
	Fri, 25 Nov 2022 16:34:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669394058;
	bh=OKxuRBtVrLA0hEMqW7Fa7oVob2TE0H0WQ2LnA4uvrW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZERWgiF/H9wakj+GRjsVIXARA2n+4O2Fsg7tIog+TUQwqly1gowAdnMEDZguCFA5
	 QoLMnW/5qmsbZd9wQrs4GtI/tz7zZFt/Tc/cjAPYKvmI+3pbV+SbdNnZCV7NRhnJgE
	 ess94HHrQHzWgV9Wv292qZhTZrmIdJSgUH4Pb7aiGswtbBv80lXaZMKyO6AtIpkNVn
	 wHpLOy3X8youzJQ94tUivjiTM1Gn7QKrggN4+6cQPDr/pJlKr23sF6/IxPyuQYZFZn
	 blV5afE3/4aDw+4Sa/FtxQglves0BZGrJdwI6W1lGAiRlDjUbb/k8fxEZlOaFDfU0A
	 MSNhd1zUxxaEQ==
Date: Fri, 25 Nov 2022 11:34:13 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] drm/mediatek: Clean dangling pointer on bind error
 path
Message-ID: <20221125163413.jwutjr5uxey6b32o@notapiano>
References: <20221122143949.3493104-1-nfraprado@collabora.com>
 <a67594cf-eb7f-873f-1c11-ccb4317b6bdf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a67594cf-eb7f-873f-1c11-ccb4317b6bdf@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_083425_640576_A87CB911 
X-CRM114-Status: GOOD (  26.59  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, kernel@collabora.com, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 23, 2022 at 10:15:25AM +0100, AngeloGioacchino Del Regno wrote:
> Il 22/11/22 15:39, Nícolas F. R. A. Prado ha scritto:
> > mtk_drm_bind() can fail, in which case drm_dev_put() is called,
> > destroying the drm_device object. However a pointer to it was still
> > being held in the private object, and that pointer would be passed along
> > to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
> > point, resulting in a panic. Clean the pointer when destroying the
> > object in the error path to prevent this from happening.
> > 
> > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > ---
> > 
> > Changes in v2:
> > - Added Fixes tag
> > 
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 39a42dc8fb85..a21ff1b3258c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -514,6 +514,7 @@ static int mtk_drm_bind(struct device *dev)
> >   err_deinit:
> >   	mtk_drm_kms_deinit(drm);
> >   err_free:
> > +	private->drm = NULL;
> 
> Sorry for not noticing that in v1, but I've rechecked this function and, while this
> commit does indeed actually solve the described issue, I think it's incomplete.
> 
> A few lines before, we have a loop that sets
> 
> 		private->all_drm_private[i]->drm = drm;

Actually that line only exists with [1] applied, but that commit hasn't been
merged as of yet. I debated whether it would be better to send this fix as is,
or ask Nancy Lin to add the tweaked fix you mention below to that series, but
sending this fix as is seemed better since it can be backported to older kernel
versions.

So assuming this commit gets merged first, Nancy should make that tweak you
mentioned below to ensure all the pointers are zeroed out, which is why I've
added Nancy to CC. (As a side note, given that only the mmsys with drm_master =
true would ever call the drm suspend helper, even this patch as is is enough to
avoid the panic even with that series applied, still we should zero out all
pointers for good measure)

[1] https://lore.kernel.org/linux-mediatek/20221107072413.16178-6-nancy.lin@mediatek.com/

Thanks,
Nícolas

> 
> ...so here you should do...
> 
> 	private->drm = NULL;
> 
> 	while (i--) /* a for loop will also do, your choice */
> 		private->all_drm_private[i]->drm = NULL;
> 		
> That makes sure that you cleanup *everything* :-)
> 
> Cheers,
> Angelo
> 

