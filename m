Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2462BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 18:20:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7C6360C49
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 18:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7C6360C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CwGZTr+yRuwupLdVwPCnNlV3zzmW0/XziKQrXeF29ZA=; b=GLpm+Bm2oSEW0v
	J3vkZFWnoe3omrkNGYKl3Oq4RWl+43mEUamrmu9taFzoImK+wpU1uYwNXKTvu3KzEpvkaa7/U4xcB
	iCi9J8sIJecqthcvoG9XcSvydtbxw8QfP2AFQK4Nu78xpXwDuwqSZIyykEqIW2+aVlbq1TnEatW3t
	Kx/RdT6V3q+3g5Haq194Bi7OqnXdtDdMB8yxcJEMgjcvHazH2ydRp7XuF3ePzRbprF45+00AyoL3p
	+e4ENFxINpLxsNCSMbCQt9XwTqQSgzGsnUWMQK36BbYRidmSECuMi1nEaitIHi+ieYgWEgXtr7S5O
	zV2aFfddXneBDHiB0ueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdGBu-005PK5-Nw; Wed, 20 Oct 2021 18:19:54 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdGBJ-005P0y-V5
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 18:19:20 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3a529610-31d2-11ec-9c3f-0050568c148b;
 Wed, 20 Oct 2021 18:19:13 +0000 (UTC)
Received: from saturn.localdomain (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 120B7194B68;
 Wed, 20 Oct 2021 20:19:07 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Subject: PATCH [v2 0/7] drm/bridge: Drop deprecated functions
Date: Wed, 20 Oct 2021 20:18:54 +0200
Message-Id: <20211020181901.2114645-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_111918_170042_4885F5F5 
X-CRM114-Status: GOOD (  13.60  )
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

Over time we have accumulated some deprecated functions etc. in drm_bridge.
This patch-set starts to move over to the atomic variants and deletes what
is not used anymore.

There was only one user of the non-atomic drm_bridge_chain functions in
parade-ps8640 - migrate it to the atomic variants and delete the non-atomic
drm_bridge_chain functions.

There was only one user of drm_bridge_chain_mode_fixup in mediatk. The use
in the mediatek driver was wrong and with the single user gone we could also
delete this function.

Added a few todo items.

Next step is to migrate the easy bridge drivers to use the atomic variants
of drm_bridge_funcs operations. The easy ones are the drivers wihtout
mode_set or mode_fixup.
I have something typed up already, but wanted feedback on this patchset before
sending out additional patches.

v2:
  v2 have been long in the coming as I wanted to wait until I
  started to have some spare time for linux stuff again, and thus time to
  address any comments timely.
  - Added Maxime's r-b (from old thread, so using old mail address [1])
  - Fixed several small issues in patch 3 that introduces a new helper
  - Added a few more folks on cc in hope to see some testing


	Sam


[1] https://lore.kernel.org/dri-devel/20210722062246.2512666-1-sam@ravnborg.org/

Sam Ravnborg (7):
      drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
      drm/bridge: Drop unused drm_bridge_chain functions
      drm/bridge: Add drm_atomic_get_new_crtc_for_bridge() helper
      drm/bridge: lontium-lt9611: Use atomic variants of drm_bridge_funcs
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup
      drm/todo: Add bridge related todo items

 Documentation/gpu/todo.rst              |  49 +++++++++++
 drivers/gpu/drm/bridge/lontium-lt9611.c |  75 +++++++---------
 drivers/gpu/drm/bridge/parade-ps8640.c  |  14 +--
 drivers/gpu/drm/drm_atomic.c            |  42 +++++++++
 drivers/gpu/drm/drm_bridge.c            | 147 --------------------------------
 drivers/gpu/drm/mediatek/mtk_hdmi.c     |  11 ---
 include/drm/drm_atomic.h                |   3 +
 include/drm/drm_bridge.h                |  31 -------
 8 files changed, 135 insertions(+), 237 deletions(-)



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
