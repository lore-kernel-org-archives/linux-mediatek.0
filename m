Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4279C88E7D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+W8jzUN9Nr4o39KHusBPRBAUepoUVjLuBu5Yy8yLeM=; b=hZb702iqO5d+aZuAtBGvVq4vNV
	iZS2oU+ZHmDQL7UyXNjBuGNi75n/YL/aJbxu9zQcfm13GoyqXmFpos5qpWsaMoMBKNIo4/jKiFpHV
	FvNRKiA56lzfKrWG4H44CRG+G6BE0aTrGvAx8enoNea3LG9WxCVNDQGhuYUsZzZ/IoDXtjZqoJd3a
	jTyGVrlrkTRZ+kVfUt+PUw1RW31xkiWDPT6k7bqiRl1rk9xEaHMaToR4gVh4ykbCWcgRm5uUaA24G
	21W15CCKtZN7cjcpPHyTNZb7CstzyWAcTlTAaqTk6ODSj98vWYT2vpX5WXBe6ZjqdGzK1XMqHuVhf
	4NhcHDtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WOD-00000007UpP-2GkN;
	Tue, 15 Sep 2026 16:52:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WO9-00000007Una-3I3G;
	Tue, 15 Sep 2026 16:52:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3D81B1A0809;
	Tue, 15 Sep 2026 16:52:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 024C7602B0;
	Tue, 15 Sep 2026 16:52:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC5D711C7AFE9;
	Tue, 15 Sep 2026 18:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789491119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J+W8jzUN9Nr4o39KHusBPRBAUepoUVjLuBu5Yy8yLeM=;
	b=ztDWLvYgvZDO6Q/PM5ZMPZFmmQ6qzwP0+voZl57rf+NwnScvs96wJoeW/LpJJziSuQyN+H
	xwB9A2e9BnlDTrQb2LO4ARd9cHDH4SB+R1ufzxeltVj9SuKsHRTtGhRj8NXYs+Mj22BGIi
	lTwczkyi44rEUMIUuKqGCqhhgY/RGCyXPwiGLyKBPHl2ICnwTorL0/n7ZiEeBvjL/XHk++
	0TVj6o3V38psNtbQ7v2UjYzvOcLcB8wAZeaEmqkU9gpL+sf+v3gyY5ymXMOC+KkUpd9ipH
	W55kT1pOSM6FFQE2QyA6zDsDuxVDIUK4/es0tZsRC4YmHOxHN59A1peoDI94nQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 18:51:47 +0200
Message-Id: <DLG1NM1TYW5E.IEVBU2FZSJDD@bootlin.com>
Subject: Re: [PATCH v4 0/9] drm/bridge: Kconfig: cleanup DRM_PANEL usage
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Christopher Vollo"
 <chris@renewoutreach.org>, "Sean Paul" <seanpaul@chromium.org>, "Vincent
 Palatin" <vpalatin@chromium.org>, "Tony Lindgren" <tony@atomide.com>,
 "Michael Walle" <mwalle@kernel.org>, "Vinay Simha BN" <simhavcs@gmail.com>,
 "Maoyi Xie" <maoyixie.tju@gmail.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Andrey Gusakov" <andrey.gusakov@cogentembedded.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Peter Ujfalusi"
 <peter.ujfalusi@ti.com>, "Svyatoslav Ryhel" <clamor95@gmail.com>, "Sam
 Ravnborg" <sam@ravnborg.org>, <sashiko-bot@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Andrey Gusakov"
 <andrey.gusakov@cogentembedded.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Christopher Vollo" <chris@renewoutreach.org>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Maoyi Xie" <maoyixie.tju@gmail.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Michael Walle" <mwalle@kernel.org>, "Peter Ujfalusi"
 <peter.ujfalusi@ti.com>, "Sam Ravnborg" <sam@ravnborg.org>, "Sean Paul"
 <seanpaul@chromium.org>, "Svyatoslav Ryhel" <clamor95@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Tony Lindgren"
 <tony@atomide.com>, "Vinay Simha BN" <simhavcs@gmail.com>, "Vincent
 Palatin" <vpalatin@chromium.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_095209_968935_0EB8E40E 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Andrey, Andy, Christopher, Jagan, Maoyi, Marek, Marek, Michael,
Peter, Sam, Sean, Svyatoslav, Tomi, Tony, Vinay, Vincent,

On Tue Sep 15, 2026 at 6:46 PM CEST, Luca Ceresoli wrote:
> As a cleanup in preparation for making every drm_panel embed a drm_bridge=
,
> fix missing or unnecessary usage of DRM_PANEL and DRM_PANEL_BRIDGE in
> drivers/gpu/drm/bridge/Kconfig.

these patches are trivial oneliners and other work depends on them, but
cannot be applied as they have no reviews so far.

I'd appreciate if you could find a moment to review those you are in Cc as
maintainers, reviewers or recent contributors (and other patches in the
series you might find interesting).

Being just Kconfig changes, there should be no runtime regressions, only
build failures in the worst case.

Thank you in advance for your time.

Kind regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

