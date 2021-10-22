Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA3AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 19:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E1D60F6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 19:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23E1D60F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H08/RsCrxFNDJu1HTeED9/XMnScK94n3ozr+FTZuBkQ=; b=MMyKuNABXYV5oF
	51pTrwbMnxnwgYQY0Wb9k2dtP0DyTrqubHyjWLZiKj8ongRlOp7N8eInr15V1AIhXQ/SmL9tPx52h
	tn2tcz906Yc61jwEzCrw/fMRUYegKuxvm0kDwTLt8vg7PZO2szKF/uAhtMzYDk2p39agz0zFmUstK
	h0cNPZEgfhdJS5TcjCcWODO67FuWJGpc487HpDznhdeJtme/GjL+bQer4DBJf+2HDVDRBgLPWjlxz
	bWGbfgfT03dfVSMvnBG5UtR5PsrB1pfqXBaCFAYU/QyGnmEgNJHxO/qZiGCw5WYm0nfJ6GKAofK2l
	pmDtcLPgKFSI19vAQNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1me0H3-00Brvw-U0; Fri, 22 Oct 2021 19:32:17 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1me0H1-00Brv0-F7
 for linux-mediatek@lists.infradead.org; Fri, 22 Oct 2021 19:32:17 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id c44089ca-336e-11ec-9c3f-0050568c148b;
 Fri, 22 Oct 2021 19:32:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2C439194B23;
 Fri, 22 Oct 2021 21:32:09 +0200 (CEST)
Date: Fri, 22 Oct 2021 21:32:08 +0200
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
Message-ID: <YXMRuKkWyF9tGhG3@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-2-sam@ravnborg.org>
 <YXLHlaLfPD4wI7R7@pendragon.ideasonboard.com>
 <YXLsbp+IwiRYfY2a@ravnborg.org> <YXLxVoA133IEes6p@ravnborg.org>
 <YXMGHYY40+aPuDm7@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXMGHYY40+aPuDm7@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_123215_827375_67C94BCA 
X-CRM114-Status: GOOD (  27.44  )
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

On Fri, Oct 22, 2021 at 09:42:37PM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> On Fri, Oct 22, 2021 at 07:13:58PM +0200, Sam Ravnborg wrote:
> > Hi Laurent,
> > 
> > > From a quick look only cadence/cdns-mhdp8546 subclass
> > > drm_bridge_state and I wonder if the right thing to do would be to
> > > implement fallback to the helpers if the bridge driver do not set
> > > any of the .atomic_duplicate_state(), .atomic_destroy_state(), or .atomic_reset().
> > > 
> > > That would drop the following from a few bridges:
> > >         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > >         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > >         .atomic_reset = drm_atomic_helper_bridge_reset,
> > 
> > To answer myself here. This would create a dependency from the core to
> > the helpers which is not OK so idea dropped again.
> 
> I agree it would be nicer, but the dependency is likely a problem. That
> being said, we have multiple types of helpers. The first set is the
> modeset helpers, which were designed as one implementation of KMS
> operations, with an opt-in API for drivers. The core should not depend
> on those. There are however other helpers that are only default
> implementations of some operations, without any dependency on other
> components. The atomic state helpers fall in this category, they
> implement .atomic_* operations of the drm_*_funcs structures, not
> drm_*_helper_funcs. It could make sense to move them to the DRM core.

For now I went with a simple macro:

+/**
+ * DRM_BRIDGE_STATE_OPS - Default drm_bridge state funcs
+ *
+ * Bridge driver that do not subclass &drm_bridge_state can use the helpers
+ * for reset, duplicate, and destroy. This macro provides a shortcut for
+ * setting the helpers in the &drm_bridge_funcs structure.
+ */
+#define DRM_BRIDGE_STATE_OPS \
+       .atomic_reset = drm_atomic_helper_bridge_reset,                         \
+       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,     \
+       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state
+

Thomas Z. is trying to make the core smaller so pulling in these helpers
would be counterproductive to that. So I took the simpler approach here
which we have already done in several places.
It will be part of v3 when I post it.

Drop a note if you (or any other reader) have better ideas.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
