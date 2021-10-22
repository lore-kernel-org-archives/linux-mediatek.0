Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B01C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 18:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D30361181
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 18:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D30361181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5MliheuJIYLh77AS/KmForzx6cINgD+CCQQR4REENQ=; b=rJ1/iH1g2WeiM9
	mZNmRJvzK6IarMSAj6VqkwEO2LEV+Q6H2nAobmaK4W/MmuEWIKohzodS/96SjNdwExOY9hKlt2kFu
	DD8s2TOTx4HRpm8bCP185Qi/axKXr7SsUF+hfppTs/Wt8cIAofMyOu5oEK/vhKgM3xkgXf1JwTZl7
	c+Zf19CfvfnKUwVEgRSwKu6Xrm6T+OUL3vji1UBW+54Yo60cItWL6AIJk0VU5UHWuM+LfHZ67nF7N
	Fbm67dJp9MHCnTYWy6gEXCLnZFP9X+pK1dVG2XWXktXo8fD2PWPNvSskGHmuC7iJBDb8XAiuG+iQw
	oAhOJVMfJ/sBWcsrF+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdzVb-00BkgF-1N; Fri, 22 Oct 2021 18:43:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdzVO-00BkeT-Iq; Fri, 22 Oct 2021 18:43:04 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E42D51D;
 Fri, 22 Oct 2021 20:42:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634928177;
 bh=9b75vpvnNzR2RS5hMlZLa4f5UwudSSS5cCdLc7IPG4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mfIu+fWrA5jTPxZpcl4BuyndzDKwWirndooXR7dpKtJusgVGipDKhNUZQEsBRw5LU
 uvEmCzaQKD6pweNyf+wAlGqsMbEFRJ7yOBvNiXPhoi5zkf2qqcx/23zK5I5ap03oha
 Dllc8IqmfNcPCXc05kXfCdqa+36ieFa/PtbSLO8A=
Date: Fri, 22 Oct 2021 21:42:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
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
Message-ID: <YXMGHYY40+aPuDm7@pendragon.ideasonboard.com>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-2-sam@ravnborg.org>
 <YXLHlaLfPD4wI7R7@pendragon.ideasonboard.com>
 <YXLsbp+IwiRYfY2a@ravnborg.org> <YXLxVoA133IEes6p@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXLxVoA133IEes6p@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_114302_803391_B82FB0D0 
X-CRM114-Status: GOOD (  16.49  )
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

Hi Sam,

On Fri, Oct 22, 2021 at 07:13:58PM +0200, Sam Ravnborg wrote:
> Hi Laurent,
> 
> > From a quick look only cadence/cdns-mhdp8546 subclass
> > drm_bridge_state and I wonder if the right thing to do would be to
> > implement fallback to the helpers if the bridge driver do not set
> > any of the .atomic_duplicate_state(), .atomic_destroy_state(), or .atomic_reset().
> > 
> > That would drop the following from a few bridges:
> >         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> >         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> >         .atomic_reset = drm_atomic_helper_bridge_reset,
> 
> To answer myself here. This would create a dependency from the core to
> the helpers which is not OK so idea dropped again.

I agree it would be nicer, but the dependency is likely a problem. That
being said, we have multiple types of helpers. The first set is the
modeset helpers, which were designed as one implementation of KMS
operations, with an opt-in API for drivers. The core should not depend
on those. There are however other helpers that are only default
implementations of some operations, without any dependency on other
components. The atomic state helpers fall in this category, they
implement .atomic_* operations of the drm_*_funcs structures, not
drm_*_helper_funcs. It could make sense to move them to the DRM core.

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
