Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96EDC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 03:44:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 667932072E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 03:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFh1rqs6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fTV3hx2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 667932072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RaH4yQXPBoy1woSRMJI8iZDXfdxth2S4Y0W/aM0tda0=; b=fFh1rqs68HRrjgp522wnQMA6jp
	CySQZL+MxvmgiL/yHRXlRWD6oKf9qPes1u60S5oRVyenTjyEMLXBWMBjgdWjqW4qSVQS6UxRJUxwO
	4L412LVWf49W3tkaDxufGWo3xlTTRcQhVFWBWvx480pSptmJpktllV2fnt2YW3V75g0OGKLM0h6io
	OuDE65iPrE3OD+UUz0BS5/ySOZBiS6MVMv8yYIjRrbpm/7VhtFyOYWxfEkBkENlskj4e60LjICGyb
	Rub6sn+4+iyTSB7GkjeoqRqRV80qutcq14DNmxBjbK6JeAlVr+55MKSDOlDVs2so/XEzU7vLtSWpO
	STytHS9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIkqA-0008BG-8b; Thu, 17 Sep 2020 03:44:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIkq5-0008Aj-Km; Thu, 17 Sep 2020 03:44:07 +0000
X-UUID: 1801f92148cc42e7aae7910e8e5377a7-20200916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=3c+peDytuMhcMrnaVbpiJTnq5XNIuqy9R+l3Dgk+J4U=; 
 b=fTV3hx2DEfFsTzyLe/FreJRhD5icjfam73hkA3WSve8mAhsYRBcGTjzCcQYdErCtd5cDQR6sIMtGDNPE5ymV0SG357RcnIVQQYD0MAFvvWv8SyA+iaQc8Lm4mgNJGDM3fWHGYrxEWrcOu7fyTX8uUQgbxxvYUwZmGbXsXN2YQng=;
X-UUID: 1801f92148cc42e7aae7910e8e5377a7-20200916
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1089578430; Wed, 16 Sep 2020 19:40:51 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Sep 2020 20:30:49 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Sep 2020 11:30:42 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 17 Sep 2020 11:30:46 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [v3 PATCH] drm/mediatek: dsi: fix scrolling of panel with small hfp
 or hbp
Date: Thu, 17 Sep 2020 11:30:09 +0800
Message-ID: <20200917033009.24799-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4F827BECC77D9F2C29EC3F76CEDA6B6B769F669CE4672B087A307F8E1E8E80442000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_234405_873102_68F77074 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace horizontal_backporch_byte with vm->hback_porch * bpp to aovid
flowing judgement negative number.

if ((vm->hfront_porch * dsi_tmp_buf_bpp + horizontal_backporch_byte) >
	data_phy_cycles * dsi->lanes + delta)

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 54 ++++++++++++++------------------------
 1 file changed, 19 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 16fd99dcdacf..ddddf69ebeaf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -445,6 +445,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	u32 horizontal_backporch_byte;
 	u32 horizontal_frontporch_byte;
 	u32 dsi_tmp_buf_bpp, data_phy_cycles;
+	u32 delta;
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
 	struct videomode *vm = &dsi->vm;
@@ -475,42 +476,25 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
 			  timing->da_hs_zero + timing->da_hs_exit + 3;
 
-	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
-		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
-		    data_phy_cycles * dsi->lanes + 18) {
-			horizontal_frontporch_byte =
-				vm->hfront_porch * dsi_tmp_buf_bpp -
-				(data_phy_cycles * dsi->lanes + 18) *
-				vm->hfront_porch /
-				(vm->hfront_porch + vm->hback_porch);
-
-			horizontal_backporch_byte =
-				horizontal_backporch_byte -
-				(data_phy_cycles * dsi->lanes + 18) *
-				vm->hback_porch /
-				(vm->hfront_porch + vm->hback_porch);
-		} else {
-			DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
-			horizontal_frontporch_byte = vm->hfront_porch *
-						     dsi_tmp_buf_bpp;
-		}
+	delta = (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) ? 18 : 12;
+
+	if ((vm->hfront_porch * dsi_tmp_buf_bpp + horizontal_backporch_byte) >
+	    data_phy_cycles * dsi->lanes + delta) {
+		horizontal_frontporch_byte =
+			vm->hfront_porch * dsi_tmp_buf_bpp -
+			(data_phy_cycles * dsi->lanes + delta) *
+			vm->hfront_porch /
+			(vm->hfront_porch + vm->hback_porch);
+
+		horizontal_backporch_byte =
+			horizontal_backporch_byte -
+			(data_phy_cycles * dsi->lanes + delta) *
+			vm->hback_porch /
+			(vm->hfront_porch + vm->hback_porch);
 	} else {
-		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
-		    data_phy_cycles * dsi->lanes + 12) {
-			horizontal_frontporch_byte =
-				vm->hfront_porch * dsi_tmp_buf_bpp -
-				(data_phy_cycles * dsi->lanes + 12) *
-				vm->hfront_porch /
-				(vm->hfront_porch + vm->hback_porch);
-			horizontal_backporch_byte = horizontal_backporch_byte -
-				(data_phy_cycles * dsi->lanes + 12) *
-				vm->hback_porch /
-				(vm->hfront_porch + vm->hback_porch);
-		} else {
-			DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
-			horizontal_frontporch_byte = vm->hfront_porch *
-						     dsi_tmp_buf_bpp;
-		}
+		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
+		horizontal_frontporch_byte = vm->hfront_porch *
+					     dsi_tmp_buf_bpp;
 	}
 
 	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
