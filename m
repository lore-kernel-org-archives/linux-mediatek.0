Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996DCC43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 22:05:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68680206D5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 22:05:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hiEefVeJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68680206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3e/UTRiUxGHmVrvgxfpWBN/ANtiLBRBkPsgEw//tlMY=; b=hiEefVeJsc/1O2
	DA10SRwpZ2lvUK2W1K2LAjvApf+Bbi1nUibyu8ZoO4FjcYTfOZROFLzwoT0OB/STuTdaTXvbdHEtf
	Vq/kf/wX1Tfj85lIeRk5AFOEy6fjNX+xK1SbiBdBU9MLG4U89zTtZgR2yXyueDKiyvOlAWgbacqMy
	qQhHEP9OzA+BV0iHuG4Tr6nJOkbN4bdQwCxlaLEbNF2/3pzcjz7v8Mj+fkYNghjWPqDtiYMTZeZCi
	DF/gIzITZIQrMsWVyV8+niA+/0E1d+NDtsxajhTs+IOZDxPTZ/FkSwJd+jwmzX4H+Cx40yznKJf2S
	0uAtDsNtgc/n1vpzuxdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieR9f-00048J-Ir; Mon, 09 Dec 2019 22:05:23 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieR9U-0003BU-RG; Mon, 09 Dec 2019 22:05:15 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9E94580514;
 Mon,  9 Dec 2019 23:05:01 +0100 (CET)
Date: Mon, 9 Dec 2019 23:04:59 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/25] drm/panel infrastructure + backlight update
Message-ID: <20191209220459.GA11015@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=-e7YKnP9ej6YZVhYjlAA:9 a=CjuIK1q_8ugA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_140514_037362_6D9F781A 
X-CRM114-Status: GOOD (  20.06  )
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
 Stefan Agner <stefan@agner.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
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

On Sat, Dec 07, 2019 at 03:03:28PM +0100, Sam Ravnborg wrote:
> This patchset include a couple of different
> things - all related to panels.
> 
> - The callbacks are optional - so drop error if
>   callback is not present.
>  
> - Add support for backlight in drm_panel.
>   This allows us to make much simpler backlight
>   support to most panels.
>   The patchset include conversion of most of the
>   trivial cases.
> 
> - Drop drm_connector from drm_panel.
>   This change required many changes to most
>   panels and many bridges and display drivers.
>   This is by far the most invasive change in this patchset.
> 
> With this patchset drm_panel_(attach|detach) are nop's
> but they are kept for now.
> 
> A few of these patches has been sent out before - but versioning
> started again from v1 - as the most patches are new.
> 
> I have tested the panel-simple changes, and thus some
> of the infrastructure changes.
> The testing was done on an earlier iteration - and I ended
> up submitting this as Laurent and others started to depend on it.
> 
> v2:
>   This is mostly addressing comments from Laurent.
>   - drop get_timings removal, we should start using it
>   - do not fail in drm_panel_of_backlight() if DT is not enabled
>   - updated changelogs and code comments in many places (thanks Laurent!)
>   - get_modes is a mandatory callback - return -EOPNOTSUPP if not specified
>   - log if backlight update fails
>   - added a-b/r-bs
>     o thanks to Laurent and Linus for the prompt reviews!
> 
> When "drm/panel: add backlight support" is reviewed I plan to
> apply the full series to drm-misc-next.

Fixed the last bits pointed out by Laurent and pushed to drm-misc-next.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
