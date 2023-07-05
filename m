Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CF6EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 09:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEjY0pJ03KTFVE3D2Oet2dG8L0f1BpiJtlSNubHAZYw=; b=S79rGNjmK3N6Yf/hBCEWD2MXx5
	8fvsgwllIckDPVxdKBcnsesderY8XKQQ4slzC4v/IC+My+CJYNTAHvk886fTubQc2tUbNrObu5ZQY
	Qu4sH6s4Biyt71w0kJm8mZgN33YLv4NMbBGrhJWbfj0ENOry/ztNz2XFcTI/CxFdtylaQnCO5FRhE
	vO9WD4vTvwvNWeY4zeHF9L3ahf8gigkGMuzdUhNieZgZAYahjy6SZzI4YfA1mVSmfKMRxReQYVsR7
	eqPRvncXK0rP1HrM8ROqago1JYGNV1rWlzXwUQvhaPm7HOiYkYPh0ce8rJ5ZjsYqDU3Fcryvqdi/g
	uieZXw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGz28-00FOCH-0k;
	Wed, 05 Jul 2023 09:42:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGz23-00FO9R-1h;
	Wed, 05 Jul 2023 09:42:45 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8EA8C6606FAF;
	Wed,  5 Jul 2023 10:42:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688550162;
	bh=ZA49h1P49IwOFaurPRFCaUbkBJXDbiP3QFwn/8w9YXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mV4KH6Tik3DJS6rQUo6x4eQBUvBlEjRnSNfVO1frmedsbfOBDMoo2yxZK0XyKrfdt
	 lYTtOyvhF3QKiYdLAHENTAEMBmU1tcWRJi+VWgda/IyKk1aDeRunniLePfLUpNz3op
	 alYtJ0kzCTgh0xRek8LIexewmkpnf8dWwhrc+x3WSchMIKG/P1gZMl5UuTua+0YxvV
	 YrezsM7OTDUARq6baWioqk9TM2w/tFLb2rM7bntHXP35Nkgh792soERTl2XlSYwlia
	 IKFRxUKrYcuTe66eXCsogXK3DP+90qICQ7Y6RRA4GmNDo3W7eQbJEAzPYLyaa2jMZ/
	 ELOF2YTBuf7xQ==
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
	Alexandre Mergnat <amergnat@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v2 3/3] drm/mediatek: Use devm variant for pm_runtime_enable() when possible
Date: Wed,  5 Jul 2023 11:42:32 +0200
Message-Id: <20230705094232.75904-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230705094232.75904-1-angelogioacchino.delregno@collabora.com>
References: <20230705094232.75904-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_024243_693638_473B1813 
X-CRM114-Status: GOOD (  11.51  )
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

Simplify the error path of return functions and drop the call to
pm_runtime_disable() in remove functions by switching to
devm_pm_runtime_enable() where possible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  9 ++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c        | 11 ++++-------
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         | 10 +++++-----
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 1993b688befa..14e8ad6c78c3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -519,13 +519,13 @@ static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
 
 	component_master_add_with_match(dev, &mtk_disp_ovl_adaptor_master_ops, match);
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = component_add(dev, &mtk_disp_ovl_adaptor_comp_ops);
-	if (ret) {
-		pm_runtime_disable(dev);
+	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add component\n");
-	}
 
 	return 0;
 }
@@ -533,7 +533,6 @@ static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
 static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &mtk_disp_ovl_adaptor_master_ops);
-	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index cfbc037a0f6d..0469076cf715 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -360,13 +360,13 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = component_add(dev, &mtk_disp_rdma_component_ops);
-	if (ret) {
-		pm_runtime_disable(dev);
+	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add component\n");
-	}
 
 	return 0;
 }
@@ -374,9 +374,6 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 static int mtk_disp_rdma_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_rdma_component_ops);
-
-	pm_runtime_disable(&pdev->dev);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index ae05d9660592..a5d811c37207 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -299,20 +299,20 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 #endif
 	platform_set_drvdata(pdev, priv);
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = component_add(dev, &mtk_mdp_rdma_component_ops);
-	if (ret) {
-		pm_runtime_disable(dev);
+	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add component\n");
-	}
+
 	return 0;
 }
 
 static int mtk_mdp_rdma_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_mdp_rdma_component_ops);
-	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
-- 
2.40.1


