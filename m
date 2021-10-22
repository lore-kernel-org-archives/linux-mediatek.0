Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 16:53:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04D26611BD
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 16:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04D26611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJyX2423ABjXOx3qCKpMwxEjDwaBKkyavqPKruilHBc=; b=O9L3z4BWlHy8ML
	kY4eHJkgJns2cCzchSxNjYCOCM1afKILqOyuAkXlIDqcfZP1EUXIbkW4//GNJkHPieI40TBwccxmb
	8EUFp/st5a8S4EOMr9V05l6kduSK/CEeD7w6T6Uch0JwVCpaEda++2XK9UE1KN0iZ0FZ3ZQrgySTB
	lVyq4I7tfgtxPlpxHOCocR0O/1P/iKYquLxzJRLPCfHdNdm/Luhev2OOJBoaCURAhL8SCiQCg+Ez0
	9klbgnFgyepiYA5XgAO44OP/7LBrMOkNQ0034xBgHgfVZANttfRYBSiMHoUI882SCgvHxkgdCMUV3
	/yjVkkmddyd+pe5Rs8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdxnC-00BYL9-JY; Fri, 22 Oct 2021 16:53:18 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdxn9-00BYJM-3L
 for linux-mediatek@lists.infradead.org; Fri, 22 Oct 2021 16:53:17 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 8aef5764-3358-11ec-9c3f-0050568c148b;
 Fri, 22 Oct 2021 16:53:12 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 18998194B9C;
 Fri, 22 Oct 2021 18:53:04 +0200 (CEST)
Date: Fri, 22 Oct 2021 18:53:02 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 1/7] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Message-ID: <YXLsbp+IwiRYfY2a@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-2-sam@ravnborg.org>
 <YXLHlaLfPD4wI7R7@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXLHlaLfPD4wI7R7@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_095315_316691_63181DFD 
X-CRM114-Status: GOOD (  18.16  )
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

Hi Laurent,

> > @@ -508,8 +510,8 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
> >  	.attach = ps8640_bridge_attach,
> >  	.detach = ps8640_bridge_detach,
> >  	.get_edid = ps8640_bridge_get_edid,
> > -	.post_disable = ps8640_post_disable,
> > -	.pre_enable = ps8640_pre_enable,
> > +	.atomic_post_disable = ps8640_atomic_post_disable,
> > +	.atomic_pre_enable = ps8640_atomic_pre_enable,
> 
> Don't you also need to implement .atomic_duplicate_state(),
> .atomic_destroy_state() and .atomic_reset() to use the atomic API ?

What I think happens is that the atomic drivers uses the bridges and
the implementation in drm_bridge has fall-backs to the non-atomic
variants.

So for example drm_atomic_bridge_chain_pre_enable() will call
atomic_pre_enable() if it exists, and if not it will call pre_enable()
if it exists.

With this patch-set I show that the non-atomic versions of several of
the drm_bridge helper functions are almost not used and easy to drop.
So based on this I concluded that the bridge drivers were used
in a way so we only would need to implement the atomic variants
of the functions.

That said I did not consider .atomic_duplicate_state(),
.atomic_destroy_state(), or .atomic_reset().

From a quick look only cadence/cdns-mhdp8546 subclass
drm_bridge_state and I wonder if the right thing to do would be to
implement fallback to the helpers if the bridge driver do not set
any of the .atomic_duplicate_state(), .atomic_destroy_state(), or .atomic_reset().

That would drop the following from a few bridges:
        .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
        .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
        .atomic_reset = drm_atomic_helper_bridge_reset,

And new bridges (or bridges we convert to use the atomic operations)
would not have to specify them.

I would prefer implementing the fallback - rather than adding the above
to this driver.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
