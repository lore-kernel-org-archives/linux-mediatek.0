Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FFCC77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 08:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40awbR19fe2ri6vWA0XRjC+8mB5LRuB3LSW6NkKcltw=; b=Snl9pTEKJ2Ppi4TAbUkrh09o5E
	ne/Krs8BFqW3lQ33cqW51A6KiczODPJ1RlqIL7fAQpricRJWOaTy/xgXXTeQHsbVI9w6d/EkkFM9A
	dlRSArKX0TJ1CUmuUCh1FiNu5kI6RSnXAhywj3EilccSVM/Vpf4ckwzzQi53emtNQ1A3Mdzc/6Oh6
	Hr2Q/te/UPt8k8a9YvkLbbsgAF5SHVv3kV1aZikNc6zHeD3i6FGrNBpGhYI/4cNhBtLj0vFe1Y2rw
	yU+PRum9YBFvjGBBW4gaXBZckLDMd4nfSlVOpbmdeiG6clj+DKUuZb2A8fUpv1LEcsuWB9/d0uBai
	18KiOA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptlCh-000acu-1g;
	Tue, 02 May 2023 08:17:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptlC7-000ZzI-0c;
	Tue, 02 May 2023 08:17:09 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 22C2A6605634;
	Tue,  2 May 2023 09:17:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683015425;
	bh=WyrIuIC4WGagg8kPRhnWHAVOa63zEnurfQ7HDmqCi64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gHSeO1eiLtSX6zE+WqnJSOda/SpaKrBHCZibLMPDYlqCZxRpPFh2q6tRJ6pSP+uE7
	 4tZO3gSLiTflVhXtWw68m9WJBEHdkYCkfQs/6gelGUS4qR7W78mbd3MxVnRp/8EtMr
	 NZvwDXisnEzJrhCulFVYZDvYEtRng6Z3BhPczRSuyw0WSWjIYSB4n/TsoK1VEO0kbW
	 kbmPr68GuH3tOq9MIp1qhnSsMwIDZr+buT6La9cQeC2ygbIFmoSwjpxAgoH9fJfl0a
	 Cv0hr1wFHKT2oA7pA1XPRvFG4upfgrLiJzUf3HylAFmLbupZN9dfRNCpe+vmOxt+1K
	 hDevIRUW5l0nA==
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
	kernel@collabora.com
Subject: [PATCH 10/11] drm/mediatek: gamma: Make sure relay mode is disabled
Date: Tue,  2 May 2023 10:16:49 +0200
Message-Id: <20230502081650.25947-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502081650.25947-1-angelogioacchino.delregno@collabora.com>
References: <20230502081650.25947-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_011707_387388_03ED33B9 
X-CRM114-Status: GOOD (  10.25  )
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

Disable relay mode at the end of LUT programming to make sure that the
processed image goes through.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 8dc6371db56a..3501c8b549be 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -19,6 +19,7 @@
 #define DISP_GAMMA_EN				0x0000
 #define GAMMA_EN					BIT(0)
 #define DISP_GAMMA_CFG				0x0020
+#define GAMMA_RELAY_MODE				BIT(0)
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
@@ -183,6 +184,9 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
+	/* Disable RELAY mode to pass the processed image */
+	cfg_val &= ~GAMMA_RELAY_MODE;
+
 	writel(cfg_val, regs + DISP_GAMMA_CFG);
 }
 
-- 
2.40.1


