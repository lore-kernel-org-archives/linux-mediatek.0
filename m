Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1273DC432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 15:31:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C34FD20678
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 15:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bg1lqtlE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gLwe3PqL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C34FD20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0U7qy+LsctqXkVImiHb9htYyfaIFdTRNHBXeqqrOdc=; b=Bg1lqtlE8/ihYm
	5Po7zsZfWk8R6aaamqN1HwKjpm94soiyoU7wbubapXwRO8cY0VBf9l8mC7JnaP/5h2Bq57iPJfQxq
	gxDSMShrkw04a0MG4Mk0xpFpi1V7SNOXF7gtcmhSmBcL8LZV6qkc4zYjPmnrmy8PWXJApPAiyORGD
	mCi8f2j6jF0634HP5dH9mhJLrLqbYCNKptu3bKPhN4fi+UllqL7J3n1GBj+uNY/yehmNbsHB2/hVM
	GHKshWUiF3o/nbV2wwBeN+bReorZINo7FcklmairrVoKgpPmxwjMQyrgHJY4bLloQotBPG68VLoa6
	3t+4E39iIVqe18NIztaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZco1-00026J-0H; Tue, 26 Nov 2019 15:31:09 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZcnw-0004QW-MS; Tue, 26 Nov 2019 15:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DlNhcJrW82VQLzwOQJiBrq1IxE5Asbw/cwpY6rFxlbs=; b=gLwe3PqLXZi9HxsLBEPWfxAIS
 a02nhyqsj6yY30KBz2UJtse9C8IqFlWTzE/aDxGxJVn+s1XVPe1zTiWAkCl5Fu4oITS+VWxLehqtB
 SD1ODgufQ3iJv0DlhX8Y2WvAmhkzk7D/Z89OKN5lESAPzRo3RQ6kx4TxCtDGpjtuJV8ZwquMYJtZw
 InZ29NEM9Uk9CraNUbXDKiYDNo6xXMgtE2DpsqKHmhgWMoyk4WlqVrX832+m69Cr81Q7nZrqnQ6hz
 vrvztKJ2mDxQ1fUnYEVarHuH5QQE8MFsCkCetEqOrAVhE1JZRF3Dk/Tb5P136b64Tj6KCeCfm0DHE
 zoPRKh4oQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44912)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iZckV-0006LI-J9; Tue, 26 Nov 2019 15:27:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iZckG-0007ie-KX; Tue, 26 Nov 2019 15:27:16 +0000
Date: Tue, 26 Nov 2019 15:27:16 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH 00/30] drm/bridge: Add device links for lifetime control
Message-ID: <20191126152716.GY25745@shell.armlinux.org.uk>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_073105_115644_93FA0503 
X-CRM114-Status: GOOD (  19.66  )
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
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Clark <robdclark@chromium.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Kukjin Kim <kgene@kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Brian Masney <masneyb@onstation.org>, Maxime Ripard <mripard@kernel.org>,
 Inki Dae <inki.dae@samsung.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 Matt Redfearn <matt.redfearn@thinci.com>,
 Yannick =?iso-8859-1?Q?Fertr=E9?= <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Torsten Duwe <duwe@lst.de>, Daniel Vetter <daniel@ffwll.ch>,
 Icenowy Zheng <icenowy@aosc.io>, Brian Starkey <Brian.Starkey@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

What happened with the patches I posted doing exactly this?

On Tue, Nov 26, 2019 at 01:15:58PM +0000, Mihail Atanassov wrote:
> Hi all,
> 
> This series adds device links support to drm_bridge. The motivation
> behind it is that a drm_bridge in a module could get removed under the
> feet of the bridge user without warning, so we need a way to remove and
> reprobe the client as needed to avoid peering into the void.
> 
> 1: Add a drm_bridge_init() function which wraps all initialisation of
> the structure prior to calling drm_bridge_add().
> 
> 2-26,28: Apply the drm_bridge_init() refactor to every bridge that uses
> drm_bridge_add().
> 
> 27: Minor cleanup in rcar-du.
> 
> 29: Add of_drm_find_bridge_devlink() which functions the same as
> of_drm_find_bridge() plus adds a device device link from the owning
> drm_device to the bridge device.
> 
> 30: As a motivating example, convert komeda to exclusively use
> drm_bridge for its pipe outputs; this isn't a regression in usability
> any more since device links bring the same automatic remove/reprobe
> feature as components.
> 
> Mihail Atanassov (29):
>   drm: Introduce drm_bridge_init()
>   drm/bridge: adv7511: Use drm_bridge_init()
>   drm/bridge: anx6345: Use drm_bridge_init()
>   drm/bridge: anx78xx: Use drm_bridge_init()
>   drm/bridge: cdns: Use drm_bridge_init()
>   drm/bridge: dumb-vga-dac: Use drm_bridge_init()
>   drm/bridge: lvds-encoder: Use drm_bridge_init()
>   drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Use drm_bridge_init()
>   drm/bridge: nxp-ptn3460: Use drm_bridge_init()
>   drm/bridge: panel: Use drm_bridge_init()
>   drm/bridge: ps8622: Use drm_bridge_init()
>   drm/bridge: sii902x: Use drm_bridge_init()
>   gpu: drm: bridge: sii9234: Use drm_bridge_init()
>   drm/bridge: sil_sii8620: Use drm_bridge_init()
>   drm/bridge: dw-hdmi: Use drm_bridge_init()
>   drm/bridge/synopsys: dsi: Use drm_bridge_init()
>   drm/bridge: tc358764: Use drm_bridge_init()
>   drm/bridge: tc358767: Use drm_bridge_init()
>   drm/bridge: thc63: Use drm_bridge_init()
>   drm/bridge: ti-sn65dsi86: Use drm_bridge_init()
>   drm/bridge: ti-tfp410: Use drm_bridge_init()
>   drm/exynos: mic: Use drm_bridge_init()
>   drm/i2c: tda998x: Use drm_bridge_init()
>   drm/mcde: dsi: Use drm_bridge_init()
>   drm/mediatek: hdmi: Use drm_bridge_init()
>   drm: rcar-du: lvds: Use drm_bridge_init()
>   drm: rcar-du: lvds: Don't set drm_bridge private pointer
>   drm/sti: sti_vdo: Use drm_bridge_init()
>   drm/komeda: Use drm_bridge interface for pipe outputs
> 
> Russell King (1):
>   drm/bridge: add support for device links to bridge
> 
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   | 54 ++++++-------
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   | 77 ++++++++++++++++--
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  2 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |  5 +-
>  .../drm/bridge/analogix/analogix-anx6345.c    |  5 +-
>  .../drm/bridge/analogix/analogix-anx78xx.c    |  8 +-
>  drivers/gpu/drm/bridge/cdns-dsi.c             |  4 +-
>  drivers/gpu/drm/bridge/dumb-vga-dac.c         |  6 +-
>  drivers/gpu/drm/bridge/lvds-encoder.c         |  7 +-
>  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  4 +-
>  drivers/gpu/drm/bridge/nxp-ptn3460.c          |  4 +-
>  drivers/gpu/drm/bridge/panel.c                |  7 +-
>  drivers/gpu/drm/bridge/parade-ps8622.c        |  3 +-
>  drivers/gpu/drm/bridge/sii902x.c              |  5 +-
>  drivers/gpu/drm/bridge/sii9234.c              |  3 +-
>  drivers/gpu/drm/bridge/sil-sii8620.c          |  3 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  7 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  7 +-
>  drivers/gpu/drm/bridge/tc358764.c             |  4 +-
>  drivers/gpu/drm/bridge/tc358767.c             |  3 +-
>  drivers/gpu/drm/bridge/thc63lvd1024.c         |  7 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  5 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c            |  5 +-
>  drivers/gpu/drm/drm_bridge.c                  | 78 +++++++++++++++----
>  drivers/gpu/drm/exynos/exynos_drm_mic.c       |  8 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c             |  6 +-
>  drivers/gpu/drm/mcde/mcde_dsi.c               |  3 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  4 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  5 +-
>  drivers/gpu/drm/sti/sti_dvo.c                 |  4 +-
>  include/drm/drm_bridge.h                      |  8 ++
>  31 files changed, 217 insertions(+), 134 deletions(-)
> 
> -- 
> 2.23.0
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
