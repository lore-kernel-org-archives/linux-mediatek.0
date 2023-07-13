Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6AFC001DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 09:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xngg6KOdH+mJqyTh78gW3/stRowD27rF0nxkYPzHZSU=; b=Kztr7cdObT0RLL5coE9wIYfPMf
	jJ3LjvQq1z0r74CMskG8jjk6XeuCpZ3VPvFhPmQO77SxdN3E/LqQdm9TtuO7R+X1hDcLcJCw3RyNB
	E5z4Er4wC1PGjbEGRRl9ZTKN6uYsfalyZ0rj9YhAgnz1oNG5DL4Sx8vRCI5pETZwizBL/OTIX22v6
	Gm1LnUs+rTO7ZKQMVRCGhwM1sUf1MzM/3STdUIaIdzEQNx+1uoDqFuu9uZYkA49sl8H84eIXMaSr0
	vcnn1gzmaWJJA0gORHW09jeSa8+zNqwudnfZao2b0o740mlzu30X2EKeCJm8tcyvNd7K6mLaBG67d
	r3joI/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsDJ-002XEe-1I;
	Thu, 13 Jul 2023 09:02:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsD5-002Wze-36;
	Thu, 13 Jul 2023 09:02:05 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E3906607047;
	Thu, 13 Jul 2023 10:02:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689238920;
	bh=JJ658NiqTXMfajFspcT2w8DC5aIhUnLMakTk+xq23mc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W2NYMIp0FZNE0yX1Lh4o2JHL1sCIuZbttllI0FsZ82yAcOTLqHB3/MRngNHnWv0v+
	 ngud7hVzCc2Tw7dLQbEAKdfhyxxUAwshsrjyoGBoKBUKcIj7/Z3hq72T2qVWmhXapv
	 ETjqFr/gEajGwRcmoJ7Tv5GRzlVEuTsFupWJVZR8VF7kwHILfPCLNcKOuONMYALiNk
	 +tRXHZlacqEFRU5RogEbMo51XQ4yAuRuAKxqV6WqkraqLXCy4zh3swku2QpMpz1nja
	 Y451J7wLnFgpj3VDTha+y9Sc3QFS7KGXmMEgnrE+9Dgx/f/D//idt8VNtbcTeJE3zs
	 oAycRteiSKr8A==
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
	wenst@chromium.org,
	nfraprado@collabora.com
Subject: [PATCH v5 03/10] drm/mediatek: dp: Use devm variant of drm_bridge_add()
Date: Thu, 13 Jul 2023 11:01:45 +0200
Message-Id: <20230713090152.140060-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
References: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_020204_136377_1DA19F1E 
X-CRM114-Status: GOOD (  11.48  )
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
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index a6a05ea6a53c..9dea78529697 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2547,7 +2547,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
-	drm_bridge_add(&mtk_dp->bridge);
+	devm_drm_bridge_add(dev, &mtk_dp->bridge);
 
 	mtk_dp->need_debounce = true;
 	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
-- 
2.40.1


