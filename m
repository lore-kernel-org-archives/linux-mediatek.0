Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4DAC04FE0
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 11:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFfPkXqxCAcxhlsCO3lvEUTNIXpbZ/6XZFJ4TN9K6OY=; b=qXPEUb6YRNXtRArxzJUnNAHGkO
	4hB7K3XQh2UPBlxnpksOnbiEc+0+GnSYer4X4sBi5QxJS69YAQ/OMZoo+5wvvJKborgBPO0Mcn7d7
	VrYLhWFi/hkjuDCu+A1F+E5FvLptcaSxFvd+efuFm36nNMCoe5JJPZcwNcs18RGKlWHqwykUpbRjh
	sczahqtV+XtjuvOp8L9vC5Hekb1OnD/A11ulpYCekJ8eKCG0cnWLSD/KtJ1CmBflS7mzou4DI7whl
	LMAGniU4I+ti+Q4v+AETatA9cAa+U+rRFlDA0QBEgfolgfyZ0KSgz+PfmWozY4zhLDtouu9o7Wb4f
	H24bqoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo2B-0029to-36;
	Tue, 01 Aug 2023 11:59:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo1w-0029Zh-2f;
	Tue, 01 Aug 2023 11:59:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EFAAB660718F;
	Tue,  1 Aug 2023 12:59:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690891151;
	bh=206jZKMDUUUvALUeIajtTnxov5G04xrQ/ztlKez7bcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B5a0ffn+rzU/UghUYP4Y0t1LhRwtJPYH0jf6F5W8jRvG5y9/aQkJBS5xZyx7NLJD0
	 fsQEuh1Rzg1DnoMDJ83q1DNQPykpRjVBm3EXVgGFR9HdsBUXRlBV/1KRM53eTdsOUB
	 iYNnedFRHcR4TZVkjD3vSkt+NenffRe/Kk6Aiw5lSPs7OwP0UAELpmyA9x8U/r6Q1E
	 jV4/doB88QiIl98pZuJaz7Rga0Wb026My+EtP8LQkivf9QspWbcPsBgXEjC5GwRG7/
	 W9m0yZ3hQDK06uimHFp0UXcu9qYfTbRxQrBxtOyzrlYDlfrMwdATxg7xHHXpJG3rvX
	 JLBQBm2Qoc+yA==
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
Subject: [PATCH v8 12/13] drm/mediatek: mtk_disp_aal: Rewrite kerneldoc for struct mtk_disp_aal
Date: Tue,  1 Aug 2023 13:58:53 +0200
Message-ID: <20230801115854.150346-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
References: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_045913_005467_6AF67262 
X-CRM114-Status: UNSURE (   9.83  )
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
index e390ccfdee18..d93b97a84825 100644
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


