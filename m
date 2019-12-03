Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A6CC432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 08:39:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B47AE20640
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 08:39:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jlhThof4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B47AE20640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2jWrljMG52dP4rlkJYBT7x61VTlSCFvBV6+ZfWmztw=; b=jlhThof4STMdfV
	kXnOXMrxtGls1jjgH+zssPFMU3qyVkYd6xA7O9rbsQkuigvce2NpXN4W8n3/WQyfAKm6EKYFQHOWx
	Tjg++Agd0WQdc02dhrGhhZxoMxRcI0pAXNYZHsmpOb5h9+GR1usiXIfZwbM07/UZ1UqSO0ky1FlPr
	ca77aL5QIBbSo31qilyqcrW3kD5R+RHdXOrQcprkeXokk5ctadII13IfPGgLE9iqxb2roDnHA0f8S
	aDC28Fg/b7ihazl4SDCSsMqOWSOMIc5GPJaYq7p5YsiwD95zZ4zEJRH6vIPiQyaHE23nLj/1OtQh2
	bQmbN2LmsUfk8U6kFp1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic3ip-0003ZE-Np; Tue, 03 Dec 2019 08:39:51 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic3ie-0003SH-QM; Tue, 03 Dec 2019 08:39:45 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5E20E80477;
 Tue,  3 Dec 2019 09:39:37 +0100 (CET)
Date: Tue, 3 Dec 2019 09:39:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
Message-ID: <20191203083935.GB30687@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=pGLkceISAAAA:8 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=-nbbn2pJxVWvY7Vi8LwA:9 a=Vfx8YJUf9hFrv8O-:21 a=HM9-6MrTAUSx7c7w:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
 a=AjGcO6oz07-iQ99wixmX:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_003941_216206_895D252C 
X-CRM114-Status: GOOD (  29.73  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-mediatek@lists.infradead.org,
 Stefan Agner <stefan@agner.ch>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Maxime.

On Tue, Dec 03, 2019 at 08:46:59AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Dec 02, 2019 at 08:32:11PM +0100, Sam Ravnborg wrote:
> > There was no users - so remove it.
> > The callback was implemented in two drivers - deleted.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 18 ------------------
> >  drivers/gpu/drm/panel/panel-simple.c        | 18 ------------------
> >  include/drm/drm_panel.h                     |  9 ---------
> >  3 files changed, 45 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > index b878930b17e4..3bcba64235c4 100644
> > --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > +++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > @@ -217,30 +217,12 @@ static int seiko_panel_get_modes(struct drm_panel *panel,
> >  	return seiko_panel_get_fixed_modes(p, connector);
> >  }
> >
> > -static int seiko_panel_get_timings(struct drm_panel *panel,
> > -				    unsigned int num_timings,
> > -				    struct display_timing *timings)
> > -{
> > -	struct seiko_panel *p = to_seiko_panel(panel);
> > -	unsigned int i;
> > -
> > -	if (p->desc->num_timings < num_timings)
> > -		num_timings = p->desc->num_timings;
> > -
> > -	if (timings)
> > -		for (i = 0; i < num_timings; i++)
> > -			timings[i] = p->desc->timings[i];
> > -
> > -	return p->desc->num_timings;
> > -}
> > -
> >  static const struct drm_panel_funcs seiko_panel_funcs = {
> >  	.disable = seiko_panel_disable,
> >  	.unprepare = seiko_panel_unprepare,
> >  	.prepare = seiko_panel_prepare,
> >  	.enable = seiko_panel_enable,
> >  	.get_modes = seiko_panel_get_modes,
> > -	.get_timings = seiko_panel_get_timings,
> >  };
> 
> If anything, I think we should grow the usage of timings and / or make
> it usable by everyone.
> 
> Using only the mode as we do currently has a bunch of shortcomings as
> almost no encoder will be able to provide the typical pixel clock, and
> that situation leads to multiple things:
> 
>   - If someone working on one encoder wants to upstream a panel they
>     have tested, chances are this will not be the typical pixel clock
>     / timings being used but rather the one that will match what that
>     SoC is capable of. Trouble comes when a second user comes in with
>     a different encoder and different capabilities, and then we have a
>     maintainance fight over which timing is the true timing (with a
>     significant chance that none of them are).
> 
>   - If we can't match the pixel clock, we currently have no easy way
>     to make the usual measures of reducing / growing the porches and
>     blankings areas to match the pixel clock we can provide, since we
>     don't have an easy way to get the tolerance on those timings for a
>     given panel. There's some ad hoc solutions on some drivers (I
>     think vc4 has that?) to ignore the panel and just play around with
>     the timings, but I think this should be generalised.
> 
> Timings solves the first case since we have the operating range now
> and not a single set of timings, and it solves the second since we can
> use that range to take those measures instead of taking a shot in the
> dark.
> 
> I appreciate that it's pretty far from where we are today, but
> removing the get_timings means that all the timings already defined in
> the panel drivers are becoming useless too, and that eventually it
> will get removed.

Thanks for this nice explanation. I will drop the patch,
and add an entry to my TODO list to look closer at this later.
There are things to improve in this area.

So the conclusion is more work rather than removing code :-)

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
