Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBE3C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:23:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C883161279
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 06:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C883161279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x3PJCnU9ebFhIiqAiSK75JMP7Hnau5NK4wxa2XXyfuU=; b=na+Z4T4SooJzIB
	kz52EvX//EzZsnDVFIk355e31+e+3pDjbZbNUHtZ+NHnTrqKgr+mqQvftOG315MGTGNpN7RnnRlnE
	Rnt3iaLxzaCeV1QNG2JZdIkiFzt3LLOZvRRLr4dCUcStYRtw0beItUxw2/6WOyIvworPpY7AR2NID
	t5c8cSIsx3VRpng2WpD5DRWcyovPHzm7KhqD21ccVrP2KUG5PSZASPDPPYfzMedPg60k4BcdD7Iw4
	KUDGJsSXAQTys6kVTJ8INuF2tDj1w7Am40cLjnOHF/9B8k1CLdTB4yYBhYfmok55VIdGMjFvzi3Hz
	vwiUvJHB2s2Rbu+V0HRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6S6s-000Kyh-9P; Thu, 22 Jul 2021 06:23:06 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6S6o-000KwX-It
 for linux-mediatek@lists.infradead.org; Thu, 22 Jul 2021 06:23:04 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4a41c1df-eab5-11eb-8d1a-0050568cd888;
 Thu, 22 Jul 2021 06:23:12 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 253FF194B25;
 Thu, 22 Jul 2021 08:23:11 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v1 0/7] drm/bridge: Drop deprecated functions
Date: Thu, 22 Jul 2021 08:22:39 +0200
Message-Id: <20210722062246.2512666-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_232302_805623_3CECD2EC 
X-CRM114-Status: GOOD (  12.12  )
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

	Sam

Sam Ravnborg (7):
      drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
      drm/bridge: Drop unused drm_bridge_chain functions
      drm/bridge: Add drm_bridge_new_crtc_state() helper
      drm/bridge: lontium-lt9611: Use atomic variants of drm_bridge_funcs
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup
      drm/todo: Add bridge related todo items

 Documentation/gpu/todo.rst              |  47 ++++++++++
 drivers/gpu/drm/bridge/lontium-lt9611.c |  69 ++++++---------
 drivers/gpu/drm/bridge/parade-ps8640.c  |  14 +--
 drivers/gpu/drm/drm_atomic.c            |  34 ++++++++
 drivers/gpu/drm/drm_bridge.c            | 147 --------------------------------
 drivers/gpu/drm/mediatek/mtk_hdmi.c     |  11 ---
 include/drm/drm_atomic.h                |   3 +
 include/drm/drm_bridge.h                |  31 -------
 8 files changed, 119 insertions(+), 237 deletions(-)




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
