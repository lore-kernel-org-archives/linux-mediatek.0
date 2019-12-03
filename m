Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B720BC432C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 08:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D0E92068E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 08:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mhKNpXQ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D0E92068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CQxcGt5EriFHll+5XDYGDa7zxs5BEDWiLOlDYlgjiM=; b=mhKNpXQ/MboOfA
	b9OKht3/B12F6QNQ1oteMmMB6Xy1Wl6rm1dMb1s82wzhUR8jVYj8nmlPB1N48nL4aJUxvIKecVzXt
	z9bZHZKEqAzmKZs1mUz58mvXHZuDvzU47auUhP+tnqC/LOsscpttgSd8yK2NcJNDwwVZb26MRHTlV
	qw69iO/ej2dWAdgShPmoJ00gN//lZj9UXPwmReLkd+iE/WOKsnk/amUMuMR+1TJPDx6l6EHJZ7geP
	HZGK6bbMB5Ptv+zse6JRHaafSX6LP+8yjNL2WvJgBgaN1QJHd/eEILjtVYudx7NdgTVjVe1UB3MXy
	eswcG1ocNJkGzCi5hh2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic3dL-0001Yg-J5; Tue, 03 Dec 2019 08:34:11 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic3dB-0001Pd-P2; Tue, 03 Dec 2019 08:34:03 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 33C3D80478;
 Tue,  3 Dec 2019 09:33:53 +0100 (CET)
Date: Tue, 3 Dec 2019 09:33:51 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
Message-ID: <20191203083351.GA30687@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191203072443.GK4730@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203072443.GK4730@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=9hfdOVt4OdhUXmoMrC4A:9 a=CjuIK1q_8ugA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_003402_002076_FBC1B70D 
X-CRM114-Status: GOOD (  22.99  )
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
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stefan Agner <stefan@agner.ch>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Laurent.

> > This patchset include a couple of different
> > things - all related to panels.
> > 
> > - The panel callbacks are optional - so drop error if
> >   callback is not present.
> >  
> > - Add support for backlight in drm_panel.
> >   This allows us to make much simpler backlight
> >   support to most panels.
> >   The patchset include conversion of most of the
> >   trivial cases.
> > 
> > - Drop drm_connector from drm_panel.
> >   This change required many changes to most
> >   panels and many bridges and display drivers.
> >   This is by far the most invasive change in this patchset.
> > 
> > - Drop the unused get_timings() callback.
> >   No users, so no need to keep it around.
> > 
> > With this patchset drm_panel_(attach|detach) are nop's
> > but they are kept for now.
> > 
> > A few of these patches has been sent out before - but versioning
> > started again from v1 - as the most patches are new.
> > 
> > I have tested the panel-simple changes, and thus some
> > of the infrastructure changes.
> > The testing was done on an earlier iteration - and I ended
> > up submitting this as Laurent and others started to depend on it.
> > Jitao has a patch to add more callbacks, and I wanted the
> > simplification of the callbacks before we add more callbacks.
> 
> Great series !!! Thanks for working on this.
And likewise - thanks for the detailed reviews!

I have a patch to remove drm_panel_(attach|detach),
but they was not included because there is also a patchset floating
that add more functionality to these.

I will address the feedback, it looked all straighforward, and post
an updated series.

> drm/panel: remove get_timings
I will drop this patch as we may need this later.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
