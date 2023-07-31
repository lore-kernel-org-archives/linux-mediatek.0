Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF56C001DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 13:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jS5J8eLr8lYnGGhAT+utjtqEaEHn118i5XURQzgOUdk=; b=da3oYyL+5w7Mtu1+I8ZyfbIzOb
	ZLTM7TLW8qgQGusX3RKgHkPwmx7s4kTF9CnHd8kVt4W+BhnJM3LaRka9VWuWJMrbJONYaLr4RFcyE
	QZlcjGX2azZ9k5tDGSny0B4AY5vh+yxIkqJ/GHNfD9HJjXcnIaIkMi+wcSo8fA8YvNnHodcbCX72Q
	F4nPpFbXw0gBF9pYf0FiBn9VUhH5IRqZ4LTIS0DkHkfU47pgd76sZgbUaaLs88ACRt1y1aFEn1oma
	2WE/Qnm8RNhp9VC+AtJWOULzZ2sVJn6KQxhzLWbP0o2zBeTjTbxL0B+VGlmlx9iCS9XHH36picLPb
	+Kqx6gkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSbs-00FgZT-30;
	Mon, 31 Jul 2023 13:06:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSa2-00FflV-0Y;
	Mon, 31 Jul 2023 13:04:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 516F46607109;
	Mon, 31 Jul 2023 14:04:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690808697;
	bh=Ty0rQR9CismILWHOJ9rVqiJlfrfqryVc5J0W+SMm8aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJ/qBrIlNdzyNH5lU1jL2PV4Di/QpqJC8xTyJ26kc6HThEVPaX3hFrajMuBrZk8fi
	 Ca/ts09vEPNXLg1Y9D/Udxbk3uS42IgWEn6LKqI8SbYqWPXiOJ5+i2TBXlWth6eFul
	 bCLUGFuBRNZj/4oHQ9ztdljuAXvdqyK9VcqsALMFk8pA5Tc97iZKU0a6s/EXyYx+sU
	 wiWuQqfwbU8GRUvQ+zGGjHJRlFC+prditImZKDWO7oEQhJHS8pvFgwk8FR28SkGLMu
	 8NuIXr3Fq+fPyxGE/xwg49ZfP8nMCDmUCCZcbVffcKyjqqON/DW8rgfOBB7EllmyjD
	 EJTRjRJd+wQ2A==
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
Subject: [PATCH v7 12/13] drm/mediatek: aal: Rewrite kerneldoc for struct mtk_disp_aal
Date: Mon, 31 Jul 2023 15:04:40 +0200
Message-ID: <20230731130441.173960-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731130441.173960-1-angelogioacchino.delregno@collabora.com>
References: <20230731130441.173960-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_060458_341092_A8869539 
X-CRM114-Status: UNSURE (   9.56  )
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
index e2e4155faf01..2b51d6f79bfe 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -26,9 +26,11 @@ struct mtk_disp_aal_data {
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


