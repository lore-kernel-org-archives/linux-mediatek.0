Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94832C0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dDSYRXKFo9Q8DK6w8Xqr/McePTA17zRpRnPw6IcBodY=; b=U+hQJ1PxQ+FGaPub6IgZO0Ndg/
	WHAwWjsIAjNzdlwJ3eEJXDtMeffFr94yaA/Z6BYmYc5ZGPG695F5qh17d8ebE3b6gw04nirTJtDjv
	pvTTXsr9gONB4Wi4k6xfdrjLgYO4WnBLWTRm/VmzsZI/WPlj+KjDlwtYsxC6tZ1gBl87Cy6/pz8xb
	4xc/DbHAK7RunzdoABYrQ+H2bni3ltlEytLGESuC1oXWF4Ri2Zo3Z/xtBeHUfE+GFT+aVuVUUdKwr
	ffnhQf80amA2TbZEG4wQkLygLN0oAYMsHQ8M5UDgR5fE3YLBO+kqg6qQaMVN3ZOQvXbk6NsrU1iJm
	Fo1VFOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvbSS-00C76b-20;
	Wed, 25 Oct 2023 10:49:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvbSP-00C74n-0a;
	Wed, 25 Oct 2023 10:49:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ADE27660731F;
	Wed, 25 Oct 2023 11:49:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698230985;
	bh=9Tz11dV1gF0knOECb4CmRHRhrmCR7btgyLRsf9oipxs=;
	h=From:To:Cc:Subject:Date:From;
	b=XMHQ/lu2klLU+B4oEWjXysMybAukvNjzrEsnN9hr53/HTq1YluCERrAL2wjoeNi74
	 l+FI7+M9qp+Fk3wBaZYqgI0JdLG0ZKj5hDYGBSYITpDGD6z2ILDTH/ERfv8lh++DUd
	 evnPHO/MQhGpG2xJUOz/SKqre0ZipRzs5IXbbhPdx72nKGsfv5B9xDka9LjM7ZLEcm
	 WgB/7Hw44JxYkEhHvaulUumQl3tCmQqduHEbWjy8hgqSf84Flsj5warXCP31p63nq5
	 M7zPPqiCAgwQshKuzoJ0I8RbMWEtUsKFUrTBXSJamJnGftGE2U9eccewFQYKfmkOAH
	 14SkEm/DXGrAg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	nfraprado@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] drm: mediatek: mtk_disp_gamma: Fix breakage due to merge issue
Date: Wed, 25 Oct 2023 12:49:40 +0200
Message-ID: <20231025104940.140605-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_034949_392396_384E05F7 
X-CRM114-Status: GOOD (  11.76  )
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

While the commit that was sent to the mailing lists was fine, something
happened during merge and the mtk_gamma_set() function got broken as
a writel() was turned into a readl().

Fix that by changing that back to the expected writel().

Fixes: a6b39cd248f3 ("drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 2fada9d6c95f..52c752bc5f41 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -203,7 +203,7 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	/* Disable RELAY mode to pass the processed image */
 	cfg_val &= ~GAMMA_RELAY_MODE;
 
-	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
+	writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);
 }
 
 void mtk_gamma_config(struct device *dev, unsigned int w,
-- 
2.42.0


