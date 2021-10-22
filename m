Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0ADEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 11:04:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177FD6109E
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 11:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 177FD6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TY2RU88e6PmKuwjUj733ZhdHb1itbbSVEWjnrYCgzK8=; b=EOFTOzXHpx8pGv
	8gp15hsx98AZ9i723gwmeKb4X0aryUw86Sf09ydnRgdiAhxjnZhlJa4NIeQMgWk4gDlHDZVWKSieg
	eKouGCz1y+v8Wo5MRIgBoZ5Js13KIgTUxDMwBO4f/CgXQPuLxHEnicV4e+zilRvjpJ/PPDkgz3Enm
	VysNKIBDvgAxMFtvO0kfBUsojKs7mpg7umJyfmYuqHe7TXFZ3/0sa9SbtrRLcscwja2Sjt5ketLex
	70rrOUigcjXrOU5VUgqwOwUlMqmMFGwB0wXX09nVMWKBg2xJ0PJ9qHbKdGRsICEIi+m8VWFIZgh4V
	+3yUA+EhkW3FZ009vZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdsLU-00AbxP-LH; Fri, 22 Oct 2021 11:04:20 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdsLH-00Abvl-P9; Fri, 22 Oct 2021 11:04:09 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id EA67D2B011AD;
 Fri, 22 Oct 2021 07:04:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 22 Oct 2021 07:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=R
 hOl0lHzC84L8O9/tU1HXPTdlO+gLkEg4xBzwJrEpBg=; b=dflJszuMTdoPPpLb4
 Z579y2cmGkicOcZ/eS7yznApNddspK5HtGFXSpxulv6CnlVA8lCmZtRvIhpVPJNf
 HH8Di/CFiib2rjJd8p8z7OV/pXDiDJyn5I5IYVKEHiSFEcJw/UIOH9q/lQ/H8zm5
 dj+Sg7mAPub5CgtqCq2n3FGiVp4lN/hqm9T/jlk39GwS4JgrX2Tiu6kD/c77qxV4
 ePZrriWPZwNNOWmet1QuFbehNazF6r+3vtpiwqxnZf5iYV/GpRxVDfXWlC7y8jTQ
 vDsM4lRVCzE5sjEBazXwWYWWPaoVnJxAc+S5XBTxIoMjFFngf65H9/zg438NrBKy
 NxzjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=RhOl0lHzC84L8O9/tU1HXPTdlO+gLkEg4xBzwJrEp
 Bg=; b=ls4YL/Ol4nHeZ3DkYjh/uKQCRr+UbZOOjsz5NMHTKoxTRZRj6WIMCb5JD
 R5/kdV9w6C8dZHDJpMUE+6ai2KBxsZUSWVM4wUCu6JSHqCmqiS9Q+RWGm2wu04NR
 VEUtyGvK5v3LUOjUepqmmXFU0thC6QZ2qJXfDoJJInN8Klg4l+YYLbiahOrvL9N7
 ItsNaiNgTw+GmBhyF2cxmz3Bwv3ap+ZY8bzCAyVT1z3zC4wb3n8AhOw4srdNM3Wq
 mR5Ixw7Ou5bk5S0MhJnKzj7Cp7Hr2xjS9s1xRnINM4WHO58pHt0yNx0QHNxxLeEB
 RXhyHFNsouvOKaBEvr3MKcLqvEDgA==
X-ME-Sender: <xms:nppyYQmNDYW4bn_-hLWLGE-rTZ37vX_QKiQddXuU-mWpio8YvyPE3A>
 <xme:nppyYf0-ve1iGvS8z7iZInZpnVbNZBgis3yYkjVJQK0nJqOhHpF8tnUPNCSuV3LSd
 WosdgDTbFMrY8mS-Dc>
X-ME-Received: <xmr:nppyYep3x66XpauqkKc6YtOL1iGQYQ4fwpkhAm5nwEVsmrxRybZ1NFCy_qPgSuQXV3YVD2nd1kwgsEv5QFhcXandg0UXzANRkQ2Zf4Aj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvkedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nppyYcm2RV0zZBB41CDiG3P_hDo6-hkI6wbuWVOLcVJxqSuh3seM7g>
 <xmx:nppyYe0td2T0Mevwdw2FvhzroM9USM_iZbnv4j6uBu0y6yMUBER9BQ>
 <xmx:nppyYTsYZDcyd1MonCzMlae3b3TLwBUFXdHt4VryGQXNMyubGKn8DA>
 <xmx:oJpyYYWQe0wBt92zV1VspGP7hbk013hJniVu9YDMWfJXBQyeoSk5MFDRtAU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Oct 2021 07:03:57 -0400 (EDT)
Date: Fri, 22 Oct 2021 13:03:55 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
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
Message-ID: <20211022110355.3q2yhlaygz4lgzhe@gilmour>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020181901.2114645-4-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_040408_040002_EC612BBF 
X-CRM114-Status: GOOD (  19.13  )
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

Hi,

On Wed, Oct 20, 2021 at 08:18:57PM +0200, Sam Ravnborg wrote:
> drm_atomic_get_new_crtc_for_bridge() will be used by bridge
> drivers to provide easy access to the mode from the
> drm_bridge_funcs operations.
> 
> The helper will be useful in the conversion to the atomic
> operations of struct drm_bridge_funcs.
> 
> v2:
>   - Renamed to drm_atomic_get_new_crtc_for_bridge (Maxime)
>   - Use atomic_state, not bridge_State (Maxime)
>   - Drop WARN on crtc_state as it is a valid case (Maxime)
>   - Added small code snip to help readers
>   - Updated description, fixed kernel-doc and exported the symbol
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_atomic.c | 42 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic.h     |  3 +++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index ff1416cd609a..8b107194b157 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1134,6 +1134,48 @@ drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
>  }
>  EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
>  
> +/**
> + * drm_atomic_get_new_crtc_for_bridge - get new crtc_state for the bridge
> + * @state: state of the bridge
> + * @bridge: bridge object

I appreciate that the function name is fairly long already, but given
its name I'd expect it to return a drm_crtc, not drm_crtc_state.

All the other state related functions are named using the pattern
drm_atomic_get_(old|new)_$object_state.

Moreover, we already have a drm_atomic_get_new_connector_for_encoder
function that does return a drm_connector, so I think we should make it
consistent there and call it drm_atomic_get_new_crtc_state_for_bridge

Maxime

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
