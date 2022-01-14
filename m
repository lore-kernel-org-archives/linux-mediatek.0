Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F88C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 09:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k96c64OPodIB+tU+zhUKilE7a2WHUknq1dDKTOPLDI8=; b=LT4zi4m6nx0Quz
	0zrQWaTc9ridpV+yueSUQdqHpzXD8zgstuOMPt0dmD9u8QBQImOIH78+gbHZdgJX6pLnNs2q5/ArF
	7Bpt4kg+XUxPcS/jV2cKYZfQ4YBAIv82G8zECqJrz3fwf/tA4861B6HaRGLVkvyZ3n5ggF1WxRmDq
	bYqBsGfHBQt0q9vGmxFMZWj2riOjuZs5Fk15tRLIZpfQqQKd1WONN3w3Twi6Q84HDuqpAEv8BcOIJ
	UggeObDpmCGVaIND6bJfNvDu7EmDh6CalNOd5P2y8pWJqdzSORr2Z2fo/Zdrw81hLtMYex8hZBhh2
	Cgd20rOm346kA3iSflEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8IoK-008T9k-U0; Fri, 14 Jan 2022 09:23:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Io6-008T4i-C0; Fri, 14 Jan 2022 09:23:39 +0000
X-UUID: 82f6a00f69c342d39655d6c08dac7e6b-20220114
X-UUID: 82f6a00f69c342d39655d6c08dac7e6b-20220114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1803454787; Fri, 14 Jan 2022 02:23:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 01:21:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 14 Jan 2022 17:21:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Jan 2022 17:21:26 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <narmstrong@baylibre.com>, <robert.foss@linaro.org>,
 <andrzej.hajda@intel.com>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <p.zabel@pengutronix.de>
CC: <xji@analogixsemi.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [v9,2/3] drm/mediatek: implement the DSI hs packets aligned
Date: Fri, 14 Jan 2022 17:21:09 +0800
Message-ID: <20220114092110.12137-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220114092110.12137-1-rex-bc.chen@mediatek.com>
References: <20220114092110.12137-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_012338_455151_0EB95AA6 
X-CRM114-Status: GOOD (  10.13  )
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

Some DSI RX devices require the packets on all lanes aligned at the end.
Otherwise, there will be some issues of shift or scroll for screen.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..ccdda15f5a66 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -195,6 +195,8 @@ struct mtk_dsi {
 	struct clk *hs_clk;
 
 	u32 data_rate;
+	/* force dsi line end without dsi_null data */
+	bool hs_packet_end_aligned;
 
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
@@ -500,6 +502,13 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
 	}
 
+	if (dsi->hs_packet_end_aligned) {
+		horizontal_sync_active_byte = roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
+		horizontal_frontporch_byte = roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
+		horizontal_backporch_byte = roundup(horizontal_backporch_byte, dsi->lanes) - 2;
+		horizontal_backporch_byte -= (vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
+	}
+
 	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
 	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
 	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
@@ -794,6 +803,9 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
+	dsi->hs_packet_end_aligned = (dsi->mode_flags &
+				      MIPI_DSI_HS_PKT_END_ALIGNED)
+				     ? true : false;
 
 	return 0;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
