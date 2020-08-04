Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0157AC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 10:59:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D00FA20738
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 10:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tfI17PkT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="Y14NMTcz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D00FA20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eJk8U6Lf6g0ND3UYJywCCHZquW72ztAv34ovsSXWsYE=; b=tfI17PkTQeChe9F8FcEd38Ov0
	/tUisWh4CDu7Iq117jzHdhRAIoWjR/vTdHFluZF5gd9/KQJNDHCSbx9oYdHtXR5xGcuYLwLBk4lM/
	wJyfO022622P33lYgSJWzj0BMtnBMC5Yh9aC3GUTy5zJlQqzHwvRFa3XRDMeJ9LhVBg7VG5uYPznz
	Ruo9YirTgesHySOe/VZFzV2bO1QAy/3pjNFgO8nMn3ip8TCF1CzI11zp3UBmochcBYPsrS2zasqGH
	IP4HngGOtk5A/rqVLDrq9v3s8zHwtQmUjlPEXO2K3ocWZ5oTUsiosEDHoLwQEvnpxRPZvkZ8GLob/
	7w7CnsV3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ufM-00023X-8V; Tue, 04 Aug 2020 10:59:32 +0000
Received: from mxwww.masterlogin.de ([2a03:2900:1:1::b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ufG-00021x-UT; Tue, 04 Aug 2020 10:59:28 +0000
Received: from mxout4.routing.net (unknown [192.168.10.112])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id ABAF596320;
 Tue,  4 Aug 2020 10:59:24 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout4.routing.net (Postfix) with ESMTP id 6E61D100039;
 Tue,  4 Aug 2020 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596538764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9e/a3rUwFuBMSskkYZ+RYGEA6Kthgmd/yV5yPyHRPeg=;
 b=Y14NMTcz5IclwJJLeaLMeJySnzqkACz75ctV+HTIaAyhxSCc32+VrbbhadmYoxChGgnI5b
 DeHGYyCRjlBnoFb+LAtwx6mNfvpEuGNrk6O9ZRhbgcWAlmE4rv02diGjs0XvMDUu4zN9b2
 lO8QqbWBfpqJNOJDNF75KU7ndfeAl7A=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de
 [217.61.144.119])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id B2CAD3606F6;
 Tue,  4 Aug 2020 10:59:23 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 4/5] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
Date: Tue,  4 Aug 2020 12:58:48 +0200
Message-Id: <20200804105849.70876-5-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804105849.70876-1-linux@fw-web.de>
References: <20200804105849.70876-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_065927_907659_6C706F67 
X-CRM114-Status: GOOD (  14.04  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jitao Shi <jitao.shi@mediatek.com>

For current mediatek dsi encoder, its possible crtc is fixed in crtc
0, and mediatek dpi encoder's possible crtc is fixed in crtc 1. In
some SoC the possible crtc is not fixed in this case, so call
mtk_drm_find_possible_crtc_by_comp() to find out the correct possible
crtc.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 3 ++-
 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index d4f0fb7ad312..e43977015843 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -608,7 +608,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);
 
 	/* Currently DPI0 is fixed to be driven by OVL1 */
-	dpi->encoder.possible_crtcs = BIT(1);
+	dpi->encoder.possible_crtcs =
+		mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->ddp_comp);
 
 	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL, 0);
 	if (ret) {
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 270bf22c98fe..c31d9c12d4a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -892,7 +892,8 @@ static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
 	 * Currently display data paths are statically assigned to a crtc each.
 	 * crtc 0 is OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0
 	 */
-	dsi->encoder.possible_crtcs = 1;
+	dsi->encoder.possible_crtcs =
+		mtk_drm_find_possible_crtc_by_comp(drm, dsi->ddp_comp);
 
 	/* If there's a bridge, attach to it and let it create the connector */
 	if (dsi->bridge) {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
