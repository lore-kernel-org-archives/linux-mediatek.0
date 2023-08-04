Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A379C04FE1
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAvsrRnPMbPNsRQigklTtE1PGcnW0d4sIngzqLt9k1M=; b=GeLsdg5JK4N344lAZS18RP9Dsi
	GL6cClJev2TTDvQCjN0DvKvRRT0jTe2V1ZngO/4DD527BM+JTsruUoGx5U07tenzwsyfu1ZKVCHmB
	k3T478NTFoNtJXMtAqWm6sgpCVrK6ZjCDdSCbHOTB0C/YvhzNCoQuSgrmRsBUJ/oTz+h9RLHpVMqu
	HpWJwJeWNuZ9TsVcw1QbmZsGtluPTmAmsszkOqbXGZevZrsorbBwm0grVb16eqyugSEcfMVwS/NVb
	chAJmNbiiVif+Rybohy6LfRkKPKQhKAstI8iuBykrK/mqoRwnoFG4W7FJW/2ZYf5saWXjfWta/Nm+
	Lt2Wbkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpFO-00Bmdg-1o;
	Fri, 04 Aug 2023 07:29:18 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpFA-00BmO2-1e;
	Fri, 04 Aug 2023 07:29:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AAA4066071BB;
	Fri,  4 Aug 2023 08:29:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691134143;
	bh=sMSXWGMzRY15n7GP2+/uJ71airFfgmnnXjt646sPTj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iqZfSylJV4GtvmL7oED7wG4r4kBsy/pRa+iYrHa6/pEsBw0l0YB8eZiZDtn4gIj3x
	 S03ZZNNdyyEXbrnMoV0pNmF7YjJagOpp0lFu43fU9rZSk+caIX1aBnH/gjypHaRV/8
	 ygjQG7CW1W9laxBW3hEXCe7EhI3Gbe5a3lIypjcj330VSB1+uecL8s1jd4Z1LwWO5i
	 VDeTVW+uwwQQuJGdOgIXbQQiKASWf4SGSBF26Qz5o/LvyUgvB3GJx7VvsaV95SH+c4
	 Mrs1qVWrw5rwNKSRKXFqRnVoPOd+GRkQdaaByKgV+n1Rh1iFYX01sGr0nY5xy4LiIq
	 487nvC+X3Db8Q==
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
Subject: [PATCH v10 07/16] drm/mediatek: aal: Use bitfield macros
Date: Fri,  4 Aug 2023 09:28:41 +0200
Message-ID: <20230804072850.89365-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_002904_710191_1F211AD4 
X-CRM114-Status: GOOD (  10.01  )
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

Make the code more robust and improve readability by using bitfield
macros instead of open coding bit operations.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index e2e4155faf01..bec035780db0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -18,6 +18,8 @@
 #define DISP_AAL_EN				0x0000
 #define AAL_EN						BIT(0)
 #define DISP_AAL_SIZE				0x0030
+#define DISP_AAL_SIZE_HSIZE				GENMASK(28, 16)
+#define DISP_AAL_SIZE_VSIZE				GENMASK(12, 0)
 #define DISP_AAL_OUTPUT_SIZE			0x04d8
 #define DISP_AAL_LUT_SIZE			512
 
@@ -56,9 +58,13 @@ void mtk_aal_config(struct device *dev, unsigned int w,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+	u32 sz;
 
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_SIZE);
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_OUTPUT_SIZE);
+	sz = FIELD_PREP(DISP_AAL_SIZE_HSIZE, w);
+	sz |= FIELD_PREP(DISP_AAL_SIZE_VSIZE, h);
+
+	mtk_ddp_write(cmdq_pkt, sz, &aal->cmdq_reg, aal->regs, DISP_AAL_SIZE);
+	mtk_ddp_write(cmdq_pkt, sz, &aal->cmdq_reg, aal->regs, DISP_AAL_OUTPUT_SIZE);
 }
 
 /**
-- 
2.41.0


