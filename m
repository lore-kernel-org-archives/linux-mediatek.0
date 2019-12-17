Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F5BC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 01:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82130206E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 01:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lwJWrtCg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ud8Pp6GN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82130206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zF2HUyqoOPY79odQtMLEu436+bIPPj2UNCUMbJZSoaY=; b=lwJWrtCg+myF2c
	0Vhr3uUXRZc0KuHiQiq5Mkk9ClbKbFDcR97wYQeKFxikRj+YGPi6Oi2NvKOcc/veEvrvLrxB6nv9/
	HoX5J/V8AfqxHrJ1Jkdxf+bC5otmNcH27oZyp0DEc0g2zJE09ZsJt+A4Cds23oBaZTXdTQDLC8BCo
	rzFlwo0UOxkr6N295i5DeLbyqUfdN8HWK5pnlJutJfLN+WOWjKCZfrQeqrl3RqRMgSwoLs/jpbKAg
	YrpuXqWTW5+mwV0WV74hQ8N+Dwswd5efmcuxf5WYWru+uM1jEaCU6+Bjzhhwd8hVDTDhx5n0GjcqI
	KffoTSzz/28pUGqqcmkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih1Pu-0000o7-BD; Tue, 17 Dec 2019 01:12:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih1Pl-0000fW-8R; Tue, 17 Dec 2019 01:12:43 +0000
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93CEC9C5;
 Tue, 17 Dec 2019 02:12:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576545147;
 bh=KcjcirugnejZF/v8qYCaUPEjRMBZVSzSBT527du65ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ud8Pp6GNKk4VcnODZGhTIPdvic9f0EE0uzu/AAfk2bEcRKWujIP+SVNygSd9k21Gb
 DVO6vq1bgcVLDVrJXIgx0bDBc93dTNvbxS9tvJFvDxOuW3JTGYv0dIsw5Z0diCsI6L
 9RMPQHAJ8kEN1Gd9ZH6orkpF5w+Ad7q9Pquc6Yuo=
Date: Tue, 17 Dec 2019 03:12:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/6] drm/mediatek: Convert to use CMA helpers
Message-ID: <20191217011215.GM4856@pendragon.ideasonboard.com>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-6-robh@kernel.org>
 <1cbca96c-19dd-1d15-949c-7fbcc15369b4@gmail.com>
 <CAL_JsqL6G=F45G+-QXF6T1269f9YquXfYtjoUkCpAoNartxM=Q@mail.gmail.com>
 <1571864784.19128.8.camel@mtksdaap41>
 <CAL_JsqJJ2ET2oCCkE=fqk7PWTWp3xiMRiMM_AmxRDws-NaKoOg@mail.gmail.com>
 <1571900577.27203.6.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571900577.27203.6.camel@mtksdaap41>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_171241_605458_033A6210 
X-CRM114-Status: GOOD (  26.68  )
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
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Ulrich Hecht <uli@fpond.eu>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Thu, Oct 24, 2019 at 03:02:57PM +0800, CK Hu wrote:
> On Wed, 2019-10-23 at 17:56 -0500, Rob Herring wrote:
> > On Wed, Oct 23, 2019 at 4:06 PM CK Hu wrote:
> > > On Wed, 2019-10-23 at 12:42 -0500, Rob Herring wrote:
> > > > On Tue, Oct 22, 2019 at 12:07 PM Matthias Brugger wrote:
> > > > > On 21/10/2019 23:45, Rob Herring wrote:
> > > > > > The only reason the Mediatek driver doesn't use the CMA helpers is it
> > > > > > sets DMA_ATTR_NO_KERNEL_MAPPING and does a vmap() on demand. Using
> > > > > > vmap() is not even guaranteed to work as DMA buffers may not have a
> > > > > > struct page. Now that the CMA helpers support setting
> > > > > > DMA_ATTR_NO_KERNEL_MAPPING as needed or not, convert Mediatek driver to
> > > > > > use CMA helpers.
> > > > > >
> > > > > > Cc: CK Hu <ck.hu@mediatek.com>
> > > > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > > > > Cc: David Airlie <airlied@linux.ie>
> > > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > > > Cc: linux-mediatek@lists.infradead.org
> > > > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > > > ---
> > > > >
> > > > > I tested this on my Chromebook with some patches on top of v5.4-rc1 [1], which
> > > > > work. If I add your patches on top of that, the system does not boot up.
> > > > > Unfortunately I don't have a serial console, so I wasn't able to see if there is
> > > > > any error message.
> > > >
> > > > Thanks for testing. I'm based on drm-misc-next, but don't see anything
> > > > obvious there that would matter. There are some mmap changes, but I
> > > > think they shouldn't matter.
> > > >
> > > > Did you have fbcon enabled? That may give more clues about where the problem is.
> > >
> > > There are priv->dma_dev for dma device, but it is not drm device. In
> > > mt8173.dtsi [1], there are mmsys device and ovl device, mmsys device is
> > > drm device and ovl device is mmsys's sub device which provide dma
> > > function, so ovl is the priv->dma_dev. I think your patch directly use
> > > drm device for dma operation and this would cause dma function fail.
> > > Please use priv->dma_dev for dma operation.
> > 
> > Right, thanks for catching that. Either we'll need to make CMA GEM
> > object have a struct device ptr or adjust the drm_device.dev to have
> > the necessary DMA setup.
> > 
> > One question though, why do you use CMA when you have an IOMMU? That's
> > not optimal as CMA size may be limited. Or you don't always have an
> > IOMMU?

Please note that the DRM GEM CMA helpers are misnamed, they use the DMA
coherent allocation API, and thus don't use CMA if the device is backed
by an IOMMU. They should really have been named DRM GEM DMA helpers.

> For all upstreamed mediatek SoC, all has IOMMU, so it does not need CMA.
> I think we use CMA just because we refer to other drm driver to
> implement mediatek drm driver and we misused CMA helper function but it
> works. I think we should change to more accurate implementation. If you
> want, you could modify it in this series.
> 

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
