Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A57CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tC1lj0m2VhvjV4gf68aGW3sa41PB5VL+AjcUK/nICj4=; b=hMdE7Z23sILppHBUY9zke30Zhk
	uZXgjtnEBCzQD7rpV23AJlGHrYHWds4Wqo+vIMa6ug0SGh4Yfy8BAPAElsUMjhFnuI4lj9ENLkaom
	4uXtI5kHljHnqsoEIX22P602dNUcboGeox9jZyfEjyX3LgJb2kXO6yPSC/ZTSsyLTFrDRskAvhgjF
	XBdFw/vzfz+yicFORDvhHmf5AGy228xhZ1UYgeqx0xOWxtlLrEQjnVHIAIbrL17wSWUIenfPYatt+
	6tsyMMBpKmHZQA+cBfV7rn/0pR3EHmxwKpTvECUxiwPGgKMt6vWrPc4hNo8NvMAppefdu+B8LlrYl
	R3790MUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsSp-000U6A-05;
	Thu, 12 Oct 2023 09:58:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsS6-000TCD-1y;
	Thu, 12 Oct 2023 09:58:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A76036607353;
	Thu, 12 Oct 2023 10:57:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697104677;
	bh=F86yWw2q9jRPtZJ/+Z1yLORSlOTQBx0C3WCmrGPVXMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LDRmH/+XLLQ8NVYfRr/Kni7gONMnyJ9bi/N3lXRnNeDQlmehZoP++yqJIQTXKy/Wo
	 CX7K+DXcbNviXcrRYIF1QktlhT/IbCXaX42ZCy4gTL/imQIPsEDDdeqldWMAD+Kg7M
	 g7pO3XQ0DxbxfKrmLSaDqYZBassxSP5ZKuuiDPxUJVQ0izlvC53rLqmp2/j6AnXeah
	 xyIfcMKbkgUKQqoJCB2Sfv9hZ6+Ocg0a51fDfO1FJXRxKcCyp8XqmmRc4MHHToRAMk
	 oeLt9m0A0sX+5jn8+2NKHwp5VMEFbQobvCkQHQGFTdNCggiTbjGjza/mP4YfcLWeh3
	 vbQ49hOTaQLFw==
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
Subject: [PATCH v11 15/16] drm/mediatek: gamma: Add kerneldoc for struct mtk_disp_gamma
Date: Thu, 12 Oct 2023 11:57:35 +0200
Message-ID: <20231012095736.100784-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_025758_817124_B366795A 
X-CRM114-Status: UNSURE (   9.26  )
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

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 0f116c0e51b5..52c752bc5f41 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -50,8 +50,12 @@ struct mtk_disp_gamma_data {
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
2.42.0


