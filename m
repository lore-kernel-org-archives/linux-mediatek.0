Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A7BC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 10:32:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFCC613B9
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 10:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFCC613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPt4VaRLMs19jLXtIO3N/A1KCqjIx5AIK1qIWY5dRlA=; b=EpYqHlTaPCAsTK
	YNfpzVwRWbUVtLBylM5zlxelmOU9UqlPo4nQXvHUXgLUDRQgcca7ArsPyfjPaqGLrP5BapYk7fJgI
	486Kjpa2jrVzrHf1it/CKD4MQke0K5Hv1aXw9bS7COCBG2vr4BysdG89KogZa9kNYLBm5Fr+Sr66G
	surpgMW+v0DmJ7OBpm1oKyh4MhJyfWA5t2hW7Y+krBOY4tW7EDXm/yIUEd2EIFbnHXlbB1traUjQC
	T5QC52fdrQRcygwqmJ8KdgdX5CYDhFKdp9/icZt+6Uxs97Dowlfz8m0gMazpYzbBdpL0nN286Jplt
	uze3QvseSTwMrVjVsczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltpK4-009qzY-Ii; Thu, 17 Jun 2021 10:32:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltpK0-009qxd-DU; Thu, 17 Jun 2021 10:32:30 +0000
X-UUID: f4882a5e06b94270a3fd5328520fe4dd-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qBwqJW6+KXN1WXu/dJswBwv1ZwB6zof1JysV9dlVxzI=; 
 b=l/QhEaEg/t6BAp0IPEhwulQmCw6KgioiUrOAJWinusRGkD1hgEol6dG6dK3YJ5xftqTHsO5c3WEGfnNsqpw59dLUIC23p+9OB17WUZaqr9eMfH8qEhuk4rt2rvev0AePat+ryIiVaQVV7T4B2HJyxBD5hn5gqWJgVO0Ca8H8jFs=;
X-UUID: f4882a5e06b94270a3fd5328520fe4dd-20210617
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1994704856; Thu, 17 Jun 2021 03:32:25 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 03:32:23 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Jun 2021 18:32:16 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 17 Jun 2021 18:32:16 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v2] drm/mediatek: force hsa hbp hfp packets multiple of
 lanenum to avoid screen shift
Date: Thu, 17 Jun 2021 18:32:14 +0800
Message-ID: <20210617103214.44217-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC510DC44A542FB00BE6C56F37F322843E845B614EB23D762E60C3DDE504DF812000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_033229_477961_756864E6 
X-CRM114-Status: GOOD (  10.18  )
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

The bridge chip "ANX7625" requires the packets on lanes to aligne at the end,
or ANX7625 will shift the screen.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..4735e0092ffe 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -194,6 +194,8 @@ struct mtk_dsi {
 	struct clk *hs_clk;
 
 	u32 data_rate;
+	/* force dsi line end without dsi_null data */
+	bool force_dsi_end_without_null;
 
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
@@ -499,6 +501,13 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
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
@@ -1095,6 +1104,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
+	if (dsi->next_bridge)
+		dsi->force_dsi_end_without_null = of_property_read_bool(dsi->next_bridge->of_node,
+									"force_dsi_end_without_null");
+
 	drm_bridge_add(&dsi->bridge);
 
 	ret = component_add(&pdev->dev, &mtk_dsi_component_ops);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
