Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F6AC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 14:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPL/NFW6a4XbVx65QKR0eZskSslmSBbVywRw1jCRzh4=; b=H3hW4pPUdhUzyA8ji8nxzz6xNT
	r/sTprmbaz24laLY41W+lhbczzUOjViaaaE27bMVPMoZBvch5y3eY7BHTh48sW50WxEtY9ikANf8z
	hN+eKEOE6jSXKEmdmQt3NCa6XeDCN/jdGNYKUJPGA9ejJwAR+P+05pBoixFdmQiLxbBdbRIahcrjf
	XJVR/1rqta4FDds3yemFv+ddvXSTholnh9zcMrV6KiyNfrGUys5FESXQw82BESDpk0h1crYxR8KHD
	jGoZe2qPgCaNslEdmmWf4TRHFt04OuIgmvABoaRrSW/xknuM0A8Ez2sdyKI20A/8IpV7FxJc4O+JL
	aELOCWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pht9p-00430S-3A;
	Thu, 30 Mar 2023 14:21:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pht8x-0042Hb-0f;
	Thu, 30 Mar 2023 14:20:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5DA05660318E;
	Thu, 30 Mar 2023 15:20:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680186046;
	bh=/+IRk8GyWs1c9yVT0iTCxo8DT1414PGgt9mTBDTdxe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QLBEtwjs1qWVOhMCWnpkoysjK4MG8i+7/i3SkOc7q7YkVyGAsieH7Z6KkH67kMdcu
	 FalAsEghikxy0Hl80qt3tLP8SNP+Erca+YxndYwhgTG7VPxUMFCzsW+Vljpwa6kFvD
	 9irU1kRogE8aACWBb/4mjholJmELhB0aVoKnOSpu8ibSVbf650lb6vybCnwrOHmXTN
	 uT6vq6M967cvkaSvUiuBmjJM/GofLGZDnlCnz8x0yMuwBYOFfHKnBf4QoTRlGQAruX
	 4/a1BgN8l5U05ieQrbWo9roJEdtiUVf/AIGdZgOhetV/MmskbKjHUPEg/l68X9zcP/
	 k8j281uu3nZAg==
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
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 7/8] drm/mediatek: dp: Use devm variant of drm_bridge_add()
Date: Thu, 30 Mar 2023 16:20:34 +0200
Message-Id: <20230330142035.191399-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330142035.191399-1-angelogioacchino.delregno@collabora.com>
References: <20230330142035.191399-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_072047_403809_7E6B16CB 
X-CRM114-Status: GOOD (  12.01  )
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

In preparation for adding support for aux-bus, which will add a code
path that may fail after the drm_bridge_add() call, change that to
devm_drm_bridge_add() to simplify failure paths later.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 6aaf162a6bfe..62d53c4b3feb 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2565,7 +2565,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
-	drm_bridge_add(&mtk_dp->bridge);
+	devm_drm_bridge_add(dev, &mtk_dp->bridge);
 
 	mtk_dp->need_debounce = true;
 	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
-- 
2.40.0


