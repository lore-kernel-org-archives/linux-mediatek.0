Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC61CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=It9HTOlt1izVsfZ+zGvF3fQcoukFtqqe0RX4/HH6YpA=; b=E4uIymHQBsj1eAtb104zwHd6t7
	03e+aV6OjvyJSL9tW7Y0LNbv8uFiSuMBR+GsBvRlZ7XBAjsJTRbbbZK8h0YcBq/eAvbsJnDZ1cRLj
	ze0OKJ8/8JZQswTL7pqNuUtWHmFNGFcJa9PDN/GV6UxQ9wlZSJjHyjgIPlzzXcW1CAqG8zsxT9BNj
	X9rP3X/raTj/uYqVyxJSipa2CrSMs0paeTOL22iW6q0oiM6+QRiLrtRNz1a6E0KTpQMTfYi+VLiu7
	l5q6tQVtnSxpL9WOk5ewnqa5ZYSOapd+JEcKO9yEAbhmuvnA5lO7mbn0BOcO52SaOz4RcovkDn5uW
	A7NImVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsSC-000TL5-2Q;
	Thu, 12 Oct 2023 09:58:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsRy-000T3n-2l;
	Thu, 12 Oct 2023 09:57:53 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E958B6607351;
	Thu, 12 Oct 2023 10:57:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104669;
	bh=s51bMlmGO1xHv5GaAY9hJMRyrYqHvYtjxvhr5nY4WEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UMzZkGKNx/Iusi03ckaJHrfpWbCP71+BrRJ5QZQY9niamh66UrO9JhI0zRcAGwNKi
	 NvJ6pexjpSYgCe5PGfja65/kjs0kEz/WSeGBjrHU4QEQXw9y8Bzo7kPl2+0s60upI3
	 HiiUSTxaMIFBVwemhn5359brPxiJxB4F4xdoxYgz0UpsDwH6ghSzIdXi5CRyzR9Jl4
	 GUk0TJHaqfCWWKZ0bNOdE+qq1jySMICiG9PXZWaaE0r+5xZqB9qFuuSlzH3JGnM7Bl
	 X+HomRwIfu1vGD5CyPN+2SVzlTAqY0Sn61si+vrFBivsQPHMByEaTdniPGxST6drZG
	 lCV4Cm8OjFp6A==
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
	ehristev@collabora.com,
	nfraprado@collabora.com,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v11 07/16] drm/mediatek: aal: Use bitfield macros
Date: Thu, 12 Oct 2023 11:57:27 +0200
Message-ID: <20231012095736.100784-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025751_049493_89433F29 
X-CRM114-Status: UNSURE (   9.69  )
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

Make the code more robust and improve readability by using bitfield
macros instead of open coding bit operations.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index dc26ddce0c6e..05f9be23fa47 100644
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
 
@@ -51,9 +53,13 @@ void mtk_aal_config(struct device *dev, unsigned int w,
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
2.42.0


