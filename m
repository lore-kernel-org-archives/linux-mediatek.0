Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A70C001DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rsq7plQ/F0ndcc9bEjUHw97Zaa92iAqhmMCCUBU7WwA=; b=zC6h8VUDEx5pWT7R3zlhWNWf6/
	z8dbIU5P2/Dcw5uHZ7hf6PRsOBjoBUBf8y2ryoMbjbNWYvVVeHoNtaMNubaS7bxpdrZTp1P4b3McH
	mooegrumzE49DZnSNsY/9KUO1JtHY3CQT/aW2jhuhkab0SKCBX0lRz9RCDHXq3GDZhNQ+zmyDuSUq
	/FwNF+U4z/EekiioLKi9WUhPC3FXWI/IxuQg66atagnkXh2SIMqYgA1EJwUAr/JPxQN/miO+i06MC
	s/MgsNN45jnJhKA0vKjEzDcHIQkamr+ekIFmoUpWyYl/HigeCstoHKl/+ZeXkYZkJtSg0XfAv4H1F
	5JKQq27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpFk-00Bn4J-1y;
	Fri, 04 Aug 2023 07:29:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpFH-00BmUi-0u;
	Fri, 04 Aug 2023 07:29:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DA1866071D1;
	Fri,  4 Aug 2023 08:29:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691134150;
	bh=EES2yF/cg8QCjFjl2OGiEbmr3nkWYxd9TW0sjHleq8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DZ4suX32XpOL+CYUuFHlSVO0rS7HgQFHbA8J1dyuPAHng3BijJ2irAInj7XnFnMd4
	 2yXbBVcYAMnt62oTnufnGwLm0BxZQA4TySctu9gTK4JJJpTTrdGIBPVFBSbXGf2vd0
	 NyvOOzA63Ta2n0pz1bRi7KVvVkTkuzG0dppVu5jjYFFLkrQiXJRdb9YdIkKLYGOKqW
	 0sM4zqbZc/kEQBarHw9hfAVW6QvgeNpE8w4CXlJONAnihctdOMmYCTWm1vf+m7YGEl
	 8lK92k6tZlYxKVDDWWN60vohzYuhPcmD/rfJ6NyUo9R+4bahWEVMZT4dp3kbZodPsZ
	 ZW2v2KPU3Vv/A==
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
Subject: [PATCH v10 15/16] drm/mediatek: gamma: Add kerneldoc for struct mtk_disp_gamma
Date: Fri,  4 Aug 2023 09:28:49 +0200
Message-ID: <20230804072850.89365-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_002911_446303_2B2B384B 
X-CRM114-Status: UNSURE (   9.68  )
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

The mtk_disp_gamma structure was completely undocumented: add some
kerneldoc documentation to it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index d9a70238d524..867445a2af9e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -54,8 +54,12 @@ struct mtk_disp_gamma_data {
 	u8 lut_bits;
 };
 
-/*
- * struct mtk_disp_gamma - DISP_GAMMA driver structure
+/**
+ * struct mtk_disp_gamma - Display Gamma driver structure
+ * @clk:      clock for DISP_GAMMA block
+ * @regs:     MMIO registers base
+ * @cmdq_reg: CMDQ Client register
+ * @data:     platform data for DISP_GAMMA
  */
 struct mtk_disp_gamma {
 	struct clk *clk;
-- 
2.41.0


