Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAE6C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 14:37:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD10661260
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 14:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD10661260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VbJ+w2x5+heIYypIE9gpfH0Kcsn0v8JnGfLe3G4n4v8=; b=HECxiDxnuaP3byEyUe4MeChL04
	nEbD6BSxuMA9SeDEtdUUmI+QjM9IOE1744x/1h20R8qwidRSyWjjxmJco2DMfdKRvLHh8As94YsEW
	I5Pri4XbSv/diXF0DgB8qZWMToh8uLenTXk91vuNHS8YEcAZSIsh/opOPa6uKInVeEYExUMnXBZ9O
	zJIc7nFqAHyX46x0b/bJZM0FxP2y0Rs6YBOksqPq+FXat/2Eoz+RigzukSpP2f3WxAyboKz2MUPVm
	00Tp4OYwRn3AeICmqrvhdXGZKqQUgS41aL9PhkK4xFYKIIXfDTRQiJ3u6wJ3YTESpEao8JGaN9xv8
	J90JLOrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU9J0-005Aia-Uf; Wed, 07 Apr 2021 14:37:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU9Iv-005AhE-Re; Wed, 07 Apr 2021 14:37:16 +0000
X-UUID: 6c6d1f979e4341a09c3f2aaf19b9aaa3-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HVFoeCxFeSmvJk3GvtJboV3PR4TTvxxrZdUgsEvyBqg=; 
 b=V4t+o36fiY0WTXP3coOXuUG7GP+nBoLdcNi8wzMGnolaZIc/OxcvAtLx/1U6A2deBjDI2qCkfetVEIrG5ltTqvTLGRdew43kBwjq+G3U0jMT/uBWAYYNRl2sZ1yKEk3to+9VS/cAa43/hLHhuSNyAi+E7fXAoN4hmTcVOpwawC8=;
X-UUID: 6c6d1f979e4341a09c3f2aaf19b9aaa3-20210407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1211680037; Wed, 07 Apr 2021 07:37:07 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 07:37:05 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 7 Apr 2021 22:37:02 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 7 Apr 2021 22:37:01 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH] drm/mediatek: force hsa hsa hfp packets multiple of line num
 to avoid screen shift
Date: Wed, 7 Apr 2021 22:36:56 +0800
Message-ID: <20210407143656.2574-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 04143E2A032602C99B68E1021BC15E0AF3D5F349C78BF14AFD651C4F6CAF72E12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_153714_557839_AD0EDD2B 
X-CRM114-Status: GOOD (  12.62  )
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

The bridge chip ANX7625 require the line packets ending at the sametime
or ANX7625 will shift the screen.

Change-Id: Ia324ad28fbff54140feedb9a1d6bfb2b246d0447
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index a1ff152ef468..e825a80862de 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -194,6 +194,8 @@ struct mtk_dsi {
 	struct clk *hs_clk;
 
 	u32 data_rate;
+	/* force dsi line end without dsi_null data */
+	bool force_dsi_end_without_null;
 
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
@@ -495,6 +497,13 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
 	}
 
+	if (dsi->force_dsi_end_without_null) {
+		horizontal_sync_active_byte = roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
+		horizontal_frontporch_byte = roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
+		horizontal_backporch_byte = roundup(horizontal_backporch_byte, dsi->lanes) - 2;
+		horizontal_backporch_byte -= (vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
+	}
+
 	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
 	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
 	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
@@ -1091,6 +1100,9 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
+	dsi->force_dsi_end_without_null = of_property_read_bool(dev->of_node,
+								"force_dsi_end_without_null");
+
 	drm_bridge_add(&dsi->bridge);
 
 	ret = component_add(&pdev->dev, &mtk_dsi_component_ops);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
