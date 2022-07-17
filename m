Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4987C43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jul 2022 17:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2vLgyicetFZ8VksYnfIhJHbo2JtPKcWdixiwNKw+SGE=; b=EGpVJeSzldqLVKLwp40eNFpZfX
	8R/qnfqPo3OoF5MCcWlyrwzK/hbHOmS3Kf8WWUDOynMlXElU4MF8v5Ro2bWhdLcsWmD6cmn64dUTs
	Rzyh4+trgmp8eA0lW4htVw1O2FzwOO75yZSve0DjvQFFwym0mPq0Ks80+MzlqBbJzWNaJcyxX6ut6
	XGRKgQfO2lFy5Rwuj+o7zW34vbB/UpbTVr3jREyWmxFz4f44YEYdYcKzwwoat6MzTP5HxkxQFBAgn
	qPn2O7QiU3UjFPDB6jPxZ5I1EwaFbR02YYFCq7JDpSoz0S6kiYlpZax9G0yIbdB5XA2R7u3TD0CEy
	PbAm76kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8KV-007sn9-E7; Sun, 17 Jul 2022 17:45:19 +0000
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com ([46.30.210.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8KP-007sfd-R3
	for linux-mediatek@lists.infradead.org; Sun, 17 Jul 2022 17:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=2vLgyicetFZ8VksYnfIhJHbo2JtPKcWdixiwNKw+SGE=;
	b=TwYWbTiUI9ca6WbppfWDbYpUHgEeRlvSoRO4L/8TJ6sjwZUHNaPhBA5wg1DG8pKit8gptQIt8BGGT
	 UQEt9UMGduWyReDA8MQzJH08hfwzY4MVy3clFON8D58EzjqNdVy6RKihmATeWy3ERl+csW/SVMcFlB
	 UkGnHaKhDo5v19t0b5Fna2aSebtLAYh0C2dPzTODeXigGmxIZ+T6CMc4v9cEDVsTV73xJ/Lbjq4sL6
	 romSc6y4AJ8AAaNcUNL4/cT5x7B7f4WcQ7ZGLLSa7THtFWpDJDL54u+Uw4zGBuVznGrLrcVmy1P/g8
	 6EJB1QnjdMltJS8summScIzVZpwDE/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=2vLgyicetFZ8VksYnfIhJHbo2JtPKcWdixiwNKw+SGE=;
	b=inFA86pcq7TWYlZW7Unv1A6XMtZ8tyI7aEwLihkz9RlipuETRMnWpDlNhyhEdp1MbRinHOqfGj9m+
	 CjeZxLwDg==
X-HalOne-Cookie: c0c0f26bac3daaf8910f2641e6402cdea6b98545
X-HalOne-ID: 2de56c81-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 2de56c81-05f8-11ed-823f-d0431ea8bb10;
	Sun, 17 Jul 2022 17:45:01 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Benson Leung <bleung@chromium.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	chrome-platform@lists.linux.dev,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Philip Chen <philipchen@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 0/12] drm bridge updates
Date: Sun, 17 Jul 2022 19:44:42 +0200
Message-Id: <20220717174454.46616-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_104515_605308_6D0431E2 
X-CRM114-Status: GOOD (  15.29  )
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

This is a collection of bridge patches that I had left unfinished
more than a year ago. Now where I have some spare time I dusted them
off for review and testing.

The patches builds, but has seen no run-time testing.

The patches are grouped like this:

1+2:
  - Updates parade-ps8640 for atomic operation thus allowing
    the use of the atomic variants of drm_bridge_chain_pre_enable/
    post_disable.
    There is thus no users left of the non-atomic variants of
    drm_bridge_chain* so drop them all.
    If other drivers needs this functionality they are supposed
    to use the atomic API.
    This is a DSI to eDP converter, and I did not see a need for
    format negotiation - but I may be wrong?

3+4:
  - Drop chain_mode_fixup in mediatek, and as there are no more
    users, drop the implementation of drm_bridge_chain_mode_fixup.
    The crucial part to review is the updated documentation for
    drm_bridge_funcs.atomic_check().

5-11:
  - Convert all bridge drivers from mode_fixup to atomic_check.
    To do so add the necessary hooks to have an atomic state.
    I think the drivers will work using the atomic API,
    but it has seen no testing!
    I did not see any need for format negotiation, but if needed
    let me know so we can fix it.
    The last patch removes the mode_fixup support in drm_bridge.

12:
  - Add a few todo items, in the hope others will jump in and
    convert some of the bridge drivers to the atomic API.

The patch groups are more or less independent, and I may land them out
of order if one group is reviewed before the rest.
A few of the patches has already seen a review, but they need a
bit more exposure as last review was more than a year ago.

	Sam


Sam Ravnborg (12):
      drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
      drm/bridge: Drop unused drm_bridge_chain functions
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup
      drm/bridge: sii8620: Use drm_bridge_funcs.atomic_check
      drm/bridge: cros-ec-anx7688: Use drm_bridge_funcs.atomic_check
      drm/bridge: tc358767: Use drm_bridge_funcs.atomic_check
      drm/mediatek: Drop mtk_hdmi_bridge_mode_fixup
      drm/rcar-du: lvds: Use drm_bridge_funcs.atomic_check
      drm/omapdrm: Use drm_bridge_funcs.atomic_check
      drm/bridge: Drop drm_bridge_funcs.mode_fixup
      drm/todo: Add bridge related todo items

 Documentation/gpu/todo.rst               |  20 ++++
 drivers/gpu/drm/bridge/cros-ec-anx7688.c |  28 ++++--
 drivers/gpu/drm/bridge/parade-ps8640.c   |  18 ++--
 drivers/gpu/drm/bridge/sil-sii8620.c     |  17 ++--
 drivers/gpu/drm/bridge/tc358767.c        |  21 ++---
 drivers/gpu/drm/drm_bridge.c             | 154 +------------------------------
 drivers/gpu/drm/mediatek/mtk_hdmi.c      |  19 ----
 drivers/gpu/drm/omapdrm/dss/dpi.c        |  31 ++++---
 drivers/gpu/drm/omapdrm/dss/sdi.c        |  31 ++++---
 drivers/gpu/drm/omapdrm/dss/venc.c       |  28 ++++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c      |  12 ++-
 include/drm/drm_bridge.h                 |  91 ++++--------------
 12 files changed, 147 insertions(+), 323 deletions(-)



