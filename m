Return-Path: <SRS0=UdZw=6B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28212C352BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 15:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB0FC2223D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 15:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NvhRgGQ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB0FC2223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ouVV44Wy9sbXn3M8OMCn0ZVmRxdGBzSzzqttp4EFhI=; b=NvhRgGQ3Ir04Js
	4TXzgXTStO0GBRcsHHtW66/0aeAskx2qc0T1a4zGUrupD32/AR21LV1IFGmLHD7HHxQpofk2xW2XL
	ra0hz8MVSoOkkkguNigpnGdo7P9W5vjjkzSGSOgISs6EZMA0RsMSH+lF8YwWcno5znxWH/CgtIQmA
	dK4dQjsdJTGCd9DTKlWWffbdDUmmgjUCeVlRn5TQUSR5uRikQ8CuhjV5aoIDYqM+jEZkPEZTVcx2s
	2H7KazUF9T5/3f1yU56SRdTf8nItlBw57BEzP0wZ3xj68nHWqLCUNR/5+wCxaknjp/s5glBvHjd2J
	mcpSRQsO7n9e1xdjf75A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPSZs-0000Rd-HW; Fri, 17 Apr 2020 15:06:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPSZU-0008Tf-HL; Fri, 17 Apr 2020 15:06:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id E83542A2A77
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org,
	Collabora Kernel ML <kernel@collabora.com>
Subject: [PATCH v3 0/7] Convert mtk-dsi to drm_bridge API and get EDID for
 ps8640 bridge
Date: Fri, 17 Apr 2020 17:06:07 +0200
Message-Id: <20200417150614.2631786-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_080624_717076_F471ED85 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The PS8640 dsi-to-eDP bridge driver is using the panel bridge API,
however, not all the components in the chain have been ported to the
drm_bridge API. Actually, when a panel is attached the default panel's mode
is used, but in some cases we can't get display up if mode getting from
eDP control EDID is not chosen.

This series address that problem, first implements the .get_edid()
callback in the PS8640 driver (which is not used until the conversion is
done) and then, converts the Mediatek DSI driver to use the drm_bridge
API.

As far as I know, we're the only users of the mediatek dsi driver in
mainline, so should be safe to switch to the new chain of drm_bridge API
unconditionally.

The patches has been tested on a Acer Chromebook R13 (Elm) running a
Chrome OS userspace and checking that the valid EDID mode reported by
the bridge is selected.

[1] https://lore.kernel.org/lkml/20200210063523.133333-1-hsinyi@chromium.org/

Changes in v3:
- Replace s/bridge/next bridge/ for comment. (Laurent Pinchart)
- Add the bridge.type. (Laurent Pinchart)
- Use next_bridge field to store the panel bridge. (Laurent Pinchart)
- Add the bridge.type field. (Laurent Pinchart)
- This patch requires https://lkml.org/lkml/2020/4/16/2080 to work
  properly.
- Move the bridge.type line to the patch that adds drm_bridge support. (Laurent Pinchart)

Changes in v2:
- Do not set connector_type for panel here. (Sam Ravnborg)

Enric Balletbo i Serra (7):
  drm/bridge: ps8640: Get the EDID from eDP control
  drm/bridge_connector: Set default status connected for eDP connectors
  drm/mediatek: mtk_dsi: Rename bridge to next_bridge
  drm/mediatek: mtk_dsi: Convert to bridge driver
  drm/mediatek: mtk_dsi: Use simple encoder
  drm/mediatek: mtk_dsi: Use the drm_panel_bridge API
  drm/mediatek: mtk_dsi: Create connector for bridges

 drivers/gpu/drm/bridge/parade-ps8640.c |  12 ++
 drivers/gpu/drm/drm_bridge_connector.c |   1 +
 drivers/gpu/drm/mediatek/mtk_dsi.c     | 276 ++++++++-----------------
 3 files changed, 96 insertions(+), 193 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
