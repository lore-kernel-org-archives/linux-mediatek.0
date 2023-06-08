Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570E9C7EE43
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sahAcymEAWqAnhBAr/X0vmwAwyPK+3VayAyx6MCEh78=; b=KkQTs+GJrHO+/RY1UwqbH1aKES
	ZrODaUHlo9pY7BZ35vo1cHxOk7pb0gWqVQPFY88clKtZNikmDEOhP6BlrnwEHcCoBmk3s+c/Sk/oF
	4AlNs5j417WXOY+sQBpzhPk2WWGnU+xw9sLkJAOxGHc2L9jq8Ucgz2A9hPK1biteXl2MO+MFLwZqA
	FAy/jQPJBA8lX4EYRJreRtoWUPMW81WADDHZT+3t8yN/ysXPz0g1+wQz3w2k+ALAdGACgjyx6asTo
	wboxMNZOeyZI0VnAGqWIkpa8KO5UVoj9N4tMvUGVdxoPSEtZqsbVp/bZpUb/0Rnc038bvGvP815A4
	c2wuyCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Ccv-008nm2-2Q;
	Thu, 08 Jun 2023 10:12:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Ccr-008niA-0o;
	Thu, 08 Jun 2023 10:12:18 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 71D4E6606F1A;
	Thu,  8 Jun 2023 11:12:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686219136;
	bh=GF4tnzCtxsr9pdT5eSOLmXcycHAMUaVktq69YdpqlWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E29PLG/Tj1opqJNtGeFTedq78BigBGJIcADohPpl9ZRpudFoszPwXsWSDTV5lM0Kv
	 j+QQFw5bR7W44IW9Y7cPpEc0XSDJJbbKeFInwunr4XtKULug914RAv4RtxLXcPhk2k
	 K1ES4eZ0h0Kayu3bsvMtfYXRQgt32Y7ZIUKBgWh13JHDbj7IdXISbRiv9tvm3YC6Dk
	 cxS2Sq56DztBFW2+7ZS0/pOc+M7Pz2y6zeuhBl4XB8RqSMiJI21IodfPoIgfRCex/N
	 r4oRj7T1yA3B28K1LlYka+mCw5HsGFSplBNWZM5ONI+kmv/HrlHgbLHqkHbumg+dbs
	 a4350tnuOQXDA==
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
	kernel@collabora.com
Subject: [PATCH 3/3] drm/mediatek: Use devm variant for pm_runtime_enable() when possible
Date: Thu,  8 Jun 2023 12:12:09 +0200
Message-Id: <20230608101209.126499-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608101209.126499-1-angelogioacchino.delregno@collabora.com>
References: <20230608101209.126499-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_031217_420087_4F006F82 
X-CRM114-Status: GOOD (  10.94  )
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
index 307be35b59fc..5e90b6d593f5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -361,13 +361,13 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 
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
@@ -375,9 +375,6 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 static int mtk_disp_rdma_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_rdma_component_ops);
-
-	pm_runtime_disable(&pdev->dev);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index ed519b5a3273..93ef05ec9720 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -300,20 +300,20 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
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


