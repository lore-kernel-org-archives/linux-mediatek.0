Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCD2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 19:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B20610A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 19:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69B20610A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1q75rP7I3sfPBRWMqIPLYPdcUEIestMO9CQ4WODTcWs=; b=VL0jbNyqQkiIc/
	CQKh7frQ3k+49yWDyxNa3kAVPOMWc+P1Q5nUc8ulw36MJgRxLr/Lg8ZrF6zag75Z2Pku6JDRkBZlH
	+1F9BPZw++ZEVxqCtlBzIfZbs+1n7i5qIVhSeYHp9cK8yohiNs96v8v/qxagftHDrB7IWoRqzs+xf
	6oCWQyvnK+5pxgSwPQ8dNebnSd0cV/blcgAhJq87KRDmUoTHFrdWQHP/uqeMl/WYFM2gu1PXW9qfZ
	t4onivSi8NbDYvI02PDRB3muG1zandgglc6qgHabw+nHke3umZXpm1cdp4enp6AzpvIcw/ZmbACH1
	LH5VUlpQo60H24dSjMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1me0Ie-00BsPX-VW; Fri, 22 Oct 2021 19:33:56 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1me0IQ-00BsGc-1t
 for linux-mediatek@lists.infradead.org; Fri, 22 Oct 2021 19:33:43 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id f90b2a83-336e-11ec-9c3f-0050568c148b;
 Fri, 22 Oct 2021 19:33:45 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 65D59194B23;
 Fri, 22 Oct 2021 21:33:39 +0200 (CEST)
Date: Fri, 22 Oct 2021 21:33:38 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 3/7] drm/bridge: Add
 drm_atomic_get_new_crtc_for_bridge() helper
Message-ID: <YXMSEqUKJwyu6nqT@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-4-sam@ravnborg.org>
 <20211022110355.3q2yhlaygz4lgzhe@gilmour>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022110355.3q2yhlaygz4lgzhe@gilmour>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_123342_265708_C92D4973 
X-CRM114-Status: GOOD (  26.34  )
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

Hi Maxime,

On Fri, Oct 22, 2021 at 01:03:55PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Oct 20, 2021 at 08:18:57PM +0200, Sam Ravnborg wrote:
> > drm_atomic_get_new_crtc_for_bridge() will be used by bridge
> > drivers to provide easy access to the mode from the
> > drm_bridge_funcs operations.
> > 
> > The helper will be useful in the conversion to the atomic
> > operations of struct drm_bridge_funcs.
> > 
> > v2:
> >   - Renamed to drm_atomic_get_new_crtc_for_bridge (Maxime)
> >   - Use atomic_state, not bridge_State (Maxime)
> >   - Drop WARN on crtc_state as it is a valid case (Maxime)
> >   - Added small code snip to help readers
> >   - Updated description, fixed kernel-doc and exported the symbol
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_atomic.c | 42 ++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_atomic.h     |  3 +++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index ff1416cd609a..8b107194b157 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1134,6 +1134,48 @@ drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
> >  }
> >  EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
> >  
> > +/**
> > + * drm_atomic_get_new_crtc_for_bridge - get new crtc_state for the bridge
> > + * @state: state of the bridge
> > + * @bridge: bridge object
> 
> I appreciate that the function name is fairly long already, but given
> its name I'd expect it to return a drm_crtc, not drm_crtc_state.
> 
> All the other state related functions are named using the pattern
> drm_atomic_get_(old|new)_$object_state.
> 
> Moreover, we already have a drm_atomic_get_new_connector_for_encoder
> function that does return a drm_connector, so I think we should make it
> consistent there and call it drm_atomic_get_new_crtc_state_for_bridge

That's a better name - thanks! I will fix it in v3.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
