Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40E8C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOh0egWiIzOhiKedrMVp6vfsrLVNuJ8Xkfw0kLaMAfY=; b=CD12SwcBYPjyxvGaTqrsfeRgG8
	MvUSfphb4eQJFYzGQGokArYZ1AVMD+C5xfo9nZe2JERFBIx9eJNvcipPjuDNS+eI+xJs9H8bj3EXs
	OP81+IoBJcDUj4V2qr+/KTVIcuu1YaAkVBGxklROgCU/4DBx7mQyC39x+b+MxUBMvjVqKM8TwHw76
	2KDXa7nHdAvtknVKcha7tqzsg64UujGpXVxpcLu3Livhi+jan0Ph/A1c6nQ+wYzL7ySxTuICE6GbF
	OFxQlXjE54PP3xQpk3fEUz3gY9XhuWNPVPrVWOI7IwMEUXLHQ4bFatLL7Uz+B6FeMupOT3UfJ4ewD
	6UR/+z+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRW7O-007cxS-0D;
	Thu, 03 Aug 2023 11:03:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRW6E-007bs8-34;
	Thu, 03 Aug 2023 11:02:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F8D5660719D;
	Thu,  3 Aug 2023 12:02:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691060553;
	bh=0mQCLyW1Ws1lLoPWJcO0iech2ujtO9xHY8S2bs46Dv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e2/mtPw8EeN/ZJS00t/viHD3xVgr+d8fZ5QCFaSPVQDMWbGweFHHeL89MVNSqIWiN
	 mKlijUhjkMm9OFHYwhkdaqXUcVzq0QdeAPUq4j5gUDy9a5VTOQa+cGex05rTWbA1pz
	 hyQNLHZQkY0bIur97zaFiORsF/Rrgy9nIDjbkfiteWbegmcuDBYRwMQhcfvwr464p6
	 NwRRUeh8lWAtJPDhwNSvkdtmcYR3rkki9HFXBUj3s0tLiLvWsGPH1bYENtNY+XCaDc
	 1jLPtJNBuj+NJ//Wj2RUHZCJg9j+66LbPppsHgkPlxPVhKafVerL0q29lqi9nLHbbx
	 mchcH9f88mYjg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com,
	ehristev@collabora.com
Subject: [PATCH v9 14/16] drm/mediatek: aal: Rewrite kerneldoc for struct mtk_disp_aal
Date: Thu,  3 Aug 2023 13:02:12 +0200
Message-ID: <20230803110214.163645-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803110214.163645-1-angelogioacchino.delregno@collabora.com>
References: <20230803110214.163645-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_040235_184930_7A471823 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

The kerneldoc for struct mtk_disp_aal was entirely wrong: rewrite it
to actually document the structure.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 992dc1424c91..e6ab3eaa1126 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -36,9 +36,11 @@ struct mtk_disp_aal_data {
 };
 
 /**
- * struct mtk_disp_aal - DISP_AAL driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
+ * struct mtk_disp_aal - Display Adaptive Ambient Light driver structure
+ * @clk:      clock for DISP_AAL controller
+ * @regs:     MMIO registers base
+ * @cmdq_reg: CMDQ Client register
+ * @data:     platform specific data for DISP_AAL
  */
 struct mtk_disp_aal {
 	struct clk *clk;
-- 
2.41.0


