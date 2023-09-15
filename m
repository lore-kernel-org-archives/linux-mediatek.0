Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C077CEE6431
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r2l7ZtAanKEwy1j8vHLn3lrgD262RUx6+uGderDuawQ=; b=dreZ6lcflcZldx4mTiqiv9gBUL
	6AOR9ZaHCOHTpGyhQHJNLOWnCyblaIa8MxUb2jlnuRXuXBwsHck4T9HUhy59ZSnHGiWezikNmQVFh
	H8nDO0l/YEPXtE4pjvX6jsTaFR2j9ap5w3OHBicgkgXiMmniCirGULEmFGv7LMdCymoPrIc1O9tp5
	ifdeKjncUrn+ER+vXeVHkF2A6G5jU5r7ERnfmLug0RNu1Ux0QgzX1sLFRMDUyi2/iP9rW/rOQM76C
	LhtRYOjqohhBGtuFfSLYE6gR0XB9St8r+YyZu+6YXYMWYvgaD42wax00mZ40o0PrTxatR9RCFSEfh
	8KL6ugrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3iR-00A5jC-2l;
	Fri, 15 Sep 2023 07:58:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3iO-00A5iO-2o;
	Fri, 15 Sep 2023 07:58:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E8E4161F11;
	Fri, 15 Sep 2023 07:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4B6C433C9;
	Fri, 15 Sep 2023 07:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694764691;
	bh=t+ZshDk3vSry1uc6hCwYDbU+R1dULuj35xmF6dRVMrk=;
	h=From:To:Cc:Subject:Date:From;
	b=rvwj7lj8FTEWHvf1wUbhIc8CK5XVM4UyBTKgXnVGlvnMvDvIiuwrT/7wJJHf8L0/j
	 DQLpHPOpajgELw/genwY5AfrHU5D1bHCuW6T49J9ge+LlUSOPyhj7o9KzuqPyblGT4
	 iBeGAJoKwE5SH581mv/T5N5N1tit9oDbbA4VThjaayi07QnsmCLKIFl/rIQvc0lfUQ
	 JEb+NxHkp8yCmzPRNnSUk11iIZijw9jWj90cvNjn2WzJPll/L01f1DCDP7JJVJit+l
	 03onA6v36HsZ/+RKmw/UU+AOoCqlTnxeWDIm7kfiuGeBOIxMSvceyppdQTViv7Yp1p
	 P5P33W5K4xkuA==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] drm/mediatek: dsi: Fix EOTp generation
Date: Fri, 15 Sep 2023 09:57:56 +0200
Message-Id: <20230915075756.263591-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_005812_974022_D5A41A2C 
X-CRM114-Status: GOOD (  11.27  )
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

The commit c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register
definition") inverted the logic of the control bit. Maybe it was because
of the bad naming which was fixed in commit 0f3b68b66a6d ("drm/dsi: Add
_NO_ to MIPI_DSI_* flags disabling features"). In any case, the logic
wrong and there will be no EOTp on the DSI link by default. Fix it.

Fixes: c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register definition")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d67e5c61a9b9..8024b20f6b13 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
 		tmp_reg |= HSTX_CKLP_EN;
 
-	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
+	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		tmp_reg |= DIS_EOT;
 
 	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
-- 
2.39.2


