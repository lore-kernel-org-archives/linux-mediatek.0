Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8248C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 05:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRXqQN5xQ0jICM/scQt/StJdWO7NVsqZ/XSm9o0oTtI=; b=m3DwDD7TdKPzqT
	Q75aXWsIM9Dk1vNFOGN0L+leXtV70LgD6iT0d7pUSfqeYsgUeSkjFsc5idSHVOb8t9Cyi6KpSmgAI
	BphN7UY0IR3H3U0g/xKkhPCKKKlzNo/jLz4LeyKcNuHWiex7Frz/U1lLmrghyxZyZWK7cDj530gaB
	cgmRcZsRJXjsDdrS2HYRgDk09PKWUo1hjrderjy58V/2Iq2iPl2BOKfCyzD+PEcdHj6tyVJwacDRE
	S2++R1sf3Dlcfz/RYPQ9xzWN5nPXaSBNYSN1rJdQW1uebvAJW8VUFBKIJhl6gUuKtXMkA6TOJSEZW
	TewbhforKFmX7/0Tt7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGwEj-0092AE-Lp; Mon, 07 Feb 2022 05:06:49 +0000
Received: from mailgw01.mediatek.com ([66.171.122.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGwEX-00928d-Kw; Mon, 07 Feb 2022 05:06:38 +0000
X-UUID: b3456fd15927447dbf0ed5aadbf4aa09-20220206
X-UUID: b3456fd15927447dbf0ed5aadbf4aa09-20220206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1267906973; Sun, 06 Feb 2022 22:06:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Feb 2022 20:56:32 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 7 Feb 2022 12:56:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Feb 2022 12:56:30 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <narmstrong@baylibre.com>, <robert.foss@linaro.org>,
 <andrzej.hajda@intel.com>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <p.zabel@pengutronix.de>
CC: <xji@analogixsemi.com>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [v11,2/3] drm/mediatek: implement the DSI HS packets aligned
Date: Mon, 7 Feb 2022 12:56:24 +0800
Message-ID: <20220207045625.17713-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220207045625.17713-1-rex-bc.chen@mediatek.com>
References: <20220207045625.17713-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_210637_717294_BBF58081 
X-CRM114-Status: GOOD (  12.32  )
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

Some DSI RX devices (for example, anx7625) require last alignment of
packets on all lanes after each row of data is sent.
Otherwise, there will be some issues of shift or scroll for screen.

Take horizontal_sync_active_byte for a example,
we roundup the HSA packet data to lane number, and the subtraction of 2
is the packet data value added by the roundup operation, making the
long packets are integer multiples of lane number.
This value (2) varies with the lane number, and that is the reason we
do this operation when the lane number is 4.

In the previous operation of function "mtk_dsi_config_vdo_timing",
the length of HSA and HFP data packets has been adjusted to an
integration multiple of lane number.
Since the number of RGB data packets cannot be guaranteed to be an
integer multiple of lane number, we modify the data packet length of
HBP so that the number of HBP + RGB is equal to the lane number.
So after sending a line of data (HSA + HBP + RGB + HFP), the data
lanes are aligned.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..e91b3fff4342 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -500,6 +500,18 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
 	}
 
+	if ((dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) &&
+	    (dsi->lanes == 4)) {
+		horizontal_sync_active_byte =
+			roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
+		horizontal_frontporch_byte =
+			roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
+		horizontal_backporch_byte =
+			roundup(horizontal_backporch_byte, dsi->lanes) - 2;
+		horizontal_backporch_byte -=
+			(vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
+	}
+
 	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
 	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
 	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
