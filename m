Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C67AC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 08:08:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 856B261876
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 08:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 856B261876
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3M6aWZVXtUa0I2Sk6/KDWlKUl1PcVM4Y7LIn5Iq035I=; b=zjlNCJWsT4r4i6
	lOM+ljQIZ1qcZKe1ErRtwAxLmcopTAgymnDxNh2Y6XJdco1XECS1myQtR0Z5CHNdSX9PwL6Wul30W
	GC/auh6eZFu6k4HuDRuyQD20IpDoqPTvc/yYued9Q/JsdtfmwVNf+4/dLsvjVlU1SKNLaPVXrg6d3
	E/FgkwgFZZIHAPjB8Q7/MCFnb2Gwlnsc/QwTZzkV/am8UVZdWsIEoQ3iExdC2svPyzUQJ/o53dQBf
	Qx6FylqsNMT+4qWeXVKBOiqAYlkLgExqO7l4lgHSEc2gjoG+zF2TC1s9qERLIkrI7zQ29X9+rpMq0
	37CNWM8j0D1HUf9VjRSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2qz6-006Vh6-P2; Mon, 12 Jul 2021 08:08:12 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2qyt-006VeG-Ee; Mon, 12 Jul 2021 08:08:01 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout3.routing.net (Postfix) with ESMTP id 08389604D1;
 Mon, 12 Jul 2021 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1626077274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yqiw9vakvD3biQvUw7e3pOAubtn1bx+ELCF8m+Mcba0=;
 b=fWZ+xu5f1Y7voLh9UJztHYCK35D/emrZkJ6EweWgy1JiC7Agzg07eLlZ4ulMWpNkNYzqsI
 dyUUbp3zzJov2NvmPAXFx646me2onhJailCwuxkuBy/RpiG5M8Xjmov1oIyBy3amklxEH3
 +QznbvRU9aX5rKipzdikPRZawUCZht0=
Received: from localhost.localdomain (fttx-pool-157.180.225.139.bambit.de
 [157.180.225.139])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 2FA88360681;
 Mon, 12 Jul 2021 08:07:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: dpi: fix NULL dereference in
 mtk_dpi_bridge_atomic_check
Date: Mon, 12 Jul 2021 10:07:36 +0200
Message-Id: <20210712080736.116435-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: 98eab89e-6b02-470b-a543-117e91a2899e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_010759_826376_6FB06BC9 
X-CRM114-Status: GOOD (  11.50  )
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

From: Frank Wunderlich <frank-w@public-files.de>

bridge->driver_private is not set (NULL) so use bridge_to_dpi(bridge)
like it's done in bridge_atomic_get_output_bus_fmts

Fixes: ec8747c52434 ("drm/mediatek: dpi: Add bus format negotiation")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bced555648b0..a2eca1f66984 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -605,7 +605,7 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 				       struct drm_crtc_state *crtc_state,
 				       struct drm_connector_state *conn_state)
 {
-	struct mtk_dpi *dpi = bridge->driver_private;
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 	unsigned int out_bus_format;
 
 	out_bus_format = bridge_state->output_bus_cfg.format;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
